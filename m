Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240D7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E37CDcKwNlS1KJdYO5G/GZFGxw5vqQLlpEIrB5c/JGQ=; b=aeR7RRY1SkGZOY
	yaOA1pP1md7rPilmTHOs8qfKV5yjnd6uZPOIwotT/RKvZLaWlFUPgQPKs6xxYciU9StQeFp/sMs+n
	xfoFf01c/TM34IaHFwa640N7scrHoaeJDIXSpF4IbsftPk+irx6IWjgSgCw+5ZvNY3cwuPtrFMb6E
	Yzh8vREx7XewUr1pHLAPYvHmt0KnkeT+fIn2CUIp8KaNR7nC2jKT50mpPaoZr+xE+dbBE/4XE+wOo
	RiAbGxtvkI26HGEbtb56yKiUi6rhtyrQQBKycY/n8OsrKpiKMzqwtA06NlEqH+PNjoXkIvUP2UzVu
	kQwlweSo4Efl3PGuV3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns2lJ-00CepQ-8T; Fri, 20 May 2022 13:33:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns2kj-00CeYU-Vj; Fri, 20 May 2022 13:33:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 479D21F463BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653053592;
 bh=nPTVwBA9HaQmt8ZBrYqe8lBcpkZGzyuUXdJGkjUqqGM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jBrouNEs75VxUIYnkRjqtd3s8kQF17MPQUc+PMXCzY+nmWl5Op/OPqMfRhlpUkkmo
 6UylEAf6BjNzPENa+wCXzQzwV3h8oMx+aafxGU94MuS4jtBa6wvt2XvXYJV9Efaj+H
 Ia+r4Vji3PkZ6K3yUcHeOCVivhFctxgn/rsPdfEPQ9ngd8c5PsqkjpW3nrf9fPX9zu
 k0JBA3Q8Iwjp8z4VxHdkk9uN77oPQs2SG6ueomfZbFEw5KSNaMLssJsfDt4WntAEJf
 keSiDbN8KKP97d5vgVIlSPxzP1IgYWSalM13JornZl+kE6HMdAt3nmYBKqYeLbZTL5
 s6z7cxRZpDuQw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 3/4] dt-bindings: regulator: Add bindings for MT6332 regulator
Date: Fri, 20 May 2022 15:33:04 +0200
Message-Id: <20220520133305.265310-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520133305.265310-1-angelogioacchino.delregno@collabora.com>
References: <20220520133305.265310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_063314_352030_C367315C 
X-CRM114-Status: GOOD (  11.69  )
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

Add devicetree bindings for the regulators found in the MT6332 PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/regulator/mt6332-regulator.yaml  | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6332-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mt6332-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6332-regulator.yaml
new file mode 100644
index 000000000000..51077a865dbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mt6332-regulator.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mt6332-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT6332 Regulator from MediaTek Integrated
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
+  List of regulators provided by this controller. It is named
+  according to its regulator type, buck_<name> and ldo_<name>.
+  MT6332 regulators node should be sub node of the MT6397 MFD node.
+
+patternProperties:
+  "^buck_v(dram|dvfs2|pa|rf18a|rf18b|sbst)$":
+    type: object
+    $ref: "regulator.yaml#"
+
+    properties:
+      regulator-name:
+        pattern: "^v(dram|dvfs2|pa|rf18a|rf18b|sbst)$"
+
+    unevaluatedProperties: false
+
+  "^ldo_v(bif28|dig18|sram|usb33)$":
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
