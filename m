Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4169FCD4F26
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 07:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WKO48wCVFVY/Q3lQzIe4xzewKQpps/o90phN6WWe98=; b=ZEESKyz9sEsnYN72d5WGPKlf9v
	bOerILK0+rqnyEXRaiwGU5gmRjNVjQ5q4pUvR9e3Yirm/HxkUSJiqFA3ledLcoVoNI2ctgOfixEQh
	/S9Yr+MO5MoTI35qa9+YtnJpg8YPrXiBDUIYNAvf8KgwnLLSiIzMrq5yZkJcIpR1475hksE5m0AQJ
	v9wKq3f2Ng73KhsKsbF6ABnvW0RkNjxcxjHIWQEczcAXL8jolLaBz24iJdloJp9jXvVjd+OmHVZTo
	H64bMmJj083AptS31MprGaXbLQyAok3H80EpTCZJnb8V0jrKz7mgVlPwyscD4W8+HXBasiRSRbHkO
	Nb3Ozu7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhBS-0000000Frbj-1Otx;
	Tue, 12 May 2026 07:05:38 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhBP-0000000FraB-2er9
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 07:05:37 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6802f9c5debso2458996a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 May 2026 00:05:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778569534; cv=none;
        d=google.com; s=arc-20240605;
        b=l2OEuf6QDl+l+D8tubusthP1DZ4sQJdyHb5893HEmiQWWqlPZ9qXdHR4PPLK7ZmL+i
         tDzhriZt5hNPr+uknnCZd7/wlMaoM0pqzrVonQ6v/0nuqL9Nr7CI4TvnRbNob3n4yse/
         21T1RKFXJkMGFOEEFZsQpVqVe8Yl+3eipZyqwxRqOTdRYCA2tCFDDNs3aAQ0xP/x7LPR
         HPUPNB2mJtWAVvSJ+3daWWcsBGB5uOkEDKqy6ttK89Y/tXQY8yp/A6cLPEFj0aVGPQqR
         L35v9UqDqV/3dRuBgOOlQAe+SPFElhGmbpkHM8QD0PpYeaUDUvLblJ9tYRwrdGskIxbI
         M6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4WKO48wCVFVY/Q3lQzIe4xzewKQpps/o90phN6WWe98=;
        fh=dV6prEWYiqod+yTq8RL17Jtkx990MdxKubPXyvMB328=;
        b=FuRTm+5sV46vA0Sz29Xz1+qDumcRY3i2mtTbiNrCbthPjF6JWmAMGo7pVMTTvHzUNJ
         s9KhWsY5YEokslJ6sqDCmGBYTH+d6ICCVoCsiUpC/LPawALkkUJ+jJ4wp7c0JXe9VNEb
         taNDyIFginQicxfghVrhIIju0wmPf5FBKVV/lLJXP7Ou0gxRp4oHFFJf4GHc0bVmkC5o
         HNAHa0IICUIRDAkmWaSKTvAaqhm8A+Wjdor+BLfuafSE62M8thoP1l9ZdeUiBDTlvGDd
         IhxxgxNu8n9lwRPizgc89mlIDlap+Pta6VMGV7QlembFnXdahY2i1q6Lk6XYYS2zP55b
         rvag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778569534; x=1779174334; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WKO48wCVFVY/Q3lQzIe4xzewKQpps/o90phN6WWe98=;
        b=cxcWpcKfOam/qotsbBcthus5xrmwfz3joZZ33auL76zr8Ke+IO5mAXCfQ6hS3wSQIX
         eTEWdHg3vDxjqvKziFNaLUuhT/ueGEe4j6tN/A/C8aZL5AqqvLfpGsGobHcDfj6rsktE
         /oKfRUwrqCWlDUa7FK+PbBUAeqP361CYuvGQVYqwndB5iXJ6BPAHXvPAklhuuX3/bZEt
         sp4HlKrCb85BVYDDmrVJkDBPPoiPyhCmP97Ihn2mYT6w1kEreC9QMlSeYxB1oLsqyAsP
         FlEGDlv0WBM9FwnJgYIOA8VIT1bU7wyUpjYOxmp1h6yHEEgaLJOQbapkayDncACNLr80
         DLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569534; x=1779174334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WKO48wCVFVY/Q3lQzIe4xzewKQpps/o90phN6WWe98=;
        b=XIayelazVwgLXPTvSLOeIJfjyYbrdTJ91MBuiOSFiaZqgZzyhcKNtwG6f9UAluYjzR
         /+zVZpqmsTyrEHcuSvuDdphToq7tiTFRTPnWNl5Pgm24Wbl6NSwMFVDfLDHnsPcyDURl
         //buPgp/H+vOyl9rEDqV0oKsjXaJ/8ui0dMVv7sl7A6jn3cM+UYrHO5wKC9YuZYwLNvH
         12d8i0wWKjKWwilFP9GF8IuIeveBJI5dsXQ48crUErPEjx86XDdVHQ0D8yXtb4yPEErJ
         krlt7vtWOXNoWAo9+t4Y7frZTFWAyIROMkURc3swhCWe/tcg3V8sPTAIaFb8h7H1c8ef
         oJOw==
