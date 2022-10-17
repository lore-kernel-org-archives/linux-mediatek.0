Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9164C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 07:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOdgjCiZo7vDpmF/r4o+sjRpJ/Bf60vk06t5dmoFfJ0=; b=wlJvTL0Ve44HfzTNLYeEhk9t2s
	nKo3UzLRByx1eIOUZ8RCgZLgQ3KfYrRV3lY13WWzfTR/ymjJZspwz4GFm7TsrPXxeZh0+YnTjt7H2
	iwxLfDiy8tmnIlzoPEMSQpWDoQ8WE+eq8ROYgVPPbrAsXvvRp0f4DhYTKqVvI+4QvrHnEBxTEWWre
	Fcf2PmDW7pJDo76lplJDdeLn7wdR+sxebMU4sJamaN2R+O+gqqfOCt1AKBRBtayl6fnPSgo3yplyU
	INU8CkX3wC/e/uivLIy4A/P5FX3mnDoPi/b1zv25ObPdXbJAvfZBQ3GcbyxU+DiezE/spTLZ+p1UH
	n3FX9Fxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okKQ1-008Pyc-93; Mon, 17 Oct 2022 07:20:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okKPa-008PnG-BH; Mon, 17 Oct 2022 07:19:50 +0000
X-UUID: dcc30793281f44658e6a8ee38c6e8d9c-20221017
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=iOdgjCiZo7vDpmF/r4o+sjRpJ/Bf60vk06t5dmoFfJ0=;
	b=r0te9F7UYWtKx8kDFVvqLQCEZ/fQF7dQXHJIf6haq1NVXTzbjZcVXcex6PH1Q4oNYmJ4OFBPbOosiE2q7GABhpzMGNMQnjSj8XIQNmdMfXH1f7CgTLVluUJWz2K3r9FqxxnFfZ3yKE1+EjhHphdbjqmZl0iiLrlaVRQ0gvnGgfA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:2b3ecb46-7313-4648-a2bf-6b2a053b7b27,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:1bebfea3-ebb2-41a8-a87c-97702aaf2e20,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: dcc30793281f44658e6a8ee38c6e8d9c-20221017
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 532578482; Mon, 17 Oct 2022 00:19:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 17 Oct 2022 15:09:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 17 Oct 2022 15:09:00 +0800
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
Subject: [PATCH v1 3/3] arm64: dts: mt8195: Add venc node
Date: Mon, 17 Oct 2022 15:08:58 +0800
Message-ID: <20221017070858.13902-4-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221017070858.13902-1-tinghan.shen@mediatek.com>
References: <20221017070858.13902-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_001946_451899_C1B224A3 
X-CRM114-Status: UNSURE (   9.20  )
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
index 903e92d6156f..7cf2f7ef4ec6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2163,6 +2163,30 @@
 			power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
 		};
 
+		venc: venc@1a020000 {
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


