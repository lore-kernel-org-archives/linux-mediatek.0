Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12000C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 02:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0xMOzx9xkEwYcg4IC9rpOdFz/8JFTGOz3GpQHY8CyA=; b=gJNLs18q0vmVML9NIVORrvC2BV
	9g29wnlp/2zmcE6s4JA1bLuCmW177W+nrlD6oxQnjcQt8yeQNWLumN+9o4ox6tNGrlhES/kvoIqLZ
	zEQ1wROLJyRK5d8CJbuXZiHNM6d73+x82/JZAcNCHOrXjsKWshELOrvPqfmbm3H8lKd2JJU5FHe1Y
	FsfiJbwv+fmmlAlH5HlDXf64wWt6Mg/7YKTMti0FIYF0zIB2g/wWuLwwXX9ap+eDWKB0J+lZv/BqS
	AWgLArYlo0T5x/g8x+s31BtPpezQFPdYskxRDAt0t25aU/ohJ+Vy6LvRfCVXOVB7xwbIdjIy67Ey9
	VUoToscA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGABq-006qca-V2; Tue, 26 Jul 2022 02:20:54 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGABd-006qXt-PJ; Tue, 26 Jul 2022 02:20:43 +0000
Received: by mail-qk1-x730.google.com with SMTP id f14so10117553qkm.0;
        Mon, 25 Jul 2022 19:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W0xMOzx9xkEwYcg4IC9rpOdFz/8JFTGOz3GpQHY8CyA=;
        b=bQNzSCTQTDj5oJAikkEBCR3Q/tLaWKw4sj3Vy9sXwlvn8sYyxYtkIYLMGJHXeTnchw
         taB+Q9JNgrphDka9FLEaK8Qsw28p9ed1+CizwomW4uNr80I+wP1Lqo9LTTYwNWb3V89V
         GIklfwwZ1L8oQOXN4gS6QzAtgFIiB62NAp+81WQ1VPf3ZNTslXRqVWiUfEk+RoW/cY8f
         fDSw5bn9W+8qRxPD/H7Me+Tk8/fC32oiFqKIMjraRmMb5Kapx2uuyolL4AP030DYsD1r
         9zbtprQkDJeDZWr8JDzg2hRZyzyKu9MOyRP/v2uOlFD2v7biNRKTj8XzA8Co9eYGKCHI
         FE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W0xMOzx9xkEwYcg4IC9rpOdFz/8JFTGOz3GpQHY8CyA=;
        b=JFvENqFDDBBau8xO+zcS01RnlvzL66JEcTi98MBQNC5h5LVIlxRgkrijfRa15uXtkd
         HjtxOfMJ/TUCOWfeYNTEtGm4tU89wG5GZPMdt7etECzyRMP4kpqWWmxmQSBmT/D1G5cI
         i7j/fgymncAoTXKSfKCfHDedJX87jBbQ3DiuubE7nVLTFtBOF1995+PjY8Tk13U6ycGC
         uIyzA2b8C4ehERwEQjNM2dGRCPxFd8bYXniIvymlzbKnJKnGcGFj0cWrLDEuRTp9Nepz
         9AeThWrkdjZVY2+EASi1bGcrWyg90ldQxVcQJHbTqCBJWjCIaFWLwkwHcN+d9Ffd52B+
         Yefw==
X-Gm-Message-State: AJIora+1WsCQfqx/zeqZ3+PLawYZ2vT+sZv6EcX4Cx4nCpUYlG5wcJdK
	6dJNMPR6AXQ3PPPxj7tTk/VTmQxMOf1HAlr8wqE=
X-Google-Smtp-Source: AGRyM1tZpCYcrI4GEenV5sl4ffLbB3S1w73dtE0jE5MocjhBVejW7P4d8PE22YJ6HvnYEZBNm5FpvyKW1Z34FzM/KzI=
X-Received: by 2002:a37:80c2:0:b0:6b5:e9e4:c4c1 with SMTP id
 b185-20020a3780c2000000b006b5e9e4c4c1mr11082627qkd.129.1658802038657; Mon, 25
 Jul 2022 19:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-14-peterwu.pub@gmail.com>
 <20220725103128.xtaw2c4y5fobowg7@maple.lan>
