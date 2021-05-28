Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC434C4708C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 09:48:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60606613C9
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 09:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60606613C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SgOLn4cMFF8R0IFWB7l8LZSMENUCnv+M/xc/ugNOaRA=; b=c/b0PLcekXMnLm
	k4pHoq5yVNiElsrrRuqLH/YYJsVUMkbQ9y5G29SnqROI3Na/n7gmvyyeD+758zSi7+7XRo0gXAW9U
	dPSc7aqfv5x2IjZXeV5f8xd5UHDYhv9vaEiXrpN3sJMXd0llbeRZFYDeY0KlN6RZtXHv9PTDeWhpH
	OaRDQRh5P2xG1INHOS/Rq4JkspPjsgiD7YkORnfwNLhT2/TwslPatDFhmuwETd8xba034QqCspbWs
	F5EznILLaOLQFvVG2aootX/Cd+VNpnlNQtxwyu5RZQWMJX4zzDbsES5rBrCvFNEH9PqGRf5P+Glg+
	cQb95IxNgVs7Q2A6KSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmZ61-00E5dg-M7; Fri, 28 May 2021 09:48:01 +0000
Received: from mail-lj1-f179.google.com ([209.85.208.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmZ5X-00E5QJ-DO; Fri, 28 May 2021 09:47:33 +0000
Received: by mail-lj1-f179.google.com with SMTP id 131so4494374ljj.3;
 Fri, 28 May 2021 02:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
 :in-reply-to:references:mime-version:date:user-agent
 :content-transfer-encoding;
 bh=HMAlHDj4ePTErDvM0hFu599gQzGsMX29bYVJGj9PGdM=;
 b=GxjcYhDqpgH0n0af/QTg+eDDhlGkxPTk1jpHIAt3nBFl8Rze3KH5F+WS0OzlO5ScL9
 Wt+ogvJ9iyTxe5fph7eSaU34k+aehruPeu2Bop7PssBwkJFibxnyf+Mw+38tQgntEmzj
 maEkSMj/9bEUlwXbWCtGQmw6FF63iPFD4NhPbormR5vWHJ/YeKqSM+0SJzOI92yFgKYN
 B0+ysPjScBgd9L0qqoagTLpVks/G/Q8NcVpaB5AifZ8F605H4d0znZ/mkboEc5lYPixp
 mTHYDHVyiYIcTvFhERpZTdCSbIxBnwc4kSr9p64yoHxvk0Henp71zjoTVF78o7WsPB3J
 cA6g==
X-Gm-Message-State: AOAM5307a0PqP3E1zkx5kcuwfWO+3/TZdhmbIs5vr2pDfjTRKrqM+SrS
 e+nrkbpkfYuvPi3xLV0YmSOrrjtNBVc=
X-Google-Smtp-Source: ABdhPJx5UI8BwO677/8LjhpF0F1mlGB1lMmMD33y+3ZEJAqXXoXKW4yZWqVVYq6GlYepitZ3nmUSGA==
X-Received: by 2002:a2e:a314:: with SMTP id l20mr5692054lje.167.1622195248496; 
 Fri, 28 May 2021 02:47:28 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi
 (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
 by smtp.gmail.com with ESMTPSA id e17sm507442ljl.73.2021.05.28.02.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:47:28 -0700 (PDT)
Message-ID: <62cdd2d18839e16686f35f0cf08080e2cb3b1768.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v5 3/3] power: supply: mt6360_charger: add MT6360
 charger support
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: Gene Chen <gene.chen.richtek@gmail.com>, sre@kernel.org, 
 matthias.bgg@gmail.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org, 
 inux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com, 
 shufan_lee@richtek.com, cy_huang@richtek.com, benjamin.chao@mediatek.com
In-Reply-To: <20210528081300.64759-4-gene.chen.richtek@gmail.com>
References: <20210528081300.64759-1-gene.chen.richtek@gmail.com>
 <20210528081300.64759-4-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Date: Fri, 28 May 2021 12:47:21 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_024731_510069_53C5057E 
X-CRM114-Status: GOOD (  23.57  )
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
Reply-To: matti.vaittinen@fi.rohmeurope.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Fri, 2021-05-28 at 16:13 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add basic support for the battery charger for MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  drivers/power/supply/Kconfig          |  11 +
>  drivers/power/supply/Makefile         |   1 +
>  drivers/power/supply/mt6360_charger.c | 856
> ++++++++++++++++++++++++++
>  3 files changed, 868 insertions(+)
>  create mode 100644 drivers/power/supply/mt6360_charger.c
> 
> diff --git a/drivers/power/supply/Kconfig
> b/drivers/power/supply/Kconfig
> index e696364126f1..3257b1ad5e36 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -577,6 +577,17 @@ config CHARGER_MP2629
>  	  Battery charger. This driver provides Battery charger power
> management
>  	  functions on the systems.
>  
> +config CHARGER_MT6360
> +	tristate "Mediatek MT6360 Charger Driver"
> +	depends on MFD_MT6360
> +	depends on REGULATOR
> +	select LINEAR_RANGES
> +	help
> +	  Say Y here to enable MT6360 Charger Part.
> +	  The device supports High-Accuracy Voltage/Current Regulation,
> +	  Average Input Current Regulation, Battery Tempature Sensing,
> +	  Over-Temperature Protection, DPDM Detection for BC1.2
> +
>  config CHARGER_QCOM_SMBB
>  	tristate "Qualcomm Switch-Mode Battery Charger and Boost"
>  	depends on MFD_SPMI_PMIC || COMPILE_TEST
> diff --git a/drivers/power/supply/Makefile
> b/drivers/power/supply/Makefile
> index a7309a3d1a47..5317fe787149 100644
> --- a/drivers/power/supply/Makefile
> +++ b/drivers/power/supply/Makefile
> @@ -78,6 +78,7 @@ obj-$(CONFIG_CHARGER_MAX77693)	+=
> max77693_charger.o
>  obj-$(CONFIG_CHARGER_MAX8997)	+= max8997_charger.o
>  obj-$(CONFIG_CHARGER_MAX8998)	+= max8998_charger.o
>  obj-$(CONFIG_CHARGER_MP2629)	+= mp2629_charger.o
> +obj-$(CONFIG_CHARGER_MT6360)	+= mt6360_charger.o
>  obj-$(CONFIG_CHARGER_QCOM_SMBB)	+= qcom_smbb.o
>  obj-$(CONFIG_CHARGER_BQ2415X)	+= bq2415x_charger.o
>  obj-$(CONFIG_CHARGER_BQ24190)	+= bq24190_charger.o
> diff --git a/drivers/power/supply/mt6360_charger.c
> b/drivers/power/supply/mt6360_charger.c
> new file mode 100644
> index 000000000000..07fa0b3870e0
> --- /dev/null
> +++ b/drivers/power/supply/mt6360_charger.c
> @@ -0,0 +1,856 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/linear_range.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/power_supply.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>
> +
> +#define MT6360_PMU_CHG_CTRL1	0x311
> +#define MT6360_PMU_CHG_CTRL2	0x312
> +#define MT6360_PMU_CHG_CTRL3	0x313
> +#define MT6360_PMU_CHG_CTRL4	0x314
> +#define MT6360_PMU_CHG_CTRL5	0x315
> +#define MT6360_PMU_CHG_CTRL6	0x316
> +#define MT6360_PMU_CHG_CTRL7	0x317
> +#define MT6360_PMU_CHG_CTRL8	0x318
> +#define MT6360_PMU_CHG_CTRL9	0x319
> +#define MT6360_PMU_CHG_CTRL10	0x31A
> +#define MT6360_PMU_DEVICE_TYPE	0x322
> +#define MT6360_PMU_USB_STATUS1	0x327
> +#define MT6360_PMU_CHG_STAT	0x34A
> +#define MT6360_PMU_CHG_CTRL19	0x361
> +#define MT6360_PMU_FOD_STAT	0x3E7
> +
> +/* MT6360_PMU_CHG_CTRL1 */
> +#define MT6360_FSLP_SHFT	(3)
> +#define MT6360_FSLP_MASK	BIT(MT6360_FSLP_SHFT)
> +#define MT6360_OPA_MODE_SHFT	(0)
> +#define MT6360_OPA_MODE_MASK	BIT(MT6360_OPA_MODE_SHFT)
> +/* MT6360_PMU_CHG_CTRL2 */
> +#define MT6360_IINLMTSEL_SHFT	(2)
> +#define MT6360_IINLMTSEL_MASK	GENMASK(3, 2)
> +/* MT6360_PMU_CHG_CTRL3 */
> +#define MT6360_IAICR_SHFT	(2)
> +#define MT6360_IAICR_MASK	GENMASK(7, 2)
> +#define MT6360_ILIM_EN_MASK	BIT(0)
> +/* MT6360_PMU_CHG_CTRL4 */
> +#define MT6360_VOREG_SHFT	(1)
> +#define MT6360_VOREG_MASK	GENMASK(7, 1)
> +/* MT6360_PMU_CHG_CTRL5 */
> +#define MT6360_VOBST_MASK	GENMASK(7, 2)
> +/* MT6360_PMU_CHG_CTRL6 */
> +#define MT6360_VMIVR_SHFT      (1)
> +#define MT6360_VMIVR_MASK      GENMASK(7, 1)
> +/* MT6360_PMU_CHG_CTRL7 */
> +#define MT6360_ICHG_SHFT	(2)
> +#define MT6360_ICHG_MASK	GENMASK(7, 2)
> +/* MT6360_PMU_CHG_CTRL8 */
> +#define MT6360_IPREC_SHFT	(0)
> +#define MT6360_IPREC_MASK	GENMASK(3, 0)
> +/* MT6360_PMU_CHG_CTRL9 */
> +#define MT6360_IEOC_SHFT	(4)
> +#define MT6360_IEOC_MASK	GENMASK(7, 4)
> +/* MT6360_PMU_CHG_CTRL10 */
> +#define MT6360_OTG_OC_MASK	GENMASK(3, 0)
> +/* MT6360_PMU_DEVICE_TYPE */
> +#define MT6360_USBCHGEN_MASK	BIT(7)
> +/* MT6360_PMU_USB_STATUS1 */
> +#define MT6360_USB_STATUS_SHFT	(4)
> +#define MT6360_USB_STATUS_MASK	GENMASK(6, 4)
> +/* MT6360_PMU_CHG_STAT */
> +#define MT6360_CHG_STAT_SHFT	(6)
> +#define MT6360_CHG_STAT_MASK	GENMASK(7, 6)
> +#define MT6360_VBAT_LVL_MASK	BIT(5)
> +/* MT6360_PMU_CHG_CTRL19 */
> +#define MT6360_VINOVP_SHFT	(5)
> +#define MT6360_VINOVP_MASK	GENMASK(6, 5)
> +/* MT6360_PMU_FOD_STAT */
> +#define MT6360_CHRDET_EXT_MASK	BIT(4)
> +
> +enum {
> +	MT6360_RANGE_VMIVR,
> +	MT6360_RANGE_ICHG,
> +	MT6360_RANGE_VOREG,
> +	MT6360_RANGE_AICR,
> +	MT6360_RANGE_IPREC,
> +	MT6360_RANGE_IEOC,
> +	MT6360_RANGE_MAX,
> +};
> +
> +#define MT6360_LINEAR_RANGE(idx, _min, _min_sel, _max_sel, _step)	
> \
> +	[idx] = {							\
> +		.min = _min,						
> \
> +		.min_sel = _min_sel,					
> \
> +		.max_sel = _max_sel,					
> \
> +		.step = _step,						
> \
> +	}
> 

Do you think REGULATOR_LINEAR_RANGE() would fit this? Or is the naming
a problem there? (Just a minor thing, no need to re-spin for this)

//snip

> +static int mt6360_charger_probe(struct platform_device *pdev)
> +{
> +	struct mt6360_chg_info *mci;
> +	struct power_supply_config charger_cfg = {};
> +	struct regulator_config config = { };
> +	int ret;
> +
> +	mci = devm_kzalloc(&pdev->dev, sizeof(*mci), GFP_KERNEL);
> +	if (!mci)
> +		return -ENOMEM;
> +
> +	mci->dev = &pdev->dev;
> +	mci->vinovp = 6500000;
> +	mutex_init(&mci->chgdet_lock);
> +	platform_set_drvdata(pdev, mci);
> +	INIT_WORK(&mci->chrdet_work, &mt6360_chrdet_work);

//snip

> +
> +static int mt6360_charger_remove(struct platform_device *pdev)
> +{
> +	struct mt6360_chg_info *mci = platform_get_drvdata(pdev);
> +
> +	cancel_work_sync(&mci->chrdet_work);
> +
> +	return 0;
> +}

Just as a note, devm_work_autocancel() should hopefully be included at
next cycle. Then you might be able to drop the .remove().

FWIW:
Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

Best Regards
	Matti Vaittinen


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
