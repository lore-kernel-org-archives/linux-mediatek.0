Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EC3C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:25:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E4D20857
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:25:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JH905Naf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91E4D20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BuDpLjfbmo5ZSPQLokNWEQi0oMw4attJMjJEyN9s0DE=; b=JH905NafWsys1k4M4hMKezC7E
	T3oUV1P1k0xa3oFn/ov/mkhs9cwcGtTtCUP+wK6mIdAKQbawQcS9vxUHU/JV/J9UyNGfAdZzy0+Q/
	lW6hmR+OkcaFrRd25vEtMUshapq3b0vgY4SQnbQlJMgxL9iLJ5MXYxOaRJL/d9b05B/KM3StidVA2
	1xRCLTQ5JtbilcEOP6GJvr6ik53Spd0AHTD8DE3GrStBatUrtO6drAssYq0GQI6+wyD3KVkrOl5kG
	CmdWLVZWbMY78mkrTkq7F/M/iKHvEdq+XIRZceLSLonEGohXiJpT/hSUEFwiWMXqgcxJDTCr1pYD4
	UJipz7GyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khryr-0007on-Sy; Wed, 25 Nov 2020 10:24:57 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khryo-0007nq-JC; Wed, 25 Nov 2020 10:24:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 199431F44D98
Subject: Re: [PATCH] arm64: dts: mt8183: Add pwm and backlight node
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-kernel@vger.kernel.org
References: <20201124041253.4181273-1-hsinyi@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <8484ec3b-14aa-f0de-28d6-f360c491515b@collabora.com>
Date: Wed, 25 Nov 2020 11:24:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201124041253.4181273-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_052454_759240_46885348 
X-CRM114-Status: GOOD (  17.57  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

Thank you for your patch.

On 24/11/20 5:12, Hsin-Yi Wang wrote:
> Add pwm to mt8183 and backlight to mt8183-kukui.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---

Picked the patch and checked that pwm for the backlight is working as expected
on my Lenovo Ideapad Duet.

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 28 +++++++++++++++++++
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 10 +++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 85f7c33ba4461..bf2ad1294dd30 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -19,6 +19,17 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	backlight_lcd0: backlight_lcd0 {
> +		compatible = "pwm-backlight";
> +		pwms = <&pwm0 0 500000>;
> +		power-supply = <&bl_pp5000>;
> +		enable-gpios = <&pio 176 0>;
> +		brightness-levels = <0 1023>;
> +		num-interpolated-steps = <1023>;
> +		default-brightness-level = <576>;
> +		status = "okay";
> +	};
> +
>  	memory@40000000 {
>  		device_type = "memory";
>  		reg = <0 0x40000000 0 0x80000000>;
> @@ -536,6 +547,17 @@ pins_clk {
>  		};
>  	};
>  
> +	pwm0_pin_default: pwm0_pin_default {
> +		pins1 {
> +			pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
> +			output-high;
> +			bias-pull-up;
> +		};
> +		pins2 {
> +			pinmux = <PINMUX_GPIO43__FUNC_DISP_PWM>;
> +		};
> +	};
> +
>  	scp_pins: scp {
>  		pins_scp_uart {
>  			pinmux = <PINMUX_GPIO110__FUNC_TP_URXD1_AO>,
> @@ -670,6 +692,12 @@ pins_wifi_wakeup {
>  	};
>  };
>  
> +&pwm0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm0_pin_default>;
> +};
> +
>  &scp {
>  	status = "okay";
>  	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 08a914d3a6435..a974bad899365 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -479,6 +479,16 @@ spi0: spi@1100a000 {
>  			status = "disabled";
>  		};
>  
> +		pwm0: pwm@1100e000 {
> +			compatible = "mediatek,mt8183-disp-pwm";
> +			reg = <0 0x1100e000 0 0x1000>;
> +			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_LOW>;
> +			#pwm-cells = <2>;
> +			clocks = <&topckgen CLK_TOP_MUX_DISP_PWM>,
> +					<&infracfg CLK_INFRA_DISP_PWM>;
> +			clock-names = "main", "mm";
> +		};
> +
>  		i2c3: i2c@1100f000 {
>  			compatible = "mediatek,mt8183-i2c";
>  			reg = <0 0x1100f000 0 0x1000>,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
