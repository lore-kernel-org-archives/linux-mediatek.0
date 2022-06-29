Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445DFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 12:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLQmsmuxUhdGFrtixETMRHjDHoYuMZwDzvJbPieV/fU=; b=fpwJ4T4FAKYovG9A7niP+fYGoT
	1TMG/zI1DVW3GHJtWrRry/BeitzRlZYLAIA1Ig8m3jzWfxcG83DBMnzBgzPz74R/PG2bGBSg9m4cp
	O/4R7QZAlhav+gQGRgi/3JGOMnGW2JIMPwgkpL+vk/J3kNlbruQgJMRuyVW/CVyy49Bo84T+B4uJj
	YLp9lzMWxZDKA6nAHLBXuyBcdqUumMDnqSJRQwBPEjRsYyYndVPtl9KMida9EMLfpjGwTCITmt+2a
	hj21B6MCRuePML9VG78qRVhM/y0fM1ILDluaPA4o/k+W2Qul0FGpM1j4fwQ8Lhr0nY8BcSztVrVUK
	x6X5yyPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6WcM-00BjPU-3T; Wed, 29 Jun 2022 12:16:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6WbG-00Birv-72; Wed, 29 Jun 2022 12:15:21 +0000
X-UUID: 1766a25532cc4e70afcc53b558a509b6-20220629
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:4b7a92f5-3f5e-45ce-b3fa-78dd9f6f06f0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:87442a2,CLOUDID:852f29d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 1766a25532cc4e70afcc53b558a509b6-20220629
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2086827333; Wed, 29 Jun 2022 05:15:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 29 Jun 2022 20:14:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 29 Jun 2022 20:14:08 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	"Chen-Yu Tsai" <wenst@chromium.org>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>
Subject: [PATCH 5/5] arm64: dts: mt8192: Add vcodec lat and core nodes
Date: Wed, 29 Jun 2022 20:13:58 +0800
Message-ID: <20220629121358.19458-6-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220629121358.19458-1-allen-kh.cheng@mediatek.com>
References: <20220629121358.19458-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_051518_294146_F1163BF2 
X-CRM114-Status: GOOD (  10.59  )
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

Add vcodec lat and core nodes for mt8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 60 ++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 72af328126de..a7f58dbe964d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1434,6 +1434,66 @@
 			power-domains = <&spm MT8192_POWER_DOMAIN_ISP2>;
 		};
 
+		vcodec_dec: vcodec-dec@16000000 {
+			compatible = "mediatek,mt8192-vcodec-dec";
+			reg = <0 0x16000000 0 0x1000>;
+			mediatek,scp = <&scp>;
+			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
+			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0 0 0 0x16000000 0 0x26000>;
+
+			vcodec_lat: vcodec-lat@10000 {
+				compatible = "mediatek,mtk-vcodec-lat";
+				reg = <0x0 0x10000 0 0x800>;
+				interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
+				iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
+					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
+					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
+					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
+					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
+					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
+					 <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
+					 <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
+				clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+					 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+					 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+					 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+					 <&topckgen CLK_TOP_MAINPLL_D4>;
+				clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
+				assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+				assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+				power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
+			};
+
+			vcodec_core: vcodec-core@25000 {
+				compatible = "mediatek,mtk-vcodec-core";
+				reg = <0 0x25000 0 0x1000>;
+				interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
+				iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
+					 <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
+					 <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
+					 <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
+					 <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
+					 <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
+					 <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
+					 <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
+					 <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
+					 <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
+					 <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
+				clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+					 <&vdecsys CLK_VDEC_VDEC>,
+					 <&vdecsys CLK_VDEC_LAT>,
+					 <&vdecsys CLK_VDEC_LARB1>,
+					 <&topckgen CLK_TOP_MAINPLL_D4>;
+				clock-names = "sel", "soc-vdec", "soc-lat", "vdec", "top";
+				assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+				assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+				power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
+			};
+		};
+
 		larb5: larb@1600d000 {
 			compatible = "mediatek,mt8192-smi-larb";
 			reg = <0 0x1600d000 0 0x1000>;
-- 
2.18.0


