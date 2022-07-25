Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A41C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 09:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQbkePjTZTGBHhHNdPkVayN1pzQM5oP8jjbvr/Dc6xc=; b=riKcAwjh3xzoaOdPW2ijwvh/AU
	IHlPJOA5Z8R1MaKJFbpIybW69ydGsVMJchfhg7WdC7U5KipN5q12mbWUNyz7KOCQ0PfQy3ySPVjjL
	jY5hliNzDwHqITuhEBbULXMTPhaqb8CdRjyQw8ulJrNOWERompVU2jR+7jJ3VYbg6GVFVHgVsKjVS
	oLSHIkCTcJSbHK5rI+O08sULEDlVPig1hsogfkfz2+BUs9tLY+auEkg7JTGowkxxoNvKY7RDHtbRe
	HulVZ77+vE25n5Noj48GKetwPROy4WtE9pVoxj7zgCjIi409YyLCxo1sROQ/PHggmhOszz0C+DFa3
	ItwR+bMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuqj-007qcc-FW; Mon, 25 Jul 2022 09:58:05 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuqf-007qYM-VO
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 09:58:03 +0000
Received: by mail-yb1-xb32.google.com with SMTP id r3so19137149ybr.6
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VQbkePjTZTGBHhHNdPkVayN1pzQM5oP8jjbvr/Dc6xc=;
        b=GKsMNthIl/nHv3s4pIAp4//iOle4vnauGjgQk5AiuZ/cN1ovOSttLGtV2WfD96BLIu
         U+HSskxdf09TYHGZnrR1NXnuQGq/VTyyawhImCx0qQYbk6hHsbuNOVdnj+c7/xYF4JTv
         O2/DrdAJDxBRjx11t/OjFDIlclwqmUqt1K6p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VQbkePjTZTGBHhHNdPkVayN1pzQM5oP8jjbvr/Dc6xc=;
        b=qO+tPgJSVNe9qwqwoaouqGGlmYidVFNnJoXo3jrvSCxdfzN7Zf4QzP4oa1He7LLumN
         ZGg0VfO7QsghyvJ9tOYPRKqgfeshnAErByRDgGkjdbgVJK8BBWCPcRlE3sR5q9Bk1ASm
         2osCN5HyWMhTxQLBFFZusjpoxXvJQs5TGn8q+c3sPyI0zVews5MFln+AstADyfhIAXRp
         kuwQmjItzVy7E9jk3vlOwnhru4mmO79q8pFZf2wtQxneWgayYQkM0Gm5EylgmQxjYSxA
         zpB6VYRHzcQA5feWg/0i+0ISBwd9YNVXFoR7fhIsziVClKtjyejOPdMQ3UEV+LsO7W5x
         Wdnw==
X-Gm-Message-State: AJIora9RhE9kHbDD4+4MWcg3WdN/YVL/Fh8OmqJDWomhdHRPZl1eN+y7
	fOw5gPjmGsIMUikhzozXCKDPOg2FYtewq3l7qokRoA==
X-Google-Smtp-Source: AGRyM1vpw8Qdjvlaj8NOuT0GEe5Ha3tFWQOx0/4AUrT7WihQIvnc7eW1QgGSAz+MsXJC8OkWSPB0iyyHgW/yyITv/Vc=
X-Received: by 2002:a25:d852:0:b0:66f:259c:17b6 with SMTP id
 p79-20020a25d852000000b0066f259c17b6mr9047848ybg.438.1658743078168; Mon, 25
 Jul 2022 02:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com> <20220721145017.918102-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220721145017.918102-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Jul 2022 17:57:47 +0800
Message-ID: <CAGXv+5FR-HdPc-_c18Svdx0aviR-+b4ikf6MfbzaLWCcF1catA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] arm64: dts: mediatek: cherry: Enable keyboard PWM backlight
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_025802_047826_DE4BDAA2 
X-CRM114-Status: GOOD (  16.14  )
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

n Thu, Jul 21, 2022 at 10:53 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a pwm-leds node to enable the PWM controlled keyboard backlight.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index ca9955a97f8f..9086a440a995 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -4,6 +4,7 @@
>   */
>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>  #include "mt8195.dtsi"
>  #include "mt6359.dtsi"
>
> @@ -31,6 +32,18 @@ dmic_codec: dmic-codec {
>                 wakeup-delay-ms = <50>;
>         };
>
> +       led-controller {
> +               compatible = "pwm-leds";
> +
> +               keyboard_backlight: keyboard-backlight {
> +                       default-state = "off";
> +                       function = LED_FUNCTION_KBD_BACKLIGHT;
> +                       label = "cros_ec::kbd_backlight";
> +                       max-brightness = <1023>;
> +                       pwms = <&cros_ec_pwm 3>;
> +               };
> +       };
> +

This didn't work for me. However using "google,cros-kbd-led-backlight"
under the EC did. That might be a better option.

ChenYu

>         memory@40000000 {
>                 device_type = "memory";
>                 reg = <0 0x40000000 0 0x80000000>;
> --
> 2.35.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

