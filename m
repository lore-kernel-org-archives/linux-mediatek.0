Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC33C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52UfEXoqM3hwWgp2yqP2yVWH2K9ArPLXtNNI15utaBY=; b=n4/IKLKqK7iv50HR8yBHPg0soT
	sE0YFbNpjADRxjpH6cIyWSW0RhZcKfh82THDbU6wvkqnQ9QQr/y/M4c3vUsOaTwuuOLWewNbBTydW
	1Wivaq5wO85zTnZqjY6NZmk6TMZ+MeauoZun2lCCPec7HJoOrcybAoWuJLP+1bMm9t6DFlTGHeLdH
	EdVnds1uvXxRyP+i5bl8RvVfASbwd+BIAZ8M9z5KpND40+R+52xEPPxDWqJI6hm2dRl5BWsIEmyPr
	qiRgW3XaO4r/UZeJmzJ6f8fqSFCHjesnV/HUwDtRwIRrguQqLSIrz6fBCmn/flkXpNWFWwA9aOczJ
	7v2um2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuwr-007uOu-If; Mon, 25 Jul 2022 10:04:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuwd-007uFK-Kp; Mon, 25 Jul 2022 10:04:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A21D966015E7;
	Mon, 25 Jul 2022 11:04:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658743450;
	bh=2lcWg722C+EKD6yIIuLQdkUd6bCzFnI+eE4dlAuYUvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aTKVeBbPxPQMF3hLlMWrsWuRihreLRQH9UCFrXPqBm4W9IFBHx3LIEckYUpH7Jznp
	 jftBFM/FE5iw+c+wrZH/DsqscBopHD5RaAepTB87HfQ9KOX/X0VMX6eAzPQKPXQ4gf
	 y0dG7Q4qzBpCkT/mn3XHYUAPxAhGP6m9p/lbXILkqiyDkPWIp8R5ei0688I1fRAIA4
	 oHzw5wNtNaiM6Ai5oKHVnzd03h1Tv655l5RJoFKyFgxXt4DkvwTJs3ChJx2zO9k2aG
	 2I+Q40k4192L9t5/X3lmTY5fSdhhgTW2O5DfotNaCc71tOxzZAuX+NWkfpAQmb7BRm
	 eloD87cUq4+dw==
Message-ID: <b11386d3-3b28-617e-1dc6-1d862952aff7@collabora.com>
Date: Mon, 25 Jul 2022 12:04:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/8] arm64: dts: mediatek: cherry: Enable keyboard PWM
 backlight
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com>
 <20220721145017.918102-8-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FR-HdPc-_c18Svdx0aviR-+b4ikf6MfbzaLWCcF1catA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FR-HdPc-_c18Svdx0aviR-+b4ikf6MfbzaLWCcF1catA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_030411_866777_3F1BE96C 
X-CRM114-Status: GOOD (  15.57  )
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

Il 25/07/22 11:57, Chen-Yu Tsai ha scritto:
> n Thu, Jul 21, 2022 at 10:53 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add a pwm-leds node to enable the PWM controlled keyboard backlight.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> index ca9955a97f8f..9086a440a995 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> @@ -4,6 +4,7 @@
>>    */
>>
>>   #include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/leds/common.h>
>>   #include "mt8195.dtsi"
>>   #include "mt6359.dtsi"
>>
>> @@ -31,6 +32,18 @@ dmic_codec: dmic-codec {
>>                  wakeup-delay-ms = <50>;
>>          };
>>
>> +       led-controller {
>> +               compatible = "pwm-leds";
>> +
>> +               keyboard_backlight: keyboard-backlight {
>> +                       default-state = "off";
>> +                       function = LED_FUNCTION_KBD_BACKLIGHT;
>> +                       label = "cros_ec::kbd_backlight";
>> +                       max-brightness = <1023>;
>> +                       pwms = <&cros_ec_pwm 3>;
>> +               };
>> +       };
>> +
> 
> This didn't work for me. However using "google,cros-kbd-led-backlight"
> under the EC did. That might be a better option.

Strange. But okay if there's a better option I'll check that out for v3.

Cheers!
Angelo

> 
> ChenYu
> 
>>          memory@40000000 {
>>                  device_type = "memory";
>>                  reg = <0 0x40000000 0 0x80000000>;
>> --
>> 2.35.1
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


