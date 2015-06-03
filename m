From: Mars Cheng <mars.cheng@mediatek.com>
Subject: [PATCH 1/2] Document: DT: Add bindings for mediatek MT6580 SoC Platform
Date: Wed, 3 Jun 2015 16:18:52 +0800
Message-ID: <1433319533-24803-2-git-send-email-mars.cheng@mediatek.com>
References: <1433319533-24803-1-git-send-email-mars.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1433319533-24803-1-git-send-email-mars.cheng@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.or, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>, CC Hwang <cc.hwang@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, Loda Chou <loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, MY Chuang <my.chuang@mediatek.com>, Scott Shu <scott.shu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

This adds a DT binding documentation for the MT6580 SoC from Mediatek.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 Documentation/devicetree/bindings/arm/mediatek.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.txt b/Documentation/devicetree/bindings/arm/mediatek.txt
index dd7550a..2daa424 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek.txt
@@ -5,6 +5,7 @@ Boards with a MediaTek mt65xx/mt81xx SoC shall have the following property:
 Required root node property:
 
 compatible: Must contain one of
+   "mediatek,mt6580"
    "mediatek,mt6589"
    "mediatek,mt6592"
    "mediatek,mt8127"
@@ -14,6 +15,9 @@ compatible: Must contain one of
 
 Supported boards:
 
+- Evaluation board for MT6580:
+    Required root node properties:
+      - compatible = "mediatek,mt6580-evbp1", "mediatek,mt6580";
 - bq Aquaris5 smart phone:
     Required root node properties:
       - compatible = "mundoreader,bq-aquaris5", "mediatek,mt6589";
-- 
1.8.1.1.dirty
