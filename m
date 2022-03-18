Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA6FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Mar 2022 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LcgTzE1iFgXz19OdeAN3e+XuCdVEIoNRued7oV00DMw=; b=OxF6V21OE9dNyY
	ubLiY/pzdYLEmqEADUEehv5ctGhxliFSBpqoXCwuLVGbNcRT2wdoIxYdjG9NxXHkKiblg0B124gsD
	akXL8R6KG7sXgF1TkE7qxw2awEPRM5+OCMf0F7Bp7i8qbu96eQyWJl107DYlgd0gfPfwEzchfp+pm
	iD7WONS54qYtH9v+3HF9UsMOVYS8jbgVeRutJRy4RzvqOfLtOk93IEh4BRsEPdicTl3UM53otAzJu
	592ap3cY676c3l+1GWQDTr3T95QDF2CAC3R7okXt49bnyQ8ZfZhKsyI72yfUrIYyrCshIJ67nfgsk
	fCFD4c7FuiGnbwItPEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVBZy-001YCk-86; Fri, 18 Mar 2022 12:19:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVBZu-001YBv-CP; Fri, 18 Mar 2022 12:19:35 +0000
X-UUID: fde114c8948c4d73b21e015dc1c02106-20220318
X-UUID: fde114c8948c4d73b21e015dc1c02106-20220318
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1467349410; Fri, 18 Mar 2022 05:19:27 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Mar 2022 05:19:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 18 Mar 2022 20:19:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 20:19:11 +0800
Message-ID: <4c30c3bc48d03f361db6dd0014ed46591a9f2bfd.camel@mediatek.com>
Subject: Re: [PATCH v3 12/21] arm64: dts: mt8192: Add mmc device nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Fri, 18 Mar 2022 20:19:11 +0800
In-Reply-To: <dc4ce2b5-bf8e-ea20-f9b1-9034caff421b@collabora.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
 <20220304130809.12924-13-allen-kh.cheng@mediatek.com>
 <dc4ce2b5-bf8e-ea20-f9b1-9034caff421b@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_051934_473486_925D4363 
X-CRM114-Status: GOOD (  17.46  )
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

Hi Angelo,


On Tue, 2022-03-15 at 15:47 +0100, AngeloGioacchino Del Regno wrote:
> Il 04/03/22 14:08, Allen-KH Cheng ha scritto:
> > Add mmc nodes for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 34
> > +++++++++++++++++++++---
> >   1 file changed, 30 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 6220d6962f58..4e4081ea7db5 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1150,10 +1150,36 @@
> >   			#clock-cells = <1>;
> >   		};
> >   
> > -		msdc: clock-controller@11f60000 {
> > -			compatible = "mediatek,mt8192-msdc";
> > -			reg = <0 0x11f60000 0 0x1000>;
> > -			#clock-cells = <1>;
> > +		mmc0: mmc@11f60000 {
> > +			compatible = "mediatek,mt8192-mmc",
> > "mediatek,mt8183-mmc";
> > +			reg = <0 0x11f60000 0 0x1000>, <0 0x11f50000 0
> > 0x1000>;
> > +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
> > +				 <&msdc_top CLK_MSDC_TOP_H_MST_0P>,
> > +				 <&msdc_top CLK_MSDC_TOP_SRC_0P>,
> > +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
> > +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> > +				 <&msdc_top
> > CLK_MSDC_TOP_AHB2AXI_BRG_AXI>,
> > +				 <&msdc_top CLK_MSDC_TOP_P_MSDC0>;
> > +			clock-names = "source", "hclk", "source_cg",
> > "sys_cg",
> > +				      "axi_cg", "ahb_cg", "pclk_cg";
> 
> Can you please use the same clock order as specified in the dt-
> bindings?
> This means that "pclk_cg" goes before "axi_cg".
> 

Sure, I will update in the next version

Thanks,
Allen

> 				 <&msdc_top CLK_MSDC_TOP_P_MSDC0>,
> 				 <&msdc_top
> CLK_MSDC_TOP_AHB2AXI_BRG_AXI>,
> 				 <&msdc_top CLK_MSDC_TOP_AXI>;
> 		clock-names = "source", "hclk", "source_cg", "sys_cg",
> 			      "pclk_cg", "axi_cg", "ahb_cg";
> 
> > +			status = "disabled";
> > +		};
> > +
> > +		mmc1: mmc@11f70000 {
> > +			compatible = "mediatek,mt8192-mmc",
> > "mediatek,mt8183-mmc";
> > +			reg = <0 0x11f70000 0 0x1000>, <0 0x11c70000 0
> > 0x1000>;
> > +			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
> > +				 <&msdc_top CLK_MSDC_TOP_H_MST_1P>,
> > +				 <&msdc_top CLK_MSDC_TOP_SRC_1P>,
> > +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
> > +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> > +				 <&msdc_top
> > CLK_MSDC_TOP_AHB2AXI_BRG_AXI>,
> > +				 <&msdc_top CLK_MSDC_TOP_P_MSDC1>;
> 
> same here please.
> 
> > +			clock-names = "source", "hclk", "source_cg",
> > "sys_cg",
> > +				      "axi_cg", "ahb_cg", "pclk_cg";
> > +			status = "disabled";
> >   		};
> >   
> >   		mfgcfg: clock-controller@13fbf000 {
> 
> After applying the requested changes,
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> Thanks,
> Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
