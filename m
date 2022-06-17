Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE51EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOxytpr3JE53RNJSPRdeBWhwwL5aBsV68OtuK0gPSKc=; b=ZF1+4JEJbTeAtqSYhKbvvVeRvi
	z5Pdty9uZrTnPHxfygOzBqeXhZb7eM8UwgML4oZRMyl4sKA//EquXpDLXgzfvjPSlYNZc4rjAscCU
	BwsuA/7qRN7EmCAivWEY5J+esYs1D1AaoVd4y0Y8BwY0vFUqOI+HwGjG//VfIdRi8pq4cvfFx1OGB
	qI2qkcQfTdJuKIW2DoYG+nlZsOG/uoT1/3ov15SpHSZoGGOqEkI9SHrMqDgQfgRoLcep/FJxke03Y
	SvEfIacxwscxTyvBi+dCZ6SoWoQ9EVQKA4Q9WSeoTmMtJUfR2evHJxblIzEIs8i9/ZZz44l/wIVvF
	ula8Bi0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29Ka-006yvu-ID; Fri, 17 Jun 2022 10:36:00 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29KP-006ysl-39; Fri, 17 Jun 2022 10:35:50 +0000
Received: by mail-io1-xd36.google.com with SMTP id 19so4097099iou.12;
        Fri, 17 Jun 2022 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rOxytpr3JE53RNJSPRdeBWhwwL5aBsV68OtuK0gPSKc=;
        b=VXLvhpaQU0zgeMjKkkqDHD1I+K0rIshiGzQkNBPk2HQGNqDDUZT5LxEKFLtoSchSaZ
         fKpgnNsU0HTiilSwtx0LgLcenSKqGXiW3QiesMvmIoG8bZYBxjvxIm4ZMCMJssMi06O7
         DmqBTjSMvAsNPKw0iZwY8THSaeWRxbZvzA5XCoxwOMwh8aFihG4t0lDRFgRD8H/l72fJ
         4WO9j/DcS912xHkAAyWAdl+uQmxw6JQHU9ZhlfeMjFsP+HiYKJpSZDjCjXLCjJ4UMtG5
         sj63siSb6Jqs6FXFchQDLzzEq6UOf/Duny841OrK6jdAGRvH8toYDeFHZA1bsbuZ+Yvc
         ewGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rOxytpr3JE53RNJSPRdeBWhwwL5aBsV68OtuK0gPSKc=;
        b=77+32EEqgjt/8ZeFpNb+CnO38fhHbsc2Jz5zxSgmzkjnyU3tgoorO0jPUw+s2IMWPN
         rIdcp+2ZO062heiF6+g9YV5Jz0LtDitsnNlq/JaqSE3C1bu6ZGsF8ry1PP37RHV8k1/G
         wiqQMD0iKx5IKCoNRj6AwHlq0umnQ4gtCPvUEg3ojpkawSe35SGkrYTzWyLyK1IPbCz4
         +B7jqPMwLXLIDTpIiZgeJwBfxeKmuy4TDApjJ8/Qy7S6BWNS220F+Pynn4cyFtlVIAKR
         ut7DyWPjeTGek3w/Fl0u9fglnfVofREYjimCF+iXyDNNAu7VTgF8KHnTv3sBaVJP3775
         CdSw==
X-Gm-Message-State: AJIora8kSqpEFfjuOdJC49iRTpF7UpMCzvqGDUyhcetj2ypDxHyRV8Np
	U4mOOGym7Jpjxu24hNow4NfQqjsRq5nkCcvwdh4=
X-Google-Smtp-Source: AGRyM1udgMHgKDiQMYRnn7E3oN5h0pbJ2A1MrxTn2OBrvOJsKft+xj/e2gq23SyVxC5kFN9WD040jXi32G7pqDTUjpk=
X-Received: by 2002:a05:6638:2113:b0:331:feae:af81 with SMTP id
 n19-20020a056638211300b00331feaeaf81mr4897345jaj.196.1655462146064; Fri, 17
 Jun 2022 03:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com> <20220613111146.25221-6-peterwu.pub@gmail.com>
 <9c38f708-1376-aa89-2c56-c08d320bcf2b@linaro.org>
In-Reply-To: <9c38f708-1376-aa89-2c56-c08d320bcf2b@linaro.org>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 17 Jun 2022 18:35:34 +0800
Message-ID: <CABtFH5KhijZDRA+K=stpOV0t8K3cqCMoLXpLShcdm9F8emrKCA@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] dt-bindings: backlight: Add Mediatek MT6370 backlight
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: jic23@kernel.org, lars@metafoo.de, matthias.bgg@gmail.com, 
	lee.jones@linaro.org, Daniel Thompson <daniel.thompson@linaro.org>, jingoohan1@gmail.com, 
	pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com, 
	ChiYuan Huang <cy_huang@richtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_033549_180550_EC787580 
