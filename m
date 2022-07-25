Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C95C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stNX9KF4Msw25o+qtdczigETj3bpvIInYCKAJzx+tiw=; b=EE9DO1LRduCWnsiSNkKaL9l2SS
	7AtuCAxqSMEElT4WL8tNk055td4zTC9HaI10FHyBAEzrUqaLGhnQcOJPRmBqDE+6rpzXTFXiWY87M
	gYRaYe3hICFKrxF+mZJ05EXJy3m0lsqgY1xJlG9kZ0NUvtmgODCIejKfwJLYouDIBAq2MzfpJVWtb
	B5WdqGb3PiIM971ut2Y06HniDkuPpaD47CyYbNjengQNAKbd4+HiHUNNOeAjbomyshtYwv9K9jzHL
	iZaJphQA5k2ZNVePhfKPa8js6e4ZSaAfT3ntIxAB7Q3ibKqXSYfm6rm7y4WTPgJtUHbl0Z06j3hhy
	cbpzQEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFv7K-0083eO-Nr; Mon, 25 Jul 2022 10:15:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFv6o-0083Cm-KC; Mon, 25 Jul 2022 10:14:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4678C6601AA6;
	Mon, 25 Jul 2022 11:14:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658744078;
	bh=ispzLRdFkJar4wYod3p3CsPB+0/0GWgV2Tse00+QXEo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MAqSTpXS+gS/8vj9J51Ewr9S27lGBUJyKm5kHN90hvBH4+rUnLvNpXBWg8DgzG5nR
	 cwgKZBp/i+sVjN2qhV+0xE9stOiOrnCgInYn47bhGm5dy5OAEKbhcRvScXYhnQowKq
	 /5hvPmV4LEe/MwhsK/+iUNU0c+v4ibnSmOrsVY6x4wGm+RnPVxmTdETyzr1SDMvLmA
	 NgRpwFqPTvOTdGKgBfgP/AqUSR0qqefifuW9bvSD0jCGTZTNQ0w8DfyohIMSlup9mV
	 uGeTLN5IuOpxxoRq4by88WZIuSDQrlwRrdwY2hxjykDv1QunwTd5RFpQcZQU5Nhuhw
	 yJqd95Y0tVP6A==
Message-ID: <8e47ef16-f310-2242-42c6-8081a4a33d8b@collabora.com>
Date: Mon, 25 Jul 2022 12:14:35 +0200
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
 <b11386d3-3b28-617e-1dc6-1d862952aff7@collabora.com>
 <CAGXv+5EGW-4zOWa4bhJz6ODt_P-u4Qepc+YR9=7-Yk+CsJ7K3w@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EGW-4zOWa4bhJz6ODt_P-u4Qepc+YR9=7-Yk+CsJ7K3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_031442_934328_49D0BE31 
X-CRM114-Status: GOOD (  19.32  )
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

Il 25/07/22 12:06, Chen-Yu Tsai ha scritto:
> On Mon, Jul 25, 2022 at 6:04 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 25/07/22 11:57, Chen-Yu Tsai ha scritto:
>>> n Thu, Jul 21, 2022 at 10:53 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Add a pwm-leds node to enable the PWM controlled keyboard backlight.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 13 +++++++++++++
>>>>    1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>>> index ca9955a97f8f..9086a440a995 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>>> @@ -4,6 +4,7 @@
>>>>     */
>>>>
>>>>    #include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/leds/common.h>
>>>>    #include "mt8195.dtsi"
>>>>    #include "mt6359.dtsi"
>>>>
>>>> @@ -31,6 +32,18 @@ dmic_codec: dmic-codec {
>>>>                   wakeup-delay-ms = <50>;
>>>>           };
>>>>
>>>> +       led-controller {
>>>> +               compatible = "pwm-leds";
>>>> +
>>>> +               keyboard_backlight: keyboard-backlight {
>>>> +                       default-state = "off";
>>>> +                       function = LED_FUNCTION_KBD_BACKLIGHT;
>>>> +                       label = "cros_ec::kbd_backlight";
>>>> +                       max-brightness = <1023>;
>>>> +                       pwms = <&cros_ec_pwm 3>;
>>>> +               };
>>>> +       };
>>>> +
>>>
>>> This didn't work for me. However using "google,cros-kbd-led-backlight"
>>> under the EC did. That might be a better option.
>>
>> Strange. But okay if there's a better option I'll check that out for v3.
> 
> It might be an EC firmware version issue. My devices are all running
> test images, and don't automatically update the EC firmware.
> 
> For reference, mine is at:
> 
> RO:    tomato_v2.0.10686-234e646fd8
>          tomato_14268.0.0
> RW:    tomato_v2.0.10686-234e646fd8
>          tomato_14268.0.0
> Build:    tomato_v2.0.10686-234e646fd8 tomato_14268.0.0
>          2021-10-07 09:00:32
>          @chromeos-ci-legacy-us-central2-d-x32-34-us9d
> 

It's surely about the firmware, because I can confirm that I didn't
have a working KB kacklight before upgrading... I remember debugging
that and I couldn't figure out why it wasn't working...

After an upgrade, it magically worked, so that's it.

RO version:    tomato_v2.0.11883-9f0d374060

RO cros fwid:  tomato_14454.14.0

RW version:    tomato_v2.0.11893-d27ab0e96d

RW cros fwid:  tomato_14454.23.0



That's the FW that I have here on my machine... :-)

I'll anyway check out the binding that you suggested, as if that works
in any condition that's simply better!


> ChenYu
> 
>> Cheers!
>> Angelo
>>
>>>
>>> ChenYu
>>>
>>>>           memory@40000000 {
>>>>                   device_type = "memory";
>>>>                   reg = <0 0x40000000 0 0x80000000>;
>>>> --
>>>> 2.35.1
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-arm-kernel mailing list
>>>> linux-arm-kernel@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>



