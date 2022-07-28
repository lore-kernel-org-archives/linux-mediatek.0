Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8348C19F2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 06:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjPN4iQuxSkLHHQIS6M1G3eCvmTMRRxDqO2Cnif8juw=; b=kq3O9xpM8PDRlEnHZVSloqSIAx
	iGd9iX/JiN2DMzkeWJqeS4UePtKXwR8A1sKd+eDYGOnLA+7WkFdecW3BegJVSaLf14dvo9uxkbIhU
	T2+79ghRCvVX8ufKNyAgitpGtZ1UR5d8mK/zBlgPq6okKL59ENHsBBkzBu5QBmTuXjobigX4jD2dS
	aqf90XE58t4PpT4Og4KCD4VnroihDzPk+EO9VyWFBbdSTle5I2d1Zy1oRoEe1Rcz25a23FxO3SF/g
	SN4tv/5dVAF37C7NnpKwTgva53Givjdm3AFLsAByf1qDmc+z57qxkMPvQ2kYDig+o4Yn9YJw5XaXK
	2TwI52Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGx0a-0052EM-IK; Thu, 28 Jul 2022 06:28:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGx0X-00529Q-63; Thu, 28 Jul 2022 06:28:31 +0000
X-UUID: 99c04c1c95464956be78848a151ce92f-20220727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a6d42c9a-054b-4f65-a5ee-ffd2e862fce1,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:0f94e32,CLOUDID:72568dd0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 99c04c1c95464956be78848a151ce92f-20220727
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1872828738; Wed, 27 Jul 2022 23:28:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 28 Jul 2022 14:27:54 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Jul 2022 14:27:53 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <eddie.huang@mediatek.com>,
	<a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <sen.chu@mediatek.com>, <hui.liu@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <zhiyong.tao@mediatek.com>,
	<hsin-hsiung.wang@mediatek.com>, <sean.wang@mediatek.com>,
	<macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	zhiyong tao <zhiyong.tao@mediatk.com>
Subject: [PATCH v2] pmic: add mt6366 regulator document
Date: Thu, 28 Jul 2022 14:27:49 +0800
Message-ID: <20220728062749.18701-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
References: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_232829_262519_DDC52D63 
X-CRM114-Status: GOOD (  10.56  )
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

From: zhiyong tao <zhiyong.tao@mediatek.com>

Add mt6366 regulator document

Signed-off-by: zhiyong tao <zhiyong.tao@mediatk.com>
---
 .../regulator/mediatek,mt6366-regulator.yaml  | 375 ++++++++++++++++++
 1 file changed, 375 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
