package Image::Randim::Source::Role;
use v5.20;
use warnings;
use Moose::Role;
use REST::Client;
use Image::Randim::Image;
use namespace::autoclean;

requires 'url', 'name', 'get_image';

has 'timeout' => ( is  => 'rw',
		   isa => 'Int',
		   default => 20,
    );

sub get_response {
    my $self = shift;
    my $client = REST::Client->new;
    $client->setTimeout($self->timeout);
    $client->GET($self->url);
    my $rc = $client->responseCode;
    if ($rc > 200) {
	die 'Source '.$self->name
	    . " received a response code of $rc from "
	    . $self->url . "\n";
    }
    return $client->responseContent;
}

1;
