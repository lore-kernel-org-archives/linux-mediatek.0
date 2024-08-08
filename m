Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD98BC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Aug 2024 10:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=25aCUhW16bAELL0sJZvG8xG/qjYiHb1//nKMHBCUUF4=; b=fXnPWXTo9YeDh5wWukYJ4w1RoV
	g35NFbYJYWmhZblKZICKkfsVxVohYQAzrt5ZQ4LAO5mhJWjC0PeltsmsLAW47PVYT/ThgZG+XouA6
	ACCJhZRUu9x44wv8wVH0Kl+byjTiMfOI2hOyxDVnMjoCVgoibtF8nVug11iGuBfbv/uA8QV2b4j7I
	P1yULHXfOyclokThSSDo4mp3lstfsVBaDO4xzwUfkQT5K47Wa35xFUC6wnZ+zFCRjuHxXTfkxanEq
	CkJaDZ8QkZDsFWLQdViUgREEc3FAZ07ANFP+3lL+4bt5iTgiyBBNGVNFpCUMfiQyPk8o3MJxUmVkD
	jAzhSb9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0rH-00000007zRl-27f8;
	Thu, 08 Aug 2024 10:59:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0qi-00000007zOU-1ugT;
	Thu, 08 Aug 2024 10:58:29 +0000
X-UUID: 21fedf3a557511efa6c87f6b4542ff6b-20240808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=25aCUhW16bAELL0sJZvG8xG/qjYiHb1//nKMHBCUUF4=;
	b=L5dgVSUWHOSBLFs/Qtar2wxsKsGB8ZtepI1O7hRPNpJjNlqfQCpKmRf0OBMjCFae3z8+xtL0AKYP+5M+/CRn959cZTRIxnlB3Yljs302C4sGYCWshJzb9BxP6CJTtpQzRZsxSLiODQTAkQcrmLuCBecMK8rvm7PB2+GJ+BjUnIY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:46480079-c56a-4c85-afff-857e586993e2,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6dc6a47,CLOUDID:a72854fe-77bb-433c-b174-ffb8012693b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 21fedf3a557511efa6c87f6b4542ff6b-20240808
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1869651; Thu, 08 Aug 2024 03:58:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 8 Aug 2024 03:57:48 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 8 Aug 2024 18:57:48 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen
 Chu <sen.chu@mediatek.com>, Jason-ch Chen <Jason-ch.Chen@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>, Alexandre
 Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH] dt-bindings: mfd: mediatek: mt6397: Convert to DT schema format
