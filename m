Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D71AC433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 11:48:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0496161494
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 11:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0496161494
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:MIME-Version:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVT4pTC0bkZ3dW2rvZKju5fXfbJzDlbzWwDDnNg7GC4=; b=TjPYOjM/LFpRBbfHjcxFjimTp1
	LxYKqR4kYm7Rm+LX9XsuiILnCs60F9jP5TNWQ5C3vDrlbDnQE6Vg7fVVR/yTJySqLEVLtbvchVGff
	Umx9iWMLDXN+vLQkjtydv3tEh8xPJ3BaufznNwpfzR1YwCbULYsKlXog1DYtgL2EZEShCvNvIombq
	0nZe9WmZ4XkIOxHmd64aL8tD14g2VJ/RQ3iGvPeLxMELZZXCZBvcdG5XrYxFU0FRjK5Dhp9TneH3D
	WiRKKUMi1CwZgsF8wgnqRG9X8FpdQV9WjiJx/ZWH4v/Sw/Zi6xzugJ4G1UDMle5Zd10I1hWsV+VNx
	gRporGpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRCrG-003cJi-HH; Tue, 30 Mar 2021 11:48:30 +0000
Received: from mail-lj1-f181.google.com ([209.85.208.181])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRCr3-003cHl-9G; Tue, 30 Mar 2021 11:48:19 +0000
Received: by mail-lj1-f181.google.com with SMTP id u10so19546316lju.7;
 Tue, 30 Mar 2021 04:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
 :in-reply-to:references:mime-version:date:user-agent
 :content-transfer-encoding;
 bh=ZCsq71iHmso1XAOt42lydFFOyhVFeiKpy6GIPK3K4eQ=;
 b=mxoBDD4ZDPMC8Gxa6odESjAKHRhgGmaQcLTjC29mFd5dFKj01kXQFdqQTVvF0SbRQV
 DDJ+Hz+nPS9zu3fMt7lY12mBOG2rgoCsdpixJ1mh6FYJTEVCHLUsuYVmEikvV07sFIYX
 kG5jBXpQAwlirzQBvPStlafrqTNv4tZOq5SfhbpI1xSFdhrTMhbDlhk4rE8vz6BD5iWd
 doV20jfN+3ugM3DzlQmdH0IXftUJTAbmDJsEIoFC8PK25mnoYq/goM7YpazM8h0s3bN7
 +/HGQf9h9QRcN6V0iDZM1LD+PtLOtTZqR1ullb8bgeECPInqF4AUCKgFj4i27LomxkFv
 ca6Q==
X-Gm-Message-State: AOAM532BDPwnyjmL0+qLHygjdiLqkuYiMWizHtWUwcBpBOFL9miyXHTn
 BJrJ96sjZkVzmvw2fDPs3u4=
X-Google-Smtp-Source: ABdhPJxsbikjvT/1UC/7RBiFI/y40feTCRCejzHpSOLOsSPsMQIsn9j4H3rpVrCjsAAFqKObZuVdnA==
X-Received: by 2002:a2e:80d3:: with SMTP id r19mr20093868ljg.168.1617104895689; 
 Tue, 30 Mar 2021 04:48:15 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi
 (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
 by smtp.gmail.com with ESMTPSA id f10sm2154167lfm.194.2021.03.30.04.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 04:48:15 -0700 (PDT)
Message-ID: <771c7da0584cf37da6ba370207a89a7401a20c33.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v4 2/2] power: supply: mt6360_charger: add MT6360
 charger support
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: Gene Chen <gene.chen.richtek@gmail.com>, sre@kernel.org, 
 matthias.bgg@gmail.com, robh+dt@kernel.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com, benjamin.chao@mediatek.com
In-Reply-To: <1610973703-676-3-git-send-email-gene.chen.richtek@gmail.com>
References: <1610973703-676-1-git-send-email-gene.chen.richtek@gmail.com>
 <1610973703-676-3-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Date: Tue, 30 Mar 2021 14:48:05 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_124817_473037_BD2D7F91 
X-CRM114-Status: GOOD (  23.40  )
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


On Mon, 2021-01-18 at 20:41 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add basic support for the battery charger for MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  drivers/power/supply/Kconfig          |  10 +
>  drivers/power/supply/Makefile         |   1 +
>  drivers/power/supply/mt6360_charger.c | 914
> ++++++++++++++++++++++++++++++++++
>  3 files changed, 925 insertions(+)
>  create mode 100644 drivers/power/supply/mt6360_charger.c
> 

