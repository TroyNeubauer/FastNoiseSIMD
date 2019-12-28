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

	filter "system:windows or linux or macosx"
		vectorextensions "AVX2"

	filter "system:windows"
		defines
		{
			"FN_COMPILE_SSE2",
			"FN_COMPILE_SSE41",
			"FN_COMPILE_AVX2",
			"FN_COMPILE_AVX512",
			--"FN_COMPILE_NEON",
		}

	filter "system:macosx or linux"
		defines
		{
			"FN_COMPILE_SSE2",
			"FN_COMPILE_SSE41",
			"FN_COMPILE_AVX2",
		}

