Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87393C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 21:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpdquBLgwxS+q6MF90ETAqdi+gZ5jGI/bw3VMe7+rpM=; b=Wt5MJW7VP07eT+KGX/N5vi5IgH
	fOksqYgxztNGV667jIC7me5uLcEd1p9uVSJXHysfI+U97WILMSua0qtmVNqx2+AQRidYmEB8j3Uv5
	kv8I9SF9T+6FWKOG1ALFLX99MytBG9+be0ic5xipUF/A7s932gtP29GSdGckR/0G+jVncq2zmKNOs
	hZcta5K4rOtcAaZtX3r1dmDf1bf+N0yIA4aHKVteax7ws5M7mlq3KIaILbP/Sv2Rnjmb0z6kmWMrG
	LYelm/JLsFCB0JiJnib8gF8w8xTvYPNXaOU2z0U9i/0Bjblm0ZP9aIJ5icYpAbmiVCR3dMC4h5c8L
	48W7mO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8TPC-00CRDb-3b; Mon, 04 Jul 2022 21:14:54 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8TP1-00CR40-GY; Mon, 04 Jul 2022 21:14:45 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-317a66d62dfso91664467b3.7;
        Mon, 04 Jul 2022 14:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HpdquBLgwxS+q6MF90ETAqdi+gZ5jGI/bw3VMe7+rpM=;
        b=pisWhvytYZKcu+6yG4fRYH2VSnfWPvpTWA+gGM2H9VsDnz1Nib2CFiFmg3pHrwfMLA
         jDwEDffpRMjn8/A+wioAF9Cq2+qv8EhBQqcsEuO3EMmu14Zw8HGGpmsNHlSX+BjaPIYz
         v9swYPqNcfcEpwpvhj9RHrNU7Kr3NnRhPDvVKnrmzZYXLtriCDIeXN+U0W9ia0fF5mRC
         Fs4O7JBhbxC04sxj2Jq4uzhG+waPhMmluTQCcYWdp949oDqMk74B2o8JYRErDbJgojw7
         iC21Q1WweofBJD8188y54cG3nP/c8Wr4aV16mZq9v2Xdu0smJbbPholxpaf2ZKiPz9cp
         KVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HpdquBLgwxS+q6MF90ETAqdi+gZ5jGI/bw3VMe7+rpM=;
        b=qchMK+7nGykoM3xTCqZeQ8bH0pAAcpAoSdWRkU7xVFYudATBLrgtTQKXlFzdXchEu3
         ofmhzvE9vi2LDywMRTEtZilCjZD7Z0aE6SUKmc1VxIBF06iuWhX+9YUyRXfN9fj+j3Z1
         RYlzD6Xf4bFlWKpHiOqJnEbAxjNqnPO35xXrnHD2oTZt1ItFGLGveEq2UkgW+2mb/M1t
         6mcqmZy0TQY9iBK8QE+R6bKMvlEYYSXf6+9AtpR2KuxG/LcuBW02CKJRd/uXqTRbAcIm
         J06y63RQr7EYRNWOiYmmdfK/NGAXTMgtnhRFZzPqqN9xB9RAsirned01dXtFcf+Wbpu1
         O/RQ==
X-Gm-Message-State: AJIora8+kb6zas1Atl12HXVV2n1VnQbdk/nIZ+4uoOrV0ib90YWccpNk
	AXoS9inocOvpdiOCLYHOwAQ1zj3kEL89bsvDMQs=
X-Google-Smtp-Source: AGRyM1vYxguLbsBOzRTVw1vvx756PgfmGkkRGrCT+1/7YzT9o6SbOC3eiybdUymDSM+qqhALtY73LfI5pY/jFLAqsJ8=
X-Received: by 2002:a81:468b:0:b0:318:4cac:6576 with SMTP id
 t133-20020a81468b000000b003184cac6576mr34256097ywa.277.1656969280331; Mon, 04
 Jul 2022 14:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-14-peterwu.pub@gmail.com>
In-Reply-To: <20220704053901.728-14-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 4 Jul 2022 23:14:03 +0200
Message-ID: <CAHp75VdwEc9AW1w8ejsxkw+sBTF1dumd99QyzTY9BZaXiViRWQ@mail.gmail.com>
Subject: Re: [PATCH v4 13/13] video: backlight: mt6370: Add Mediatek MT6370 support
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
X-CRM114-CacheID: sfid-20220704_141443_667589_D156DB78 
X-CRM114-Status: GOOD (  19.13  )
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

On Mon, Jul 4, 2022 at 7:43 AM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> Add Mediatek MT6370 Backlight support.

...

> +         This driver can also be built as a module. If so the module

If so,

> +         will be called "mt6370-backlight.ko".

No ".ko" part.

...

> +#include <linux/gpio/driver.h>

Can you elaborate on this?

> +#include <linux/kernel.h>
> +#include <linux/log2.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>

> +#include <linux/of.h>

Can you elaborate on this?

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

Missed mod_devicetable.h.

...

> +               brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> +               brightness_val[1] = (brightness - 1)
> +                                   >> fls(MT6370_BL_DIM2_MASK);

Bad indentation. One line?

...

> +       if (priv->enable_gpio)

Dup check.

> +               gpiod_set_value(priv->enable_gpio, brightness ? 1 : 0);

...

> +       brightness = brightness_val[1] << fls(MT6370_BL_DIM2_MASK);
> +       brightness += (brightness_val[0] & MT6370_BL_DIM2_MASK);

Too many parentheses.

...

> +               /*
> +                * prop_val =  1      -->  1 steps --> 0x00
> +                * prop_val =  2 ~  4 -->  4 steps --> 0x01
> +                * prop_val =  5 ~ 16 --> 16 steps --> 0x10
> +                * prop_val = 17 ~ 64 --> 64 steps --> 0x11
> +                */
> +               prop_val = (ilog2(roundup_pow_of_two(prop_val)) + 1) >> 1;

Isn't something closer to get_order() or fls()?

...

> +       props->max_brightness = min_t(u32, brightness,
> +                                     MT6370_BL_MAX_BRIGHTNESS);

One line?

...

> +       val = 0;

Do you need this here?

> +       prop_val = 0;

Useless.

> +       ret = device_property_read_u8(dev, "mediatek,bled-channel-use",
> +                                     &prop_val);
> +       if (ret) {
> +               dev_err(dev, "mediatek,bled-channel-use DT property missing\n");
> +               return ret;
> +       }
> +
> +       if (!prop_val || prop_val > MT6370_BL_MAX_CH) {
> +               dev_err(dev,
> +                       "No channel specified or over than upper bound (%d)\n",
> +                       prop_val);
> +               return -EINVAL;
> +       }

...

> +static int mt6370_bl_probe(struct platform_device *pdev)
> +{
> +       struct mt6370_priv *priv;
> +       struct backlight_properties props = {
> +               .type = BACKLIGHT_RAW,
> +               .scale = BACKLIGHT_SCALE_LINEAR,
> +       };
> +       int ret;

  struct device *dev = &pdev->dev;

will save you a few LoCs.

-- 
With Best Regards,
Andy Shevchenko

