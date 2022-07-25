Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3991FC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 08:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sRH3Ko4u3nUzP+XsjQZDkgCAeoY72VHZaoe9ljYtNKk=; b=T7Gw2j+VbVLurJ2kBeANVRhdAD
	zWl02X9OhUTTWRAs55cGoyHABl4Rb2J2+PPDxb7poAw50eJB7TKvte51gmtLvTYrZD7OhoIUANKwb
	pxUV9E6zKV2GI8bQbMt4qdpiIZntkmNZX01Y2i04TvfydgZpYypQWBCF0+bLaVqOe5OSXOdcPJPKZ
	aZvphYTbRmGMobEqDl17KIZWh9GIIcFnQD8fS7HVutRQfyRRCidOe3TThdU7f1fqrhha32mLFSgmS
	kjPXD522BHvru6T3BKlRMyuXbdDQ9Wh7e4LtneutDGtDN1Ui8wtg0iY3S90VUVcynHJhc6b+gVE4I
	Src4JpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtok-007AaB-N3; Mon, 25 Jul 2022 08:51:58 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFtoY-007AR6-Cm; Mon, 25 Jul 2022 08:51:47 +0000
Received: by mail-ej1-x62d.google.com with SMTP id va17so19361632ejb.0;
        Mon, 25 Jul 2022 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sRH3Ko4u3nUzP+XsjQZDkgCAeoY72VHZaoe9ljYtNKk=;
        b=b1ttEgokmKJ5jDFSHg4C3qui+lCgzhMb1cFI+vnFX9/Qaqz5wXWkN7XbXTCmQ3rbX8
         /3TN1NF7tN2a41ftKlXShOS7XLz6vjt/dE/JoVvRFVa7TBsRv37MEJRyEWP7V4gtObN8
         DWOlJaAA+IaENb1E9U2bsj5iMsc5NaHbap/4bNNdkO+vyaoG6bExWIwrQG9s7uFg7Baj
         s+FY3gPXBy8r3qaYg0AV960MNBWHc4g/ppm+fVbr7FGTau4bS6hbfDOGbOOSslhkiqHB
         4edKEq3lX1FHBOVPE941JMEmpBIHu6i/Z5b0c8XziqmaTyViSW8bxZxzR+/rVIJcM7jV
         un+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sRH3Ko4u3nUzP+XsjQZDkgCAeoY72VHZaoe9ljYtNKk=;
        b=NtvYL0f/byzaUinMGyJmHjZHCHAV1k6J168CvcPraUy8ju+SqsLp1BW9tuJrJ1ygAv
         Lz1d3+1UydLLPm4hAfBsuF3aDd0T3va5J04gjcvV4gxWWuqpmh+BToaaScELUiCKwx9m
         wkuHQXnvc8NFP1Pl5QHWrOdjxpNEa/Pj6A8z7hMkZ/o9f6L08RMQXq7DgrW1kp3nYDco
         XiRkMx9Zd9rGtb/klyUQoxLS1HCcmowkloAQzMQWuVqpkr8LVQ61nkQYe8+Il4sC7Orb
         b1DFK3n54cAe8Y40TrjjDKBWH7HJdxBAJ30swPuoPRteWxRc9yLtnebuX8JAYNBxSiC2
         J8Kw==
X-Gm-Message-State: AJIora8HCmfQ6fBYr/G4U/h43yQslRbpQSFhii8OS90g5No4kybD8uhv
	G1YeFL4qGpnlAwDuSmXJXnJsl1gKX6IJaM9Qx/U=
X-Google-Smtp-Source: AGRyM1t++SIdSmibdfYzJgTAAGzjzRMgfSGJttBagInbaOHb+Jia4m43oDM7a3cRNSWK7OUMOrpRHLsW33nuUHySItE=
X-Received: by 2002:a17:907:1c8d:b0:6f2:eb2:1cd6 with SMTP id
 nb13-20020a1709071c8d00b006f20eb21cd6mr9106852ejc.568.1658739102757; Mon, 25
 Jul 2022 01:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-13-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-13-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 10:51:06 +0200
Message-ID: <CAHp75Vf85_uzA9fRxTizbPJxODcXFpM4wuU6DxP2j9UA47B_2g@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	cy_huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_015146_466409_C20E0999 
X-CRM114-Status: GOOD (  23.19  )
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

On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: Alice Chen <alice_chen@richtek.com>
>
> The MediaTek MT6370 is a highly-integrated smart power management IC,
> which includes a single cell Li-Ion/Li-Polymer switching battery
> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> The Flash LED in MT6370 has 2 channels and support torch/strobe mode.
> Add the support of MT6370 FLASH LED.
>
> Signed-off-by: Alice Chen <alice_chen@richtek.com>

This SoB chain is wrong. Prioritize and read Submitting Patches!

...

> +static int mt6370_torch_brightness_set(struct led_classdev *lcdev,
> +                                      enum led_brightness level)
> +{
> +       struct mt6370_led *led = to_mt6370_led(lcdev, flash.led_cdev);
> +       struct mt6370_priv *priv = led->priv;
> +       u32 led_enable_mask = (led->led_no == MT6370_LED_JOINT) ?
> +                             MT6370_FLCSEN_MASK_ALL :
> +                             MT6370_FLCSEN_MASK(led->led_no);
> +       u32 enable_mask = MT6370_TORCHEN_MASK | led_enable_mask;
> +       u32 val = level ? led_enable_mask : 0;

> +       u32 prev = priv->fled_torch_used, curr;

Here and in the other functions with similar variables it seems you
never use prev after assigning curr.
Just define a single variable and use it accordingly.

> +       int ret, i;
> +
> +       mutex_lock(&priv->lock);
> +
> +       /*
> +        * Only one set of flash control logic,
> +        * use the flag to avoid strobe is currently used.
> +        */
> +       if (priv->fled_strobe_used) {
> +               dev_warn(lcdev->dev, "Please disable strobe first [%d]\n",
> +                        priv->fled_strobe_used);
> +               ret = -EBUSY;
> +               goto unlock;
> +       }
> +
> +       if (level)
> +               curr = prev | BIT(led->led_no);
> +       else
> +               curr = prev & ~BIT(led->led_no);
> +
> +       if (curr)
> +               val |= MT6370_TORCHEN_MASK;
> +
> +       if (level) {
> +               level -= 1;
> +               if (led->led_no == MT6370_LED_JOINT) {
> +                       int flevel[MT6370_MAX_LEDS];
> +
> +                       flevel[0] = level / 2;
> +                       flevel[1] = level - flevel[0];
> +                       for (i = 0; i < MT6370_MAX_LEDS; i++) {
> +                               ret = regmap_update_bits(priv->regmap,
> +                                               MT6370_REG_FLEDITOR(i),
> +                                               MT6370_ITORCH_MASK, flevel[i]);
> +                               if (ret)
> +                                       goto unlock;
> +                       }
> +               } else {
> +                       ret = regmap_update_bits(priv->regmap,
> +                                       MT6370_REG_FLEDITOR(led->led_no),
> +                                       MT6370_ITORCH_MASK, level);
> +                       if (ret)
> +                               goto unlock;
> +               }
> +       }
> +
> +       ret = regmap_update_bits(priv->regmap, MT6370_REG_FLEDEN,
> +                                enable_mask, val);
> +       if (ret)
> +               goto unlock;
> +
> +       priv->fled_torch_used = curr;
> +
> +unlock:
> +       mutex_unlock(&priv->lock);
> +       return ret;
> +}

...

> +       struct v4l2_flash_config v4l2_config = {0};

0 is not needed.

-- 
With Best Regards,
Andy Shevchenko

