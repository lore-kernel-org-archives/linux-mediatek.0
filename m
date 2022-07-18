Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958B3CCA47F
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 12:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDQWVnebHfg0c4wrC26BhJlTXOIzpXwxLZ6MmaHHQaQ=; b=X0j6Xl/n3FdQkGJ12RN2kzKDzX
	L3EdlTU5ySMl6baqrOFKasZMSO6piYkImEOSh378TaXjGBwOjji1qJkoRax9pOmlnEhd9cQjf7Jrt
	MaJjx97R/w7+xPTjOH+P52c8AEpZB3TSq1LcQ0PACkxfEPxdEpNetsFyWjiBJdbg1sDio9Z4OL0K/
	nCcoKBpjmk3233tgQjeBOPdadUwWDosV6POvdq/nt+8EtfI3GM9zy/a+Q2zUCz1CWsdKJtaj1IwUu
	nFsTeb27bCDbAYmp1agVTs2cpcKGT9t5nnRV1l0bFqD9UvF4fmazAVtVxdDx21Wq5UWZLQ1FAqfT4
	88tgdwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDPlc-00DDK3-Gy; Mon, 18 Jul 2022 12:22:28 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDPlR-00DDEi-LM
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 12:22:19 +0000
Received: by mail-lf1-x12a.google.com with SMTP id u19so10160697lfs.0
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Jul 2022 05:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tDQWVnebHfg0c4wrC26BhJlTXOIzpXwxLZ6MmaHHQaQ=;
        b=ZfXlyZECFhaTE1MFyFsP82gV8sZfyLMkWniwhgsrLrkyrYdDBuxPhlvU0v9QLBs0Xb
         TALJiaM0I8pTJUChg9+daQ/h6ZWuIoZr/NdiOTCSHi3JWxcDU+bCi6cTsRK5UUaYmCyy
         YlldGSpT9y6zl9eQtnFh4ndEPqjjgnHvyWBLeXBA70DzmL23iBzr3z+2V8PwrFjub0ke
         54CACWyjti0RY8o8FVNw3sUnM9oe+AtwgwuzyS8LMpAnBzkshDyOJA56lQ1SkqE574MX
         BTyiZxLIx+PmbuAlC2BWxYuIlE5Rv7raFLmx95+2hR+pGwR306UNmC/u6PPRHtGGA6Q5
         nNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tDQWVnebHfg0c4wrC26BhJlTXOIzpXwxLZ6MmaHHQaQ=;
        b=D+5uxvmIfwUtyiqvNr5Q8EGMwxQurSy+HSk8lu6qEE7R1dhLR+ULizgESNSZxXv+9x
         VDXCsV43grSMp9TgiVLUZoIWFK524y1aGaex0fdA/zkoJUbPQx1FqByKjeOymmwxvsR3
         sPpuFBxJDLLBuTSeOoyZYV74FYDCTjDXJrXxIm7te93aCV0P5kk6xr1SogyJJGiFKNd6
         St0t7w+1mE40B6IC+XnCTxOwWYUyUc7ph8lMPKgcyGzew5HTll6NFte9wSkpmMklKmyl
         QGji3ePeMQgAo5Ho0TNcfitiC+joRIVkWoCkAd9l2gNpJiYzO9rw0W5Bx6VDbOWc1gAF
         gm9g==
X-Gm-Message-State: AJIora8ZXlUei7KHkv9qCO36LFK83dcCALBBo/QOVnUjIpCZFmw0lNtV
	XUCSd5t66QBqft36H7A2d9mbjcRs09OG86QLeEUdDTxeMH1mXg==
X-Google-Smtp-Source: AGRyM1uN/QdzliJ/x2BXEyudDZRn4ZiuQav9WWV3CkFBV87cU3ElLClfj9ORvYC9gRYUyhBkBRXrZMs4Ll/xu45k/8Q=
X-Received: by 2002:a05:6512:aca:b0:48a:1a70:d0d8 with SMTP id
 n10-20020a0565120aca00b0048a1a70d0d8mr11268659lfu.167.1658146933633; Mon, 18
 Jul 2022 05:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220623090445.1401-1-axe.yang@mediatek.com> <20220623090445.1401-4-axe.yang@mediatek.com>
