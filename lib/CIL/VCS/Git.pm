## ----------------------------------------------------------------------------
# cil is a Command line Issue List
# Copyright (C) 2008 Andrew Chilton
#
# This file is part of 'cil'.
#
# cil is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program.  If not, see <http://www.gnu.org/licenses/>.
#
## ----------------------------------------------------------------------------

package CIL::VCS::Git;

use strict;
use warnings;
use Carp;

use base qw(CIL::VCS::Factory);

sub post_add {
    my ($self, $issue) = @_;

    my $issue_dir = $issue->cil->IssueDir();
    my @files;
    push @files, "$issue_dir/i_" . $issue->name . '.cil';
    push @files, map { "$issue_dir/c_${_}.cil" } @{ $issue->CommentList };
    push @files, map { "$issue_dir/a_${_}.cil" } @{ $issue->AttachmentList };

    return [ "git add @files" ];
}

## ----------------------------------------------------------------------------
1;
## ----------------------------------------------------------------------------
