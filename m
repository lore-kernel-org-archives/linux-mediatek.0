Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A51C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 06:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxRGd0jWnnEEA7YsJ1NKcj/GvyhM2AS1dvc2FUGul64=; b=QfW61rAa8Eb328
	XGV/s+FjB5S2aaR/wWd3728LT+VjeGvkXR4XVFPcEqFyg8pOyoCJqz6zhl0AqNhXyse0V6Mu7TkXn
	WU8RV6vneO3bWiPjJuh+tqHcgpAjZ7Ze063GuvOQFPNPPgpuoYm9lXaSE0BbHTWrPHGnyDrGVLFVu
	8XaX5Zr9pKeEek0hE6NlV4yMn2DCOSVnSdfJFiaO8r9F5BQBekchEGiTZ9T0UkyAtSHOwihonFNJe
	E6+mM6H0DGwpd6BdG0ocEajRUt1nPfLwXxi6Ax8Pa9IwA9Vna79I7ORD8DVe/1ewM8yoYAIxmvupV
	vjXmw4PVpkJYcctA/T6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXGe6-00FlBB-95; Thu, 24 Mar 2022 06:08:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXGdk-00Fl2G-4l; Thu, 24 Mar 2022 06:08:09 +0000
X-UUID: d97a675c86004ebaace3b3ae83d2c704-20220323
X-UUID: d97a675c86004ebaace3b3ae83d2c704-20220323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1442273135; Wed, 23 Mar 2022 23:08:03 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 23:03:31 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Mar 2022 14:03:29 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 24 Mar 2022 14:03:28 +0800
From: <xinlei.lee@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-pwm@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <jitao.shi@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [PATCH v4, 1/6] dt-bindings: pwm: Convert pwm-mtk-disp.txt to mediatek,
 pwm-disp.yaml format
Date: Thu, 24 Mar 2022 14:03:19 +0800
Message-ID: <1648101804-3584-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1648101804-3584-1-git-send-email-xinlei.lee@mediatek.com>
References: <1648101804-3584-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_230808_203004_C273ECE0 
X-CRM114-Status: GOOD (  15.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Xinlei Lee <xinlei.lee@mediatek.com>

Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format as suggested by maintainer

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pwm/mediatek,pwm-disp.yaml       | 65 +++++++++++++++++++
 .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 -------------
 2 files changed, 65 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
new file mode 100644
index 000000000000..f844695d605a
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek DISP_PWM Controller Device Tree Bindings
+
+maintainers:
+  - Jitao Shi <jitao.shi@mediatek.com>
+  - Xinlei Lee <xinlei.lee@mediatek.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2701-disp-pwm
+          - mediatek,mt6595-disp-pwm
+          - mediatek,mt8173-disp-pwm
+      - items:
+          - const: mediatek,mt8167-disp-pwm
+          - const: mediatek,mt8173-disp-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+
+  clocks:
+    items:
+      - description: Main Clock
+      - description: Mm Clock
+
+  clock-names:
+    items:
+      - const: main
+      - const: mm
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pwm0: pwm@1401e000 {
+        compatible = "mediatek,mt8173-disp-pwm";
+        reg = <0x1401e000 0x1000>;
+        #pwm-cells = <2>;
+        clocks = <&mmsys CLK_MM_DISP_PWM026M>,
+                 <&mmsys CLK_MM_DISP_PWM0MM>;
+        clock-names = "main", "mm";
+    };
diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
deleted file mode 100644
index 902b271891ae..000000000000
--- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-MediaTek display PWM controller
-
-Required properties:
- - compatible: should be "mediatek,<name>-disp-pwm":
-   - "mediatek,mt2701-disp-pwm": found on mt2701 SoC.
-   - "mediatek,mt6595-disp-pwm": found on mt6595 SoC.
-   - "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm": found on mt8167 SoC.
-   - "mediatek,mt8173-disp-pwm": found on mt8173 SoC.
- - reg: physical base address and length of the controller's registers.
- - #pwm-cells: must be 2. See pwm.yaml in this directory for a description of
-   the cell format.
- - clocks: phandle and clock specifier of the PWM reference clock.
- - clock-names: must contain the following:
-   - "main": clock used to generate PWM signals.
-   - "mm": sync signals from the modules of mmsys.
- - pinctrl-names: Must contain a "default" entry.
- - pinctrl-0: One property must exist for each entry in pinctrl-names.
-   See pinctrl/pinctrl-bindings.txt for details of the property values.
-
-Example:
-	pwm0: pwm@1401e000 {
-		compatible = "mediatek,mt8173-disp-pwm",
-			     "mediatek,mt6595-disp-pwm";
-		reg = <0 0x1401e000 0 0x1000>;
-		#pwm-cells = <2>;
-		clocks = <&mmsys CLK_MM_DISP_PWM026M>,
-			 <&mmsys CLK_MM_DISP_PWM0MM>;
-		clock-names = "main", "mm";
-		pinctrl-names = "default";
-		pinctrl-0 = <&disp_pwm0_pins>;
-	};
-
-	backlight_lcd: backlight_lcd {
-		compatible = "pwm-backlight";
-		pwms = <&pwm0 0 1000000>;
-		brightness-levels = <
-			  0  16  32  48  64  80  96 112
-			128 144 160 176 192 208 224 240
-			255
-		>;
-		default-brightness-level = <9>;
-		power-supply = <&mt6397_vio18_reg>;
-		enable-gpios = <&pio 95 GPIO_ACTIVE_HIGH>;
-	};
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
