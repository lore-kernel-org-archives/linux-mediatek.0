Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B1FC761A6
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOVTcbCCXSzwsivPukLcGGt3PM3c/t117YPSTKRxu4I=; b=lJllFhsEgOFtZcTgCaWLAlysfg
	F3sxzikUgfzfA+1H4MiEOJzZCVb9UFgIaHXsOO7i66DzTf3LIIuiGqMwMV9XqaNjfxUzjDCvrzIYd
	WZ398orjEg77UbiVh344KgQKhNF55L6m1MLgwIALWmj868FAIKMIJIAMi7WjlnDd1t+0QBczHB1DW
	spIcb0C8UemL+BOI/VuQjO86PEWSdVwo6Df3RJVoS+omf0+YuZh47WfawSZ5NUJ0DfHWf/+9FkMt1
	UfN1B19vD46mfBOM+kyY/loFqkSofZ6CJ3BAkQ9Z4n+Skr9REFXoodRHl00lpfdFL48YPCLHfddpj
	gUQj9HZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVio-000L5W-0K;
	Wed, 29 Mar 2023 13:20:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phViE-000Kjo-35;
	Wed, 29 Mar 2023 13:19:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 96CDF660316F;
	Wed, 29 Mar 2023 14:19:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680095977;
	bh=eTY1WyqAhJmuZJ8EeS1G+kzoPFmIenmK8Sm9paFA/2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JoP2eDlXh49eiOiujCSpAq79+gKb0i6t7ZaKOK6hIRax6nbxSV2X5DeyvPVP8AP7M
	 Nn6VwZFZQ0jtnU8QPO7DvKEU5BqZMivjilJS3EFp4Cn4wfs0TTaanlaqVpAuGbjihN
	 mqzyiew1JA2RhuPT4ciohgkvnOjRCThozDHRBJBX+iszXtJ8rKWx1HxrRMKniv+ZUW
	 h2dmW3qkyUd5P8JbHl0dmG2YLulVPCafZssbaxitsQMmIry9bXOHDSLdAkfJfWzGaM
	 2iV7+fWEkvLLcv7AedFxFP7eeQuvq04B6XyH5IJSljb+hqP9JzrIkpJh+LqfhSH2dU
	 BIMJqSwk/ICTw==
Message-ID: <041248c0-ac27-4992-e824-556aadedaaf6@collabora.com>
Date: Wed, 29 Mar 2023 15:19:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 06/17] arm64: dts: mediatek: add pwrap support to
 mt8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-6-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-6-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_061939_127574_2A3F6DC9 
X-CRM114-Status: GOOD (  16.82  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/03/23 10:54, Alexandre Mergnat ha scritto:
> In order to use the PMIC, the pwrap support should be added
> to allow communication between the SoC and the PMIC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index e018df6844f6..687011353f69 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -186,6 +186,18 @@ apmixedsys: syscon@1000c000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		pwrap: pwrap@1000d000 {
> +			compatible = "mediatek,mt8365-pwrap";
> +			reg = <0 0x1000d000 0 0x1000>;
> +			reg-names = "pwrap";
> +			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&infracfg CLK_IFR_PWRAP_SPI>,
> +				 <&infracfg CLK_IFR_PMIC_AP>,
> +				 <&infracfg CLK_IFR_PWRAP_SYS>,
> +				 <&infracfg CLK_IFR_PWRAP_TMR>;

I would prefer:

clocks = <&infracfg CLK_IFR_PWRAP_SPI>, <&infracfg CLK_IFR_PMIC_AP>,
	 <&infracfg CLK_IFR_PWRAP_SYS>, <&infracfg CLK_IFR_PWRAP_TMR>;

....but I'll leave this choice to you, as I don't have really strong opinions on
this one, so, with or without the proposed change, you still get my:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



