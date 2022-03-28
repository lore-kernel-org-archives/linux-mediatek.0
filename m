Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B880C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wZF2JS6gTTO1kaRuk4XOzlO1RZNhoAP1jPztOmTX+Iw=; b=XtXza+/d+J3WBu
	whMGwimVUhipG3C2ym+jco/NNHMV4F9VgBrMIUOx/mfUhAHyBqAHgpPLLVBmXr1RySZ3FaQwSAFy9
	iTeVO5oD8dyjw7jl3ADGewGjKjyLEkyi2qounehoPRfm357UknT9rVFHm28jrcAgiUW1Nr+f2CEPD
	iabHQOJs+heVkLG7gmFzeD217v6DZVYYnwhkOY2RtYCOu7fkLRMAAf0va/brducpw8bbPRQPqbg4M
	m6w/Kxh0zsvHkGEcdcGcYB2WQELpXoXU8/umqWuYr34BxyyOpa3IuQQffAfGTGpm3ctDxRQiOjwRH
	3Kj0CUMEzxz2jbC9axcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYpk9-008u9w-8G; Mon, 28 Mar 2022 13:49:13 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYpiF-008tOs-Cn; Mon, 28 Mar 2022 13:47:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A277A1F42914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648475233;
 bh=xm/p5RUG4xpEDHVeoyt/7MmfTaEkbWMuA9kH+M+Y73E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LVSwo0YoQOQ0czBBLU/3eTNmt7ceqqhFo/I8a8yOQDffYMSIG/ztREzP7rplHVTA+
 Xr9rdwb4WjYwkYG2xyaFTZ5LKO8GbclE5SiHinvAf2jQvYpg7DvIlIH+nZU5kmRYLV
 GPZGZ0M5mGOszMTIJ+bcGnRw5EMhIWIblyQsX3dPKWf5j/GXWBbityZjT6ZtGdPCL6
 FmJtZZ9dHLFgRY3Gwt6xWZOSIMggdAltUosjvkI2rOIlPE8LR74G9gRta06/Lz4N7H
 aCAdT51vB1LJ6VSsJG9OrlFIDmEVQgw4L4D+cj9308vzr6CTEahtUWlR/X73Bc+Oir
 Yd4a7vNe5h+3Q==
Message-ID: <94d231cf-ce4c-22f5-b9af-41ae68f1e659@collabora.com>
Date: Mon, 28 Mar 2022 15:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/4] arm64: dts: mediatek: Add device-tree for MT8195
 Demo board
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220327200312.3090515-1-fparent@baylibre.com>
 <20220327200312.3090515-3-fparent@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220327200312.3090515-3-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_064715_674991_C8FBF1BC 
X-CRM114-Status: GOOD (  21.69  )
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

Il 27/03/22 22:03, Fabien Parent ha scritto:
> Add basic device-tree for the MT8195 Demo board. The
> Demo board is made by MediaTek and has a MT8195 SoC,
> associated with the MT6359 and MT6360 PMICs, and
> the MT7921 connectivity chip.
> 
> The IOs available on that board are:
> * 1 USB Type-C connector with DP aux mode support
> * 1 USB Type-A connector
> * 1 full size HDMI RX and 1 full size HDMI TX connector
> * 1 uSD slot
> * 40 pins header
> * SPI interface header
> * 1 M.2 slot
> * 1 audio jack
> * 1 micro-USB port for serial debug
> * 2 connectors for DSI displays
> * 3 connectors for CSI cameras
> * 1 connector for a eDP panel
> * 1 MMC storage
> 
> This commit adds basic support in order to be able to boot.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> v2:
>   * remove empty i2c nodes
>   * remove empty spi node
>   * remove unused pcie pinctrls
>   * fixup node nodes to not contains underscore
>   * rename mt6360 pmic node
>   * move mmc1 node right after mmc0 node
>   * use generic node name for gpio-keys
>   * uniformize pinctrl node names
> 
>   arch/arm64/boot/dts/mediatek/Makefile        |   1 +
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 447 +++++++++++++++++++
>   2 files changed, 448 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> 

..snip..

> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> new file mode 100644
> index 000000000000..d94b4e01159a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
> @@ -0,0 +1,447 @@

..snip..

> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		input-name = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_pins>;
> +
> +		key-0 {

key-volup is more descriptive, can you please change that?

> +			gpios = <&pio 106 GPIO_ACTIVE_LOW>;
> +			label = "volume_up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			wakeup-source;
> +			debounce-interval = <15>;
> +		};
> +	};
> +};
> +

..snip..

> +
> +&pmic {
> +	interrupt-parent = <&pio>;
> +	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;

I would instead use interrupts-extended here:

	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;

> +};
> +
> +&i2c6 {
> +	clock-frequency = <400000>;
> +	pinctrl-0 = <&i2c6_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	mt6360: pmic@34 {
> +		compatible = "mediatek,mt6360";
> +		reg = <0x34>;
> +		interrupt-controller;
> +		interrupt-parent = <&pio>;
> +		interrupts = <101 IRQ_TYPE_EDGE_FALLING>;

Same here

> +		interrupt-names = "IRQB";
> +

...snip...

> +
> +&pio {
> +	mmc0_default_pins: mmc0-default-pins {
> +		pins-cmd-dat {
> +			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
> +				 <PINMUX_GPIO125__FUNC_MSDC0_DAT1>,
> +				 <PINMUX_GPIO124__FUNC_MSDC0_DAT2>,
> +				 <PINMUX_GPIO123__FUNC_MSDC0_DAT3>,
> +				 <PINMUX_GPIO119__FUNC_MSDC0_DAT4>,
> +				 <PINMUX_GPIO118__FUNC_MSDC0_DAT5>,
> +				 <PINMUX_GPIO117__FUNC_MSDC0_DAT6>,
> +				 <PINMUX_GPIO116__FUNC_MSDC0_DAT7>,
> +				 <PINMUX_GPIO121__FUNC_MSDC0_CMD>;
> +			input-enable;
> +			drive-strength = <MTK_DRIVE_6mA>;
> +			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +		};
> +
> +		pin-clk {

This is supposed to be "pins-clk", not "pin-clk"... same for all the other
instances of the "pin-".

Before pushing patches upstream, please run dtbs_check, as these are all
mistakes that will be pointed out by that.

Regards,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
