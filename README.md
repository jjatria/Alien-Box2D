# NAME

Alien::Box2D - Find or build the Box2D library

# SYNOPSIS

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
_Any::Box2D::Module_.

# DESCRIPTION

Installing Alien::Box2D will look for an available Box2D library in your system,
or build one from source if one cannot be found. If installing one from source,
development files (including headers and static libraries) will be stored in
the _share_ directory of the distribution.

Alien::Box2D inherits its methods from [Alien::Base](https://metacpan.org/pod/Alien::Base), so the interface for both
should be the same.

# BUGS

Please post issues and bugs at [http://rt.cpan.org/NoAuth/Bugs.html?Dist=Alien-Box2D](http://rt.cpan.org/NoAuth/Bugs.html?Dist=Alien-Box2D)

# AUTHOR

FROGGS, &lt;froggs at cpan.org>

KMX, &lt;kmx at cpan.org>

# COPYRIGHT

Please note that the source code of the Box2D library is licensed under
different terms from those of this distribution.

## Alien::Box2D perl module

This program is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.

The full text of the license can be found in the LICENSE file included with
this distribution.

## Box2D library

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
