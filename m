From: John Crispin <blogic@openwrt.org>
Subject: [PATCH 1/2] dt-bindings: mediatek: Modify pinctrl bindings for mt7623
Date: Sun, 10 Jan 2016 17:00:07 +0100
Message-ID: <1452441608-24176-1-git-send-email-blogic@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Signed-off-by: John Crispin <blogic@openwrt.org>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
index 9ffb0b2..4fa4444 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
@@ -5,6 +5,7 @@ The Mediatek's Pin controller is used to control SoC pins.
 Required properties:
 - compatible: value should be one of the following.
 	"mediatek,mt2701-pinctrl", compatible with mt2701 pinctrl.
+	"mediatek,mt7623-pinctrl", compatible with mt7623 pinctrl.
 	"mediatek,mt6397-pinctrl", compatible with mt6397 pinctrl.
 	"mediatek,mt8127-pinctrl", compatible with mt8127 pinctrl.
 	"mediatek,mt8135-pinctrl", compatible with mt8135 pinctrl.
-- 
1.7.10.4
