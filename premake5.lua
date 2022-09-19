project "Volk"
    kind "StaticLib"
    language "C"
    staticruntime "off"
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir    ("int/" .. outputdir .. "/%{prj.name}")

    files {
        "include/Volk/volk.h",
        "src/volk.c"
    }

    includedirs {
        "include",
        "%{IncludeDir.Vulkan}"
    }

    links {
        "%{LibraryDir.Vulkan}"
    }
    
    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "Speed"