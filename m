Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFF9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fMLx1j2/XHBLufwAMQ/abE32h9grGdPXi7towJyk9rw=; b=EghOVqWJUcYzTM
	qv9ZR88Pl78v876dYGsv+klO3g9QQweXxnm//mx7Lzov7F+BrE55xziHzrO8SUDKHMGMMOMsYvQdV
	ZlworfVUeNew7j9vtmt9WT7l3vFEXgJ/pZKyaNCYOF6UpocUTs3UG8nYyLbM3Qq0RlOGj8QWrqPkJ
	oTXjuL+ewNn9VsKOtSKhvEGGAxOe98JVrJ1pRqMeQmFLVZp7k26wIvLfodFPBbIhzT0scWXeSPyKp
	5aRYUj3/ztlEdohl6gSgTnR4QVbXbbOznVYyK0dBaZBeA1OOspDWyR3rjyQajsQFd9o6byIQe5K7S
	yAtDYpS/xfkDWlqYucOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZTjj-00EqMY-5n; Wed, 30 Mar 2022 08:31:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZTjS-00EqDo-Hm; Wed, 30 Mar 2022 08:31:12 +0000
X-UUID: 0e7183a2697e457aadc73cc34a36c01c-20220330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2fGxG1WCALJTkrJrcRwJTvJBCFwiCwoFqjWOglBWo/o=; 
 b=ASjOaKHlmC3wn7tH4ude64uKnCUUwb9Bx9hvL/etJi5cC9PtCr1Ako3iiwlg/OZvzfP1Kv43NDpqDkpkhaQJykayikWS97MB/XvVOc0W7B6yH0kaw4QpSdS6MBj075p7pgL+SznSU2sOJvqAe7dBPfKUGgsXV6CSxOBt5z/8OXs=;
X-UUID: 0e7183a2697e457aadc73cc34a36c01c-20220330
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chaotian.jing@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 91019291; Wed, 30 Mar 2022 01:31:02 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 01:31:00 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 30 Mar 2022 16:30:59 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 16:30:58 +0800
Message-ID: <6f5a47588dd0b9293c8bc6ba1fc6794ab57d6ac7.camel@mediatek.com>
Subject: Re: [PATCH v9 3/3] mmc: mediatek: add support for SDIO eint wakup IRQ
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: Axe Yang <axe.yang@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>, Andrew Jeffery
 <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, Tian Tao
 <tiantao6@hisilicon.com>, <angelogioacchino.delregno@collabora.com>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Yong Mao <yong.mao@mediatek.com>
Date: Wed, 30 Mar 2022 16:30:58 +0800
In-Reply-To: <20220329032913.8750-4-axe.yang@mediatek.com>
References: <20220329032913.8750-1-axe.yang@mediatek.com>
 <20220329032913.8750-4-axe.yang@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_013110_629376_FBF2AF7C 
X-CRM114-Status: GOOD (  31.89  )
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

On Tue, 2022-03-29 at 11:29 +0800, Axe Yang wrote:
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
> to support SDIO eint IRQ. Pinctrls "state_eint" is mandatory. Since
> this feature depends on asynchronous interrupts, "wakeup-source",
> "keep-power-in-suspend" and "cap-sdio-irq" flags are necessary, and
> the interrupts list should be extended:
>         &mmcX {
> 		...
> 		interrupts-extended = <...>,
>                               	      <&pio xxx
> IRQ_TYPE_LEVEL_LOW>;
>                 ...
>                 pinctrl-names = "default", "state_uhs", "state_eint";
>                 ...
>                 pinctrl-2 = <&mmc2_pins_eint>;
>                 ...
>                 cap-sdio-irq;
> 		keep-power-in-suspend;
> 		wakeup-source;
>                 ...
>         };
> 
> Co-developed-by: Yong Mao <yong.mao@mediatek.com>
> Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
  Acked-by: Chaotian Jing <chaotian.jing@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 94 +++++++++++++++++++++++++++++++++++
