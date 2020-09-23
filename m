Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDDCC2D0A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 14:39:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73A2D21D92
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 14:39:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gz5IcO7g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73A2D21D92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+Cu85jf0wu14zUF9VwCdEX9jFffjdcD/5winqzr5DCM=; b=Gz5IcO7gkTv+BGIy3Hw3/bNSv
	5Z86Xzz5z9a+JJrXFK+vWw6U1ZF5scOnvjyCKBRtdVw83PK6G4EvrWlqzUbhK//bNfypXVEzubUr2
	/XPRNJFvmKfcdpBToOTGE0afH9nhFLUkpfT1KY5NGR4l8cKTHhCl8T6KJoW/lyK3sxaS63LvjPiqj
	MIij6sUt7TQuDF56Ov4ff0oqgzhVwhpWT0aNsk6A9AsYGfBfztDo58Up6ooOSTrO1YQWQuZdDrgIj
	2tN9DGk4NCYAqJIzCyFgfgberdmdKRsOCZvwZY0Cn10RlZ6jyKAWLgiqYhRfjAA9g34twO4kOIO63
	JFpg5NF+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL5vo-00033a-5r; Wed, 23 Sep 2020 14:39:40 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL5vH-0002pb-Fo; Wed, 23 Sep 2020 14:39:12 +0000
X-Originating-IP: 90.65.92.90
Received: from localhost (lfbn-lyo-1-1913-90.w90-65.abo.wanadoo.fr
 [90.65.92.90]) (Authenticated sender: gregory.clement@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id DB6D0FF80F;
 Wed, 23 Sep 2020 14:39:02 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?=
 Cousson <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Jason
 Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Tero
 Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, Michal Simek
 <michal.simek@xilinx.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 14/15] ARM: dts: armada: align GPIO hog names with
 dtschema
In-Reply-To: <20200916155715.21009-15-krzk@kernel.org>
References: <20200916155715.21009-1-krzk@kernel.org>
 <20200916155715.21009-15-krzk@kernel.org>
Date: Wed, 23 Sep 2020 16:39:02 +0200
Message-ID: <87a6xgimm1.fsf@BL-laptop>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_103907_742693_D7615A29 
X-CRM114-Status: GOOD (  15.65  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

> The convention for node names is to use hyphens, not underscores.
> dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.


Applied on mvebu/dt

Thanks,

Gregory

>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/armada-388-clearfog.dts  |  4 ++--
>  arch/arm/boot/dts/armada-388-clearfog.dtsi | 10 +++++-----
>  arch/arm/boot/dts/armada-388-helios4.dts   |  6 +++---
>  3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
> index 20f8d4667753..4140a5303b48 100644
> --- a/arch/arm/boot/dts/armada-388-clearfog.dts
> +++ b/arch/arm/boot/dts/armada-388-clearfog.dts
> @@ -73,13 +73,13 @@
>  	 * 14-SFP_TX_DISABLE
>  	 * 15-SFP_MOD_DEF0
>  	 */
> -	pcie2_0_clkreq {
> +	pcie2-0-clkreq-hog {
>  		gpio-hog;
>  		gpios = <4 GPIO_ACTIVE_LOW>;
>  		input;
>  		line-name = "pcie2.0-clkreq";
>  	};
> -	pcie2_0_w_disable {
> +	pcie2-0-w-disable-hog {
>  		gpio-hog;
>  		gpios = <7 GPIO_ACTIVE_LOW>;
>  		output-low;
> diff --git a/arch/arm/boot/dts/armada-388-clearfog.dtsi b/arch/arm/boot/dts/armada-388-clearfog.dtsi
> index a0aa1d188f0c..f8a06ae4a3c9 100644
> --- a/arch/arm/boot/dts/armada-388-clearfog.dtsi
> +++ b/arch/arm/boot/dts/armada-388-clearfog.dtsi
> @@ -141,31 +141,31 @@
>  		#gpio-cells = <2>;
>  		reg = <0x20>;
>  
> -		pcie1_0_clkreq {
> +		pcie1-0-clkreq-hog {
>  			gpio-hog;
>  			gpios = <0 GPIO_ACTIVE_LOW>;
>  			input;
>  			line-name = "pcie1.0-clkreq";
>  		};
> -		pcie1_0_w_disable {
> +		pcie1-0-w-disable-hog {
>  			gpio-hog;
>  			gpios = <3 GPIO_ACTIVE_LOW>;
>  			output-low;
>  			line-name = "pcie1.0-w-disable";
>  		};
> -		usb3_ilimit {
> +		usb3-ilimit-hog {
>  			gpio-hog;
>  			gpios = <5 GPIO_ACTIVE_LOW>;
>  			input;
>  			line-name = "usb3-current-limit";
>  		};
> -		usb3_power {
> +		usb3-power-hog {
>  			gpio-hog;
>  			gpios = <6 GPIO_ACTIVE_HIGH>;
>  			output-high;
>  			line-name = "usb3-power";
>  		};
> -		m2_devslp {
> +		m2-devslp-hog {
>  			gpio-hog;
>  			gpios = <11 GPIO_ACTIVE_HIGH>;
>  			output-low;
> diff --git a/arch/arm/boot/dts/armada-388-helios4.dts b/arch/arm/boot/dts/armada-388-helios4.dts
> index fb49df2a3bce..b3728de3bd3f 100644
> --- a/arch/arm/boot/dts/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/armada-388-helios4.dts
> @@ -166,19 +166,19 @@
>  					interrupt-controller;
>  					#interrupt-cells = <2>;
>  
> -					board_rev_bit_0 {
> +					board-rev-bit-0-hog {
>  						gpio-hog;
>  						gpios = <0 GPIO_ACTIVE_LOW>;
>  						input;
>  						line-name = "board-rev-0";
>  					};
> -					board_rev_bit_1 {
> +					board-rev-bit-1-hog {
>  						gpio-hog;
>  						gpios = <1 GPIO_ACTIVE_LOW>;
>  						input;
>  						line-name = "board-rev-1";
>  					};
> -					usb3_ilimit {
> +					usb3-ilimit-hog {
>  						gpio-hog;
>  						gpios = <5 GPIO_ACTIVE_HIGH>;
>  						input;
> -- 
> 2.17.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
