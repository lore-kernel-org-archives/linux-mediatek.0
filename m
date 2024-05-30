Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B32FC25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ityrTb+cN3E6zdWopkba23K4YFJ51mGn7zptESF64M=; b=wqVIaZYAsda2MMLq5hrjCxduBX
	6yOmFxPjIZQ0nY42TXGqstkTq1wUVKqc9HpTIiuTY43vikruEFAAhI+zKDeQ+dJhe2kOzbwLD9Wgo
	E5P1GIBjanL1xyJppGiJP2GO4lkYE4rDLepcFMkOO1Bzxt2b/6jbwqag8oH0u5mGf0DGClBoZME7W
	Rf1UWFBfd6mc90bC0jBVPCZSfHxXRIBrQpRoGosxN3GQ93a4XiWphN6fjTMBWVTCJMRc8/0Zi6r7K
	tu6iGNMuI+CUS2VtQ7j1i8kQdF5IKS6tPsd0J45x6w1uTajIbEb6p3NqR+gAVjwQfPbjzf6R1SRjX
	AZJJZnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCfvy-00000007O7L-0Vtb;
	Thu, 30 May 2024 13:35:10 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCfvu-00000007O6A-2YUg;
	Thu, 30 May 2024 13:35:08 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a6267778b3aso64799666b.3;
        Thu, 30 May 2024 06:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717076104; x=1717680904; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ityrTb+cN3E6zdWopkba23K4YFJ51mGn7zptESF64M=;
        b=MkRx1uCFD8wJuYdYNwqc41ib6hhPLusb1c+F4J67xcxxMQHoxqmBOqeXHKkSNECyG8
         b7ncSrVEzJdQlefS5zaVDdc7SRNO3IbkjWE9FpuWJ+XU7oIbxusbUWR/pFcMwbziwQbl
         +5v6ylD4lZsktfS7iTGXpDpUzTcTZWJLWXvnHBKVwnai7rs3zH2Iwoc4wtGkmrnRZJfc
         SNknRsvcRNWDa5cja+lN1YMWCKkaCpPM7J7gjUmVSfPOQsEQmM9/GpSGmTG6nG6oclVm
         LAF+XzXEXvRKKIwTAzBa5OvKXmOvomhv7swFl7QuIlLw3uyZeLB4RwIwooCTVs85MiOr
         jqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717076104; x=1717680904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ityrTb+cN3E6zdWopkba23K4YFJ51mGn7zptESF64M=;
        b=H0cwHZOsVFB2jdnLQjM8AtgydnaICTvB+ffiFgc6IG8EXN4UjuOAkrwR0yZBDgwLzZ
         VT1zn+FkcOWf7gA4dc/eAHHMwPhDZkEjcvChImQORvFBTgQDfHE3mKM1BGVyYZQN82eW
         tpLWMoWPahzyZw4cvslXhpheZNNB4Te5zOFxYakBEQttzGR1Ml1x3XMDDEBgGSQywZj6
         Y+49s1axNxzF7bIJLqpbFvyrz2rOG8PUy8bZyOOE11kqtr98Oxa077fboLL4DvzflQTa
         FHCDDRhgDObl8namMNuXtPxl/yAWIWO5zDNEd73G9bKHkDSdKEH1sTe8nW9LG5wDAneE
         wjuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3diPGpx1HqhEVwhAK7LAWxomeZEVwGICyxIfZq9V0kJ+2BZ/VdwJzkLtQBQc0Sm9PbHe+74tCO4PEZGT1EHQpN3+gh5WVTC5IcEDl8gHtW+9nC4SqzzAd6XWlQBWZCj134fIvTQCwg60QnmtQJAMX/R1oK/rT9Go=
X-Gm-Message-State: AOJu0YxOLAn+trfisj8pL7lE9HVl17BvltJtbEiGLSEvy1n2eaNj08KJ
	9fp67Ltg8sTJFRPb/KDE7G/btmGDkxlHcz8ScD8fbnY17mvnppWeZgRYHVsHr7p9G320+J3sAwi
	jZEWH9lEHKgeW6EfpNaAkLgnn82A=
X-Google-Smtp-Source: AGHT+IH7FtLH1XLeHqlHgAvWr9dzcasrfRvrJ3/m57OZQa4LKdwDt7riItXkQ11EXy8nI4WkwAdBQEESRzaKO1SQlGQ=
X-Received: by 2002:a17:906:b3a0:b0:a5a:1562:5187 with SMTP id
 a640c23a62f3a-a65e924fd51mr115572766b.55.1717076104311; Thu, 30 May 2024
 06:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240530093410.112716-1-angelogioacchino.delregno@collabora.com> <20240530093410.112716-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240530093410.112716-3-angelogioacchino.delregno@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 May 2024 16:34:27 +0300