Thanks for the contribution :)

Few comments which I am not demanding to be 'fixed' - but which might
be good to be checked. Eg, please consider my comments as 'nit's.

...

> +static unsigned int mt6360_map_reg_sel(u32 data, u32 min, u32 max,
> u32 step)
> +{
> +	u32 target = 0, max_sel;
> +
> +	if (data >= min) {
> +		target = (data - min) / step;
> +		max_sel = (max - min) / step;
> +		if (target > max_sel)
> +			target = max_sel;
> +	}
> +	return target;
> +}

lib/linear_ranges.c might already implement this ...

> +
> +static u32 mt6360_map_real_val(u32 sel, u32 min, u32 max, u32 step)
> +{
> +	u32 target = 0;
> +
> +	target = min + (sel * step);
> +	if (target > max)
> +		target = max;
> +	return target;
> +}

...and this.

> +static int mt6360_charger_get_ichg(struct mt6360_chg_info *mci,
> +				   union power_supply_propval *val)
> +{
> +	int ret;
> +	unsigned int regval;
> +
> +	ret = regmap_read(mci->regmap, MT6360_PMU_CHG_CTRL7, &regval);
> +	if (ret < 0)
> +		return ret;
> +	regval = (regval & MT6360_ICHG_MASK) >> MT6360_ICHG_SHFT;
> +	val->intval = mt6360_map_real_val(regval,
> +					  MT6360_ICHG_MIN,
> +					  MT6360_ICHG_MAX,
> +					  MT6360_ICHG_STEP);

linear_ranges?

> +	return 0;
> +}
> +
> +static int mt6360_charger_get_max_ichg(struct mt6360_chg_info *mci,
> +				       union power_supply_propval *val)
> +{
> +	val->intval = MT6360_ICHG_MAX;
> +	return 0;
> +}
> +
> +static int mt6360_charger_get_cv(struct mt6360_chg_info *mci,
> +				 union power_supply_propval *val)
> +{
> +	int ret;
> +	unsigned int regval;
> +
> +	ret = regmap_read(mci->regmap, MT6360_PMU_CHG_CTRL4, &regval);
> +	if (ret < 0)
> +		return ret;
> +	regval = (regval & MT6360_VOREG_MASK) >> MT6360_VOREG_SHFT;
> +	val->intval = mt6360_map_real_val(regval,
> +					  MT6360_VOREG_MIN,
> +					  MT6360_VOREG_MAX,
> +					  MT6360_VOREG_STEP);

linear_ranges?

> +	return 0;
> +}
> +
> +static int mt6360_charger_get_max_cv(struct mt6360_chg_info *mci,
> +				     union power_supply_propval *val)
> +{
> +	val->intval = MT6360_VOREG_MAX;
> +	return 0;
> +}
> +
> +static int mt6360_charger_get_aicr(struct mt6360_chg_info *mci,
> +				   union power_supply_propval *val)
> +{
> +	int ret;
> +	unsigned int regval;
> +
> +	ret = regmap_read(mci->regmap, MT6360_PMU_CHG_CTRL3, &regval);
> +	if (ret < 0)
> +		return ret;
> +	regval = (regval & MT6360_IAICR_MASK) >> MT6360_IAICR_SHFT;
> +	val->intval = mt6360_map_real_val(regval,
> +					  MT6360_AICR_MIN,
> +					  MT6360_AICR_MAX,
> +					  MT6360_AICR_STEP);

linear_ranges?

> +	return 0;
> +}
> +
> +static int mt6360_charger_get_mivr(struct mt6360_chg_info *mci,
> +				   union power_supply_propval *val)
> +{
> +	int ret;
> +	unsigned int regval;
> +
> +	ret = regmap_read(mci->regmap, MT6360_PMU_CHG_CTRL6, &regval);
> +	if (ret < 0)
> +		return ret;
> +	regval = (regval & MT6360_VMIVR_MASK) >> MT6360_VMIVR_SHFT;
> +	val->intval = mt6360_map_real_val(regval,
> +					  MT6360_VMIVR_MIN,
> +					  MT6360_VMIVR_MAX,
> +					  MT6360_VMIVR_STEP);

linear_ranges?

> +	return 0;
> +}
> +
> +static int mt6360_charger_get_iprechg(struct mt6360_chg_info *mci,
> +				      union power_supply_propval *val)
> +{
> +	int ret;
> +	unsigned int regval;
> +
> +	ret = regmap_read(mci->regmap, MT6360_PMU_CHG_CTRL8, &regval);
> +	if (ret < 0)
> +		return ret;
> +	regval = (regval & MT6360_IPREC_MASK) >> MT6360_IPREC_SHFT;
> +	val->intval = mt6360_map_real_val(regval,
> +					  MT6360_IPREC_MIN,
> +					  MT6360_IPREC_MAX,
> +					  MT6360_IPREC_STEP);

linear_ranges?

> +	return 0;
> +}
> +
> +static int mt6360_charger_get_ieoc(struct mt6360_chg_info *mci,
> +				   union power_supply_propval *val)
> +{
> +	int ret;
> +	unsigned int regval;
> +
> +	ret = regmap_read(mci->regmap, MT6360_PMU_CHG_CTRL9, &regval);
> +	if (ret < 0)
> +		return ret;
> +	regval = (regval & MT6360_IEOC_MASK) >> MT6360_IEOC_SHFT;
> +	val->intval = mt6360_map_real_val(regval,
> +					  MT6360_IEOC_MIN,
> +					  MT6360_IEOC_MAX,
> +					  MT6360_IEOC_STEP);

linear_ranges?

> +	return 0;
> +}
> +
> +static int mt6360_charger_set_online(struct mt6360_chg_info *mci,
> +				     const union power_supply_propval
> *val)
> +{
> +	u8 force_sleep = val->intval ? 0 : 1;
> +
> +	return regmap_update_bits(mci->regmap,
> +				  MT6360_PMU_CHG_CTRL1,
> +				  MT6360_FSLP_MASK,
> +				  force_sleep << MT6360_FSLP_SHFT);
> +}
> +
> +static int mt6360_charger_set_ichg(struct mt6360_chg_info *mci,
> +				   const union power_supply_propval
> *val)
> +{
> +	u8 sel;
> +
> +	sel = mt6360_map_reg_sel(val->intval,
> +				 MT6360_ICHG_MIN,
> +				 MT6360_ICHG_MAX,
> +				 MT6360_ICHG_STEP);

linear_ranges?

> +	return regmap_update_bits(mci->regmap,
> +				  MT6360_PMU_CHG_CTRL7,
> +				  MT6360_ICHG_MASK,
> +				  sel << MT6360_ICHG_SHFT);
> +}
> +
> +static int mt6360_charger_set_cv(struct mt6360_chg_info *mci,
> +				 const union power_supply_propval *val)
> +{
> +	u8 sel;
> +
> +	sel = mt6360_map_reg_sel(val->intval,
> +				 MT6360_VOREG_MIN,
> +				 MT6360_VOREG_MAX,
> +				 MT6360_VOREG_STEP);

linear_ranges?

> +	return regmap_update_bits(mci->regmap,
> +				  MT6360_PMU_CHG_CTRL4,
> +				  MT6360_VOREG_MASK,
> +				  sel << MT6360_VOREG_SHFT);
> +}
> +
> +static int mt6360_charger_set_aicr(struct mt6360_chg_info *mci,
> +				   const union power_supply_propval
> *val)
> +{
> +	u8 sel;
> +
> +	sel = mt6360_map_reg_sel(val->intval,
> +				 MT6360_AICR_MIN,
> +				 MT6360_AICR_MAX,
> +				 MT6360_AICR_STEP);

linear_ranges?

> +	return regmap_update_bits(mci->regmap,
> +				  MT6360_PMU_CHG_CTRL3,
> +				  MT6360_IAICR_MASK,
> +				  sel << MT6360_IAICR_SHFT);
> +}
> +
> +static int mt6360_charger_set_mivr(struct mt6360_chg_info *mci,
> +				   const union power_supply_propval
> *val)
> +{
> +	u8 sel;
> +
> +	sel = mt6360_map_reg_sel(val->intval,
> +				 MT6360_VMIVR_MIN,
> +				 MT6360_VMIVR_MAX,
> +				 MT6360_VMIVR_STEP);

linear_ranges?

> +	return regmap_update_bits(mci->regmap,
> +				  MT6360_PMU_CHG_CTRL3,
> +				  MT6360_VMIVR_MASK,
> +				  sel << MT6360_VMIVR_SHFT);
> +}
> +
> +static int mt6360_charger_set_iprechg(struct mt6360_chg_info *mci,
> +				      const union power_supply_propval
> *val)
> +{
> +	u8 sel;
> +
> +	sel = mt6360_map_reg_sel(val->intval,
> +				 MT6360_IPREC_MIN,
> +				 MT6360_IPREC_MAX,
> +				 MT6360_IPREC_STEP);

linear_ranges?

> +	return regmap_update_bits(mci->regmap,
> +				  MT6360_PMU_CHG_CTRL8,
> +				  MT6360_IPREC_MASK,
> +				  sel << MT6360_IPREC_SHFT);
> +}
> +
> +static int mt6360_charger_set_ieoc(struct mt6360_chg_info *mci,
> +				   const union power_supply_propval
> *val)
> +{
> +	u8 sel;
> +
> +	sel = mt6360_map_reg_sel(val->intval,
> +				 MT6360_IEOC_MIN,
> +				 MT6360_IEOC_MAX,
> +				 MT6360_IEOC_STEP);

linear_ranges?

> +	return regmap_update_bits(mci->regmap,
> +				  MT6360_PMU_CHG_CTRL9,
> +				  MT6360_IEOC_MASK,
> +				  sel << MT6360_IEOC_SHFT);
> +}
> +
> +