new file mode 100755
index 000000000000..eb72c64757cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml
@@ -0,0 +1,375 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6366-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MT6366 Regulator from MediaTek Integrated
+
+maintainers:
+  - Zhiyong Tao <zhiyong.tao@mediatek.com>
+
+description: |
+  List of regulators provided by this controller. It is named
+  according to its regulator type, buck_<name> and ldo_<name>.
+  MT6366 regulators node should be sub node of the MT6397 MFD node.
+
+properties:
+  compatible:
+    const: mediatek,mt6366-regulator
+
+  regulators:
+    type: object
+    description: List of regulators and its properties
+
+    patternProperties:
+      "^buck-v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
+        type: object
+        $ref: "regulator.yaml#"
+        unevaluatedProperties: false
+
+        properties:
+          regulator-name:
+            pattern: "^v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$"
+
+      "^ldo-v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$"
+
+      "^ldo-v(xo22|efuse|mch|vcama1|emc|a12|vcama2|mc)$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^v(xo22|efuse|mch|vcama1|emc|a12|vcama2|mc)$"
+
+      "^buck-(vcore)-sshub$":
+        type: object
+        $ref: "regulator.yaml#"
+        unevaluatedProperties: false
+
+        properties:
+          regulator-name:
+            pattern: "^vcore-sshub$"
+
+      "^ldo-vcn(28|33)-bt$":
+        type: object
+        $ref: "regulator.yaml#"
+        unevaluatedProperties: false
+
+        properties:
+          regulator-name:
+            pattern: "^vcn(28|33)-bt$"
+
+      "^ldo-vcn(33)-wifi$":
+        type: object
+        $ref: "regulator.yaml#"
+        unevaluatedProperties: false
+
+        properties:
+          regulator-name:
+            pattern: "^vcn33-wifi$"
+
+      "^ldo-vsram-(others)-sshub$":
+        type: object
+        $ref: "regulator.yaml#"
+        unevaluatedProperties: false
+
+        properties:
+          regulator-name:
+            pattern: "^vsram-others-sshub$"
+
+      "^ldo-vsram-(proc11|others|gpu|proc12)$":
+        type: object
+        $ref: "regulator.yaml#"
+        unevaluatedProperties: false
+
+        properties:
+          regulator-name:
+            pattern: "^vsram-(proc11|others|gpu|proc12)$"
+
+      "^ldo-v(aud|bif|io|ldo)28$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^v(aud|bif|io|ldo)28$"
+
+      "^ldo-v(io|aux|rf)18$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^v(io|aux|rf)18$"
+
+      "^ldo-vsim[2]$":
+        type: object
+        $ref: "regulator.yaml#"
+
+        properties:
+          regulator-name:
+            pattern: "^vsim2$"
+
+        required:
+          - regulator-name
+
+required:
+  - compatible
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+      compatible = "mediatek,mt6366-regulator";
+
+      regulators {
+        mt6366_vdram1_reg: buck-vdram1 {
+            regulator-name = "vdram1";
+            regulator-ramp-delay = <12500>;
+            regulator-enable-ramp-delay = <0>;
+            regulator-allowed-modes = <0 1>;
+        };
+
+        mt6366_vcore_reg: buck-vcore {
+            regulator-name = "vcore";
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <200>;
+            regulator-allowed-modes = <0 1>;
+        };
+
+       mt6366_vproc11_reg: buck-vproc11 {
+            regulator-name = "vproc11";
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <200>;
+            regulator-allowed-modes = <0 1>;
+        };
+
+        mt6366_vproc12_reg: buck-vproc12 {
+            regulator-name = "vproc12";
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <200>;
+            regulator-allowed-modes = <0 1>;
+        };
+
+        mt6366_vgpu_reg: buck-vgpu {
+            regulator-name = "vgpu";
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <200>;
+            regulator-allowed-modes = <0 1>;
+        };
+
+        mt6366_vs2_reg: buck-vs2 {
+            regulator-name = "vs2";
+            regulator-ramp-delay = <12500>;
+            regulator-enable-ramp-delay = <0>;
+        };
+
+       mt6366_vmodem_reg: buck-vmodem {
+            regulator-name = "vmodem";
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <900>;
+            regulator-allowed-modes = <0 1>;
+        };
+
+        mt6366_vs1_reg: buck-vs1 {
+            regulator-name = "vs1";
+            regulator-ramp-delay = <12500>;
+            regulator-enable-ramp-delay = <0>;
+        };
+
+        mt6366_vdram2_reg: ldo-vdram2 {
+            regulator-name = "vdram2";
+            regulator-enable-ramp-delay = <3300>;
+        };
+
+        mt6366_vsim1_reg: ldo-vsim1 {
+            regulator-name = "vsim1";
+            regulator-enable-ramp-delay = <540>;
+        };
+
+        mt6366_vibr_reg: ldo-vibr {
+            regulator-name = "vibr";
+            regulator-enable-ramp-delay = <60>;
+        };
+
+        mt6366_vrf12_reg: ldo-vrf12 {
+            compatible = "regulator-fixed";
+            regulator-name = "vrf12";
+            regulator-enable-ramp-delay = <120>;
+        };
+
+        mt6366_vio18_reg: ldo-vio18 {
+            compatible = "regulator-fixed";
+            regulator-name = "vio18";
+            regulator-enable-ramp-delay = <2700>;
+        };
+
+        mt6366_vusb_reg: ldo-vusb {
+            regulator-name = "vusb";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_vcamio_reg: ldo-vcamio {
+            compatible = "regulator-fixed";
+            regulator-name = "vcamio";
+            regulator-enable-ramp-delay = <325>;
+        };
+
+        mt6366_vcamd_reg: ldo-vcamd {
+            regulator-name = "vcamd";
+            regulator-enable-ramp-delay = <325>;
+        };
+
+        mt6366_vcn18_reg: ldo-vcn18 {
+            compatible = "regulator-fixed";
+            regulator-name = "vcn18";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_vfe28_reg: ldo-vfe28 {
+            compatible = "regulator-fixed";
+            regulator-name = "vfe28";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_vsram_proc11_reg: ldo-vsram-proc11 {
+            regulator-name = "vsram-proc11";
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <240>;
+        };
+
+        mt6366_vcn28_reg: ldo-vcn28 {
+            compatible = "regulator-fixed";
+            regulator-name = "vcn28";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_vsram_others_reg: ldo-vsram-others {
+            regulator-name = "vsram-others";
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <240>;
+        };
+
+        mt6366_vsram_gpu_reg: ldo-vsram-gpu {
+            regulator-name = "vsram-gpu";
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <240>;
+        };
+
+        mt6366_vxo22_reg: ldo-vxo22 {
+            compatible = "regulator-fixed";
+            regulator-name = "vxo22";
+            regulator-enable-ramp-delay = <120>;
+        };
+
+        mt6366_vefuse_reg: ldo-vefuse {
+            regulator-name = "vefuse";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_vaux18_reg: ldo-vaux18 {
+            compatible = "regulator-fixed";
+            regulator-name = "vaux18";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_vmch_reg: ldo-vmch {
+            regulator-name = "vmch";
+            regulator-enable-ramp-delay = <60>;
+        };
+
+        mt6366_vbif28_reg: ldo-vbif28 {
+            compatible = "regulator-fixed";
+            regulator-name = "vbif28";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_vsram_proc12_reg: ldo-vsram-proc12 {
+            regulator-name = "vsram-proc12";
+            regulator-ramp-delay = <6250>;
+            regulator-enable-ramp-delay = <240>;
+        };
+
+        mt6366_vcama1_reg: ldo-vcama1 {
+            regulator-name = "vcama1";
+            regulator-enable-ramp-delay = <325>;
+        };
+
+        mt6366_vemc_reg: ldo-vemc {
+            regulator-name = "vemc";
+            regulator-enable-ramp-delay = <60>;
+        };
+
+        mt6366_vio28_reg: ldo-vio28 {
+            compatible = "regulator-fixed";
+            regulator-name = "vio28";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_va12_reg: ldo-va12 {
+            compatible = "regulator-fixed";
+            regulator-name = "va12";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_vrf18_reg: ldo-vrf18 {
+            compatible = "regulator-fixed";
+            regulator-name = "vrf18";
+            regulator-enable-ramp-delay = <120>;
+        };
+
+        mt6366_vcn33_bt_reg: ldo-vcn33-bt {
+            regulator-name = "vcn33-bt";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_vcn33_wifi_reg: ldo-vcn33-wifi {
+            regulator-name = "vcn33-wifi";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_vcama2_reg: ldo-vcama2 {
+            regulator-name = "vcama2";
+            regulator-enable-ramp-delay = <325>;
+        };
+
+        mt6366_vmc_reg: ldo-vmc {
+            regulator-name = "vmc";
+            regulator-enable-ramp-delay = <60>;
+        };
+
+        mt6366_vldo28_reg: ldo-vldo28 {
+            regulator-name = "vldo28";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_vaud28_reg: ldo-vaud28 {
+            compatible = "regulator-fixed";
+            regulator-name = "vaud28";
+            regulator-enable-ramp-delay = <270>;
+        };
+
+        mt6366_vsim2_reg: ldo-vsim2 {
+            regulator-name = "vsim2";
+            regulator-enable-ramp-delay = <540>;
+        };
+
+        mt6366_vcore_sshub_reg: buck-vcore-sshub {
+            regulator-name = "vcore-sshub";
+        };
+
+        mt6366_vsram_others_sshub_reg: ldo-vsram-others-sshub {
+            regulator-name = "vsram-others-sshub";
+        };
+      };
+    };
+...
-- 
2.18.0


