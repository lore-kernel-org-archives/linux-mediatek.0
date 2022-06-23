Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1133FC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 18:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WFXpnCRvpVBhsuNFE1ahfBGJsqNDQt8dQxVvfN6MrL0=; b=whC75BUgdNhi2JXQWyp35UAv/W
	zNYwprY0ZsOE++Eamm9JKgouUQFsHuG2+ceteyTHtgef3b+umcRLmcNDrmFoF84XL/Y91/ex2aELt
	2BU0+0GB/BS/Mmwwil7S/TS62ZqSsp4Gfe7LNil9wlNKe1ZC21y3EWCGYi4LXebGKtqnYX5GBr+Ll
	d/XAzz4VfslrG8zsqzetjHDsRR9qDYR7d5XxiyLRUJPpSrkA3exUopKNik1vVCpEYIrw8wBSqroqs
	ECceXZd8d8LG2t5iH8w15JNG1KF093WnnOHfESFhRtkmjmZfnxr/F08zN1TuPxfRogxMYQpgGkX1a
	7cO7R7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4RXN-00GKhT-V1; Thu, 23 Jun 2022 18:26:41 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4RX9-00GKcr-LM; Thu, 23 Jun 2022 18:26:29 +0000
Received: by mail-lf1-x12e.google.com with SMTP id i18so395820lfu.8;
        Thu, 23 Jun 2022 11:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WFXpnCRvpVBhsuNFE1ahfBGJsqNDQt8dQxVvfN6MrL0=;
        b=DalKGI6li9osCh4k7iO37g3v5OUCWoMlA9lcg8wxp3/qi5HIMenhTTdp7lkfmkxaFO
         5i56DaW7feuRINiq2kOC05AY8brpkmge87NEOdDGkcHQCABHBrM/lR06xLa/uYNXD2JN
         HByhcVabc+qx2jAze76QRQrmHqJQ43fznNb6YOxVQdupQu3sbTr5FFXwdhK74fJl0jvb
         eciLddbEjTkpfnvpSmNtkeUy899xl8kuFlza0mCjMLlY6mqMYFafWfL0HXdzY9mmrBbl
         tiYMDiQrKJpSB3DVDSB21zZOwwu+OGmacE6r0lbpRpEmfZUo1aV2LD7kFZYuIORe47QB
         7iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WFXpnCRvpVBhsuNFE1ahfBGJsqNDQt8dQxVvfN6MrL0=;
        b=pINeOg0qTaKNZ0wcyuh/fDt2lLZS44dqEH2IbibGquy4Vf+gfeteZYZ4+cigCdJI+0
         2LWq3Cm8rmnsOKR7XWxBzFBfyFX+PR1IAEYVB0ojqpgCrWmm1rfQYZsD3rAFx/biSk3K
         rV9Rsnv/f8ZZ0rQR/Z9kKYRJzCTdMcBBgv9OQl7dwthq3tzUwjRlrA62hHSxnBE4Q3IY
         63zrfDwbjcCNAKrKKYU4SNHP7rrm1YvJ3zeMMNG94wOrQB+49wpdDoykel8rxMJh6/oj
         BHbAW180W60EIX0vhsI/pgewbZ9oQMuJpqlJD3Z6ntgjOAyPpyS7CM/+ZqhQXfYw9UzD
         FNKQ==
X-Gm-Message-State: AJIora/f68CjEQIqJIAFCIEH7cVFR0pOSKC/RI+naeNRpMihT3xdXgaH
	aLd0Buub1HtFQJw4GZRcWU3Ym7LZEW+8zlScplU=
X-Google-Smtp-Source: AGRyM1v7QBH+pV6lYrEVLjv5TY6/p8FX2jSroN/uPAnqjFf8QnXVnznfAY6JW5aADd3D+pMmLcYkM8NpE0OLf3DC0nc=
X-Received: by 2002:a05:6512:348f:b0:47f:8b25:e9f9 with SMTP id
 v15-20020a056512348f00b0047f8b25e9f9mr6543451lfr.512.1656008785046; Thu, 23
 Jun 2022 11:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-11-peterwu.pub@gmail.com>
In-Reply-To: <20220623115631.22209-11-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 23 Jun 2022 20:25:48 +0200
Message-ID: <CAHp75VexwvAVeY4MtwKfpNY96eJ1C9eqadd-L+20O2sg2+gYNg@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] iio: adc: mt6370: Add Mediatek MT6370 support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, chiaen_wu@richtek.com, 
	alice_chen@richtek.com, cy_huang <cy_huang@richtek.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_112627_794794_EE0DD192 
X-CRM114-Status: GOOD (  19.64  )
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

On Thu, Jun 23, 2022 at 2:00 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> Add Mediatek MT6370 ADC support.

...

> +config MEDIATEK_MT6370_ADC
> +       tristate "Mediatek MT6370 ADC driver"
> +       depends on MFD_MT6370
> +       help
> +         Say yes here to enable Mediatek MT6370 ADC support.
> +
> +         This ADC driver provides 9 channels for system monitoring (charger
> +         current, voltage, and temperature).

What will be the module name?

...

> +#include <dt-bindings/iio/adc/mediatek,mt6370_adc.h>

Usually this goes after linux/* asm/* as it's not so generic.

> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/iio/iio.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>

> +#include <linux/mod_devicetable.h>

I believe the order should be otherwise, this is first followed by module.h.

> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

...

> +#define ADC_CONV_POLLING_TIME          1000

If it's time, add a unit suffix, if it's a counter, make it clear.

...

> +       msleep(ADC_CONV_TIME_US / 1000);

Why define microseconds if milliseconds are in use?

...

> +       ret = regmap_read_poll_timeout(priv->regmap,
> +                                      MT6370_REG_CHG_ADC, reg_val,
> +                                      !(reg_val & MT6370_ADC_START_MASK),
> +                                      ADC_CONV_POLLING_TIME,
> +                                      ADC_CONV_TIME_US * 3);
> +       if (ret) {
> +               if (ret == -ETIMEDOUT)
> +                       dev_err(priv->dev, "Failed to wait ADC conversion\n");

wait for

> +               else
> +                       dev_err(priv->dev,
> +                               "Failed to read ADC register (%d)\n", ret);

Do you really need to differentiate the errors here? I believe the
latter one covers all cases.

> +               goto adc_unlock;
> +       }

...

> +#define MT6370_ADC_CHAN(_idx, _type, _addr, _extra_info) {     \
> +       .type = _type,                                          \
> +       .channel = MT6370_CHAN_##_idx,                          \
> +       .address = _addr,                                       \
> +       .scan_index = MT6370_CHAN_##_idx,                       \
> +       .indexed = 1,                                           \
> +       .info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |          \
> +                             BIT(IIO_CHAN_INFO_SCALE) |        \
> +                             _extra_info                       \

Leave a comma after the last member as well.

> +}

...

> +       regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +       if (!regmap) {

> +               dev_err(&pdev->dev, "Failed to get regmap\n");
> +               return -ENODEV;

return dev_err_probe(...);

> +       }

...

> +       ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, 0);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to reset ADC\n");
> +               return ret;
> +       }

Ditto.

-- 
With Best Regards,
Andy Shevchenko

