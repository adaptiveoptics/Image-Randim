package Image::Randim::Source::Desktoppr;
use v5.20;
use warnings;
use Moose;

has 'name' => ( is  => 'ro',
		isa => 'Str',
		default => 'Desktoppr',
    );
has 'url' => ( is  => 'ro',
	       isa => 'Str',
	       default => 'https://api.desktoppr.co/1/wallpapers/random',
    );

with 'Image::Randim::Source::Role';

__PACKAGE__->meta->make_immutable;
1;
