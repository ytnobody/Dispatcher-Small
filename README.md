# NAME

Dispatcher::Small - Small dispatcher with Regular-Expression

# SYNOPSIS

    use Dispatcher::Small;
    my $ds = Dispatcher::Small->new(
        qr'^/user/(?<id>.+)' => { action => \&user },
        qr'^/'               => { action => \&root },
    );
    my $res = $ds->match('/user/oreore'); ### $res = { action => sub {...}, id => 'oreore' }

# DESCRIPTION

"Dispatcher::Small" is a dispatcher class that is written in perl, and is maybe smallest one of them in the world... maybe.

# REQUIREMENT

Dispatcher::Small requires perl-5.10 or later.

# METHODS

## new

    my %dispatch_rule = (
        qr'^/user/(?<id>.+)' => \&user,
        qr'^/'               => \&root,
    );
    my $object = Dispatcher::Small->new( %dispatch_rule );

Constructor method.

## match

    my $res = $object->match('/user/oreore');

Returns matching result as hashref.

# LICENSE

Copyright (C) ytnobody.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

ytnobody <ytnobody@gmail.com>
