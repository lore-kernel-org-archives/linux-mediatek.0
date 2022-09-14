Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8F2ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nje7r2UUMOH6cojfqdfplzqcRgMTwtwRrsvLyzFXs0g=; b=wbHCrB3OgAxoWVD7MZx9IyieIl
	k7EoZWwN4u4cuPm775wEH3jwxLDvX8JA60r0vr99OI9cwPlSfDoOraGnKojbi5yvajcyEUBJiOC7t
	LksEuhNd79/YXqAW8NM0A1b0OFRtvO6+1SGZU5KG2hIcQQzIsinqRRJncM7uP256T6Azk6osT0UNK
	doEmKsJXQtep2OFa8wZJDHHIJmOeF+JeszCay7DVaUpTgPDHZDnakP1K2XUcfra55+YMCpNVO+umI
	R4acE2v0Ts7QHK+J0vQS14mfGpdDBJTnYJhmz7cAozTVMaeUN2aI7PaJ3evCBVGgpvZMl3ApVG7CK
	0VUT5qHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYPX1-00F2KQ-DS; Wed, 14 Sep 2022 10:22:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYPWA-00F1Ba-UW; Wed, 14 Sep 2022 10:21:21 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1EA4A6601FF1;
	Wed, 14 Sep 2022 11:21:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663150873;
	bh=P5j5gDWE9s2Ntl2W8jsDy0++Zt/hGRLwgx/zymqCOEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QzRqr6E0fd5qWf7F6Fyks5wrokcjBvAuwT+piZsXCFs0bBxGEb4V+UXlIjZv98Svj
	 WngpDkoNmMHkEhqGyp2dDSgf7isMZVaR1af+UDPfxaNlKuD/G+YkNpGkmix2mhkeog
	 euO0KFj3347nB8RSsKYm4E+/MDzpHwp7An3cMkYh4IeL/chEI/uJngZlce5uDSRYur
	 4aJy7hSauvhZB8BmtDojJnLgH8jWraWbSLXq/TY9GJmy3qJ7qBnPfwB9PqAoBev4Es
	 70kxa8BARNDrsWk8WIxlAr1/p6kvMLuCH/6+lqF8f4CJwlo1HQKw1+xa/Ehp471hkd
	 xzYhjviK2pdaw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzysztof.kozlowski+dt@linaro.org
Cc: dmitry.torokhov@gmail.com,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	chen.zhong@mediatek.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] dt-bindings: input: Convert mtk-pmic-keys to DT schema
Date: Wed, 14 Sep 2022 12:20:58 +0200
Message-Id: <20220914102059.41757-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914102059.41757-1-angelogioacchino.delregno@collabora.com>
References: <20220914102059.41757-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_032119_306990_AE3E4513 
X-CRM114-Status: GOOD (  16.84  )
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

Convert the mtk-pmic-keys to DT schema format.

The old binding was missing documentation for key press/release
interrupts, even though it was supported in hardware and driver,
so support for the same was added during the conversion.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/input/mediatek,pmic-keys.yaml    | 117 ++++++++++++++++++
 .../bindings/input/mtk-pmic-keys.txt          |  46 -------
 2 files changed, 117 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
new file mode 100644
index 000000000000..e33fdca50b16
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/mediatek,pmic-keys.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek PMIC Keys
+
+maintainers:
+  - Chen Zhong <chen.zhong@mediatek.com>
+
+allOf:
+  - $ref: input.yaml#
+
+description: |
+  There are two key functions provided by MT6397, MT6323 and other MediaTek
+  PMICs: pwrkey and homekey.
+  The key functions are defined as the subnode of the function node provided
+  by the PMIC that is defined as a Multi-Function Device (MFD).
+
+  For MediaTek MT6323/MT6397 PMIC bindings see
+  Documentation/devicetree/bindings/mfd/mt6397.txt
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6323-keys
+      - mediatek,mt6358-keys
+      - mediatek,mt6397-keys
+
+  power-off-time-sec: true
+
+  mediatek,long-press-mode:
+    description: |
+      Key long-press force shutdown setting
+      0 - disabled
+      1 - pwrkey
+      2 - pwrkey+homekey
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    maximum: 2
+
+patternProperties:
+  "^((power|home)|(key-[a-z0-9-]+|[a-z0-9-]+-key))$":
+    $ref: input.yaml#
+
+    properties:
+      interrupts:
+        minItems: 1
+        items:
+          - description: Key press interrupt
+          - description: Key release interrupt
+
+      interrupt-names: true
+
+      linux-keycodes:
+        maxItems: 1
+
+      wakeup-source: true
+
+    required:
+      - linux,keycodes
+
+    if:
+      properties:
+        interrupt-names:
+          contains:
+            const: powerkey
+    then:
+      properties:
+        interrupt-names:
+          minItems: 1
+          items:
+            - const: powerkey
+            - const: powerkey_r
+    else:
+      properties:
+        interrupt-names:
+          minItems: 1
+          items:
+            - const: homekey
+            - const: homekey_r
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pmic {
+        compatible = "mediatek,mt6397";
+
+        keys {
+          compatible = "mediatek,mt6397-keys";
+          mediatek,long-press-mode = <1>;
+          power-off-time-sec = <0>;
+
+          key-power {
+            interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_FALLING>;
+            interrupt-names = "powerkey";
+            linux,keycodes = <KEY_POWER>;
+            wakeup-source;
+          };
+
+          key-home {
+            interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_FALLING>, <GIC_SPI 76 IRQ_TYPE_EDGE_FALLING>;
+            interrupt-names = "homekey", "homekey_r";
+            linux,keycodes = <KEY_VOLUMEDOWN>;
+          };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
deleted file mode 100644
index 9d00f2a8e13a..000000000000
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-MediaTek MT6397/MT6323 PMIC Keys Device Driver
-
-There are two key functions provided by MT6397/MT6323 PMIC, pwrkey
-and homekey. The key functions are defined as the subnode of the function
-node provided by MT6397/MT6323 PMIC that is being defined as one kind
-of Muti-Function Device (MFD)
-
-For MT6397/MT6323 MFD bindings see:
-Documentation/devicetree/bindings/mfd/mt6397.txt
-
-Required properties:
-- compatible: Should be one of:
-	- "mediatek,mt6397-keys"
-	- "mediatek,mt6323-keys"
-	- "mediatek,mt6358-keys"
-- linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
-
-Optional Properties:
-- wakeup-source: See Documentation/devicetree/bindings/power/wakeup-source.txt
-- mediatek,long-press-mode: Long press key shutdown setting, 1 for
-	pwrkey only, 2 for pwrkey/homekey together, others for disabled.
-- power-off-time-sec: See Documentation/devicetree/bindings/input/input.yaml
-
-Example:
-
-	pmic: mt6397 {
-		compatible = "mediatek,mt6397";
-
-		...
-
-		mt6397keys: mt6397keys {
-			compatible = "mediatek,mt6397-keys";
-			mediatek,long-press-mode = <1>;
-			power-off-time-sec = <0>;
-
-			power {
-				linux,keycodes = <116>;
-				wakeup-source;
-			};
-
-			home {
-				linux,keycodes = <114>;
-			};
-		};
-
-	};
-- 
2.37.2


