Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56323C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 11:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CS/W4velR+TfPD7uGajs3kBUkP0zF4nuFGtTSa5vt30=; b=uG3QyrzQJ2zbz3+NEwr0kwX8sA
	2SSd4LjlqIrP1xssSWdHr2u3gzWdNpU34RIiU0o2xRzb0R6wDeGGODijIJRk0WsvaRKhkf9FWsZTM
	/F3p1JB5EIw9++7055XOsIuIG7YCNB3UKHp3h258ZK+zqj9E7B2HWcMPHby/wM+wbBkTbC7iK+NSH
	xoy+5OcGjzO9BwPoAsh/6wMJNEtRVFAcuO5eKn+e12OoHL8JMfNEm3uoRJ6AKw6X53YQhS4elJKTo
	6ZYJo2KrWxSFNd7ijQdw+xKX9FH3BKOEyMu/QCmntyd8zMat8LoQ9mqKSnrKjDH2VQKehp+avKAvc
	1NshY3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozcCW-001FpP-6i; Mon, 28 Nov 2022 11:21:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozcBi-001FMY-Fg; Mon, 28 Nov 2022 11:20:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2503D66029C3;
	Mon, 28 Nov 2022 11:20:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669634435;
	bh=0WTxNUB4PEO1Pb8R5U6xJaD0VYPrWUMyGpmilOQOYlw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gCWZynzm1S+uTS+Lw5ZIDVhbDrRhsAvPxv71wKKklsE1ocrlNct1rQoCyH6Et1AaH
	 mg5E17KukpCI37Zj+JoEQVBrnN3NENWeUmI/UhuVagz4of357BLxFlryJV6JE8LdH5
	 5DFh2tXRXh9iU8UWrK1PZSoHMRlN5cYvjjFJhGOcuSxPQwojD7Htn/eY4L4u20ljXQ
	 bJwqiTM67rySkwbhpE8oZldzP9I2//EReZwTABoSOgcfxeJOSL4Z1yCUL2EXYcDjwY
	 MaQrgK3MVaoGu/prL6pNyzK8HxYPO8kCJ/OIj7uXqIQA/3k3XZ8kGmnfsKMyoWtY15
	 lpNHzyXPvxcqg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzysztof.kozlowski+dt@linaro.org
Cc: thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	john@phrozen.org,
	sean.wang@mediatek.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 2/2] dt-bindings: pwm: mediatek: Convert pwm-mediatek to dt schema
Date: Mon, 28 Nov 2022 12:20:28 +0100
Message-Id: <20221128112028.58021-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128112028.58021-1-angelogioacchino.delregno@collabora.com>
References: <20221128112028.58021-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_032038_821511_F64A4457 
X-CRM114-Status: GOOD (  16.77  )
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

