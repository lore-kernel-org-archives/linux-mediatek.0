Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E7BC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 10:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwEgx67a+Euc1X5BOtoR2w4gcOlAPg1FnDmT3claZIk=; b=ZWRRNYVwVsjh3AQksZikz8CV7f
	YArtXHcgStZ1tkYIU2OOe9ObRZBD7Ul2BSFVgEHGR5ntcGKkl/+4LHu10FOLL2ESKOZuNMNHXk7IB
	KZNcsRLYAVWvGmxAqUoZgjz5XXv0dTO6l8UNkr0yBCGk+QDjVD3vJT45Jw2cgJJNU0h0OP1RMe8Dh
	Kq2yVoSAPLwsWqWhj+8a5E7qZIkuPtBdWf6SRRA+/UkICcAUlS9atbW0vY8U9Ttxl35x7nFFyCDlJ
	5isJwQBUmb4tZrOhkpWKTaAd8iLyGCbfISYg9KGC4bsjAkpXvxqYhcb3JjE+2sUyzkCRn8RoMnQ/u
	LvGRbkQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogNre-001Nt4-DH; Thu, 06 Oct 2022 10:12:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogNrR-001Nlc-VT; Thu, 06 Oct 2022 10:12:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7AC1466015B2;
	Thu,  6 Oct 2022 11:12:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665051130;
	bh=hBzLYAZ/XCWmpmRNZqgr/E9Qvcs6t9LfcYNfT2CKpww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R2ZkjfZ4zhjj3PpMVzH+Hs51FbnbWNdImIvMx95PfusY+CdS2Wq+wIoCzWCPIqvFN
	 MKMo/phJp7S5P0F1gsMOeXsbBAeGYvTFJDS3+al5Fy13lHRkqPP1YCtZuG9baEkAIb
	 IRv9oGQheka9FsLhZrQMTp2NSeAzjrDmGy+eaze2V3lxJ0sFqjsr1OzkPl3+opCHun
	 Gt6CDNDDA5iJMss/Pao9V1f/qC3syto1r32Fue1oHZ3InOQd8SmYsqwGZ6Zkqcv8zu
	 v/dMCUytqSqHUx19PeJjYEtXa2tfhPe1/NgvQ4jiVUWiHU++GyLf2Zml8dJvaloI8H
	 0HOay6LfSu4Fw==
Message-ID: <a13b5dfe-2296-156c-6cd0-8fe9c5973efe@collabora.com>
Date: Thu, 6 Oct 2022 12:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 4/5] regulator: add mt6357 regulator
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>
References: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
 <20221005-mt6357-support-v2-4-f17ba2d2d0a9@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221005-mt6357-support-v2-4-f17ba2d2d0a9@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_031214_389527_73619C24 
X-CRM114-Status: GOOD (  22.05  )
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

