Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92A8C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 09:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHLrJjDyax+4XeO6PgZ0H4DyfBzBeXcDQZ6uY1Q2hMI=; b=LcIMalEfTxoMZ+9C/oa3CWtONe
	La+EJxmYQ0Rt3LQgRYPfkbjPNeoRN5mFC7YIxTeyj+uM/N/QNqjRsb4io2cNOzlvdpsGG6fonelM0
	B6RcOCUJWAzownuQgTe8jkvx0wb/eFRbMkdBinLgMyS95Lk8XWSuSZk26Aip3YZU/fBj0xNC1bkF7
	iG0KgRLckNFoHNXlAIDOXf7QaWqOUgrBUw34vuvc/GQ05ELPCRBcrAmqTQqR4qnlLXvFb7z+2TXsL
	CBf++npmFso6U0WunbSb51KZNekg/Wa8Dxqy4YrL/qK0Ekw2qVjtwR/Nft1EMBAZrQj3T7lXKmNf8
	1qAMwX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLfv-00GKM3-IN; Fri, 28 Oct 2022 09:29:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLfV-00GKA5-2z; Fri, 28 Oct 2022 09:28:50 +0000
X-UUID: 62438a01073d48e1bc6edc088f81d86b-20221028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=vHLrJjDyax+4XeO6PgZ0H4DyfBzBeXcDQZ6uY1Q2hMI=;
	b=uw+d6jfh8PjLPCCkLp02aRskT/i32j3v4tKsJ3oayAsLax94PgeEo1+nlpVo7YWPd/a7qclPFouS1QC/a0LzfxVhAFa35oclw5ROVM51HBDfqC5aW7fA2YlOw9uULaL8m9U6h0lZmG8AXaHrBXmL5Ex8dyWO87SQybFi56Wrojs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:f8ad099d-77c9-40b8-a6d6-27e9b0d5dcbd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:cc74e68f-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 62438a01073d48e1bc6edc088f81d86b-20221028
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1388052676; Fri, 28 Oct 2022 02:28:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 28 Oct 2022 17:28:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 28 Oct 2022 17:28:38 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>, Irui Wang <irui.wang@mediatek.com>
Subject: [PATCH v3 3/3] arm64: dts: mt8195: Add venc node
Date: Fri, 28 Oct 2022 17:28:36 +0800
Message-ID: <20221028092836.29006-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221028092836.29006-1-tinghan.shen@mediatek.com>
References: <20221028092836.29006-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_022849_163857_49FC891E 
X-CRM114-Status: UNSURE (   9.21  )
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

Add venc node for mt8195 SoC.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 40a90e5f84ab..51c8ba316fa5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2109,6 +2109,30 @@
 			power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
 		};
 
+		venc: video-codec@1a020000 {
+			compatible = "mediatek,mt8195-vcodec-enc";
+			reg = <0 0x1a020000 0 0x10000>;
+			iommus = <&iommu_vdo M4U_PORT_L19_VENC_RCPU>,
+				 <&iommu_vdo M4U_PORT_L19_VENC_REC>,
+				 <&iommu_vdo M4U_PORT_L19_VENC_BSDMA>,
+				 <&iommu_vdo M4U_PORT_L19_VENC_SV_COMV>,
+				 <&iommu_vdo M4U_PORT_L19_VENC_RD_COMV>,
+				 <&iommu_vdo M4U_PORT_L19_VENC_CUR_LUMA>,
+				 <&iommu_vdo M4U_PORT_L19_VENC_CUR_CHROMA>,
+				 <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
+				 <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
+			interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
+			mediatek,scp = <&scp>;
+			clocks = <&vencsys CLK_VENC_VENC>;
+			clock-names = "venc_sel";
+			assigned-clocks = <&topckgen CLK_TOP_VENC>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+		};
+
 		vencsys_core1: clock-controller@1b000000 {
 			compatible = "mediatek,mt8195-vencsys_core1";
 			reg = <0 0x1b000000 0 0x1000>;
-- 
2.18.0


