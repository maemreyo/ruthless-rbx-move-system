Hướng dẫn tạo Project Rojo từ cấu trúc có sẵn
Tài liệu này sẽ hướng dẫn bạn cách thiết lập một project Rojo dựa trên cấu trúc file "Movement System By LettuceDev" mà bạn đã cung cấp.

1. Phân tích cấu trúc trong Roblox Studio
Dựa trên các hình ảnh, các đối tượng cần được đặt vào các services của Roblox như sau:

Lighting:

Atmosphere

Sky

Bloom

ColorCorrection

DepthOfField

GUIBlur

SunRays

ReplicatedStorage:

Maps (Folder)

Modules (Folder)

Stat (Value)

ServerScriptService:

Ragdoll (Script)

leaderstats (Script)

StarterCharacterScripts:

Animate (LocalScript)

CamController (LocalScript)

CameraBobble (LocalScript)

CustomCameraSystemV2 (LocalScript)

FOVLock (LocalScript)

LedgeGrab (LocalScript)

Slide (LocalScript)

StarterGui:

Map Select (ScreenGui)

StarterPlayer:

StarterCharacter (Model)

StarterPlayerScripts:

LocalScript (LocalScript)

WindController (LocalScript)

Workspace:

Ingame (Folder)

Script (Script)

ShiftLock (Script)

Stat (Value)

Spawn (Folder)

Teleports (Folder)

Walls (Folder)

2. Tạo file cấu hình rojo.json
Đây là file chính để Rojo biết cách "map" (ánh xạ) các file trên máy tính của bạn vào trong Roblox Studio. Hãy tạo một file tên là default.project.json (hoặc tên khác bạn muốn) với nội dung sau:

{
  "name": "MovementSystemProject",
  "tree": {
    "$className": "DataModel",

    "Lighting": {
      "$path": "src/Lighting"
    },

    "ReplicatedStorage": {
      "$path": "src/ReplicatedStorage"
    },

    "ServerScriptService": {
      "$path": "src/ServerScriptService"
    },

    "StarterPlayer": {
      "StarterCharacterScripts": {
        "$path": "src/StarterPlayer/StarterCharacterScripts"
      },
      "StarterPlayerScripts": {
        "$path": "src/StarterPlayer/StarterPlayerScripts"
      },
      "$path": "src/StarterPlayer"
    },

    "StarterGui": {
      "$path": "src/StarterGui"
    },

    "Workspace": {
      "$path": "src/Workspace"
    }
  }
}

Giải thích:

name: Tên project của bạn.

tree: Đại diện cho cấu trúc trong game của Roblox.

$path: Chỉ đường dẫn đến thư mục tương ứng trên máy tính của bạn. Chúng ta sẽ đặt tất cả mã nguồn vào trong một thư mục src để cho gọn gàng.

3. Cấu trúc thư mục trên máy tính
Dựa vào file default.project.json ở trên, bạn cần tạo cấu trúc thư mục trên máy tính của mình như sau. Bạn chỉ cần di chuyển các file và folder từ trong model "Movement System By LettuceDev" vào đúng các thư mục tương ứng.

📁 MovementSystemProject/
├── default.project.json
└── 📁 src/
    ├── 📁 Lighting/
    │   ├── Atmosphere.rbxmx
    │   ├── Sky.rbxmx
    │   └── ... (các file khác trong Lighting)
    │
    ├── 📁 ReplicatedStorage/
    │   ├── 📁 Maps/
    │   ├── 📁 Modules/
    │   └── Stat.rbxmx
    │
    ├── 📁 ServerScriptService/
    │   ├── Ragdoll.server.lua
    │   └── leaderstats.server.lua
    │
    ├── 📁 StarterGui/
    │   └── Map Select.rbxmx
    │
    ├── 📁 StarterPlayer/
    │   ├── StarterCharacter.rbxmx
    │   ├── 📁 StarterCharacterScripts/
    │   │   ├── Animate.client.lua
    │   │   ├── CamController.client.lua
    │   │   └── ... (các script khác)
    │   │
    │   └── 📁 StarterPlayerScripts/
    │       ├── LocalScript.client.lua
    │       └── WindController.client.lua
    │
    └── 📁 Workspace/
        ├── 📁 Ingame/
        ├── 📁 Spawn/
        ├── ... (các folder và script khác)
        └── Walls.rbxmx

Lưu ý về đuôi file:

Script -> .server.lua

LocalScript -> .client.lua

ModuleScript -> .lua

Các Model, Part, GUI, hoặc các đối tượng phức tạp khác sẽ được lưu dưới dạng file .rbxmx hoặc .rbxm. Bạn có thể lưu chúng bằng cách click chuột phải vào đối tượng trong Studio và chọn "Save to File...".

4. Các bước tiếp theo
Cài đặt Rojo: Nếu chưa có, hãy cài đặt Rojo CLI và extension Rojo cho Visual Studio Code.

Tạo cấu trúc: Tạo file default.project.json và các thư mục như trên.

Di chuyển file: Lưu các model, script và đối tượng từ Studio vào các thư mục tương ứng trên máy tính.

Đồng bộ: Khởi động Rojo và kết nối với Roblox Studio. Các file của bạn sẽ tự động được đồng bộ vào đúng vị trí.

Chúc bạn thành công!