package Image::Randim::Source::Desktoppr;
use v5.20;
use warnings;
use JSON;
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

sub get_image {
    my $self = shift;
    my $data = JSON->new->decode($self->get_response);
    $data = $$data{'response'};
    
    my $image = Image::Randim::Image->new(
	url    => $$data{'image'}{'url'},
	id     => $$data{'id'},
	width  => $$data{'width'},
	height => $$data{'height'},
	link   => $$data{'url'},
	);
    
    if (exists $$data{'uploader'}) {
	$image->owner($$data{'uploader'});
    }
    
    return $image;
}

__PACKAGE__->meta->make_immutable;
1;
