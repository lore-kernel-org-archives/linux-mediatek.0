Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21374C19F29
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 06:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TPo7Ien9QeOugxuEK5vZ4jEbRvQ6L+0JHSHIFL79V8=; b=ptKc4WZarDhyhStLMIwRPqZ2M/
	CHgmVcHavEGPtC8O65xyIYeOHz+e1xrBY5zzY1nIFd/QfBH/zVEX3oA9Z+Criy631f8a0++g3AeQk
	UQx0u/PxdCbB3O1cYPlyVRuKBXkYQU4TxrluCQtSaixGAqY9pkZ2mz9KYBLuip97dGqP8WaeZhJbh
	TgtM3gau7rdc1MLjE2VhndVikoiMfcrvINYAKNsu7RyweQXjMuaa9XUfQvnHKfaIi6O04mNsVJdul
	QCtFIlnZaegVzDdjOrCbUF801+VVM6NIptRhLPQCdr4YN/OgMs8sU7X2XSHGW8uvJlOFs4Qlu5+mZ
	Fcl2kzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGaUF-009wIu-5s; Wed, 27 Jul 2022 06:25:39 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGaU0-009w9k-To; Wed, 27 Jul 2022 06:25:26 +0000
Received: by mail-qt1-x833.google.com with SMTP id b21so11997396qte.12;
        Tue, 26 Jul 2022 23:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3TPo7Ien9QeOugxuEK5vZ4jEbRvQ6L+0JHSHIFL79V8=;
        b=Ju/fvdD+2tscdEHB4jMKbtF6QmWjmZhx4K1G8NkrcLADIpn1JSvESTmxlpt3R4JNiz
         UREKmBz7PU2Y4uvwc4LZREeVj+DUEo2k1jrd7hNHdeyJaPFWuyOYHw16/YljzGwcQaoU
         IH9nnG8x+s+fp3W9UU/Nffn3iiGxPKEQbqR3X0123vmqEq4yNkiC0A2VH4Sesf85arfJ
         RzfM19DJEhBx9KsylbfN02wrMkNXOO4yndJf2oYfq2BmSNFuvo9Rdv3pkq/RJsxGlZB+
         ENmHhdFgodOhI3rw8EXt41BmEN6clXlYa2qisFRSVLQ9+VWdxO1/quC1BwvjDvoQk+pS
         Zcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3TPo7Ien9QeOugxuEK5vZ4jEbRvQ6L+0JHSHIFL79V8=;
        b=qJtHmD7LiplVctdNg42J5Z3HeUVYb/hzoIU3k/pxoSJHMyaT+MeXIq6858mHyZaFs2
         vd0n/DQiAM+2TIFsdFPa/2DnQmLqp6jijIVwzeQJkS+u83VXrUHRDYjIbLq94Zt8zlnI
         aTLpNhepwCFy1aFg7Ltlu/xB+tXsiHJ2+jn/Vj7UWzRsv8LqqgR1GKFCLQVD4dcnH7pB
         fOLZJwEtKoVyPH05rUMn7ZyjNOYw4QaIlv5djjfMo6ITHrBSTt3wLiVFwcUc3nbyI9GY
         qJQVcsCdL9YHsv27F2QefOB3xRmpjI3mezi7O27SFUdt2bvsKhSp3nWFX62Mc9qWlAbA
         zj+g==
X-Gm-Message-State: AJIora9La5heqHuJmzugK+Dle6CzmkxC1SXgtYB2YN5LTDNJF5vb/jv2
	+gRSaAUV3O88TxDWL8sBj3E1kZf3ENwXp3UwKZc=
X-Google-Smtp-Source: AGRyM1tfME3ecCaCTfMzeCQrYhvxtlKmxqJRxH1lMRN/F0J8TcAZeGQUzQp4E/o76yd4w8Asm4EShy68HPneD7bl0pE=
X-Received: by 2002:a05:622a:1742:b0:31f:ef:f6eb with SMTP id
 l2-20020a05622a174200b0031f00eff6ebmr17635908qtk.548.1658903123036; Tue, 26
 Jul 2022 23:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-14-peterwu.pub@gmail.com>
 <20220725103128.xtaw2c4y5fobowg7@maple.lan> <CABtFH5LUKTZenTktq3v1JZ9xe-yJFsMvCZuwDhmxdT87k0O-zA@mail.gmail.com>
 <20220726093058.2fz2p2vg7xpfsnfe@maple.lan> <CABtFH5+in-+=6r3wOvQ8-78DT9CXaMursJukhx+kdwMvvP3djw@mail.gmail.com>
 <20220726115954.kpkmidrk3zo3dpbq@maple.lan>
In-Reply-To: <20220726115954.kpkmidrk3zo3dpbq@maple.lan>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Wed, 27 Jul 2022 14:24:46 +0800
Message-ID: <CABtFH5K3LLw9ZqY0Qrrx_8xs+3ioJpzP0=_HptmoDY6tvu2JVg@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] video: backlight: mt6370: Add MediaTek MT6370 support
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Alice Chen <alice_chen@richtek.com>, ChiYuan Huang <cy_huang@richtek.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_232525_009582_484A8BC0 
X-CRM114-Status: GOOD (  64.63  )
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

On Tue, Jul 26, 2022 at 7:59 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:

 ...

