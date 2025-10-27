Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E0BCCF9EA
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 11:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5Qk42cVhdh/ZkSAvLxZrg3YwUv0D5UNxYz9HtZtJJI=; b=whZ1PWVFGsaYDiZDRtOv3Yy1ul
	24cMQ/hv6B/kPDz6eItmBpsvgTNG3U2WPiAD3t54wVwP7bTf7NdhP/iIALzZTtzrRIUPz5xRHL3b5
	Ohg1RSZtpOx0BXHsf6/VzUDjxjVvxXXZ516iylwJlXmDwaIo1+AS94rCsoeuaNHFWLIsXX3EDC/RT
	iIOCliBrf2cW0cjh5qNQSZwhWTSk/gyRFgvwdcyqhWCd9/yp5y7TL0ZZf3LU/OH96n3jb+WAhR2wn
	woeu1oewoRrwjPZAK2bbUBeDcphBuNGEn9WOoCuT5V0Crjx5zMh0WjJLWJ71kPKCEbMHDGGmbitlb
	U+zSrksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDL2h-0000000Dhqo-1Y8E;
	Mon, 27 Oct 2025 11:05:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDL2e-0000000Dhns-2M31;
	Mon, 27 Oct 2025 11:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761563134;
	bh=IF7AM2gQNLnbcXW1+U68h00gmTreyqW0I2q0536VDeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cj4aISZB3BT9o1F7Sk8pE5qNw0G0Bt0C5bKemSYCFEXMSCyK153KV9JrI9VpO/98Q
	 xtIHA8l8YYDdWnFLIv7lSyXqNipkRqQTTyKDlA8YAIqqzmzQsW53tbvjIIi6o2kp8p
	 s7VSu13V2xesEEKCSlvh2PDXxfI3K+awpbC098kLskv8mg5Cly349x+wKg6JlNkvfj
	 6IvMVqjkbkmx2TrZDbSP3q+HU/bAsojMiUnPqTZS7ObsYvksCJIYFwgh/Ir4LE8EkX
	 4jtS/YWpn3xv9qWvL1suxw9qro2b5LNJ21z3qcM73AD8ruDYcH/P9N9hML1mRP9nG7
	 U9xStBE5yZwyA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 84D9017E12D5;
	Mon, 27 Oct 2025 12:05:33 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v11 1/9] dt-bindings: regulator: Document MediaTek MT6316 PMIC Regulators
Date: Mon, 27 Oct 2025 12:05:19 +0100
Message-ID: <20251027110527.21002-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
References: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_040536_773839_49D42E30 
X-CRM114-Status: GOOD (  13.75  )
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

Add bindings for the regulators found in the MediaTek MT6316 PMIC,
usually found in board designs using the MT6991 Dimensity 9400 and
on MT8196 Kompanio SoC for Chromebooks.

This chip is fully controlled by SPMI and has multiple variants
providing different phase configurations.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6316b-regulator.yaml | 76 +++++++++++++++++++
 .../regulator/mediatek,mt6316c-regulator.yaml | 76 +++++++++++++++++++
 .../regulator/mediatek,mt6316d-regulator.yaml | 75 ++++++++++++++++++
 3 files changed, 227 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
