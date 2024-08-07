Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29553C52D6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Aug 2024 09:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4adnKWsx8j+xY9XsC5ULWsr2arXgZtlYtnwhVJWPCIA=; b=4XXipEuMUI3J+YtxcIEBLoQ6Lc
	q4l27hmxUBtz3boMzoeIHEHgaF9UMnF39tbEyoU5m8cMH2Xp3M398G0iYm/GFovmyzcB0qsVtGdNC
	tCc4Xm6Ei4EO6OtUTQxdWKSd66FXzEosPJM/sHxI4/ZcWj57AkdQ9l9CCehg07W2+2HGo8Rd8hBzI
	5jRAEJkmwzetGgwQ86X2WfNWNjF6UcGVcKe6KWaEgap4d/sNmfbwjA70QmFHETYRNRGiL285vXfvf
	MRsNoNR1Cq1umx1/wUOPe8P7z2g+C4ig+RbAP6Tp4tQSlXidB086A6F7BSr4gPDflADKVvN7Lf9+6
	MJY/wZ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbcpn-00000004Wce-2v8c;
	Wed, 07 Aug 2024 09:19:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbco2-00000004W0M-3UJs;
	Wed, 07 Aug 2024 09:18:08 +0000
X-UUID: f132c510549d11efa6c87f6b4542ff6b-20240807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4adnKWsx8j+xY9XsC5ULWsr2arXgZtlYtnwhVJWPCIA=;
	b=bOv9wSodG3YYF2vR5w9T9N7sqAGUswVch66rAt/Jp6MbzfG0aWISS1alZIxWIfPhrc+brqigOXYhutFTat3hequ2nFtqyOPEnMynAdlLfBIxo1lSqifq8cW6mD7TIj3Wzoh4gAo1yyIRWm9JJYADF4JLUwl79sulAQsmf4+T1IU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:88f32be4-faef-4074-9ef5-adf4fc355a30,IP:0,U
	RL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6dc6a47,CLOUDID:f44147fe-77bb-433c-b174-ffb8012693b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f132c510549d11efa6c87f6b4542ff6b-20240807
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1919303750; Wed, 07 Aug 2024 02:18:00 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Aug 2024 17:17:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Aug 2024 17:17:57 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, Sen
 Chu <sen.chu@mediatek.com>, Jason-ch Chen <Jason-ch.Chen@mediatek.com>,
	Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>, Chen-Yu
 Tsai <wenst@chromium.org>
Subject: [PATCH v2] dt-bindings: regulator: mediatek,mt6397-regulator: convert to YAML
Date: Wed, 7 Aug 2024 17:17:38 +0800
Message-ID: <20240807091738.18387-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_021806_914448_DD573614 
X-CRM114-Status: GOOD (  16.95  )
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

Convert the MediaTek MT6397 regulator bindings to DT schema.

Signed-off-by: Sen Chu <sen.chu@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../regulator/mediatek,mt6397-regulator.yaml  | 238 ++++++++++++++++++
 .../bindings/regulator/mt6397-regulator.txt   | 220 ----------------
 2 files changed, 238 insertions(+), 220 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6397-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6397-regulator.txt

