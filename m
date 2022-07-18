Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1840C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 11:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSoYENXBgH2mwK4hdRwcr5ZngBoL0AeSrBZrHAlbPeQ=; b=zBlGMvOST2x0LOWsikmibUuMnU
	i3+voeZIeqbGY+usVQl/4MsKwxezUSAsNC+1pTdiVOcuBZ8SANHfAdAvRDDVG9jnlLRUBQTkNsXll
	vM3aKOJKRMqPZNWqNbActnO/naSFGy7oJ/xo9NFUD200QZqFqVJMmY5SbELj92+P9Nm3SyfFANcMh
	pIWuRS2JnaUPd+P3MgpNzCFuFjnhDT8cGc0y2wOp2XeCnm2hXLoKjAr/8ZLgu4g2inZfHi/qUa3Xk
	nD2u/4g2Ha40wsxBbiyks2+mLigBEdSEcQ0fn6BjxLMGsBEfj3dwmTEhv6GKS6fiOd9IFofWPAyJO
	80TPdWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDOlj-00CkuV-3M; Mon, 18 Jul 2022 11:18:31 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDOlW-00Ckob-Te; Mon, 18 Jul 2022 11:18:20 +0000
Received: by mail-qt1-x832.google.com with SMTP id h22so8438332qta.3;
        Mon, 18 Jul 2022 04:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wSoYENXBgH2mwK4hdRwcr5ZngBoL0AeSrBZrHAlbPeQ=;
        b=qFnFWPwvGVggO9eAAgTTMi5N3kU74UfugZ/F1ND8Dh1XwEYNQq9hleridz+UuErbjp
         kKXke5m5utIeYESJxdI+Imw1dN7Ky712JivV5EepwVudgfHjmTqzT/4Csy8a5PRWaYcW
         WT7WNRwPzbR88elpVuCiYFy314nf03iGRthvnSl47bKymr5iw2ISiSCilphKmc3sjDBm
         wiODnzpQ5ZhUPmt72MGydEbUEk8Tl3V01TfyuGjdP3zZ6dMAa1QHvvhfxlrb1Fhq/iC3
         p3s1kljCg7uX6D1BpJ/6XC9U0bCN4LfKIpfi4lFkm26bo4VkK/Gcyeu4o/iFLsYdoMKG
         BZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wSoYENXBgH2mwK4hdRwcr5ZngBoL0AeSrBZrHAlbPeQ=;
        b=O1VjFTOCTBCibwbFHmBxoioM8zmM13PRwwqLSMkJMv5l9SglgUvJG2fHatFnNfDmjb
         7hgwlvlBTQEjzKwbrHmlOwVbGCEviaM0NIEgG/qlWV89DooEqLJXTFbJwH9arXQXOKGu
         erMzDeGThYzC30qr9YU4Bp9fsSf/y7w3eJTgQqcAHhxbFEv0pbT2pnlUULQJzkx9CIaR
         UYGo/jpTbZxD9KWtPmQwzjDwOC5b/8Z//qyw0mY0J1axLuDphmjSnFj7kgqw+7kipt4G
         sUVD9xk64TwB7NHXBqshCfDmM7Yi3X/7owbdp2+xhFSC05WpJS0PGuTU6XApTvWPUhAX
         hftA==
X-Gm-Message-State: AJIora/ff7xbe7IyBqL6Z0KcWfbC3YLwqOfTwUPtqigB38Ve3J+uxxai
	PkQ504PQ0tb5ExMx0h1VIsGGqWAd9Oq+fs3mPz8Gq3aZdu4=
X-Google-Smtp-Source: AGRyM1sDQntCUf7aWlvIzBrAp3ngAMq6sCK0MNxJ0IaoTAwyexPRWMVJcAdASNSTm/k1fe6tXf81WYvadsLxzbGsFLI=
X-Received: by 2002:ac8:5a8c:0:b0:31d:2826:d14f with SMTP id
 c12-20020ac85a8c000000b0031d2826d14fmr20168056qtc.198.1658143096830; Mon, 18
 Jul 2022 04:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com> <20220715112607.591-14-peterwu.pub@gmail.com>
 <ec3bdfb8-0e42-a772-28b1-165811872afa@collabora.com> <20220715162913.5ewxwhv6jtdgt3c2@maple.lan>
 <ee88aec0-f6f8-c554-6752-447cb0f34e16@collabora.com>
