Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4AFC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 09:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKEZcZKyJPxnUIHg9vM+IkXxZdZ8ejobr3a6ltkwgqg=; b=iI2pByUq/LE5pzqwJQ1pn9VapD
	dAHPlv7wjm54S1mC1+9f3yuqQK5BnTYRel6W3rzl3W7VSLvVY2JvJZ/tI+WsSgFowYUS6rNB7DlIi
	8f/7Fs/s7Wb9fWD9VNhyKUE9ErDD2dixA9pKGGryr88BgxDnOQ613e7/mDJ4sedzLAA0aXEV9FW1s
	RoiCfhnMhSktmsUL53eXFSujFtCbG6LnXjUk9ZHHTFXYAlkKiYMEVn2CPKfEsQnpfJOmP7wavyKUZ
	r1TwpMUr8BMj167uRM5CJgFWUwMcLwqAaws49T/VeREy32xnZIFn8poG9y1+LLMYVTN+gPoYCeMAG
	w2uzd7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFu4r-007L36-Rd; Mon, 25 Jul 2022 09:08:37 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFu4W-007KmE-IR; Mon, 25 Jul 2022 09:08:18 +0000
Received: by mail-ed1-x532.google.com with SMTP id w5so600326edd.13;
        Mon, 25 Jul 2022 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SKEZcZKyJPxnUIHg9vM+IkXxZdZ8ejobr3a6ltkwgqg=;
        b=SF+aqs+EVnbsbKQkA/8xNH4ehlnunss9fmN5U1pnRWAD2EMIQ+vnoZbzG36K5peZlX
         CXhER1ViMJa80xFPZtY843nWQs5F1BNT454kUiXwBosjz4IYFjnLaJailn/bPKEmOYYj
         OQZu//AWglB0ze0HUO1SQYsIXOFhVkCy9Y+HPByleJg8LXsl2myXUq38a43P555UG4Bx
         W4w40So2uuPYw5I5cWqSTLAX8vR149Ik4ff+qJQus9SdkPcCLkZ3D5xoOpeLQVKUQZ8Y
         zppNE2E5jRpSRhv5vq/EJEOVqtSyTp9xfxGx+C2GzeLpQ8Hqwv5+/dQLpC89uzdBr14a
         kbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SKEZcZKyJPxnUIHg9vM+IkXxZdZ8ejobr3a6ltkwgqg=;
        b=mcBBHikX8NgLAkMUz+Sz+7MQj0Aa9Eu53fLsc9lp5IL+vJuEQPLgD2u7UuaH7fZBbs
         sbLEAC16vVM0aMuT6wl+BYMkoEwipd3CFj3E/NsKNdWnBJMjin1H8hX5gaSTPFlOr6SA
         MwgG9baAESHazpoQ8fAPYhtoxig2b2omDKj2CZeOJ2NDfLe5lYJ0BH9+yUvgkLdIITRH
         +eGokBrMp33h05xy1rXOAbRIpCp5k7rm6fWSWpjYP3tcQDWaTaylVzUb5ORCxAmm17ZC
         wtnniCDgMiIhRnsGynmeDbheGoXZbN3F5jAjyE0yo/58x36mgoeIC/oFWEdqLa0tjtLF
         AFfA==
X-Gm-Message-State: AJIora/gc++UcFidEhLNTXTX3UQrNUau8B02EKYnc13wkZTcJkIKhY19
	1WSo8UQXAQVf46aptKhqAlh4f3jFr4dGdoFy2bw=
X-Google-Smtp-Source: AGRyM1v5JqoLA7zG3OW50lchaZUo0NzhFJOo3SiC7x0i5Bb09pqP2OvkrfyBcnIJEGb6N4UIi+1F3CYnjToz5WfvfBA=
X-Received: by 2002:a05:6402:50c9:b0:43c:163a:4d5f with SMTP id
 h9-20020a05640250c900b0043c163a4d5fmr1821081edb.386.1658740092120; Mon, 25
 Jul 2022 02:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-14-peterwu.pub@gmail.com>
In-Reply-To: <20220722102407.2205-14-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Jul 2022 11:07:35 +0200
Message-ID: <CAHp75VfxeRR7BzOWwfNSo+x3JZcH37ogR+ZbapTAWrCYkr+FUg@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] video: backlight: mt6370: Add MediaTek MT6370 support
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
X-CRM114-CacheID: sfid-20220725_020816_690742_F2A31EA7 
X-CRM114-Status: GOOD (  16.81  )
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
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> This adds support for MediaTek MT6370 Backlight driver. It's commonly used

Read Submitting Patches, please!

(In this case, find "This patch" in the above mentioned document, read
and act accordingly)

> to drive the display WLED. There are 4 channels inside, and each channel
> supports up to 30mA of current capability with 2048 current steps in
> exponential or linear mapping curves.

...

> +               brightness_val[1] = (brightness - 1) >> fls(MT6370_BL_DIM2_MASK);


(see below)

...

> +               /*
> +                * To make MT6372 using 14 bits to control the brightness
> +                * backward compatible with 11 bits brightness control
> +                * (like MT6370 and MT6371 do), we left shift the value
> +                * and pad with 1 to remaining bits. Hence, the MT6372's

to the remaining

> +                * backlight brightness will be almost the same as MT6370's
> +                * and MT6371's.
> +                */
> +               if (priv->vid_type == MT6370_VID_6372) {
> +                       brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
> +                       brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;
> +               }

Nice! Why not...

...

> +       gpiod_set_value(priv->enable_gpio, brightness ? 1 : 0);

!!brightness will do as well.

...

> +       brightness = brightness_val[1] << fls(MT6370_BL_DIM2_MASK);

> +               val |= prop_val << (ffs(MT6370_BL_PWM_HYS_SEL_MASK) - 1);

> +               val |= ovp_uV << (ffs(MT6370_BL_OVP_SEL_MASK) - 1);

> +               val |= ocp_uA << (ffs(MT6370_BL_OC_SEL_MASK) - 1);

> +       val = prop_val << (ffs(MT6370_BL_CH_MASK) - 1);

...to use respective _SHIFTs in all these?

...

> +       priv->enable_gpio = devm_gpiod_get_optional(dev, "enable",
> +                                                   GPIOD_OUT_HIGH);
> +       if (IS_ERR(priv->enable_gpio))
> +               dev_err(dev, "Failed to get 'enable' gpio\n");

What does this mean? Shouldn't be

  return dev_err_probe()?

-- 
With Best Regards,
Andy Shevchenko

