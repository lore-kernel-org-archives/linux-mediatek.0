Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53FDC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 13:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5elte3hLnMMsREOq7hYAIrjhSrRP0JS1AkUHDZRUQIY=; b=py0ev4aJaM6kwz
	daQdxsWx97nzwYkU3147gYlOK/40LjDFwIoma4Zhv+Zz0oKFdXA3jN0bNnjneR9FnVbU9CiEJ+KhG
	1qG3gV5XqVI8Clk6FBxkwEj/rEcIlXmUnzZTFRSGiLL14buA8L0xKjhV9/+A+TI1NIT+fIOWuIfPf
	ryLwAyO3c5WYyDzZW1TA5oyaFvZpScizDguZ77Dp08U8SqG68yFpO7OnacTe64AS7MbzkYlhhx3P1
	8qTQVTpVsm1n8nf6Gn71UZMt898Yc2/eLRF4FQ3olsVXNJvghgLvDsO+DB+gff2ZIY2euq7TBn8lV
	qHpccp2ib/7t3/Emn+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZYYB-00G7LK-LK; Wed, 30 Mar 2022 13:39:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZYY0-00G7H4-9i; Wed, 30 Mar 2022 13:39:41 +0000
X-UUID: e6998279ff004f20b366448aeedacdf6-20220330
X-UUID: e6998279ff004f20b366448aeedacdf6-20220330
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 28466191; Wed, 30 Mar 2022 06:39:35 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 06:38:29 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 30 Mar 2022 21:38:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 30 Mar 2022 21:38:27 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v5 4/4] arm64: dts: mt8192: Add vcodec lat and core nodes
Date: Wed, 30 Mar 2022 21:38:16 +0800
Message-ID: <20220330133816.30806-5-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220330133816.30806-1-allen-kh.cheng@mediatek.com>
References: <20220330133816.30806-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_063940_361733_DDBC617C 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add vcodec lat and core nodes for mt8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 60 ++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 3d61238fb102..0b2b52a8f5ed 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1115,6 +1115,66 @@
 			power-domains = <&spm MT8192_POWER_DOMAIN_ISP2>;
 		};
 
+		vcodec_dec: vcodec-dec@16000000 {
+			compatible = "mediatek,mt8192-vcodec-dec";
+			reg = <0 0x16000000 0 0x1000>;	/* VDEC_SYS */
+			mediatek,scp = <&scp>;
+			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
+			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0 0 0 0x16000000 0 0x26000>;
+
+			vcodec_lat: vcodec-lat@10000 {
+				compatible = "mediatek,mtk-vcodec-lat";
+				reg = <0x0 0x10000 0 0x800>;		/* VDEC_MISC */
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
+				reg = <0 0x25000 0 0x1000>;	/* VDEC_CORE_MISC */
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
