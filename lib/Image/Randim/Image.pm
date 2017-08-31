package Image::Randim::Image;
use v5.20;
use warnings;
use Moose;
use namespace::autoclean;

has 'id' => ( is  => 'rw',
	      isa => 'Str',
    );
has 'width' => ( is  => 'rw',
		 isa => 'Int',
    );
has 'height' => ( is  => 'rw',
		  isa => 'Int',
    );
has 'url' => ( is  => 'rw',
	       isa => 'Str',
    );
has 'filename' => ( is  => 'rw',
		    isa => 'Str',
    );
has 'owner' => ( is  => 'rw',
		 isa => 'Str',
    );
has 'link' => ( is  => 'rw',
		isa => 'Str',
    );

__PACKAGE__->meta->make_immutable;
1;