This converts pwm-mediatek.txt to mediatek,mt2712-pwm.yaml schema;
while at it, the clock names were clarified as previously they were
documented as "pwmX-Y", but valid names are "pwmN" only.
Also, the example was changed to use "mediatek,mt2712-pwm" instead
for consistency with the schema filename.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/pwm/mediatek,mt2712-pwm.yaml     | 93 +++++++++++++++++++
 .../devicetree/bindings/pwm/pwm-mediatek.txt  | 52 -----------
 2 files changed, 93 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mediatek.txt

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
new file mode 100644
index 000000000000..dbc974bff9e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/mediatek,mt2712-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek PWM Controller
+
+maintainers:
+  - John Crispin <john@phrozen.org>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2712-pwm
+          - mediatek,mt6795-pwm
+          - mediatek,mt7622-pwm
+          - mediatek,mt7623-pwm
+          - mediatek,mt7628-pwm
+          - mediatek,mt7629-pwm
+          - mediatek,mt8183-pwm
+          - mediatek,mt8365-pwm
+          - mediatek,mt8516-pwm
+      - items:
+          - enum:
+              - mediatek,mt8195-pwm
+          - const: mediatek,mt8183-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 10
+
+  clock-names:
+    description:
+      This controller needs two input clocks for its core and one
+      clock for each PWM output.
+    minItems: 2
+    items:
+      - const: top
+      - const: main
+      - const: pwm1
+      - const: pwm2
+      - const: pwm3
+      - const: pwm4
+      - const: pwm5
+      - const: pwm6
+      - const: pwm7
+      - const: pwm8
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
+    #include <dt-bindings/clock/mt2712-clk.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pwm0: pwm@11006000 {
+        compatible = "mediatek,mt2712-pwm";
+        reg = <0x11006000 0x1000>;
+        #pwm-cells = <2>;
+        interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_LOW>;
+        clocks = <&topckgen CLK_TOP_PWM_SEL>, <&pericfg CLK_PERI_PWM>,
+                 <&pericfg CLK_PERI_PWM0>, <&pericfg CLK_PERI_PWM1>,
+                 <&pericfg CLK_PERI_PWM2>, <&pericfg CLK_PERI_PWM3>,
+                 <&pericfg CLK_PERI_PWM4>, <&pericfg CLK_PERI_PWM5>,
+                 <&pericfg CLK_PERI_PWM6>, <&pericfg CLK_PERI_PWM7>;
+        clock-names = "top", "main",
+                      "pwm1", "pwm2",
+                      "pwm3", "pwm4",
+                      "pwm5", "pwm6",
+                      "pwm7", "pwm8";
+    };
diff --git a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt b/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
deleted file mode 100644
index 554c96b6d0c3..000000000000
--- a/Documentation/devicetree/bindings/pwm/pwm-mediatek.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-MediaTek PWM controller
-
-Required properties:
- - compatible: should be "mediatek,<name>-pwm":
-   - "mediatek,mt2712-pwm": found on mt2712 SoC.
-   - "mediatek,mt6795-pwm": found on mt6795 SoC.
-   - "mediatek,mt7622-pwm": found on mt7622 SoC.
-   - "mediatek,mt7623-pwm": found on mt7623 SoC.
-   - "mediatek,mt7628-pwm": found on mt7628 SoC.
-   - "mediatek,mt7629-pwm": found on mt7629 SoC.
-   - "mediatek,mt8183-pwm": found on mt8183 SoC.
-   - "mediatek,mt8195-pwm", "mediatek,mt8183-pwm": found on mt8195 SoC.
-   - "mediatek,mt8365-pwm": found on mt8365 SoC.
-   - "mediatek,mt8516-pwm": found on mt8516 SoC.
- - reg: physical base address and length of the controller's registers.
- - #pwm-cells: must be 2. See pwm.yaml in this directory for a description of
-   the cell format.
- - clocks: phandle and clock specifier of the PWM reference clock.
- - clock-names: must contain the following, except for MT7628 which
-                has no clocks
-   - "top": the top clock generator
-   - "main": clock used by the PWM core
-   - "pwm1-3": the three per PWM clocks for mt8365
-   - "pwm1-8": the eight per PWM clocks for mt2712
-   - "pwm1-6": the six per PWM clocks for mt7622
-   - "pwm1-5": the five per PWM clocks for mt7623
-   - "pwm1"  : the PWM1 clock for mt7629
- - pinctrl-names: Must contain a "default" entry.
- - pinctrl-0: One property must exist for each entry in pinctrl-names.
-   See pinctrl/pinctrl-bindings.txt for details of the property values.
-
-Optional properties:
-- assigned-clocks: Reference to the PWM clock entries.
-- assigned-clock-parents: The phandle of the parent clock of PWM clock.
-
-Example:
-	pwm0: pwm@11006000 {
-		compatible = "mediatek,mt7623-pwm";
-		reg = <0 0x11006000 0 0x1000>;
-		#pwm-cells = <2>;
-		clocks = <&topckgen CLK_TOP_PWM_SEL>,
-			 <&pericfg CLK_PERI_PWM>,
-			 <&pericfg CLK_PERI_PWM1>,
-			 <&pericfg CLK_PERI_PWM2>,
-			 <&pericfg CLK_PERI_PWM3>,
-			 <&pericfg CLK_PERI_PWM4>,
-			 <&pericfg CLK_PERI_PWM5>;
-		clock-names = "top", "main", "pwm1", "pwm2",
-			      "pwm3", "pwm4", "pwm5";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pwm0_pins>;
-	};
-- 
2.38.1


