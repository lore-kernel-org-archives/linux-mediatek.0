Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C60C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 07:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8KI5nUgeiTvGfq+OGpaMJVdRixFxSqJUB9qu10rqTM=; b=XU7JUw8NXZjOMW
	ngh/ebZqOod4UtJafcYteU/1ndlyrmNc2tHyQUQKTVqEaRu8oUD7OzLbu2GA33XH3aodwteVcduxT
	Mvg1edkEaO3OSCq/Nt3egH0EqYA+pxKipZjqEJgKpp8HO9FxzlghWOvx0Z4/n1X+NT2FdXpn2Gb1V
	RaVxHaPO0IyoahxtIsp/nAqbnxGtqSkOouDGa7Rnd4sS/I8yKRL9sGhH0jvlpnG6YLV7LwZRURPi3
	7MDR5+J7J6J952KEDq/EUAaZ5hRBqX5COsoGtE6LZWNw+CFIfXZ4RfUrVvD6e9XGAn22plgN2PNoS
	YgdUX+V6ZFIgJ8o+ignw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM3GK-0042Ft-Gk; Mon, 21 Feb 2022 07:37:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM3Fu-004290-SE; Mon, 21 Feb 2022 07:37:12 +0000
X-UUID: 830ce744af0d416bb2c31a2a129e8e6b-20220221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sV3Y6j1gMMn0N8bGnQv+OaO8Vj0qqljIF1vOunTS+gc=; 
 b=DUnW9FV49MeV4IxYTJpLhql+R4kmWHGLbUhZJ51u5Cw0TqqIaALXgI4te0gfF57StecIwHDO0QFolC7yVAjt/AvpZhoU21h9G/DcC2DXGyUf74m8e8MaEmfbg272AgaGzT5qH1GnRsqF9MiBwur40mfeIfRIUOEXxKvRNIaJboY=;
X-UUID: 830ce744af0d416bb2c31a2a129e8e6b-20220221
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1867045604; Mon, 21 Feb 2022 00:37:09 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 23:37:07 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Feb 2022 15:37:00 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 15:36:58 +0800
Message-ID: <e25a07d2c365be84446aa492cddc313a5b0e2ca1.camel@mediatek.com>
Subject: Re: [PATCH v5 3/3] mmc: mediatek: add support for SDIO eint IRQ
From: Axe Yang <axe.yang@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, "Eric
 Biggers" <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, "Stephen
 Boyd" <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
 <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Yong Mao <yong.mao@mediatek.com>
Date: Mon, 21 Feb 2022 15:36:58 +0800
In-Reply-To: <CAPDyKFqTcAd5kDAzrLDxFTismXDJdKOHLD1hEH369CyRLLo=mw@mail.gmail.com>
References: <20220121071942.11601-1-axe.yang@mediatek.com>
 <20220121071942.11601-4-axe.yang@mediatek.com>
 <CAPDyKFqTcAd5kDAzrLDxFTismXDJdKOHLD1hEH369CyRLLo=mw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_233710_953943_A938774F 
X-CRM114-Status: GOOD (  36.47  )
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

