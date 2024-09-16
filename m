Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C96C3ABA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 15:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fDb8GageY0J6SFHos0kdBsDFYKXlbdO+4O9uWY7vMls=; b=BiMrZD2/TVK95fMGSWdjZghJNx
	brck+EZjDj00TPBAJPlqGD6Gcq85E5yZ6v7Q77ow6RHHw2FAO6KwD1rlRl7rLeso/rh/K2Mc5Tjcz
	SCWXX+EU2HeHfukV42ZvoiFYKbxu5QNMLbRGZ+HAEbyzf2H0Y0gGCaVgYXNlPmMhEsDT6qL1i0Bui
	cdhXt2YdM7YzB5OoZ+wn8/HAeWS3R0/nsdH+8p2W7OuUjMCXJZFVeKGfjLrK1dVT+z2k4GhMgLmxm
	ULw5pRwUqiNuM8TeqQnCSEFuhllYiAv3FV0eSgv12zT3m1s60G/6rudiqgYeuMOtPX2GJGlW2YliA
	8SfeBfQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDQU-00000004JVV-0EB8;
	Mon, 16 Sep 2024 15:14:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqDOF-00000004ItX-3mv9;
	Mon, 16 Sep 2024 15:11:49 +0000
X-UUID: fc15ea6a743d11efb3adad29d29602c1-20240916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fDb8GageY0J6SFHos0kdBsDFYKXlbdO+4O9uWY7vMls=;
	b=gNTd6lIRwFXh9gpg7bgKmQM8A43sVX2pf7ph1qObMhnlEkbrOs5r5N76wGuOyBQ/FQkjo8M+ic4DQ3Hv68ypxnAXTkNaUojmFEbrX/6OuwYAtNX8M8ddW9RHPuWFuelwZmTS7VdZEtZd5bfrViPiXiWWVfZmEtUbZxDD5t6B1Kw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:44a9c256-ed8b-4489-a40f-db85c8d36886,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:cbe018b7-8c4d-4743-b649-83c6f3b849d4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fc15ea6a743d11efb3adad29d29602c1-20240916
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 802536844; Mon, 16 Sep 2024 08:11:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Sep 2024 08:11:40 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Sep 2024 23:11:40 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sean Wang
	<sean.wang@mediatek.com>, Sen Chu <sen.chu@mediatek.com>, Macpaul Lin
	<macpaul.lin@mediatek.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, Lee
 Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Chen Zhong <chen.zhong@mediatek.com>,
	<linux-input@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai
	<wenst@chromium.org>
Subject: [PATCH v5 3/3] regulator: dt-bindings: mt6397: move examples to parent PMIC mt6397
Date: Mon, 16 Sep 2024 23:11:32 +0800
Message-ID: <20240916151132.32321-3-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240916151132.32321-1-macpaul.lin@mediatek.com>
References: <20240916151132.32321-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_081147_976660_8E39F5E6 
X-CRM114-Status: GOOD (  12.48  )
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
 - This is the first version of converting rtc-mt6397.txt.
   This is because converting rtc-mt6397 together
   with mfd/mediatek,mt6397.yaml, so we've create a patch set
   instead of submitting single patch for each subdevice.
 - This patch has been made base on linux-next/master git repo.

Changes for v3:
 - Re-order this patch since other patches for removing text DT bindings
   in v2 qill be squash into MFD patch.

Changes for v4:
 - No change.

Changes for v5:
 - No change. Fix the belonging to the same patch set.

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


