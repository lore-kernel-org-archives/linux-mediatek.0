Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1B8C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 04:42:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28AD1206C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 04:42:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CVkVZPsy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HGBJD5Fa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28AD1206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MzZwlhQWQJSSOf2jQdw0JYlvjKsxFIBmcymR49If1YI=; b=CVkVZPsy5zZUMMRkwSmIwqch0
	Vov8BegQi0jNfFfh+AYeQpBublaLyQ44JqsiM45xCgkDJXg0E9n+2LMR49kwFcb9JwCk6czelDn8t
	tbGtYSCapbSmmxLeqr9gU+GISogQBWk03JZuN5pF9Q8Op4WOMT763mRYlhsV0GnMorgFlM61QuOzH
	JUZL6v2N4Aj5OYvOzryAfyPDedGOxEdbbtXOslatpeEKIpSDOQn47haHAQ3az0XluBi6Rs48DeAuv
	mRyLmX26+jQa2E5VALmx5VmdOdzBDDjsi4LhIoRCDMxcE2dgtKYiBRl/EN0+1S+iSEC7V4ay8/DZ4
	G9ScQ+jtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kchxU-0002TF-Kd; Wed, 11 Nov 2020 04:42:12 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kchxP-0002Rq-Nj
 for linux-mediatek@lists.infradead.org; Wed, 11 Nov 2020 04:42:09 +0000
Received: by mail-vs1-xe43.google.com with SMTP id t8so465966vsr.2
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Nov 2020 20:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uq0/gtXGmY5EFPumW1VxsU0BHSQwv3vHBzntPQkcyDc=;
 b=HGBJD5Fa6GMKIJUIuyMNV4fSci0zJTRwsQtPmXkQqK0TYRfcrxecT45EZUMSAmP6Po
 DgD1gWgcKRZ4brVdJOlfCXa1ptjdll0UAA5Mng2JluCDwluo2nkssM68AcPniRf3Lm/8
 xZ6iUYJeQNnsdP2Qh9y8Nlx+HMfbiLqxXuM44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uq0/gtXGmY5EFPumW1VxsU0BHSQwv3vHBzntPQkcyDc=;
 b=B6x1BK69hSDafgptpDn+2j0UWdsswdGosTDK6J/BywNvYqBHEbuRWnTbZnBAmhv9Tj
 YxZ+Mp5oda80ABZarhILonpWtDcF3UuHe7/zf91crS02es7TGMuIIJ6UnFTmdwNNcksh
 MfOjMe2kt6KZguR9F2MeW8YipdJe+7zHsETHCndsA7kRCcJ5LTMD7jtwGVIiXgQiIGK6
 OHZMoTIGP1V1OYeBtYLE8mwCphKkREDl0EwaPAsgspDE+jnaW5mPauNe79+jaOjb2ctp
 MvOhtLT2jHIpFqzFucVtoDSHK89+vrPm22aEYer5N3Ecer/RCARTtlO/z4iXVsiTj+7d
 KHig==
X-Gm-Message-State: AOAM5334r/m+Jm9C4aDliMknxPlmAXmlmIJV3DxINTdDGK2HWueTUgTx
 k1ALAL5OgqWnrdUpdCOaC291bDHB6ZuVHG2B1r8t+Q==
X-Google-Smtp-Source: ABdhPJy9MtCH4Ak6uIOsUrA8MOQzu4SHd9p7QjidANIfNnJk8pohpsTmQWYPUF074ydWf4w8W5QqT8XKYVgAFPtYCJI=
X-Received: by 2002:a67:f403:: with SMTP id p3mr14329636vsn.16.1605069724253; 
 Tue, 10 Nov 2020 20:42:04 -0800 (PST)
