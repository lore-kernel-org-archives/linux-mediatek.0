Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CAECD37B5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 10:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NwF4h5ugze0LK451cuV63TaMRlw7jDwkWsGONnDQ90=; b=10ug/+ZByxS9HQTMVCKYBNv4ss
	50cRgCFBZ7dOZB02M9/q4kSY9YGdm8s02uBif3kWMEZLCqrfVLwnTu5gnXwXTMAN4rcmeDzph3WhE
	V81mjuAhMxWILzIBBHGOAHBLjmgyFOpue87sVwN3eMfPRxR7DkrsGEpl9Xj5pWEfX6wt89gFqPBqM
	MX25MP1W9KOWzU6Tj40KQfHN0tq2qxAR/F7yu/Jl+arDC/sb6BAt9+XT3Bnx93GWw/A64lXMkuRew
	AiZd7ebWbckFA1u2rD5gnzfAiDoXR9rU5p0q8lLhYQwV6ZdIz7pH0SpMcK7cn2xKoJFKDr38uwlww
	6de0plUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNeO-0000000D4bC-08wp;
	Mon, 11 May 2026 10:14:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMNeJ-0000000D4Yt-01ch;
	Mon, 11 May 2026 10:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778494445;
	bh=oy677+AficecGZ1tgZGCOtIHFtbKfj3yjUYCiUBNLdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SJBJ2bsd2llmHR+MBotDbFsoxzNz7wOjl3JI1IAQhy8yTztC1F9qBY25PV/gYzkXV
	 aNR8xptvKAvXuZPQfxte6E70x/mxe7XmbrbBh5wnzAMXneRJI9RSp/7OnpjpV4czEf
	 wakJohqLVWYD6/mUQKnMmqZDhRUVg5bMMGFAsZgF5ILl5QzkY3XsVjJMazqcSvibNy
	 Q6YdSAaJ02MUIGRQsFwTtMMFOZsL046CcZ0KLDAkC+A9d4mrIqt3T2XFgnty/czY3W
	 7i4RNJjAzerKX3UI+XRQ1H6CIUHRrrS7BK3hiTmBzQZC2ORHzNRdQf8slWPtEleeoi
	 AC9f+VPHuoiTQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B078217E138B;
	Mon, 11 May 2026 12:14:04 +0200 (CEST)
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
	wenst@chromium.org
Subject: [PATCH v12 1/5] dt-bindings: regulator: Document MediaTek MT6373 PMIC Regulators
Date: Mon, 11 May 2026 12:13:51 +0200
Message-ID: <20260511101355.122478-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_031407_188130_0BEE0DAA 
X-CRM114-Status: GOOD (  12.79  )
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

Add bindings for the regulators found in the MediaTek MT6363 PMIC,
usually found in board designs using the MT6991 Dimensity 9400 and
on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
MT6363 PMICs.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../regulator/mediatek,mt6373-regulator.yaml  | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
new file mode 100644
index 000000000000..4562f291fc0a
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6373-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6373 PMIC Regulators
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MT6373 SPMI PMIC provides 10 BUCK and 23 LDO (Low DropOut) regulators
+  and can optionally provide overcurrent warnings with one ocp interrupt
+  for each voltage regulator.
+
+properties:
+  compatible:
+    const: mediatek,mt6373-regulator
+
+  reg:
+    maxItems: 1
+
+  vsys-vbuck0-supply:
+    description: Input supply for vbuck0
+
+  vsys-vbuck1-supply:
+    description: Input supply for vbuck1
+
+  vsys-vbuck2-supply:
+    description: Input supply for vbuck2
+
+  vsys-vbuck3-supply:
+    description: Input supply for vbuck3
+
+  vsys-vbuck4-supply:
+    description: Input supply for vbuck4
+
+  vsys-vbuck5-supply:
+    description: Input supply for vbuck5
+
+  vsys-vbuck6-supply:
+    description: Input supply for vbuck6
+
+  vsys-vbuck7-supply:
+    description: Input supply for vbuck7
+
+  vsys-vbuck8-supply:
+    description: Input supply for vbuck8
+
+  vsys-vbuck9-supply:
+    description: Input supply for vbuck9
+
+  vs1-ldo1-supply:
+    description: Input supply for vant18, vaud18, vcn18io
+
+  vs2-ldo1-supply:
+    description: Input supply for vrf12-aif, vrf13-aif
+
+  vs3-ldo1-supply:
+    description: Input supply for vrf09-aif, vsram-digrf-aif
+
+  vsys-ldo1-supply:
+    description: Input supply for vcn33-1, vcn33-2, vmc
+
+  vsys-ldo2-supply:
+    description:
+      Input supply for vaux18, vcn33-3, vefuse, vfp, vibr, vio28, vtp, vusb
+
+  vsys-ldo3-supply:
+    description: Input supply for vmch, vmch-eint-high/low
+
+patternProperties:
+  "^v(ant|aud|aux)18$":
+    $ref: "#/$defs/ldo-common"
+
+  "^vbuck[0-9]$":
+    type: object
+    $ref: regulator.yaml#
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
+                when no heavy load is expected, does not limit the maximum out
+                current but unless only a light load is applied, there will be
+                regulation accuracy and efficiency losses.
+            3 - Forced Ultra Low Power mode for ultra low load, this greatly
+                reduces the maximum output power, makes the regulator to be
+                efficient only for ultra light load, and greatly reduces the
+                quiescent current (Iq) of the buck.
+        maxItems: 3
+        items:
+          enum: [ 0, 1, 2, 3 ]
+    unevaluatedProperties: false
+
+  "^v(cn18io|cn33-[123]|efuse|fp|tp|ibr|io28|sram-digrf-aif|usb)$":
+    $ref: "#/$defs/ldo-common"
+
+  "^vmc(h)?$":
+    $ref: "#/$defs/ldo-common"
+
+  "^vmch-eint-(low|high)$":
+    $ref: "#/$defs/ldo-common"
+
+  "^vrf(09|12|13|18|io18)-aif$":
+    $ref: "#/$defs/ldo-common"
+
+$defs:
+  ldo-common:
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-allowed-modes:
+        description: |
+          Allowed LDO regulator operating modes allowed. Valid values below.
+            0 - Normal mode with automatic power saving, reducing the switching
+                frequency when light load conditions are detected
+            2 - Forced Low Power mode for improved regulator efficiency, used
+                when no heavy load is expected, does not limit the maximum out
+                current but unless only a light load is applied, there will be
+                regulation accuracy and efficiency losses.
+        maxItems: 2
+        items:
+          enum: [ 0, 2 ]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
-- 
2.53.0


