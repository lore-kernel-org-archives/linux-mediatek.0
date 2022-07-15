Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11CCC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 18:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wYQx40/iCC7JCsgHdkd0E1jOgqV54xGVWGfgqFpzTxo=; b=gg7FTq7/BOFnPKQ5V4VpKPcSlf
	RmxwyGOoAzA1CtBNKoO/PiIQ9VkCUwccmBG4nXm/HmhK5VyxIisxmbJTxAYxmUW5tzqX7o3eysCBO
	QcwnlCcJBXfF1mThyzWlZ9vYfJGcbZDkE74Nfgo37GEmz7cFBdsnuHH6UQwyZC0+2JlWrmVt+4gEq
	LU3FkW6adcgUztfoU9+ZokWBPRu9KjgdcHU55wcX/o+amTjkfGqq6UKCDNNmksKU2fpmesXzHsXke
	KqNGvUeFxXjL7YPQR99LgTF6NvflG4HZ/rw1BClGnzLu2OVCin7ul1BfJaBS3/NKxPxV1H7R3QSWf
	FOIYzrrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPpo-009O1n-Tt; Fri, 15 Jul 2022 18:14:40 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPpd-009NtN-7K; Fri, 15 Jul 2022 18:14:30 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-2ef5380669cso54466267b3.9;
        Fri, 15 Jul 2022 11:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wYQx40/iCC7JCsgHdkd0E1jOgqV54xGVWGfgqFpzTxo=;
        b=CCNqrZ6xxLNILlnpWQJZURCM7WccDYI4HArJBKyxVZQ4tUE7wHsb8C+1xQrCcy/ctP
         hgNxqF3L/l+JVN/sIioIK7hlY2E24EgjBaYcjObgBZ96Go1MFnvrauI9olx68o+tAec5
         0zqXIns8v8XdElhZwR+ilBWSFm2BAz09sy+iAz5QQOYZmnuuIUuyYZ7ilSKeAOMj7Dr0
         nmKdVBdXufKKDMVxiWrXIc+cIpZBo8ghQfSQgHJj69Av/M38jJkwWwu38WYhZktwk2Sr
         Ktcv4iMX1VtKF6apNGtKuW2hT3Gz86OVl/1giJmpSuReSlovrn8AP0YP6RZk9atjVy9y
         /pvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wYQx40/iCC7JCsgHdkd0E1jOgqV54xGVWGfgqFpzTxo=;
        b=iWmtVgSwsEYADSIJlxSQUfqVpAAlsJWPpLkRNrOoTbQckOmN7NqOjPlYipBimjoZdi
         WCZRFXjgiGDzaifGtFS71b1EMAzk4kbxa5Cgv+B7lDan+DEvUcS0dH+9JDJdbEe5ucm/
         DVQRyt1YV7FrZE+PlYmYCbg5pL8PzErA+nEI14ifkEhGjp/T1legdEVxGJZ0Wt7Sh5N4
         UtPwZddzlZ9UacFs1wYNNxsLqLw0ypohhl4NcZdthD8bRmLF4zbV0NI+TasNMf9F6Cju
         8oE/ozylvMy80ZDrGYWITuL6BJ+E4QyUJliBiYs0Tn3Fp5Fi9ItycvaLOm51cAkNibyS
         YxBg==
X-Gm-Message-State: AJIora8WNhx2mJSoInjLlBLy27dH6nRP2zFGlHulgUWBo2KlLERm3ApA
	1WyOaanMPXH9A2pxoJGoiYb9gwaoHiIvvoZl17g=
X-Google-Smtp-Source: AGRyM1uDhQ/IPsk1j9mwzTNaBs0PF9Af75W/5SyN9tcIUEjc7IVgAe4YsQYGo3tn1MHf1/3mBdT0R30hiBZKjAGSBRA=
X-Received: by 2002:a81:4bd7:0:b0:31c:91da:5a20 with SMTP id
 y206-20020a814bd7000000b0031c91da5a20mr18833575ywa.131.1657908866682; Fri, 15
 Jul 2022 11:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com> <20220715112607.591-13-peterwu.pub@gmail.com>
