Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095A3CA0FE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 11:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWhruOowdkt/xBKckPdvEO46w+VbVE01+k4IFay5Duo=; b=mIc0NhY7ZrtOZuPfAIlibfq46Y
	eWBPjIb4fh+kuv0bmuyJFgXtJ+x8vVkKuwH5AeaXF47AoZEZ3rAutBp835rsvsIW2+IsDKoNMVmrj
	S7efzKfJ6WAEEWBB+alnOoRVPjf/oxmuKGvsGWn+JEhG1IH5Qb7kPRBf2VYkaz+BhN9GT6J9JMLsM
	tp6XVd036qI5PXAnc9crC1/mlbU1LnEMpZrnKmNHIqxiviPQdvwWGRMV46ZukJWQ6sX4TQ5cev1zA
	QOf4ypm1xEj0l3yTZ/CScBN+mjCwQagOZ0xLHIUNOuLLWTsL7p7XOUUsZV2E/bwi0dVB85IqlBj/S
	w7sfpnaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjzZL-000000060AS-29AN;
	Fri, 30 Aug 2024 11:13:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjzUd-00000005ya4-2h0L;
	Fri, 30 Aug 2024 11:08:41 +0000
X-UUID: 31e5a3f066c011efb3adad29d29602c1-20240830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JWhruOowdkt/xBKckPdvEO46w+VbVE01+k4IFay5Duo=;
	b=dic4pOi+/CGinFmEVVrfKGicVEXmHYtQaraZtaWqLNVGAGIsVdWaRp9OdPHxnQky1GiVqfyfSE1FwI0g2sXQt1OiGbjV7+QHfPQ3zAGLky0dooUEpz//YoBeYWPyNKOfsSh2rU2g1YTxeqDUNg6uTs5dHBoG8K2fn5UF0+RD8FE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:11457b2b-09c5-463a-bcac-54214339673b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:84840d15-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 31e5a3f066c011efb3adad29d29602c1-20240830
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1426816273; Fri, 30 Aug 2024 04:08:32 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 30 Aug 2024 19:08:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 30 Aug 2024 19:08:28 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-leds@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Sebastian Reichel <sre@kernel.org>, Pavel Machek
	<pavel@ucw.cz>, Sean Wang <sean.wang@mediatek.com>, Lee Jones
	<lee@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>, Flora Fu
	<flora.fu@mediatek.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, "Sen
 Chu" <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 4/7] regulator: dt-bindings: mt6397: move examples to parent PMIC mt6397
Date: Fri, 30 Aug 2024 19:07:29 +0800
Message-ID: <20240830110732.30080-4-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240830110732.30080-1-macpaul.lin@mediatek.com>
References: <20240830110732.30080-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.489100-8.000000
X-TMASE-MatchedRID: TppObWSVeSiPrjM/ltMU+Y+emiGnyeDRVF5mUd6sIMbfUZT83lbkEBtA
	A+CBZv6P43HhQBEsO8hLaej5cOCHCX1GcR5AeEs7jtK7dC6UBnnBDQIKmpUdLA6QlBHhBZuwRNV
	ChCiT7kXi8zVgXoAltsIJ+4gwXrEtWBd6ltyXuvuzqv2VdKUl4FE3sN7Nviwbly5S0NU4MuKBVz
	1+3BoxSbEsIkxFFKdNGE8UYfOPeBLxLPoefjwkXf5US5F30eUjAq3Qx0stoeaElVGWRzS6/kYFe
	h7KssddUGjjbmeia+IPZN5fBGmCHKL6Q11UB8yDftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.489100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 243F2C20DAC08D69B20AF17960D5A3ADDE63DC1516FD9DED60C26D6642384E772000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_040839_806506_BE286E44 
X-CRM114-Status: GOOD (  10.02  )
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

Since the DT schema of multiple function PMIC mt6397 has been converted,
move the examples in "mediatek,mt6397-regulator.yaml" to the parent schema
"mediatek,mt6397.yaml".

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../regulator/mediatek,mt6397-regulator.yaml  | 173 ------------------
 1 file changed, 173 deletions(-)

