unit DUnitX_TestBaseClass;

interface
uses
  BaseClass;
const
  NoSep = '¤';
  EmptyJSON = String('{ }');

type
  /// <summary> Basis generic test class for TPSDBase descendants </summary>
  TTestClass<T:TBaseClass, constructor> = class
  private
    FInstance: T;
    FSecondInstance: T;
    FHasSaveData: Boolean;
    function GetInstance: T;
    function GetSecondInstance: T;
    procedure SetSecondInstance(const Value: T);
    procedure SetHasSaveData(const Value: Boolean);
    function GetHasSaveData: Boolean; virtual;
  protected
    property Instance: T read GetInstance;
    property SecondInstance: T read GetSecondInstance write SetSecondInstance;
    procedure CaptureDebugOut(const aThreadId: Cardinal; const aStr: pChar);
  public
    constructor Create; virtual;
    destructor Destroy; override;

    function DummyJSON:String; virtual;

    property HasSaveData: Boolean read GetHasSaveData write SetHasSaveData;

    procedure Setup; virtual;
    procedure TearDown; virtual;
    procedure SetupFixture; virtual;
    procedure TeardownFixture; virtual;

    procedure CreateInstance; virtual;
    procedure CreateFromJSON(const aJSON: String); virtual;
    function SaveToDB:TPSDResult; virtual;
    function ReadFromDb:TPSDResult; virtual;
    function ChangeAndSave(const aJSON: String):TPSDResult; virtual;
    function DeleteFromDb:TPSDResult; virtual;
  end;

type
  /// <summary> Basis generic test class for TPSDBaseList descendants </summary>
  TTestListClass<T:TBaseListAbstract, constructor> = class(TTestClass<T>)
  private
    FHasDatabaseView: Boolean;
    FHasDeleteData: Boolean;
    procedure SetHasDatabaseView(const Value: Boolean);
    procedure SetHasDeleteData(const Value: Boolean);
    function GetHasDeleteData: Boolean;
    function GetHasSaveData: Boolean; override;
  public
    function DummyJSON: String; override;

    property HasDatabaseView: Boolean read FHasDatabaseView write SetHasDatabaseView;
    property HasDeleteData: Boolean read GetHasDeleteData write SetHasDeleteData;
    procedure Setup; override;
    procedure TearDown; override;
    procedure CreateFromJSON(const aJSON: String); override;
    function ReadFromDb:TPSDResult; override;
    function ChangeAndSave(const aJSON: String):TPSDResult; override;
    function DeleteFromDb:TPSDResult; override;
  end;

implementation

end.
