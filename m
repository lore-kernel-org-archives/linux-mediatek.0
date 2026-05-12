Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFE4CD4851
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 06:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9/juFQ5EkLeK4MRC7rvbjQzQu8ytDf6s79QFENqFt0=; b=b3vVz4IBnozprc4LTDfDZcoWDJ
	icB/8DFLXmWZPYdaJkQAiAQe94scIZ7WkkVJWfLI0yglCpDf/CVkN9xoMUkpekBaelpGoVVMGnl50
	74Qbu5rOYVWEJ77f4gDeI4dtauxpc0c4MdhlVzJOKOnK+cGJUhSPuTfbvy3b53TSGWmkAjKbtF2sE
	9kOepgAfPzbQRLHuNQkINpZVaMIWoR//+cohX+JDmODydyBDP3osBPl1vYE3AEQZJbMWJ/x6tSvFZ
	/PSpR1jUjfZmlKgsBJkdSpWx00LuSYKnPhnifmivrRTukv4KRZgtAPlaB16ewwNdIm6aCJBo8DmQq
	r1revEvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgqp-0000000Fo6x-3ZBW;
	Tue, 12 May 2026 06:44:19 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgqo-0000000Fo5i-0cmQ
	for linux-mediatek@lists.infradead.org;
	Tue, 12 May 2026 06:44:19 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-bccd251d622so404387766b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 23:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778568256; cv=none;
        d=google.com; s=arc-20240605;
        b=MOjz/4uV4tCm9NNVJ2XzNeC3zQbTs4rD8J0ZDhpA8pmen4Sd69YWQsVeoqKJSPOlHn
         MOkxZDfgP7CN6v0Mria3W2MJCQoAMw79kQMvBrdrh8yc1xTinmPhmjv5M3uJgq0T8S0y
         1Avtc9NZAoBVeQH8Ofb3uNHPhHoge9cRfR//eYIkydCpyLqpe26Nyck/uZq2YpwJXze3
         dfSWTwScLrGkQpTCpFJsBhgl76lFpD5bwR5jLT5vPwYexTKD3RIVDRwrebL7Q4HDSopY
         FxPzFd3Y2q0jhLCJ7tjzUcsepZYt4z/wKyEncbvdebMbAKtXaaD4bxx4Gj5vf70Qnn5O
         rExw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s9/juFQ5EkLeK4MRC7rvbjQzQu8ytDf6s79QFENqFt0=;
        fh=EatiFPp1Val78LF/INvLnYSEspSApioRWRCuQ1OXvYM=;
        b=gUz7N2yZPuealrtp7yQtQ+cleuVcYmAnHlw7NxqICn8l92bqx2lPU5AfWkdwNfJtmr
         /eD5CW3PXUIG6rzKkItL0MztPT4MsK5Lh+b74ilKwJc4NszOGDu1TCRen/uf3usVJ0xy
         mrTTd6aRDT/x9Mv7VoihYqiiJ3Yfvk5v/SzQq1e2PMo+RTgwFjc7rjXhhBbW2HuZvuLn
         Uy6WXdLO2uXo95lL38PkwmyCTc2ajrU0sqXx3DosGuJ7Cyw0t1EznVSzRlK+POt2RosG
         WCNp7qSErx+/gDJyHNXdQsxq9irvL407a64Yum7jM4zvxPJqAGhNK31SdQiSPaoaowFi
         QZvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778568256; x=1779173056; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9/juFQ5EkLeK4MRC7rvbjQzQu8ytDf6s79QFENqFt0=;
        b=nSf0G3Ykd6rlHN+ojcR0VW8kMSKZ2Uy+4wV3EfLUzSFGwlVlB9Ag7rZ1DZNqLOGrwL
         FnDRqFc1pvDR87lK9Asg2MS8bdljq3I/GPdi5CQcM/imejTHQEuYASh+y/4bIPTz8zAe
         686l7L+449EfZI0mpkdFIiFjbzSnPHyVt0mMGJ+kivICNyxP/CUBEJB+0lBTQ4TAbmyZ
         X80tGyZDSKsOgjMcf1qXzcOh+iAC7GnYyR/8fqNPbeFaQvy2VIS9f7K3oT8z6LkmBwk9
         gX1Uwwtup5alU0AvfNKlKGUsh3nCBMIM3My4N5plKNnO/O9SPLlfNMLn+D9nP3kS3mVt
         tPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568256; x=1779173056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9/juFQ5EkLeK4MRC7rvbjQzQu8ytDf6s79QFENqFt0=;
        b=FGVblxLVNEpll+nHSKUp7B3jx1NJwQewm4IrFaiH7CnWI08EEsVymqaw+Bi4I+Lxbj
         PY/us/KvVygNsz8Ms9RKgf0dOmrlOex1TcvEoV8cE/UnWI/rKw7fp2t7iZyk3vbUNkiy
         JiVwVqkVYmkfHhn0wXW5f0KXZJhYYzdKs9jenAVRbwY+AM1cBUd2cMlVPlGQeCXm5/jP
         3uI7DrJIuInkhLzAEtgNkBIa6HYLDE4wKO514Vwwgdq431Pdf72jYcUXhZX8PpKJK8wA
         l1c1tc0jWn7h1AK/3nSAwPvwZxTiwmobL9dIunX9ZzbKc1MMDKG6yuez6bGvanwLeHTI
         5uDw==
