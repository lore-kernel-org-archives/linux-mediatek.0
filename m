Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8972C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nyy6Th3Ee2yP8Nmo3PufoVlqpcZ7BCR42eJomrE4e/k=; b=yKYd1iR7dWvCRf
	mng43vEeOcOb4m5Ujeh1tF9hJSIa4AXxSrOhHwqf7A78v1g2ngF7O0te3MtcoHn04VlXiN5hI9LTW
	b3YASW/YrdIThPPZuHMunL0Her/CUmaSKYLaCSlt6DjNy4oo95Rqj0wzFYDqdvRNwodNi4t0KoCe6
	k0uqZn7TQpGI6gAotzjDqrTK/QBdkc/LibNB7BaGWjNTD7KlZNLoPwHnpLaug2Hatnixw/iQCoH6A
	pX/+rNxRyZ2AhzOh8FRKuKawAgqWmoX7z+YXcHXEi3ye6wZ+EIx6Rh2U94+NAXiMUK9+Q4tSrmBSa
	fCdWOUYeKa6aBJ3FSJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxn07-004QuM-0v; Thu, 16 Dec 2021 09:24:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxmoN-004LGZ-FD; Thu, 16 Dec 2021 09:12:28 +0000
Received: by mail-wr1-x436.google.com with SMTP id k9so25090919wrd.2;
 Thu, 16 Dec 2021 01:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=n9WzHIjXvECnFCwuJsTEEf3R6uxYVIhvGrmbBXUvc6I=;
 b=pPmoimLBuzhj3RdD5eDpNgUb/EXfIxpVN2ot8wiwZQvJMXrVjhIlV2Gn26i3evhDKt
 PHvi42hiCiPPp93orhCeKXUQR91o0dPva1BGcOwVoB3JRHt18cRHSRlG+GUb5KMQ8/MB
 qE8A4KDrd8myE7EVTKbZbELqhmjDUdM9Wag7f+uR+FtO+LCN52NUHOeYk9biiPUD9WCP
 fxDVH4m36fFbqIEhRDCkOiPIyJp6fKbiHxfQ3mTnEX8YJDoV1jnnWCw1btq3f3LlprkZ
 Gb7O3q7Y0MkIX+GT8WvqpNxWxG7I5P3wlsKiXRHXAy20H6J+HbJC+/zvq85OpRQLyHMV
 5IOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n9WzHIjXvECnFCwuJsTEEf3R6uxYVIhvGrmbBXUvc6I=;
 b=YASVu87sKgKbQyTTseW+Zaf4elAcpjjEzwum7r3gjr93zvOnk4LM0pK6SSzmXPJ2hr
 2Cb8Cay0rbRCvTo9knr4bms+poDoaiYEnx9oMJwilBrQwvnmwoFSq+0SYxdIEB9jt2eh
 IKgkGRPVKoJOQjVdvHGA8kN1JdM9htyt/pASEejv8VzfbOGp7wcg/6oO0UryoTPZN17N
 iZ7hQnUhWs5owTvDc88JqtymooS8jeJHsLywJoc44wZYD92mFgdxsAZblNiATcbwZtds
 vSaHywnl7VNyi/YJXiMu9+9Xt4OJrOfuC0RgY7PEwEybXt2MYP35eEW7a5DdPszCsysF
 eDOQ==
X-Gm-Message-State: AOAM531r6NBRZ6+QfaFF8HX+KrvuZ6VARHIp/S/81so/+DS1SD7eRIC7
 sbM5sYOW1J1K3/tBJzxJD88=
X-Google-Smtp-Source: ABdhPJxs60m/PyxYGTlZEcF8CS/PSulr+ZJjmwMiF44qcLG5o04D93W6wM1dsEv1ky5z3OFeJHpwCw==
X-Received: by 2002:adf:dbcb:: with SMTP id e11mr7978923wrj.575.1639645946081; 
 Thu, 16 Dec 2021 01:12:26 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id j13sm1561830wms.13.2021.12.16.01.12.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:12:25 -0800 (PST)
