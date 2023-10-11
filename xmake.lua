set_version("2.5.0")

set_xmakever("2.8.3")

add_rules("mode.release", "mode.debug")
set_languages("c++14")

-- msvc flags
-- fix encoding error
add_cflags("cl::/utf-8")
add_cxxflags("cl::/utf-8")
-- disabled C4819 encoding warning
add_cxxflags("cl::/wd4819")

target("Hypodermic")
    set_kind("headeronly")
    add_headerfiles("Hypodermic/*.h", "Hypodermic/**.hpp")
    add_includedirs(".", {public=true})

target("ExampleTest")
    set_kind("binary")
    add_files("Examples/*.cpp")
    add_deps("Hypodermic")
    