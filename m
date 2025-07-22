Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55916C83F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 05:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbjWKy8Lcwc8GEbZTAM6i4MM4xiUxqjSvPPv7uBUtNY=; b=oPf1EG0Xdo8a24oqOjrdVBxwsp
	08t72ySwjl2hXSpFdzP0ufwz6MeQcC1C1zue+GVWr2ZhwANO7FJ/y7fETGEW8HEAMn59FWXSCO5z+
	nhax14IlrC4XF33UnS9TUS4drkezwSyGmJeTZnhwi6ol+/4906HXsvyngtdwOO6Bk0U7HS/JsGjGY
	9m4lhZGLZHONn/0ozmGaXV0EMcTk7q0TNOBTUmZCFBDYX6YcavnDvHREs2bZesy56pIrudWjBibS6
	bAKQYmrviwCmYmv0aJV514dYOkvppgesCpk4gzQDlIyEiSSmwXY41+w4zA8ncoO0ZAzNHlRLfqbKq
	o/w7fzRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5Oy-00000001Jx0-2Oxv;
	Tue, 22 Jul 2025 05:18:56 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue5Ov-00000001JwL-1hx1
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 05:18:54 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso50934331fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Jul 2025 22:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753161531; x=1753766331; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbjWKy8Lcwc8GEbZTAM6i4MM4xiUxqjSvPPv7uBUtNY=;
        b=GOKsWYC7pe7sE0Ia5/+O2YxDDbCCM6AQkdCXr/6+AmZdRReRdh/Zh+jAV4DcF92zA/
         eR1RqlWTSDE/AaAj2NsuOYCQSt9EMaqBkmBr4FxuUHDl6YgYB/mlwmDHBrKjNv5sPTbW
         FiJFCdeTWxvDLzH6mdjt+wy/u+KraFZ93vXHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753161531; x=1753766331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbjWKy8Lcwc8GEbZTAM6i4MM4xiUxqjSvPPv7uBUtNY=;
        b=c+y8sQWlbW7EPuiA2X8su6f1TTmjiC+FXO7AkKqpX5lralpSthBDCIckEt6/1xGgcr
         5aG1/5aIEx526XSpWBNiCYh/bWQxUij64NdsuuBh/q/DFs+Vd0QytPLOp2ikkKGhdctr
         USrKbN9YyLzwtF9jzdE/Z/Lx2pU10DyNfPJT+pASyTNI1VjkEYqfiy/88ezFtL24Rxvr
         VtouoQ2OD9GZvmXAQV4v/5rRjkxgYBY+KehOgLPm3rnYVeOkimAnhcTv18EXaLARYcDr
         Vdm7z6bjyTTbTJ5g8bUDRYAm8oZJUypLR2UmyMF5zzyZeCSg9GLr4lZiBVvTqhkzQ0ek
         ipCQ==
X-Gm-Message-State: AOJu0Yy583wVbe8LTMinF67/4CiByPoxqaI/Fpi+o97C4n14srBpcSHP
	1A2LgpmHjRx2zaj619CV+u5A0b5wZFhUQ2Focz8fEUCdm/ho9++hDfOsilgDnnjrM9IeVO8iaHi
	9Qw9Dn9NpD8Ilnz3tlxKRqSHQu4Y7zUvQxgB3RgKL
X-Gm-Gg: ASbGncuyoTbIvkrMH/vm+FBMVml3wZ1hc9VfCyORqlboOY18K+lQ4k/Vk8FsvMoNzQL
	QxSQQ/ZcD92MWOeqqS8bp9SdisyVrfuBt+7sHf1g3XMmxfQMysGbHjmSIAKPbexo4X2a/Hvzl9L
	cHEfAgtqQqV/7bPl+Bh/IfRgL6M/GmTAYnQSzxdiN/CXHqgD3lJUSoI5OG4iGoMnce7IE8ibd/1
	CV+lfugFHQ3ZwwTdPADteDBSxhNy0AbneY=
X-Google-Smtp-Source: AGHT+IHXtp8/VRaNj5ad5vofsP+NxzY4Q7oTBNoQECt/CXJUr6VzTFYU6ZxOTJqcdAuOysJwJg5n/tSQs5v+X4qLoE4=
X-Received: by 2002:a2e:a984:0:b0:32b:7ddd:278d with SMTP id
 38308e7fff4ca-3309a466439mr46938661fa.3.1753161531420; Mon, 21 Jul 2025
 22:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com> <20250715140224.206329-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250715140224.206329-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Jul 2025 13:18:40 +0800
X-Gm-Features: Ac12FXxOEwd1JP0Dvkx8jUbcy4EUYQzj1kXlmFlLaoGVbfWV7CBCgyEc3biTeW0
Message-ID: <CAGXv+5GiKOTqmaJai-494XWDqk+onvrpqFyvwANr+_4_y-1WuA@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] regulator: Add support for MediaTek MT6316 SPMI
 PMIC Regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_221853_761200_ECABBE3D 
X-CRM114-Status: GOOD (  25.73  )
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

On Tue, Jul 15, 2025 at 10:03=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a driver for the regulators found on all types of the MediaTek
> MT6316 SPMI PMIC, fully controlled by SPMI interface and featuring
> four step down DCDC (buck) converters.
>
> In particular, this includes support for:
>  - MT6316(BP/VP):    2+2 Phase (Phase 1: buck1+2, Phase 2: buck3+4)
>  - MT6316(CP/HP/KP): 3+1 Phase (Phase 1: buck1+2+4, Phase 2: buck3)
>  - MT6316(DP/TP):    4+0 Phase (Single phase, buck1+2+3+4)