In-Reply-To: <20220725103128.xtaw2c4y5fobowg7@maple.lan>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Tue, 26 Jul 2022 10:20:02 +0800
Message-ID: <CABtFH5LUKTZenTktq3v1JZ9xe-yJFsMvCZuwDhmxdT87k0O-zA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220725_192041_866777_895D1300 
X-CRM114-Status: GOOD (  40.85  )
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

On Mon, Jul 25, 2022 at 6:31 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Fri, Jul 22, 2022 at 06:24:07PM +0800, ChiaEn Wu wrote:
> > diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> > index a003e02..846dbe7 100644
> > --- a/drivers/video/backlight/Kconfig
> > +++ b/drivers/video/backlight/Kconfig
> > @@ -268,6 +268,18 @@ config BACKLIGHT_MAX8925
> >         If you have a LCD backlight connected to the WLED output of MAX8925
> >         WLED output, say Y here to enable this driver.
> >
> > +config BACKLIGHT_MT6370
> > +     tristate "MediaTek MT6370 Backlight Driver"
> > +     depends on MFD_MT6370
> > +     help
> > +       This enables support for Mediatek MT6370 Backlight driver.
> > +       It's commonly used to drive the display WLED. There are 4 channels
> > +       inside, and each channel supports up to 30mA of current capability
> > +       with 2048 current steps in exponential or linear mapping curves.
>
> Does the MT6372 support more steps than this? In other words does it use
> a fourteen bit scale or does it use an 11-bit scale at a different
> register location?

Hi Daniel,

Thanks for your reply.
Yes, MT6372 can support 16384 steps and uses a 14-bit scale register
location. But the maximum current of each
channel of MT6372 is the same as MT6370 and MT6371, both 30mA.
The main reason why MT6372 is designed this way is that one of the
customers asked for a more delicate
adjustment of the backlight brightness. But other customers actually
do not have such requirements.
Therefore, we designed it this way for maximum compatibility in software.

>
>
> > +
> > +       This driver can also be built as a module. If so, the module
> > +       will be called "mt6370-backlight".
> > +
> > [...]
> > diff --git a/drivers/video/backlight/mt6370-backlight.c b/drivers/video/backlight/mt6370-backlight.c
> > new file mode 100644
> > index 0000000..ba00a8f
> > --- /dev/null
> > +++ b/drivers/video/backlight/mt6370-backlight.c
> > [...]
> > +static int mt6370_bl_update_status(struct backlight_device *bl_dev)
> > +{
> > +     struct mt6370_priv *priv = bl_get_data(bl_dev);
> > +     int brightness = backlight_get_brightness(bl_dev);
> > +     unsigned int enable_val;
> > +     u8 brightness_val[2];
> > +     int ret;
> > +
> > +     if (brightness) {
> > +             brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> > +             brightness_val[1] = (brightness - 1) >> fls(MT6370_BL_DIM2_MASK);
> > +
> > +             /*
> > +              * To make MT6372 using 14 bits to control the brightness
> > +              * backward compatible with 11 bits brightness control
> > +              * (like MT6370 and MT6371 do), we left shift the value
> > +              * and pad with 1 to remaining bits. Hence, the MT6372's
> > +              * backlight brightness will be almost the same as MT6370's
> > +              * and MT6371's.
> > +              */
> > +             if (priv->vid_type == MT6370_VID_6372) {
> > +                     brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
> > +                     brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;
> > +             }
>
> This somewhat depends on the answer to the first question above, but
> what is the point of this shifting? If the range is 14-bit then the
> driver should set max_brightness to 16384 and present the full range of
> the MT6372 to the user.

So should we make all 16384 steps of MT6372 available to users?
Does that mean the DTS needs to be modified as well?
Or, for the reasons, I have just explained (just one customer has this
requirement), then we do not make any changes for compatibility
reasons?
Thanks.

>
> Especially when using linear mappings (which are a totally pointless
> scale to use for a backlight) the extra steps are useful for backlight
> animation.
>
>
> Daniel.

-- 
Best Regards,
ChiaEn Wu

