package Alien::Box2D;
# ABSTRACT: Build and make available Box2D library

our $VERSION = '0.105';

use strict;
use warnings;
use base 'Alien::Base';

1;

__END__

=head1 SYNOPSIS

    # Sample Build.pl
    use Module::Build;
    use Alien::Box2D;

    my $build = Module::Build->new(
      module_name => 'Any::Box2D::Module',
      # + other params
      build_requires => {
        'Alien::Box2D' => 0,
        # + others modules
      },
      configure_requires => {
        'Alien::Box2D' => 0,
        # + others modules
      },
      extra_compiler_flags => Alien::Box2D->cflags,
      extra_linker_flags   => Alien::Box2D->libs,
    )->create_build_script;

Please note that Alien::Box2D is required only for building, not for using
I<Any::Box2D::Module>.

=head1 DESCRIPTION

Installing Alien::Box2D will look for an available Box2D library in your system,
or build one from source if one cannot be found. If installing one from source,
development files (including headers and static libraries) will be stored in
the I<share> directory of the distribution.

Alien::Box2D inherits its methods from L<Alien::Base>, so the interface for both
should be the same.

=head1 BUGS

Please post issues and bugs at L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Alien-Box2D>

=head1 AUTHOR

FROGGS, E<lt>froggs at cpan.orgE<gt>

KMX, E<lt>kmx at cpan.orgE<gt>

=head1 COPYRIGHT

Please note that the source code of the Box2D library is licensed under
different terms from those of this distribution.

=head2 Alien::Box2D perl module

This program is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

The full text of the license can be found in the LICENSE file included with
this distribution.

=head2 Box2D library

Copyright (c) 2006-2017 Erin Catto http://www.box2d.org

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.

=cut
