# This file is part of Peacemaker.
# 
# Peacemaker is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# Peacemaker is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Peacemaker.  If not, see <http://www.gnu.org/licenses/>

project(
  'peacemaker',
  'fortran',
  version: files('version.txt'),
  license: 'GPL-3.0-or-later',
  meson_version: '>=0.57.2',
  default_options: [
    'buildtype=debugoptimized',
  ],
)

fc_id = meson.get_compiler('fortran').get_id()
if fc_id == 'gcc'
  add_project_arguments(
    get_option('buildtype') == 'debug' ?
      ['-fcheck=all', '-fbacktrace', '-ffpe-trav=zero,overflow,underflow,denormal'] :
      ['-mtune=haswell', '-flto'],
    language: 'fortran',
  )
elif fc_id == 'intel'
  add_project_arguments(
    get_option('buildtype') == 'debug' ?
      ['-check', 'all', '-traceback', '-ftrapuv'] :
      ['-axAVX2', '-mtune=core-avx2', '-ipo'],
    language: 'fortran',
  )
endif

executable(
  meson.project_name(),
  sources: files(
    'app/atomic_data.f90',
    'app/auxiliary.f90',
    'app/cluster.f90',
    'app/config.f90',
    'app/constants.f90',
    'app/error.f90',
    'app/info.f90',
    'app/input.f90',
    'app/kinds.f90',
    'app/lengths.f90',
    'app/main.f90',
    'app/partition_functions.f90',
    'app/polynomial.f90',
    'app/qce.f90',
    'app/shared_data.f90',
    'app/thermo.f90',
  ),
  dependencies: [
    dependency(
      'iso_varying_string',
      fallback: ['iso_varying_string', 'iso_varying_string_dep'],
      default_options: ['default_library=static'],
      static: true,
    ),
    get_option('openmp') ? dependency('openmp') :,
  ],
  install: true,
)
