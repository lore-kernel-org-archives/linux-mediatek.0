Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08284C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 12:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CM8pa8hp16ulV89lGRNLpqj409mzduKe85Os7iI2HSM=; b=OMnJBtbzoJr67m
	MB8AjMAppm8bjPIdoZi93EuBESP7ubG0V0NFu63wRMiqtJL1uzrALDiy6JS1mZRL7UFgcxbr0QG2X
	ozTfVtL/TT8+/KlJy3IvtvEDCMhaF2MAMUo96XId3bgJRAa8nVLuZo9nFwR5IzT5igbAfjjsNmWHw
	Lc+dFUtncKxO1hdrkTuMhMY5sakjWMq4Z3/yB/Sj+NxSLB3kJyxrMJZ5Mvok0kipGdvQ8r0mBGWBx
	oqalUrBc81c8//WCvoCsaTiacLeFlJT+/C12AHsJ5ubmEKbc/PDIWHY6SxCeI2pkTSyl88BrrJF84
	tijXHWp9FZzVask68Z9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nveKJ-006UER-GF; Mon, 30 May 2022 12:16:51 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nveK6-006UAS-R8; Mon, 30 May 2022 12:16:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 526431F42E1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653912995;
	bh=eRoHy4JEVSeabbymYlFcaEqOqtSW2VLN1aXTCvMWwBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xm+TnJL3TRgvgDEAVtSudKUlXAV+6HZg3bqntAapoFfNoHcmGca24fletZYUxiKH4
	 rG8zUtCw+/gkpydx0YJDe9pVV7GMmTQFSQCAMpQOyhvbZByCvEumcqMT9dwSSwEeQ6
	 VmmmJqXlUTpGBXKSi7BtAWzEPfHecuSnynRDelHPWPyay2s0Vi8X7r9LeELPhmTRmR
	 5aXyF5h1zi/7JO0hTRpz8DO+bR6dF1BfVLMZrKHYgjNZFc1YAEJZ8t/daCjUj9WUfL
	 sf7eIOEKE3dAkaeh8dJC0ywVtJnRBfPPo8piO5DCoPD+NHzpEhCb3cPxGcT+FoCrmu
	 Cqyr14b/Yk56w==
Message-ID: <e4d3ab91-9c53-79a0-76f8-098e6b846441@collabora.com>
Date: Mon, 30 May 2022 14:16:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 2/2] PM / devfreq: mediatek: Introduce MediaTek CCI
 devfreq driver
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220527110036.8810-1-johnson.wang@mediatek.com>
 <20220527110036.8810-3-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220527110036.8810-3-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_051639_278298_D10FFF9A 
X-CRM114-Status: GOOD (  32.57  )
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

Il 27/05/22 13:00, Johnson Wang ha scritto:
> We introduce a devfreq driver for the MediaTek Cache Coherent Interconnect
> (CCI) used by some MediaTek SoCs.
> 
> In this driver, we use the passive devfreq driver to get target frequencies
> and adjust voltages accordingly. In MT8183 and MT8186, the MediaTek CCI
> is supplied by the same regulators with the little core CPUs.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
> This patch depends on "devfreq-testing"[1].
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/log/?h=devfreq-testing
> ---
>   drivers/devfreq/Kconfig           |  10 +
>   drivers/devfreq/Makefile          |   1 +
>   drivers/devfreq/mtk-cci-devfreq.c | 441 ++++++++++++++++++++++++++++++
>   3 files changed, 452 insertions(+)
>   create mode 100644 drivers/devfreq/mtk-cci-devfreq.c
> 
> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> index 87eb2b837e68..9754d8b31621 100644
> --- a/drivers/devfreq/Kconfig
> +++ b/drivers/devfreq/Kconfig
> @@ -120,6 +120,16 @@ config ARM_TEGRA_DEVFREQ
>   	  It reads ACTMON counters of memory controllers and adjusts the
>   	  operating frequencies and voltages with OPP support.
>   
> +config ARM_MEDIATEK_CCI_DEVFREQ
> +	tristate "MEDIATEK CCI DEVFREQ Driver"
> +	depends on ARM_MEDIATEK_CPUFREQ || COMPILE_TEST
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
> index 000000000000..df42da35b312
> --- /dev/null
> +++ b/drivers/devfreq/mtk-cci-devfreq.c
> @@ -0,0 +1,441 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2022 MediaTek Inc.
> + */
> +

..snip..

> +};
> +
> +static int mtk_ccifreq_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_ccifreq_drv *drv;
> +	struct devfreq_passive_data *passive_data;
> +	struct dev_pm_opp *opp;
> +	unsigned long rate, opp_volt;
> +	int ret;
> +
> +	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
> +	if (!drv)
> +		return -ENOMEM;
> +
> +	drv->dev = dev;
> +	drv->soc_data = (const struct mtk_ccifreq_platform_data *)
> +				of_device_get_match_data(&pdev->dev);
> +	mutex_init(&drv->reg_lock);
> +	platform_set_drvdata(pdev, drv);
> +
> +	drv->cci_clk = devm_clk_get(dev, "cci");
> +	if (IS_ERR(drv->cci_clk)) {
> +		ret = PTR_ERR(drv->cci_clk);
> +		return dev_err_probe(dev, ret,
> +				     "failed to get cci clk: %d\n", ret);
> +	}
> +
> +	drv->inter_clk = devm_clk_get(dev, "intermediate");
> +	if (IS_ERR(drv->inter_clk)) {
> +		ret = PTR_ERR(drv->inter_clk);
> +		return dev_err_probe(dev, ret,
> +				     "failed to get intermediate clk: %d\n", ret);
> +	}
> +
> +	drv->proc_reg = devm_regulator_get_optional(dev, "proc");

In the devicetree binding for this driver, the "proc" regulator is *not* optional,
but here you're using devm_regulator_get_optional.

If this is not optional, you should use devm_regulator_get() instead.

> +	if (IS_ERR(drv->proc_reg)) {
> +		ret = PTR_ERR(drv->proc_reg);
> +		return dev_err_probe(dev, ret,
> +				     "failed to get proc regulator: %d\n", ret);

There's no need to print ret... dev_err_probe() takes care of that for you already:
in this case, you're printing the value of ret twice.

> +	}
> +
> +	ret = regulator_enable(drv->proc_reg);

If you move this call after the devm_regulator_get_optional() call for the sram
vreg, you will be able to use dev_err_probe for the latter as well.

> +	if (ret) {
> +		dev_err(dev, "failed to enable proc regulator\n");

Why aren't you using dev_err_probe here, like you've done for the other instances?

> +		return ret;
> +	}
> +
> +	drv->sram_reg = devm_regulator_get_optional(dev, "sram");
> +	if (IS_ERR(drv->sram_reg))
> +		drv->sram_reg = NULL;

When you use regulator_get_optional() (including the devm_ variant of it), you
shall return an error, if there's any... that's what the _optional() is for.

if (IS_ERR(drv->sram_reg))
	return dev_err_probe(dev, PTR_ERR(drv->proc_reg),
			     "failed to get sram regulator");

> +	else {
> +		ret = regulator_enable(drv->sram_reg);
> +		if (ret) {
> +			dev_err(dev, "failed to enable sram regulator\n");
> +			goto out_free_resources;
> +		}
> +	}
> +

Regards,
Angelo



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
