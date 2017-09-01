package Image::Randim::Source::Unsplash;
use v5.20;
use warnings;
use JSON;
use Moose;

has 'name' => ( is  => 'ro',
		isa => 'Str',
		default => 'Unsplash',
    );
has 'api_key' => ( is  => 'rw',
		   isa => 'Str',
		   default => '03ad5bfbaa0acd6c96a728d425e533683ec25e5fb7fcf99f6461720b3d0d75a1',
    );

with 'Image::Randim::Source::Role';

sub url {
    my $self = shift;
    return 'https://api.unsplash.com/photos/random?client_id='.$self->api_key;
}

sub get_image {
    my $self = shift;
    my $data = JSON->new->decode($self->get_response);
    
    my $image = Image::Randim::Image->new(
	url    => $$data{'urls'}{'full'},
	id     => $$data{'id'},
	width  => $$data{'width'},
	height => $$data{'height'},
	link   => $$data{'links'}{'html'},
	);
    
    if (exists $$data{'user'}{'username'}) {
	$image->owner($$data{'user'}{'username'});
    }
    
    return $image;
}

__PACKAGE__->meta->make_immutable;
1;
