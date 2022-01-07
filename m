Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BAAC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 07:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBewuLsGzk2NvWe3IcfHhFZte/cf3SW/gjBK0ct9wl8=; b=0BYOci2AAcmrgd
	Wglgf23t5HunrxGmAwekkpU3TA2daX8fYQtzKmgsHFiC+0HWayvK0EVNjNuZDRmV/w83+Er7ATuX+
	IP/JfPzvjgbPd2Udt8q2zIc/h84qH87jjJqdsKJH+SxhTu3NMlqsp2DIHLRMJHyLP0Fd9MLYUcqgl
	yWmFCmmUsIvn1BJEEBoZkp7bO/aduuY9wIfAIjxjmm2ZrrHxELffc+Phe7a+dlgAaZPnOgOjBx4Pw
	aWZpLqtMgFmodMI6G5qV3qXFfLah6aSuku97EnFrtFHaQBq/WdKggit3yQOa0jfIGKw3mgBbvZS8E
	w+AUvtqWHeYbngSYHFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5k4X-002nde-Eo; Fri, 07 Jan 2022 07:54:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5k4L-002nbO-8C; Fri, 07 Jan 2022 07:53:51 +0000
X-UUID: f5f2167025674617968e638a79e2153b-20220107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=s5Ox6CCUO5y1I4595HQxLlQav8mY/2EeXiRD7zQ7bu8=; 
 b=eg4zGIpuWpan8u98X+0ejdNKS26N8SgZ+aEVFduGZLkDrL1vWqWcDYDoJyIZ4ruBfQ5UOR9sErtBjg4gSWGEbAApRrsZjxnci0MXIn0NL+q2ghB2fCoyoxCqyfYkIc+prjaaOtFPTR2u2eXoN5L21U8k1xsGR4//eIFA5qGixBc=;
X-UUID: f5f2167025674617968e638a79e2153b-20220107
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 693762627; Fri, 07 Jan 2022 00:53:45 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 23:53:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 7 Jan 2022 15:53:36 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 Jan 2022 15:53:35 +0800
Message-ID: <ff5616ca0cbace3c304b94246f405b5831de1a41.camel@mediatek.com>
Subject: Re: [PATCH v1 3/3] mmc: mediatek: add support for SDIO eint irq
From: Axe Yang <axe.yang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Ulf
 Hansson" <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 "Chaotian Jing" <chaotian.jing@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>, Andrew Jeffery
 <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, Tian Tao
 <tiantao6@hisilicon.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Fri, 7 Jan 2022 15:53:35 +0800
In-Reply-To: <63cd9b04-8ff5-00ff-bbc4-7bc110080e41@collabora.com>
References: <20211227083641.12538-1-axe.yang@mediatek.com>
 <20211227083641.12538-4-axe.yang@mediatek.com>
 <63cd9b04-8ff5-00ff-bbc4-7bc110080e41@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_235349_336484_1880FFCD 
