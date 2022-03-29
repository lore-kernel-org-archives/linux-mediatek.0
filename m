Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 06:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOJTtU603HGVi+TKcd/f4MSIQYX0BaucL0JvE+TxkFk=; b=gQK8C6imi5fvP4
	UIu4An3i1qXkUXl03GGnDYme6SYeYUMfwPcUiCttTDt7XeqQWVrlcJ1oDr0jm2sOVhXEsdMGORIwz
	RHhm2TnUsw+1AwforDgnlexbBmt8qzZg+IFZg4fH4MvXk6+XD4D7iV3tapNsmToS5X8zLJTuhnaT7
	TtXoiGr0CgNGw+KQtiBStDd+d7wNvnu/jnBr3HNwGAGF/oiEcbG8nJiBnGaOf2MNUdFW4fMMMPtm3
	xMYlmYMp/LkKw2LJsVykZAXD9EALrDVJm+FfuG08ITMB9ZJJkFJGW06PxvAwLNIeh/2QbS2iDPZZy
	ZXCvP6lU/PuGJZhmiWug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ5XI-00BDsu-Tn; Tue, 29 Mar 2022 06:41:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ5XG-00BDsA-1t; Tue, 29 Mar 2022 06:40:59 +0000
X-UUID: cd91d2eb9d364a338cecf49a88318565-20220328
X-UUID: cd91d2eb9d364a338cecf49a88318565-20220328
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1930804403; Mon, 28 Mar 2022 23:40:56 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 23:40:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 14:40:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Mar 2022 14:40:52 +0800
Message-ID: <080f3031bc05039ec73803886b92ec5614647e95.camel@mediatek.com>
Subject: Re: [PATCH v4 12/22] arm64: dts: mt8192: Add mmc device nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>
Date: Tue, 29 Mar 2022 14:40:52 +0800
In-Reply-To: <90324c6f-e3ef-5b18-8779-8a11ca67039b@gmail.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-13-allen-kh.cheng@mediatek.com>
 <90324c6f-e3ef-5b18-8779-8a11ca67039b@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_234058_143229_3570F819 
X-CRM114-Status: GOOD (  20.78  )
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

On Thu, 2022-03-24 at 18:53 +0100, Matthias Brugger wrote:
> 
> On 18/03/2022 15:45, Allen-KH Cheng wrote:
> > Add mmc nodes for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 34
> > +++++++++++++++++++++---
> >   1 file changed, 30 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 6220d6962f58..2648f2847993 100644
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
> 
> We don't need the msdc_axi_wrap clock and that's why we delete the
> node, 
> correct? In that case we could only disable the node, as DTS should
> describe the 
> HW as it is. Please also add a line in the commit message explaining
> that.
> 
> Regards,
> Matthias
> 

Yes, in mt8192, mmc driver don't need msdc clock.

I will disable msdc node and mention it in commit message in next
version.

Thanks,
Allen

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
> > +				 <&msdc_top CLK_MSDC_TOP_P_MSDC0>,
> > +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> > +				 <&msdc_top
> > CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
> > +			clock-names = "source", "hclk", "source_cg",
> > "sys_cg",
> > +				      "pclk_cg", "axi_cg", "ahb_cg";
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
> > +				 <&msdc_top CLK_MSDC_TOP_P_MSDC1>,
> > +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> > +				 <&msdc_top
> > CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
> > +			clock-names = "source", "hclk", "source_cg",
> > "sys_cg",
> > +				      "pclk_cg", "axi_cg", "ahb_cg";
> > +			status = "disabled";
> >   		};
> >   
> >   		mfgcfg: clock-controller@13fbf000 {


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