X-CRM114-Status: GOOD (  23.50  )
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

Hi Krzysztof,

Thanks for your helpful feedback, I have some questions want to
confirm with you below.

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=B9=
=B46=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=BA=94 =E6=B8=85=E6=99=A85:13=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On 13/06/2022 04:11, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add mt6370 backlight binding documentation.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >  .../backlight/mediatek,mt6370-backlight.yaml  | 107 ++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/me=
diatek,mt6370-backlight.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,=
mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/me=
diatek,mt6370-backlight.yaml
> > new file mode 100644
> > index 000000000000..25a05e607e83
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-=
backlight.yaml
> > @@ -0,0 +1,107 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-back=
light.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT6370 Backlight
> > +
> > +maintainers:
> > +  - ChiaEn Wu <chiaen_wu@richtek.com>
> > +
> > +description: |
> > +  This module is part of the MT6370 MFD device.
> > +  The MT6370 Backlight WLED driver supports up to a 29V output voltage=
 for
> > +  4 channels of 8 series WLEDs. Each channel supports up to 30mA of cu=
rrent
> > +  capability with 2048 current steps (11 bits) in exponential or linea=
r
> > +  mapping curves.
> > +
> > +allOf:
> > +  - $ref: common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6370-backlight
> > +
> > +  default-brightness:
> > +    minimum: 0
> > +    maximum: 2048
> > +
> > +  max-brightness:
> > +    minimum: 0
> > +    maximum: 2048
> > +
> > +  enable-gpios:
> > +    description: External backlight 'enable' pin
> > +    maxItems: 1
> > +
> > +  mediatek,bled-pwm-enable:
> > +    description: |
> > +      Enable external PWM input for backlight dimming
> > +    type: boolean
> > +
> > +  mediatek,bled-pwm-hys-enable:
> > +    description: |
> > +      Enable the backlight input-hysteresis for PWM mode
> > +    type: boolean
> > +
> > +  mediatek,bled-pwm-hys-input-bit:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    enum: [0, 1, 2, 3]
> > +    description: |
> > +      The selection of the upper and lower bounds threshold of backlig=
ht
> > +      PWM resolution. If we choose selection 3 (6 bits), the variation=
 of PWM
> > +      resolution needs over than 64 steps (2^6).
> > +      value mapping:
> > +        - 0: 1
> > +        - 1: 2
> > +        - 2: 4
> > +        - 3: 6
>
> Nope, I said last time:
> "In any case you cannot have values mapping"
>
> Please use proper real world value, not some register bits. The property
> name also needs fixing.

I so apologized for misunderstanding your meaning...
I try to modify it like below.
--------
mediatek,bled-pwm-hys-input-threshold-steps:
  $ref: /schemas/types.yaml#/definitions/uint8
  enum: [1, 4, 16, 64]
  description: |
    The selection of the upper and lower bounds threshold of backlight
    PWM resolution. If we choose selection 64, the variation of PWM
    resolution needs over 64 steps.
--------
If these changes meet your expectations, I will try to modify
"bled-ovp-microvolt" and "bled-ocp-microamp" in the same way.
Thank you so much.

>
> > +
> > +  mediatek,bled-ovp-shutdown:
> > +    description: |
> > +      Enable the backlight shutdown when OVP level triggered
> > +    type: boolean
> > +
> > +  mediatek,bled-ovp-microvolt:
> > +    enum: [0, 1, 2, 3]
> > +    description: |
> > +      Backlight OVP level selection.
> > +      value mapping:
> > +        - 0: 17000000
> > +        - 1: 21000000
> > +        - 2: 25000000
> > +        - 3: 29000000
>
> No. Please test your bindings.
>
> microvolt cannot be 1 mV. It's 21000000, not 1. No value mappings.
>
> > +
> > +  mediatek,bled-ocp-shutdown:
> > +    description: |
> > +      Enable the backlight shutdown when OCP level triggerred.
> > +    type: boolean
> > +
> > +  mediatek,bled-ocp-microamp:
> > +    enum: [0, 1, 2, 3]
> > +    description: |
> > +      Backlight OC level selection.
> > +      value mapping:
> > +        - 0: 900000
> > +        - 1: 1200000
> > +        - 2: 1500000
> > +        - 3: 1800000
>
> Nope.
>
> > +
> > +  mediatek,bled-channel-use:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description: |
> > +      Backlight LED channel to be used.
> > +      Each bit mapping to:
> > +        - 0: CH4
> > +        - 1: CH3
> > +        - 2: CH2
> > +        - 3: CH1
> > +    minimum: 1
> > +    maximum: 15
> > +
> > +required:
> > +  - compatible
> > +  - mediatek,bled-channel-use
> > +
> > +additionalProperties: false
>
>
> Best regards,
> Krzysztof

Best regards,
ChiaEn Wu

