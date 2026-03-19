Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E701088E78
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 05:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2RA8e9dExM6rfge9s7IPYuXY2hi5jyghiykXbcUF4Y=; b=nQfXGJuCCIUCWJr6pdVWuklPUV
	BV2n7zs+hR9gMZNam2L2nGm5uGY6qwsXAI+0tP+ghZwL3IQAI2tJOoCfDNgHMbdQvZATnupTKluzU
	reJVf863T+6uySQsXFa/isqxpPE7RtuqcgrRBjErGCyuLtn0/kiyS2D52+TaINmZHUQwdS3BzPXL9
	4el4jzNEY7P1wWp0hV+M+xkzOuWCAHcg5sfKEiGzicprwHwj9DrCPrQ4EbZ4MAAKIA0Eyh9DGCarO
	idbnVkz9YqxAR8VUI0BDYZVM9oW4Wo1V2sUZYfS1dK9ykXKrY4uueWGplLI2sOISlLJ67TgudcokV
	C1faiMzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35Ya-00000009vYd-2ace;
	Thu, 19 Mar 2026 05:04:28 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35YX-00000009vXs-48ix
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 05:04:27 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-829b8b6c4d0so561553b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 22:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773896665; cv=none;
        d=google.com; s=arc-20240605;
        b=ipMNY5GoCD5cG2f0QArW9STynSwjLxvSAU6lUKU1+6G9ipUNmuEYt6uPDtAAXj/eeD
         YfvCaL/Fi2lbbg0K/LHzzN/X2n6eST4iy+mVrrahC7itAFjC2V5Bnc0DhqpQSVb5yelT
         DB7gahtN8qIi8O8diIkvg2RVDUBCcwy1WRZp+iA2Z9DK1wW095PRCW2Gx8tid4MnOyFC
         7eJJrE5633WmSjgbNbmPvyrXoVKEmD6JOrYHSLKd99W+u7ee7CU/Oxq6nS9PIKduX7/o
         3go89zFO8QVlZdKkDic02XhmKDQYo9lV+OaOFEv4xeFwzarhsbkGrSMkb1wWqF5gVie6
         wCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L2RA8e9dExM6rfge9s7IPYuXY2hi5jyghiykXbcUF4Y=;
        fh=iCD3y10TIr2QCXo3b1RrMUCkcxJyQ3iwuzW4y8KLKqI=;
        b=M102AOTSJ290mkN6E9y5lG16PW6/zKCahVXjVWxh2lfRN8RHTsJ5BqSIRcChObXmmt
         xDNNR1Z5Y0cwmykGe38CocO+cRDqee7B5g/x1ESHxQKMeeix5s+7COxMBi3tTj6kWg6/
         bhWd78pJ/8vfjDOetRxXCbdZjqG4ZnMu4kUFwPlBaaoaQpv+pVOuOSjCT+8hvG4BlaEx
         SVmeQr992W4KYh2ooZ9dNVClrYLtwbuq6SyJfLdJ9GFJ3X/LKoNLg/a30RUOHp3UA6gu
         suRGX3FVybgG5QWESnv0/to4+uKhq+oic/5QQkkYtFD+nP/LE78OJnM1iWx8ePR3ubsP
         UHzA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773896665; x=1774501465; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2RA8e9dExM6rfge9s7IPYuXY2hi5jyghiykXbcUF4Y=;
        b=i5KXfKP6h7lbbOJUI1+VUw4V3V8ZnyuauMm6OU9xMR6uwA+TEUNMauDkhUcg0Mhp9a
         /iemv3mrCj+FQAB6TAzdhqCrmVCiSVzDlQFH8SX+t3Q9qxymj9G3nGLACF9570dGmM3u
         jCu88aa1r/6QiwCUs3yvnZWabZVleYbT8Vrho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773896665; x=1774501465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L2RA8e9dExM6rfge9s7IPYuXY2hi5jyghiykXbcUF4Y=;
        b=cin4X1yGjEy8TFO/PyWYS5MeHHCYgmgmMgM0wV2veDx5EATc1FBabnB9Qd/m2IWvgE
         WibM1BZO7FR9IDlfgxUEfhDhs5dbS3qIhPxLY7qRls8Ohr8NLPfuIwWxMNya7H3ACqKS
         /s1s0mujSumRFlzGCYvUiuXq36DcPJ87W2YKDzLxSpNx2ot0pSiTVrsBnKj8lxpZg+Zh
         qt1u+ukDTCqUWq/HWPycY4uTYgUVeLHqL94nA4slQ6qaEedveuidaFKddtR6Te57xYLr
         gol19bSvMauo2LXsoXZmFtk9j+su9Tpkt3xkWObmOLckKzADPdlfnvbd50MaYzWMVhcJ
         htwg==