Message-ID: <c3f49e45-ccfe-dc11-52c5-c204d6f7a889@gmail.com>
Date: Wed, 15 Dec 2021 20:20:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH net-next v8 3/6] arm64: dts: mt2712: update ethernet
 device node
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, srv_heupstream@mediatek.com,
 macpaul.lin@mediatek.com, angelogioacchino.delregno@collabora.com,
 dkirjanov@suse.de
References: <20211210013129.811-1-biao.huang@mediatek.com>
 <20211210013129.811-4-biao.huang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211210013129.811-4-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_011227_570442_9EE54D50 
X-CRM114-Status: GOOD (  17.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/12/2021 02:31, Biao Huang wrote:
> Since there are some changes in ethernet driver,
> update ethernet device node in dts to accommodate to it.
> 

I have a hard time to understand how the changes in 1/6 and 2/6 are related to 
that.

Please explain better what has changed. Also beware that we shouldn't introduce 
any non-backward compatible DTS changes. That means, the device should work with 
the new driver but an older device tree.

Regards,
Matthias

> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt2712-evb.dts |  1 +
>   arch/arm64/boot/dts/mediatek/mt2712e.dtsi   | 14 +++++++++-----
>   2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> index 7d369fdd3117..11aa135aa0f3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
> @@ -110,6 +110,7 @@ &eth {
>   	phy-handle = <&ethernet_phy0>;
>   	mediatek,tx-delay-ps = <1530>;
>   	snps,reset-gpio = <&pio 87 GPIO_ACTIVE_LOW>;
> +	snps,reset-delays-us = <0 10000 10000>;
>   	pinctrl-names = "default", "sleep";
>   	pinctrl-0 = <&eth_default>;
>   	pinctrl-1 = <&eth_sleep>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> index a9cca9c146fd..9e850e04fffb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
> @@ -726,7 +726,7 @@ queue2 {
>   	};
>   
>   	eth: ethernet@1101c000 {
> -		compatible = "mediatek,mt2712-gmac";
> +		compatible = "mediatek,mt2712-gmac", "snps,dwmac-4.20a";
>   		reg = <0 0x1101c000 0 0x1300>;
>   		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
>   		interrupt-names = "macirq";
> @@ -734,15 +734,19 @@ eth: ethernet@1101c000 {
>   		clock-names = "axi",
>   			      "apb",
>   			      "mac_main",
> -			      "ptp_ref";
> +			      "ptp_ref",
> +			      "rmii_internal";
>   		clocks = <&pericfg CLK_PERI_GMAC>,
>   			 <&pericfg CLK_PERI_GMAC_PCLK>,
>   			 <&topckgen CLK_TOP_ETHER_125M_SEL>,
> -			 <&topckgen CLK_TOP_ETHER_50M_SEL>;
> +			 <&topckgen CLK_TOP_ETHER_50M_SEL>,
> +			 <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
>   		assigned-clocks = <&topckgen CLK_TOP_ETHER_125M_SEL>,
> -				  <&topckgen CLK_TOP_ETHER_50M_SEL>;
> +				  <&topckgen CLK_TOP_ETHER_50M_SEL>,
> +				  <&topckgen CLK_TOP_ETHER_50M_RMII_SEL>;
>   		assigned-clock-parents = <&topckgen CLK_TOP_ETHERPLL_125M>,
> -					 <&topckgen CLK_TOP_APLL1_D3>;
> +					 <&topckgen CLK_TOP_APLL1_D3>,
> +					 <&topckgen CLK_TOP_ETHERPLL_50M>;
>   		power-domains = <&scpsys MT2712_POWER_DOMAIN_AUDIO>;
>   		mediatek,pericfg = <&pericfg>;
>   		snps,axi-config = <&stmmac_axi_setup>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
