
@extends('layouts.auth')


@section('title')
    <div class="col mt-4">
        <span class="h1 align-bottom">Libri</span>
    </div>
    <div class="col-auto mt-4">
        <a href="{{ route('books.index') }}" class="btn btn-sm btn-primary my-auto">Back</a>
    </div>
@endsection

@section('content')
    @if ($books->isNotEmpty())
        <table class="table table-bordered table-responsive">
            <thead>
                <tr>
                    <th scope="col">Titolo</th>
                    <th scope="col">ISBN</th>
                    <th scope="col">Autore</th>
                    <th scope="col" class="w-min"></th>
                </tr>
            </thead>
            <tbody>
                @foreach ($books as $book)
                    <tr>
                        <td>{{ $book->title }}</td>
                        <td>{{ $book->isbn }}</td>
                        <td>
                            @isset($book->authors->first()->name)
                                {{ $book->authors->first()->name . ' ' . $book->authors->first()->surname }}
                            @endisset
                        </td>

                        <td class="text-center">
                            <a href=" {{ route('books.show', $book->id) }}" class="btn btn-sm btn-secondary mx-1">APRI</a>
                            <a href="{{ route('books.edit', $book->id) }}" class="btn btn-sm btn-secondary mx-1">MODIFICA</a>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        @else 
            <p class="h1 mt-3">No books available.</p>
    @endif
@endsection
