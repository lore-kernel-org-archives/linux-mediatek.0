Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D28EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 03:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8N5MjOkiSaB3ofxEkfc7GX5qO3uXuwTs5u5EqCLFvs=; b=iNk3srg5qtqDZS
	1gVtwQX7fBCVAhfM4E4btLp8Xp+E28A1BEo2tQ41cN3OZCCiuQ+gWdNW6VR2BT1TKtdylvAJk1HD8
	gXz5+VenU4T5gXpWgUIOOciZFLXFfPz5n7ZI9uDNY4i4Iyz4JxTlIbKr6cQnsGr/eIn+Subi4vUtt
	bVAH4+4p8j/bv9MKhpC/WeRQSz1XvC/IBgTIGLCIzWkzQZVOWxJotutlRxjTejKNapuiaYOC/vGAX
	4Bz2Ig+0Lzz7mmOPx76Ys/XZ8iFuqAwLbSP2t+0gq6xs0CigOBTikfkl7wZeP2L/h/SEDFVq8/fR6
	0PHtfaBxi+3CMjRKjCXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9fLT-00HWps-W0; Tue, 18 Jan 2022 03:39:44 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eeV-00HAhC-94
 for linux-mediatek@lists.infradead.org; Tue, 18 Jan 2022 02:55:21 +0000
Received: by mail-lf1-x135.google.com with SMTP id m3so50993868lfu.0
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Jan 2022 18:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1xGzmg81DuUlAGTYFkIbn0LL6gpYYtNJdIrpuHBXKz4=;
 b=TCyfhuASYEMuFNk1ASL5LKWD7ok8PXJJ74hOetk36L1lGBv56RpTKWdq3Oan2zuuey
 1P7dZUsUGAZhvrWqYJhqjI4el8YWhCPLLmMgVMjM1ouVYaRdEFUb3DJFx9ur9I9WmKuV
 +wjXSSWn9Bme4/0/ekyb/STAD+5FhFBBU51Iw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1xGzmg81DuUlAGTYFkIbn0LL6gpYYtNJdIrpuHBXKz4=;
 b=KiAZ/scoO4JZKq8nM6Ock0KSJyMupQmx4hHETFm2lzdsPyeKQdCsgWDgVzifvBWGko
 +g10K+dzDpAwJXRdEIKvaVhlbZA4oLLeACnCMxT/Mm+e88ahKjvOXBgbViOm27alxgh7
 08xVOCWTus42UwpzB8hTNrjxNowDFW1GP7Prv/PQ/F9ztFPk5CFGGIoDRypMc9ez/Ukb
 suzTRDf0Bg8eNsqWGL6O83bfugNP8NQpt8Vu72g//1ZDEKu7zl6HOctyHpaHXQW9FsZB
 ovTa8bp9nUTfpGfRc9b4xS3xJj3Rhuq1OZonqKFAUDROtIn7R0GOJxAET4BE3E55fr/O
 OBNA==
X-Gm-Message-State: AOAM533woTgPqkpOCqV5KUaV5krFIdNAQk0pRcTSWp32Vz7BMbjkQmRA
 fTkqoBmgYoEWjrc2zd8szuGa0259FIHlDQ6Kq+enfg==
X-Google-Smtp-Source: ABdhPJy6Dg4mAwpGc0BC6YsAH1eqGHyBYkQUxCzn5U7IvAtaIKsJB56Z752NgaGIWVH8lotJElSk0Kxi1jaV0jfRbzY=
X-Received: by 2002:a05:6512:3682:: with SMTP id
 d2mr19005682lfs.678.1642474516308; 
 Mon, 17 Jan 2022 18:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-8-wenst@chromium.org>
 <b1d5ca006860c85edd971ea9e20880ec8ba7f842.camel@mediatek.com>
In-Reply-To: <b1d5ca006860c85edd971ea9e20880ec8ba7f842.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 18 Jan 2022 10:55:05 +0800
Message-ID: <CAGXv+5Egf-XM_Y8+ujYrx9k0UgAkpPj9DVpZEVz2hWdGzws2ZA@mail.gmail.com>
Subject: Re: [PATCH 7/7] pinctrl: mediatek: paris: Support generic
 PIN_CONFIG_DRIVE_STRENGTH_UA
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guodong Liu <guodong.liu@mediatek.com>, 
 hui.liu@mediatek.com, light.hsieh@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_185519_399545_1655F559 
