Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F394C04FF9
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wa1QD1SgAGAaEYWahTilgHkzWolAwHFEyyij2yf+aPk=; b=LFLm4V48S/8M1Ir5m9Ibm6lCjA
	Ol4pAjfcZZ5sstnnppdYjeZWzUojhSH9JLASi/rvflP1afVasEBsayhUP4tuQsMAAdgEARCHfEwIh
	VMFx3wE6AfHKzLuWate3G/S3OzJyAN+Cze4alEGM0PkKkggRaCWRzK48eg/GApAhsnDx13822NQNK
	T1Sy9HodM5Y4py3BRuf7+9Pg+sh7Yvzma4Q3tIppHIl0AWzIMMTc/tK8UpQMgQ0JgbSEN1OeeXqCy
	/Y8MMth1+xKWxOULiZzdIQcKKuF8bUX5AW8r226BVIIEXXY2wX+kYayfO004iWCEWSv+X3cp80oLJ
	hMFtMDrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1Ne-0000000FMgV-2ngG;
	Wed, 17 Apr 2024 09:15:02 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1NS-0000000FMYO-1amj;
	Wed, 17 Apr 2024 09:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713345287;
	bh=pqobeqHfUVbkypqHwHSiTkFR/HCjK7XkjC8AjPfYgX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=noC8WT9nMOVHMivvk5E86wS0K0xe7U7pcqTdYF6o82RCaJUy7Bb4pnU1rmn4NtoIW
	 0KpDMmIYs1M0IBTBnjhtEw1U0oDUp5myi2V1WvylkYOwL74Bf7ggl1t9etkG0Pjwa/
	 A+Pf9FYps396ki1qrpOe8d10btmQkGLkqoUvNmcBeVbwk+jO7MEvQikDkCGUjui3XF
	 D7jV09wM7BK+BnfqcGvIonfV0ZUDNyZmfklFQongeQikMtdzIxTOKSuKhY9zt3dSjk
	 tQqiq85aPurX3+G9nljn5uaL65rfHJF2cv8k4sB7ICnteqOSpPHsmWax6f51GcIyeg
	 fpP5dAwVcO1VA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 988E637820F9;
	Wed, 17 Apr 2024 09:14:46 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: djakov@kernel.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	keescook@chromium.org,
	gustavoars@kernel.org,
	henryc.chen@mediatek.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	amergnat@baylibre.com
Subject: [PATCH v2 1/7] dt-bindings: regulator: Add bindings for MediaTek DVFSRC Regulators
Date: Wed, 17 Apr 2024 11:14:36 +0200
Message-ID: <20240417091442.170505-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
References: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_021450_709643_40033A0D 
X-CRM114-Status: GOOD (  12.32  )
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

The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
are controlled with votes to the DVFSRC hardware.

This adds support for the regulators found in MT6873, MT8183, MT8192
and MT8195 SoCs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek,mt6873-dvfsrc-regulator.yaml     | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
new file mode 100644
index 000000000000..446f1dab4d2e
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6873-dvfsrc-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek DVFSRC-controlled Regulators
+
+description:
+  The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
+  are controlled with votes to the DVFSRC hardware.
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6873-dvfsrc-regulator
+      - mediatek,mt8183-dvfsrc-regulator
+      - mediatek,mt8192-dvfsrc-regulator
+      - mediatek,mt8195-dvfsrc-regulator
+
+  reg:
+    maxItems: 1
+
+  dvfsrc-vcore:
+    description: DVFSRC-controlled SoC Vcore regulator
+    $ref: regulator.yaml#
+
+  dvfsrc-vscp:
+    description: DVFSRC-controlled System Control Processor regulator
+    $ref: regulator.yaml#
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        system-controller@10012000 {
+            compatible = "mediatek,mt8195-dvfsrc";
+            reg = <0 0x10012000 0 0x1000>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            regulators@0 {
+                compatible = "mediatek,mt8195-dvfsrc-regulator";
+                reg = <0>;
+
+                dvfsrc_vcore: dvfsrc-vcore {
+                        regulator-name = "dvfsrc-vcore";
+                        regulator-min-microvolt = <550000>;
+                        regulator-max-microvolt = <750000>;
+                        regulator-always-on;
+                };
+
+                dvfsrc_vscp: dvfsrc-vscp {
+                        regulator-name = "dvfsrc-vscp";
+                        regulator-min-microvolt = <550000>;
+                        regulator-max-microvolt = <750000>;
+                        regulator-always-on;
+                };
+            };
+        };
+    };
-- 
2.44.0


