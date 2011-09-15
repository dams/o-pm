use Test::More;

plan tests => 1;

is(`$^X -Mo=Foo -e 'has bar => ( default => sub { q[baz] } ); print Foo->new->bar'`,
   'baz');

