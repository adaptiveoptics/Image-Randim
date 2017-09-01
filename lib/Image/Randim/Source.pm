package Image::Randim::Source;
use v5.20;
use Moose;
use Module::Find;
use namespace::autoclean;

usesub Image::Randim::Source;

has 'src_obj' => ( is  => 'ro',
		   isa => 'Image::Randim::Source::Role',
    );
has 'timeout' => ( is  => 'rw',
		   isa => 'Int',
		   default => 20,
    );

sub list {
    my $self = shift;
    my @class = map { s/.+::(.+)$/$1/r } grep {!/::Role$/} findsubmod Image::Randim::Source;    
    return \@class;
}

sub set_provider {
    my ($self, $source_name) = @_;
    $self->{src_obj} = "Image::Randim::Source::$source_name"->new;
    $self->{src_obj}->timeout($self->timeout);
    return $self->src_obj;
}

sub set_random_provider {
    my $self = shift;
    my $source = $self->list;
    return $self->set_provider($$source[int(rand(scalar @$source))]);
}

sub url {
    my $self = shift;
    die 'No valid provider' unless $self->src_obj;
    return $self->src_obj->url;
}

sub name {
    my $self = shift;
    die 'No valid provider' unless $self->src_obj;
    return $self->src_obj->name;
}

sub get_image {
    my $self = shift;
    die 'No valid provider' unless $self->src_obj;
    return $self->src_obj->get_image;
}

__PACKAGE__->meta->make_immutable;
1;
