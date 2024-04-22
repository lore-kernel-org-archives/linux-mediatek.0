Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12000C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krb2SVO3gfXOodaufaJtdvnoJHoNUvrwBiJmFaNXv1w=; b=wGbQ29Z8csmWsUv8vzv89PJbkQ
	vwj45WotXPHQdFaa7gDksjRpJPyhuaMthO06dVZb/0H8AodapNzZhChidU1OGnu6LQ9ddbQilajgh
	XGrsod2pwYNCVTlRZdT8vpa93fuUBHuit9Yk6b1IpwAgDB84OxruoXbYzlw5LtVJMDfbOta2Vw2iD
	14C1+FxIMtZXMN30s9/dyVLSE32YJyoCfh0bQOVgfndYydxF/w6BxGzqA1ljASS8IvQWhMCz7UA2f
	sME1uG5azD7YeMDp735TDA4X5L70iuukZ7ZezEPyiw8heCXwpM0Nn5TW7vgr/nP2Qg38tSXu8pcXA
	fWmU8UMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryr0t-0000000DApz-2PmP;
	Mon, 22 Apr 2024 10:35:07 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryr0q-0000000DAnr-0xu1;
	Mon, 22 Apr 2024 10:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713782102;
	bh=6VcMeN98QlnjmYjl5LAaaeAJBovNEk8r15IuzTAVT7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XEheiXAxg4rrNh05+r4z2KPZmrW2kLq6LTOVx6n3K/ApM2kzkzlqQhUUJyEMRovcy
	 oBgHzhe5zPUwTkLbiyl3ipVgLNy0j8FCg1jLjz81It32x5+9aOQ0eacsJEq5hXlAk4
	 afwlanaf2+9EJnxaUFuQakMQPiM9yX1Kd4WGfGKPZcqnDMT8/t71d2wrZ+Co5JOrFA
	 YkkkiLYCHbe+Z+EQsMrAVDAQY11i95u1TN2O7CSDkSPcRHT2nJTwwe2vEnwHcENdH0
	 B86eMxJ7Lcq9plye6Q/3jU3Xo626I3wJ1NKAVZAabxlqNjyzVao8rMKKKZxYogStUp
	 SpNAhTU5VsdUA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D4DC23780C22;
	Mon, 22 Apr 2024 10:35:01 +0000 (UTC)
Message-ID: <8a0cfdd0-ffb5-429f-8f86-30013c47e64a@collabora.com>
Date: Mon, 22 Apr 2024 12:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt8390-genio-700-evk: add
 IT5205, RT1715, and USB HUB
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Yow-shin Liou <yow-shin.liou@mediatek.com>,
 Jason-ch Chen <Jason-ch.Chen@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240422093926.15392-1-macpaul.lin@mediatek.com>
 <20240422093926.15392-2-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240422093926.15392-2-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_033504_433487_83114DE5 
X-CRM114-Status: GOOD (  14.21  )
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

Il 22/04/24 11:39, Macpaul Lin ha scritto:
> 1. Add i2c to aliases.
> 2. Add MUX IT5205 support to i2c1.
> 3. Add TYPEC RT1715 support to i2c4.
> 4. Add PMIC_KEY setting.
> 5. Add USB HUB TUSB8020 to xhci1.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   .../dts/mediatek/mt8390-genio-700-evk.dts     | 56 ++++++++++++++++++-
>   1 file changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> index 9b7ad046f193..17f22b1836bf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> @@ -23,6 +23,15 @@
>   		     "mediatek,mt8188";
>   
>   	aliases {
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		mmc0 = &mmc0;
> +		mmc1 = &mmc1;
>   		serial0 = &uart0;
>   	};
>   
> @@ -225,6 +234,16 @@
>   	pinctrl-0 = <&i2c1_pins>;
>   	clock-frequency = <400000>;
>   	status = "okay";
> +
> +	typec-mux@48 {
> +		compatible = "ite,it5205";
> +		reg = <0x48>;
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		vcc-supply = <&mt6359_vcn33_1_bt_ldo_reg>;
> +	};
>   };
>   
>   &i2c2 {
> @@ -242,11 +261,19 @@
>   };
>   
>   &i2c4 {
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "default";
>   	pinctrl-0 = <&i2c4_pins>;
>   	pinctrl-1 = <&rt1715_int_pins>;

This should be

pinctrl-names = "default";
pinctrl-0 = <&i2c4_pins>;

>   	clock-frequency = <1000000>;
>   	status = "okay";
> +
> +	rt1715@4e {
> +		compatible = "richtek,rt1715";
> +		reg = <0x4e>;
> +		interrupts-extended = <&pio 12 IRQ_TYPE_LEVEL_LOW>;
> +		vbus-supply = <&usb_p1_vbus>;

pinctrl-names = "default";
pinctrl-0 = <&rt1715_int_pins>;

Cheers,
Angelo


> +		status = "okay";
> +	};
>   };
>   
>   &i2c5 {
> @@ -836,6 +863,17 @@
>   &pmic {
>   	interrupt-parent = <&pio>;
>   	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;
> +
> +	mt6359keys: keys {
> +		compatible = "mediatek,mt6359-keys";
> +		mediatek,long-press-mode = <1>;
> +		power-off-time-sec = <0>;
> +
> +		power-key {
> +			linux,keycodes = <KEY_POWER>;
> +			wakeup-source;
> +		};
> +	};
>   };
>   
>   &scp {
> @@ -890,6 +928,22 @@
>   &xhci1 {
>   	status = "okay";
>   	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb451,8025";
> +		reg = <1>;
> +		peer-hub = <&hub_3_0>;
> +		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
> +		vdd-supply = <&usb_hub_fixed_3v3>;
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb451,8027";
> +		reg = <2>;
> +		peer-hub = <&hub_2_0>;
> +		reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
> +		vdd-supply = <&usb_hub_fixed_3v3>;
> +	};
>   };
>   
>   &xhci2 {




