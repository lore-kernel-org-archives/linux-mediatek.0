Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC03C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 19:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vTXE/BrMgCrewt7+vV7/RxnHD+Qcri1XadchjbrorgU=; b=saNrNi2NEVR6gt
	OxE9ZgT0kV8snijDCaEIIgmyCJ6TeH1Ow2ok3puadOo+KbL34PFFz0ywPudDWtDI5qNW3xuOG4skY
	3y7Js9oyFMsaAOw3NmX+fnPkAqHhUWlMadcVvIOfSagxJvctznPcZQLfEcD8JgDMTMoFtp3f14K4y
	8ExXK3CFtwUNaYcRduLjrllfJP2RXfbzC8nGRBBiMVwodVm4Gqa9nOeUG3T1Vz7yt8Ywzi8RHFa1u
	F1/bqkW88Zy5MRtOoJfntZGzKOm7AqFsj3qVTxRjkQxY3Y6HNO4efzjv4qAP1x8+3GfqifKdZwNF0
	OEw3pRxSNd8ltkvhtAkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxZrw-002OdQ-Ek; Wed, 15 Dec 2021 19:23:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxZrh-002OYZ-QM; Wed, 15 Dec 2021 19:23:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so333582wmb.1; 
 Wed, 15 Dec 2021 11:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZYwgBJaj/unectxNhsPO9gtbst5oHKfm3K6XFRszQRI=;
 b=Q8NaUFUtT9c0f6DWp6vcNspUZhwLnLLSM/MRmWvwOXoaGLFgWTvznHeCK6G6Lv934a
 M64NfrQya2KQIzKh01W+U12Fc7ldmtVW9/QKNPPcJfW98omhxwTAOLoQ1tnf9uozXYFR
 NhqMlEouQ17uLSmCToamGDc9h6NyMYGaKDiYqrTPVJu/H03fyy6Qkf27XcnGnbhzzBnl
 2L+yId8J8VjvBTK3Jdi7/LtTrlpECXazAnNo0EWmPimXS9G6qtvsCBIYC7zN/DXF26LE
 dcIzRF8iQwU8dwLNXKqq2yrKot8R+jQPOyNSsNpSZWudcWz1a4njmkaYgWQJYoR8yS3E
 9mIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZYwgBJaj/unectxNhsPO9gtbst5oHKfm3K6XFRszQRI=;
 b=I99Ff02RMYYZFwmejxc4+6cP61hAXJucOQKvRWQeE05w48Z0Hh3tlaPyWTWkvWenDj
 KajenbQ8BR94owMcTdbNYJ92rRZLtcw3Tgg1EIsuCxAZ0zJozhbaS6Ww7JGXW3x9H2OL
 xjyFuzZQ+OiqOHtrdZ15e+bLRjaGBC54d7jlOKHSae8hS1u9s4k3WabDsWGhEToHN3l2
 WT7/H8XdUpWXcshNZo4+7I0sRhfKfXXDYA1wWWT+frWsvocvoWPKe7w2/CrvO9xSfWI8
 KvUg9JzNzKe8o9Xd0Bb+sdJYIYehBJKKVRXdSX+PxOZH6RWaPcBnAu/1Az9RQ6Qj8/Vv
 a8sg==
X-Gm-Message-State: AOAM531lPkAtU71LXlDf+YGvly1H8UGAriPcpM51aOgKlzGyBJOEmeOJ
 I8uniQPCRJ4pB0wrC8KPhaI=
X-Google-Smtp-Source: ABdhPJwNwyh4XxuqT5udvlzXiwRG9boU1Qdrw7Pw7evZ7Hxcwq1PG3znUeUEH0XlTzDd6waANd8aVg==
X-Received: by 2002:a05:600c:3788:: with SMTP id
 o8mr1574047wmr.82.1639596179243; 
 Wed, 15 Dec 2021 11:22:59 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id m17sm2676457wrw.11.2021.12.15.11.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 11:22:58 -0800 (PST)
Message-ID: <c9b3d31a-1c18-32ec-8077-603bb93fe8d0@gmail.com>
Date: Wed, 15 Dec 2021 20:22:57 +0100
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
X-CRM114-CacheID: sfid-20211215_112301_911174_D1F0F6AA 
X-CRM114-Status: GOOD (  19.52  )
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

I have a hard time to understand how the first two patches are related to this 
one. Please be more specific in your commit message.

Also please beware that we should make sure that a newer driver version should 
still work properly with an older device tree, which does not have your changes.

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
