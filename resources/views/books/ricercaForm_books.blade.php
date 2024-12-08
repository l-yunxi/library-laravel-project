@extends('layouts.auth') <!-- Adjust this to your layout file -->


@section('content')
    <h1>Search Books</h1>

    <!-- Search Form -->
    <form action="{{ route('books.result') }}" method="GET" class="mb-4" id="searchForm">
        <div class="mb-3">
            <label for="title" class="form-label">Title</label>
            <input type="text" name="title" id="title" class="form-control" placeholder="Enter book title">
        </div>

        <div class="mb-3">
            <label for="isbn" class="form-label">ISBN</label>
            <input type="text" name="isbn" id="isbn" class="form-control" placeholder="Enter ISBN">
        </div>

        <div class="mb-3">
            <label for="author" class="form-label">Author</label>
            <input type="text" name="authors" id="author" class="form-control" placeholder="Enter author name">
        </div>

        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    @if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif
@endsection


@push('scripts')

<script>
 /*   document.getElementById('searchForm').addEventListener('submit', function(event) {
        const title = document.getElementById('title').value.trim();
        const isbn = document.getElementById('isbn').value.trim();
        const author = document.getElementById('author').value.trim();


        if (!title && !isbn && !author) {
            alert('Please fill at least one field.');
            event.preventDefault(); // Prevent form submission
        }
    });*/
</script>
@endpush
