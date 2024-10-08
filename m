Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECE2CED274
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJQ1gosCF5T3FLLohzsAFxbwJR2OjfPPjTIq1R8OBYo=; b=zW9vXOp8yHCAPyiX4TrmyD2eZV
	XULoc1l2lIxS9wrVde2ktfnlLXcJmCJXb8HYqTqqBOCPOjeILzYP+kFHWifXF5EEMQU9KvovyThBq
	7hVTv7mJlOkg+FUgFw3hs4mc1lOlF0ftnfrS4f0dVtPg8DyWVbE+qhLlGJDopdOdMB17ky8IzCnNo
	nIlJvOtsB8h+Ox7nrKAR8c3V0j3jdBl1uCxlUs3bV5H5mJeQU44Q1q2p7CdOe5yAJsV/7r7+/3t/f
	wIiKA4kdyFHJoFI8Qt/jx4HSsDYzNAfEUYVC+H3novVD3MM8ByCbxzuk3XVQkKQSPWo/uGv0ts7Hb
	NXVZP23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5eI-000000053lG-4BB7;
	Tue, 08 Oct 2024 08:32:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5Rs-00000004zfT-41uP;
	Tue, 08 Oct 2024 08:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728375602;
	bh=AXDgMvzZ0dhqYbcpZaAvhYubI+mG2BUoce+x40w8cA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WNeXvQd0/GHwGY+dCvr43z3TkLSoNn64dcMCuwjn7EaL2jPo+yemEZvC+C3hO/MnR
	 /TBWYbP8FqwPxOxh64K4YgtUQREAy/hmTa4XUYBCyd8gU8fOtiS9AazLCCtbMImLcQ
	 CMSXduRu6/5tMjh3ZV2PR4XroZH4UKsXb2pjW6UHYgBF9orY4ceu385ikEQZElnQWM
	 6xm48BYT3nkBGKnzk76s8G/1/Ud/i44eMFBtQlB7pEMTQPPIOPND3gz3c/JVtAMSi3
	 v3404XTNSAjf+GQc8N+Fk3HNgZ5t8sc5T/ff4ekmvf8EmVB362xiR4ZQ2S6xRyKwp6
	 5FUKJyRmKsOTQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F377A17E10A4;
	Tue,  8 Oct 2024 10:20:01 +0200 (CEST)
Message-ID: <8cdce399-1f42-4558-9cdb-c36b96205212@collabora.com>
Date: Tue, 8 Oct 2024 10:20:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8390-genio-700-evk: add
 keys and USB HUB
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20241007090244.1731-1-macpaul.lin@mediatek.com>
 <20241007090244.1731-2-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241007090244.1731-2-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_012005_224580_D1D65CE6 
X-CRM114-Status: GOOD (  19.25  )
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

Il 07/10/24 11:02, Macpaul Lin ha scritto:
> 1. Add i2c, mmc to aliases.
> 4. Add PMIC_KEY setting.
> 5. Add USB HUB TUSB8020 to xhci1.
> 6. Re-order spi2 node.

Please either add the aliases in a different commit, or add that to the title.

arm64: dts: mediatek: mt8390-genio-700-evk: Add aliases, keys and USB HUB

Additionally, I'd really like to see a "conversation-like" description instead
of a kind-of-checkbox list.

Something like..

"
Add aliases for the I2C and MMC/SD controllers to keep the numbering consistent and
describe the TUSB8020 hub present on the USB XHCI1 controller instance to enable
resetting it with its specific reset GPIO.

While at it, also move the spi2 node to keep nodes alphabetically ordered.
"

> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   .../dts/mediatek/mt8390-genio-700-evk.dts     | 57 +++++++++++++++----
>   1 file changed, 47 insertions(+), 10 deletions(-)
> 
> Changes for v2:
>   - Fix order of spi2.
>   - Update pinctrl in i2c4 and rt1715.
>   - Drop IT5205 and RT1715 nodes since the DTS are not completed yet.
>   - Add #address-cells and #size-cells to xhci1 for supporting USB hubs.
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> index 96b272567cb1..3e77f59f2c74 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> @@ -23,6 +23,15 @@ / {
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
> @@ -249,7 +258,6 @@ &i2c3 {
>   &i2c4 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c4_pins>;
> -	pinctrl-1 = <&rt1715_int_pins>;

What is this extra change?
Please describe it in the commit description.

>   	clock-frequency = <1000000>;
>   	status = "okay";
>   };
> @@ -867,6 +875,17 @@ pins-wifi-enable {
>   &pmic {
>   	interrupt-parent = <&pio>;
>   	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;
> +
> +	mt6359keys: keys {

Is there any reason why we can't just put this node in mt6359.dtsi?

Cheers,
Angelo

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
> @@ -874,6 +893,15 @@ &scp {
>   	status = "okay";
>   };
>   
> +&spi2 {
> +	pinctrl-0 = <&spi2_pins>;
> +	pinctrl-names = "default";
> +	mediatek,pad-select = <0>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +};
> +
>   &uart0 {
>   	pinctrl-0 = <&uart0_pins>;
>   	pinctrl-names = "default";
> @@ -892,15 +920,6 @@ &uart2 {
>   	status = "okay";
>   };
>   
> -&spi2 {
> -	pinctrl-0 = <&spi2_pins>;
> -	pinctrl-names = "default";
> -	mediatek,pad-select = <0>;
> -	#address-cells = <1>;
> -	#size-cells = <0>;
> -	status = "okay";
> -};
> -
>   &u3phy0 {
>   	status = "okay";
>   };
> @@ -921,6 +940,24 @@ &xhci0 {
>   &xhci1 {
>   	status = "okay";
>   	vusb33-supply = <&mt6359_vusb_ldo_reg>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
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