> > > > > Does the MT6372 support more steps than this? In other words does it use
> > > > > a fourteen bit scale or does it use an 11-bit scale at a different
> > > > > register location?
> > > >
> > > > Hi Daniel,
> > > >
> > > > Thanks for your reply.
> > > > Yes, MT6372 can support 16384 steps and uses a 14-bit scale register
> > > > location. But the maximum current of each
> > > > channel of MT6372 is the same as MT6370 and MT6371, both 30mA.
> > > > The main reason why MT6372 is designed this way is that one of the
> > > > customers asked for a more delicate
> > > > adjustment of the backlight brightness. But other customers actually
> > > > do not have such requirements.
> > > > Therefore, we designed it this way for maximum compatibility in software.
> >
> > Sorry for I used of the wrong word, I mean is 'driver', not
> > higher-level software
> >
> > >
> > > I don't think that is an acceptable approach for the upstream kernel.
> > >
> > > To be "compatible" with (broken) software this driver ends up reducing
> > > the capability of the upstream kernel to the point it becomes unable to
> > > meet requirements for delicate adjustment (requirements that were
> > > sufficiently important to change the hardware design so you could meet
> > > them).
> >
> > Originally, we just wanted to use one version of the driver to cover
> > all the SubPMIC of the 6370 series(6370~6372).
> > And, the users who use this series SubPMIC can directly apply this
> > driver to drive the backlight device without knowing the underlying
> > hardware.
> > To achieve this goal, we have designed it to look like this.
>
> You don't need a second driver to support two different values for
> max-brightness. The same driver can support both ranges with nothing but
> a small tweak during the driver probe function.
>
>
> > ...
> > > > > > +
> > > > > > +     if (brightness) {
> > > > > > +             brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> > > > > > +             brightness_val[1] = (brightness - 1) >> fls(MT6370_BL_DIM2_MASK);
> > > > > > +
> > > > > > +             /*
> > > > > > +              * To make MT6372 using 14 bits to control the brightness
> > > > > > +              * backward compatible with 11 bits brightness control
> > > > > > +              * (like MT6370 and MT6371 do), we left shift the value
> > > > > > +              * and pad with 1 to remaining bits. Hence, the MT6372's
> > > > > > +              * backlight brightness will be almost the same as MT6370's
> > > > > > +              * and MT6371's.
> > > > > > +              */
> > > > > > +             if (priv->vid_type == MT6370_VID_6372) {
> > > > > > +                     brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
> > > > > > +                     brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;
> > > > > > +             }
> > > > >
> > > > > This somewhat depends on the answer to the first question above, but
> > > > > what is the point of this shifting? If the range is 14-bit then the
> > > > > driver should set max_brightness to 16384 and present the full range of
> > > > > the MT6372 to the user.
> > > >
> > > > So should we make all 16384 steps of MT6372 available to users?
> > >
> > > Yes.
> > >
> > >
> > > > Does that mean the DTS needs to be modified as well?
> > >
> > > Yes... the property to set initial brightness needs a 14-bit range.
> > >
> > > It would also be a good idea to discuss with the DT maintainers whether
> > > you should introduce a second compatible string (ending 6372) in order
> > > to allow the DT validation checks to detect accidental use of MT6372
> > > ranges on MT6370 hardware.
> >
> > hmmm... I have just thought about it,
> > maybe I can just modify the maximum value of default-brightness and
> > max-brightness in DT to 16384,
> > modify the description and add some comments.
>
> What for?
>
> All the other backlight drivers (there are >130 of them) expose the hardware
> range[1]. Most userspaces will already know how to handle that (by reading
> the max_brightness and, if it is recent enough, also the scale
> properties in sysfs).
>
> I'm still don't understand why one should fix a bug in the userspace by
> implementing a hack in the driver.
>
>
> [1] Well almost. The PWM backlight driver does contain support for
>     dead-spot avoidance and to allow the adoption of exponential scale.
>     However this  purpose of these is based on how PWM backlights work
>
> > And then on the driver side,
> > we can use mt6370_check_vendor_info() to determine whether it is MT6372.
> > If no, then in mt6370_bl_update_status(), first brightness_val / 8 and then set.
> > In mt6370_bl_get_brightness(), first brightness_val * 8 and then return;
> >
> > If I do this change, does this meet your requirements?
>
> Not really.
>
> It's still misleading a sophisticated userspace, which may make bad
> rounding decisions for backlight animation, in order to support a broken
> one.
>
>
> > > > Or, for the reasons, I have just explained (just one customer has this
> > > > requirement), then we do not make any changes for compatibility
> > > > reasons?
> > >
> > > I'd be curious what the compatiblity reasons are. In other words what
> > > software breaks?
> >
> > The reason is as above. We just hope the users who use this series SubPMIC can
> > directly apply this driver to drive the backlight device without
> > knowing the underlying hardware.
> > Not software breaks.
>
> As above, ignoring the max_brightness property is a bug in the
> userspace. I'm still unclear why sending faked ranges to userspace
> it a better solution than fixing the userspace.

Ok, I got it!
If I add a second compatible string (like 'mediatek,mt6372-backlight')
in the DT section,
and append 'if-then-else' to determine the correct maximum value of
'default-brightness' and 'max-brightness',
Also, I will append 'bled exponential mode' to make user control using
linear or exponential mode.
These changes I will explain to DT's maintainer again.

Back to the driver section,
do I still need to use the register to confirm again whether this
SubPMIC used now is MT6372 and record this information? (using
'mt6370_check_vendor_info()')
I am afraid that the user who uses the MT6370 hardware, but the DT
compatible string is set to 'mediatek,mt6372-backlight'.
This may cause errors when update/get brightness values.
So I hope the driver here can check again to make sure the
'default-brightness', 'max-brightness', can be updated/got correctly.
I don't know if this will make you feel redundant if I do this??

Thank you so much!

-- 
Best Regards,
ChiaEn Wu