X-Gm-Message-State: AOJu0YxAZ1NH83AGHIgKclvZ8k8qY9FpO43jkpgBMgJR3hBK0qwnZIIf
	pORB8P/CNDJYQD4JNtlm+yiVH/ZhdxQi1ska81sNAbvhFiy/A7qfEgbLcpqJ1kFp6cxDoyCYhxV
	v/p5kzXidP06leXlgJNf/t3fk4iE22qxX8YN/JyQx
X-Gm-Gg: ATEYQzxtC5gbQH5ZffWOg5BUaldyhS+ERBtnGvyMyfkUMqx2P9vbEQOvCXqOi+OsiiZ
	Zao1TFvF5W0OQ2AGsyUZwzqZlqHpnrilgK9u43B2XxjvOFABpERZemyl1UOOB5QC/Q4KF7P45he
	p6SuJBAGejOsIU76RvpGa3n/mkDWEsn0DtsW0R30maLEPeMEH1vS9eVobrwn7yM50GpoM1Hx5qJ
	o1jfj/Qvo6e61VV2Z6L51e4GGk2n3DcZfshWx8ecXzpl50PEROVIPp0Hc7w/ciniGYiPw9erpEV
	Dgfze+tUVBTvkaVFLecWMC46hGuJYz3YMA7wl+UGqncpXjIj
X-Received: by 2002:a05:6a00:71cd:b0:82a:7046:86a0 with SMTP id
 d2e1a72fcca58-82a70468ac5mr3493177b3a.20.1773896664943; Wed, 18 Mar 2026
 22:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-8-l.scorcia@gmail.com>
In-Reply-To: <20260317184507.523060-8-l.scorcia@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Mar 2026 13:04:12 +0800
X-Gm-Features: AaiRm53-k1XiPsX8YHUI34_UU2ePBdJ9HT3Aqm47Bm64kJThrD_lG_tt8e77KjA
Message-ID: <CAGXv+5GmDtrtFHJXs+fDyF+dZ5YW-TSEqXnPs2xCH8cu-Xcn9w@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] regulator: mt6392: Add support for MT6392 regulator
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_220426_406465_0F55B567 
X-CRM114-Status: GOOD (  23.16  )
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

