Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C420C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 12:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xH5yXLgHhV2sboyg0V6VIRDfducpQ1JKpxXlga3aus=; b=Y1XLRk/ozKUJGB
	9cZqIj6KHlWxNXbA1YP55YoM96XPHOt6BKU7aqdqfnBzVGVeMjgR6kmUNe2YSlfleQlF36RQGR+X+
	NXUpbKV2ukarKWaKoFpgd+aY6/JWGM7+zf2Y5PTawT0wnWu0spcpHisvBoeobzSkyo3c9eAFJ2FiQ
	Vw9WRXu49OO3I37Qe/xjBMjvaIx36+vCGfg4rMKQlynG/+F1ojrvNHqw0slDKJDTj1IQr0gN6LbVu
	pNbmEpoz6ytGBfhnnTyhLTiN3QUfWodKqhSA/LJ7PYUyK/vGjSjV7EIN/wWif1A8cwUqd4I+F+sYu
	+K2JL7pBeNM9345ALCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZuEH-002HEn-Mj; Thu, 31 Mar 2022 12:48:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZuDt-002H75-KD; Thu, 31 Mar 2022 12:48:23 +0000
X-UUID: b9f94505003c4d969f9a6f3e9cf415b8-20220331
X-UUID: b9f94505003c4d969f9a6f3e9cf415b8-20220331
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1190991435; Thu, 31 Mar 2022 05:48:19 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 05:48:17 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 31 Mar 2022 20:48:14 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 31 Mar 2022 20:48:07 +0800
From: <xinlei.lee@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <rex-bc.chen@mediatek.com>, <jitao.shi@mediatek.com>, Xinlei Lee
 <xinlei.lee@mediatek.com>
Subject: [PATCH v5, 1/4] dt-bindings: pwm: Convert pwm-mtk-disp.txt to mediatek,
 pwm-disp.yaml format
Date: Thu, 31 Mar 2022 20:47:50 +0800
Message-ID: <1648730873-18505-2-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1648730873-18505-1-git-send-email-xinlei.lee@mediatek.com>
References: <1648730873-18505-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_054821_727698_60F6E6F3 
X-CRM114-Status: GOOD (  15.60  )
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
 .../bindings/pwm/mediatek,pwm-disp.yaml       | 66 +++++++++++++++++++
 .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 45 -------------
 2 files changed, 66 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
new file mode 100644
index 000000000000..36f877f819fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek DISP_PWM Controller Device Tree Bindings
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
+          - mediatek,mt8183-disp-pwm
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
index 691e58b6c223..000000000000
--- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-MediaTek display PWM controller
-
-Required properties:
- - compatible: should be "mediatek,<name>-disp-pwm":
-   - "mediatek,mt2701-disp-pwm": found on mt2701 SoC.
-   - "mediatek,mt6595-disp-pwm": found on mt6595 SoC.
-   - "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm": found on mt8167 SoC.
-   - "mediatek,mt8173-disp-pwm": found on mt8173 SoC.
-   - "mediatek,mt8183-disp-pwm": found on mt8183 SoC.$
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
