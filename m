Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC233C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MP9RQT0mw2gx9xecm41XDjO0xQp/A9AAK0cYbd+v7PM=; b=n5Sp1C7sJAfZCuWh8jj42GlByH
	mxgQbuar9kTp6GsXewyD3nzNXkdtQAaQK6AvTwEeOOdq97s9rVu+caGCxbICXXy/HCSw0W1Fh2xoK
	CpglbzOb5YrjvpJCQTr5bU2p4vZupB4K1jvdUtN/5qG3rNltnwaswrNgUOvCCHtSTJEz5/+d8lPeS
	Hgf9Rzd+uD4uvWg3aJb7h2G2u5CUC7atqS/zDi9Bv7DPSdVzW61WlJK4cEFS/JjoPCBa3bNXWYTGc
	g3grT1kqYjovIay5jEuhoV2dxFp4IoNxTbDqE+7a0V6fmnF4OaEStKZcFt0sQUnKa2uR9tZJBvL/Z
	U78OvWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4fiW-001RhJ-7a; Fri, 24 Jun 2022 09:35:08 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4fiE-001RaM-Sz; Fri, 24 Jun 2022 09:34:52 +0000
Received: by mail-io1-xd2b.google.com with SMTP id a10so2099479ioe.9;
        Fri, 24 Jun 2022 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MP9RQT0mw2gx9xecm41XDjO0xQp/A9AAK0cYbd+v7PM=;
        b=XOSjJie8EVvJ68P8cDkEuXXdIP7YNykFHD5ucaFHa23sPTgdW5s+vEyYglwP5ITADf
         de6ih0EGdaikqxaCCoMYFOazeMTR+HJ2Od3FO0aVrMGZ9Ao0YQc3IGKpdK1KsldTwlvh
         mNgixo6yDK8vv6W4zP9rFZEgeSROQH0wRlhznnuez0r+LK3zlRzbpSDq8zkiXpRGsUdD
         wlBFXBP+v/yudkNVKvRuUvTnfyVEt9q4H+CcHi3K0tEYuY/us9b2jbsRIceZSdwT323h
         bCW6ZtoKL/DDgyl9mBYWdF/TeTYV9OJiSRhfvnTTdEl5HuLFgATDlbAUJ79bLaqNIqyo
         pjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MP9RQT0mw2gx9xecm41XDjO0xQp/A9AAK0cYbd+v7PM=;
        b=2NVZP8l8f5cMRC4Ha4bBtT/9YDHl5z+4LjUzbpidmo9d7BTVTC4Z1nmT5vZ49igQZL
         SUOunnIKTkP9Zf4XndoGCszTUJ56KdCaAcOO90SADYvLC7d1oxoN0X07uF8cGON3xvSh
         AqbibpO2RlQ3nb9Wd2fD4/K/zOe/uRej0eUjUMcO0fh9KMJhxmStXBvESBPFmllPo94b
         X6Kmxxht1fvRzM5tEtRM7QfVRLmOAKH92aclBQOWFNv66H2/+GuULDGceTq5TcD694Ti
         PzVdlN6evbK63EVPdSTzmPpSSLD8QzyY8JcYTaw+AAX4gUWpo5Pa5PzMMozeRXqVOAR5
         2M0w==
X-Gm-Message-State: AJIora/azGY144jJvL+ewVlE7WfMv/Q21fginofu8aw0mIoAoeacM7Th
	wMcpf4sR1/sBrEbiMQNWhZZp+3/es1h1B77RuGU=
X-Google-Smtp-Source: AGRyM1uasjCkCSVNNk3dqGVMtMHhWuLiOU+3vPo8KNEsy3IZCmdFQUJiWYJTC/E8bQMesuaOX1oy1FkolQJLbHcM1Io=
X-Received: by 2002:a05:6638:348d:b0:331:d8f0:fd9d with SMTP id
 t13-20020a056638348d00b00331d8f0fd9dmr7928714jal.165.1656063287244; Fri, 24
 Jun 2022 02:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-6-peterwu.pub@gmail.com>
 <YrRny9TPqMUW7Yr/@spruce>
In-Reply-To: <YrRny9TPqMUW7Yr/@spruce>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 24 Jun 2022 17:34:36 +0800
Message-ID: <CABtFH5JdPHfvGi+tG+EKh_-XH0YxWHR3o=LsPAdW38e8fFoBeg@mail.gmail.com>
Subject: Re: [PATCH v3 05/14] dt-bindings: backlight: Add Mediatek MT6370 backlight
To: Joe Simmons-Talbott <joetalbott@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, sre@kernel.org, 
	chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org, 
	Jonathan Cameron <jic23@kernel.org>, lars@metafoo.de, lgirdwood@gmail.com, broonie@kernel.org, 
	linux@roeck-us.net, heikki.krogerus@linux.intel.com, deller@gmx.de, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	ChiYuan Huang <cy_huang@richtek.com>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, szunichen@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_023451_005778_9EBB05E0 
X-CRM114-Status: GOOD (  20.92  )
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

Hi Joe,

Joe Simmons-Talbott <joetalbott@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=9C=
=8823=E6=97=A5 =E9=80=B1=E5=9B=9B =E6=99=9A=E4=B8=8A9:17=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Thu, Jun 23, 2022 at 07:56:22PM +0800, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add mt6370 backlight binding documentation.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >
> > v3
> > - Rename "mediatek,bled-pwm-hys-input-threshold-steps" to
> >   "mediatek,bled-pwm-hys-input-th-steps"
> > - Refine "bled-pwm-hys-input-th-steps", "bled-ovp-microvolt",
> >   "bled-ocp-microamp" enum values
> > ---
> >  .../leds/backlight/mediatek,mt6370-backlight.yaml  | 92 ++++++++++++++=
++++++++
> >  1 file changed, 92 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/me=
diatek,mt6370-backlight.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,=
mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/me=
diatek,mt6370-backlight.yaml
> > new file mode 100644
> > index 0000000..26563ae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-=
backlight.yaml
> > @@ -0,0 +1,92 @@
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
> > +  mediatek,bled-pwm-hys-input-th-steps:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    enum: [1, 4, 16, 64]
> > +    description: |
> > +      The selection of the upper and lower bounds threshold of backlig=
ht
> > +      PWM resolution. If we choose selection 64, the variation of PWM
> > +      resolution needs over than 64 steps.
>
> more than?
>
> Thanks,
> Joe
>

Thanks for your helpful comments!
I will revise this in the next patch. Thanks!

> > +
> > +  mediatek,bled-ovp-shutdown:
> > +    description: |
> > +      Enable the backlight shutdown when OVP level triggered
> > +    type: boolean
> > +
> > +  mediatek,bled-ovp-microvolt:
> > +    enum: [17000000, 21000000, 25000000, 29000000]
> > +    description: |
> > +      Backlight OVP level selection.
> > +
> > +  mediatek,bled-ocp-shutdown:
> > +    description: |
> > +      Enable the backlight shutdown when OCP level triggerred.
> > +    type: boolean
> > +
> > +  mediatek,bled-ocp-microamp:
> > +    enum: [900000, 1200000, 1500000, 1800000]
> > +    description: |
> > +      Backlight OC level selection.
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
> > --
> > 2.7.4
> >

Best regards,
ChiaEn Wu

