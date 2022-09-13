Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC56C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 12:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GH3VFBgO6aIXos2r+PZIPdYsPBAj8ApjmaHqu5zqrEw=; b=qelXjfSJaarU8HHi7+1YJtHuLl
	lnczOrUJvnAZ4b/0pQcHf98xECG5/q39XDli89+HrMPPbMd6//9YIvmEH4bzq4fAXwQ4YfkfBFNzQ
	lEMqNkvjQfA9q8YGQYcuIoUNWuNHo9BmKR5o49ePah1RkM+e68ha+vRJsuTfwQ6myk84Ka2hk1Yf0
	QPb9Cu5ckxgt7K0UzdqbRm6/RPUvgQeTjZlP7RguSN6LijMdHDb92wJmi1GuSkJQ8mdka/kRKRWOV
	x8jAzqq1hUGPhMypjgNhKKwCgkkKMvSL/4Dwc4U7A9I1JAGa5lmaDmY+aQNAXZHfi4WAtoXUAB3d7
	twosDy0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY59f-00A4Wp-25; Tue, 13 Sep 2022 12:36:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY588-00A3X6-0a; Tue, 13 Sep 2022 12:35:13 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 295EF660201D;
	Tue, 13 Sep 2022 13:35:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663072506;
	bh=pvp7JpbvP2wUE/GSoJ9vSVrGywl5jvUyvOohfAa1vmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QgkIiGXPktZRTFsgeevLCHatTdBsOTsNsLS+DnCOZOM8bGhpQ42qIh4ZF4bshM8b9
	 PpCyR2WOl+4FS3nCdchM/A0kB2XpB6JzXjXeLkR9IKSxrbYtAbPmRrY55Vw3vFwRux
	 J+r77r594sWBV44jg0sTdPpq0Y31PQiPYCNDr9mMyPAT+G756G27L/uNrykbDvpkLx
	 eHo32ovusLOv0QjJyty5zJpJTjlSq4AF9h/j3znRB2VsiflOGHN6Zdv+rPJfaAji0S
	 AEF5YzRyi/YFrjb0NGU/SNNsVr8wx/ypevJ7sDJB0qmUNs/DTRe0p6Zd44vsSExaSg
	 EhbAu/RIcgv4g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 3/4] dt-bindings: regulator: Add bindings for MT6332 regulator
Date: Tue, 13 Sep 2022 14:34:55 +0200
Message-Id: <20220913123456.384513-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913123456.384513-1-angelogioacchino.delregno@collabora.com>
References: <20220913123456.384513-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_053508_431545_E1608B93 
X-CRM114-Status: GOOD (  11.55  )
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

Add devicetree bindings for the regulators found in the MT6332 PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../regulator/mediatek,mt6332-regulator.yaml  | 112 ++++++++++++++++++
 1 file changed, 112 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml
new file mode 100644
index 000000000000..3218f43e6957
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6332-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT6332 Regulator from MediaTek Integrated
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  The MT6332 Companion PMIC provides 6 BUCK and 4 LDO (Low Dropout)
+  regulators and nodes are named according to the regulator type:
+  buck-<name> and ldo-<name>.
+  MT6332 regulators node should be sub node of the MT6397 MFD node.
+
+patternProperties:
+  "^buck-v(dram|dvfs2|pa|rf18a|rf18b|sbst)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(dram|dvfs2|pa|rf18a|rf18b|sbst)$"
+
+    unevaluatedProperties: false
+
+  "^ldo-v(bif28|dig18|sram|usb33)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(bif28|dig18|sram|usb33)$"
+
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      regulators {
+        mt6332_vdram_reg: buck-vdram {
+          regulator-name = "vdram";
+          regulator-min-microvolt = <700000>;
+          regulator-max-microvolt = <1493750>;
+          regulator-ramp-delay = <12500>;
+          regulator-allowed-modes = <0 1>;
+          regulator-always-on;
+        };
+        mt6332_vdvfs2_reg: buck-vdvfs2 {
+          regulator-name = "vdvfs2";
+          regulator-min-microvolt = <700000>;
+          regulator-max-microvolt = <1312500>;
+          regulator-ramp-delay = <12500>;
+          regulator-enable-ramp-delay = <1>;
+          regulator-allowed-modes = <0 1>;
+        };
+        mt6332_vpa_reg: buck-vpa {
+          regulator-name = "vpa";
+          regulator-min-microvolt = <500000>;
+          regulator-max-microvolt = <3400000>;
+        };
+        mt6332_vrf18a_reg: buck-vrf18a {
+          regulator-name = "vrf18a";
+          regulator-min-microvolt = <1050000>;
+          regulator-max-microvolt = <2240625>;
+          regulator-allowed-modes = <0 1>;
+        };
+        mt6332_vrf18b_reg: buck-vrf18b {
+          regulator-name = "vrf18b";
+          regulator-min-microvolt = <1050000>;
+          regulator-max-microvolt = <2240625>;
+          regulator-allowed-modes = <0 1>;
+        };
+        mt6332_vsbst_reg: buck-vsbst {
+          regulator-name = "vsbst";
+          regulator-min-microvolt = <3500000>;
+          regulator-max-microvolt = <7468750>;
+        };
+        mt6332_vauxb32_reg: ldo-vauxb32 {
+          regulator-name = "vauxb32";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <3200000>;
+        };
+        mt6332_vbif28_reg: ldo-vbif28 {
+          regulator-name = "vbif28";
+          regulator-min-microvolt = <2800000>;
+          regulator-max-microvolt = <2800000>;
+        };
+        mt6332_vdig18_reg: ldo-vdig18 {
+          regulator-name = "vdig18";
+          regulator-min-microvolt = <1200000>;
+          regulator-max-microvolt = <1800000>;
+          regulator-always-on;
+        };
+        mt6332_vsram_reg: ldo-vsram {
+          regulator-name = "vauxa32";
+          regulator-min-microvolt = <700000>;
+          regulator-max-microvolt = <1493750>;
+          regulator-always-on;
+        };
+        mt6332_vusb33_reg: ldo-vusb33 {
+          regulator-name = "vusb33";
+          regulator-min-microvolt = <3300000>;
+          regulator-max-microvolt = <3300000>;
+        };
+      };
+    };
+...
-- 
2.37.2