X-CRM114-Status: GOOD (  41.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2022-01-04 at 11:44 +0100, AngeloGioacchino Del Regno wrote:
> Il 27/12/21 09:36, Axe Yang ha scritto:
> > Add support for eint irq when MSDC is used as an SDIO host. This
> > feature requires SDIO device support async irq function. With this
> > feature,SDIO host can be awakened by SDIO card in suspend state,
> > without additional pin.
> > 
> > MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> > turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> > resume, switch GPIO function back to DAT1 mode then turn on clock.
> > 
> > Some device tree property should be added or modified in msdc node
> > to support SDIO eint irq. Pinctrls named state_dat1 and state_eint
> > are mandatory. And cap-sdio-async-int flag is necessary since this
> > feature depends on asynchronous interrupt:
> > 	&mmcX {
> > 		...
> > 		pinctrl-names = "default", "state_uhs", "state_eint",
> > 						"state_dat1";
> > 		...
> > 		pinctrl-2 = <&mmc2_pins_eint>;
> > 		pinctrl-3 = <&mmc2_pins_dat1>;
> > 		...
> > 		cap-sdio-async-int;
> > 		...
> > 	};
> > 
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> 
> Hello Axe,
> I agree on Andy's review, and I have some more comments...
> 
> > ---
> >   drivers/mmc/host/mtk-sd.c | 113
> > ++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 107 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index 4dfc246c5f95..8f23349f2963 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> > @@ -1,6 +1,6 @@
> >   // SPDX-License-Identifier: GPL-2.0-only
> >   /*
> > - * Copyright (c) 2014-2015 MediaTek Inc.
> > + * Copyright (c) 2014-2021 MediaTek Inc.
> >    * Author: Chaotian.Jing <chaotian.jing@mediatek.com>
> >    */
> >   
> > @@ -432,9 +432,13 @@ struct msdc_host {
> >   	struct pinctrl *pinctrl;
> >   	struct pinctrl_state *pins_default;
> >   	struct pinctrl_state *pins_uhs;
> > +	struct pinctrl_state *pins_eint;
> > +	struct pinctrl_state *pins_dat1;
> >   	struct delayed_work req_timeout;
> >   	int irq;		/* host interrupt */
> 
> int eint_irq; should be here, under the host interrupt, for the sake
> of perfection.

Will fix it in next version.

> 
> >   	struct reset_control *reset;
> > +	int eint_irq;		/* device interrupt */
> > +	int sdio_irq_cnt;	/* irq enable cnt */
> >   
> >   	struct clk *src_clk;	/* msdc source clock */
> >   	struct clk *h_clk;      /* msdc h_clk */
> > @@ -1519,10 +1523,12 @@ static void msdc_enable_sdio_irq(struct
> > mmc_host *mmc, int enb)
> >   	__msdc_enable_sdio_irq(host, enb);
> >   	spin_unlock_irqrestore(&host->lock, flags);
> >   
> > -	if (enb)
> > -		pm_runtime_get_noresume(host->dev);
> > -	else
> > -		pm_runtime_put_noidle(host->dev);
> > +	if (mmc->card && !mmc->card->cccr.enable_async_int) {
> > +		if (enb)
> 
> If you are going to rename `enb` to `enable, this means that you're
> changing the
> function signature... so, please, do that as a separated commit.

Okay, will keep 'enb' in this commit.

> 
> > +			pm_runtime_get_noresume(host->dev);
> > +		else
> > +			pm_runtime_put_noidle(host->dev);
> > +	}
> >   }
> >   
> >   static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32
> > intsts)
> > @@ -2380,6 +2386,49 @@ static const struct mmc_host_ops mt_msdc_ops
> > = {
> >   	.hw_reset = msdc_hw_reset,
> >   };
> >   
> > +static irqreturn_t msdc_sdio_eint_irq(int irq, void *dev_id)
> > +{
> > +	unsigned long flags;
> > +	struct msdc_host *host = (struct msdc_host *)dev_id;
> > +	struct mmc_host *mmc = mmc_from_priv(host);
> > +
> > +	spin_lock_irqsave(&host->lock, flags);
> > +	if (likely(host->sdio_irq_cnt > 0)) {
> > +		disable_irq_nosync(host->eint_irq);
> > +		disable_irq_wake(host->eint_irq);
> > +		host->sdio_irq_cnt--;
> > +	}
> > +	spin_unlock_irqrestore(&host->lock, flags);
> > +
> > +	sdio_signal_irq(mmc);
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static int msdc_request_dat1_eint_irq(struct msdc_host *host)
> > +{
> > +	struct gpio_desc *desc;
> > +	int ret = 0;
> > +	int irq;
> > +
> > +	desc = devm_gpiod_get_index(host->dev, "eint", 0, GPIOD_IN);
> > +	if (IS_ERR(desc))
> > +		return PTR_ERR(desc);
> > +
> > +	irq = gpiod_to_irq(desc);
> > +	if (irq >= 0) {
> > +		irq_set_status_flags(irq, IRQ_NOAUTOEN);
> > +		ret = devm_request_threaded_irq(host->dev, irq, NULL,
> > msdc_sdio_eint_irq,
> > +						IRQF_TRIGGER_LOW |
> > IRQF_ONESHOT,
> > +						"sdio-eint", host);
> 
> I think you may have misunderstood what Andy tried to say in his
> review: your call
> to the function irq_set_status_flags() is using the right flag -- the
> suggestion
> here is to add the IRQF_NO_AUTOEN flag to the call to
> devm_request_threaded_irq()
> (ex: IRQF_TRIGGER_LOW | IRQF_ONESHOT | IRQF_NO_AUTOEN) and remove the
> now redundant
> call to irq_set_status_flags().

Thank you for explanation. Will fix it in next version.

> 
> 
> > +	} else {
> > +		ret = irq;
> > +	}
> > +
> > +	host->eint_irq = irq;
> > +	return ret;
> > +}
> > +
> >   static const struct cqhci_host_ops msdc_cmdq_ops = {
> >   	.enable         = msdc_cqe_enable,
> >   	.disable        = msdc_cqe_disable,
> > @@ -2534,6 +2583,19 @@ static int msdc_drv_probe(struct
> > platform_device *pdev)
> >   		goto host_free;
> >   	}
> >   
> > +	/* Support for SDIO eint irq */
> > +	host->pins_eint = pinctrl_lookup_state(host->pinctrl,
> > "state_eint");
> > +	if (IS_ERR(host->pins_eint)) {
> > +		dev_dbg(&pdev->dev, "Cannot find pinctrl eint!\n");
> > +	} else {
> > +		host->pins_dat1 = pinctrl_lookup_state(host->pinctrl,
> > "state_dat1");
> > +		if (IS_ERR(host->pins_dat1)) {
> > +			ret = PTR_ERR(host->pins_dat1);
> > +			dev_err(&pdev->dev, "Cannot find pinctrl
> > dat1!\n");
> > +			goto host_free;
> > +		}
> > +	}
> > +
> >   	msdc_of_property_parse(pdev, host);
> >   
> >   	host->dev = &pdev->dev;
> > @@ -2621,6 +2683,16 @@ static int msdc_drv_probe(struct
> > platform_device *pdev)
> >   	if (ret)
> >   		goto release;
> >   
> > +	if (!IS_ERR(host->pins_eint) && !IS_ERR(host->pins_dat1)) {
> > +		ret = msdc_request_dat1_eint_irq(host);
> > +		if (ret) {
> > +			dev_err(host->dev, "Failed to register data1
> > eint irq!\n");
> > +			goto release;
> > +		}
> > +
> > +		pinctrl_select_state(host->pinctrl, host->pins_dat1);
> > +	}
> > +
> >   	pm_runtime_set_active(host->dev);
> >   	pm_runtime_set_autosuspend_delay(host->dev,
> > MTK_MMC_AUTOSUSPEND_DELAY);
> >   	pm_runtime_use_autosuspend(host->dev);
> > @@ -2740,21 +2812,50 @@ static void msdc_restore_reg(struct
> > msdc_host *host)
> >   
> >   static int __maybe_unused msdc_runtime_suspend(struct device
> > *dev)
> >   {
> > +	unsigned long flags;
> >   	struct mmc_host *mmc = dev_get_drvdata(dev);
> >   	struct msdc_host *host = mmc_priv(mmc);
> >   
> >   	msdc_save_reg(host);
> > +
> > +	if (!IS_ERR(host->pins_eint)) {
> > +		disable_irq(host->irq);
> > +		pinctrl_select_state(host->pinctrl, host->pins_eint);
> > +		spin_lock_irqsave(&host->lock, flags);
> > +		if (host->sdio_irq_cnt == 0) {
> > +			enable_irq(host->eint_irq);
> > +			enable_irq_wake(host->eint_irq);
> > +			host->sdio_irq_cnt++;
> > +		}
> > +		sdr_clr_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
> > +		spin_unlock_irqrestore(&host->lock, flags);
> > +	}
> >   	msdc_gate_clock(host);
> >   	return 0;
> >   }
> >   
> >   static int __maybe_unused msdc_runtime_resume(struct device *dev)
> >   {
> > +	unsigned long flags;
> >   	struct mmc_host *mmc = dev_get_drvdata(dev);
> >   	struct msdc_host *host = mmc_priv(mmc);
> >   
> >   	msdc_ungate_clock(host);
> >   	msdc_restore_reg(host);
> > +	if (!IS_ERR(host->pins_eint)) {
> > +		spin_lock_irqsave(&host->lock, flags);
> > +		if (host->sdio_irq_cnt > 0) {
> > +			disable_irq_nosync(host->eint_irq);
> > +			disable_irq_wake(host->eint_irq);
> > +			host->sdio_irq_cnt--;
> > +			sdr_set_bits(host->base + SDC_CFG,
> > SDC_CFG_SDIOIDE);
> > +		} else {
> > +			sdr_clr_bits(host->base + MSDC_INTEN,
> > MSDC_INTEN_SDIOIRQ);
> > +		}
> > +		spin_unlock_irqrestore(&host->lock, flags);
> > +		pinctrl_select_state(host->pinctrl, host->pins_uhs);
> > +		enable_irq(host->irq);
> > +	}
> >   	return 0;
> >   }
> >   
> > @@ -2778,7 +2879,7 @@ static int __maybe_unused msdc_resume(struct
> > device *dev)
> >   }
> >   
> >   static const struct dev_pm_ops msdc_dev_pm_ops = {
> > -	SET_SYSTEM_SLEEP_PM_OPS(msdc_suspend, msdc_resume)
> > +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(msdc_suspend, msdc_resume)
> 
> Just a nitpick: msdc_{suspend,resume} are now noirq, so you should
> change the
> function names to msdc_suspend_noirq, msdc_resume_noirq.

Will fix it in next version. Thank you for your suggestion.

> 
> >   	SET_RUNTIME_PM_OPS(msdc_runtime_suspend, msdc_runtime_resume,
> > NULL)
> >   };
> >   
> > 
> 
> Regards,
> - Angelo
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
