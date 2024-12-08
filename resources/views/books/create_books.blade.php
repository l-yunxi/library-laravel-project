@extends('layouts.auth')

@section('title')
    <div class="col-12">
        <span class="h4 align-bottom">Crea nuovo libro</span>
    </div>
@endsection

@section('content')

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
    </div>
    @endif

    <form action="{{ route('books.store') }}" method="POST">
        @csrf

        <div class="row g-2">

            <div class="col-12">
                <label for="isbn" class="form-label">ISBN</label>
                <input type="text" id="isbn" name="isbn" class="form-control @error('isbn') is-invalid @enderror">
                @error('isbn')
                <span class="invalid-feedback" role="alert">
                    <strong> {{ $message }} </strong>
                @enderror
</div>

            <div class="col-12">
                <label for="title" class="form-label">Title</label>
                <input type="text" class="form-control" id="title" name="title">
            </div>

            <div class="col-12">
                <label for="author" class="form-label">Author</label>
                <select class="form-control form-select" id="author" name="author">
                    <option disabled selected>-- Select an Author --</option>
                    @foreach ($authors as $author)
                        <option value="{{ $author->id }}">{{ $author->name . ' ' . $author->surname }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-12">
                <label for="category" class="form-label">Category</label>
                <select class="form-control form-select" id="category" name="category">
                    <option disabled selected>-- Select a category --</option>
                    @foreach ($categories as $category)
                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-12">
                <label for="publisher" class="form-label">Publisher</label>
                <select class="form-control form-select" id="publisher" name="publisher">
                    <option disabled selected>-- Select a publisher --</option>
                    @foreach ($publishers as $publisher)
                        <option value="{{ $publisher->id }}">{{ $publisher->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="col-12">
                <label for="publish_year" class="form-label">Publish Year</label>
                <input type="text" class="form-control" id="publish_year" name="publish_year">
            </div>

            <div class="col-12">
                <label for="number_pages" class="form-label">Number of Pages</label>
                <input type="number" class="form-control" id="number_pages" name="number_pages">
            </div>

            <div class="col-12">
                <label for="language" class="form-label">Language</label>
                <input type="text" class="form-control" id="language" name="language">
            </div>


        </div>

        <div class="row mt-2">
            <div class="col-12 text-center">

                <button type="submit" class="btn btn-success">Salva</button>

            </div>
        </div>
    </form>

    
@endsection
