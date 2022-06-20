Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02FEC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 03:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClA6mV7hozr21kuBkeCxjd9fGNxXJpc68c5A8HEJUUI=; b=vTkAVTWCcUgyC5RGYmx42RMieH
	ZR/wBe0+oITsVlbg38a/8v30zueylDlgDuXB7ZYLCdlO/JyTlVhYYW/pPMHkHFC3PKHFpktfMWuuR
	JmhkD9OinYcat186NeMuYkOjt+2OLn8ZDTuAc87A8uS80d01MGhnE61LeNKJ7JqHXzXgbDbnLQ9Au
	4IZCLTQHBYYgkjlW+HhQdqXKGcjW7VTYHJQ7mLdZ/1QPx8wDtZVyKz0YQNEycyA21B6aVjPDA1hTn
	Urpd166LOxhD6f8ofn7CJfF2QuAh1OxsPBWDyALGm/NjL7jDS/wQ/iKJ2HEX5bv89DuHiAm4nWdNi
	qn/Nd/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o37lb-00FvWp-JE; Mon, 20 Jun 2022 03:07:55 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o37lN-00FvQj-UJ; Mon, 20 Jun 2022 03:07:43 +0000
Received: by mail-il1-x135.google.com with SMTP id k18so1062392ilr.11;
        Sun, 19 Jun 2022 20:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ClA6mV7hozr21kuBkeCxjd9fGNxXJpc68c5A8HEJUUI=;
        b=gOpv1108ut5ySpAPndiTka0cdAPZs7Flmw6QF/XASUursDWrwbsAx9Vt+ZXF5kcdEw
         TCakBrMFGrsxiKWEOhenPFzr9LBdXhjmxW5370IMQcOOlgaFHdTNkBB+FXGyNxJcg61e
         E1CcWHlUQ+QDQ0SBGzNysb+dxHy8expVECKExkABctkP/dtbwAAACdK2L7UDO9Gbz48K
         ji3tgBrL0udfA8TkFrC8hp8qz2em39uxnCPqC9QkBkCfnnMqz+vlX4RNa8QIDVPQFIsS
         Tfem3Y9ER0V16TcCeQoXqA7MiKjEXoKy5//qqMQChDe5hPDjkyy9/RyTBkvqD/PR7kp3
         aZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ClA6mV7hozr21kuBkeCxjd9fGNxXJpc68c5A8HEJUUI=;
        b=xpA+oUEyrideUIulAdCYfW9D0XW65MehkvcxGd/0nCMZhxxmfVIPUwGSxxKHXLtu0N
         lDprAHRynEOmqBXAoSFZF6+IimczKzsVvIUCH+8CeIxA8IGXrE84S6sbLBsffwNdVKgI
         wE9H9Ly4hU76+5w9wNe5si3ILpL/eHpz0xsiYBBOIjVMuSxTDmcDkwDMcuBJ4T/gK9I+
         LxhOrDlQ5Xkwx9zmSJCZKUFKogThB7ypL6O/2I0NAuIaRTioCTWiM25EuyGbygPo3Lp+
         4S0OhTOiJLuZATU6JLPiinieORJYdIRUQPMIk5VwF/yNsLr4okEMtx9y5mMd4IHBAsvI
         YIBg==
X-Gm-Message-State: AJIora94f3BVqMfbHVPYGK7J94lZNDiuonncNLflYe7vEnAwIHNs+JLD
	8iWul165ufDheT6Ykom60blBnQlL6s8mnc9n19c=
X-Google-Smtp-Source: AGRyM1uWx3Xja5gAlxQTsI9Gy8E4mbdwpO+4QcNSHclRnN4Pr80zjlE1E8X1wNostXJGk9TU7gkWHZtEAVASNa5cJX8=
X-Received: by 2002:a05:6e02:1bc1:b0:2d1:96b3:b961 with SMTP id
 x1-20020a056e021bc100b002d196b3b961mr12302759ilv.213.1655694460188; Sun, 19
 Jun 2022 20:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com> <20220613111146.25221-4-peterwu.pub@gmail.com>
 <91e9e3af-8208-7535-1864-08744f934593@linaro.org>
In-Reply-To: <91e9e3af-8208-7535-1864-08744f934593@linaro.org>
From: szuni chen <szunichen@gmail.com>
Date: Mon, 20 Jun 2022 11:07:29 +0800
Message-ID: <CA+hk2fZbh0=8gurGS95XpXrYyF3NbwFbFMcygcrW_q10m0zinA@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] dt-bindings: leds: mt6370: Add Mediatek mt6370
 current sink type LED indicator
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-iio <linux-iio@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	Linux PM <linux-pm@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, ChiYuan Huang <cy_huang@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_200742_045040_264D6C9C 
X-CRM114-Status: GOOD (  18.02  )
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

Dear Krzysztof,

Thank you for the valuable command.

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=B9=
=B46=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=BA=94 =E6=B8=85=E6=99=A85:09=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On 13/06/2022 04:11, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add Mediatek mt6370 current sink type LED indicator binding documentati=
on.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >  .../leds/mediatek,mt6370-indicator.yaml       | 48 +++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6=
370-indicator.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-ind=
icator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indica=
tor.yaml
> > new file mode 100644
> > index 000000000000..42b96c8047a3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.=
yaml
> > @@ -0,0 +1,48 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LED driver for MT6370 PMIC from MediaTek Integrated.
> > +
> > +maintainers:
> > +  - Alice Chen <alice_chen@richtek.com>
> > +
> > +description: |
> > +  This module is part of the MT6370 MFD device.
> > +  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM=
/Breath Mode
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6370-indicator
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^(multi-)?led@[0-3]$":
>
> If this is multi-led, then you should reference
> /schemas/leds/leds-pwm-multicolor.yaml
>
> See other examples using it.

In my opinion, leds-pwm-multicolor.yaml is used for external pwm
signals, and needs to assign an external pwm property.
But our pwm leds use an internal clock to generate the pwm signal. Is
leds-class-multicolor.yaml more appropriate?

Sincerely,
Alice
>
>
>
> Best regards,
> Krzysztof

