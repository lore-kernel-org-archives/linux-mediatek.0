Return-Path: <SRS0=gblj=LH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BECC48BCF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 06:40:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B197611CE
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 06:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B197611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40ww3LtwrueFBNwgn6zzvjUciExlJYlS7pdNl0b/cDw=; b=Ij/AzHn0JdWmi7
	WtsaBDl/1FozZCmpv+cGOvwPI3nqCjBv3kaTVUz7DRwXKcnVOSreLHNcoXrOa60kWXhG9BCPbOUTp
	ZwVcB1Rikrqt+gaN8iTY1JeIngpywFBeIOmCoCOCTkVPQIYctdYrJ4OkAJaMhKTFF+/pBNPCpQWKY
	lN+n30DUX0rGLoeSTNF2IQlUpbsA/CZJmRLiNiN0dAM/UBLEhArjM/1hzpNfEBd2MQCakoATaPUmF
	7NudOPNPOv1agsrELQRLOP74DpItMzlGVKyhlEF5qpHdBp6qXj7TJg+BBZQXE/Ui/CnpOddnfXaUw
	CTOqwrmjnxoJZhtjSXqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsJn6-009od4-4v; Sun, 13 Jun 2021 06:40:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsJmu-009obl-1h; Sun, 13 Jun 2021 06:40:05 +0000
X-UUID: 6c5593b1f4504b7fa9ca98d5ce4ad2d6-20210612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=F4X/8TVsc/5yj4EipGih8Ae/4NiaO/0GdQ7SxHdjPnU=; 
 b=uPd+rzzx3PoqcO/ROMGx49qfa5I7q/A+lA4fR9CcfvaHOwo/PsxJuuvCX+lgiPfRIlxgIQNmj+5CWwDqbFSsLrUjoFBIFaw9eGNmk7ZphXU6Unoe189agc1h3oyqh1j2L0JjysUXSCAJMLXB4UETXGfriMbfLwfH+pd6DsOwZi4=;
