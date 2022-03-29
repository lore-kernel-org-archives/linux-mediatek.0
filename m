Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0550AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 09:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AtOPl6K3tA685Ps5wpZ3TwWgNqEjr0ye4HxgB4kN630=; b=uF/iGTZE0CVnU0
	+5/SYF1AjSOdGCCFLsFJf5rRCNp+V1Qtvf2ajwcAuEdg02GEsRVb88oDYU1yCrjatnkaN/4XeYV5M
	Nmq6vCXj2CjKy7sh9arOVhkBZwYp3OGQzNP/YjvRV9OD/QNuwIF/avPaqa2Fu4akrO/RVuhhfTyoM
	+XPrTFkGx8E35ZevLKOu1gVPeS9uBH/Ot/J2jHV27/yBAcc/+l4pfRM9RTM1epU3ITxbHrHnFzOm1
	sP63V5zvHiAW5kYACgT42rIT35nzYYpVGC1VK86ogkViAaizfO/nAOPJnzDTx0/3/pzsrImcs8LTq
	PqHn7lOibmMZRQlebvpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ7rJ-00BbUG-WC; Tue, 29 Mar 2022 09:09:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ7r7-00BbPP-C6; Tue, 29 Mar 2022 09:09:39 +0000
X-UUID: ded04740969142dab7d8eab3d2a6cfa2-20220329
X-UUID: ded04740969142dab7d8eab3d2a6cfa2-20220329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 733845492; Tue, 29 Mar 2022 02:09:26 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 02:09:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 29 Mar 2022 17:09:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 17:09:23 +0800
Message-ID: <af19b42faf9a510578e48d6f497e7d2069327195.camel@mediatek.com>
Subject: Re: [PATCH v4 16/22] arm64: dts: mt8192: Add vcodec lat and core nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>
Date: Tue, 29 Mar 2022 17:09:23 +0800
In-Reply-To: <70350446-9e89-3c7b-d515-22cb2ed5a9ca@gmail.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-17-allen-kh.cheng@mediatek.com>
 <70350446-9e89-3c7b-d515-22cb2ed5a9ca@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_020937_446410_ADD8F2AC 
X-CRM114-Status: GOOD (  22.43  )
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

Hi Matthias,

On Fri, 2022-03-25 at 16:22 +0100, Matthias Brugger wrote:
> 
> On 18/03/2022 15:45, Allen-KH Cheng wrote:
> > Add vcodec lat and core nodes for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 61
> > ++++++++++++++++++++++++
> >   1 file changed, 61 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 63893779b193..71ad3adeed51 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1285,6 +1285,67 @@
> >   			power-domains = <&spm
> > MT8192_POWER_DOMAIN_ISP2>;
> >   		};
> >   
> > +		vcodec_dec: vcodec-dec@16000000 {
> > +			compatible = "mediatek,mt8192-vcodec-dec";
> > +			reg = <0 0x16000000 0 0x1000>;	/* VDEC_SYS
> > */
> > +			mediatek,scp = <&scp>;
> > +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			ranges = <0 0 0 0x16000000 0 0x26000>;
> > +
> > +			vcodec_lat: vcodec-lat@10000 {
> > +				compatible = "mediatek,mtk-vcodec-lat";
> > +				reg = <0x0 0x10000 0 0x800>;		
> > /* VDEC_MISC */
> > +				interrupts = <GIC_SPI 426
> > IRQ_TYPE_LEVEL_HIGH 0>;
> > +				iommus = <&iommu0
> > M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
> > +				clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > +					 <&vdecsys_soc
> > CLK_VDEC_SOC_VDEC>,
> > +					 <&vdecsys_soc
> > CLK_VDEC_SOC_LAT>,
> > +					 <&vdecsys_soc
> > CLK_VDEC_SOC_LARB1>,
> > +					 <&topckgen
> > CLK_TOP_MAINPLL_D4>;
> > +				clock-names = "vdec-sel", "vdec-soc-
> > vdec", "vdec-soc-lat",
> > +					      "vdec-vdec", "vdec-top";
> 
> Clock names do not match binding description. We have superfluous
> "vdec-" 
> prefix. Same holds for mtk-vcodec-core. Anway I applied that patch as
> the driver 
> does not care about the clock name. In any case it would be good if
> you could 
> send a follow-up patch to fix the clock name.
> 
> Applied, thanks
> 

Sorry, This is our mistake. those clk names should not append "vdec-"
prefix from Rob's suggestion [1]. ('vdec-' is redundant)

Please drop this patch in v5.18-next/dts64.  I will send the corrected
version.

I apologize any inconvenience caused.

[1] https://lore.kernel.org/all/YYFCaHI%2FDASUz+Vu@robh.at.kernel.org/

Thanks,
Allen

> > +				assigned-clocks = <&topckgen
> > CLK_TOP_VDEC_SEL>;
> > +				assigned-clock-parents = <&topckgen
> > CLK_TOP_MAINPLL_D4>;
> > +				power-domains = <&spm
> > MT8192_POWER_DOMAIN_VDEC>;
> > +			};
> > +
> > +			vcodec_core: vcodec-core@25000 {
> > +				compatible = "mediatek,mtk-vcodec-
> > core";
> > +				reg = <0 0x25000 0 0x1000>;	/*
> > VDEC_CORE_MISC */
> > +				interrupts = <GIC_SPI 425
> > IRQ_TYPE_LEVEL_HIGH 0>;
> > +				iommus = <&iommu0
> > M4U_PORT_L4_VDEC_MC_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L4_VDEC_UFO_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L4_VDEC_PP_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L4_VDEC_PRED_RD_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L4_VDEC_PRED_WR_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L4_VDEC_PPWRAP_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L4_VDEC_TILE_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L4_VDEC_VLD_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L4_VDEC_VLD2_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L4_VDEC_AVC_MV_EXT>,
> > +					 <&iommu0
> > M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
> > +				clocks = <&topckgen CLK_TOP_VDEC_SEL>,
> > +					 <&vdecsys CLK_VDEC_VDEC>,
> > +					 <&vdecsys CLK_VDEC_LAT>,
> > +					 <&vdecsys CLK_VDEC_LARB1>,
> > +					 <&topckgen
> > CLK_TOP_MAINPLL_D4>;
> > +				clock-names = "vdec-sel", "vdec-soc-
> > vdec", "vdec-soc-lat",
> > +					      "vdec-vdec", "vdec-top";
> > +				assigned-clocks = <&topckgen
> > CLK_TOP_VDEC_SEL>;
> > +				assigned-clock-parents = <&topckgen
> > CLK_TOP_MAINPLL_D4>;
> > +				power-domains = <&spm
> > MT8192_POWER_DOMAIN_VDEC2>;
> > +			};
> > +		};
> > +
> >   		larb5: larb@1600d000 {
> >   			compatible = "mediatek,mt8192-smi-larb";
> >   			reg = <0 0x1600d000 0 0x1000>;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
