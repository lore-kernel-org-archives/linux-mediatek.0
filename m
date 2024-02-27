Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D73FC54E4A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZpPioA8mjFfPElR4akQZjgY40MOrULuf/vpjJ/rxUr8=; b=ti58NDZS/z1h1fCWRubhbxja4f
	nITb8V9vazRviR3EUUKeSw/imotDIfkIZj1o8I4Ff9kZajB/hsnv1ltfVnKYDisFCqwuPcSdFeIas
	rCleL16ywy8X6Ge5m71rBT/W2IjOsrUiCeYKu8ip8JwbeY5wUAdiOmofcPkJDXb1YIkpS3+2ScxkJ
	SqNkNennBZ+CmmGcbHZYqJskv+TOe18MPcaR19htB+L8H+oANDCFr8JviU1IDVlvaTBEPxkCuPkre
	OAmANIt3ZEOnO5jMUS0PVfdiyve5u5WOGNLIra2hM7ZKrhdVxp0NTKUpW/W8N8bTkLE1CSeX3ugxk
	T60yDEPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewrw-00000005FRL-2nK2;
	Tue, 27 Feb 2024 12:47:36 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewrt-00000005FPu-0bmQ;
	Tue, 27 Feb 2024 12:47:34 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a293f2280c7so632324466b.1;
        Tue, 27 Feb 2024 04:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709038051; x=1709642851; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpPioA8mjFfPElR4akQZjgY40MOrULuf/vpjJ/rxUr8=;
        b=Ba8y4gCno0ocilBnwyLAlrmG2mJYpTwfa+jqGzGkfWh964ueJIkz7B9uZ9PnbmlG1P
         LgToTpt9nolFaMKke9Pw/puVfZ0y0wZu3tiTaH74Luzp7eqNoMlK5Ep39ZJDOITdTX/2
         roz5xKdb5MQoRn86HQ0WkTsNc378m6W0TFUM90KwE7se42AXw37ou+jc64wu773txBdH
         vNuY4IuQmI1zI2/NtyhY0ibnIbvJJ+d+t9AENGs3vwzZGJj4Gd7Gm3VLhKKlUo8FIlWH
         m85iExRkPrIslalfja7ih6VxfEThTvLPPgqeFqMdjRXcPqIYaBUBjEW4t+MQMtBV3WSt
         DYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709038051; x=1709642851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpPioA8mjFfPElR4akQZjgY40MOrULuf/vpjJ/rxUr8=;
        b=YWBBg1jrMMusgKJnjJo/PciPZLb1ZJwAKg2zr52seAwfgZWIwsvbKTShZ9n+Q1xQRK
         9EklagVzFakfnclKlmoT8USTHnIpc02j4yB2hyn1PJrhxrHKI/4a1eXbkhYMQxiy1jup
         JZq5n2bBkpuw9gF05tBS9zlOg975JmvekiQDO+Ed58gQN1KBQXQbLYp5Cdi8CPAaOcts
         ecwrdJcm2Dt5GMu1KYHEq8Anh3SAc/t5sesQssAg6JMKuFl7rdaOl69TendhUu8it45R
         6TKLET8srWXxNiHVO8KBKd5H5RxLfxHlC/mPFrVYMqLrlZRuUyV0dEpL/tc/bkgkyNE+
         3Pgw==
X-Forwarded-Encrypted: i=1; AJvYcCW9lyLQzn8N3ErNhHaP6zXndg191nYKNV9rMadO7H3XCgJPQBR7rLoicHB6S3gdsBuZRA60ujlBFkOCXRVGwU7lMmDarXzNRNf4LhiiAB60bwZJ8TCBmgDoxYzdFXju+c6WtW1rRS3FUUR+GouLhRnhMULGaddbRy0=
X-Gm-Message-State: AOJu0YzXqg1Zpd/tvCIybm5Mp67iBcjdaxErskXIuZlVBkD3lrpI+Ftq
	NjkA3GLV5p0M392Rx37vq2mp1blPDUf9oAUSppNJ4yYg5TYNkUnB0cMqVjOWSzZyxsWQXjpuVZq
	PiE8fxS29CE+oFKcIiGDpr/0YRgk=
X-Google-Smtp-Source: AGHT+IFrh/8pgurQdSvgoM/FQw8kwQcem4PV9asiC18rj6sJlIga3mn5rCQUYEgp4rHMJmd1VYL9xMjVRdG002WnAHk=
X-Received: by 2002:a17:906:3e4b:b0:a3f:6513:1489 with SMTP id
 t11-20020a1709063e4b00b00a3f65131489mr5774318eji.55.1709038051151; Tue, 27
 Feb 2024 04:47:31 -0800 (PST)
