Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE9ED2E01C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dG13J0Y11zTLAF6mBQ+UKC5Y5vRX6I05iFRrQ0sCp64=; b=Sh2G2btNx+u1N0FvtXkmTqZCWG
	e952Ea4IAfsfc5iXTZkFFkSCOS52han6OH8xgVPuGNDEXGy373gp5bsU36q1vvKjYQO7KvRVf5EBd
	VC/O5gyAyYEts+6+s408R0RmeABZeuUODEtXWzNjW/jBnItNrr8RyStjC+HMDck8/C+94PFuvzhMI
	nBUtVySZxqL/ak55P7Osq+qTBmzoAc8dLihTWW7Kg4Nxqp3E9dGs3VE7dycDSb0A5LZykYnPw2EWa
	iTTHugKP/FmfTX0/IKuvP1uper7mBSm5Ti8JoUZVTyqtu39FM0DbfpOnEggmfBUwPdwo8PCqTqxnA
	QPzXDo1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Vp5-0000000DOFj-2sw1;
	Wed, 23 Oct 2024 07:30:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3VXx-0000000DL1H-0aNI;
	Wed, 23 Oct 2024 07:12:47 +0000
X-UUID: 2fa50cb6910e11ef82ff63e91e7eb18c-20241023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dG13J0Y11zTLAF6mBQ+UKC5Y5vRX6I05iFRrQ0sCp64=;
	b=P8mN/KnBQtXDsjwd+MKwHGTYsJx/q2GnOLDvMq/7Ud7Io/HFr/Y5zNKOsdnqgSNUojUQpDoRtP7hs+QfFpmb1vTwiMdMNbYYtAmob/a+Mh4Bdo2xwr5bHBlYDuw4NwZ38CIqB3TjiwBV5nWxbZsENky6xVyPNpxS6vZVoVudsko=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:196b6597-5dc1-406b-b486-b6f682136daf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:95e6f92d-a7a0-4b06-8464-80be82133975,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 2fa50cb6910e11ef82ff63e91e7eb18c-20241023
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 149850342; Wed, 23 Oct 2024 00:12:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 23 Oct 2024 15:12:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 23 Oct 2024 15:12:33 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Mergnat
	<amergnat@baylibre.com>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-usb@vger.kernel.org>, Chris-qj chen <chris-qj.chen@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>, Simon Sun <simon.sun@yunjingtech.com>
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8395-genio-1200-evk: add support for MUX IT5205
Date: Wed, 23 Oct 2024 15:12:26 +0800
Message-ID: <20241023071226.14090-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241023071226.14090-1-macpaul.lin@mediatek.com>
References: <20241023071226.14090-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.849300-8.000000
X-TMASE-MatchedRID: y/MOm6ldwRLwi+JtrEQDF/OS+SRxjgFwO8xCfog1G6TfUZT83lbkECc/
	xZYu98DIXlLd88CeldeEWLXMLbnj9s9tfSEZlKTR0Xw0ILvo/uV9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO2i5u/VvsFaHZo/FbJ9dxneJfIFhtB+fg142nvvg/R7I/+H0edVFfSNiWM4GkOCkv6Uc5
	7FjAsx+8BJfDkpwagKV0vb6dLWo92cVs3n0bcGPqMnTJRI0XInfXwUEm1ouDzLDYxFC1/7rn6Gd
	Nk4NWmA
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.849300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1BDDA5227DA9E30728ABF0AC3DB9070AC31DF6B397CEC1F8E8567801DD19F8AF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_001245_209541_F1C18E07 
X-CRM114-Status: GOOD (  10.71  )
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

Add ITE IT5205FN (TYPEC MUX) under I2C2 bus and configure its properties;
also add references to it5205fn from MT6360 TYPE-C connector for TYPEC
configuration.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Simon Sun <simon.sun@yunjingtech.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../dts/mediatek/mt8395-genio-1200-evk.dts    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

Changes for v2:
 - This is a new patch in the v2 patch.

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 195e486d9101..57c68d033196 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -229,6 +229,21 @@ &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
 	status = "okay";
+
+	it5205fn: typec-mux@48 {
+		compatible = "ite,it5205";
+		reg = <0x48>;
+		vcc-supply = <&mt6359_vibr_ldo_reg>;
+		mode-switch;
+		orientation-switch;
+		status = "okay";
+
+		port {
+			it5205_sbu_ep: endpoint {
+				remote-endpoint = <&mt6360_ssusb_sbu_ep>;
+			};
+		};
+	};
 };
 
 &i2c6 {
@@ -282,6 +297,13 @@ mt6360_ssusb_ep: endpoint {
 							remote-endpoint = <&ssusb_ep>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+						mt6360_ssusb_sbu_ep: endpoint {
+							remote-endpoint = <&it5205_sbu_ep>;
+						};
+					};
 				};
 			};
 		};
-- 
2.45.2


