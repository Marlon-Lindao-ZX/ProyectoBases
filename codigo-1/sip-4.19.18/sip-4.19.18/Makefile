
all:
	cd sipgen
	$(MAKE)
	@cd ..
	cd siplib
	$(MAKE)
	@cd ..

install:
	cd sipgen
	$(MAKE) install
	@cd ..
	cd siplib
	$(MAKE) install
	@cd ..
	@if not exist "C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\Lib\site-packages" mkdir "C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\Lib\site-packages"
	copy /y sipconfig.py "C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\Lib\site-packages\sipconfig.py"
	copy /y "C:\Users\CORE I7\Documents\Proyecto Bases\codigo-1\sip-4.19.18\sip-4.19.18\sipdistutils.py" "C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\Lib\site-packages\sipdistutils.py"
	C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\python.exe C:\Users\CORE I7\Documents\Proyecto Bases\codigo-1\sip-4.19.18\sip-4.19.18\mk_distinfo.py "$(DESTDIR)" C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\Lib\site-packages\sip-4.19.18.dist-info installed.txt

clean:
	cd sipgen
	$(MAKE) clean
	@cd ..
	cd siplib
	$(MAKE) clean
	@cd ..