X-Forwarded-Encrypted: i=1; AFNElJ+HtciQyiFhu9puOLgfgKnNysfEKguqRC3c0vMBEwtU+nui7BQkOvZwyH/fle+ci2YUsJo1M0CPdNrLN7YGqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaE4kpENHNywFZW8aHBwKdLPTLAX8BlAhVDNHxRSoAlZmuhEL/
	3p2UxRUXntDZOT4VvR9pUs3WWhZ3W+UwRZgbN2sFsniMKpKIqIYKzzSmaPGNI4O7Qt1dNa0hfeT
	R0GT6CnLtbMMhATzhkq02o2zVl6Ms0SQ=
X-Gm-Gg: Acq92OF2O56/v18ucrYCdCUHdeeaq3zCHMxfT8ISyOqFRoTiPZ6OU1hLiWeXXtvz/vW
	/w724KJp+YHSt9OS1yUimxSy3TWHU2KlT7VEsXBeg8QBsIQ6sp9gE8ZCNwVy/YvAapeVralQxvu
	Q1bl2bAwzIJ/lGDDOdxEWT6c4jsQswS8RFDL54/Ai9iHI/8riORy+ZfyxvDBsmFtV7lcBcSMIhv
	TQeusBueGpABXdTKa0YBBCIeSJH8kROYU8TUn7fzxwXyjRjwSlBBaTJP/oAJPSbnikf0K/ZDg3t
	931yiNTca1Ik9rzGpp5BG8jZU76Xum6uwQ6FshYGLZEdVEC4rwOLJo5MS9EMYqVb/ZjzEZT0svV
	jokSUli8=
X-Received: by 2002:a17:907:8b87:b0:bcd:2dbd:8241 with SMTP id
 a640c23a62f3a-bcd2dbd8f82mr647649566b.5.1778569533677; Tue, 12 May 2026
 00:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-7-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-7-3efcba579e88@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 10:04:56 +0300
X-Gm-Features: AVHnY4Ir9Mq_UQabCQBoJYVIwG-u_PpfuUXY4u_xRVfJJhNKJhDnleR-UqRVa9w
Message-ID: <CAHp75VfgrbEDLavMKFp2maFCH08RBUxF2wYhh56GG1HCq4ogmA@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] thermal: mediatek: add PMIC thermal support
To: rva333@protonmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_000535_714003_8CA1E6B7 
X-CRM114-Status: GOOD (  21.91  )
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

On Tue, May 12, 2026 at 8:21=E2=80=AFAM Roman Vivchar via B4 Relay
<devnull+rva333.protonmail.com@kernel.org> wrote:
>
> Add a new driver to support thermal monitoring on MediaTek PMICs.
>
> The driver retrieves calibration data from EFUSE, calculates the
> temperature using a linear interpolation, and registers the device with
> the thermal framework.
>
> Initial support is added for the mt6323 PMIC.

...

+ array_size.h

> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/err.h>
> +#include <linux/iio/consumer.h>

> +#include <linux/kernel.h>

No way the driver(s) nowadays use this header. Please, drop it and add
the ones that are really in use (there are missing ones).

> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>

> +#include <linux/slab.h>

Is it used?

> +#include <linux/thermal.h>

Missing types.h

> +#include <linux/units.h>

...

> +#define MT6323_ADC_VOLTAGE_RANGE       1800
> +#define MT6323_ADC_RESOLUTION          32768