X-UUID: 6c5593b1f4504b7fa9ca98d5ce4ad2d6-20210612
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 431390440; Sat, 12 Jun 2021 23:40:00 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Jun 2021 23:39:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Jun 2021 14:39:45 +0800
Received: from [10.15.20.246] (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Jun 2021 14:39:44 +0800
Message-ID: <1623565530.11212.4.camel@mbjsdccf07>
Subject: Re: [PATCH v2 1/1] arm64: dts: mediatek: add MT6779 spi master dts
 node
From: Mason Zhang <mason.zhang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <hanks.chen@mediatek.com>,
 <wsd_upstream@mediatek.com>
Date: Sun, 13 Jun 2021 14:25:30 +0800
In-Reply-To: <faafa83d-4831-2b70-78ec-0e9f3636b5c9@gmail.com>
References: <20210409015651.11474-1-Mason.Zhang@mediatek.com>
 <faafa83d-4831-2b70-78ec-0e9f3636b5c9@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_234004_124049_72533DAC 
X-CRM114-Status: GOOD (  16.49  )
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

On Fri, 2021-06-11 at 15:58 +0200, Matthias Brugger wrote:
> 
> On 09/04/2021 03:56, Mason Zhang wrote:
> > This patch add address-cells && size-cells in spi node based on patch v1.
> > 
> 
> Can you please come up with a better commit message, otherwise patch looks good.
> 
> Regards,
> Matthias
> 
> > Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt6779.dtsi | 112 +++++++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> > index 370f309d32de..c81e76865d1b 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> > @@ -219,6 +219,118 @@
> >  			status = "disabled";
> >  		};
> >  
> > +		spi0: spi0@1100a000 {
> > +			compatible = "mediatek,mt6779-spi",
> > +				     "mediatek,mt6765-spi";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			mediatek,pad-select = <0>;
> > +			reg = <0 0x1100a000 0 0x1000>;
> > +			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW 0>;
> > +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> > +				<&topckgen CLK_TOP_SPI>,
> > +				<&infracfg_ao CLK_INFRA_SPI0>;
> > +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> > +		};
> > +
> > +		spi1: spi1@11010000 {
> > +			compatible = "mediatek,mt6779-spi",
> > +				     "mediatek,mt6765-spi";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			mediatek,pad-select = <0>;
> > +			reg = <0 0x11010000 0 0x1000>;
> > +			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_LOW 0>;
> > +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> > +				<&topckgen CLK_TOP_SPI>,
> > +				<&infracfg_ao CLK_INFRA_SPI1>;
> > +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> > +		};
> > +
> > +		spi2: spi2@11012000 {
> > +			compatible = "mediatek,mt6779-spi",
> > +				     "mediatek,mt6765-spi";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			mediatek,pad-select = <0>;
> > +			reg = <0 0x11012000 0 0x1000>;
> > +			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW 0>;
> > +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> > +				 <&topckgen CLK_TOP_SPI>,
> > +				<&infracfg_ao CLK_INFRA_SPI2>;
> > +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> > +		};
> > +
> > +		spi3: spi3@11013000 {
> > +			compatible = "mediatek,mt6779-spi",
> > +				     "mediatek,mt6765-spi";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			mediatek,pad-select = <0>;
> > +			reg = <0 0x11013000 0 0x1000>;
> > +			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW 0>;
> > +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> > +				 <&topckgen CLK_TOP_SPI>,
> > +				 <&infracfg_ao CLK_INFRA_SPI3>;
> > +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> > +		};
> > +
> > +		spi4: spi4@11018000 {
> > +			compatible = "mediatek,mt6779-spi",
> > +				     "mediatek,mt6765-spi";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			mediatek,pad-select = <0>;
> > +			reg = <0 0x11018000 0 0x1000>;
> > +			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW 0>;
> > +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> > +				 <&topckgen CLK_TOP_SPI>,
> > +				 <&infracfg_ao CLK_INFRA_SPI4>;
> > +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> > +		};
> > +
> > +		spi5: spi5@11019000 {
> > +			compatible = "mediatek,mt6779-spi",
> > +				     "mediatek,mt6765-spi";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			mediatek,pad-select = <0>;
> > +			reg = <0 0x11019000 0 0x1000>;
> > +			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_LOW 0>;
> > +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> > +				<&topckgen CLK_TOP_SPI>,
> > +				<&infracfg_ao CLK_INFRA_SPI5>;
> > +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> > +		};
> > +
> > +		spi6: spi6@1101d000 {
> > +			compatible = "mediatek,mt6779-spi",
> > +				     "mediatek,mt6765-spi";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			mediatek,pad-select = <0>;
> > +			reg = <0 0x1101d000 0 0x1000>;
> > +			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW 0>;
> > +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> > +				 <&topckgen CLK_TOP_SPI>,
> > +				 <&infracfg_ao CLK_INFRA_SPI6>;
> > +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> > +		};
> > +
> > +		spi7: spi7@1101e000 {
> > +			compatible = "mediatek,mt6779-spi",
> > +				     "mediatek,mt6765-spi";
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +			mediatek,pad-select = <0>;
> > +			reg = <0 0x1101e000 0 0x1000>;
> > +			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_LOW 0>;
> > +			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D2>,
> > +				 <&topckgen CLK_TOP_SPI>,
> > +				 <&infracfg_ao CLK_INFRA_SPI7>;
> > +			clock-names = "parent-clk", "sel-clk", "spi-clk";
> > +		};
> > +
> >  		audio: clock-controller@11210000 {
> >  			compatible = "mediatek,mt6779-audio", "syscon";
> >  			reg = <0 0x11210000 0 0x1000>;
> > 

Dear Matthias:
	
	Thanks for your suggestions, and I have update commit message on patch
v3.Could you please help to gentle ping on patch v3 if it has no other
problems?
	Thanks a lot~

Thanks
Mason
	




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
