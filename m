Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1113CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KQLZ2qLl8BL2sUbcC7Zi2DwAgpKq4SMqXfFdVcailE=; b=evCplKcZGgtKBRyCzVS0Lx8gSA
	Ngq2pw9NNfn4zmtPhaUwadIjrnLxpBrSn9qzzFfFp55Mpf1zXH+RLELeaul/CS7ZrugioX+YUiaUy
	aldY4dGaU2cPIAS5gj49AYjxwFVGYAlAL5QB2IRBvFv5hkjsFQgfJPFzjO5ynTD07FXD/T8tvxlqw
	cbybe/pVE0noJycva82pH9sAvdNtjKy3byaZ37v37VIyockCX7zQj4CviacVAh4u8CMp3QEwIL4Ie
	0lXBjybv8hE1Un5dxsEwG/pJhdzIO8zBV3QqsOC2uFrxg+xUM+HoHmD3LZVlzIX7f2K1EmUXCuJup
	6lzeXjtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o928J-008MDj-ET; Wed, 06 Jul 2022 10:19:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91yj-008CJW-QK; Wed, 06 Jul 2022 10:09:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9KQLZ2qLl8BL2sUbcC7Zi2DwAgpKq4SMqXfFdVcailE=; b=aGrrfX3BpgvfrJkIhEVlA0zVVW
	wspwV/oFLIaf1Su74KjbMxdjPCT45R2krH8r2b8wZRyOLqc5noih8qZ97quhtnxBRhewhTeZHmGYI
	j0xRAJjeHVxOarBpGtrWoQ8TDP+GiEAZY/dldeSEvvZmS3jFvmBA0a0Tix2QoYVBLuDHUvj8jZkas
	dFhKrEHylYOaOesi6oYB1+Uh/Qb+P4t5msd2QnHk6MeEz3mur5Za1f4ax+oAlrVvLsw4kk4+jeaKM
	GWR51w5svEmS3CyPXFcwvkYCiIwkQ5v8Q6io5wZ/+6RbraKEmDJWMWkOUNgRR65cv6QylM1YPiAPc
	4PCEi7UQ==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91yZ-000QCG-Li; Wed, 06 Jul 2022 10:09:48 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5341266019AD;
	Wed,  6 Jul 2022 11:09:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657102175;
	bh=T0tU/lb8YtDoLpRtMimEkduNgrWuEXr/0eb5CngrqLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n2WPGJ5XjlFdYBtc8dszkzKXlTRzqVHccAdUehys7OUzovAuLk+DtdqFQjU+Re29O
	 RsvXxpVnfwuiulMcUGsQxiHeXjYoq4EtqJ2cbdJzIkrma5eH2ie4Euj3bGKcUOEbQ5
	 yLFqrBZGOn3ey1oyh5gSYl6fV1kpC1cgwzC2SN1DBj9IBOkRoWP9CTQpfFMvghH/Ct
	 eqBTqKHbzMRbJlnmXqtXLMyfVD2JOpX52y558WNb92wTK2frKehET6FzeG82UytnAX
	 3MHhgIjmmqJ6duHWWBiRTCFn5pHur6zTLjtaOpTOVGy1xLFba4X3ZDeGc06Jq1Sckq
	 9V1qQJITiZOmg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 RESEND 3/4] dt-bindings: regulator: Add bindings for MT6332 regulator
Date: Wed,  6 Jul 2022 12:09:11 +0200
Message-Id: <20220706100912.200698-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706100912.200698-1-angelogioacchino.delregno@collabora.com>
References: <20220706100912.200698-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_110945_708803_33197E82 
X-CRM114-Status: GOOD (  11.50  )
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
2.35.1


