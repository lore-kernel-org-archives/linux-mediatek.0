Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF9FC021AD
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 07:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1XPKhHiWLqiKWl0wXoMic2K+eE+cQPZ4CtM3vUqD8Ok=; b=mK5Fs7BkVubpO2860K/IAiRLG2
	9csqRXxvLx/IZhduwp8BZ7y6RtghVEP5dj13O1eN3SBMTSFFvRW44eyNFJp74rmP3/sHSsGbKYtDq
	dag1x0KwHE1a8GAg+D824PvKjtA7+Yiy4UNBZE3WWhYnemwD4UPE8YK3quXOhKu3nC1FsPkE6D4/X
	q2yYH0Eiij53XDA3EKcIrscDxlSHondu3clwuzeaoU6IYo0QODsEz0dcYER9XcQn5XW+hknA5kr1j
	uBMscOomPTiCopiPwLHZbEPNf4tvLYpluPUjk/MxZqneTT6opuEdOtNt26fwq23XJ6bur2GbiaDd3
	AatqDaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0ZS-0000000H2s4-0dYA;
	Thu, 20 Feb 2025 07:02:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0Ym-0000000H2eQ-16fg;
	Thu, 20 Feb 2025 07:01:25 +0000
X-UUID: 7c7190c0ef5811efa1e849db4cc18d44-20250220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=1XPKhHiWLqiKWl0wXoMic2K+eE+cQPZ4CtM3vUqD8Ok=;
	b=OY79eiFo/A2+hUFcV532eIft6SL5tXaouFM9b4Q7lZKGEL9s5kCVr4EbfmbTv9/oxyTdDtUG6ADCTmhX7lSCMZcQPypn20/nMgvooiTg19hTm4Q8rouPuZBh1D0BUN0C62yvInt2W3yXokzYnmLKehER87JTM/lFHeOoapv4K1o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:9416eea9-84bb-48a0-841e-979efea74aea,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:0aa65bb5-a2a1-4ef3-9ef9-e116773da0a7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7c7190c0ef5811efa1e849db4cc18d44-20250220
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <bo.kong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1140238844; Thu, 20 Feb 2025 00:01:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 20 Feb 2025 15:01:16 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 20 Feb 2025 15:01:16 +0800
From: bo.kong <bo.kong@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor
 Dooley <conor+dt@kernel.org>, mtk29348 <Bo.Kong@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<zhaoyuan.chen@mediatek.com>, <teddy.chen@mediatek.com>
Subject: [PATCH v4 2/4] arm64: dts: mt8188: add aie node
Date: Thu, 20 Feb 2025 14:59:51 +0800
Message-ID: <20250220070114.15015-3-bo.kong@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250220070114.15015-1-bo.kong@mediatek.com>
References: <20250220070114.15015-1-bo.kong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_230124_335052_F06BE8FF 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

From: Bo Kong <Bo.Kong@mediatek.com>

Add aie node and related node

Signed-off-by: Bo Kong <Bo.Kong@mediatek.com>
---
Changes in v4:
None

Changes in v3:
1. Remove dts non-MMIO nodes

Changes in v2:
1. Add AIE node and related node
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 9e6a77a63ef9..49611b06923b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2293,12 +2293,45 @@ imgsys_wpe1: clock-controller@15220000 {
 			#clock-cells = <1>;
 		};
 
+		aie: aie@15310000 {
+			compatible = "mediatek,mt8188-aie";
+			reg = <0 0x15310000 0 0x1000>;
+			interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,larb = <&larb12>;
+			iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
+				 <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
+				 <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
+				 <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+			clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+				 <&ipesys CLK_IPE_FDVT>,
+				 <&ipesys CLK_IPE_SMI_LARB12>,
+				 <&ipesys CLK_IPESYS_TOP>;
+			clock-names = "img_ipe",
+				      "ipe_fdvt",
+				      "ipe_smi_larb12",
+				      "ipe_top";
+		};
+
 		ipesys: clock-controller@15330000 {
 			compatible = "mediatek,mt8188-ipesys";
 			reg = <0 0x15330000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		larb12: larb@15340000 {
+			compatible = "mediatek,mt8188-smi-larb";
+			reg = <0 0x15340000 0 0x1000>;
+			mediatek,larb-id = <SMI_L12_ID>;
+			mediatek,smi = <&vpp_smi_common>;
+			mediatek,smi-sub-comm = <&smi_img1>;
+			mediatek,smi-sub-comm-inport = <0>;
+			clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
+				 <&ipesys CLK_IPE_SMI_LARB12>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
+		};
+
 		imgsys_wpe2: clock-controller@15520000 {
 			compatible = "mediatek,mt8188-imgsys-wpe2";
 			reg = <0 0x15520000 0 0x1000>;
-- 
2.45.2


