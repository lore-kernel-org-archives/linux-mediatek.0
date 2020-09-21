Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACB5C43464
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 09:46:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 041802076B
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 09:46:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TzrN3czi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiCBPrtD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 041802076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EFYr9/LgwvClIbgcDsIWo82WI+6TvIZ8NzgJhUUTPBY=; b=TzrN3cziJde4I1pDsYuhOpILN
	eyriXdnJ8SxMGj/fxv2oilYW12ofYHhsv8lVCpQ+buRWg49BGe7q9J9qrnvswdURnxFmMJLxtZIq8
	bcuf7FrxqEivY54L5In8e0qANHFyqBgtCr/NrTNa+2VT6ayu5b3oJ2Ii5itZHVpiA+lWoohlkKT2F
	+gWKq3B4Dk7Xtq1dQim1GOStDMFHwLCryMU0NGfQ6z5Xm+Xn20oAqOIBB+qU2cM9qKx6LLxBAkD0X
	8iuEYtRvnWeu5RzRCZ9/OIuLkE7KTm9usYVwfX+Se5sQxXcNWIGM29ljyIVVTDGtuKEDKfqYaZ8k4
	oG2Y/LGUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKIOc-00027q-Q9; Mon, 21 Sep 2020 09:46:06 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKIOZ-00026w-Ub; Mon, 21 Sep 2020 09:46:05 +0000
Received: by mail-wr1-x441.google.com with SMTP id c18so12005293wrm.9;
 Mon, 21 Sep 2020 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=10MZ+wZvlSGpLMLJeIkgsqILP3ii9lT0DDHtw+L14VY=;
 b=eiCBPrtDbQz9fZpSRMUVbN6HVT+LTVz2w9MZX2zQfNgGbnCdcsn5WeyL8Qcx5+1g8T
 9f872qU2PLofzXy9DUTawLWrew/J7qTtkZTiRDYSaXvhieK4GNA58JQuLyrVGsoZfrN3
 yARyCoQqcCMVcFeWbC7kCcoWTdc7VsnaJYVp57FQSbfWTL5qUgWpqetSd7kJsmpq3Tl1
 O/dQqLtq1BJZu6cjPVEFpNbG0wN7JiEh/rq+O3muezrENYoo4tjwNy84IQgCoWkCY3mA
 3nIGirFmE95me64ZAnC4fcEnl9s6YyR2ypK6aQPvSH8C1tLyRsTKX6KU2vjoW94K3Hwb
 N/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=10MZ+wZvlSGpLMLJeIkgsqILP3ii9lT0DDHtw+L14VY=;
 b=Ewvpe43m18HSirBnjMROohpLryigzeqYZyGFDS1ZTnftpcq5WbX6yCzbgGvCR04gnU
 kDacZF/e/iKyJ2ezxSSlBukDH11LVuGDfRi+BBlamJfcSEdgs/DZxo6hHkkx0FARpIc2
 L6/lm9ruVHfRF340A+hW8QNYl5DIqVlEggxjUYXLjYmmtZR9kQMHx0tWdsioCdI2z5ST
 hmKZQLBrq1Hj3XwUOAwy7uSXEKYHqVPNaW2NR0dAEAJlQOZVZqasaUhx5vACFhgIzuTH
 l5PhrIOVnwKtfGI78r3v2XjejKRSzBcNPnM2P4M/zv56N4H1UoIJubxxnj5DrOcUbVDy
 UWlQ==
X-Gm-Message-State: AOAM530lc0GSz7jKXRMnzIOjC3+6U/KwdUcDbGMnsPliKwPs+9+k0wZJ
 7607Z4unP3z44wWYOaFVbQQ=
X-Google-Smtp-Source: ABdhPJznDhgMre1h2yMv5CA2MkQwbd2x1oCcy4YKpIiOFgYsBiNKv6yfhzZXlH8PLSlsOD0bvbtTBA==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr51052257wrs.218.1600681562851; 
 Mon, 21 Sep 2020 02:46:02 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id t202sm19475945wmt.14.2020.09.21.02.46.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 02:46:02 -0700 (PDT)
Subject: Re: [PATCH v2 03/15] arm64: dts: mediatek: fix tca6416 reset GPIOs in
 pumpkin
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Russell King <linux@armlinux.org.uk>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Tero Kristo <t-kristo@ti.com>,
 Nishanth Menon <nm@ti.com>, Michal Simek <michal.simek@xilinx.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-4-krzk@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <911e34dc-3516-d15d-89d6-1e234e9309f6@gmail.com>
Date: Mon, 21 Sep 2020 11:46:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910175733.11046-4-krzk@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_054604_037575_D42A5550 
X-CRM114-Status: GOOD (  20.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/09/2020 19:57, Krzysztof Kozlowski wrote:
> Correct the property for reset GPIOs of tca6416 GPIO expander.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to v5.9-next/dts64

Thanks!

> ---
>   arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> index dfceffe6950a..29d8cf6df46b 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -56,7 +56,7 @@
>   	tca6416: gpio@20 {
>   		compatible = "ti,tca6416";
>   		reg = <0x20>;
> -		rst-gpio = <&pio 65 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pio 65 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&tca6416_pins>;
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