MIME-Version: 1.0
References: <20240227013221.21512-1-zhi.mao@mediatek.com> <20240227013221.21512-3-zhi.mao@mediatek.com>
In-Reply-To: <20240227013221.21512-3-zhi.mao@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 27 Feb 2024 14:46:54 +0200
Message-ID: <CAHp75VciCJuoOwC8ozanWYqSCM=vWpiaqymJ2-gQfrSt5Ts6fQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] media: i2c: Add GC08A3 image sensor driver
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com, 
	shengnan.wang@mediatek.com, yaya.chang@mediatek.com, 10572168@qq.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, yunkec@chromium.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, jacopo.mondi@ideasonboard.com, 
	hverkuil-cisco@xs4all.nl, heiko@sntech.de, jernej.skrabec@gmail.com, 
	macromorgan@hotmail.com, linus.walleij@linaro.org, hdegoede@redhat.com, 
	tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net, 
	bingbu.cao@intel.com, dan.scally@ideasonboard.com, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_044733_219128_AB78A880 
X-CRM114-Status: GOOD (  21.80  )
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

On Tue, Feb 27, 2024 at 3:33=E2=80=AFAM Zhi Mao <zhi.mao@mediatek.com> wrot=
e:
>
> Add a V4L2 sub-device driver for Galaxycore GC08A3 image sensor.

...

> +/*
> + * gc08a3.c - gc08a3 sensor driver

Drop the filename from the file, it's impractical (esp. if the file
will be renamed for some reason in the future).

> + *
> + * Copyright 2023 MediaTek
> + *
> + * Zhi Mao <zhi.mao@mediatek.com>
> + */

...

> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/units.h>

This is a semi-random list of inclusions. Please, follow the IWYU
(Include What You Use) principle. *At least* this list misses the
following:  array_size.h, bits.h, container_of.h, device.h, err.h,
i2c.h, math64.h, module.h, mod_devicetable.h, property.h, types.h.

...

> +       /*update crop info to subdev state*/

Missing spaces.

...

> +       /*update fmt info to subdev state*/

Ditto.

...

> +static int gc08a3_test_pattern(struct gc08a3 *gc08a3, u32 pattern_menu)
> +{
> +       u32 pattern =3D 0;

No, please use the default case for this assignment.

> +       int ret;
> +
> +       if (pattern_menu) {
> +               switch (pattern_menu) {
> +               case 1:
> +                       pattern =3D 0x00;
> +                       break;
> +               case 2:
> +                       pattern =3D 0x10;
> +                       break;
> +               case 3:
> +               case 4:
> +               case 5:
> +               case 6:
> +               case 7:
> +                       pattern =3D pattern_menu + 1;
> +                       break;
> +               }
> +
> +               ret =3D cci_write(gc08a3->regmap, GC08A3_REG_TEST_PATTERN=
_IDX,
> +                               pattern, NULL);
> +               if (ret)
> +                       return ret;
> +

> +               ret =3D cci_write(gc08a3->regmap, GC08A3_REG_TEST_PATTERN=
_EN,
> +                               GC08A3_TEST_PATTERN_EN, NULL);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               ret =3D cci_write(gc08a3->regmap, GC08A3_REG_TEST_PATTERN=
_EN,
> +                               0x00, NULL);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;

'else' is redundant, but you can deduplicate code above with

  return cci_write(...);
} else {
  return cci_write(...);
}

Of course you can go even further, but I think with the above it will
be balanced to the way that it's easy to understand how branches
behave ('else' in this case helps to indent semantically coupled
lines).

> +}


> +       /*
> +        * Applying V4L2 control value only happens
> +        * when power is on for streaming
> +        */

Respect English grammar and punctuation, i.e. don't forget periods at
the end of sentences in multi-line comments.

...

> +       endpoint =3D
> +               fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> +                                               FWNODE_GRAPH_ENDPOINT_NEX=
T);
> +       if (!endpoint) {

Strictly speaking dev_fwnode(dev) might be NULL or an error pointer. I
dunno how the graph is implemented there and if it's possible to get
an error pointer out of it. At least this probably needs to be aligned
there at some point.

> +               dev_err(dev, "endpoint node not found\n");
> +               return -EINVAL;
> +       }

...

> +static const struct dev_pm_ops gc08a3_pm_ops =3D {
> +       RUNTIME_PM_OPS(gc08a3_power_off, gc08a3_power_on, NULL)
> +};

There is a DEFINE_* PM macro, use it.

...

> +

Redundant blank line.

> +module_i2c_driver(gc08a3_i2c_driver);

--=20
With Best Regards,
Andy Shevchenko

