unit BaseClass;

interface
uses
  Classes, Generics.Defaults, Generics.Collections;

type
  TResult = (rOK, rFail, rDidNothing);

type
  TBaseAbstract = class
  private
    FId: Integer;
    procedure SetId(const Value: Integer);
  public
    property Id: Integer read FId write SetId;
  end;

  TStorage = class abstract
  public
    function Write(const Instance: TBaseAbstract):TResult; virtual; abstract;
    function Read(const Instance: TBaseAbstract):TResult; virtual; abstract;
    function Delete(const Instance: TBaseAbstract):TResult; virtual; abstract;
  end;

type
  TBaseClass = class abstract (TBaseAbstract)

  public
    function Write(const Storage: TStorage):TResult; virtual;
    function Read(const Storage: TStorage):TResult; virtual;
    function Delete(const Storage: TStorage):TResult; virtual;

  end;

  TBaseListAbstract = class(TBaseClass);

  TBaseList<T: TBaseClass, Constructor> = class(TBaseListAbstract)
  type
    TElementList = class(TObjectList<T>)
  public
    function Write(const Storage: TStorage):TResult; override;
    function Read(const Storage: TStorage):TResult; override;
    function Delete(const Storage: TStorage):TResult; override;
    property Items: TElementList read GetElement write SetElement; default;
  end;


implementation

{ TBaseAbstract }

procedure TBaseAbstract.SetId(const Value: Integer);
begin
  FId := Value;
end;

{ TBaseClass }

function TBaseClass.Delete(const Storage: TStorage): TResult;
begin

end;

function TBaseClass.Read(const Storage: TStorage): TResult;
begin

end;

function TBaseClass.Write(const Storage: TStorage): TResult;
begin

end;

{ TBaseList<T> }

function TBaseList<T>.Delete(const Storage: TStorage): TResult;
var
  Element:
begin

end;

function TBaseList<T>.Read(const Storage: TStorage): TResult;
begin

end;

function TBaseList<T>.Write(const Storage: TStorage): TResult;
begin

end;

end.