> ----
>  1 file changed, 86 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 65037e1d7723..2905d7134243 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2014-2015 MediaTek Inc.
> + * Copyright (c) 2014-2015, 2022 MediaTek Inc.
>   * Author: Chaotian.Jing <chaotian.jing@mediatek.com>
>   */
>  
> @@ -20,6 +20,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> @@ -440,8 +441,11 @@ struct msdc_host {
>  	struct pinctrl *pinctrl;
>  	struct pinctrl_state *pins_default;
>  	struct pinctrl_state *pins_uhs;
> +	struct pinctrl_state *pins_eint;
>  	struct delayed_work req_timeout;
>  	int irq;		/* host interrupt */
> +	int eint_irq;		/* interrupt from sdio device for
> waking up system */
> +	int sdio_wake_irq_depth;
>  	struct reset_control *reset;
>  
>  	struct clk *src_clk;	/* msdc source clock */
> @@ -465,6 +469,7 @@ struct msdc_host {
>  	bool hs400_tuning;	/* hs400 mode online tuning */
>  	bool internal_cd;	/* Use internal card-detect logic */
>  	bool cqhci;		/* support eMMC hw cmdq */
> +	bool sdio_eint_ready;	/* Ready to support SDIO eint
> interrupt */
>  	struct msdc_save_para save_para; /* used when gate HCLK */
>  	struct msdc_tune_para def_tune_para; /* default tune setting */
>  	struct msdc_tune_para saved_tune_para; /* tune result of
> CMD21/CMD19 */
> @@ -1527,10 +1532,12 @@ static void msdc_enable_sdio_irq(struct
> mmc_host *mmc, int enb)
>  	__msdc_enable_sdio_irq(host, enb);
>  	spin_unlock_irqrestore(&host->lock, flags);
>  
> -	if (enb)
> -		pm_runtime_get_noresume(host->dev);
> -	else
> -		pm_runtime_put_noidle(host->dev);
> +	if (mmc->card && !mmc_card_enable_async_irq(mmc->card)) {
> +		if (enb)
> +			pm_runtime_get_noresume(host->dev);
> +		else
> +			pm_runtime_put_noidle(host->dev);
> +	}
>  }
>  
>  static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
> @@ -2631,6 +2638,18 @@ static int msdc_drv_probe(struct
> platform_device *pdev)
>  		goto host_free;
>  	}
>  
> +	/* Support for SDIO eint irq ? */
> +	if (mmc->pm_caps & MMC_PM_WAKE_SDIO_IRQ) {
> +		host->pins_eint = pinctrl_lookup_state(host->pinctrl,
> "state_eint");
> +		if (IS_ERR(host->pins_eint)) {
> +			ret = dev_err_probe(&pdev->dev, PTR_ERR(host-
> >pins_eint),
> +					    "Cannot find pinctrl
> eint!\n");
> +			goto host_free;
> +		}
> +
> +		host->sdio_eint_ready = true;
> +	}
> +
>  	msdc_of_property_parse(pdev, host);
>  
>  	host->dev = &pdev->dev;
> @@ -2722,6 +2741,21 @@ static int msdc_drv_probe(struct
> platform_device *pdev)
>  	if (ret)
>  		goto release;
>  
> +	if (host->sdio_eint_ready) {
> +		host->eint_irq = irq_of_parse_and_map(host->dev-
> >of_node, 1);
> +		ret = host->eint_irq ?
> dev_pm_set_dedicated_wake_irq(host->dev, host->eint_irq) :
> +		      -ENODEV;
> +
> +		if (ret) {
> +			dev_err(host->dev, "Failed to register data1
> eint irq!\n");
> +			goto release;
> +		}
> +
> +		dev_pm_disable_wake_irq(host->dev);
> +		pinctrl_select_state(host->pinctrl, host->pins_uhs);
> +	}
> +
> +	device_init_wakeup(host->dev, true);
>  	pm_runtime_set_active(host->dev);
>  	pm_runtime_set_autosuspend_delay(host->dev,
> MTK_MMC_AUTOSUSPEND_DELAY);
>  	pm_runtime_use_autosuspend(host->dev);
> @@ -2734,6 +2768,7 @@ static int msdc_drv_probe(struct
> platform_device *pdev)
>  	return 0;
>  end:
>  	pm_runtime_disable(host->dev);
> +	dev_pm_clear_wake_irq(host->dev);
>  release:
>  	platform_set_drvdata(pdev, NULL);
>  	msdc_deinit_hw(host);
> @@ -2845,6 +2880,16 @@ static int __maybe_unused
> msdc_runtime_suspend(struct device *dev)
>  	struct msdc_host *host = mmc_priv(mmc);
>  
>  	msdc_save_reg(host);
> +
> +	if (host->sdio_eint_ready) {
> +		disable_irq(host->irq);
> +		pinctrl_select_state(host->pinctrl, host->pins_eint);
> +		if (host->sdio_wake_irq_depth == 0) {
> +			dev_pm_enable_wake_irq(dev);
> +			host->sdio_wake_irq_depth++;
> +		}
> +		sdr_clr_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
> +	}
>  	msdc_gate_clock(host);
>  	return 0;
>  }
> @@ -2860,12 +2905,25 @@ static int __maybe_unused
> msdc_runtime_resume(struct device *dev)
>  		return ret;
>  
>  	msdc_restore_reg(host);
> +
> +	if (host->sdio_eint_ready) {
> +		if (host->sdio_wake_irq_depth > 0) {
> +			dev_pm_disable_wake_irq(dev);
> +			host->sdio_wake_irq_depth--;
> +			sdr_set_bits(host->base + SDC_CFG,
> SDC_CFG_SDIOIDE);
> +		} else {
> +			sdr_clr_bits(host->base + MSDC_INTEN,
> MSDC_INTEN_SDIOIRQ);
> +		}
> +		pinctrl_select_state(host->pinctrl, host->pins_uhs);
> +		enable_irq(host->irq);
> +	}
>  	return 0;
>  }
>  
> -static int __maybe_unused msdc_suspend(struct device *dev)
> +static int __maybe_unused msdc_suspend_noirq(struct device *dev)
>  {
>  	struct mmc_host *mmc = dev_get_drvdata(dev);
> +	struct msdc_host *host = mmc_priv(mmc);
>  	int ret;
>  
>  	if (mmc->caps2 & MMC_CAP2_CQE) {
> @@ -2874,16 +2932,36 @@ static int __maybe_unused msdc_suspend(struct
> device *dev)
>  			return ret;
>  	}
>  
> +	if (host->sdio_eint_ready)
> +		enable_irq_wake(host->eint_irq);
> +
>  	return pm_runtime_force_suspend(dev);
>  }
>  
> -static int __maybe_unused msdc_resume(struct device *dev)
> +static int __maybe_unused msdc_resume_noirq(struct device *dev)
>  {
> +	struct mmc_host *mmc = dev_get_drvdata(dev);
> +	struct msdc_host *host = mmc_priv(mmc);
> +
> +	if (host->sdio_eint_ready) {
> +		disable_irq_wake(host->eint_irq);
> +
> +		/*
> +		 * In noirq resume stage, msdc_runtime_resume()
> +		 * won't be called, so disalbe wake irq here
> +		 * to block dedicated wake irq handler callback.
> +		 */
> +		if (likely(host->sdio_wake_irq_depth > 0)) {
> +			dev_pm_disable_wake_irq(dev);
> +			host->sdio_wake_irq_depth--;
> +		}
> +	}
> +
>  	return pm_runtime_force_resume(dev);
>  }
>  
>  static const struct dev_pm_ops msdc_dev_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(msdc_suspend, msdc_resume)
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(msdc_suspend_noirq,
> msdc_resume_noirq)
>  	SET_RUNTIME_PM_OPS(msdc_runtime_suspend, msdc_runtime_resume,
> NULL)
>  };
>  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
