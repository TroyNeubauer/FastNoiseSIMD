project "FastNoiseSIMD"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	systemversion "latest"
	intrinsics "on"
	
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

	filter "toolset:clang or toolset:gcc"
		print "Fast noise SIMD: Using -mavx2"
		buildoptions { "-mavx2" }
	
