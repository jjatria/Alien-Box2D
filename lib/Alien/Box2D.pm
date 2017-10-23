package Alien::Box2D;

our $VERSION = '0.105';

use strict;
use warnings;
use base 'Alien::Base';

1;

__END__

=head1 NAME

Alien::Box2D - Build and make available Box2D library - L<http://box2d.org/>

=head1 VERSION

Version 0.105

=head1 SYNOPSIS

You can use Alien::Box2D in your module that needs to link with I<Box2D>
library like this:

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
      extra_compiler_flags => Alien::Box2D->config('cflags'),
      extra_linker_flags   => Alien::Box2D->config('libs'),
    )->create_build_script;

NOTE: Alien::Box2D is required only for building not for using 'Any::Box2D::Module'.

=head1 DESCRIPTION

Alien::Box2D during its installation downloads Box2D library source codes,
builds I<Box2D> binaries from source codes and installs necessary dev files
(headers: *.h, static library: *.a) into I<share> directory of Alien::Box2D
distribution.

=head1 METHODS

=head2 config()

This function is the main public interface to this module:

    Alien::Box2D->config('prefix');
    Alien::Box2D->config('version');
    Alien::Box2D->config('libs');
    Alien::Box2D->config('cflags');

=head1 BUGS

Please post issues and bugs at L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Alien-Box2D>

=head1 AUTHOR

FROGGS, E<lt>froggs at cpan.orgE<gt>

KMX, E<lt>kmx at cpan.orgE<gt>

=head1 COPYRIGHT

Please notice that the source code of Box2D library has a different license than module itself.

=head2 Alien::Box2D perl module

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.

=head2 Source code of Box2D library

Copyright (c) 2006-2010 Erin Catto http://www.gphysics.com

This software is provided 'as-is', without any express or implied
warranty.  In no event will the authors be held liable for any damages
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
