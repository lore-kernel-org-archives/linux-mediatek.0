Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F7BC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csi0jdlp5xAkr7/d6DDwvfUFlCLN9g54V1gof/K6y3I=; b=lXdnpF/YmWbqO8PR2DgOzSJ5yd
	jbRR+OBFxKPTfSEE2k5n1O4pSroFVrgY0yaCOURpRvmGiU9CgQnEz+HoaAlljimUNntFYzXvGgi1t
	96glWwTX+pvWYhvyCy7lZqQitEUovfF+/jGu+uG16OuhIwT/ktrIxrBikFbHgGfOBg0UcVaniXhMJ
	HWzqCNcJcmHWVDGlcKBV5QH2WzWXKI3lV2Bal9G5dHthOBU9eVUsdddpqTtQiHRHCRBNdpxq85X/P
	XShPskfQ17Lycc5gnavbvCv7l/5ChQvWe/eYm5RpKd9FGvzRLrO0FeQpdAxMfVoy4jQTWiM0Lv1f4
	ubKEqv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVn5-000NBM-25;
	Wed, 29 Mar 2023 13:24:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVmz-000N8P-18;
	Wed, 29 Mar 2023 13:24:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 85F5D6603173;
	Wed, 29 Mar 2023 14:24:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680096271;
	bh=QC+TVvnacafeIHmbzTyunv64Km/TSjEM1hbjaqYCL0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Wq/ZHR3gmA5TcS6nh98MqlxCjA+ciMEgTZAOYfId/MOzbR42VJJGeD9AzSnoAC7hK
	 HKU+plaSGCBXOTMucZfWhLBmsmqcbCnsS6TOV6AeZBJazvS0ENHSO9whtJDnRIPiyn
	 w3bP8f9jcIFpn3ZRO3q3swCiuXkviDRw4+nntIS8HiuOe2puLgiVOf5qiqkXVgj/OR
	 SBh9fig+Qw9uJUh4iyTG+o5NXU43neKkZn9Qa8FRUcpZ4dZRmAkxz3Ut/haLXwwaE3
	 0HORYdmXIHgOMHljij5NqxbpB0UJkmdTxWCxT/X9Q8HbZ9NUYT0AzAe/KK9iUbdcj8
	 HovQFH0OkXDcA==
Message-ID: <67af041d-cce5-8c3b-e979-7b95a6a7a149@collabora.com>
Date: Wed, 29 Mar 2023 15:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 09/17] arm64: dts: mediatek: add mmc support for
 mt8365-evk
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
 <20230203-evk-board-support-v3-9-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-9-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_062433_517606_2FF531F4 
X-CRM114-Status: GOOD (  16.92  )
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
> - Add EMMC support on mmc0 (internal memory)
> - Add SD-UHS support on mmc1 (external memory)
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 138 ++++++++++++++++++++++++++++
>   1 file changed, 138 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 2f88562c638a..b5d018686cbe 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -97,6 +97,42 @@ &i2c0 {
>   	#size-cells = <0>;
>   };
>   
> +&mmc0 {
> +	pinctrl-names = "default", "state_uhs";
> +	pinctrl-0 = <&mmc0_default_pins>;
> +	pinctrl-1 = <&mmc0_uhs_pins>;
> +	bus-width = <8>;
> +	max-frequency = <200000000>;
> +	cap-mmc-highspeed;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	cap-mmc-hw-reset;
> +	no-sdio;
> +	no-sd;
> +	hs400-ds-delay = <0x12012>;
> +	vmmc-supply = <&mt6357_vemc_reg>;
> +	vqmmc-supply = <&mt6357_vio18_reg>;
> +	assigned-clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>;
> +	assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL>;
> +	non-removable;

That's a bit messy :-)
Can we please reorder this by name?

	assigned-clocks....
	bus-width
	cap....
	hs400-ds-delay
	max...
	mmc-hs...
	no...
	non-rem...
	pinctrl...
	vxxxx-supply

	status ....

...Actually the same comment also applies to mmc1.

Cheers,
Angelo