Il 05/10/22 16:57, Alexandre Mergnat ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add regulator driver for the MT6357 PMIC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   drivers/regulator/Kconfig                  |   9 +
>   drivers/regulator/Makefile                 |   1 +
>   drivers/regulator/mt6357-regulator.c       | 485 +++++++++++++++++++++++++++++
>   include/linux/regulator/mt6357-regulator.h |  51 +++
>   4 files changed, 546 insertions(+)
> 
> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
> index 070e4403c6c2..a659a57438f4 100644
> --- a/drivers/regulator/Kconfig
> +++ b/drivers/regulator/Kconfig
> @@ -805,6 +805,15 @@ config REGULATOR_MT6332
>   	  This driver supports the control of different power rails of device
>   	  through regulator interface
>   
> +config REGULATOR_MT6357
> +	tristate "MediaTek MT6357 PMIC"
> +	depends on MFD_MT6397
> +	help
> +	  Say y here to select this option to enable the power regulator of
> +	  MediaTek MT6357 PMIC.
> +	  This driver supports the control of different power rails of device
> +	  through regulator interface.
> +
>   config REGULATOR_MT6358
>   	tristate "MediaTek MT6358 PMIC"
>   	depends on MFD_MT6397
> diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
> index 5962307e1130..e4d67b7b1af6 100644
> --- a/drivers/regulator/Makefile
> +++ b/drivers/regulator/Makefile
> @@ -97,6 +97,7 @@ obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
>   obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
>   obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
>   obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
> +obj-$(CONFIG_REGULATOR_MT6357)	+= mt6357-regulator.o
>   obj-$(CONFIG_REGULATOR_MT6358)	+= mt6358-regulator.o
>   obj-$(CONFIG_REGULATOR_MT6359)	+= mt6359-regulator.o
>   obj-$(CONFIG_REGULATOR_MT6360) += mt6360-regulator.o
> diff --git a/drivers/regulator/mt6357-regulator.c b/drivers/regulator/mt6357-regulator.c
> new file mode 100644
> index 000000000000..4ecd41429448
> --- /dev/null
> +++ b/drivers/regulator/mt6357-regulator.c
> @@ -0,0 +1,485 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Copyright (c) 2022 BayLibre, SAS.
> +// Author: Chen Zhong <chen.zhong@mediatek.com>
> +// Author: Fabien Parent <fparent@baylibre.com>
> +//
> +// Based on mt6397-regulator.c
> +//
> +
> +#include <linux/module.h>
> +#include <linux/linear_range.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/mt6397/core.h>
> +#include <linux/mfd/mt6357/registers.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/regulator/mt6357-regulator.h>
> +#include <linux/regulator/of_regulator.h>
> +
> +/*
> + * MT6357 regulators' information
> + *
> + * @desc: standard fields of regulator description.
> + * @vselon_reg: Register sections for hardware control mode of bucks
> + * @vselctrl_reg: Register for controlling the buck control mode.
> + * @vselctrl_mask: Mask for query buck's voltage control mode.
> + */
> +struct mt6357_regulator_info {
> +	struct regulator_desc desc;
> +	const u32 *index_table;
> +	unsigned int n_table;
> +	u32 vsel_shift;
> +	u32 da_vsel_reg;
> +	u32 da_vsel_mask;
> +	u32 da_vsel_shift;
> +};
> +
> +#define MT6357_BUCK(match, vreg, min, max, step,		\
> +	volt_ranges, vosel_reg, vosel_mask, _da_vsel_mask)		\
> +[MT6357_ID_##vreg] = {	\
> +	.desc = {	\
> +		.name = #vreg,	\
> +		.of_match = of_match_ptr(match),	\
> +		.regulators_node = "regulators",			\
> +		.ops = &mt6357_volt_range_ops,	\
> +		.type = REGULATOR_VOLTAGE,	\
> +		.id = MT6357_ID_##vreg,		\
> +		.owner = THIS_MODULE,		\
> +		.n_voltages = ((max) - (min)) / (step) + 1,	\
> +		.linear_ranges = volt_ranges,		\
> +		.n_linear_ranges = ARRAY_SIZE(volt_ranges),	\
> +		.vsel_reg = vosel_reg,	\
> +		.vsel_mask = vosel_mask,	\
> +		.enable_reg = MT6357_BUCK_##vreg##_CON0,	\
> +		.enable_mask = BIT(0),	\
> +	},	\
> +	.da_vsel_reg = MT6357_BUCK_##vreg##_DBG0,	\
> +	.da_vsel_mask = vosel_mask,	\
> +	.da_vsel_shift = 0,	\
> +}
> +
> +#define MT6357_LDO(match, vreg, ldo_volt_table,	\
> +	ldo_index_table, enreg, vosel,	\
> +	vosel_mask)	\
> +[MT6357_ID_##vreg] = {	\
> +	.desc = {	\
> +		.name = #vreg,	\
> +		.of_match = of_match_ptr(match),	\
> +		.regulators_node = "regulators",			\
> +		.ops = &mt6357_volt_table_ops,	\
> +		.type = REGULATOR_VOLTAGE,	\
> +		.id = MT6357_ID_##vreg,	\
> +		.owner = THIS_MODULE,	\
> +		.n_voltages = ARRAY_SIZE(ldo_volt_table),	\
> +		.volt_table = ldo_volt_table,	\
> +		.vsel_reg = vosel,	\
> +		.vsel_mask = vosel_mask << 8,	\
> +		.enable_reg = enreg,	\
> +		.enable_mask = BIT(0),	\
> +	},	\
> +	.index_table = ldo_index_table,	\
> +	.n_table = ARRAY_SIZE(ldo_index_table),	\
> +}
> +
> +#define MT6357_LDO1(match, vreg, min, max, step, volt_ranges,	\
> +	enreg, vosel, vosel_mask)	\
> +[MT6357_ID_##vreg] = {	\
> +	.desc = {	\
> +		.name = #vreg,	\
> +		.of_match = of_match_ptr(match),	\
> +		.regulators_node = "regulators",			\
> +		.ops = &mt6357_volt_range_ops,	\
> +		.type = REGULATOR_VOLTAGE,	\
> +		.id = MT6357_ID_##vreg,	\
> +		.owner = THIS_MODULE,	\
> +		.n_voltages = ((max) - (min)) / (step) + 1,	\
> +		.linear_ranges = volt_ranges,		\
> +		.n_linear_ranges = ARRAY_SIZE(volt_ranges),	\
> +		.vsel_reg = vosel,	\
> +		.vsel_mask = vosel_mask,	\
> +		.enable_reg = enreg,	\
> +		.enable_mask = BIT(0),	\
> +	},	\
> +	.da_vsel_reg = MT6357_LDO_##vreg##_DBG0,	\
> +	.da_vsel_mask = 0x7f,	\
> +	.da_vsel_shift = 8,	\

There's something wrong here: ((val & 0x7f) >> 8) is always zero,
and you're using mt6357_volt_range_ops, that is using function
mt6357_get_buck_voltage_sel, which is doing exactly that.

Regards,
Angelo


