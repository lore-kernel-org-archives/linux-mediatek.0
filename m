Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02616C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 10:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kyF3fGgQe4eL1mqLnmnswIxDV0T/l0mYdBSVeg8jBg=; b=fYC62HB5n+1XNyqA5v3ywcKhbX
	xcFyMFM0WSvcp4UX5K9/ZB7cuMN1UjJpEhUA5MatS5/0L6k7XhNn1eA1NMImSvAGAJw9k5/qdEzQL
	2i2dkfeh9fg8kIcag50+sf1ukftatR1QMEvD1mVgZjBw/acGx/tWDIazFIDBCxTOVRYzuCBv0xtOK
	mIaU04pVopuM8UIggMqf15ymikyVST/opsYxfFJCv07yus8jr+r0V7rP8StQXJ1eTbEJCatLWkSIr
	IkWIGhP6m7Q+cNzF5zSPUL4APM2Vfk9tJqdsFKTeGaC5qNvLqBKpWIyOotpnjAbVFqwvQ98CXaiW/
	1VWG6bkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4hJ8-00BBRT-09; Tue, 04 Jan 2022 10:44:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4hIr-00BBOW-NS; Tue, 04 Jan 2022 10:44:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2681E1F42F5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641293068;
 bh=uwhY4LBvB7E37dCuxFmD+MVx4J0RSmlRWDwAc0BSnUM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LMH6dBCjkZ3Y3xypofpMOmGhMVY4PYCBFIeOagPY2Mox8X9uke+uDTgaQ/CcskNZf
 cB6jPfYpD6hhPe4DLhyljguf3G4eq7/FRZRRCADTSY6Vxi7ceR65Knsc6a7uQhzRfL
 q85oM+Whi/Qs/3TRzKv2flX9hydXDNz9crPrekcGhrMRxlgWKmxMlqr0HjHHNbRDSH
 bZt2lvDcpxZf1Ryy/CxpzyRTadpLXdvamaBA1hNR8kqk+1DvRPgBqQ9EPeyMGpDN7U
 SkMlZ0uV6BLHoryv4Vy0bmjapnky3c7ZvK6GSkj83hXjlg9SQza1w2rHKXCiuJFZt2
 9V8o4/sQhn2cw==
Subject: Re: [PATCH v1 3/3] mmc: mediatek: add support for SDIO eint irq
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
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20211227083641.12538-1-axe.yang@mediatek.com>
 <20211227083641.12538-4-axe.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <63cd9b04-8ff5-00ff-bbc4-7bc110080e41@collabora.com>
Date: Tue, 4 Jan 2022 11:44:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211227083641.12538-4-axe.yang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_024430_085032_D3300790 
X-CRM114-Status: GOOD (  40.60  )
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

Il 27/12/21 09:36, Axe Yang ha scritto:
> Add support for eint irq when MSDC is used as an SDIO host. This
> feature requires SDIO device support async irq function. With this
> feature,SDIO host can be awakened by SDIO card in suspend state,
> without additional pin.
> 
> MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> resume, switch GPIO function back to DAT1 mode then turn on clock.
> 
> Some device tree property should be added or modified in msdc node
> to support SDIO eint irq. Pinctrls named state_dat1 and state_eint
> are mandatory. And cap-sdio-async-int flag is necessary since this
> feature depends on asynchronous interrupt:
> 	&mmcX {
> 		...
> 		pinctrl-names = "default", "state_uhs", "state_eint",
> 						"state_dat1";
> 		...
> 		pinctrl-2 = <&mmc2_pins_eint>;
> 		pinctrl-3 = <&mmc2_pins_dat1>;
> 		...
> 		cap-sdio-async-int;
> 		...
> 	};
> 
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

Hello Axe,
I agree on Andy's review, and I have some more comments...

