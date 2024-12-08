@extends('layouts.auth')

@section('content')
    <div class="col">
        <a href="{{ route('books.index') }}" class="btn btn-sm btn-danger">Back</a>
        </br></br>
        <span class="h4 align-bottom">Copies {{ $title ? 'for: ' . $title : '' }}</span>

    </div></br>

    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Inventory</th>
                <th>Status</th>
                <th>Condition</th>
                <th>Position</th>
                <th>Buy Date</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($copies as $copy)
                <tr>
                    <td>{{ $copy->inventory }}</td>
                    <td>{{ $copy->status == 1 ? 'Disponibile' : 'Non Disponibile' }}</td>
                    <td>
                        @switch($copy->condition)
                            @case(1)
                                Ottimo
                            @break

                            @case(2)
                                Danneggiata
                            @break

                            @case(3)
                                Smarrito
                            @break

                            @default
                                Unknown
                        @endswitch
                    </td>
                    <td>{{ $copy->position }}</td>
                    <td>{{ $copy->buy_date }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection
