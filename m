Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE30C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 10:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzFaXFSPRLqzcFg4tSpon5AeyfByv03+OsJCF9/XND8=; b=dKAdWyI8kvVROc
	besFdVujQE/AuEQzAjyhzA3r67xF63d71BtJS5gvsM8G3oAeSAy+frHV8uwPgabNeOSDRnG6k2rsi
	b1TJUiAYRMuN0W+G+08xpjim95EhxjjOdfUR7/YETFar0bC1onG80Zc/Y5ckpaQieSueIXAkH+2On
	0cJbyoFRPzrhingpLSbrKIFB3LOiTNMh4xQ06rvdgQU4B7ItkHUWS+kl6nkiMJaKCcIL0KkY5HtTF
	PAmleRgWYtMmtaOEIcP/JgKPJACL9yGD8y6qseboobB9lAOH8xC/IrjhF0UMlrgHm7D+M/qGbtNt5
	n4EPDa4VO2ooMzB6OpNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLP7-00FDcc-Gy; Wed, 01 Jun 2022 10:16:41 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwL6u-00F5N5-Ko; Wed, 01 Jun 2022 09:57:54 +0000
Received: by mail-ed1-x52b.google.com with SMTP id x62so1419993ede.10;
        Wed, 01 Jun 2022 02:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8PCo0X+pMIpsY2Uf1dnrZhLPPiwDltwA+NDnzoDspis=;
        b=XhPAQhUfhBI91dCm0a95O3zad9USLtdiUcVt34raOi5ptwRCbqGza/NaTDd4EyaLX1
         v+lU4+0Cpv23sZE0fOO2N2HTBcIFXG/TrXkhJtsD7CDwNqGJypEeR7+wpAAfxQ1X488D
         dE+CRh6Hkq089m6paqTZCvDHckNRC4IMxltEdMIcZKV16VY0YAbxtda5vGAtZ+29jWIB
         wsP4WOukuw86fxqUt+VuAO/be5ZLtm8pPCExUs4n6YACXBrBBZ59DeQ84G1qh+H99nN5
         aOtK25kj0UzNDeF/Trja2mohLceUsbRjs3gvT+99D2KTbrfsm8sfvH805b8ESjdWyxOW
         REyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8PCo0X+pMIpsY2Uf1dnrZhLPPiwDltwA+NDnzoDspis=;
        b=5NaZkXMhxI/gPp54shSxQhP0i68IuXtr2VlnyLxC2V5y5lEhrVWjo5j/67H2IerVs9
         nNT76Glme8cew6BweeJJAyLqmZUgw+XU+4DH9iCBMALFacX2tpTK033hHXT8h4i9HsMQ
         OhQF+aL/x+KgYQPxRNf5eQAMrUhgvzQ9O7UMI1Vc93kucnPjlHm8a/M79qge3IpxFMw5
         O91Xr71rrGn8jJRraBaF2zREGZ7Js2S77aA/3Wyu/MmJw413bRGyKmmqUsLVssDjdd3M
         dpKKF+n6MPIGPMOTATtYr6vhPA1MYmeDBYuoeOvt53Kqh52ghGZrU3S6DzjG5FVydWif
         D7Vw==
X-Gm-Message-State: AOAM533e0dM++saGGYJez4M4n1Wd0jXUofz56jRxYXM1rDsmHsL19btJ
	JJhfHlW7QS1wLYPdrYhaKR+4kr48V6dbIpjsPmM=
X-Google-Smtp-Source: ABdhPJx5UwB9OK6uoDWwzcHechvusyUFa0L+DRuEojeZ5rXjdN4Kqx2DmQl8OM9CHARC3CjwaOQOEOHl8iMseiJla1c=
X-Received: by 2002:a05:6402:249e:b0:42d:bb88:865b with SMTP id
 q30-20020a056402249e00b0042dbb88865bmr21507509eda.141.1654077471168; Wed, 01
 Jun 2022 02:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220531102809.11976-1-peterwu.pub@gmail.com> <20220531102809.11976-8-peterwu.pub@gmail.com>
In-Reply-To: <20220531102809.11976-8-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Jun 2022 11:57:15 +0200
Message-ID: <CAHp75VdUQqihr=AX-wEUD05jY1ReL63hMCL+eaqmjkN8CsS_Vg@mail.gmail.com>
Subject: Re: [PATCH 07/14] leds: flashlight: mt6370: Add Mediatek MT6370
 flashlight support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, cy_huang@richtek.com, 
	alice_chen@richtek.com, chiaen_wu@richtek.com, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_025752_735540_58C89DAA 
X-CRM114-Status: GOOD (  15.55  )
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

On Tue, May 31, 2022 at 1:32 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: Alice Chen <alice_chen@richtek.com>
>
> Add Mediatek MT6370 flashlight support

Same comments about the commit message.

...

> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>

+ blank line?

> +#include <media/v4l2-flash-led-class.h>

+ blank line

> +enum {
> +       MT6370_LED_FLASH1,
> +       MT6370_LED_FLASH2,
> +       MT6370_MAX_LEDS
> +};

...

> +       struct mt6370_led *led = container_of(fl_cdev, struct mt6370_led,
> +                                             flash);

> +       struct mt6370_led *led = container_of(fl_cdev, struct mt6370_led,
> +                                             flash);

Make a helper out of this

  #define to_mt637_led()  container_of()

and reuse.

...

> +       /*
> +        * For the flash turn on/off, HW rampping up/down time is 5ms/500us,

ramping

> +        * respectively

Period!

> +        */

...

> +       const char * const states[] = { "off", "keep", "on" };
> +       const char *str;
> +       int ret;
> +
> +       if (!fwnode_property_read_string(init_data->fwnode,
> +                                        "default-state", &str)) {
> +               ret = match_string(states, ARRAY_SIZE(states), str);
> +               if (ret < 0)
> +                       ret = STATE_OFF;
> +
> +               led->default_state = ret;
> +       }

fwnode_property_match_string()?

...

> +       if (!count || count > MT6370_MAX_LEDS) {
> +               dev_err(&pdev->dev,
> +               "No child node or node count over max led number %lu\n", count);
> +               return -EINVAL;

return dev_err_probe(...);

> +       }


--
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