On Wed, Mar 18, 2026 at 2:46=E2=80=AFAM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> From: Fabien Parent <parent.f@gmail.com>
>
> The MT6392 is a regulator found on boards based on the MediaTek
> MT8167, MT8516, and probably other SoCs. It is a so called PMIC and
> connects as a slave to a SoC using SPI, wrapped inside PWRAP.
>
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Co-developed-by: Val Packett <val@packett.cool>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  drivers/regulator/Kconfig                  |   9 +
>  drivers/regulator/Makefile                 |   1 +
>  drivers/regulator/mt6392-regulator.c       | 487 +++++++++++++++++++++
>  include/linux/regulator/mt6392-regulator.h |  40 ++
>  4 files changed, 537 insertions(+)
>  create mode 100644 drivers/regulator/mt6392-regulator.c
>  create mode 100644 include/linux/regulator/mt6392-regulator.h
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index d2335276cce5..66876d730807 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -991,6 +991,15 @@ config REGULATOR_MT6380
>           This driver supports the control of different power rails of de=
vice
>           through regulator interface.
>
> +config REGULATOR_MT6392
> +       tristate "MediaTek MT6392 PMIC"
> +       depends on MFD_MT6397
> +       help
> +         Say y here to select this option to enable the power regulator =
of
> +         MediaTek MT6392 PMIC.
> +         This driver supports the control of different power rails of de=
vice
> +         through regulator interface.
> +
>  config REGULATOR_MT6397
>         tristate "MediaTek MT6397 PMIC"
>         depends on MFD_MT6397
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 1beba1493241..db5145cfcf36 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -117,6 +117,7 @@ obj-$(CONFIG_REGULATOR_MT6360) +=3D mt6360-regulator.=
o
>  obj-$(CONFIG_REGULATOR_MT6363) +=3D mt6363-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6370) +=3D mt6370-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6380) +=3D mt6380-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6392) +=3D mt6392-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6397) +=3D mt6397-regulator.o
>  obj-$(CONFIG_REGULATOR_MTK_DVFSRC) +=3D mtk-dvfsrc-regulator.o
>  obj-$(CONFIG_REGULATOR_QCOM_LABIBB) +=3D qcom-labibb-regulator.o
> diff --git a/drivers/regulator/mt6392-regulator.c b/drivers/regulator/mt6=
392-regulator.c
> new file mode 100644
> index 000000000000..50cc0019f48a
> --- /dev/null
> +++ b/drivers/regulator/mt6392-regulator.c
> @@ -0,0 +1,487 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2020 MediaTek Inc.
> +// Copyright (c) 2020 BayLibre, SAS.
> +// Author: Chen Zhong <chen.zhong@mediatek.com>
> +// Author: Fabien Parent <fparent@baylibre.com>
> +//
> +// Based on mt6397-regulator.c
> +
> +#include <linux/module.h>
> +#include <linux/linear_range.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/mt6397/core.h>
> +#include <linux/mfd/mt6392/registers.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/mt6392-regulator.h>
> +#include <linux/regulator/of_regulator.h>
> +#include <dt-bindings/regulator/mediatek,mt6392-regulator.h>
> +
> +/*
> + * MT6392 regulators' information
> + *
> + * @desc: standard fields of regulator description.
> + * @qi: Mask for query enable signal status of regulators
> + * @vselon_reg: Register sections for hardware control mode of bucks
> + * @vselctrl_reg: Register for controlling the buck control mode.
> + * @vselctrl_mask: Mask for query buck's voltage control mode.
> + */
> +struct mt6392_regulator_info {
> +       struct regulator_desc desc;
> +       u32 qi;
> +       u32 vselon_reg;
> +       u32 vselctrl_reg;
> +       u32 vselctrl_mask;
> +       u32 modeset_reg;
> +       u32 modeset_mask;
> +};
> +
> +#define MT6392_BUCK(match, vreg, min, max, step, volt_ranges, enreg,   \
> +               vosel, vosel_mask, voselon, vosel_ctrl,                 \
> +               _modeset_reg, _modeset_mask, rampdelay)         \
> +[MT6392_ID_##vreg] =3D {                                                =
 \
> +       .desc =3D {                                                      =
 \
> +               .name =3D #vreg,                                         =
 \
> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6392_volt_range_ops,                         =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .id =3D MT6392_ID_##vreg,                                =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D ((max) - (min)) / (step) + 1,            =
 \
> +               .linear_ranges =3D volt_ranges,                          =
 \
> +               .n_linear_ranges =3D ARRAY_SIZE(volt_ranges),            =
 \
> +               .vsel_reg =3D vosel,                                     =
 \
> +               .vsel_mask =3D vosel_mask,                               =
 \
> +               .enable_reg =3D enreg,                                   =
 \
> +               .enable_mask =3D BIT(0),                                 =
 \
> +               .ramp_delay =3D rampdelay,                               =
 \

Please add the supply names.

> +       },                                                              \
> +       .qi =3D BIT(13),                                                 =
 \
> +       .vselon_reg =3D voselon,                                         =
 \
> +       .vselctrl_reg =3D vosel_ctrl,                                    =
 \
> +       .vselctrl_mask =3D BIT(1),                                       =
 \
> +       .modeset_reg =3D _modeset_reg,                                   =
 \
> +       .modeset_mask =3D _modeset_mask,                                 =
 \
> +}
> +
> +#define MT6392_LDO(match, vreg, ldo_volt_table, enreg, enbit, vosel,   \
> +               vosel_mask, _modeset_reg, _modeset_mask, entime)        \
> +[MT6392_ID_##vreg] =3D {                                                =
 \
> +       .desc =3D {                                                      =
 \
> +               .name =3D #vreg,                                         =
 \
> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6392_volt_table_ops,                         =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .id =3D MT6392_ID_##vreg,                                =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D ARRAY_SIZE(ldo_volt_table),              =
 \
> +               .volt_table =3D ldo_volt_table,                          =
 \
> +               .vsel_reg =3D vosel,                                     =
 \
> +               .vsel_mask =3D vosel_mask,                               =
 \
> +               .enable_reg =3D enreg,                                   =
 \
> +               .enable_mask =3D BIT(enbit),                             =
 \
> +               .enable_time =3D entime,                                 =
 \
> +       },                                                              \
> +       .qi =3D BIT(15),                                                 =
 \
> +       .modeset_reg =3D _modeset_reg,                                   =
 \
> +       .modeset_mask =3D _modeset_mask,                                 =
 \
> +}
> +
> +#define MT6392_LDO_LINEAR(match, vreg, min, max, step, volt_ranges,    \
> +               enreg, enbit, vosel, vosel_mask, _modeset_reg,          \
> +               _modeset_mask, entime)                                  \
> +[MT6392_ID_##vreg] =3D {                                                =
 \
> +       .desc =3D {                                                      =
 \
> +               .name =3D #vreg,                                         =
 \
> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6392_volt_ldo_range_ops,                     =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .id =3D MT6392_ID_##vreg,                                =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D ((max) - (min)) / (step) + 1,            =
 \
> +               .linear_ranges =3D volt_ranges,                          =
 \
> +               .n_linear_ranges =3D ARRAY_SIZE(volt_ranges),            =
 \
> +               .vsel_reg =3D vosel,                                     =
 \
> +               .vsel_mask =3D vosel_mask,                               =
 \
> +               .enable_reg =3D enreg,                                   =
 \
> +               .enable_mask =3D BIT(enbit),                             =
 \
> +               .enable_time =3D entime,                                 =
 \
> +       },                                                              \
> +       .qi =3D BIT(15),                                                 =
 \
> +       .modeset_reg =3D _modeset_reg,                                   =
 \
> +       .modeset_mask =3D _modeset_mask,                                 =
 \
> +}
> +
> +#define MT6392_REG_FIXED(match, vreg, enreg, enbit, volt,              \
> +               _modeset_reg, _modeset_mask, entime)                    \
> +[MT6392_ID_##vreg] =3D {                                                =
 \
> +       .desc =3D {                                                      =
 \
> +               .name =3D #vreg,                                         =
 \
> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6392_volt_fixed_ops,                         =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .id =3D MT6392_ID_##vreg,                                =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D 1,                                       =
 \
> +               .enable_reg =3D enreg,                                   =
 \
> +               .enable_mask =3D BIT(enbit),                             =
 \
> +               .enable_time =3D entime,                                 =
 \
> +               .min_uV =3D volt,                                        =
 \
> +       },                                                              \
> +       .qi =3D BIT(15),                                                 =
 \
> +       .modeset_reg =3D _modeset_reg,                                   =
 \
> +       .modeset_mask =3D _modeset_mask,                                 =
 \
> +}
> +
> +#define MT6392_REG_FIXED_NO_MODE(match, vreg, enreg, enbit, volt,      \
> +       entime)                                                         \
> +[MT6392_ID_##vreg] =3D {                                                =
 \
> +       .desc =3D {                                                      =
 \
> +               .name =3D #vreg,                                         =
 \
> +               .of_match =3D of_match_ptr(match),                       =
 \
> +               .ops =3D &mt6392_volt_fixed_no_mode_ops,                 =
 \
> +               .type =3D REGULATOR_VOLTAGE,                             =
 \
> +               .id =3D MT6392_ID_##vreg,                                =
 \
> +               .owner =3D THIS_MODULE,                                  =
 \
> +               .n_voltages =3D 1,                                       =
 \
> +               .enable_reg =3D enreg,                                   =
 \
> +               .enable_mask =3D BIT(enbit),                             =
 \
> +               .enable_time =3D entime,                                 =
 \
> +               .min_uV =3D volt,                                        =
 \
> +       },                                                              \
> +       .qi =3D BIT(15),                                                 =
 \
> +}
> +
> +static const struct linear_range buck_volt_range1[] =3D {
> +       REGULATOR_LINEAR_RANGE(700000, 0, 0x7f, 6250),
> +};
> +
> +static const struct linear_range buck_volt_range2[] =3D {
> +       REGULATOR_LINEAR_RANGE(1400000, 0, 0x7f, 12500),
> +};
> +
> +static const u32 ldo_volt_table1[] =3D {
> +       1800000, 1900000, 2000000, 2200000,
> +};
> +
> +static const struct linear_range ldo_volt_range2[] =3D {
> +       REGULATOR_LINEAR_RANGE(3300000, 0, 3, 100000),
> +};
> +
> +static const u32 ldo_volt_table3[] =3D {
> +       1800000, 3300000,
> +};
> +
> +static const u32 ldo_volt_table4[] =3D {
> +       3000000, 3300000,
> +};
> +
> +static const u32 ldo_volt_table5[] =3D {
> +       1200000, 1300000, 1500000, 1800000, 2000000, 2800000, 3000000, 33=
00000,
> +};
> +
> +static const u32 ldo_volt_table6[] =3D {
> +       1240000, 1390000,
> +};
> +
> +static const u32 ldo_volt_table7[] =3D {
> +       1200000, 1300000, 1500000, 1800000,
> +};
> +
> +static const u32 ldo_volt_table8[] =3D {
> +       1800000, 2000000,
> +};

If this PMIC is anything like the MT6358, then it has 0.01V fine
tuning for most if not all the LDOs. It is sometimes needed as
a rail may have a 0.04V boost that would otherwise be invisible
to the system. And then if you have something like 3.04V set in
the DT constraints, you end up with something the regulator driver
doesn't support, but the hardware does.

Please see how it's done in the MT6358 driver. I spent a lot of
time on that driver to make it actually support the full range
of voltages, and describing the supplies.


ChenYu

