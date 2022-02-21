Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76282C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+/oewzjrolnNb0mAIZ/Wgk1JUnZfd3Zo3CbWmAZtCY=; b=KmVkm3az7kSlmt
	n3KQvUgt3qNGqZkodZj6orFOeSP3q/P5LvbD4lB+OM+fXZq2AQlULAZ0lVa6RdvFD9Su+uq/Axb2/
	cAr6uGvvDgjRTJOCVTL4gc+Py1/JNXza45ma9p8MzUT87xB/Kl5IvoBwlvcVwTwtgZQdxMEzFyVWY
	ZMsoQIW6EO0HV9gJLFjDw/jwOjrxluXRf7emgQPQ5s1OQW8P9KyQ787lieFxUZylRyTvYPPJHlGzO
	r7czTVk04Sq6XtnC989Vn2piKL1S4tBRXWC6d8sJZpydmqN6+NkC+GF/FcVHYcbfYOgLE8MNGsXph
	sA7ad5SgEq6A/mxMfoZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8wa-005ypd-3n; Mon, 21 Feb 2022 13:41:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8TB-005ouK-4Z; Mon, 21 Feb 2022 13:11:15 +0000
X-UUID: 0997de35d1af4af5b03f465078394088-20220221
X-UUID: 0997de35d1af4af5b03f465078394088-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1186288998; Mon, 21 Feb 2022 06:11:11 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 05:11:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Feb 2022 21:10:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 21:10:55 +0800
Message-ID: <3b7bdcf9be2633cdeed0258b1c12acbca7a97daf.camel@mediatek.com>
Subject: Re: [PATCH v2 17/23] arm64: dts: mt8192: Add vcodec lat and core nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 21 Feb 2022 21:10:55 +0800
In-Reply-To: <985167a1-cd44-4735-c86a-59cd60d31d1a@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-18-allen-kh.cheng@mediatek.com>
 <985167a1-cd44-4735-c86a-59cd60d31d1a@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_051113_281107_707D163C 
X-CRM114-Status: GOOD (  16.20  )
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

On Fri, 2022-02-18 at 13:56 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> > Add vcodec lat and core nodes for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 58
> > ++++++++++++++++++++++++
> >   1 file changed, 58 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 936aa788664f..543a80252ce5 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1291,6 +1291,64 @@
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_ISP2>;
> >   		};
> >   
> > +		vcodec_dec: vcodec_dec@16000000 {
> > +			compatible = "mediatek,mt8192-vcodec-dec";
> > +			reg = <0 0x16000000 0 0x1000>;		/*
> > VDEC_SYS */
> > +			mediatek,scp = <&scp>;
> > +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> > +		};
> > +
> > +		vcodec_lat: vcodec_lat@0x16010000 {
> > +			compatible = "mediatek,mtk-vcodec-lat";
> > +			reg = <0 0x16010000 0 0x800>;		/*
> > VDEC_MISC */
> > +			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			iommus = <&iommu0
> > M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> > +				<&iommu0
> > M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> > +				<&iommu0
> > M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> 
> Please fix indentation!
> 
> 			iommus = <&iommu0
> M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> 
> 				 <&iommu0
> M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> 
> 				 <&iommu0
> M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> 
> ... etc.
> 

Hi Angelo,

My neglect for indentation. 

I will fix this in next versionn.

Many thanks,
Allen

> > +				<&iommu0
> > M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> > +				<&iommu0
> > M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> > +				<&iommu0
> > M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> > +				<&iommu0
> > M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> > +				<&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> > +			clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > +				 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
> > +				 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
> > +				 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
> > +				 <&topckgen CLK_TOP_MAINPLL_D4>;
> > +			clock-names = "vdec-sel", "vdec-soc-vdec",
> > "vdec-soc-lat", "vdec-vdec",
> > +				      "vdec-top";
> > +			assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > +			assigned-clock-parents = <&topckgen
> > CLK_TOP_MAINPLL_D4>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_VDEC>;
> > +		};
> > +
> > +		vcodec_core: vcodec_core@0x16025000 {
> > +			compatible = "mediatek,mtk-vcodec-core";
> > +			reg = <0 0x16025000 0 0x1000>;		/*
> > VDEC_CORE_MISC */
> > +			interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
> > +				<&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
> > +				<&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
> 
> ditto.
> 
> > +				<&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> > +				<&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> > +				<&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> > +				<&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
> > +				<&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
> > +				<&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
> > +				<&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> > +				<&iommu0
> > M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> > +			clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > +				 <&vdecsys CLK_VDEC_VDEC>,
> > +				 <&vdecsys CLK_VDEC_LAT>,
> > +				 <&vdecsys CLK_VDEC_LARB1>,
> > +				 <&topckgen CLK_TOP_MAINPLL_D4>;
> > +			clock-names = "vdec-sel", "vdec-soc-vdec",
> > "vdec-soc-lat", "vdec-vdec",
> > +				      "vdec-top";
> > +			assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
> > +			assigned-clock-parents = <&topckgen
> > CLK_TOP_MAINPLL_D4>;
> > +			power-domains = <&spm
> > MT8192_POWER_DOMAIN_VDEC2>;
> > +		};
> > +
> >   		larb5: larb@1600d000 {
> >   			compatible = "mediatek,mt8192-smi-larb";
> >   			reg = <0 0x1600d000 0 0x1000>;
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
