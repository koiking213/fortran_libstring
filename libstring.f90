module libstring
  type string
    character(:),allocatable::content
  contains
    procedure :: at,substr,write_formatted
    generic :: write(formatted) => write_formatted
 end type string
 interface string
    module procedure string_constructor
 end interface string
  interface assignment(=)
    module procedure assignment_char
  end interface
  interface operator(==)
    module procedure equal_string_string
    module procedure equal_string_character
    module procedure equal_character_string
  end interface
  interface operator(/=)
    module procedure not_equal_string_string
    module procedure not_equal_string_character
    module procedure not_equal_character_string
  end interface
  interface operator(*)
    module procedure mult_string_int
    module procedure mult_int_string
  end interface
contains
  type(string) function string_constructor(c) result(r)
    character(*) :: c
    r%content = c
  end function string_constructor
  function substr(this,begin,end)
    class(string) :: this
    character(:),allocatable :: substr
    integer,value :: begin, end
    optional :: begin, end
    if (.not.present(begin)) begin = 1
    ! at least gcc-7.2.0 supports allocatable assignment
    substr = this%content(begin:end)
  end function

  character function at(this,index)
    class(string) :: this
    integer,intent(in) :: index
    at = this%content(index:index)
  end function

  subroutine assignment_char(this,s)
    class(string),intent(out) :: this
    character(*),intent(in) :: s
    this%content = s
  end subroutine

  subroutine write_formatted(dtv, unit, iotype, v_list, iostat, iomsg)
    class(string), intent(in) :: dtv         ! Object to write.
    integer, intent(in) :: unit         ! Internal unit to write to.
    character(*), intent(in) :: iotype  ! LISTDIRECTED or DTxxx
    integer, intent(in) :: v_list(:)    ! parameters from fmt spec.
    integer, intent(out) :: iostat      ! non zero on error, etc.
    character(*), intent(inout) :: iomsg  ! define if iostat non zero.
    print *,dtv%content
  end subroutine

  function mult_string_int(a,b) result(mult)
    type(string),allocatable :: mult
    type(string),intent(in) :: a
    integer,intent(in) :: b
    allocate(mult)
    allocate(character(len(a%content)*b) :: mult%content)
    mult%content = a%content
    do i=2,b
      mult%content = a%content // mult%content
    end do
  end function
  function mult_int_string(b,a) result(mult)
    type(string),allocatable :: mult
    type(string),intent(in) :: a
    integer,intent(in) :: b
    allocate(mult)
    allocate(character(len(a%content)*b) :: mult%content)
    mult%content = a%content
    do i=2,b
      mult%content = a%content // mult%content
    end do
  end function

  function equal_string_character(a,b) result(r)
    logical :: r
    type(string),intent(in) :: a
    character(*),intent(in) :: b
    r = (a%content == b)
  end function
  function equal_string_string(a,b) result(r)
    logical :: r
    type(string),intent(in) :: a,b
    r = (a%content == b%content)
  end function
  function equal_character_string(a,b) result(r)
    logical :: r
    character(*),intent(in) :: a
    type(string),intent(in) :: b
    r = (a == b%content)
  end function
  function not_equal_string_character(a,b) result(r)
    logical :: r
    type(string),intent(in) :: a
    character(*),intent(in) :: b
    r = (a%content /= b)
  end function
  function not_equal_string_string(a,b) result(r)
    logical :: r
    type(string),intent(in) :: a,b
    r = (a%content /= b%content)
  end function
  function not_equal_character_string(a,b) result(r)
    logical :: r
    character(*),intent(in) :: a
    type(string),intent(in) :: b
    r = (a /= b%content)
  end function


end