Message-ID: <CAHp75Vexddt1xUGogRDZA9pM1pFp2=ZtCQnCfXePahSCb+oKpg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] iio: adc: Add support for MediaTek MT6357/8/9
 Auxiliary ADC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: jic23@kernel.org, lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, lee@kernel.org, andy@kernel.org, 
	nuno.sa@analog.com, bigunclemax@gmail.com, dlechner@baylibre.com, 
	marius.cristea@microchip.com, marcelo.schmitt@analog.com, fr0st61te@gmail.com, 
	mitrutzceclan@gmail.com, mike.looijmans@topic.nl, marcus.folkesson@gmail.com, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_063506_681748_3C286876 
X-CRM114-Status: GOOD (  22.40  )
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

On Thu, May 30, 2024 at 12:34=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a driver to support reading the Auxiliary ADC IP found in the
> MediaTek MT6357, MT6358 and MT6359 Power Management ICs.
>
> This driver provides multiple ADC channels for system monitoring,
> such as battery voltage, PMIC temperature, PMIC-internal voltage
> regulators temperature, and others.

> ---

Here is no explanation on how this is differ to any of the three
existing drivers? I.o.w. why do we need a brand new one?

...

+ bits.h

> +#include <linux/delay.h>

> +#include <linux/kernel.h>

Why?

+ mod_devicetable.h
> +#include <linux/module.h>

> +#include <linux/of.h>

Why?

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

+ types.h

+ blank line

> +#include <linux/iio/iio.h>

+ Blank line

> +#include <linux/mfd/mt6397/core.h>

...

> +#define PMIC_RG_RESET_VAL              (BIT(0) | BIT(3))

In this form it requires a comment explaining each mentioned bit.

> +#define PMIC_AUXADC_ADCx(x)            ((x) << 1)

Seems like a useless macro, it occupies much more space than in-place shift=
.

...

> +#define MT6358_IMP0_CLEAR              (BIT(14) | BIT(7))

As per above.

...

> +/**
> + * struct mtk_pmic_auxadc_chan - PMIC AUXADC channel data
> + * @req_idx:       Request register number
> + * @req_mask:      Bitmask to activate a channel
> + * @num_samples:   Number of AUXADC samples for averaging
> + * @r_numerator:   Resistance ratio numerator
> + * @r_denominator: Resistance ratio denominator
> + */
> +struct mtk_pmic_auxadc_chan {
> +       u8 req_idx;
> +       u16 req_mask;
> +       u16 num_samples;

> +       u8 r_numerator;
> +       u8 r_denominator;

Can you add struct u8_fract to the math.h and use it? I will Ack/R the
respective patch.

> +};

...

> +struct mtk_pmic_auxadc_pdata {
> +       const struct iio_chan_spec *channels;
> +       int num_channels;

Why signed?

> +       const struct mtk_pmic_auxadc_chan *desc;
> +       const u16 *regs;
> +       u16 sec_unlock_key;
> +       u8 imp_adc_num;
> +       int (*read_imp)(struct mt6359_auxadc *adc_dev, int *vbat, int *ib=
at);
> +};

...

> +static const u16 mt6357_auxadc_regs[] =3D {
> +       [PMIC_HK_TOP_RST_CON0]  =3D 0xf90,

Can we use the fixed-width values so all of them will look nice and
easy to parse?

> +       [PMIC_AUXADC_DCM_CON]   =3D 0x122e,
> +       [PMIC_AUXADC_ADC0]      =3D 0x1088,
> +       [PMIC_AUXADC_IMP0]      =3D 0x119c,
> +       [PMIC_AUXADC_IMP1]      =3D 0x119e,
> +       [PMIC_AUXADC_RQST0]     =3D 0x110e,
> +       [PMIC_AUXADC_RQST1]     =3D 0x1114,
> +};

...

> +static const u16 mt6358_auxadc_regs[] =3D {

Ditto.

> +       [PMIC_HK_TOP_RST_CON0]  =3D 0xf90,
> +       [PMIC_AUXADC_DCM_CON]   =3D 0x1260,
> +       [PMIC_AUXADC_ADC0]      =3D 0x1088,
> +       [PMIC_AUXADC_IMP0]      =3D 0x1208,
> +       [PMIC_AUXADC_IMP1]      =3D 0x120a,
> +       [PMIC_AUXADC_RQST0]     =3D 0x1108,
> +       [PMIC_AUXADC_RQST1]     =3D 0x110a,
> +};

...

