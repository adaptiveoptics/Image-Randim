package Image::Randim::Source::Unsplash;
use v5.20;
use warnings;
use Moose;

has 'name' => ( is  => 'ro',
		isa => 'Str',
		default => 'Unsplash',
    );
has 'url' => ( is  => 'ro',
	       isa => 'Str',
	       default => 'https://api.unsplash.com/photos/random?client_id=03ad5bfbaa0acd6c96a728d425e533683ec25e5fb7fcf99f6461720b3d0d75a1',
    );

with 'Image::Randim::Source::Role';

__PACKAGE__->meta->make_immutable;
1;