Changes for v2:
 - Remove unnecessary regulator-compatibles.
 - Drop the top node of the parent device.
   Since the parent device is still in txt format,
   we are not moving this example to the parent device schema.
 - Use 4 spaces for indentation in the example.
 - Replace the old name in the example with the generic name "mt6397_regulators: regulators".

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6397-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6397-regulator.yaml
new file mode 100644
index 0000000..50db678
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6397-regulator.yaml
@@ -0,0 +1,238 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6397-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6397 Regulator
+
+maintainers:
+  - Sen Chu <sen.chu@mediatek.com>
+  - Macpaul Lin <macpaul.lin@mediatek.com>
+
+description:
+  Regulator node of the PMIC. This node should under the PMIC's device node.
+  All voltage regulators provided by the PMIC are described as sub-nodes of
+  this node.
+
+properties:
+  compatible:
+    items:
+      - const: mediatek,mt6397-regulator
+
+patternProperties:
+  "^(buck_)?v(core|drm|gpu|io18|pca(7|15)|sramca(7|15))$":
+    description: Buck regulators
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes:
+        description: |
+          BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
+          values specified in dt-bindings/regulator/mediatek,mt6397-regulator.h
+        items:
+          enum: [0, 1]
+    unevaluatedProperties: false
+
+  "^(ldo_)?v(tcxo|(a|io)28)$":
+    description: LDOs with fixed 2.8V output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
+    unevaluatedProperties: false
+
+  "^(ldo_)?vusb$":
+    description: LDOs with fixed 3.0V output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
+    unevaluatedProperties: false
+
+  "^(ldo_)?v(cama|emc3v3|gp[123456]|ibr|mc|mch)$":
+    description: LDOs with variable output and 0~100/10mV tuning
+    type: object
+    $ref: regulator.yaml#
+    properties:
+      regulator-allowed-modes: false
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mt6397_regulators: regulators {
+        compatible = "mediatek,mt6397-regulator";
+
+        mt6397_vpca15_reg: buck_vpca15 {
+            regulator-name = "vpca15";
+            regulator-min-microvolt = < 850000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-ramp-delay = <12500>;
+            regulator-enable-ramp-delay = <200>;
+        };
+
+        mt6397_vpca7_reg: buck_vpca7 {
+            regulator-name = "vpca7";
+            regulator-min-microvolt = < 850000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-ramp-delay = <12500>;
+            regulator-enable-ramp-delay = <115>;
+        };
+
+        mt6397_vsramca15_reg: buck_vsramca15 {
+            regulator-name = "vsramca15";
+            regulator-min-microvolt = < 850000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-ramp-delay = <12500>;
+            regulator-enable-ramp-delay = <115>;
+        };
+
+        mt6397_vsramca7_reg: buck_vsramca7 {
+            regulator-name = "vsramca7";
+            regulator-min-microvolt = < 850000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-ramp-delay = <12500>;
+            regulator-enable-ramp-delay = <115>;
+        };
+
+        mt6397_vcore_reg: buck_vcore {
+            regulator-name = "vcore";
+            regulator-min-microvolt = < 850000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-ramp-delay = <12500>;
+            regulator-enable-ramp-delay = <115>;
+        };
+
+        mt6397_vgpu_reg: buck_vgpu {
+            regulator-name = "vgpu";
+            regulator-min-microvolt = < 700000>;
+            regulator-max-microvolt = <1350000>;
+            regulator-ramp-delay = <12500>;
+            regulator-enable-ramp-delay = <115>;
+        };
+
+        mt6397_vdrm_reg: buck_vdrm {
+            regulator-name = "vdrm";
+            regulator-min-microvolt = < 800000>;
+            regulator-max-microvolt = <1400000>;
+            regulator-ramp-delay = <12500>;
+            regulator-enable-ramp-delay = <500>;
+        };
+
+        mt6397_vio18_reg: buck_vio18 {
+            regulator-name = "vio18";
+            regulator-min-microvolt = <1500000>;
+            regulator-max-microvolt = <2120000>;
+            regulator-ramp-delay = <12500>;
+            regulator-enable-ramp-delay = <500>;
+        };
+
+        mt6397_vtcxo_reg: ldo_vtcxo {
+            regulator-name = "vtcxo";
+            regulator-min-microvolt = <2800000>;
+            regulator-max-microvolt = <2800000>;
+            regulator-enable-ramp-delay = <90>;
+        };
+
+        mt6397_va28_reg: ldo_va28 {
+            regulator-name = "va28";
+            /* fixed output 2.8 V */
+            regulator-enable-ramp-delay = <218>;
+        };
+
+        mt6397_vcama_reg: ldo_vcama {
+            regulator-name = "vcama";
+            regulator-min-microvolt = <1500000>;
+            regulator-max-microvolt = <2800000>;
+            regulator-enable-ramp-delay = <218>;
+        };
+
+        mt6397_vio28_reg: ldo_vio28 {
+            regulator-name = "vio28";
+            /* fixed output 2.8 V */
+            regulator-enable-ramp-delay = <240>;
+        };
+
+        mt6397_usb_reg: ldo_vusb {
+            regulator-name = "vusb";
+            /* fixed output 3.3 V */
+            regulator-enable-ramp-delay = <218>;
+        };
+
+        mt6397_vmc_reg: ldo_vmc {
+            regulator-name = "vmc";
+            regulator-min-microvolt = <1800000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <218>;
+        };
+
+        mt6397_vmch_reg: ldo_vmch {
+            regulator-name = "vmch";
+            regulator-min-microvolt = <3000000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <218>;
+        };
+
+        mt6397_vemc_3v3_reg: ldo_vemc3v3 {
+            regulator-name = "vemc_3v3";
+            regulator-min-microvolt = <3000000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <218>;
+        };
+
+        mt6397_vgp1_reg: ldo_vgp1 {
+            regulator-name = "vcamd";
+            regulator-min-microvolt = <1220000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <240>;
+        };
+
+        mt6397_vgp2_reg: ldo_vgp2 {
+            regulator-name = "vcamio";
+            regulator-min-microvolt = <1000000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <218>;
+        };
+
+        mt6397_vgp3_reg: ldo_vgp3 {
+            regulator-name = "vcamaf";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <218>;
+        };
+
+        mt6397_vgp4_reg: ldo_vgp4 {
+            regulator-name = "vgp4";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <218>;
+        };
+
+        mt6397_vgp5_reg: ldo_vgp5 {
+            regulator-name = "vgp5";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3000000>;
+            regulator-enable-ramp-delay = <218>;
+        };
+
+        mt6397_vgp6_reg: ldo_vgp6 {
+            regulator-name = "vgp6";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <218>;
+        };
+
+        mt6397_vibr_reg: ldo_vibr {
+            regulator-name = "vibr";
+            regulator-min-microvolt = <1200000>;
+            regulator-max-microvolt = <3300000>;
+            regulator-enable-ramp-delay = <218>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
deleted file mode 100644
index c080086..0000000
--- a/Documentation/devicetree/bindings/regulator/mt6397-regulator.txt
+++ /dev/null
@@ -1,220 +0,0 @@
-Mediatek MT6397 Regulator
-
-Required properties:
-- compatible: "mediatek,mt6397-regulator"
-- mt6397regulator: List of regulators provided by this controller. It is named
-  according to its regulator type, buck_<name> and ldo_<name>.
-  The definition for each of these nodes is defined using the standard binding
-  for regulators at Documentation/devicetree/bindings/regulator/regulator.txt.
-
-The valid names for regulators are::
-BUCK:
-  buck_vpca15, buck_vpca7, buck_vsramca15, buck_vsramca7, buck_vcore, buck_vgpu,
-  buck_vdrm, buck_vio18
-LDO:
-  ldo_vtcxo, ldo_va28, ldo_vcama, ldo_vio28, ldo_vusb, ldo_vmc, ldo_vmch,
-  ldo_vemc3v3, ldo_vgp1, ldo_vgp2, ldo_vgp3, ldo_vgp4, ldo_vgp5, ldo_vgp6,
-  ldo_vibr
-
-BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
-values specified in dt-bindings/regulator/mediatek,mt6397-regulator.h
-
-Example:
-	pmic {
-		compatible = "mediatek,mt6397";
-
-		mt6397regulator: mt6397regulator {
-			compatible = "mediatek,mt6397-regulator";
-
-			mt6397_vpca15_reg: buck_vpca15 {
-				regulator-compatible = "buck_vpca15";
-				regulator-name = "vpca15";
-				regulator-min-microvolt = < 850000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <200>;
-			};
-
-			mt6397_vpca7_reg: buck_vpca7 {
-				regulator-compatible = "buck_vpca7";
-				regulator-name = "vpca7";
-				regulator-min-microvolt = < 850000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <115>;
-			};
-
-			mt6397_vsramca15_reg: buck_vsramca15 {
-				regulator-compatible = "buck_vsramca15";
-				regulator-name = "vsramca15";
-				regulator-min-microvolt = < 850000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <115>;
-
-			};
-
-			mt6397_vsramca7_reg: buck_vsramca7 {
-				regulator-compatible = "buck_vsramca7";
-				regulator-name = "vsramca7";
-				regulator-min-microvolt = < 850000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <115>;
-
-			};
-
-			mt6397_vcore_reg: buck_vcore {
-				regulator-compatible = "buck_vcore";
-				regulator-name = "vcore";
-				regulator-min-microvolt = < 850000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <115>;
-			};
-
-			mt6397_vgpu_reg: buck_vgpu {
-				regulator-compatible = "buck_vgpu";
-				regulator-name = "vgpu";
-				regulator-min-microvolt = < 700000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <115>;
-			};
-
-			mt6397_vdrm_reg: buck_vdrm {
-				regulator-compatible = "buck_vdrm";
-				regulator-name = "vdrm";
-				regulator-min-microvolt = < 800000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <500>;
-			};
-
-			mt6397_vio18_reg: buck_vio18 {
-				regulator-compatible = "buck_vio18";
-				regulator-name = "vio18";
-				regulator-min-microvolt = <1500000>;
-				regulator-max-microvolt = <2120000>;
-				regulator-ramp-delay = <12500>;
-				regulator-enable-ramp-delay = <500>;
-			};
-
-			mt6397_vtcxo_reg: ldo_vtcxo {
-				regulator-compatible = "ldo_vtcxo";
-				regulator-name = "vtcxo";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-				regulator-enable-ramp-delay = <90>;
-			};
-
-			mt6397_va28_reg: ldo_va28 {
-				regulator-compatible = "ldo_va28";
-				regulator-name = "va28";
-				/* fixed output 2.8 V */
-				regulator-enable-ramp-delay = <218>;
-			};
-
-			mt6397_vcama_reg: ldo_vcama {
-				regulator-compatible = "ldo_vcama";
-				regulator-name = "vcama";
-				regulator-min-microvolt = <1500000>;
-				regulator-max-microvolt = <2800000>;
-				regulator-enable-ramp-delay = <218>;
-			};
-
-			mt6397_vio28_reg: ldo_vio28 {
-				regulator-compatible = "ldo_vio28";
-				regulator-name = "vio28";
-				/* fixed output 2.8 V */
-				regulator-enable-ramp-delay = <240>;
-			};
-
-			mt6397_usb_reg: ldo_vusb {
-				regulator-compatible = "ldo_vusb";
-				regulator-name = "vusb";
-				/* fixed output 3.3 V */
-				regulator-enable-ramp-delay = <218>;
-			};
-
-			mt6397_vmc_reg: ldo_vmc {
-				regulator-compatible = "ldo_vmc";
-				regulator-name = "vmc";
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
-			};
-
-			mt6397_vmch_reg: ldo_vmch {
-				regulator-compatible = "ldo_vmch";
-				regulator-name = "vmch";
-				regulator-min-microvolt = <3000000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
-			};
-
-			mt6397_vemc_3v3_reg: ldo_vemc3v3 {
-				regulator-compatible = "ldo_vemc3v3";
-				regulator-name = "vemc_3v3";
-				regulator-min-microvolt = <3000000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
-			};
-
-			mt6397_vgp1_reg: ldo_vgp1 {
-				regulator-compatible = "ldo_vgp1";
-				regulator-name = "vcamd";
-				regulator-min-microvolt = <1220000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <240>;
-			};
-
-			mt6397_vgp2_reg: ldo_vgp2 {
-				egulator-compatible = "ldo_vgp2";
-				regulator-name = "vcamio";
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
-			};
-
-			mt6397_vgp3_reg: ldo_vgp3 {
-				regulator-compatible = "ldo_vgp3";
-				regulator-name = "vcamaf";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
-			};
-
-			mt6397_vgp4_reg: ldo_vgp4 {
-				regulator-compatible = "ldo_vgp4";
-				regulator-name = "vgp4";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
-			};
-
-			mt6397_vgp5_reg: ldo_vgp5 {
-				regulator-compatible = "ldo_vgp5";
-				regulator-name = "vgp5";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3000000>;
-				regulator-enable-ramp-delay = <218>;
-			};
-
-			mt6397_vgp6_reg: ldo_vgp6 {
-				regulator-compatible = "ldo_vgp6";
-				regulator-name = "vgp6";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
-			};
-
-			mt6397_vibr_reg: ldo_vibr {
-				regulator-compatible = "ldo_vibr";
-				regulator-name = "vibr";
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-enable-ramp-delay = <218>;
-			};
-		};
-	};
-- 
2.18.0