> +static const struct regulator_ops mt6360_chg_otg_ops = {
> +	.list_voltage = regulator_list_voltage_linear,
> +	.enable = regulator_enable_regmap,
> +	.disable = regulator_disable_regmap,
> +	.is_enabled = regulator_is_enabled_regmap,
> +	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> +	.get_voltage_sel = regulator_get_voltage_sel_regmap,
> +};
> +
> +static const struct regulator_desc mt6360_otg_rdesc = {
> +	.of_match = "usb-otg-vbus",
> +	.name = "usb-otg-vbus",
> +	.ops = &mt6360_chg_otg_ops,
> +	.owner = THIS_MODULE,
> +	.type = REGULATOR_VOLTAGE,
> +	.min_uV = 4425000,
> +	.uV_step = 25000,
> +	.n_voltages = 57,
> +	.vsel_reg = MT6360_PMU_CHG_CTRL5,
> +	.vsel_mask = MT6360_VOBST_MASK,
> +	.enable_reg = MT6360_PMU_CHG_CTRL1,
> +	.enable_mask = MT6360_OPA_MODE_MASK,
> +};

Any particular reason why these are here and not in a regulator driver?

...

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
> +	ret = mt6360_parse_dt(pdev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to parse
> dt\n");
> +
> +	mci->dev = &pdev->dev;
> +	mci->vinovp = 6500000;
> +	mutex_init(&mci->chgdet_lock);
> +	platform_set_drvdata(pdev, mci);
> +	INIT_WORK(&mci->chrdet_work, &mt6360_chrdet_work);
> +
> +	mci->regmap = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!mci->regmap)
> +		return dev_err_probe(&pdev->dev, -ENODEV, "Failed to
> get parent regmap\n");
> +
> +	ret = mt6360_apply_dt(pdev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to apply
> dt\n");
> +
> +	memcpy(&mci->psy_desc, &mt6360_charger_desc, sizeof(mci-
> >psy_desc));
> +	mci->psy_desc.name = dev_name(&pdev->dev);
> +	charger_cfg.drv_data = mci;
> +	charger_cfg.of_node = pdev->dev.of_node;
> +	mci->psy = devm_power_supply_register(&pdev->dev,
> +					      &mci->psy_desc,
> &charger_cfg);
> +	if (IS_ERR(mci->psy))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(mci->psy),
> +				     "Failed to register power supply
> dev\n");
> +
> +	ret = mt6360_chg_init_setting(mci);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to
> initial setting\n");
> +
> +	schedule_work(&mci->chrdet_work);

Is this work scheduled anywhere else? If not - why doing this in wq
context? If yes - does this wq need cancellation upon exit?

> +
> +	ret = mt6360_chg_irq_register(pdev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to
> register irqs\n");
> +
> +	config.dev = &pdev->dev;
> +	config.regmap = mci->regmap;
> +	mci->otg_rdev = devm_regulator_register(&pdev->dev,
> &mt6360_otg_rdesc,
> +						&config);
> +	if (IS_ERR(mci->otg_rdev))
> +		return PTR_ERR(mci->otg_rdev);
> +
> +	return 0;
> +}
> +

Best Regards
	Matti Vaittinen


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
