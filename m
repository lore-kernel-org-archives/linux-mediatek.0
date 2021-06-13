Return-Path: <SRS0=gblj=LH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0353EC48BCF
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 06:30:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8BE8611CC
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Jun 2021 06:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8BE8611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUqZzldTqXMjWT0saa6/KA0AyEDAv8dE07eY2jrX0D0=; b=pJvnNpZEasBZzN
	AVFYpVagJUmBOPNMzbbu12Xi53YraaldsqjjTFnaIw0jDi56dhBt3VCETrXQwVc1jBn9SwTJzA9di
	UyEH4sIr/r7nJS51/l9mndS3lwSyUa/jfNMCu8UCkMLkJc//S++Zm3DvHm5V+uRYg7cKo0mHAbZvM
	fl/ETLw6z1/1HIe7vlJ4r7hRDKLZ0NzNbDHZRTHH8lsbp+0X38u0VR1/MhvRC4hF9qJgxF8XaAnAo
	Uky/mTpFVHi7GtfQGXrzGhoCl4zlJFfJrWpD3+yPP4ngvkQDFqDULOoBjjfKHnUemRPz5vK9rJGuJ
	o2AhiqYO4/0un9AnaYSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsJdU-009nzI-7c; Sun, 13 Jun 2021 06:30:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsJdH-009nyW-Nf; Sun, 13 Jun 2021 06:30:09 +0000
X-UUID: 26fdba8ed1cb451785900082125a7b99-20210612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8WtSPGkNuQ7241ILje9VJjGKNPvfoYVf4vIrsfMG0ug=; 
 b=K8UiGnfvo+MCmjEpBErRXJzmLG2dzqGpm+hPQ8CRhlR+FzF0UZ56imdR7N0iWkyZ/giPNEXRsp2aNqu9/7vjMnidEZXO5MhnbDawIWlS2KIGfm8NxFHDZU/3L5VmhfdBgFuL2/h3BZDLoEzqQ86FU2FTNnVVbxprimPUHq5se+g=;
X-UUID: 26fdba8ed1cb451785900082125a7b99-20210612
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1957109838; Sat, 12 Jun 2021 23:30:03 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Jun 2021 23:30:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Jun 2021 14:29:48 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Jun 2021 14:29:47 +0800
Message-ID: <1623564933.15174.5.camel@mbjsdccf07>
Subject: Re: [PATCH v2 1/1] arm64: dts: mediatek: add MT6779 spi master dts
 node
From: Mason Zhang <mason.zhang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <hanks.chen@mediatek.com>,
 <wsd_upstream@mediatek.com>
Date: Sun, 13 Jun 2021 14:15:33 +0800
In-Reply-To: <faafa83d-4831-2b70-78ec-0e9f3636b5c9@gmail.com>
References: <20210409015651.11474-1-Mason.Zhang@mediatek.com>
 <faafa83d-4831-2b70-78ec-0e9f3636b5c9@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_233007_803558_9D681D61 
X-CRM114-Status: GOOD (  15.81  )
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


Dear Mattias:

	Thanks for your suggestion~

	I have update commit message in patch v3.Could you please gentle ping
on patch v3 if it has no other problems.

Thanks
Mason












> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