> ---
>   drivers/mmc/host/mtk-sd.c | 113 ++++++++++++++++++++++++++++++++++++--
>   1 file changed, 107 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 4dfc246c5f95..8f23349f2963 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (c) 2014-2015 MediaTek Inc.
> + * Copyright (c) 2014-2021 MediaTek Inc.
>    * Author: Chaotian.Jing <chaotian.jing@mediatek.com>
>    */
>   
> @@ -432,9 +432,13 @@ struct msdc_host {
>   	struct pinctrl *pinctrl;
>   	struct pinctrl_state *pins_default;
>   	struct pinctrl_state *pins_uhs;
> +	struct pinctrl_state *pins_eint;
> +	struct pinctrl_state *pins_dat1;
>   	struct delayed_work req_timeout;
>   	int irq;		/* host interrupt */

int eint_irq; should be here, under the host interrupt, for the sake of perfection.

>   	struct reset_control *reset;
> +	int eint_irq;		/* device interrupt */
> +	int sdio_irq_cnt;	/* irq enable cnt */
>   
>   	struct clk *src_clk;	/* msdc source clock */
>   	struct clk *h_clk;      /* msdc h_clk */
> @@ -1519,10 +1523,12 @@ static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
>   	__msdc_enable_sdio_irq(host, enb);
>   	spin_unlock_irqrestore(&host->lock, flags);
>   
> -	if (enb)
> -		pm_runtime_get_noresume(host->dev);
> -	else
> -		pm_runtime_put_noidle(host->dev);
> +	if (mmc->card && !mmc->card->cccr.enable_async_int) {
> +		if (enb)

If you are going to rename `enb` to `enable, this means that you're changing the
function signature... so, please, do that as a separated commit.

> +			pm_runtime_get_noresume(host->dev);
> +		else
> +			pm_runtime_put_noidle(host->dev);
> +	}
>   }
>   
>   static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
> @@ -2380,6 +2386,49 @@ static const struct mmc_host_ops mt_msdc_ops = {
>   	.hw_reset = msdc_hw_reset,
>   };
>   
> +static irqreturn_t msdc_sdio_eint_irq(int irq, void *dev_id)
> +{
> +	unsigned long flags;
> +	struct msdc_host *host = (struct msdc_host *)dev_id;
> +	struct mmc_host *mmc = mmc_from_priv(host);
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
> +	int ret = 0;
> +	int irq;
> +
> +	desc = devm_gpiod_get_index(host->dev, "eint", 0, GPIOD_IN);
> +	if (IS_ERR(desc))
> +		return PTR_ERR(desc);
> +
> +	irq = gpiod_to_irq(desc);
> +	if (irq >= 0) {
> +		irq_set_status_flags(irq, IRQ_NOAUTOEN);
> +		ret = devm_request_threaded_irq(host->dev, irq, NULL, msdc_sdio_eint_irq,
> +						IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> +						"sdio-eint", host);

I think you may have misunderstood what Andy tried to say in his review: your call
to the function irq_set_status_flags() is using the right flag -- the suggestion
here is to add the IRQF_NO_AUTOEN flag to the call to devm_request_threaded_irq()
(ex: IRQF_TRIGGER_LOW | IRQF_ONESHOT | IRQF_NO_AUTOEN) and remove the now redundant
call to irq_set_status_flags().


> +	} else {
> +		ret = irq;
> +	}
> +
> +	host->eint_irq = irq;
> +	return ret;
> +}
> +
>   static const struct cqhci_host_ops msdc_cmdq_ops = {
>   	.enable         = msdc_cqe_enable,
>   	.disable        = msdc_cqe_disable,
> @@ -2534,6 +2583,19 @@ static int msdc_drv_probe(struct platform_device *pdev)
>   		goto host_free;
>   	}
>   
> +	/* Support for SDIO eint irq */
> +	host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
> +	if (IS_ERR(host->pins_eint)) {
> +		dev_dbg(&pdev->dev, "Cannot find pinctrl eint!\n");
> +	} else {
> +		host->pins_dat1 = pinctrl_lookup_state(host->pinctrl, "state_dat1");
> +		if (IS_ERR(host->pins_dat1)) {
> +			ret = PTR_ERR(host->pins_dat1);
> +			dev_err(&pdev->dev, "Cannot find pinctrl dat1!\n");
> +			goto host_free;
> +		}
> +	}
> +
>   	msdc_of_property_parse(pdev, host);
>   
>   	host->dev = &pdev->dev;
> @@ -2621,6 +2683,16 @@ static int msdc_drv_probe(struct platform_device *pdev)
>   	if (ret)
>   		goto release;
>   
> +	if (!IS_ERR(host->pins_eint) && !IS_ERR(host->pins_dat1)) {
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
> @@ -2740,21 +2812,50 @@ static void msdc_restore_reg(struct msdc_host *host)
>   
>   static int __maybe_unused msdc_runtime_suspend(struct device *dev)
>   {
> +	unsigned long flags;
>   	struct mmc_host *mmc = dev_get_drvdata(dev);
>   	struct msdc_host *host = mmc_priv(mmc);
>   
>   	msdc_save_reg(host);
> +
> +	if (!IS_ERR(host->pins_eint)) {
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
>   
>   	msdc_ungate_clock(host);
>   	msdc_restore_reg(host);
> +	if (!IS_ERR(host->pins_eint)) {
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
> @@ -2778,7 +2879,7 @@ static int __maybe_unused msdc_resume(struct device *dev)
>   }
>   
>   static const struct dev_pm_ops msdc_dev_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(msdc_suspend, msdc_resume)
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(msdc_suspend, msdc_resume)

Just a nitpick: msdc_{suspend,resume} are now noirq, so you should change the
function names to msdc_suspend_noirq, msdc_resume_noirq.

>   	SET_RUNTIME_PM_OPS(msdc_runtime_suspend, msdc_runtime_resume, NULL)
>   };
>   
> 

Regards,
- Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