X-Forwarded-Encrypted: i=1; AFNElJ91cvUER9uLwdrEIV2SCFmxIHHD1engykgztaV1GdpBcln5Dw4drVaNoTll9qmPaPzxzDuuMPiuiGdHafz5lA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy468cCbt+KCREkYLB0VCxxd5fxuxD9UNCUpOYogZBUTrCsrOFG
	MfEgHiyd8tEIEVvNGSdj+8Pbj61+5DNvPDxqf35wsVXpkNKZlwHokvO9yKAurQ49bS7UKBszJjS
	G9ADycpkrpdkLHvZUpi2QT8kDuKRtkho=
X-Gm-Gg: Acq92OGNevb18ldDA+Hn33NxQqlW/9+CDjSwCYR7QdNbmoQbyAFBnlXbLGcxy3xtIAC
	moEG0uxv7gSOY4+WeQiBs/njFrqQmAFApBXhtOB09SfyAFnbOKdTpEAfOR9cypZVrcJcxGw3z5I
	3oGe1CSrh4eHaT21K2YBld+3LUIdsdm3cidCJTiUvDyrbqL4bNO97qnS1JCqR1XDnBzhFr/otcY
	SxMxh2r+TZa7CH9B+VALyExeJ8FnCQLg5z8B5tW7Hh7AzX0LPsKV0w+RlisWtoFiaSfAq62DIAO
	476ik0f1cEDclDROEQK/G4G6QikoFH85wFgjZqQnqtPsN8tPRHfJgDjvkJdB2ytLo2m8/e0bD3o
	zQYryd48=
X-Received: by 2002:a17:907:728f:b0:bd1:d244:ca24 with SMTP id
 a640c23a62f3a-bd28e412eadmr84527766b.14.1778568255436; Mon, 11 May 2026
 23:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-5-3efcba579e88@protonmail.com>
In-Reply-To: <20260512-mt6323-v2-5-3efcba579e88@protonmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 09:43:38 +0300
X-Gm-Features: AVHnY4ISc11FAtQmtWdJlGYyo0XawWUZJbHlaYzrkD_vnuBBxzJNK6YMpmrGwVg
Message-ID: <CAHp75VdtORjmCCWy3-oiN-RQd+s7z=2G4s8hemv3xrq47vXu5g@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] iio: adc: mediatek: add mt6323 PMIC AUXADC driver
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
X-CRM114-CacheID: sfid-20260511_234418_228200_95EC11E3 
X-CRM114-Status: GOOD (  26.63  )
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
> The mt6323 AUXADC is a 15-bit ADC used for system monitoring. This driver
> provides support for reading various channels including battery and
> charger voltages, battery and chip temperature, current sensing and
> accessory detection.
>
> Add a driver for the AUXADC found in the MediaTek mt6323 PMIC.

...

> +#include <linux/array_size.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/iio/iio.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/stringify.h>

+ time.h // USEC_PER_MSEC

> +#include <linux/types.h>

...

> +#define AUXADC_TRIM_CH2                (3 << 10)
> +#define AUXADC_TRIM_CH4                (3 << 8)
> +#define AUXADC_TRIM_CH5                (3 << 4)
> +#define AUXADC_TRIM_CH6                (3 << 2)

Without a comment it's hard to say if these are like masks or actual
values. Can you clarify that in the comment on top of these four?

> +#define VOLTAGE_FULL_RANGE     1800

Are there any units? Are they millivolts or is it just some scale?

...

> +#define MTK_PMIC_IIO_CHAN(_name, _idx, _ch_type)       \
> +{                                                      \
> +       .type =3D _ch_type,                              \
> +       .indexed =3D 1,                                  \
> +       .channel =3D _idx,                               \
> +       .address =3D _idx,                               \
> +       .datasheet_name =3D __stringify(_name),          \
> +       .info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) | \
> +                             BIT(IIO_CHAN_INFO_SCALE) \

Keep the trailing comma as this is not a terminator.

> +}

...

