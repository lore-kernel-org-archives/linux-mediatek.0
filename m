Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86326C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 11:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aoFFxs8BkoEad1LvbCp6J5af2uJihpaXLP7ZExLxt0o=; b=0GeORFEaSQp5Fk
	EAJdh7O7qcEspdM9w/EyHP8WOVC5//HoronYTCxxRrjLr0t/nqhwGUIJIst5ZDjmyTkhUTR4HmlQE
	Y6WZuJGt7sK3c2z+Y1npk6rLMGTHZAH1378vShmsizI/+xf+uH0U9l2CCrfVZoCWwhyfEA5bEY+/d
	10vJNp7cVbspoNDFimlW/Bi0cmcSuPWZACMFz44sqbw0rXe4rKxYHKsM7ZtghOIAhcpk3m9tqksjT
	s4pnuxEGTehYe0w9n1G5DQVavxwhh23hpvkjoX3NAaA43NIM4lYnPFbU5ytMJKgEyMXZaSsn98mea
	AI+OpLqc/l8d7ZHE7LEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncn9m-00GlMj-Si; Fri, 08 Apr 2022 11:52:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncn9a-00GlIn-45; Fri, 08 Apr 2022 11:51:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9D3E51F46F37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649418706;
 bh=KtaScPcryeGL4YO+TROmabwM6wlLQsjfQXBw+PYHmfc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QCegWv3XIxeXvrTldnlY815OlT5zriWKUeupvOczZb1bDGA3cpKvuqkuTS8PBeS74
 3/wC92JYMgDLC46HjGwXvzpyLXcRiawkzcSQj7DFSy0OIqXTJ1OFYoaKodebVU7pKr
 UlVrSLQmKtGqzrqFhSfa3yOjImEuJF9iQt4ZrcxQj6pDU+WVglD9csBHVf5zLUWCTp
 4TC24h8lLZZj9RyaH2UIhtKvVQnY4IUVALFiDE2zZqx7AjGvZGdWAARZAcO5HgTpNi
 R9OcU0fCktBrpG/UD05xAkVKX/6DM9ccgnpOItqm3ftIrXpX0G3UL/3+VsuE5UJXbn
 AHi3nCn/kVkkg==
Message-ID: <7dde78c6-efc6-cc67-19ac-28f8640c2c8c@collabora.com>
Date: Fri, 8 Apr 2022 13:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] PM / devfreq: mediatek: Introduce MediaTek CCI
 devfreq driver
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408052150.22536-1-johnson.wang@mediatek.com>
 <20220408052150.22536-3-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220408052150.22536-3-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_045150_559010_C0C477BF 
