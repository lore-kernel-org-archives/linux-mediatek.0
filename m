Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F2AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 14:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9Y/98fPQcSP8sHgrxf4RSFsDAS/ij2GyTaM5zCTMUU=; b=EFZR3HOXpzrGAj
	xXHDDi3S0ww/deXikzj/2qyVV4XO5wywfe3FFEcluOw9XgBUi142x9/7uNfL5OxNsR1HRYufU8+J0
	V2C75XX24CkWkRd3PDZKFX2i/qyvyO2zencDoafSCotzeZhUkL9tGqIXROToAvr/Lv6c35Dam6SC2
	cMCpDVhqfIB8JUHn9GxPQDg8jmypT+l13HIQFAySedNsm/7Z59JwTKfXnfrPcquImhgqWhddN8J1H
	bdIgA8BvFe+yIIP2qOaXvufIx86iVIAf6IkE+3QbufW5Uo16Rnw7tPQpTiKEjHjOR8+c4Kv1entS1
	iSTzLNWD8Isp7JIKflMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np9sB-00CPVb-VU; Thu, 12 May 2022 14:33:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np9s0-00CPOQ-0p
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 14:32:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 bd25-20020a05600c1f1900b0039485220e16so4287078wmb.0
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 07:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gfV6hdj+G/eKhil+K8KKf6Xy30nkm2zLFDY36R9t3Bg=;
 b=N2yYG9TriNOJkpOXXy+kvvvM/AVOyWksfsEqkamccWwpC1p89jHbnFVmMIbjpVpHqn
 ijVwQn5PbA+yltYmAjcbEzdfyMcGeik0hu/dBbEjKrW96bUcGb/31M2/C2xVd75uvGxQ
 7Lu+Ojd2bUFvks7wdtkzdhLxEf1xlOe2mO+vit3gJb4HFJ3V/J/gDz6mwInwXvjDlMS7
 Bu8hBAteXfuNqmRV0VLeKs0YUIIa6pUjdm+qvUS2f/h2cl2LauaSzKOh6WE8miCAm/VN
 CaNlV4gGIPF67/MjFTemRYxuNztld9/UNCXJm51mBxAgRN3DowKDKH3mOu5UnjLxaV6n
 cbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gfV6hdj+G/eKhil+K8KKf6Xy30nkm2zLFDY36R9t3Bg=;
 b=LKYAWRUFrUHomteIlKCe/5NY4p14V4evDUOMLnMl3eq95Jwly33vc6DMnrd98T39sZ
 3kds/gAgja0NqOuCJ1ok0XcH7qi8AP4NxdlDbSURJWokofDJEuWzX2liI4qG87YIbona
 YqEyLSsa85KMExMNHjxYgLtYLXuhTXAOW3uTGAOc+THLD6kn0VQcYKw+cSxbf+fAqf/Q
 RPwgL6Ey/kTEBgO/c9wKLSt9ehJqmVVIhb9+xeh+pMtBfmAivAPQ9rb36Wq5v7nEU98U
 mSJF8dMiwJTZ0C9dj9cVPH92hT4IQHRfM551A9Psz2EvruaD3sn8lZ+vMOBsLjSITaOm
 4huw==
X-Gm-Message-State: AOAM533Sj1tLRiPlTtMxFyHhDMyYl+nQtdlJEJNR2TWqWsEKKnGRZMxt
 HUuUDMc4BS7uOyALNkhsJ1J83A==
X-Google-Smtp-Source: ABdhPJzn0NdYnZ6arUr+7JV+G5AsR7rJ0k6j66fzM/lksa0zMGVqxos0KZ1oxRF7R+mdChnOviCSnQ==
X-Received: by 2002:a05:600c:b47:b0:394:1200:957b with SMTP id
 k7-20020a05600c0b4700b003941200957bmr10506789wmr.2.1652365963660; 
 Thu, 12 May 2022 07:32:43 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b0020c5253d8fesm4459561wrw.74.2022.05.12.07.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 07:32:42 -0700 (PDT)
Message-ID: <a219c974-a291-7fb5-bdd0-1979d9083eb1@linaro.org>
Date: Thu, 12 May 2022 16:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 7/7] arm64: dts: mt8195: Add thermal zone
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de
References: <20220512122433.1399802-1-abailon@baylibre.com>
 <20220512122433.1399802-8-abailon@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220512122433.1399802-8-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_073248_100522_3FC8D848 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, amitk@kernel.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, linux-mediatek@lists.infradead.org,
 rui.zhang@intel.com, ben.tseng@mediatek.com,
 Tinghan Shen <tinghan.shen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12/05/2022 14:24, Alexandre Bailon wrote:
> From: Tinghan Shen <tinghan.shen@mediatek.com>
> 
> This adds the thermal zone for the mt8195.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 103 +++++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 12887fb4d0d1..d6e5b595a89f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -823,6 +823,21 @@ spi0: spi@1100a000 {
>  			status = "disabled";
>  		};
>  
> +		lvts: lvts@1100b000 {

Generic node names.

> +			compatible = "mediatek,mt8195-lvts";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x1100b000 0 0x1000>,
> +				<0 0x11278000 0 0x1000>;
> +			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
> +					<GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +			clock-names = "lvts_clk";
> +			resets = <&infracfg_rst 1>,
> +					<&infracfg_rst 2>;
> +			nvmem-cells = <&lvts_e_data1 &lvts_e_data2>;
> +			nvmem-cell-names = "e_data1","e_data2";
> +		};
> +
>  		spi1: spi@11010000 {
>  			compatible = "mediatek,mt8195-spi",
>  				     "mediatek,mt6765-spi";
> @@ -1627,4 +1642,92 @@ vencsys_core1: clock-controller@1b000000 {
>  			#clock-cells = <1>;
>  		};
>  	};
> +
> +	thermal_zones: thermal-zones {
> +		cpu_big1 {

No underscores in node names. Generic node names - please open existing
thermal zones schema and look how it is done. This probably fails
validation, so be sure your DTS passes make dtbs_check.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