MIME-Version: 1.0
References: <1603187810-30481-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1603187810-30481-4-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1603187810-30481-4-git-send-email-hsin-hsiung.wang@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 11 Nov 2020 12:41:53 +0800
Message-ID: <CANMq1KDKx8g5T0vUnc2jybc0MtiEyssZ1s8jModEE25WWkS+DQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] regulator: mt6315: Add support for MT6315 regulator
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_234207_867341_29CCDCE8 
X-CRM114-Status: GOOD (  28.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A number of comments, we might need another pass after you address
Rob's comments too.

On Tue, Oct 20, 2020 at 5:57 PM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> The MT6315 is a regulator found on boards based on MediaTek MT8192 and
> probably other SoCs. It connects as a slave to SoC using SPMI.
>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/regulator/Kconfig                  |  10 +
>  drivers/regulator/Makefile                 |   1 +
>  drivers/regulator/mt6315-regulator.c       | 364 +++++++++++++++++++++
>  include/linux/regulator/mt6315-regulator.h |  37 +++
>  4 files changed, 412 insertions(+)
>  create mode 100644 drivers/regulator/mt6315-regulator.c
>  create mode 100644 include/linux/regulator/mt6315-regulator.h
>
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index de17ef7e18f0..59544918034e 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -693,6 +693,16 @@ config REGULATOR_MT6311
>           This driver supports the control of different power rails of device
>           through regulator interface.
>
> +config REGULATOR_MT6315
> +       tristate "MediaTek MT6315 PMIC"
> +       depends on SPMI
> +       select REGMAP_SPMI
> +       help
> +         Say y here to select this option to enable the power regulator of
> +         MediaTek MT6315 PMIC.
> +         This driver supports the control of different power rails of device
> +         through regulator interface.
> +
>  config REGULATOR_MT6323
>         tristate "MediaTek MT6323 PMIC"
>         depends on MFD_MT6397
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index d8d3ecf526a8..5488e563c60a 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -86,6 +86,7 @@ obj-$(CONFIG_REGULATOR_MP8859) += mp8859.o
>  obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
>  obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
>  obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6323) += mt6323-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6358) += mt6358-regulator.o
>  obj-$(CONFIG_REGULATOR_MT6380) += mt6380-regulator.o
> diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
> new file mode 100644
> index 000000000000..8e3accb2e36f
> --- /dev/null
> +++ b/drivers/regulator/mt6315-regulator.c
> @@ -0,0 +1,364 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2020 MediaTek Inc.
> +
> +#include <dt-bindings/regulator/mtk,mt6315.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/mt6315-regulator.h>
> +#include <linux/regulator/of_regulator.h>
> +#include <linux/spmi.h>
> +
> +#define MT6315_REG_WIDTH       8
> +
> +#define MT6315_BUCK_MODE_AUTO          0
> +#define MT6315_BUCK_MODE_FORCE_PWM     1
> +#define MT6315_BUCK_MODE_LP            2
> +
> +struct mt6315_regulator_info {
> +       struct regulator_desc desc;
> +       u32 da_vsel_reg;
> +       u32 da_reg;
> +       u32 lp_mode_reg;

Always MT6315_BUCK_TOP_CON1, do you really need a field for that?

> +       u32 lp_mode_mask;
> +       u32 lp_mode_shift;
> +       u32 modeset_reg;

ditto, always MT6315_BUCK_TOP_4PHASE_ANA_CON42.

> +       u32 qi;

qi always seems to be BIT(0), do you really need this field?

If so, please use a better name than qi (I'm not sure what that means).

> +};
> +
> +struct mt_regulator_init_data {
> +       const struct mt6315_regulator_info *regulator_info;
> +       u32 modeset_mask[MT6315_VBUCK_MAX];
> +};
> +
> +struct mt6315_chip {
> +       struct device *dev;
> +       struct regmap *regmap;
> +};
> +
> +#define MT_BUCK(_name, _bid, _vsel)                            \
> +[_bid] = {                                                     \
> +       .desc = {                                               \
> +               .name = _name,                                  \
> +               .of_match = of_match_ptr(_name),                \
> +               .regulators_node = "regulators",                \
> +               .ops = &mt6315_volt_range_ops,                  \
> +               .type = REGULATOR_VOLTAGE,                      \
> +               .id = _bid,                                     \
> +               .owner = THIS_MODULE,                           \
> +               .n_voltages = 0xbf,                             \
> +               .linear_ranges = mt_volt_range1,                \
> +               .n_linear_ranges = ARRAY_SIZE(mt_volt_range1),  \
> +               .vsel_reg = _vsel,                              \
> +               .vsel_mask = 0xff,                              \
> +               .enable_reg = MT6315_BUCK_TOP_CON0,             \
> +               .enable_mask = BIT(_bid - 1),                   \
> +               .of_map_mode = mt6315_map_mode,                 \
> +       },                                                      \
> +       .da_vsel_reg = _bid##_DBG0,                             \
> +       .da_reg = _bid##_DBG4,                                  \
> +       .lp_mode_reg = MT6315_BUCK_TOP_CON1,                    \
> +       .lp_mode_mask = BIT(_bid - 1),                          \
> +       .lp_mode_shift = _bid - 1,                              \
> +       .modeset_reg = MT6315_BUCK_TOP_4PHASE_ANA_CON42,        \
> +       .qi = BIT(0),                                           \
> +}
> +
> +static const struct linear_range mt_volt_range1[] = {
> +       REGULATOR_LINEAR_RANGE(0, 0, 0xbf, 6250),
> +};
> +
> +static unsigned int mt6315_map_mode(u32 mode)
> +{
> +       switch (mode) {
> +       case MT6315_BUCK_MODE_AUTO:
> +               return REGULATOR_MODE_NORMAL;
> +       case MT6315_BUCK_MODE_FORCE_PWM:
> +               return REGULATOR_MODE_FAST;
> +       case MT6315_BUCK_MODE_LP:
> +               return REGULATOR_MODE_IDLE;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static int mt6315_regulator_get_voltage_sel(struct regulator_dev *rdev)
> +{
> +       struct mt_regulator_init_data *init = rdev_get_drvdata(rdev);
> +       const struct mt6315_regulator_info *info;
> +       int ret, reg_addr, reg_val = 0, reg_en = 0;
> +
> +       info = &init->regulator_info[rdev_get_id(rdev)];
> +       ret = regmap_read(rdev->regmap, info->da_reg, &reg_en);
> +       if (ret != 0) {
> +               dev_notice(&rdev->dev, "Failed to get enable reg: %d\n", ret);
> +               return ret;
> +       }
> +
> +       if (reg_en & info->qi)
> +               reg_addr = info->da_vsel_reg;
> +       else
> +               reg_addr = rdev->desc->vsel_reg;
> +
> +       ret = regmap_read(rdev->regmap, reg_addr, &reg_val);
> +       if (ret != 0) {
> +               dev_notice(&rdev->dev, "Failed to get voltage: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret = reg_val & rdev->desc->vsel_mask;
> +       return ret;
> +}
> +
> +static unsigned int mt6315_regulator_get_mode(struct regulator_dev *rdev)
> +{
> +       struct mt_regulator_init_data *init = rdev_get_drvdata(rdev);
> +       const struct mt6315_regulator_info *info;
> +       int ret = 0, regval = 0;
> +       u32 modeset_mask;
> +
> +       info = &init->regulator_info[rdev_get_id(rdev)];
> +       modeset_mask = init->modeset_mask[rdev_get_id(rdev)];
> +       ret = regmap_read(rdev->regmap, info->modeset_reg, &regval);
> +       if (ret != 0) {
> +               dev_notice(&rdev->dev, "Failed to get mode: %d\n", ret);
> +               return ret;
> +       }
> +
> +       if ((regval & modeset_mask) == modeset_mask)
> +               return REGULATOR_MODE_FAST;
> +
> +       ret = regmap_read(rdev->regmap, info->lp_mode_reg, &regval);
> +       if (ret != 0) {
> +               dev_notice(&rdev->dev, "Failed to get lp mode: %d\n", ret);
> +               return ret;
> +       }
> +
> +       if (regval & info->lp_mode_mask)
> +               return REGULATOR_MODE_IDLE;
> +       else
> +               return REGULATOR_MODE_NORMAL;
> +}
> +
> +static int mt6315_regulator_set_mode(struct regulator_dev *rdev,
> +                                    u32 mode)
> +{
> +       struct mt_regulator_init_data *init = rdev_get_drvdata(rdev);
> +       const struct mt6315_regulator_info *info;
> +       int ret = 0

No need to set ret to 0 (it allows the compiler to figure out that ret
is set in all paths, which is good).

, val, curr_mode;
> +       u32 modeset_mask;
> +
> +       info = &init->regulator_info[rdev_get_id(rdev)];
> +       modeset_mask = init->modeset_mask[rdev_get_id(rdev)];
> +       curr_mode = mt6315_regulator_get_mode(rdev);
> +       switch (mode) {
> +       case REGULATOR_MODE_FAST:
> +               ret = regmap_update_bits(rdev->regmap,
> +                                        info->modeset_reg,
> +                                        modeset_mask,
> +                                        modeset_mask);
> +               break;
> +       case REGULATOR_MODE_NORMAL:
> +               if (curr_mode == REGULATOR_MODE_FAST) {
> +                       ret = regmap_update_bits(rdev->regmap,
> +                                                info->modeset_reg,
> +                                                modeset_mask,
> +                                                0);
> +               } else if (curr_mode == REGULATOR_MODE_IDLE) {
> +                       ret = regmap_update_bits(rdev->regmap,
> +                                                info->lp_mode_reg,
> +                                                info->lp_mode_mask,
> +                                                0);
> +                       usleep_range(100, 110);
> +               }
> +               break;
> +       case REGULATOR_MODE_IDLE:
> +               val = MT6315_BUCK_MODE_LP >> 1;
> +               val <<= info->lp_mode_shift;
> +               ret = regmap_update_bits(rdev->regmap,
> +                                        info->lp_mode_reg,
> +                                        info->lp_mode_mask,
> +                                        val);
> +               break;
> +       default:
> +               ret = -EINVAL;
> +               goto err_mode;

Not needed, just break and let it continue.

> +       }
> +
> +err_mode:
> +       if (ret != 0) {
> +               dev_notice(&rdev->dev, "Failed to set mode: %d\n", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static int mt6315_get_status(struct regulator_dev *rdev)
> +{
> +       struct mt_regulator_init_data *init = rdev_get_drvdata(rdev);
> +       const struct mt6315_regulator_info *info;
> +       int ret = 0;

No need to set to 0.

> +       u32 regval = 0;
> +
> +       info = &init->regulator_info[rdev_get_id(rdev)];
> +       ret = regmap_read(rdev->regmap, info->da_reg, &regval);
> +       if (ret != 0) {

< 0 ? Just want to make sure we don't accidentally return a positive value.

> +               dev_notice(&rdev->dev, "Failed to get enable reg: %d\n", ret);
> +               return ret;
> +       }
> +
> +       return (regval & info->qi) ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
> +}
> +
> +static const struct regulator_ops mt6315_volt_range_ops = {
> +       .list_voltage = regulator_list_voltage_linear_range,
> +       .map_voltage = regulator_map_voltage_linear_range,
> +       .set_voltage_sel = regulator_set_voltage_sel_regmap,
> +       .get_voltage_sel = mt6315_regulator_get_voltage_sel,
> +       .set_voltage_time_sel = regulator_set_voltage_time_sel,
> +       .enable = regulator_enable_regmap,
> +       .disable = regulator_disable_regmap,
> +       .is_enabled = regulator_is_enabled_regmap,
> +       .get_status = mt6315_get_status,
> +       .set_mode = mt6315_regulator_set_mode,
> +       .get_mode = mt6315_regulator_get_mode,
> +};
> +
> +static const struct mt6315_regulator_info mt6315_regulators[MT6315_VBUCK_MAX] = {
> +       MT_BUCK("vbuck1", MT6315_VBUCK1, MT6315_BUCK_TOP_ELR0),
> +       MT_BUCK("vbuck2", MT6315_VBUCK2, MT6315_BUCK_TOP_ELR2),
> +       MT_BUCK("vbuck3", MT6315_VBUCK3, MT6315_BUCK_TOP_ELR4),
> +       MT_BUCK("vbuck4", MT6315_VBUCK4, MT6315_BUCK_TOP_ELR6),
> +};
> +
> +static const struct regmap_config mt6315_regmap_config = {
> +       .reg_bits       = 16,
> +       .val_bits       = 8,
> +       .max_register   = 0x16d0,
> +       .fast_io        = true,
> +};
> +
> +static const struct of_device_id mt6315_of_match[] = {
> +       {
> +               .compatible = "mediatek,mt6315_3-regulator",
> +       }, {
> +               .compatible = "mediatek,mt6315_6-regulator",
> +       }, {
> +               .compatible = "mediatek,mt6315_7-regulator",

Rob already commented on the binding, but I don't think you need 3
compatibles if you don't do anything different for any of them.

(and as I highlighted before, the compatible name should, IMHO, be the
part number, not the address)

> +       }, {
> +               /* sentinel */
> +       },
> +};
> +MODULE_DEVICE_TABLE(of, mt6315_of_match);
> +
> +static void mt6315_parsing_dt(struct regulator_dev *rdev

mt6315_parse_dt

Or maybe mt6315_parse_vbuck_dt since this acts on a single regulator/buck?

> , u32 *arr)

u32 *used_vbuck_list

> +{
> +       struct device_node *np;
> +       struct mt_regulator_init_data *init = rdev_get_drvdata(rdev);
> +       u32 buck_id, *modeset;
> +       int i, icount;

combined_count?

> +
> +       np = rdev->dev.of_node;
> +       if (!np)
> +               return;
> +
> +       icount = of_property_count_elems_of_size(np, "mtk,combined-regulator", sizeof(u32));
> +       if (icount <= 0)
> +               return;
> +
> +       modeset = &init->modeset_mask[rdev_get_id(rdev)];

That's not super readable IMHO.

I'd just

int main_id = rdev_get_id(rdev);
then
init->modeset_mask[main_id] |= BIT(buck_id - 1);

> +       for (i = 0; i < icount; i++) {
> +               if (of_property_read_u32_index(np, "mtk,combined-regulator", i, &buck_id))
> +                       return;
> +
> +               if (buck_id < MT6315_VBUCK_MAX) {
> +                       /* white list */

/* mark as used */

> +                       *(arr + buck_id) = 1;

used_vbuck_list[buck_id] = 1;

And maybe first check that used_vbuck_list[buck_id] == 0?

> +                       /* add modeset bit of combined-regulator */
> +                       *modeset += BIT(buck_id - 1);

|=

> +               }
> +       }
> +}
> +
> +static int mt6315_regulator_probe(struct spmi_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct regmap *regmap;
> +       struct mt6315_chip *chip;
> +       struct mt_regulator_init_data *init_data;
> +       struct regulator_config config = {};
> +       struct regulator_dev *rdev;
> +       int i;
> +       u32 mt6315_dt_list[MT6315_VBUCK_MAX] = {0};

used_vbuck_list

> +
> +       regmap = devm_regmap_init_spmi_ext(pdev, &mt6315_regmap_config);
> +       if (!regmap)
> +               return -ENODEV;
> +
> +       chip = devm_kzalloc(dev, sizeof(struct mt6315_chip), GFP_KERNEL);
> +       if (!chip)
> +               return -ENOMEM;
> +
> +       init_data = devm_kzalloc(dev, sizeof(struct mt_regulator_init_data), GFP_KERNEL);
> +       if (!init_data)
> +               return -ENOMEM;
> +
> +       chip->dev = dev;
> +       chip->regmap = regmap;
> +       dev_set_drvdata(dev, chip);
> +
> +       config.dev = dev;
> +       config.regmap = regmap;
> +       init_data->regulator_info = mt6315_regulators;
> +       for (i = MT6315_VBUCK1; i < MT6315_VBUCK_MAX; i++) {
> +               if (mt6315_dt_list[i])
> +                       continue;
> +
> +               init_data->modeset_mask[i] = 1 << (i - 1);
> +               config.driver_data = init_data;
> +               rdev = devm_regulator_register(dev, &mt6315_regulators[i].desc, &config);
> +               if (IS_ERR(rdev)) {
> +                       dev_notice(dev, "Failed to register %s\n", mt6315_regulators[i].desc.name);
> +                       continue;
> +               }
> +               mt6315_parsing_dt(rdev, mt6315_dt_list);
> +       }
> +       return 0;
> +}
> +
> +static void mt6315_regulator_shutdown(struct spmi_device *pdev)
> +{
> +       struct mt6315_chip *chip = dev_get_drvdata(&pdev->dev);
> +       int ret = 0;
> +
> +       ret |= regmap_write(chip->regmap, MT6315_TOP_TMA_KEY_H, PROTECTION_KEY_H);
> +       ret |= regmap_write(chip->regmap, MT6315_TOP_TMA_KEY, PROTECTION_KEY);
> +       ret |= regmap_update_bits(chip->regmap, MT6315_TOP2_ELR7, 1, 1);
> +       ret |= regmap_write(chip->regmap, MT6315_TOP_TMA_KEY, 0);
> +       ret |= regmap_write(chip->regmap, MT6315_TOP_TMA_KEY_H, 0);
> +       if (ret < 0)
> +               dev_notice(&pdev->dev, "[%#x] Failed to enable power off sequence. %d\n",
> +                          pdev->usid, ret);
> +}
> +
> +static struct spmi_driver mt6315_regulator_driver = {
> +       .driver         = {
> +               .name   = "mt6315-regulator",
> +               .of_match_table = mt6315_of_match,
> +       },
> +       .probe = mt6315_regulator_probe,
> +       .shutdown = mt6315_regulator_shutdown,
> +};
> +
> +module_spmi_driver(mt6315_regulator_driver);
> +
> +MODULE_AUTHOR("Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>");
> +MODULE_DESCRIPTION("Regulator Driver for MediaTek MT6315 PMIC");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/regulator/mt6315-regulator.h b/include/linux/regulator/mt6315-regulator.h
> new file mode 100644
> index 000000000000..4b3bd172cba1
> --- /dev/null
> +++ b/include/linux/regulator/mt6315-regulator.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + */
> +
> +#ifndef __LINUX_REGULATOR_MT6315_H
> +#define __LINUX_REGULATOR_MT6315_H
> +
> +#define MT6315_SLAVE_ID_3      3
> +#define MT6315_SLAVE_ID_6      6
> +#define MT6315_SLAVE_ID_7      7
> +
> +/* Register */
> +#define MT6315_SWCID_H                         0xb
> +#define MT6315_TOP2_ELR7                       0x139
> +#define MT6315_TOP_TMA_KEY                     0x39f
> +#define MT6315_TOP_TMA_KEY_H                   0x3a0
> +#define MT6315_BUCK_TOP_CON0                   0x1440
> +#define MT6315_BUCK_TOP_CON1                   0x1443
> +#define MT6315_BUCK_TOP_ELR0                   0x1449
> +#define MT6315_BUCK_TOP_ELR2                   0x144b
> +#define MT6315_BUCK_TOP_ELR4                   0x144d
> +#define MT6315_BUCK_TOP_ELR6                   0x144f
> +#define MT6315_VBUCK1_DBG0                     0x1499
> +#define MT6315_VBUCK1_DBG4                     0x149d
> +#define MT6315_VBUCK2_DBG0                     0x1519
> +#define MT6315_VBUCK2_DBG4                     0x151d
> +#define MT6315_VBUCK3_DBG0                     0x1599
> +#define MT6315_VBUCK3_DBG4                     0x159d
> +#define MT6315_VBUCK4_DBG0                     0x1619
> +#define MT6315_VBUCK4_DBG4                     0x161d
> +#define MT6315_BUCK_TOP_4PHASE_ANA_CON42       0x16b1
> +
> +#define PROTECTION_KEY_H                       0x9C
> +#define PROTECTION_KEY                         0xEA
> +
> +#endif /* __LINUX_REGULATOR_MT6315_H */
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
