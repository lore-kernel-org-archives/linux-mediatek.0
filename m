Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B68BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 12:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1UOZUfKHRFNreNnfb8QigkcTVnukydqA2mmXzDsqKY=; b=nXA8UAhrsvC3Y7rlH29CyWGCKy
	1wu5RKhG9lvshXfkCkvuuzB7FwpqPQC8wJm8Hpm0bhpstdOIBbxvUZ0/M4y+J4TnbHaZP+IRMZ8Z1
	IbcwsvgRdJZjxzKUTgFLvxAiBQrhKc6m0a40XoGKd1MKnmo7PWmE4XJMtYMH0Wt82ebggeEBYMeOF
	9WBtByKDUiWI8xfUTf/4OSM7LwCvQqA6MlFT5X+o5jwHYK+syIIMRd3dzYoMB59tJ+Fmc542itn9T
	FaPZKrDlu3PMmozrssHsdZTBNE2hUdpTcdTc4ZxgL1syfxyThzH91H3h3CAOpF6WNGcrk6cEhmzo7
	5ysoe60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olUez-00Elzi-EI; Thu, 20 Oct 2022 12:28:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olTtg-00E8qo-IL; Thu, 20 Oct 2022 11:39:38 +0000
X-UUID: ba13187a7b0144aeb4c68966932ccc81-20221020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=o1UOZUfKHRFNreNnfb8QigkcTVnukydqA2mmXzDsqKY=;
	b=WX4skekIxrD9ESdnkoEGcwov57c7AZJTuZGY/Ox2a5b35FmDZVlVwCItDhH66Ev6fR4upmvbYI24cgkn6/AknaA8e3kTfxFCsVcVrjZWhHFkSvRiJUU1XjuU5KPqWCzd0aFSvSuQu0K+EMIxcOPgBibId0q89QOwUgXL8l8I8Ic=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:22b7f249-7097-4abc-ab6e-72306e1fb94d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:ecb7e7ee-314c-4293-acb8-ca4299dd021f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ba13187a7b0144aeb4c68966932ccc81-20221020
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1987027293; Thu, 20 Oct 2022 04:39:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 20 Oct 2022 19:19:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 20 Oct 2022 19:19:27 +0800
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
Subject: [PATCH v2 3/3] arm64: dts: mt8195: Add venc node
Date: Thu, 20 Oct 2022 19:19:25 +0800
Message-ID: <20221020111925.30002-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221020111925.30002-1-tinghan.shen@mediatek.com>
References: <20221020111925.30002-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_043936_676973_EC10783F 
X-CRM114-Status: GOOD (  10.15  )
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
index 2128fa007480..0779666c187c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2170,6 +2170,30 @@
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


