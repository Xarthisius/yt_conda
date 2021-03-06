
Name:		hdf5
Version:	1.8.11
Release:	1%{?dist}
Summary:	A general purpose library and file format for storing scientific data

Vendor:		Continuum Analytics, Inc.
Packager:	build@continuum.io

Group:		System Environment/Libraries
License:	BSD
URL:		http://www.hdfgroup.org

Source0:	http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-%{version}.tar.bz2

BuildRoot:	%{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
#BuildRequires:	
#Requires: 


%description
HDF5 is a data model, library, and file format for storing and managing data. It supports an unlimited variety of datatypes, and is designed for flexible and efficient I/O and for high volume and complex data. HDF5 is portable and is extensible, allowing applications to evolve in their use of HDF5. The HDF5 Technology suite includes tools and applications for managing, manipulating, viewing, and analyzing data in the HDF5 format. 


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