In-Reply-To: <ee88aec0-f6f8-c554-6752-447cb0f34e16@collabora.com>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Mon, 18 Jul 2022 19:17:40 +0800
Message-ID: <CABtFH5J3tjx6mLfXkx_MySXdYg3qms09gX0wxpuFQxWpz3gowQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/13] video: backlight: mt6370: Add MediaTek MT6370 support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	ChiYuan Huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_041818_996376_F4DAF2FA 
X-CRM114-Status: GOOD (  36.33  )
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

On Mon, Jul 18, 2022 at 4:27 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>

<snip>

> >>
> >> Hello ChiaEn,
> >>
> >> I propose to move this one to drivers/leds (or drivers/pwm) and, instead of
> >> registering a backlight device, register a PWM device.
> >>
> >> This way you will be able to reuse the generic backlight-pwm driver, as you'd
> >> be feeding the PWM device exposed by this driver to the generic one: this will
> >> most importantly make it easy to chain it with MTK_DISP_PWM (mtk-pwm-disp)
> >> with a devicetree that looks like...
> >
> > Out of interest, does MT6370 have the same structure for backlights as the prior
> > systems using mtk-pwm-disp or was mtk-pwm-disp simply a normal(-ish) PWM
> > that relied on something on the board for all the constant current
> > driver hardware?
> >
> >
>
> As per my understanding, mtk-pwm-disp is chained to other multimedia features of
> the display block of MediaTek SoCs, such as the AAL (adaptive ambient light),
> CABC (content adaptive backlight control) etc, other than being a normal(ish)
> PWM... that's the reason of my request.
>
> Moreover, in the end, this PMIC's backlight controller is just a "fancy" PWM
> controller, with OCP/OVP.
>
> >>
> >>      pwmleds-disp {
> >>              compatible = "pwm-leds";
> >>
> >>              disp_led: disp-pwm {
> >>                      label = "backlight-pwm";
> >>                      pwms = <&pwm0 0 500000>;
> >>                      max-brightness = <1024>;
> >>              };
> >>      };
> >>
> >>      backlight_lcd0: backlight {
> >>              compatible = "led-backlight";
> >>              leds = <&disp_led>, <&pmic_bl_led>;
> >>              default-brightness-level = <300>;
> >>      };
> >
> > I think this proposal has to start with the devicetree bindings rather
> > than the driver. Instead I think the question is: does this proposal
> > result in DT bindings that better describe the underlying hardware?
> >
>
>  From how I understand it - yes: we have a fancy PWM (&pwm0) that we use
> to control display backlight (backlight-pwm)...
>
> Obviously, here we're not talking about OLEDs, but LCDs, where the backlight
> is made of multiple strings of WhiteLED (effectively, a "pwm-leds" controlled
> "led-backlight").
>
> Using PWM will also allow for a little more fine-grained board specific
> configuration, as I think that this PMIC (and/or variants of it) will be
> used in completely different form factors: I think that's going to be both
> smartphones and tablets/laptops... and I want to avoid vendor properties
> to configure the PWM part in a somehow different way.
>
> > This device has lots of backlight centric features (OCP, OVP, single
> > control with multiple outputs, exponential curves, etc) and its not
> > clear where they would fit into the "PWM" bindings.
> >
>
> For OCP and OVP, the only bindings that fit would be regulators, but that's
> not a regulator... and that's about it - I don't really have arguments for
> that.
>
> What I really want to see here is usage of "generic" drivers like led_bl
> and/or pwm_bl as to get some "standardization" around with all the benefits
> that this carries.
>
> > Come to think of it I'm also a little worried also about the whole linear
> > versus exponential curve thing since I thought LED drivers were required
> > to use exponential curves.
> >
>
> That probably depends on how the controller interprets the data, I guess,
> but I agree with you on this thought.

Hi Angelo,

MT6370 is just a SubPMIC, not an SoC, and is applied in cellular
telephones, tablet PCs, and portable instruments.
And the PWM mode of the MT6370 backlight driver is optional, and not
must be enabled.
From our perspective, this MT6370 backlight driver is not the same as
mtk-pwm-disp related driver.
Thanks!

>
> Regards,
> Angelo

-- 
Best Regards,
ChiaEn Wu

