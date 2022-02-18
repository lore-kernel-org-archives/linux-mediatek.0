Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CA5C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/HgHvMU5CUgnPxC6X51Ilbd7j9OuCW7WiMQ1SYVRD8=; b=KaoaWhvVyHt85W
	uxM85qW5oKuUbI5yktkzDShzS8YYpnUtv2x8A/7sDtQ3yYsVYK4NYBH95bIXOaAwYo64KGvhtj+8Z
	cxQdeIXI9oqD82bP76IMYGjBYMV9O6WL43FuFNEv1YkPz9lruoSzmzfrNYIaNcLngg3+CW7tGY+jE
	UXdzJfkBRaSTfvnhkydZfCkM6OORp4MrrtGFCY86xZ+x//WnotAVXzcJukliPn3xMiqUsOxuzXGks
	i0a/JPpDekoX52pr9PApOEjcTOy+4R3M0StuXqTHpZbyMT7mCtVyeLZPXEbBQILfzb33zRGbihGkN
	FoDZSE+ZrGudJPhDQiFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKzR5-00DT4Z-LH; Fri, 18 Feb 2022 09:20:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKzO0-00DQmv-Nk; Fri, 18 Feb 2022 09:17:10 +0000
X-UUID: 9a46a324ae334897912f5d27432dfb74-20220218
X-UUID: 9a46a324ae334897912f5d27432dfb74-20220218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 34925197; Fri, 18 Feb 2022 02:16:59 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Feb 2022 01:16:53 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Feb 2022 17:16:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Feb 2022 17:16:52 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 17/23] arm64: dts: mt8192: Add vcodec lat and core nodes
Date: Fri, 18 Feb 2022 17:16:27 +0800
Message-ID: <20220218091633.9368-18-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_011708_824301_55A5FDC4 
X-CRM114-Status: UNSURE (   9.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add vcodec lat and core nodes for mt8192 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 58 ++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 936aa788664f..543a80252ce5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1291,6 +1291,64 @@
 			power-domains = <&spm MT8192_POWER_DOMAIN_ISP2>;
 		};
 
+		vcodec_dec: vcodec_dec@16000000 {
+			compatible = "mediatek,mt8192-vcodec-dec";
+			reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
+			mediatek,scp = <&scp>;
+			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
+		};
+
+		vcodec_lat: vcodec_lat@0x16010000 {
+			compatible = "mediatek,mtk-vcodec-lat";
+			reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
+			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
+				<&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
+				<&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
+				<&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
+				<&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
+				<&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
+				<&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
+				<&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
+			clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+				 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+				 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+				 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+				 <&topckgen CLK_TOP_MAINPLL_D4>;
+			clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat", "vdec-vdec",
+				      "vdec-top";
+			assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+			power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
+		};
+
+		vcodec_core: vcodec_core@0x16025000 {
+			compatible = "mediatek,mtk-vcodec-core";
+			reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
+			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
+				<&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
+				<&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
+				<&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
+				<&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
+				<&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
+				<&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
+				<&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
+				<&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
+				<&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
+				<&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
+			clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+				 <&vdecsys CLK_VDEC_VDEC>,
+				 <&vdecsys CLK_VDEC_LAT>,
+				 <&vdecsys CLK_VDEC_LARB1>,
+				 <&topckgen CLK_TOP_MAINPLL_D4>;
+			clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat", "vdec-vdec",
+				      "vdec-top";
+			assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+			power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
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