Date: Thu, 8 Aug 2024 18:57:22 +0800
Message-ID: <20240808105722.7222-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_035828_511137_3D0A869A 
X-CRM114-Status: GOOD (  18.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert the mfd: mediatek: mt6397 binding to DT schema format.

New updates in this conversion:
 - Align generic names of DT schema "audio-codec" and "regulators".
 - mt6397-regulators: Replace the "txt" reference with newly added DT
   schema.

Signed-off-by: Sen Chu <sen.chu@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../bindings/mfd/mediatek,mt6397.yaml         | 202 ++++++++++++++++++
 .../devicetree/bindings/mfd/mt6397.txt        | 110 ----------
 2 files changed, 202 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/mt6397.txt

Changes for v1:
 - This patch depends on conversion of mediatek,mt6397-regulator.yaml
   [1] https://lore.kernel.org/lkml/20240807091738.18387-1-macpaul.lin@mediatek.com/T/

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
new file mode 100644
index 0000000..cfbf2215
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6397/MT6323 Multifunction Device
+
+maintainers:
+  - Sen Chu <sen.chu@mediatek.com>
+  - Macpaul Lin <macpaul.lin@mediatek.com>
+
+description: |
+  MT6397/MT6323 is a multifunction device with the following sub modules:
+  - Regulator
+  - RTC
+  - Audio codec
+  - GPIO
+  - Clock
+  - LED
+  - Keys
+  - Power controller
+
+  It is interfaced to host controller using SPI interface by a proprietary hardware
+  called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
+  See the following for pwarp node definitions:
+  ../soc/mediatek/mediatek,pwrap.yaml
+
+  This document describes the binding for MFD device and its sub module.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt6323
+          - mediatek,mt6331 # "mediatek,mt6331" for PMIC MT6331 and MT6332.
+          - mediatek,mt6357
+          - mediatek,mt6358
+          - mediatek,mt6359
+          - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6366 # "mediatek,mt6366", "mediatek,mt6358" for PMIC MT6366
+          - const: mediatek,mt6358
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  rtc:
+    type: object
+    unevaluatedProperties: false
+    description:
+      Real Time Clock (RTC)
+      See ../rtc/rtc-mt6397.txt
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6323-rtc
+              - mediatek,mt6331-rtc
+              - mediatek,mt6358-rtc
+              - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6366-rtc # RTC MT6366
+              - const: mediatek,mt6358-rtc
+
+  regulators:
+    type: object
+    oneOf:
+      - $ref: /schemas/regulator/mediatek,mt6358-regulator.yaml
+      - $ref: /schemas/regulator/mediatek,mt6397-regulator.yaml
+    unevaluatedProperties: false
+    description:
+      Regulators
+      For mt6323, see ../regulator/mt6323-regulator.txt
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6323-regulator
+              - mediatek,mt6358-regulator
+              - mediatek,mt6397-regulator
+          - items:
+              - enum:
+                  - mediatek,mt6366-regulator # Regulator MT6366
+              - const: mediatek,mt6358-regulator
+
+  audio-codec:
+    type: object
+    unevaluatedProperties: false
+    description:
+      Audio codec
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6397-codec
+              - mediatek,mt6358-sound
+          - items:
+              - enum:
+                  - mediatek,mt6366-sound # Codec MT6366
+              - const: mediatek,mt6358-sound
+
+  clk:
+    type: object
+    unevaluatedProperties: false
+    description:
+      Clock
+    properties:
+      compatible:
+        const: mediatek,mt6397-clk
+
+  led:
+    type: object
+    unevaluatedProperties: false
+    description:
+      LED
+      See ../leds/leds-mt6323.txt for more information
+    properties:
+      compatible:
+        const: mediatek,mt6323-led
+
+  keys:
+    type: object
+    $ref: /schemas/input/mediatek,pmic-keys.yaml
+    unevaluatedProperties: false
+    description: Keys
+    properties:
+      compatible:
+        oneOf:
+          - enum:
+              - mediatek,mt6323-keys
+              - mediatek,mt6331-keys
+              - mediatek,mt6397-keys
+
+  power-controller:
+    type: object
+    unevaluatedProperties: false
+    description:
+      Power controller
+      See ../power/reset/mt6323-poweroff.txt
+    properties:
+      compatible:
+        const: mediatek,mt6323-pwrc
+
+  pin-controller:
+    type: object
+    $ref: /schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
+    unevaluatedProperties: false
+    description:
+      Pin controller
+    properties:
+      compatible:
+        const: mediatek,mt6397-pinctrl
+
+required:
+  - compatible
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pwrap {
+        pmic {
+            compatible = "mediatek,mt6397";
+            interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-controller;
+            #interrupt-cells = <2>;
+
+            mt6397_codec: audio-codec {
+                compatible = "mediatek,mt6397-codec";
+            };
+
+            mt6397_regulators: regulators {
+                compatible = "mediatek,mt6397-regulator";
+
+                mt6397_vpca15_reg: buck_vpca15 {
+                    regulator-name = "vpca15";
+                    regulator-min-microvolt = <850000>;
+                    regulator-max-microvolt = <1400000>;
+                    regulator-ramp-delay = <12500>;
+                    regulator-always-on;
+                };
+
+                mt6397_vgp4_reg: ldo_vgp4 {
+                    regulator-name = "vgp4";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3300000>;
+                    regulator-enable-ramp-delay = <218>;
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
deleted file mode 100644
index 10540aa..0000000
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ /dev/null
@@ -1,110 +0,0 @@
-MediaTek MT6397/MT6323 Multifunction Device Driver
-
-MT6397/MT6323 is a multifunction device with the following sub modules:
-- Regulator
-- RTC
-- Audio codec
-- GPIO
-- Clock
-- LED
-- Keys
-- Power controller
-
-It is interfaced to host controller using SPI interface by a proprietary hardware
-called PMIC wrapper or pwrap. MT6397/MT6323 MFD is a child device of pwrap.
-See the following for pwarp node definitions:
-../soc/mediatek/mediatek,pwrap.yaml
-
-This document describes the binding for MFD device and its sub module.
-
-Required properties:
-compatible:
-	"mediatek,mt6323" for PMIC MT6323
-	"mediatek,mt6331" for PMIC MT6331 and MT6332
-	"mediatek,mt6357" for PMIC MT6357
-	"mediatek,mt6358" for PMIC MT6358
-	"mediatek,mt6359" for PMIC MT6359
-	"mediatek,mt6366", "mediatek,mt6358" for PMIC MT6366
-	"mediatek,mt6397" for PMIC MT6397
-
-Optional subnodes:
-
-- rtc
-	Required properties: Should be one of follows
-		- compatible: "mediatek,mt6323-rtc"
-		- compatible: "mediatek,mt6331-rtc"
-		- compatible: "mediatek,mt6358-rtc"
-		- compatible: "mediatek,mt6397-rtc"
-	For details, see ../rtc/rtc-mt6397.txt
-- regulators
-	Required properties:
-		- compatible: "mediatek,mt6323-regulator"
-	see ../regulator/mt6323-regulator.txt
-		- compatible: "mediatek,mt6358-regulator"
-		- compatible: "mediatek,mt6366-regulator", "mediatek-mt6358-regulator"
-	see ../regulator/mt6358-regulator.txt
-		- compatible: "mediatek,mt6397-regulator"
-	see ../regulator/mt6397-regulator.txt
-- codec
-	Required properties:
-		- compatible: "mediatek,mt6397-codec" or "mediatek,mt6358-sound"
-- clk
-	Required properties:
-		- compatible: "mediatek,mt6397-clk"
-- led
-	Required properties:
-		- compatible: "mediatek,mt6323-led"
-	see ../leds/leds-mt6323.txt
-
-- keys
-	Required properties: Should be one of the following
-		- compatible: "mediatek,mt6323-keys"
-		- compatible: "mediatek,mt6331-keys"
-		- compatible: "mediatek,mt6397-keys"
-	see ../input/mtk-pmic-keys.txt
-
-- power-controller
-	Required properties:
-		- compatible: "mediatek,mt6323-pwrc"
-	For details, see ../power/reset/mt6323-poweroff.txt
-
-- pin-controller
-	Required properties:
-		- compatible: "mediatek,mt6397-pinctrl"
-	For details, see ../pinctrl/pinctrl-mt65xx.txt
-
-Example:
-	pwrap: pwrap@1000f000 {
-		compatible = "mediatek,mt8135-pwrap";
-
-		...
-
-		pmic {
-			compatible = "mediatek,mt6397";
-
-			codec: mt6397codec {
-				compatible = "mediatek,mt6397-codec";
-			};
-
-			regulators {
-				compatible = "mediatek,mt6397-regulator";
-
-				mt6397_vpca15_reg: buck_vpca15 {
-					regulator-compatible = "buck_vpca15";
-					regulator-name = "vpca15";
-					regulator-min-microvolt = <850000>;
-					regulator-max-microvolt = <1400000>;
-					regulator-ramp-delay = <12500>;
-					regulator-always-on;
-				};
-
-				mt6397_vgp4_reg: ldo_vgp4 {
-					regulator-compatible = "ldo_vgp4";
-					regulator-name = "vgp4";
-					regulator-min-microvolt = <1200000>;
-					regulator-max-microvolt = <3300000>;
-					regulator-enable-ramp-delay = <218>;
-				};
-			};
-		};
-	};
-- 
2.18.0


