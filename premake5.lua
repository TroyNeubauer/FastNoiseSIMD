project "FastNoiseSIMD"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"
	systemversion "latest"
	intrinsics "on"
	vectorextensions "AVX2"
	
	targetdir ("../../../bin/" .. outputdir .. "/%{prj.name}")
	objdir ("../../../bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"FastNoiseSIMD/*.h",
		"FastNoiseSIMD/*.cpp",
	}

	removefiles
	{
		"FastNoiseSIMD/FastNoiseSIMD_internal.cpp"
	}

	includedirs
	{
		"FastNoiseSIMD/",
	}

	defines
	{
	
	}
	
	filter "configurations:Debug"
		defines "HZ_DEBUG"
		runtime "Debug"
		symbols "on"
		floatingpoint "Strict"

	filter "configurations:Release"
		defines "HZ_RELEASE"
		runtime "Release"
		runtime "Release"

		optimize "speed"
		inlining "auto"
		floatingpoint "Fast"

	filter "configurations:Dist"
		defines "HZ_DIST"
		runtime "Release"
		optimize "speed"
		inlining "auto"
		floatingpoint "Fast"