> +static const u16 mt6359_auxadc_regs[] =3D {

Ditto.

> +       [PMIC_FGADC_R_CON0]     =3D 0xd88,
> +       [PMIC_HK_TOP_WKEY]      =3D 0xfb4,
> +       [PMIC_HK_TOP_RST_CON0]  =3D 0xf90,
> +       [PMIC_AUXADC_RQST0]     =3D 0x1108,
> +       [PMIC_AUXADC_RQST1]     =3D 0x110a,
> +       [PMIC_AUXADC_ADC0]      =3D 0x1088,
> +       [PMIC_AUXADC_IMP0]      =3D 0x1208,
> +       [PMIC_AUXADC_IMP1]      =3D 0x120a,
> +       [PMIC_AUXADC_IMP3]      =3D 0x120e,
> +};

...

> +       ret =3D regmap_read_poll_timeout(adc_dev->regmap, pdata->regs[PMI=
C_AUXADC_IMP0],
> +                                      val, !!(val & MT6358_IMP0_IRQ_RDY)=
,
> +                                      IMP_POLL_DELAY_US, AUXADC_TIMEOUT_=
US);
> +       if (ret) {
> +               mt6358_stop_imp_conv(adc_dev);

> +               return ret;
> +       }
> +
> +       return 0;

  if (ret)
    foo()

  return ret;


...

> +       int val_v, ret;

Why is val_v signed?

...

> +       int val_v, val_i, ret;

Ditto for all val_*.

...

> +       /* If it succeeded, wait for the registers to be populated */
> +       usleep_range(IMP_STOP_DELAY_US, IMP_STOP_DELAY_US + 50);

fsleep() ?

...

> +       /* Assert ADC reset */
> +       regmap_set_bits(regmap, pdata->regs[PMIC_HK_TOP_RST_CON0], PMIC_R=
G_RESET_VAL);

No required delay in between?

> +       /* De-assert ADC reset */
> +       regmap_clear_bits(regmap, pdata->regs[PMIC_HK_TOP_RST_CON0], PMIC=
_RG_RESET_VAL);

...

> +       /* Wait until all samples are averaged */
> +       usleep_range(desc->num_samples * AUXADC_AVG_TIME_US,
> +                    (desc->num_samples + 1) * AUXADC_AVG_TIME_US);

fsleep()

...

> +       ret =3D regmap_read_poll_timeout(regmap,
> +                                      (pdata->regs[PMIC_AUXADC_ADC0] +
> +                                       PMIC_AUXADC_ADCx(chan->address)),

Drop unneeded parentheses and possibly make it one line.

> +                                      val, (val & PMIC_AUXADC_RDY_BIT),

Unneeded parentheses.

> +                                      AUXADC_POLL_DELAY_US, AUXADC_TIMEO=
UT_US);
> +       if (ret)
> +               return ret;

...

> +       mutex_lock(&adc_dev->lock);

Why not use cleanup.h?

...

> +static int mt6359_auxadc_probe(struct platform_device *pdev)
> +{

  struct device *dev =3D &pdev->dev;

> +       struct device *mt6397_mfd_dev =3D pdev->dev.parent;

  ... =3D dev->parent;

> +       struct mt6359_auxadc *adc_dev;
> +       struct iio_dev *indio_dev;
> +       struct regmap *regmap;
> +       int ret;
> +
> +       /* Regmap is from SoC PMIC Wrapper, parent of the mt6397 MFD */
> +       regmap =3D dev_get_regmap(mt6397_mfd_dev->parent, NULL);
> +       if (!regmap)
> +               return dev_err_probe(&pdev->dev, -ENODEV, "Failed to get =
regmap\n");
> +
> +       indio_dev =3D devm_iio_device_alloc(&pdev->dev, sizeof(*adc_dev))=
;
> +       if (!indio_dev)
> +               return -ENOMEM;
> +
> +       adc_dev =3D iio_priv(indio_dev);
> +       adc_dev->regmap =3D regmap;
> +       adc_dev->dev =3D &pdev->dev;
> +
> +       adc_dev->pdata =3D device_get_match_data(&pdev->dev);
> +       if (!adc_dev->pdata)
> +               return -EINVAL;
> +
> +       mutex_init(&adc_dev->lock);
> +
> +       mt6359_auxadc_reset(adc_dev);
> +
> +       indio_dev->dev.parent =3D &pdev->dev;
> +       indio_dev->name =3D dev_name(&pdev->dev);
> +       indio_dev->info =3D &mt6359_auxadc_info;
> +       indio_dev->modes =3D INDIO_DIRECT_MODE;
> +       indio_dev->channels =3D adc_dev->pdata->channels;
> +       indio_dev->num_channels =3D adc_dev->pdata->num_channels;
> +
> +       ret =3D devm_iio_device_register(&pdev->dev, indio_dev);
> +       if (ret < 0)

Why  ' < 0' ?

> +               return dev_err_probe(&pdev->dev, ret, "failed to register=
 iio device\n");
> +
> +       return 0;
> +}

--=20
With Best Regards,
Andy Shevchenko

