project(
  'iso_varying_string',
  'fortran',
  default_options: [
    'default_library=static',
  ],
)

iso_varying_string_dep = declare_dependency(
  link_with: library(
    meson.project_name(),
    sources: files('iso_varying_string.f90'),
    install: get_option('default_library') != 'static',
  )
)