You should probably mention here or in the driver with comments that
some parts are not described in the datasheet, or even contradict what
the datasheet says. Examples include:

  - set / clear registers for the enable bits
  - voltage selector being in weird format

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/regulator/Kconfig            |   9 +
>  drivers/regulator/Makefile           |   1 +
>  drivers/regulator/mt6316-regulator.c | 345 +++++++++++++++++++++++++++
>  3 files changed, 355 insertions(+)
>  create mode 100644 drivers/regulator/mt6316-regulator.c
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 7423954153b0..81f2acd0f960 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -864,6 +864,15 @@ config REGULATOR_MT6315
>           This driver supports the control of different power rails of de=
vice
>           through regulator interface.
>
> +config REGULATOR_MT6316
> +       tristate "MT6316 SPMI PMIC regulator driver"
> +       depends on SPMI || COMPILE_TEST
> +       help
> +          Say Y here to enable support for 2+2, 3+1 and 4 phase regulato=
rs
> +          found in the MediaTek MT6316 BP, CP, DP, HP, VP and TP SPMI PM=
ICs.
> +         This driver supports the control of different power rails of de=
vice
> +         through regulator interface.
> +
>  config REGULATOR_MT6323
>         tristate "MediaTek MT6323 PMIC"
>         depends on MFD_MT6397
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index be98b29d6675..46c0e75f6107 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -103,6 +103,7 @@ obj-$(CONFIG_REGULATOR_MP886X) +=3D mp886x.o
>  obj-$(CONFIG_REGULATOR_MPQ7920) +=3D mpq7920.o
>  obj-$(CONFIG_REGULATOR_MT6311) +=3D mt6311-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6315) +=3D mt6315-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6315)  +=3D mt6316-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6323) +=3D mt6323-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6331) +=3D mt6331-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6332) +=3D mt6332-regulator.o
> diff --git a/drivers/regulator/mt6316-regulator.c b/drivers/regulator/mt6=
316-regulator.c
> new file mode 100644
> index 000000000000..952852bbe923
> --- /dev/null
> +++ b/drivers/regulator/mt6316-regulator.c
> @@ -0,0 +1,345 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2024 MediaTek Inc.
> +// Copyright (c) 2025 Collabora Ltd
> +//                    AngeloGioacchino Del Regno <angelogioacchino.delre=
gno@collabora.com>
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/spmi.h>
> +
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/of_regulator.h>
> +
> +#define MT6316_BUCK_MODE_AUTO                  0
> +#define MT6316_BUCK_MODE_FORCE_PWM             1
> +#define MT6316_BUCK_MODE_LP                    2
> +
> +#define MT6316_CHIP_ID                         0x20b
> +#define MT6316_BUCK_TOP_CON0                   0x1440
> +#define EN_SET_OFFSET                          0x1
> +#define EN_CLR_OFFSET                          0x2
> +
> +#define MT6316_BUCK_TOP_CON1                   0x1443
> +
> +#define MT6316_BUCK_TOP_ELR0                   0x1448
> +#define MT6316_BUCK_TOP_ELR2                   0x144a
> +#define MT6316_BUCK_TOP_ELR4                   0x144c
> +#define MT6316_BUCK_TOP_ELR6                   0x144e
> +#define MT6316_VSEL_MASK                       GENMASK(8, 0)
> +
> +#define MT6316_VBUCK1_DBG                      0x14a8
> +#define MT6316_VBUCK2_DBG                      0x1528
> +#define MT6316_VBUCK3_DBG                      0x15a8
> +#define MT6316_VBUCK4_DBG                      0x1628
> +#define MT6316_BUCK_QI                         BIT(0)
> +
> +#define MT6316_BUCK_TOP_4PHASE_TOP_ANA_CON0    0x1688
> +#define MT6316_BUCK_TOP_4PHASE_TOP_ELR_0       0x1690
> +
> +enum mt6316_type {
> +       MT6316_TYPE_2PHASE,
> +       MT6316_TYPE_3PHASE,
> +       MT6316_TYPE_4PHASE
> +};
> +
> +/**
> + * struct mt6316_regulator_info - MT6316 regulators information
> + * @desc: Regulator description structure
> + * @debug_reg: Debug register for regulator status
> + * @lp_mode_reg: Low Power mode register (normal/idle)
> + * @lp_mode_mask: Low Power mode regulator mask
> + * @modeset_reg: AUTO/PWM mode register
> + * @modeset_mask: AUTO/PWM regulator mask
> + */
> +struct mt6316_regulator_info {
> +       struct regulator_desc desc;
> +       u16 debug_reg;
> +       u16 lp_mode_reg;
> +       u16 lp_mode_mask;
> +       u16 modeset_reg;
> +       u16 modeset_mask;
> +};
> +
> +#define MT6316_BUCK(match, vreg_id, min, max, step, vs_reg)            \
> +{                                                                      \
> +       .desc =3D {                                                      =
 \
> +               .name =3D match,                                         =
 \

.supply_name should probably be added for completeness.

> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6316_vreg_setclr_ops,                        =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D (max - min) / step + 1,                  =
 \
> +               .min_uV =3D min,                                         =
 \
> +               .uV_step =3D step,                                       =
 \

Given that the selector _always_ starts from 0 volts, I think this
should have:

                  .linear_min_sel =3D min / step,

So that different minimum values work. Or the minimum value should just
be dropped altogether to prevent miscalculation.

See below for more.

[...]

> +/* MT6316BP/VP - 2+2 phase buck */
> +static struct mt6316_regulator_info mt6316bv_regulators[] =3D {
> +       MT6316_BUCK("vbuck12", 1, 0, 1277500, 2500, MT6316_BUCK_TOP_ELR0)=
,

I just noticed that the overview section of the datasheet mentions that
the lowest voltage is 0.4V for all the regulators.


ChenYu

[...]

