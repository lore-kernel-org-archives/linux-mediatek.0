Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0009CF11F8
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7o8e9Xvlapsx5ovz9ftqgl7t14BypIPpDpXmOjKHuB4=; b=FlJ/Zd8EAdgvi7
	S8ObHPsCtN2w6V5MX823wdwftJuaJSRrC78ZiliEYWUkTL9qiG9FuauVQX9Zk1stBTCDHDWHDa9ba
	y3TOh2y6snJ5ARSiucZLcPJ3hNHPeUfBM61rWSUprCpBnKfGszjksiE9SGMykCwhsdJ3DNI/NvCWu
	sVkIPkI7HES5Du3snljD4PfE8ydTXlMBYrLJXrkZKvZJ4CZMhRDDsqRSYwmT83gj88h4GJ60uJAtm
	UM604Qzr9u5cwUPFkHilhPeTBQhJ6uasqs34nBKN6zm/ir+82v0W6UYQY6qVA4eviSOM9kTsyLvxW
	h2eNMLNRZ/klaXoTooGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sytUa-0000000CyHs-1atv;
	Thu, 10 Oct 2024 13:46:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sysOk-0000000CjJC-2lTj;
	Thu, 10 Oct 2024 12:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728563764;
	bh=Rryj9oLGExO1bUhiYrapGyYrh33dxncpOASEi3N3YnA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VAO+y59HV7qdy1CWL2CYTOxzn8chuMzPQC7JQOw/BjFOdZ+pIp0jEiWvhCZi6lcsS
	 lGXjXZeWPJWc2baUbshzufwHwWxl3L2Ar/t/p2zpVnBf05eK7LPrtvsMoIgM5Q+jIV
	 F/hkVoGjjLIdPxEffX3+GhYIGe6y2kH+HGsrR1wx9uZ4AxklscLtmzj/oeszwwlR54
	 Jv2l5DWgiO8YgjwjD2Qfd24JVqW03PYJ6d45ITw8PVLVVswQ44pSZFqYbZEdx4GFzS
	 D6EeQ64nKAZ3CDSzX5+sIvW0mxrFYox+vJxVyuxmYvnuenJU/DAuDk6xOb7mEKHNq3
	 /e8y/elb7mgMw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4172617E35E0;
	Thu, 10 Oct 2024 14:36:04 +0200 (CEST)
Message-ID: <4ac4c8ab-4180-4fcc-9e48-6dede7448dee@collabora.com>
Date: Thu, 10 Oct 2024 14:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: mediatek: mt7988: add pinctrl support
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
References: <20241009165222.5670-1-linux@fw-web.de>
 <20241009165222.5670-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009165222.5670-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_053606_913179_ADE7D36D 
X-CRM114-Status: GOOD (  16.12  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 09/10/24 18:52, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7988a pinctrl node.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - fix wrong alignment of reg values
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 241 ++++++++++++++++++++++
>   1 file changed, 241 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index c9649b815276..7e15934efe0b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -3,6 +3,7 @@
>   #include <dt-bindings/clock/mediatek,mt7988-clk.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/pinctrl/mt65xx.h>
>   
>   / {
>   	compatible = "mediatek,mt7988a";
> @@ -105,6 +106,246 @@ clock-controller@1001e000 {
>   			#clock-cells = <1>;
>   		};
>   
> +		pio: pinctrl@1001f000 {
> +			compatible = "mediatek,mt7988-pinctrl";
> +			reg = <0 0x1001f000 0 0x1000>,
> +			      <0 0x11c10000 0 0x1000>,
> +			      <0 0x11d00000 0 0x1000>,
> +			      <0 0x11d20000 0 0x1000>,
> +			      <0 0x11e00000 0 0x1000>,
> +			      <0 0x11f00000 0 0x1000>,
> +			      <0 0x1000b000 0 0x1000>;
> +			reg-names = "gpio", "iocfg_tr",
> +				    "iocfg_br", "iocfg_rb",
> +				    "iocfg_lb", "iocfg_tl", "eint";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pio 0 0 84>;
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-parent = <&gic>;
> +			#interrupt-cells = <2>;
> +
> +			mdio0_pins: mdio0-pins {
> +				mux {
> +					function = "eth";
> +					groups = "mdc_mdio0";
> +				};
> +
> +				conf {
> +					pins = "SMI_0_MDC", "SMI_0_MDIO";
> +					drive-strength = <MTK_DRIVE_8mA>;

Please do *not* use the MTK_DRIVE_(x)mA definitions anymore.

Here it is `drive-strength = <8>`.

> +				};
> +			};
> +
> +			i2c0_pins: i2c0-g0-pins {
> +				mux {
> +					function = "i2c";
> +					groups = "i2c0_1";
> +				};
> +			};
> +
> +			i2c1_pins: i2c1-g0-pins {
> +				mux {
> +					function = "i2c";
> +					groups = "i2c1_0";
> +				};
> +			};

Whatever pin can be configured with one or multiple groups that can be different
must *not* be in the SoC dtsi, but rather in the *board* dts(i) file, as the wanted
configuration of those pins is *not* soc-specific but board-specific.

 From a fast look, I can see that at least the I2C pins can be assigned to different
functions: for example, pins 15+16 can be either of i2c0_1, *or* u30_phy_i2c0, *or*
u32_phy_i2c0, *or* xfi_phy0_i2c1 ... or others, even.

Finally - I think that *most* of the muxing that you're declaring here must instead
go to your board specific devicetree and not in mt7988a.dtsi.

Cheers,
Angelo