On Mon, 2022-02-14 at 16:54 +0100, Ulf Hansson wrote:
> On Fri, 21 Jan 2022 at 08:19, Axe Yang <axe.yang@mediatek.com> wrote:
> > 
> > Add support for eint IRQ when MSDC is used as an SDIO host. This
> > feature requires SDIO device support async IRQ function. With this
> > feature, SDIO host can be awakened by SDIO card in suspend state,
> > without additional pin.
> > 
> > MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> > turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> > resume, switch GPIO function back to DAT1 mode then turn on clock.
> > 
> > Some device tree property should be added or modified in MSDC node
> > to support SDIO eint IRQ. Pinctrls named state_dat1 and state_eint
> > are mandatory. And cap-sdio-async-irq flag is necessary since this
> > feature depends on asynchronous interrupt:
> >         &mmcX {
> >                 ...
> >                 pinctrl-names = "default", "state_uhs",
> > "state_eint",
> >                                 "state_dat1";
> 
> Looks like you need to update the DT docs too to describe these new
> things, right?
Will update the docs in next patchset.

> 
> >                 ...
> >                 pinctrl-2 = <&mmc2_pins_eint>;
> >                 pinctrl-3 = <&mmc2_pins_dat1>;
> >                 ...
> >                 cap-sdio-async-irq;
> >                 ...
> >         };
> > 
> > Co-developed-by: Yong Mao <yong.mao@mediatek.com>
> > Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > ---
> >  drivers/mmc/host/mtk-sd.c | 123
> > +++++++++++++++++++++++++++++++++++---
> >  1 file changed, 115 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index 65037e1d7723..f8e38228d810 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0-only
> >  /*
> > - * Copyright (c) 2014-2015 MediaTek Inc.
> > + * Copyright (c) 2014-2015, 2022 MediaTek Inc.
> >   * Author: Chaotian.Jing <chaotian.jing@mediatek.com>
> >   */
> > 
> > @@ -9,6 +9,7 @@
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/dma-mapping.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/iopoll.h>
> >  #include <linux/ioport.h>
> >  #include <linux/irq.h>
> > @@ -440,8 +441,12 @@ struct msdc_host {
> >         struct pinctrl *pinctrl;
> >         struct pinctrl_state *pins_default;
> >         struct pinctrl_state *pins_uhs;
> > +       struct pinctrl_state *pins_eint;
> > +       struct pinctrl_state *pins_dat1;
> >         struct delayed_work req_timeout;
> >         int irq;                /* host interrupt */
> > +       int eint_irq;           /* device interrupt */
> > +       int sdio_irq_cnt;       /* irq enable cnt */
> >         struct reset_control *reset;
> > 
> >         struct clk *src_clk;    /* msdc source clock */
> > @@ -465,6 +470,7 @@ struct msdc_host {
> >         bool hs400_tuning;      /* hs400 mode online tuning */
> >         bool internal_cd;       /* Use internal card-detect logic
> > */
> >         bool cqhci;             /* support eMMC hw cmdq */
> > +       bool sdio_eint_ready;   /* Ready to support SDIO eint
> > interrupt */
> >         struct msdc_save_para save_para; /* used when gate HCLK */
> >         struct msdc_tune_para def_tune_para; /* default tune
> > setting */
> >         struct msdc_tune_para saved_tune_para; /* tune result of
> > CMD21/CMD19 */
> > @@ -1527,10 +1533,12 @@ static void msdc_enable_sdio_irq(struct
> > mmc_host *mmc, int enb)
> >         __msdc_enable_sdio_irq(host, enb);
> >         spin_unlock_irqrestore(&host->lock, flags);
> > 
> > -       if (enb)
> > -               pm_runtime_get_noresume(host->dev);
> > -       else
> > -               pm_runtime_put_noidle(host->dev);
> > +       if (mmc->card && !mmc->card->cccr.enable_async_irq) {
> > +               if (enb)
> > +                       pm_runtime_get_noresume(host->dev);
> > +               else
> > +                       pm_runtime_put_noidle(host->dev);
> > +       }
> >  }
> > 
> >  static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32
> > intsts)
> > @@ -2461,6 +2469,48 @@ static const struct mmc_host_ops mt_msdc_ops
> > = {
> >         .hw_reset = msdc_hw_reset,
> >  };
> > 
> > +static irqreturn_t msdc_sdio_eint_irq(int irq, void *dev_id)
> > +{
> > +       struct msdc_host *host = dev_id;
> > +       struct mmc_host *mmc = mmc_from_priv(host);
> > +
> > +       spin_lock(&host->lock);
> > +       if (likely(host->sdio_irq_cnt > 0)) {
> > +               disable_irq_nosync(host->eint_irq);
> > +               disable_irq_wake(host->eint_irq);
> > +               host->sdio_irq_cnt--;
> > +       }
> > +       spin_unlock(&host->lock);
> > +
> > +       sdio_signal_irq(mmc);
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +static int msdc_request_dat1_eint_irq(struct msdc_host *host)
> > +{
> > +       struct gpio_desc *desc;
> > +       int irq, ret;
> > +
> > +       desc = devm_gpiod_get(host->dev, "eint", GPIOD_IN);
> > +       if (IS_ERR(desc))
> > +               return PTR_ERR(desc);
> > +
> > +       irq = gpiod_to_irq(desc);
> > +       if (irq < 0)
> > +               return irq;
> > +
> > +       ret = devm_request_threaded_irq(host->dev, irq, NULL,
> > msdc_sdio_eint_irq,
> > +                                       IRQF_TRIGGER_LOW |
> > IRQF_ONESHOT | IRQF_NO_AUTOEN,
> > +                                       "sdio-eint", host);
> 
> Again, I think you need to update the DT doc to describe these new
> IRQ/GPIO things.
Will update the docs in next patchset.

> 
> > +       if (ret)
> > +               return ret;
> > +
> > +       host->eint_irq = irq;
> > +
> > +       return 0;
> > +}
> > +
> >  static const struct cqhci_host_ops msdc_cmdq_ops = {
> >         .enable         = msdc_cqe_enable,
> >         .disable        = msdc_cqe_disable,
> > @@ -2631,6 +2681,23 @@ static int msdc_drv_probe(struct
> > platform_device *pdev)
> >                 goto host_free;
> >         }
> > 
> > +       if (!(mmc->caps2 & MMC_CAP2_NO_SDIO) && (mmc->caps2 &
> > MMC_CAP2_SDIO_ASYNC_IRQ)) {
> > +               /* Support for SDIO eint irq */
> > +               host->pins_eint = pinctrl_lookup_state(host-
> > >pinctrl, "state_eint");
> > +               if (IS_ERR(host->pins_eint)) {
> > +                       dev_dbg(&pdev->dev, "Cannot find pinctrl
> > eint!\n");
> > +               } else {
> > +                       host->pins_dat1 =
> > pinctrl_lookup_state(host->pinctrl, "state_dat1");
> > +                       if (IS_ERR(host->pins_dat1)) {
> > +                               ret = dev_err_probe(&pdev->dev,
> > PTR_ERR(host->pins_dat1),
> > +                                                   "Cannot find
> > pinctrl dat1!\n");
> > +                               goto host_free;
> > +                       }
> > +
> > +                       host->sdio_eint_ready = true;
> > +               }
> > +       }
> > +
> >         msdc_of_property_parse(pdev, host);
> > 
> >         host->dev = &pdev->dev;
> > @@ -2722,6 +2789,16 @@ static int msdc_drv_probe(struct
> > platform_device *pdev)
> >         if (ret)
> >                 goto release;
> > 
> > +       if (host->sdio_eint_ready) {
> > +               ret = msdc_request_dat1_eint_irq(host);
> > +               if (ret) {
> > +                       dev_err(host->dev, "Failed to register
> > data1 eint irq!\n");
> > +                       goto release;
> > +               }
> > +
> > +               pinctrl_select_state(host->pinctrl, host-
> > >pins_dat1);
> > +       }
> > +
> >         pm_runtime_set_active(host->dev);
> >         pm_runtime_set_autosuspend_delay(host->dev,
> > MTK_MMC_AUTOSUSPEND_DELAY);
> >         pm_runtime_use_autosuspend(host->dev);
> > @@ -2843,8 +2920,22 @@ static int __maybe_unused
> > msdc_runtime_suspend(struct device *dev)
> >  {
> >         struct mmc_host *mmc = dev_get_drvdata(dev);
> >         struct msdc_host *host = mmc_priv(mmc);
> > +       unsigned long flags;
> > 
> >         msdc_save_reg(host);
> > +
> > +       if (host->sdio_eint_ready) {
> > +               disable_irq(host->irq);
> > +               pinctrl_select_state(host->pinctrl, host-
> > >pins_eint);
> > +               spin_lock_irqsave(&host->lock, flags);
> > +               if (host->sdio_irq_cnt == 0) {
> > +                       enable_irq(host->eint_irq);
> > +                       enable_irq_wake(host->eint_irq);
> > +                       host->sdio_irq_cnt++;
> > +               }
> > +               sdr_clr_bits(host->base + SDC_CFG,
> > SDC_CFG_SDIOIDE);
> > +               spin_unlock_irqrestore(&host->lock, flags);
> > +       }
> >         msdc_gate_clock(host);
> >         return 0;
> >  }
> > @@ -2853,6 +2944,7 @@ static int __maybe_unused
> > msdc_runtime_resume(struct device *dev)
> >  {
> >         struct mmc_host *mmc = dev_get_drvdata(dev);
> >         struct msdc_host *host = mmc_priv(mmc);
> > +       unsigned long flags;
> >         int ret;
> > 
> >         ret = msdc_ungate_clock(host);
> > @@ -2860,10 +2952,25 @@ static int __maybe_unused
> > msdc_runtime_resume(struct device *dev)
> >                 return ret;
> > 
> >         msdc_restore_reg(host);
> > +
> > +       if (host->sdio_eint_ready) {
> > +               spin_lock_irqsave(&host->lock, flags);
> > +               if (host->sdio_irq_cnt > 0) {
> > +                       disable_irq_nosync(host->eint_irq);
> > +                       disable_irq_wake(host->eint_irq);
> > +                       host->sdio_irq_cnt--;
> > +                       sdr_set_bits(host->base + SDC_CFG,
> > SDC_CFG_SDIOIDE);
> > +               } else {
> > +                       sdr_clr_bits(host->base + MSDC_INTEN,
> > MSDC_INTEN_SDIOIRQ);
> > +               }
> > +               spin_unlock_irqrestore(&host->lock, flags);
> > +               pinctrl_select_state(host->pinctrl, host-
> > >pins_uhs);
> > +               enable_irq(host->irq);
> > +       }
> >         return 0;
> >  }
> > 
> > -static int __maybe_unused msdc_suspend(struct device *dev)
> > +static int __maybe_unused msdc_suspend_noirq(struct device *dev)
> >  {
> >         struct mmc_host *mmc = dev_get_drvdata(dev);
> >         int ret;
> > @@ -2877,13 +2984,13 @@ static int __maybe_unused
> > msdc_suspend(struct device *dev)
> >         return pm_runtime_force_suspend(dev);
> >  }
> > 
> > -static int __maybe_unused msdc_resume(struct device *dev)
> > +static int __maybe_unused msdc_resume_noirq(struct device *dev)
> >  {
> >         return pm_runtime_force_resume(dev);
> >  }
> > 
> >  static const struct dev_pm_ops msdc_dev_pm_ops = {
> > -       SET_SYSTEM_SLEEP_PM_OPS(msdc_suspend, msdc_resume)
> > +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(msdc_suspend_noirq,
> > msdc_resume_noirq)
> >         SET_RUNTIME_PM_OPS(msdc_runtime_suspend,
> > msdc_runtime_resume, NULL)
> >  };
> > 
> 
> Overall the approach makes perfect sense to me!
> 
> However, I think the code can be simplified and made more robust by
> using the wakeirq interface instead. Please have a look at
> dev_pm_set_dedicated_wake_irq() and friends. Using them, will let the
> runtime PM core deal with disabling/enabling the IRQ, rather than
> having to do that manually by the driver, for example.
> 
> If you want to get inspired by an existing implementation, please
> have
> a look at the sdhci-omap driver.
Will read the wakeirq interfaces and use them in next version. Thanks
for review.

Regards,
Axe Yang
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