X-CRM114-Status: GOOD (  30.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/04/22 07:21, Johnson Wang ha scritto:
> We introduce a devfreq driver for the MediaTek Cache Coherent Interconnect
> (CCI) used by some MediaTek SoCs.
> 
> In this driver, we use the passive devfreq driver to get target frequencies
> and adjust voltages accordingly. In MT8183 and MT8186, the MediaTek CCI
> is supplied by the same regulators with the little core CPUs.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---
> This patch depends on "devfreq-testing"[1].
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing
> ---
>   drivers/devfreq/Kconfig           |  10 +
>   drivers/devfreq/Makefile          |   1 +
>   drivers/devfreq/mtk-cci-devfreq.c | 479 ++++++++++++++++++++++++++++++
>   3 files changed, 490 insertions(+)
>   create mode 100644 drivers/devfreq/mtk-cci-devfreq.c
> 
> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> index 87eb2b837e68..d985597f343f 100644
> --- a/drivers/devfreq/Kconfig
> +++ b/drivers/devfreq/Kconfig
> @@ -120,6 +120,16 @@ config ARM_TEGRA_DEVFREQ
>   	  It reads ACTMON counters of memory controllers and adjusts the
>   	  operating frequencies and voltages with OPP support.
>   
> +config ARM_MEDIATEK_CCI_DEVFREQ
> +	tristate "MEDIATEK CCI DEVFREQ Driver"
> +	depends on ARM_MEDIATEK_CPUFREQ
> +	select DEVFREQ_GOV_PASSIVE
> +	help
> +	  This adds a devfreq driver for MediaTek Cache Coherent Interconnect
> +	  which is shared the same regulators with the cpu cluster. It can track
> +	  buck voltages and update a proper CCI frequency. Use the notification
> +	  to get the regulator status.
> +
>   config ARM_RK3399_DMC_DEVFREQ
>   	tristate "ARM RK3399 DMC DEVFREQ Driver"
>   	depends on (ARCH_ROCKCHIP && HAVE_ARM_SMCCC) || \
> diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
> index 0b6be92a25d9..bf40d04928d0 100644
> --- a/drivers/devfreq/Makefile
> +++ b/drivers/devfreq/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+= governor_passive.o
>   obj-$(CONFIG_ARM_EXYNOS_BUS_DEVFREQ)	+= exynos-bus.o
>   obj-$(CONFIG_ARM_IMX_BUS_DEVFREQ)	+= imx-bus.o
>   obj-$(CONFIG_ARM_IMX8M_DDRC_DEVFREQ)	+= imx8m-ddrc.o
> +obj-$(CONFIG_ARM_MEDIATEK_CCI_DEVFREQ)	+= mtk-cci-devfreq.o
>   obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
>   obj-$(CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ)	+= sun8i-a33-mbus.o
>   obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
> diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
> new file mode 100644
> index 000000000000..53a28e2c88bd
> --- /dev/null
> +++ b/drivers/devfreq/mtk-cci-devfreq.c
> @@ -0,0 +1,479 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 MediaTek Inc.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/devfreq.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +#include <linux/regulator/consumer.h>
> +
> +struct mtk_ccifreq_platform_data {
> +	int min_volt_shift;
> +	int max_volt_shift;
> +	int proc_max_volt;
> +	int sram_min_volt;
> +	int sram_max_volt;
> +};
> +
> +struct mtk_ccifreq_drv {
> +	struct device *cci_dev;
> +	struct devfreq *devfreq;
> +	struct regulator *proc_reg;
> +	struct regulator *sram_reg;
> +	struct clk *cci_clk;
> +	struct clk *inter_clk;
> +	int inter_voltage;
> +	int old_voltage;
> +	unsigned long old_freq;
> +	bool need_voltage_tracking;
> +	/* Avoid race condition for regulators between notify and policy */
> +	struct mutex reg_lock;
> +	struct notifier_block opp_nb;
> +	const struct mtk_ccifreq_platform_data *soc_data;
> +};
> +
> +static int mtk_ccifreq_voltage_tracking(struct mtk_ccifreq_drv *drv,
> +					int new_voltage)
> +{
> +	const struct mtk_ccifreq_platform_data *soc_data = drv->soc_data;
> +	struct device *dev = drv->cci_dev;
> +	struct regulator *proc_reg = drv->proc_reg;
> +	struct regulator *sram_reg = drv->sram_reg;
> +	int old_voltage, old_vsram, new_vsram, vsram, voltage, ret;
> +
> +	old_voltage = regulator_get_voltage(proc_reg);
> +	if (old_voltage < 0) {
> +		dev_err(dev, "invalid vproc value: %d\n", old_voltage);
> +		return old_voltage;
> +	}
> +
> +	old_vsram = regulator_get_voltage(sram_reg);
> +	if (old_vsram < 0) {
> +		dev_err(dev, "invalid vsram value: %d\n", old_vsram);
> +		return old_vsram;
> +	}
> +
> +	new_vsram = clamp(new_voltage + soc_data->min_volt_shift,
> +			  soc_data->sram_min_volt, soc_data->sram_max_volt);
> +
> +	do {
> +		if (old_voltage <= new_voltage) {
> +			vsram = clamp(old_voltage + soc_data->max_volt_shift,
> +				      soc_data->sram_min_volt, new_vsram);
> +			ret = regulator_set_voltage(sram_reg, vsram,
> +						    soc_data->sram_max_volt);
> +			if (ret)
> +				return ret;
> +
> +			if (vsram == soc_data->sram_max_volt ||
> +			    new_vsram == soc_data->sram_min_volt)
> +				voltage = new_voltage;
> +			else
> +				voltage = vsram - soc_data->min_volt_shift;
> +
> +			ret = regulator_set_voltage(proc_reg, voltage,
> +						    soc_data->proc_max_volt);
> +			if (ret) {
> +				regulator_set_voltage(sram_reg, old_vsram,
> +						      soc_data->sram_max_volt);
> +				return ret;
> +			}
> +		} else if (old_voltage > new_voltage) {
> +			voltage = max(new_voltage,
> +				      old_vsram - soc_data->max_volt_shift);
> +			ret = regulator_set_voltage(proc_reg, voltage,
> +						    soc_data->proc_max_volt);
> +			if (ret)
> +				return ret;
> +
> +			if (voltage == new_voltage)
> +				vsram = new_vsram;
> +			else
> +				vsram = max(new_vsram,
> +					    voltage + soc_data->min_volt_shift);
> +
> +			ret = regulator_set_voltage(sram_reg, vsram,
> +						    soc_data->sram_max_volt);
> +			if (ret) {
> +				regulator_set_voltage(proc_reg, old_voltage,
> +						      soc_data->proc_max_volt);
> +				return ret;
> +			}
> +		}
> +
> +		old_voltage = voltage;
> +		old_vsram = vsram;
> +	} while (voltage != new_voltage || vsram != new_vsram);

Hello Johnson,

are you extremely sure that there will *always* be a way out of this while loop?

For safety purposes, I would set an iteration limit in order to avoid getting
an infinite loop here.
Probably, something like twice or thrice the expected number of iterations will
also be fine.

P.S.: Krzysztof's review also contains exactly all the rest of what I would
       also say here (thanks!).

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
