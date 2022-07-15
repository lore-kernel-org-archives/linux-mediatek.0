Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50DEC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 13:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIDFbj9Nm/Hc84YphLe1TSejCss5csMsL3XGmdeREuc=; b=QSqnfQKJWmQUOAbsXN/Lw8Uli3
	KzCd5b+5phG/Ep1eksS+rgZkQj7hB6PEqn+2jKRYJItkpPOxamRlrwPqhZUBsMRw0rBOSqZ7bT8Hh
	Q5gUQAgjy8VNEoEfxxzA/XjdVyOiCeguL7TtTwEqz1BSjP9m0Z4hY/zSbe8fDIuaUZgf8XTD1GuNc
	i74XULL20gyvxm+GwBvflG8767v70HkbApN9TVvlhgs+D1SSViJ8BX5kkirgC3a6c6Q6z6VcZDZ4W
	a0rjjEYKLtOibUjp3GmM5b7dBiVqIoPKEodJy57+WrtGPchMznIfXq+1mUdu+wcttBXdJFk+kT0X9
	V1Duak+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCLDn-007Czg-AZ; Fri, 15 Jul 2022 13:19:07 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCLDb-007CxF-ON; Fri, 15 Jul 2022 13:18:57 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id e69so8413153ybh.2;
        Fri, 15 Jul 2022 06:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RIDFbj9Nm/Hc84YphLe1TSejCss5csMsL3XGmdeREuc=;
        b=LjTUeU/VvjExiFE7qVdoTT66INknzaksBvLAL0QX/hhMGm1S/DCmWjGAqEm1RDjTt0
         nrI4wHZo/WK5aG8U5fIPVbESm+g18hEELTujXpx69+Azj8qnUnYXhFafWvDdYrxJWF8Q
         n4alCS65LacwduwaUDBvHdbTO5eZ4k4tWaJ199RDLEdi+Nnbu8tJ4UTjcA2YPJBeHBKH
         hWc3HEBwkV0/ygom4+Ivyr3ViE5siRsP8CdzKAgWRXLBXaArht7DgMtJUJb/WrGYsYt8
         eWv+sETgNCGjxIJCtjEQJk1vVPGobtuRYELM3bihPsOKaqDcf5qzy1Ry+AVMll6TrQxi
         eYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RIDFbj9Nm/Hc84YphLe1TSejCss5csMsL3XGmdeREuc=;
        b=zUBdj2+J8EXNFBWYCzfpCJ/Y5FcTlO8ca3GXKnAIctYCe2ywFqTqO3blp96gdETXQ4
         d6XgnjbguGWZiX+QK7aYKL5JB7L8TXzAQZ52J7JQJl7g51YpLbFJ1/Ffz+W5H1IkYqfG
         mXDWVIKvbb2TUk/AWXhDhZmChqcV3vuXrU/cA0qDGGFBszlOu6PJ5xkWTnlTxVeFb0gD
         fYJZia8ldi5pHRxkiTYwU9m9jTy2l4uuQ886yiP5RQ0ZDEVfaHgdJD9DR5IAiG14MrvO
         satWM801fFL/y+rV7TG34BnF32DLPurTO5Di1UIYgCJgXqE+bhtOLse0y3qLyLuGa+10
         uAeA==
X-Gm-Message-State: AJIora+oTdLAfXIj0RAmZ6OT3DfdW0upOItUWdDsZEoqeONZoLAArSde
	WA0jmjZoKn38CCLmmf1nbi2muoSxox8VXE3gBd17mNGG8mg=
X-Google-Smtp-Source: AGRyM1tX0Yj4hhKwKn8Wh56LVxsUs+zEZtzzOqfyiqtoMPojzsjlQH4dKqby9pg3kc6AYzvHnWHIojiIQybijv0fZ+I=
X-Received: by 2002:a25:cbcf:0:b0:66e:8893:a02c with SMTP id
 b198-20020a25cbcf000000b0066e8893a02cmr14089485ybg.460.1657891133149; Fri, 15
 Jul 2022 06:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220715112607.591-1-peterwu.pub@gmail.com> <20220715112607.591-10-peterwu.pub@gmail.com>
In-Reply-To: <20220715112607.591-10-peterwu.pub@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 15 Jul 2022 15:18:16 +0200
Message-ID: <CAHp75VfiBcaSbZy67Puwb2pBW2MHN8iQj3upA=h3VkKSFJbs0g@mail.gmail.com>
Subject: Re: [PATCH v5 09/13] iio: adc: mt6370: Add MediaTek MT6370 support
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
X-CRM114-CacheID: sfid-20220715_061855_829653_96F97CE2 
X-CRM114-Status: GOOD (  16.67  )
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

On Fri, Jul 15, 2022 at 1:28 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
>
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
>
> This adds support the MT6370 ADC driver for system monitoring, including

This adds --> Add a

> charger current, voltage, and temperature.

...

> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/iio/iio.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/sysfs.h>

...

> +#define MT6370_AICR_400MA              0x6
> +#define MT6370_ICHG_500MA              0x4
> +#define MT6370_ICHG_900MA              0x8

_mA ?

...

> +       ret = regmap_read_poll_timeout(priv->regmap,
> +                                      MT6370_REG_CHG_ADC, reg_val,
> +                                      !(reg_val & MT6370_ADC_START_MASK),
> +                                      ADC_CONV_POLLING_TIME_US,
> +                                      ADC_CONV_TIME_MS * 1000 * 3);

1000 --> MILLI ?

...

> +static int mt6370_adc_probe(struct platform_device *pdev)
> +{

Given comment in one place in the entire series would be good to use
in another where appropriate. For example, here it would also be nice
to have a temporary variable

  struct device *dev = &pdev->dev;

It will shorten some lines.

> +       struct mt6370_adc_data *priv;
> +       struct iio_dev *indio_dev;
> +       struct regmap *regmap;
> +       int ret;

> +}

-- 
With Best Regards,
Andy Shevchenko

