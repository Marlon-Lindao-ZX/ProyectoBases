TARGET = sip.pyd
OFILES = siplib.obj apiversions.obj descriptors.obj qtlib.obj threads.obj objmap.obj voidptr.obj array.obj int_convertors.obj bool.obj
HFILES = sip.h sipint.h array.h 

CC = cl
CXX = cl
LINK = link
CPPFLAGS = -DNDEBUG -DUNICODE -DWIN32 -I. -I"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\include"
CFLAGS = -nologo -Zm200 -Zc:wchar_t- -FS -Zc:strictStrings -O2 -MD -W3 -w44456 -w44457 -w44458
CXXFLAGS = -nologo -Zm200 -Zc:wchar_t- -FS -Zc:strictStrings -D_HAS_EXCEPTIONS=0 -O2 -MD -W3 -w34100 -w34189 -w44996 -w44456 -w44457 -w44458 -wd4577
LFLAGS = /NOLOGO /DYNAMICBASE /NXCOMPAT /DLL /MANIFEST /MANIFESTFILE:$(TARGET).manifest /SUBSYSTEM:CONSOLE /INCREMENTAL:NO
LIBS = /LIBPATH:"C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\libs" python37.lib
.SUFFIXES: .c .cpp .cc .cxx .C


{.}.cpp{}.obj::
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -Fo @<<
	$<
<<

{.}.cc{}.obj::
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -Fo @<<
	$<
<<

{.}.cxx{}.obj::
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -Fo @<<
	$<
<<

{.}.C{}.obj::
	$(CXX) -c $(CXXFLAGS) $(CPPFLAGS) -Fo @<<
	$<
<<

{.}.c{}.obj::
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -Fo @<<
	$<
<<

all: $(TARGET)

$(OFILES): $(HFILES)

$(TARGET): $(OFILES)
	$(LINK) $(LFLAGS) /OUT:$(TARGET) @<<
	  $(OFILES) $(LIBS)
<<
	mt -nologo -manifest $(TARGET).manifest -outputresource:$(TARGET);2

install: $(TARGET)
	@if not exist "C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\Lib\site-packages" mkdir "C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\Lib\site-packages"
	copy /y $(TARGET) "C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\Lib\site-packages\$(TARGET)"
	@if not exist "C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\Lib\site-packages" mkdir "C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\Lib\site-packages"
	copy /y "C:\Users\CORE I7\Documents\Proyecto Bases\codigo-1\sip-4.19.18\sip-4.19.18\sip.pyi" "C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\Lib\site-packages\sip.pyi"

clean:
	-del $(TARGET)
	-del siplib.obj
	-del apiversions.obj
	-del descriptors.obj
	-del qtlib.obj
	-del threads.obj
	-del objmap.obj
	-del voidptr.obj
	-del array.obj
	-del int_convertors.obj
	-del bool.obj
	-del $(TARGET).manifest