X-CRM114-Status: GOOD (  41.84  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Tue, Jan 18, 2022 at 10:36 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Tue, 2022-01-11 at 19:22 +0800, Chen-Yu Tsai wrote:
> > Some of the MediaTek chips that utilize the Paris pinctrl driver
> > library
> > support a lower drive strength (<= 1mA) than the standard drive
> > strength
> > settings (2~16 mA) on certain pins. This was previously supported by
> > the
> > custom MTK_PIN_CONFIG_DRV_ADV parameter along with the
> > "mediatek,drive-strength-adv" device tree property.
> >
> > The drive strength values for this hardware are 125, 250, 500, and
> > 1000 mA,
> > and can be readily described by the existing "drive-strength-
> > microamp",
> > which then gets parsed by the generic pinconf library into the
> > parameter
> > PIN_CONFIG_DRIVE_STRENGTH_UA.
> >
> > Add support for PIN_CONFIG_DRIVE_STRENGTH_UA while keeping the old
> > custom parameter around for backward compatibility.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >
> > The indentation in the switch/case blocks is getting somewhat out of
> > control. I also have some cleanup changes to reverse the logic of the
> > if/break statements. Not sure if it should be done before or after
> > this
> > patch though.
> >
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-paris.c | 84
> > ++++++++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c
> > b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > index 678c8aa33012..5a94903ae372 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > @@ -48,6 +48,53 @@ static const char * const mtk_gpio_functions[] = {
> >       "func12", "func13", "func14", "func15",
> >  };
> >
> > +/*
> > + * This section supports converting to/from custom
> > MTK_PIN_CONFIG_DRV_ADV
> > + * and standard PIN_CONFIG_DRIVE_STRENGTH_UA pin configs.
> > + *
> > + * The custom value encodes three hardware bits as follows:
> > + *
> > + *   |           Bits           |
> > + *   | 2 (E1) | 1 (E0) | 0 (EN) | drive strength (uA)
> > + *   ------------------------------------------------
> > + *   |    x   |    x   |    0   | disabled, use standard drive
> > strength
> > + *   -------------------------------------
> > + *   |    0   |    0   |    1   |  125 uA
> > + *   |    0   |    1   |    1   |  250 uA
> > + *   |    1   |    0   |    1   |  500 uA
> > + *   |    1   |    1   |    1   | 1000 uA
> > + */
> > +static const int mtk_drv_adv_uA[] = { 125, 250, 500, 1000 };
> > +
> > +static int mtk_drv_adv_to_uA(int val)
> > +{
> > +     /* This should never happen. */
> > +     if (WARN_ON_ONCE(val < 0 || val > 7))
> > +             return -EINVAL;
> > +
> > +     /* Bit 0 simply enables this hardware part */
> > +     if (!(val & BIT(0)))
> > +             return -EINVAL;
> > +
> > +     return mtk_drv_adv_uA[(val >> 1)];
> > +}
> > +
> > +static int mtk_drv_uA_to_adv(int val)
> > +{
> > +     switch (val) {
> > +     case 125:
> > +             return 0x1;
> > +     case 250:
> > +             return 0x3;
> > +     case 500:
> > +             return 0x5;
> > +     case 1000:
> > +             return 0x7;
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> >  static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev
> > *pctldev,
> >                                         struct pinctrl_gpio_range
> > *range,
> >                                         unsigned int pin)
> > @@ -151,11 +198,38 @@ static int mtk_pinconf_get(struct pinctrl_dev
> > *pctldev,
> >
> >               break;
> >       case PIN_CONFIG_DRIVE_STRENGTH:
> > +             if (hw->soc->adv_drive_get) {
> > +                     err = hw->soc->adv_drive_get(hw, desc, &ret);
> > +                     if (!err) {
> > +                             err = mtk_drv_adv_to_uA(ret);
> > +                             if (err > 0) {
> > +                                     /* PIN_CONFIG_DRIVE_STRENGTH_UA
> > used */
> > +                                     err = -EINVAL;
> > +                                     break;
> > +                             }
> > +                     }
> > +             }
> > +
> Hi Chen-Yu,
>
> PIN_CONFIG_DRIVE_STRENGTH is seems used for 2/4/6/8ma, it is not used
> for 125/250/500/1000ma. why you change here?

If 125/250/500/1000uA is used, that mode takes precedence over 2/4/6/8 mA.
To give a correct readback, if 125/250/500/1000 uA is active, we should
return -EINVAL here to tell the pin config core that PIN_CONFIG_DRIVE_STRENGTH
is not active.

Otherwise when one reads

    /sys/kernel/debug/pinctrl/10005000.pinctrl-pinctrl_paris/pinconf-pins

it would return

    ... output drive strength (X mA), output drive strength (Y uA), ...

where the first "mA" setting isn't actually active in hardware.

> >               if (hw->soc->drive_get)
> >                       err = hw->soc->drive_get(hw, desc, &ret);
> >               else
> >                       err = -ENOTSUPP;
> >               break;
> > +     case PIN_CONFIG_DRIVE_STRENGTH_UA:
> > +             if (hw->soc->adv_drive_get) {
> > +                     err = hw->soc->adv_drive_get(hw, desc, &ret);
> > +                     if (err)
> > +                             break;
> > +                     err = mtk_drv_adv_to_uA(ret);
> > +                     if (err < 0)
> > +                             break;
> > +
> > +                     ret = err;
> > +                     err = 0;
> > +             } else {
> > +                     err = -ENOTSUPP;
> > +             }
> > +             break;
>
> Hi Chen-Yu,
> For PIN_CONFIG_DRIVE_STRENGTH_UA case, How can we use in dts node ?
> Thanks.

My original thought was to have either

    drive-strength = <2/4/6/8>;

or

    drive-strength-microamp = <125/250/500/1000>;

but not both. However I haven't figured out how to write the binding schema
to have the two properties be mutually exclusive. I'm not sure this would
be accepted either.

At the driver level, it should also have a check for the existence of
"drive-strength-microamp" to enable or disable the special mode.

Regards
ChenYu

> >       case MTK_PIN_CONFIG_TDSEL:
> >       case MTK_PIN_CONFIG_RDSEL:
> >               reg = (param == MTK_PIN_CONFIG_TDSEL) ?
> > @@ -271,6 +345,16 @@ static int mtk_pinconf_set(struct pinctrl_dev
> > *pctldev, unsigned int pin,
> >               else
> >                       err = -ENOTSUPP;
> >               break;
> > +     case PIN_CONFIG_DRIVE_STRENGTH_UA:
> > +             if (hw->soc->adv_drive_set) {
> > +                     err = mtk_drv_uA_to_adv(arg);
> > +                     if (err < 0)
> > +                             break;
> > +                     err = hw->soc->adv_drive_set(hw, desc, err);
> > +             } else {
> > +                     err = -ENOTSUPP;
> > +             }
> > +             break;
> >       case MTK_PIN_CONFIG_TDSEL:
> >       case MTK_PIN_CONFIG_RDSEL:
> >               reg = (param == MTK_PIN_CONFIG_TDSEL) ?
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
