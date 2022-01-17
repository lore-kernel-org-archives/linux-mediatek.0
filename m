Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2827C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 10:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tt4sjhpve7k7B358Pjq0XMm4rIFec38NBMUeOYKCVyI=; b=ln4QVjq+Ii15vJ8atvXPpGcYg0
	UHza6bwZaDfVf/nSnmpIx7cHvTUb8XYwb6JZX2xHoQ5vU9Js04QOnJcc2xSqv54sKfVkXgyNiRxr+
	7GxyF4Z1pINtQHw6nqCo3GwkDiQljLxw7AgpiSFpw0Cy6egeT/6z3hHSW0mD97WoF/Kqn5OcgGsPc
	O3bPucR9yrwTTNRdmHBqg0UWxy//R0AZePJ7zGFSz/tD+900GH3plRgn4Bb7HtGkwC/lLlswIAPyq
	mLFY3bnW4DVaw0pA0Ip7fE+UTAOcMLAVeub+y+IfFLAi64tKL0qDzwsuwENU7AeDzTkkR3xhbUtfA
	g2ou3/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9PbA-00EZ1J-Ju; Mon, 17 Jan 2022 10:50:52 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Paw-00EYyT-Th; Mon, 17 Jan 2022 10:50:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 65E1A1F42063
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642416637;
 bh=ptiEFjXjhoBJsX0S13oN/2lvPYOFqtq8gyPRviCgm60=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FAEGTZraxddVLjoujpmzgnSd9KLr7FjNwLAV+yAVPuClpARIKHBMsOh88ehA+L2wh
 dHlXJJveXAvt4RLAPcPesyOeKew9lEp/oDUV0pszTBhSMFiER5h8AMZGEHknf3MXQk
 9VOHG91RQaO2i2UxtGbs3Xgv81febwN8b0fDsv6prWFwpXeui1I9/WMjV1297JlSCB
 7bzZCVCJtbPgHaWrq9jOZorTTJOR+aB3kC35KYpNa/DDa7Bzk1J/PCfguV3EvJoLu/
 GF4FVoxZHbBFs4vKcVBW0k8ezmHPmQdEFlt6vVi7sHs7rH681frfna3h58rqpt//BA
 sGLUXDUSXr8kw==
Subject: Re: [PATCH 3/3] mmc: mediatek: add support for SDIO eint IRQ
To: Axe Yang <axe.yang@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>,
 Andrew Jeffery <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>,
 Tian Tao <tiantao6@hisilicon.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Mao <yong.mao@mediatek.com>
References: <20220117071220.17330-1-axe.yang@mediatek.com>
 <20220117071220.17330-4-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <754779eb-71f9-2083-a204-1d98b4a04a08@collabora.com>
Date: Mon, 17 Jan 2022 11:50:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220117071220.17330-4-axe.yang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_025039_278807_1777FAD6 
X-CRM114-Status: GOOD (  36.56  )
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

