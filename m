Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB467C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 13:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsDM4Ty0VJvUfKoSDTTWV9Ke7crO698KvDxGABcC38c=; b=mXqp8zhSS5RRac
	QTRjWorno26Y38Loo2XLbWl6mN73gva5ZuYHcbXZ1pmgnQG0PfJTUdPBkthoqyOKFeomfQi+CReQQ
	xA0rBEpjsD1v2SjIvovRJqsGanEOXQg1IGvKYoVbpyI0jNV34jIbR9suqQj7SraIaPDMLWAL/iDbk
	bIMPnysRYLxnI4sg8HuPZqZ7F7TLzIYNEa/Tl0VlWI2XwvqM3bU3EphRFuIzOPwAWA3YIDUFiKDWc
	XXuN54xPwHtP0KklQd2JkqeJBeiNQFbccw+lqqvW/7lb+FtJq2fIV3ho5UqAtNyufeyJj/1T8mi1Y
	rFzi/Ujql9dWrNCxhDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM91m-0060f5-LX; Mon, 21 Feb 2022 13:46:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM8Wg-005qCQ-TX; Mon, 21 Feb 2022 13:14:53 +0000
X-UUID: 33b29359257a4f42b2011abf501d52e7-20220221
X-UUID: 33b29359257a4f42b2011abf501d52e7-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1315591657; Mon, 21 Feb 2022 06:14:47 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Feb 2022 05:08:18 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Feb 2022 21:08:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 21:08:04 +0800
Message-ID: <1d3942f0551a6e500001dbce0d9434b3b57c83f7.camel@mediatek.com>
Subject: Re: [PATCH v2 13/23] arm64: dts: mt8192: Add mmc device nodes
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 --to=Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
Date: Mon, 21 Feb 2022 21:08:04 +0800
In-Reply-To: <518a64d5-2101-dc31-c409-e9c99458c900@collabora.com>
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-14-allen-kh.cheng@mediatek.com>
 <518a64d5-2101-dc31-c409-e9c99458c900@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_051451_021563_7A5CC37A 
X-CRM114-Status: GOOD (  16.06  )
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

On Fri, 2022-02-18 at 13:55 +0100, AngeloGioacchino Del Regno wrote:
> Il 18/02/22 10:16, Allen-KH Cheng ha scritto:
> > Add mmc nodes for mt8192 SoC.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 36
> > +++++++++++++++++++++---
> >   1 file changed, 32 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index 094805db395b..cfc2db501108 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -1154,10 +1154,38 @@
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
> > +			reg = <0 0x11f60000 0 0x1000>,
> > +			      <0 0x11f50000 0 0x1000>;
> 
> This fits on a single line:
> 			reg = <0 0x11f60000 0 0x1000>, <0 0x11f50000 0
> 0x1000>;
> 
Hi Angelo,

This is my neglect and will correct this in next version.

Many thanks,
Allen

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
> > +			status = "disabled";
> > +		};
> > +
> > +		mmc1: mmc@11f70000 {
> > +			compatible = "mediatek,mt8192-mmc",
> > "mediatek,mt8183-mmc";
> > +			reg = <0 0x11f70000 0 0x1000>,
> > +			      <0 0x11c70000 0 0x1000>;
> 
> Same here.
> 
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
> > +			clock-names = "source", "hclk", "source_cg",
> > "sys_cg",
> > +				      "axi_cg", "ahb_cg", "pclk_cg";
> > +			status = "disabled";
> >   		};
> >   
> >   		mfgcfg: clock-controller@13fbf000 {
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
