
Name:		libpng
Version:	1.6.5
Release:	1%{?dist}
Summary:        Portable Network Graphics library	

Vendor:		yt
Packager:	xarthisius.kk@gmail.com

Group:		System Environment/Libraries
License:	libpng
URL:		http://www.libpng.org

Source0:	http://download.sourceforge.net/libpng/libpng-%{version}.tar.gz

BuildRoot:	%{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
#BuildRequires:	
#Requires: 


%description
Portable Network Graphics library

%prep
%setup -q


%build
%configure
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT


%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root,-)
/usr
%doc


%changelog