In-Reply-To: <20220623090445.1401-4-axe.yang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 18 Jul 2022 14:21:37 +0200
Message-ID: <CAPDyKFr0gy1sNb=U3j1ErSZm+jcAcvg_jwNmodEs7ip4_LjNZg@mail.gmail.com>
Subject: Re: [PATCH v13 3/3] mmc: mediatek: add support for SDIO eint wakup IRQ
To: Axe Yang <axe.yang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, 
	Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
	Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, 
	Tian Tao <tiantao6@hisilicon.com>, angelogioacchino.delregno@collabora.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Yong Mao <yong.mao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_052217_712889_8A68B52A 
X-CRM114-Status: GOOD (  38.47  )
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

On Thu, 23 Jun 2022 at 11:05, Axe Yang <axe.yang@mediatek.com> wrote:
>
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
> the interrupts list should be extended(the interrupt named with
> sdio_wakeup):
>         &mmcX {
>                 ...
>                 interrupt-names = "msdc", "sdio_wakeup";
>                 interrupts-extended = <...>,
>                                       <&pio xxx IRQ_TYPE_LEVEL_LOW>;
>                 ...
>                 pinctrl-names = "default", "state_uhs", "state_eint";
>                 ...
>                 pinctrl-2 = <&mmc2_pins_eint>;
>                 ...
>                 cap-sdio-irq;
>                 keep-power-in-suspend;
>                 wakeup-source;
>                 ...
>         };
>
> Co-developed-by: Yong Mao <yong.mao@mediatek.com>
> Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>

My apologies for the delay in reviewing this.

> ---
>  drivers/mmc/host/mtk-sd.c | 84 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 78 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 195dc897188b..f907b96cfd87 100644
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
> @@ -440,8 +441,10 @@ struct msdc_host {
>         struct pinctrl *pinctrl;
>         struct pinctrl_state *pins_default;
>         struct pinctrl_state *pins_uhs;
> +       struct pinctrl_state *pins_eint;
>         struct delayed_work req_timeout;
>         int irq;                /* host interrupt */
> +       int eint_irq;           /* interrupt from sdio device for waking up system */
>         struct reset_control *reset;
>
>         struct clk *src_clk;    /* msdc source clock */
> @@ -1520,17 +1523,46 @@ static void __msdc_enable_sdio_irq(struct msdc_host *host, int enb)
>
>  static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
>  {
> -       unsigned long flags;
>         struct msdc_host *host = mmc_priv(mmc);
> +       unsigned long flags;
> +       int ret;
>
>         spin_lock_irqsave(&host->lock, flags);
>         __msdc_enable_sdio_irq(host, enb);
>         spin_unlock_irqrestore(&host->lock, flags);
>
> -       if (enb)
> -               pm_runtime_get_noresume(host->dev);
> -       else
> -               pm_runtime_put_noidle(host->dev);
> +       if (mmc_card_enable_async_irq(mmc->card) && host->pins_eint) {
> +               if (enb) {
> +                       /*
> +                        * In dev_pm_set_dedicated_wake_irq_reverse(), eint pin will be set to
> +                        * GPIO mode. We need to restore it to SDIO DAT1 mode after that.
> +                        * Since the current pinstate is pins_uhs, to ensure pinctrl select take
> +                        * affect successfully, we change the pinstate to pins_eint firstly.
> +                        */
> +                       pinctrl_select_state(host->pinctrl, host->pins_eint);

I am sorry, but I don't understand what goes on here. Why do you need
to change the pinctrl setting to "pins_eint" here?

The bellow call to dev_pm_set_dedicated_wake_irq_reverse() doesn't
change the pinctrl setting as the comment suggests above.

dev_pm_set_dedicated_wake_irq_reverse() will register the wakeirq, but
more importantly, it should also leave the wakeirq disabled, right?

> +                       ret = dev_pm_set_dedicated_wake_irq_reverse(host->dev, host->eint_irq);
> +
> +                       if (ret) {
> +                               dev_err(host->dev, "Failed to register SDIO wakeup irq!\n");
> +                               host->pins_eint = NULL;
> +                               pm_runtime_get_noresume(host->dev);
> +                       } else {
> +                               dev_dbg(host->dev, "SDIO eint irq: %d!\n", host->eint_irq);
> +                       }
> +
> +                       pinctrl_select_state(host->pinctrl, host->pins_uhs);

According to my comment above, I also don't understand why you need
this. Why can't you just leave the pinctrl in the "pins_uhs" state?

> +               } else {
> +                       dev_pm_clear_wake_irq(host->dev);
> +               }
> +       } else {
> +               if (enb) {
> +                       /* Ensure host->pins_eint is NULL */
> +                       host->pins_eint = NULL;
> +                       pm_runtime_get_noresume(host->dev);
> +               } else {
> +                       pm_runtime_put_noidle(host->dev);
> +               }
> +       }
>  }
>
>  static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
> @@ -2631,6 +2663,20 @@ static int msdc_drv_probe(struct platform_device *pdev)
>                 goto host_free;
>         }
>
> +       /* Support for SDIO eint irq ? */
> +       if ((mmc->pm_caps & MMC_PM_WAKE_SDIO_IRQ) && (mmc->pm_caps & MMC_PM_KEEP_POWER)) {
> +               host->eint_irq = platform_get_irq_byname(pdev, "sdio_wakeup");
> +               if (host->eint_irq > 0) {
> +                       host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
> +                       if (IS_ERR(host->pins_eint)) {
> +                               dev_err(&pdev->dev, "Cannot find pinctrl eint!\n");
> +                               host->pins_eint = NULL;
> +                       } else {
> +                               device_init_wakeup(&pdev->dev, true);
> +                       }
> +               }
> +       }
> +
>         msdc_of_property_parse(pdev, host);
>
>         host->dev = &pdev->dev;
> @@ -2845,6 +2891,13 @@ static int __maybe_unused msdc_runtime_suspend(struct device *dev)
>         struct msdc_host *host = mmc_priv(mmc);
>
>         msdc_save_reg(host);
> +
> +       if (host->pins_eint) {
> +               disable_irq(host->irq);
> +               pinctrl_select_state(host->pinctrl, host->pins_eint);
> +               if (sdio_irq_claimed(mmc))
> +                       __msdc_enable_sdio_irq(host, 0);
> +       }

