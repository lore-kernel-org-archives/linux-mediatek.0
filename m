Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9590AC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYqjzKHYhMwQ2xFhMg/ufqPhz3dH4Hpwx5NkVknTPDM=; b=Bq078kJtdTFmOK0ls9WPArm4PY
	Xg+vqXtIWil6pQiHgRtGITW5dOLabms2mjw1fjbKfUOh4a3F6N9XMqR5k0HPe5pCD5eA6XeiHCOCx
	mrfUiCwcRYDazlgGnEcFo2ykoN/m7Z0ecVrO1o96u8w7WmiBpcW8cv74Ho7k4o6iCQv3TA/HTwDVm
	M6m3PhZebYkNr0oQejgRSSCmhMAAnDPyhDlvERas/B4mdimxtnvvrsDmRFvYKorenVrjGkP8927e+
	oGjtcoyK3/rPdXCPG8YjiF706LF8EuiKNDOxQzYD6+RYvum5o854PfdD+xQYWLYNEe5vHqVLRnJJt
	Ns+eP2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuyw-007wHe-RJ; Mon, 25 Jul 2022 10:06:34 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuya-007vyM-VT
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 10:06:14 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-31e560aa854so103785267b3.6
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 03:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LYqjzKHYhMwQ2xFhMg/ufqPhz3dH4Hpwx5NkVknTPDM=;
        b=bhwD+QcNsbUB673ylUfp7LZ0jcRajqBGXRsFW2GjADwV6be/oiAHezjgBeQdbURMMc
         ObXtGWgcqngT5nTA5D6i9cbiOkhQm8Sc2zw0WLSM8hK9vOC2gKbyGRC9/miW5sBQsucR
         eIRfR+LMPauuP9nGdbq8YtQjMf9/iHAm4uojk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LYqjzKHYhMwQ2xFhMg/ufqPhz3dH4Hpwx5NkVknTPDM=;
        b=xxMzbhoFdowAioTF6QNVLLKTCDw4sfY3Swsv6IF/Z1b+77AuutVMwBZJI0oiR0X3sz
         6/WFUIA9iAKv+xxKJE0VUqVbTiRTKZ1TmnoAzQPUghLU7C9v+6fLf/ObcJLJSLozS2EI
         nN7z7pQFwBzpavXcqq7ts1GMIaLtnTuyBSgpVSKOLa/6iay0DXS8REa9mi0DsWREyhVc
         +Q9il/xEJsG4xZWsBULwQGJRb+8VWJ7J0k8vpS2imueJ3l6LqGD47pwMBxXtX+fIMI5N
         WdmD+bKvypDxGY/5wSLUpX/otOfV9P2OtlVn77S4uBFsWwyS0n0Tb+bEUlGa1IbsZIxs
         dPLQ==
X-Gm-Message-State: AJIora+Dfo1eyJzQJtGQcwSmyvaEygeTswpNLt7OMtRfCUXtgVxcmRjO
	t/ZNN4sKB79LzvBEU/A26XTqPWqV7m5eTNAL+cXImw==
X-Google-Smtp-Source: AGRyM1u4BtJDEDt3wgTRBtoNExFFh0MgTCOqzSNDZo6wbcpFMl2CeWJaiVmTN92OSICmkkMUvjmQyUhCGLa5/ceqEI4=
X-Received: by 2002:a81:610:0:b0:31e:4822:6807 with SMTP id
 16-20020a810610000000b0031e48226807mr9157043ywg.354.1658743571701; Mon, 25
 Jul 2022 03:06:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com>
 <20220721145017.918102-8-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FR-HdPc-_c18Svdx0aviR-+b4ikf6MfbzaLWCcF1catA@mail.gmail.com> <b11386d3-3b28-617e-1dc6-1d862952aff7@collabora.com>
In-Reply-To: <b11386d3-3b28-617e-1dc6-1d862952aff7@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Jul 2022 18:06:01 +0800
Message-ID: <CAGXv+5EGW-4zOWa4bhJz6ODt_P-u4Qepc+YR9=7-Yk+CsJ7K3w@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: mediatek: cherry: Enable keyboard PWM backlight
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_030613_044979_CEFD0988 
X-CRM114-Status: GOOD (  19.30  )
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

On Mon, Jul 25, 2022 at 6:04 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 25/07/22 11:57, Chen-Yu Tsai ha scritto:
> > n Thu, Jul 21, 2022 at 10:53 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Add a pwm-leds node to enable the PWM controlled keyboard backlight.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> ---
> >>   arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 13 +++++++++++++
> >>   1 file changed, 13 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> >> index ca9955a97f8f..9086a440a995 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> >> @@ -4,6 +4,7 @@
> >>    */
> >>
> >>   #include <dt-bindings/gpio/gpio.h>
> >> +#include <dt-bindings/leds/common.h>
> >>   #include "mt8195.dtsi"
> >>   #include "mt6359.dtsi"
> >>
> >> @@ -31,6 +32,18 @@ dmic_codec: dmic-codec {
> >>                  wakeup-delay-ms = <50>;
> >>          };
> >>
> >> +       led-controller {
> >> +               compatible = "pwm-leds";
> >> +
> >> +               keyboard_backlight: keyboard-backlight {
> >> +                       default-state = "off";
> >> +                       function = LED_FUNCTION_KBD_BACKLIGHT;
> >> +                       label = "cros_ec::kbd_backlight";
> >> +                       max-brightness = <1023>;
> >> +                       pwms = <&cros_ec_pwm 3>;
> >> +               };
> >> +       };
> >> +
> >
> > This didn't work for me. However using "google,cros-kbd-led-backlight"
> > under the EC did. That might be a better option.
>
> Strange. But okay if there's a better option I'll check that out for v3.

It might be an EC firmware version issue. My devices are all running
test images, and don't automatically update the EC firmware.

For reference, mine is at:

RO:    tomato_v2.0.10686-234e646fd8
        tomato_14268.0.0
RW:    tomato_v2.0.10686-234e646fd8
        tomato_14268.0.0
Build:    tomato_v2.0.10686-234e646fd8 tomato_14268.0.0
        2021-10-07 09:00:32
        @chromeos-ci-legacy-us-central2-d-x32-34-us9d

ChenYu

> Cheers!
> Angelo
>
> >
> > ChenYu
> >
> >>          memory@40000000 {
> >>                  device_type = "memory";
> >>                  reg = <0 0x40000000 0 0x80000000>;
> >> --
> >> 2.35.1
> >>
> >>
> >> _______________________________________________
> >> linux-arm-kernel mailing list
> >> linux-arm-kernel@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>