These two ring a bell with the first code patch. Are they the same?
Can they be deduplicated?

...

> +       ret =3D iio_read_channel_processed(sensor->adc_channel, &raw);
> +       if (ret < 0) {

Do we need that ' < 0' part? What is the meaning of positive returned
value (if any) and why do we ignore that? Same question to all similar
checks in the whole series.

> +               dev_err(sensor->mt->dev, "failed to read iio channel: %d\=
n",
> +                       ret);
> +               return ret;
> +       }

...

> +       /*
> +        * Temperature coefficient. The o_slope is a trim value applied t=
o
> +        * the base calibration

Respect English grammar and punctuation. Here is the period missing.

> +        */

...

> +static int mtk_pmic_thermal_extract_efuse_mt6323(struct mtk_pmic_thermal=
 *mt,
> +                                                u16 *buf)
> +{
> +       u32 reg;
> +       s32 vts, degc_cali, o_slope, o_slope_sign, id;
> +       int ret;

Better to keep reversed xmas tree order.

> +       return 0;
> +}

...

> +static int mtk_pmic_thermal_get_calib_data(struct device *dev,
> +                                          struct mtk_pmic_thermal *mt)
> +{

> +       void *buf __free(kfree) =3D NULL;

This is a discouraged way of defining variables with __free(). See below.

> +       struct nvmem_cell *cell;
> +       size_t len;
> +       int ret;
> +
> +       cell =3D nvmem_cell_get(dev, NULL);
> +       if (IS_ERR(cell))
> +               return PTR_ERR(cell);

> +       buf =3D nvmem_cell_read(cell, &len);

Should be rather here

       void *buf __free(kfree) =3D nvmem_cell_read(cell, &len);

> +       nvmem_cell_put(cell);
> +
> +       if (IS_ERR(buf)) {
> +               ret =3D PTR_ERR(buf);
> +               buf =3D NULL;
> +               return ret;
> +       }
> +
> +       if (len < 2 * sizeof(u16)) {
> +               dev_err(dev, "invalid calibration data length\n");
> +               return -EINVAL;

return dev_err_probe(...);

> +       }
> +
> +       ret =3D mt->data->extract_efuse(mt, buf);
> +       if (ret) {
> +               dev_info(dev, "device not calibrated, using default value=
s\n");
> +               mt->data->precalc(mt, MT6323_DEFAULT_VTS,
> +                                 MT6323_DEFAULT_DEGC_CALI,
> +                                 MT6323_DEFAULT_SLOPE,
> +                                 MT6323_DEFAULT_SLOPE_SIGN);
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_pmic_thermal_init_sensor(struct mtk_pmic_thermal *mt, int=
 id)
> +{
> +       struct mtk_pmic_sensor *sensor =3D &mt->sensors[id];
> +       struct device *dev =3D mt->dev;
> +
> +       sensor->id =3D id;
> +       sensor->mt =3D mt;
> +
> +       if (mt->data->num_sensors > 1)
> +               sensor->adc_channel =3D devm_iio_channel_get(dev, mt->dat=
a->sensors[id]);
> +       else
> +               sensor->adc_channel =3D devm_iio_channel_get(dev, NULL);

> +

Unneeded blank line as the above and below are coupled semantically.

> +       if (IS_ERR(sensor->adc_channel))
> +               return dev_err_probe(dev, PTR_ERR(sensor->adc_channel),
> +                                    "failed to get channel %s\n",
> +                                    mt->data->sensors[id]);
> +
> +       sensor->tzdev =3D devm_thermal_of_zone_register(dev, id, sensor,
> +                                                     &mtk_pmic_thermal_o=
ps);
> +       if (IS_ERR(sensor->tzdev))
> +               return dev_err_probe(dev, PTR_ERR(sensor->tzdev),
> +                                    "failed to register thermal zone %d\=
n", id);
> +
> +       return 0;
> +}

...

> +static const struct of_device_id mtk_pmic_thermal_of_match[] =3D {
> +       { .compatible =3D "mediatek,mt6323-thermal",
> +         .data =3D &mt6323_thermal_data },
> +       { /* sentinel */ },

No comma for the terminator entry.

> +};

--=20
With Best Regards,
Andy Shevchenko

