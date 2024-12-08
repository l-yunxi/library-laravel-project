<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Book;
use App\Models\Author;
use App\Models\Category;
use App\Models\Publishers;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $books = Book::all();

        /*
        $books = Book::join('author_book','books.id','=','author_book.fk_book')
            ->join('authors','author_book.fk_author','=','authors.id')
            ->leftjoin('categories','books.fk_category','=','categories.id')
            ->select('books.*','authors.name as author_name','authors.surname as author_surname','categories.name as category')
            ->get();
        */



        return view('books.index_books')->with('books', $books);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $authors = Author::all();
        $categories = Category::all();
        $publishers = Publishers::all();
        return view('books.create_books')
            ->with('authors', $authors)
            ->with('categories', $categories)
            ->with('publishers', $publishers);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {   

        $rules = [
            'title' => 'required|string|max:255',
            'isbn' => 'required|unique:books|string|numeric',
            'author' => 'required|integer',
            'catetgory' => 'nullable|integer',
            'publisher' => 'nullable|integer',
            'publisher_years' => 'nullable|integer|min:1500|max:2025',
            'number_pages' =>'nullable|integer|min:1',
            'language' =>'nullable|string|max:50',
        ];

        $messages = [
            'required' => 'Campo obligatorio',
            'isbn' => 'Campo numerico'

        ];

        Validator::make($request->all(), $rules, $messages)->validate();



        $book = new Book([
            'isbn' => $request->input('isbn'),
            'title' => $request->input('title'),
            'publisher_years' => $request->input('publisher_years'),
            'number_pages' => $request->input('number_pages'),
            'language' => $request->input('language'),
            'fk_category' => $request->input('category'),
            'fk_publisher' => $request->input('publisher'),
        ]);

        $book->save();
        $book->authors()->sync([$request->input('author')]);
        return redirect()->route('books.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $book = Book::find($id);

        return view('books.show_books')->with('book', $book);
    }


    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $book = Book::find($id);

        $authors = Author::all();
        $categories = Category::all();
        $publishers = Publishers::all();

        return view('books.edit_books')
            ->with('authors', $authors)
            ->with('categories', $categories)
            ->with('publishers', $publishers)
            ->with('book', $book);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $book = Book::find($id);
        $book->update([
            'isbn' => $request->input('isbn'),
            'title' => $request->input('title'),
            'publisher_years' => $request->input('publisher_years'),
            'number_pages' => $request->input('number_pages'),
            'language' => $request->input('language'),
            'fk_category' => $request->input('category'),
            'fk_publisher' => $request->input('publisher'),
        ]);

        $book->authors()->sync([$request->input('author')]);

        return redirect()->route('books.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {   
        DB::beginTransaction();

        try{
            $book = Book::find($id);

            if ($book == null) {
                throw new \Exception("Book $id not found");
            }

            $book->delete();
            $book->authors()->detach();

            DB::commit();
        } catch(\Exception $e){
            DB::rollBack();
            $errorMessage = "<h1>Error</h1>";
            return response($errorMessage, 500)->header('Content-Type', 'text/html');
        }

        $book = Book::find($id);
        $book->delete();
        $book->authors()->detach();

        return redirect()->route('books.index');
    }

    public function search()
    {
        return view('books.ricercaForm_books');
    }

    public function result(Request $request)
    {
        $request->validate([
            'title' => 'nullable|string|max:255',
            'isbn' => 'nullable|string|max:255',
            'authors' => 'nullable|string|max:255',
        ]);

        if (!$request->filled('title') && !$request->filled('isbn') && !$request->filled('authors')) {
            return back()->withErrors('Please fill at least one field.');
        }


        $queryTitle = trim($request->input('title'));
        $queryISBN = trim($request->input('isbn'));
        $queryAuthor = trim($request->input('authors'));

        $query = Book::query();

        if ($queryTitle) {
            $query->where('title', 'like', "%{$queryTitle}%");
        }

        if ($queryISBN) {
            $query->where('isbn', '=', $queryISBN);
        }

        if ($queryAuthor) {
            // Split the full name into name and surname
            $nameParts = explode(' ', $queryAuthor, 2);

            if (count($nameParts) === 2) {
                $name = $nameParts[0];
                $surname = $nameParts[1];

                $query->whereHas('authors', function ($query) use ($name, $surname) {
                    $query->where('name', 'like', "%{$name}%")
                    ->where('surname', 'like', "%{$surname}%");
                });
            } else {
                // If only one part is provided, search in both name and surname
                $query->whereHas('authors', function ($query) use ($queryAuthor) {
                    $query->where('name', 'like', "%{$queryAuthor}%")
                    ->orWhere('surname', 'like', "%{$queryAuthor}%");
                });
            }
        }

        $books = $query->get();

         /* $books = Book::query()
            ->when($queryTitle, function ($query, $queryTitle) {
                return $query->where('title', 'like', "%{$queryTitle}%");
            })
            ->when($queryISBN, function ($query, $queryISBN) {
                return $query->where('isbn', '=', $queryISBN);
            })
            ->when($queryAuthor, function ($query, $queryAuthor) {
                // Split the full name into name and surname
                $nameParts = explode(' ', $queryAuthor, 2);
                if (count($nameParts) === 2) {
                    $name = $nameParts[0];
                    $surname = $nameParts[1];

                    return $query->whereHas('authors', function ($query) use ($name, $surname) {
                        $query->where('name', 'like', "%{$name}%")
                            ->where('surname', 'like', "%{$surname}%");
                    });
                } else {
                    // If only one part is provided, search in both name and surname
                    return $query->whereHas('authors', function ($query) use ($queryAuthor) {
                        $query->where('name', 'like', "%{$queryAuthor}%")
                        ->orWhere('surname', 'like', "%{$queryAuthor}%");
                    });
                }
            })
            ->get();*/

        if ($books->isEmpty()) {
            return view('books.result_books')->with('books', $books)->with('message', 'No books found for your search.');
        }

        return view('books.result_books')->with('books', $books);
    }
  
}
