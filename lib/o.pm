package o;

# ABSTRACT: syntactic sugar to make Mo one-liners easier

use strict;
use warnings;

BEGIN {
    my $package;
    sub import {
        $package = $_[1] || 'Class';
    }
    use Filter::Simple sub { s/^/package $package;\nuse Mo;\n/; }
}

1;

=head1 SYNOPSIS

  # create a Mo class on the fly ...
  perl -Mo=Foo -e 'has bar => ( default => sub { q[baz] } ); print Foo->new->bar' # prints baz

=head1 DESCRIPTION

o.pm is a simple source filter that adds
C<package $name; use Mo;>
to the beginning of your script and was entirely created because typing
C<perl -e'package Foo; use Mo; ...'> is annoying.

=head1 INTERFACE

o provides exactly one method and it's automatically called by perl:

=over 4

=item B<import($package)>

Pass a package name to import to be used by the source filter. The
package defaults to C<Class> if none is given.

=back

=head1 DEPENDENCIES

You will need L<Filter::Simple> and eventually L<Mo>

=head1 INCOMPATIBILITIES

None reported. But it is a source filter and might have issues there.

=head1 BUGS

See L<Mo/BUGS> for details on reporting bugs.