Il 17/01/22 08:12, Axe Yang ha scritto:
> Add support for eint IRQ when MSDC is used as an SDIO host. This
> feature requires SDIO device support async IRQ function. With this
> feature, SDIO host can be awakened by SDIO card in suspend state,
> without additional pin.
> 
> MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> resume, switch GPIO function back to DAT1 mode then turn on clock.
> 
> Some device tree property should be added or modified in MSDC node
> to support SDIO eint IRQ. Pinctrls named state_dat1 and state_eint
> are mandatory. And cap-sdio-async-irq flag is necessary since this
> feature depends on asynchronous interrupt:
>          &mmcX {
>                  ...
>                  pinctrl-names = "default", "state_uhs", "state_eint",
>                                  "state_dat1";
>                  ...
>                  pinctrl-2 = <&mmc2_pins_eint>;
>                  pinctrl-3 = <&mmc2_pins_dat1>;
>                  ...
>                  cap-sdio-async-irq;
>                  ...
>          };
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> ---
>   drivers/mmc/host/mtk-sd.c | 125 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 117 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 65037e1d7723..cbdbcce99fd9 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2014-2015 MediaTek Inc.
> + * Copyright (c) 2022 MediaTek Inc.
>    * Author: Chaotian.Jing <chaotian.jing@mediatek.com>
>    */
>   
> @@ -9,6 +9,7 @@
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/dma-mapping.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/iopoll.h>
>   #include <linux/ioport.h>
>   #include <linux/irq.h>
> @@ -440,8 +441,12 @@ struct msdc_host {
>   	struct pinctrl *pinctrl;
>   	struct pinctrl_state *pins_default;
>   	struct pinctrl_state *pins_uhs;
> +	struct pinctrl_state *pins_eint;
> +	struct pinctrl_state *pins_dat1;
>   	struct delayed_work req_timeout;
>   	int irq;		/* host interrupt */
> +	int eint_irq;		/* device interrupt */
> +	int sdio_irq_cnt;	/* irq enable cnt */
>   	struct reset_control *reset;
>   
>   	struct clk *src_clk;	/* msdc source clock */
> @@ -465,6 +470,7 @@ struct msdc_host {
>   	bool hs400_tuning;	/* hs400 mode online tuning */
>   	bool internal_cd;	/* Use internal card-detect logic */
>   	bool cqhci;		/* support eMMC hw cmdq */
> +	bool sdio_eint_ready;	/* Ready to support SDIO eint interrupt */
>   	struct msdc_save_para save_para; /* used when gate HCLK */
>   	struct msdc_tune_para def_tune_para; /* default tune setting */
>   	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
> @@ -1527,10 +1533,12 @@ static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
>   	__msdc_enable_sdio_irq(host, enb);
>   	spin_unlock_irqrestore(&host->lock, flags);
>   
> -	if (enb)
> -		pm_runtime_get_noresume(host->dev);
> -	else
> -		pm_runtime_put_noidle(host->dev);
> +	if (mmc->card && !mmc->card->cccr.enable_async_irq) {
> +		if (enb)
> +			pm_runtime_get_noresume(host->dev);
> +		else
> +			pm_runtime_put_noidle(host->dev);
> +	}
>   }
>   
>   static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
> @@ -2461,6 +2469,50 @@ static const struct mmc_host_ops mt_msdc_ops = {
>   	.hw_reset = msdc_hw_reset,
>   };
>   
> +static irqreturn_t msdc_sdio_eint_irq(int irq, void *dev_id)
> +{
> +	struct msdc_host *host = dev_id;
> +	struct mmc_host *mmc = mmc_from_priv(host);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&host->lock, flags);
> +	if (likely(host->sdio_irq_cnt > 0)) {
> +		disable_irq_nosync(host->eint_irq);
> +		disable_irq_wake(host->eint_irq);
> +		host->sdio_irq_cnt--;
> +	}
> +	spin_unlock_irqrestore(&host->lock, flags);
> +
> +	sdio_signal_irq(mmc);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int msdc_request_dat1_eint_irq(struct msdc_host *host)
> +{
> +	struct gpio_desc *desc;
> +	int irq, ret;
> +
> +	desc = devm_gpiod_get(host->dev, "eint", GPIOD_IN);
> +	if (IS_ERR(desc))
> +		return PTR_ERR(desc);
> +
> +	ret = gpiod_to_irq(desc);
> +	if (ret < 0)
> +		return ret;
> +
> +	irq = ret;
> +	ret = devm_request_threaded_irq(host->dev, irq, NULL, msdc_sdio_eint_irq,
> +					IRQF_TRIGGER_LOW | IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					"sdio-eint", host);
> +	if (ret)
> +		return ret;
> +
> +	host->eint_irq = irq;
> +
> +	return 0;
> +}
> +
>   static const struct cqhci_host_ops msdc_cmdq_ops = {
>   	.enable         = msdc_cqe_enable,
>   	.disable        = msdc_cqe_disable,
> @@ -2631,6 +2683,23 @@ static int msdc_drv_probe(struct platform_device *pdev)
>   		goto host_free;
>   	}
>   
> +	if (!(mmc->caps2 & MMC_CAP2_NO_SDIO)) {

Please, also check for the async irq capability here:

if (!(mmc->caps2 & MMC_CAP2_NO_SDIO) && (mmc->caps2 & MMC_CAP2_SDIO_ASYNC_IRQ)) {

...because if we have "state_eint" specified in DT, but we didn't *also* specify
cap-sdio-async-irq, then clearly we don't want to use this functionality - hence
it becomes useless to register the interrupt handler for that because we're never
enabling the CCCR_INTERRUPT_EXT on the card (from drivers/mmc/core/host.c).

Regards,
Angelo

> +		/* Support for SDIO eint irq */
> +		host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
> +		if (IS_ERR(host->pins_eint)) {
> +			dev_dbg(&pdev->dev, "Cannot find pinctrl eint!\n");
> +		} else {
> +			host->pins_dat1 = pinctrl_lookup_state(host->pinctrl, "state_dat1");
> +			if (IS_ERR(host->pins_dat1)) {
> +				ret = dev_err_probe(&pdev->dev, PTR_ERR(host->pins_dat1),
> +						    "Cannot find pinctrl dat1!\n");
> +				goto host_free;
> +			}
> +
> +			host->sdio_eint_ready = true;
> +		}
> +	}
> +
>   	msdc_of_property_parse(pdev, host);
>   
>   	host->dev = &pdev->dev;
> @@ -2722,6 +2791,16 @@ static int msdc_drv_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto release;
>   
> +	if (host->sdio_eint_ready) {
> +		ret = msdc_request_dat1_eint_irq(host);
> +		if (ret) {
> +			dev_err(host->dev, "Failed to register data1 eint irq!\n");
> +			goto release;
> +		}
> +
> +		pinctrl_select_state(host->pinctrl, host->pins_dat1);
> +	}
> +
>   	pm_runtime_set_active(host->dev);
>   	pm_runtime_set_autosuspend_delay(host->dev, MTK_MMC_AUTOSUSPEND_DELAY);
>   	pm_runtime_use_autosuspend(host->dev);
> @@ -2841,16 +2920,31 @@ static void msdc_restore_reg(struct msdc_host *host)
>   
>   static int __maybe_unused msdc_runtime_suspend(struct device *dev)
>   {
> +	unsigned long flags;
>   	struct mmc_host *mmc = dev_get_drvdata(dev);
>   	struct msdc_host *host = mmc_priv(mmc);
>   
>   	msdc_save_reg(host);
> +
> +	if (host->sdio_eint_ready) {
> +		disable_irq(host->irq);
> +		pinctrl_select_state(host->pinctrl, host->pins_eint);
> +		spin_lock_irqsave(&host->lock, flags);
> +		if (host->sdio_irq_cnt == 0) {
> +			enable_irq(host->eint_irq);
> +			enable_irq_wake(host->eint_irq);
> +			host->sdio_irq_cnt++;
> +		}
> +		sdr_clr_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
> +		spin_unlock_irqrestore(&host->lock, flags);
> +	}
>   	msdc_gate_clock(host);
>   	return 0;
>   }
>   
>   static int __maybe_unused msdc_runtime_resume(struct device *dev)
>   {
> +	unsigned long flags;
>   	struct mmc_host *mmc = dev_get_drvdata(dev);
>   	struct msdc_host *host = mmc_priv(mmc);
>   	int ret;
> @@ -2860,10 +2954,25 @@ static int __maybe_unused msdc_runtime_resume(struct device *dev)
>   		return ret;
>   
>   	msdc_restore_reg(host);
> +
> +	if (host->sdio_eint_ready) {
> +		spin_lock_irqsave(&host->lock, flags);
> +		if (host->sdio_irq_cnt > 0) {
> +			disable_irq_nosync(host->eint_irq);
> +			disable_irq_wake(host->eint_irq);
> +			host->sdio_irq_cnt--;
> +			sdr_set_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
> +		} else {
> +			sdr_clr_bits(host->base + MSDC_INTEN, MSDC_INTEN_SDIOIRQ);
> +		}
> +		spin_unlock_irqrestore(&host->lock, flags);
> +		pinctrl_select_state(host->pinctrl, host->pins_uhs);
> +		enable_irq(host->irq);
> +	}
>   	return 0;
>   }
>   
> -static int __maybe_unused msdc_suspend(struct device *dev)
> +static int __maybe_unused msdc_suspend_noirq(struct device *dev)
>   {
>   	struct mmc_host *mmc = dev_get_drvdata(dev);
>   	int ret;
> @@ -2877,13 +2986,13 @@ static int __maybe_unused msdc_suspend(struct device *dev)
>   	return pm_runtime_force_suspend(dev);
>   }
>   
> -static int __maybe_unused msdc_resume(struct device *dev)
> +static int __maybe_unused msdc_resume_noirq(struct device *dev)
>   {
>   	return pm_runtime_force_resume(dev);
>   }
>   
>   static const struct dev_pm_ops msdc_dev_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(msdc_suspend, msdc_resume)
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(msdc_suspend_noirq, msdc_resume_noirq)
>   	SET_RUNTIME_PM_OPS(msdc_runtime_suspend, msdc_runtime_resume, NULL)
>   };
>   
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