new file mode 100644
index 000000000000..ea595935f4c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316b-regulator.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316b-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 BP/VP SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6316BP/VP PMICs are fully controlled by SPMI interface, both
+  feature four step-down DC/DC (buck) converters, and provides 2+2 Phases,
+  joining Buck 1+2 for the first phase, and Buck 3+4 for the second phase.
+
+properties:
+  compatible:
+    const: mediatek,mt6316b-regulator
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^vbuck(12|34)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description: |
+          Allowed Buck regulator operating modes allowed. Valid values below.
+            0 - Normal mode with automatic power saving, reducing the switching
+                frequency when light load conditions are detected
+            1 - Forced Continuous Conduction mode (FCCM) for improved voltage
+                regulation accuracy with constant switching frequency but lower
+                regulator efficiency
+            2 - Forced Low Power mode for improved regulator efficiency, used
+                when no heavy load is expected, will shut down unnecessary IP
+                blocks and secondary phases to reduce quiescent current.
+                This mode does not limit the maximum output current but unless
+                only a light load is applied, there will be regulation accuracy
+                and efficiency losses.
+        minItems: 1
+        maxItems: 3
+        items:
+          enum: [ 0, 1, 2 ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      pmic@8 {
+        compatible = "mediatek,mt6316b-regulator";
+        reg = <0x8 SPMI_USID>;
+
+        vbuck12 {
+          regulator-name = "dvdd_core";
+          regulator-min-microvolt = <450000>;
+          regulator-max-microvolt = <965000>;
+          regulator-allowed-modes = <0 1 2>;
+          regulator-enable-ramp-delay = <256>;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
new file mode 100644
index 000000000000..186dcd3f11ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316c-regulator.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316c-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 CP/HP/KP SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6316CP/HP/KP PMICs are fully controlled by SPMI interface,
+  features four step-down DC/DC (buck) converters, and provides 3+1 Phases,
+  joining Buck 1+2+4 for the first phase, and uses Buck 3 for the second.
+
+properties:
+  compatible:
+    const: mediatek,mt6316c-regulator
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^vbuck(124|3)$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description: |
+          Allowed Buck regulator operating modes allowed. Valid values below.
+            0 - Normal mode with automatic power saving, reducing the switching
+                frequency when light load conditions are detected
+            1 - Forced Continuous Conduction mode (FCCM) for improved voltage
+                regulation accuracy with constant switching frequency but lower
+                regulator efficiency
+            2 - Forced Low Power mode for improved regulator efficiency, used
+                when no heavy load is expected, will shut down unnecessary IP
+                blocks and secondary phases to reduce quiescent current.
+                This mode does not limit the maximum output current but unless
+                only a light load is applied, there will be regulation accuracy
+                and efficiency losses.
+        minItems: 1
+        maxItems: 3
+        items:
+          enum: [ 0, 1, 2 ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      pmic@6 {
+        compatible = "mediatek,mt6316c-regulator";
+        reg = <0x6 SPMI_USID>;
+
+        vbuck124 {
+          regulator-name = "dvdd_proc_m";
+          regulator-min-microvolt = <450000>;
+          regulator-max-microvolt = <1277500>;
+          regulator-allowed-modes = <0 1 2>;
+          regulator-enable-ramp-delay = <256>;
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
new file mode 100644
index 000000000000..aa9e9ef3b52d
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6316d-regulator.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6316d-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6316 DP/TP SPMI PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6316DP/TP PMICs are fully controlled by SPMI interface, both
+  feature four step-down DC/DC (buck) converters, and provides a single Phase,
+  joining Buck 1+2+3+4.
+
+properties:
+  compatible:
+    const: mediatek,mt6316d-regulator
+
+  reg:
+    maxItems: 1
+
+  vbuck1234:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description: |
+          Allowed Buck regulator operating modes allowed. Valid values below.
+            0 - Normal mode with automatic power saving, reducing the switching
+                frequency when light load conditions are detected
+            1 - Forced Continuous Conduction mode (FCCM) for improved voltage
+                regulation accuracy with constant switching frequency but lower
+                regulator efficiency
+            2 - Forced Low Power mode for improved regulator efficiency, used
+                when no heavy load is expected, will shut down unnecessary IP
+                blocks and secondary phases to reduce quiescent current.
+                This mode does not limit the maximum output current but unless
+                only a light load is applied, there will be regulation accuracy
+                and efficiency losses.
+        minItems: 1
+        maxItems: 3
+        items:
+          enum: [ 0, 1, 2 ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/spmi/spmi.h>
+
+    spmi {
+      #address-cells = <2>;
+      #size-cells = <0>;
+
+      pmic@7 {
+        compatible = "mediatek,mt6316d-regulator";
+        reg = <0x7 SPMI_USID>;
+
+        vbuck1234 {
+          regulator-name = "dvdd_gpustack";
+          regulator-min-microvolt = <400000>;
+          regulator-max-microvolt = <1277500>;
+          regulator-allowed-modes = <0 1 2>;
+          regulator-enable-ramp-delay = <256>;
+        };
+      };
+    };
+...
-- 
2.51.1