This above code isn't entirely correct. Just because you have
"pins_eint", doesn't mean that you have a wakeirq being registered, as
that also depends on whether there is an SDIO irq claimed.

So, I think this should rather be:

if (sdio_irq_claimed(mmc)) {
    if (host->pins_eint) {
        disable_irq(host->irq);
        pinctrl_select_state(host->pinctrl, host->pins_eint);
    }

    __msdc_enable_sdio_irq(host, 0);
}

>         msdc_gate_clock(host);
>         return 0;
>  }
> @@ -2860,12 +2913,18 @@ static int __maybe_unused msdc_runtime_resume(struct device *dev)
>                 return ret;
>
>         msdc_restore_reg(host);
> +
> +       if (host->pins_eint) {

Similar comment as above. You need to check sdio_irq_claimed() here too.

> +               pinctrl_select_state(host->pinctrl, host->pins_uhs);
> +               enable_irq(host->irq);
> +       }
>         return 0;
>  }
>
>  static int __maybe_unused msdc_suspend(struct device *dev)
>  {
>         struct mmc_host *mmc = dev_get_drvdata(dev);
> +       struct msdc_host *host = mmc_priv(mmc);
>         int ret;
>
>         if (mmc->caps2 & MMC_CAP2_CQE) {
> @@ -2874,11 +2933,24 @@ static int __maybe_unused msdc_suspend(struct device *dev)
>                         return ret;
>         }
>
> +       /*
> +        * Bump up runtime PM usage counter otherwise dev->power.needs_force_resume will
> +        * not be marked as 1, pm_runtime_force_resume() will go out directly.
> +        */
> +       if (host->pins_eint)

This works, but can be improved by checking sdio_irq_claimed() too.

> +               pm_runtime_get_noresume(dev);
> +
>         return pm_runtime_force_suspend(dev);
>  }
>
>  static int __maybe_unused msdc_resume(struct device *dev)
>  {
> +       struct mmc_host *mmc = dev_get_drvdata(dev);
> +       struct msdc_host *host = mmc_priv(mmc);
> +
> +       if (host->pins_eint)
> +               pm_runtime_put_noidle(dev);

Ditto.

> +
>         return pm_runtime_force_resume(dev);
>  }
>

Kind regards
Uffe

