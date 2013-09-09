use strict;
use warnings;
use Test::More;
use Dispatcher::Small;

my $r = Dispatcher::Small->new(
    qr'^/geo/([0-9]+)/([0-9]+)' => { action => 'Geo::index'    },
    qr'^/user/([0-9a-zA-Z_]+)'  => { action => 'User::index'   },
    qr'^/item/(?<id>[0-9]+)'    => { action => 'Item::index'   },
    qr'^/([0-9]+)'              => { action => 'Number::index' },
    qr'^/'                      => { action => 'Root::index'   },
);

isa_ok $r, 'Dispatcher::Small';
is_deeply $r->match('/'), +{ action => 'Root::index', capture => [ 1 ] };
is_deeply $r->match('/12345'), +{ action => 'Number::index', capture => [ 12345 ] };
is_deeply $r->match('/user/ytnobody1234'), +{ action => 'User::index', capture => [ 'ytnobody1234' ] };
is_deeply $r->match('/geo/100/200'), +{ action => 'Geo::index', capture => [ 100, 200 ] };
is_deeply $r->match('/fjkafjgsdk'), +{ action => 'Root::index', capture => [ 1 ] };
is_deeply $r->match('geo/100/200'), undef;
is_deeply $r->match('/item/123'), +{ action => 'Item::index', id => 123 };

done_testing;
