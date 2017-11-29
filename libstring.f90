module libstring
  type string
    character(:),allocatable::content
  contains
    procedure :: at,substr,write_formatted
    generic :: write(formatted) => write_formatted
  end type
  interface assignment(=)
    module procedure assignment_char
  end interface
contains
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
end