In-Reply-To: <20220715112607.591-13-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Jul 2022 20:13:49 +0200
Message-ID: <CAHp75Vc7wNkhG2dL=0vVZq5paDQy_8+WJ25Jk4E8SG2TW6EZdw@mail.gmail.com>
Subject: Re: [PATCH v5 12/13] leds: flashlight: mt6370: Add MediaTek MT6370
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
X-CRM114-CacheID: sfid-20220715_111429_291325_7E8BD39F 
X-CRM114-Status: GOOD (  22.85  )
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

On Fri, Jul 15, 2022 at 1:29 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:

> The MediaTek MT6370 is a highly-integrated smart power management IC,
> whichincludes a single cell Li-Ion/Li-Polymer switching battery

which includes

> charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> LED current sources, a RGB LED driver, a backlight WLED driver,
> a display bias driver and a general LDO for portable devices.
>
> The Flash LED in MT6370 has 2 channel and support torch/strobe mode.

channels

> The commit add the support of MT6370 FLASH LED.

Add the

...

> +#define MT6370_FLCSEN_MASK_ALL         (BIT(0) | BIT(1))

GENMASK()

...

> +               for (i = 0; i < MT6370_MAX_LEDS; i++) {
> +                       ret = regmap_update_bits(priv->regmap,
> +                                               MT6370_REG_FLEDISTRB(i),
> +                                               MT6370_ISTROBE_MASK, flevel[i]);
> +                       if (ret)
> +                               return ret;
> +               }
> +       } else {

> +               ret = regmap_update_bits(priv->regmap,
> +                                        MT6370_REG_FLEDISTRB(led->led_no),
> +                                        MT6370_ISTROBE_MASK, val);
> +       }
> +       return ret;

    return regmap_update_bits(...);
  }

  return 0;

...

> +       /*
> +        * If the flash need to be on,

needs

> +        * config the flash current ramping up to the setting value.
> +        * Else, always recover back to the minimum one.
> +        */

...

> +       /* For the flash turn on/off, need to wait HW ramping up/down time

to turn

> +        * 5ms/500us to prevent the unexpected problem.
> +        */

Wrong multi-line comment style.

> +

No need for a blank line.

> +       if (!prev && curr)
> +               usleep_range(5000, 6000);
> +       else if (prev && !curr)
> +               udelay(500);

...

> +static int mt6370_led_register(struct device *parent, struct mt6370_led *led,
> +                               struct led_init_data *init_data)
> +{
> +       struct v4l2_flash_config v4l2_config = {0};
> +       int ret;
> +
> +       ret = devm_led_classdev_flash_register_ext(parent, &led->flash,
> +                                                  init_data);
> +       if (ret) {
> +               dev_err(parent, "Couldn't register flash %d\n", led->led_no);
> +               return ret;

return dev_err_probe() here and everywhere where it is about probe stage.

> +       }
> +
> +       mt6370_init_v4l2_flash_config(led, &v4l2_config);
> +       led->v4l2_flash = v4l2_flash_init(parent, init_data->fwnode,
> +                                         &led->flash, &v4l2_flash_ops,
> +                                         &v4l2_config);
> +       if (IS_ERR(led->v4l2_flash)) {
> +               dev_err(parent, "Failed to register %d v4l2 sd\n", led->led_no);
> +               return PTR_ERR(led->v4l2_flash);
> +       }
> +
> +       return 0;
> +}

...

> +       num = fwnode_property_count_u32(init_data->fwnode, "led-sources");
> +       if (num < 1 || num > MT6370_MAX_LEDS) {
> +               dev_err(priv->dev,
> +                       "Not specified or wrong number of led-sources\n");
> +               return -EINVAL;

Ditto.

> +       }

...

> +       ret = fwnode_property_read_u32(init_data->fwnode, "led-max-microamp",
> +                                      &val);

One line?

...

> +               val = clamp_align(val, MT6370_STRBTO_MIN_US, MT6370_STRBTO_MAX_US,
> +                                 MT6370_STRBTO_STEP_US);

I would name it mt6370_clamp() to avoid potential collision in the
global namespace in the future.

-- 
With Best Regards,
Andy Shevchenko

