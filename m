Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CA7D1AD43
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 10:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pF4Tuc2z3/bPSJYCIIHJrkr8buOr4YNmHE70oeINy3A=; b=RNe55ZZkwZq94A4jmITgDAxrws
	11WOZxPe7MPZixlDup34ky7i0TquGc1Ve8vqMZJ+d/k5EZbEoOLzMVLQIkzAVdS1WCtZh3pHdEw6C
	YyUt7y1Cto9P1lYyat1uSnTan+7sG1Fcd+iJjxmeqnLiyQCqtXCxgVMiTvNBCIjwqok1yVvYoV3lC
	55w5Fcgkbw4gidNdGGeyUr8CT7ptNCNgJ9UTAn2p0d4t6VyhNelMoS54l9LM/2hXs/XEzGar5gUTD
	AyN4z8VDca8IFgG3TRgI+t9xdD0ivtwk046rDxiTEbcwQ9H2AYkajLxLAn/kHMmLUSDLr/rh5hJe+
	l/SOG9Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t11ak-0000000BVZP-0rNF;
	Wed, 16 Oct 2024 10:49:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t11TN-0000000BUSd-2299;
	Wed, 16 Oct 2024 10:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729075304;
	bh=heW2gSjWmQF9M4ji5o3r7Gfvxeg1F4J8kCossJjMnSw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k5Thxby6dFoix1wv0Vi/LR5UCYus34KMbreWE84je5yfyimTaBFBccyUA4fpDjI8j
	 k0uGuas2YCbC5bUwLyKrQCKFgnzmNajtih74LiQTAl6kIINfs3Aaa5sA5KsaqC7Ixg
	 mi4gc1zU8IdptodAWw0mojB8xYkDDkRMGxH6Veh9eyAtjIy8p6AZV+093BYr1bwgwx
	 ZElAaM9OITqwcAwslN9SafT/yLQxakn1415Iea84Ai1N4vBTvZ8uQZv3X6RdVqZUAe
	 uErS7owM/BG1r1LQX1FIpoMaJ4npffCuIt4rgnt/UqfECkxvIRumjcMxd0ePHlNDWt
	 J71ydL0Z3jCpg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43AE817E139E;
	Wed, 16 Oct 2024 12:41:43 +0200 (CEST)
Message-ID: <85f0b520-95dd-4ad3-a1a9-544e00089533@collabora.com>
Date: Wed, 16 Oct 2024 12:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8390-genio-700-evk: Enable
 ethernet
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Jianguo Zhang <jianguo.zhang@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Hsuan-Yu Lin <shane.lin@canonical.com>, Pablo Sun <pablo.sun@mediatek.com>,
 fanyi zhang <fanyi.zhang@mediatek.com>
References: <20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com>
 <20241015-genio700-eth-v1-2-16a1c9738cf4@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241015-genio700-eth-v1-2-16a1c9738cf4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_034145_698126_2B361C92 
X-CRM114-Status: GOOD (  14.42  )
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

Il 15/10/24 20:15, Nícolas F. R. A. Prado ha scritto:
> Enable ethernet on the Genio 700 EVK board. It has been tested to work
> with speeds up to 1000Gbps.
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Hsuan-Yu Lin <shane.lin@canonical.com>
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Signed-off-by: fanyi zhang <fanyi.zhang@mediatek.com>
> [Cleaned up to pass dtbs_check, follow DTS style guidelines, and split
> between mt8188 and genio700 commits]
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 25 ++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> index 0a6c9871b41e5f913740e68853aea78bc33d02aa..73e34e98726d36785e8b2cef73f532b6bb07c97f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> @@ -24,6 +24,7 @@ / {
>   
>   	aliases {
>   		serial0 = &uart0;
> +		ethernet0 = &eth;
>   	};
>   
>   	chosen {
> @@ -845,6 +846,30 @@ pins-wifi-enable {
>   	};
>   };
>   
> +&eth {
> +	phy-mode ="rgmii-rxid";
> +	phy-handle = <&ethernet_phy0>;
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&eth_default_pins>;
> +	pinctrl-1 = <&eth_sleep_pins>;

> +	snps,reset-gpio = <&pio 147 GPIO_ACTIVE_HIGH>;
> +	snps,reset-delays-us = <0 10000 10000>;
> +	mediatek,tx-delay-ps = <2030>;
> +	mediatek,mac-wol;

	mediatek,mac-wol;
	mediatek,tx-delay-ps = <2030>;
	snps,reset-delays-us = <0 10000 10000>;
	snps,reset-gpio = <&pio 147 GPIO_ACTIVE_HIGH>;

Cheers,
Angelo

> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethernet_phy0: ethernet-phy@1 {
> +			compatible = "ethernet-phy-id001c.c916";
> +			reg = <0x1>;
> +		};
> +	};
> +};
> +
>   &pmic {
>   	interrupt-parent = <&pio>;
>   	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;
> 