Changes for v1 and v2:
 - This is because reviewer suggest complete examples in parent device (MFD)
   as could as possible. Hence we've just move the examples to parent
   mfd/mediatek,mt6397.yaml. So we've create a patch set
   instead of submitting single patch for each subdevice.
 - This patch has been made base on linux-next/master git repo.

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6397-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6397-regulator.yaml
index 50db678..337ac58 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6397-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6397-regulator.yaml
@@ -63,176 +63,3 @@ required:
 
 additionalProperties: false
 
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-
-    mt6397_regulators: regulators {
-        compatible = "mediatek,mt6397-regulator";
-
-        mt6397_vpca15_reg: buck_vpca15 {
-            regulator-name = "vpca15";
-            regulator-min-microvolt = < 850000>;
-            regulator-max-microvolt = <1350000>;
-            regulator-ramp-delay = <12500>;
-            regulator-enable-ramp-delay = <200>;
-        };
-
-        mt6397_vpca7_reg: buck_vpca7 {
-            regulator-name = "vpca7";
-            regulator-min-microvolt = < 850000>;
-            regulator-max-microvolt = <1350000>;
-            regulator-ramp-delay = <12500>;
-            regulator-enable-ramp-delay = <115>;
-        };
-
-        mt6397_vsramca15_reg: buck_vsramca15 {
-            regulator-name = "vsramca15";
-            regulator-min-microvolt = < 850000>;
-            regulator-max-microvolt = <1350000>;
-            regulator-ramp-delay = <12500>;
-            regulator-enable-ramp-delay = <115>;
-        };
-
-        mt6397_vsramca7_reg: buck_vsramca7 {
-            regulator-name = "vsramca7";
-            regulator-min-microvolt = < 850000>;
-            regulator-max-microvolt = <1350000>;
-            regulator-ramp-delay = <12500>;
-            regulator-enable-ramp-delay = <115>;
-        };
-
-        mt6397_vcore_reg: buck_vcore {
-            regulator-name = "vcore";
-            regulator-min-microvolt = < 850000>;
-            regulator-max-microvolt = <1350000>;
-            regulator-ramp-delay = <12500>;
-            regulator-enable-ramp-delay = <115>;
-        };
-
-        mt6397_vgpu_reg: buck_vgpu {
-            regulator-name = "vgpu";
-            regulator-min-microvolt = < 700000>;
-            regulator-max-microvolt = <1350000>;
-            regulator-ramp-delay = <12500>;
-            regulator-enable-ramp-delay = <115>;
-        };
-
-        mt6397_vdrm_reg: buck_vdrm {
-            regulator-name = "vdrm";
-            regulator-min-microvolt = < 800000>;
-            regulator-max-microvolt = <1400000>;
-            regulator-ramp-delay = <12500>;
-            regulator-enable-ramp-delay = <500>;
-        };
-
-        mt6397_vio18_reg: buck_vio18 {
-            regulator-name = "vio18";
-            regulator-min-microvolt = <1500000>;
-            regulator-max-microvolt = <2120000>;
-            regulator-ramp-delay = <12500>;
-            regulator-enable-ramp-delay = <500>;
-        };
-
-        mt6397_vtcxo_reg: ldo_vtcxo {
-            regulator-name = "vtcxo";
-            regulator-min-microvolt = <2800000>;
-            regulator-max-microvolt = <2800000>;
-            regulator-enable-ramp-delay = <90>;
-        };
-
-        mt6397_va28_reg: ldo_va28 {
-            regulator-name = "va28";
-            /* fixed output 2.8 V */
-            regulator-enable-ramp-delay = <218>;
-        };
-
-        mt6397_vcama_reg: ldo_vcama {
-            regulator-name = "vcama";
-            regulator-min-microvolt = <1500000>;
-            regulator-max-microvolt = <2800000>;
-            regulator-enable-ramp-delay = <218>;
-        };
-
-        mt6397_vio28_reg: ldo_vio28 {
-            regulator-name = "vio28";
-            /* fixed output 2.8 V */
-            regulator-enable-ramp-delay = <240>;
-        };
-
-        mt6397_usb_reg: ldo_vusb {
-            regulator-name = "vusb";
-            /* fixed output 3.3 V */
-            regulator-enable-ramp-delay = <218>;
-        };
-
-        mt6397_vmc_reg: ldo_vmc {
-            regulator-name = "vmc";
-            regulator-min-microvolt = <1800000>;
-            regulator-max-microvolt = <3300000>;
-            regulator-enable-ramp-delay = <218>;
-        };
-
-        mt6397_vmch_reg: ldo_vmch {
-            regulator-name = "vmch";
-            regulator-min-microvolt = <3000000>;
-            regulator-max-microvolt = <3300000>;
-            regulator-enable-ramp-delay = <218>;
-        };
-
-        mt6397_vemc_3v3_reg: ldo_vemc3v3 {
-            regulator-name = "vemc_3v3";
-            regulator-min-microvolt = <3000000>;
-            regulator-max-microvolt = <3300000>;
-            regulator-enable-ramp-delay = <218>;
-        };
-
-        mt6397_vgp1_reg: ldo_vgp1 {
-            regulator-name = "vcamd";
-            regulator-min-microvolt = <1220000>;
-            regulator-max-microvolt = <3300000>;
-            regulator-enable-ramp-delay = <240>;
-        };
-
-        mt6397_vgp2_reg: ldo_vgp2 {
-            regulator-name = "vcamio";
-            regulator-min-microvolt = <1000000>;
-            regulator-max-microvolt = <3300000>;
-            regulator-enable-ramp-delay = <218>;
-        };
-
-        mt6397_vgp3_reg: ldo_vgp3 {
-            regulator-name = "vcamaf";
-            regulator-min-microvolt = <1200000>;
-            regulator-max-microvolt = <3300000>;
-            regulator-enable-ramp-delay = <218>;
-        };
-
-        mt6397_vgp4_reg: ldo_vgp4 {
-            regulator-name = "vgp4";
-            regulator-min-microvolt = <1200000>;
-            regulator-max-microvolt = <3300000>;
-            regulator-enable-ramp-delay = <218>;
-        };
-
-        mt6397_vgp5_reg: ldo_vgp5 {
-            regulator-name = "vgp5";
-            regulator-min-microvolt = <1200000>;
-            regulator-max-microvolt = <3000000>;
-            regulator-enable-ramp-delay = <218>;
-        };
-
-        mt6397_vgp6_reg: ldo_vgp6 {
-            regulator-name = "vgp6";
-            regulator-min-microvolt = <1200000>;
-            regulator-max-microvolt = <3300000>;
-            regulator-enable-ramp-delay = <218>;
-        };
-
-        mt6397_vibr_reg: ldo_vibr {
-            regulator-name = "vibr";
-            regulator-min-microvolt = <1200000>;
-            regulator-max-microvolt = <3300000>;
-            regulator-enable-ramp-delay = <218>;
-        };
-    };
-- 
2.45.2