> +/**
> + * struct mt6323_auxadc - Main driver structure
> + * @regmap:        Regmap from PWRAP
> + * @lock:          Mutex to serialize AUXADC reading vs configuration
> + *
> + * The MediaTek MT6323 (as well as lot of other PMICs) have the followin=
g hierarchy:
> + * PMIC AUXADC <- PMIC MFD <- SoC PWRAP (wrapper for PWRAP FSM)
> + *
> + * Therefore, PWRAP regmap should be get using dev->parent->parent.

get --> obtained

> + */

...

> +static int mt6323_auxadc_prepare_channel(struct mt6323_auxadc *auxadc)
> +{
> +       struct regmap *map =3D auxadc->regmap;
> +       u32 val;
> +       int ret;
> +
> +       ret =3D regmap_read(map, MT6323_AUXADC_CON19, &val);
> +       if (ret)
> +               return ret;
> +
> +       /* The ADC is idle */
> +       if (!(val & AUXADC_DECI_GDLY_MASK))
> +               return 0;
> +
> +       ret =3D regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19, val,
> +                                      !(val & AUXADC_ADC19_BUSY_MASK), 1=
0, 500);

It's better to have a logical split

       ret =3D regmap_read_poll_timeout(map, MT6323_AUXADC_ADC19,
                                      val, !(val & AUXADC_ADC19_BUSY_MASK),
                                      10, 500);

> +       if (ret)
> +               return ret;
> +
> +       return regmap_clear_bits(map, MT6323_AUXADC_CON19,
> +                                AUXADC_DECI_GDLY_MASK);
> +}

...

> +static int mt6323_auxadc_read(struct mt6323_auxadc *auxadc,
> +                             const struct iio_chan_spec *chan, int *out)
> +{
> +       struct regmap *map =3D auxadc->regmap;
> +       u32 val, reg =3D mt6323_auxadc_channel_to_reg(chan->address);
> +       int ret;
> +
> +       ret =3D regmap_read_poll_timeout(map, reg, val, (val & AUXADC_RDY=
_MASK),

Parentheses are not needed in this case. But I'm fine with it here as
it probably makes it easier to get the idea.

> +                                      1 * USEC_PER_MSEC, 100 * USEC_PER_=
MSEC);
> +       if (ret)
> +               return ret;
> +
> +       *out =3D FIELD_GET(AUXADC_DATA_MASK, val);
> +
> +       return 0;
> +}
> +
> +static int mt6323_auxadc_read_raw(struct iio_dev *indio_dev,
> +                                 const struct iio_chan_spec *chan, int *=
val,
> +                                 int *val2, long mask)

Logical split

static int mt6323_auxadc_read_raw(struct iio_dev *indio_dev,
                                 const struct iio_chan_spec *chan,
                                 int *val, int *val2, long mask)

> +{
> +       struct mt6323_auxadc *auxadc =3D iio_priv(indio_dev);
> +       int ret, mult =3D 1;

Decouple assignment and definition. These types of assignments are
hard to maintain and might lead to subtle mistakes in the future.

> +       if (mask =3D=3D IIO_CHAN_INFO_RAW) {
> +               guard(mutex)(&auxadc->lock);
> +               ret =3D mt6323_auxadc_prepare_channel(auxadc);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt6323_auxadc_request(auxadc, chan->address);
> +               if (ret)
> +                       return ret;

Please, add a comment with the reference to a datasheet (ideally)
explaining this sleep.

> +               fsleep(300);
> +
> +               ret =3D mt6323_auxadc_read(auxadc, chan, val);
> +               if (ret)
> +                       return ret;
> +               return IIO_VAL_INT;
> +       } else if (mask =3D=3D IIO_CHAN_INFO_SCALE) {

Redundant 'else'

> +               if (chan->channel =3D=3D MT6323_AUXADC_ISENSE ||
> +                   chan->channel =3D=3D MT6323_AUXADC_BATSNS)
> +                       mult =3D 4;
> +
> +               *val =3D mult * VOLTAGE_FULL_RANGE;
> +               *val2 =3D AUXADC_PRECISE;
> +
> +               return IIO_VAL_FRACTIONAL;

> +       } else

Ditto, and it's the wrong style. Read the Coding Style documentation
to clarify this.

> +               return -EINVAL;
> +}

...

> +       ret =3D devm_mutex_init(dev, &auxadc->lock);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to initialize mute=
x\n");

Unneeded error message. Most likely it's -ENOMEM, which will be
ignored by dev_err_probe() anyway.

...

> +       ret =3D devm_iio_device_register(dev, iio);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "failed to register iio de=
vice\n");

If you don't see the device, it's failed to register, do we need this messa=
ge?

--=20
With Best Regards,
Andy Shevchenko

