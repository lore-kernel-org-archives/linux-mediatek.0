Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9966FC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lsdztctVWOdJvfESPCKhPT7xPvZbpTLaWBq0azYJ2I=; b=Mr2HVl9E/zA8vu
	5yjMQY25uAQ124BDtEvg4js1QuqrAoD/UsXBs+/+9b9olIzFaTVVM/YUGWdAEhfMXUWCgo6oHorX8
	h0kpQ+04rvPtjnoLi1SqeZgFy0GOuKcBlwlBFXb88EPwlwfAoNBs8zBT7hbU7Z3v7rDfjWxWyN8MY
	XbZC3sz37RWhM+D1TbxuiZxCALJUdZj4foLgIFGq6+sg49IDyZep1seaGtTcfjnfmlppoBota1jH+
	1aJkOBjJ30T46dbSmFdhEdvkiSvIpbiThrWzFqOjOJcaIV87b0VmFvBqlgDVw/VeFYFnpZP56HmhF
	Q5aiL/JM+gXsmgUDGRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywRu-00DUr2-It; Wed, 08 Jun 2022 14:14:18 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywRi-00DUed-1L
	for linux-mediatek@lists.infradead.org; Wed, 08 Jun 2022 14:14:09 +0000
Received: by mail-lj1-x231.google.com with SMTP id g25so22867140ljm.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jun 2022 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1HU08/x38cJzl3RWDz0YbudrpwkOiqXjB9x6EgAug6c=;
        b=C1GzNijfksY7wJ7e1wxXZBQxdzNRR6jkfmpvzn6tw2ptJbXSS1293NsbuQsMkyR4t8
         tByqc5BcvG6KR9ECuMEXffl1u+wJpIPusfY2FtVCHpv3BnZcbyk9xANhA4hFzA6ly0j/
         tAMA0g4hK7YJ5OnxpSwOP17AC466xGmXg0O/j6NnxeGZfzuLTs5NiZr2FqjzVJk5oEht
         KGk6aojuhToSTnRhmLS3lbndpxslUwSC75pe+fvApFJwHE9RWC/XD4LK98M2r5CM06lF
         zb2XbE8NLIkh+5mlZaM9LMPJKZlPLnGxjbS07ZdH5CdsB5Cj2Ui4lu/hFzBpViAAAZZT
         m5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1HU08/x38cJzl3RWDz0YbudrpwkOiqXjB9x6EgAug6c=;
        b=yQOlY2yIPcW0aRRnvdZXraExjCeNdec57DLJsZqk63vo5qSHF6eoLxqTqowwl6jCPk
         VbYIDmi2TPrrVTtHWYReHx69WwAwk4vgEYZXpFMH0DTnIQjOXEgFSF8uXJjZ+YjC0S4w
         o4aWbG5sxcZrsGkipksGnHj3K2v599CPd0R6FmGLAz9Yfit/954AKxGJcTZZGDKWfS2M
         7GtUiJThOa/LEQrX5FF5dwgLfmUCTiNGTVOfNdwuQ8PkgMmwwJZZxixy6HP/bun1Pywh
         qNkYXcOvSs0GglRQjdDhSsFQL8gdgNhEbdd53iMgwanRtumK9bOWxSN0RQAe/9WIaXVE
         YJow==
X-Gm-Message-State: AOAM5312Opl7Cf4I56llHe/UVgb++xuSaDSk0OPXOjsA5zKjHFSofBqE
	9zsJl/DdrppBMX9t6Fk6ixRbKXBTiPgX/Qb1yrsirw==
X-Google-Smtp-Source: ABdhPJyKzKcS6yXBOP3fYRGJtECdXIxMI8hvyGqf8/RD+uO+Q1kK7qhntqWEY63aI3J4zjJ80cqwlb3xhU1Hx2RdsyM=
X-Received: by 2002:a2e:818c:0:b0:255:a6c5:4304 with SMTP id
 e12-20020a2e818c000000b00255a6c54304mr5852124ljg.367.1654697632159; Wed, 08
 Jun 2022 07:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220525015140.384-1-axe.yang@mediatek.com> <20220525015140.384-4-axe.yang@mediatek.com>
In-Reply-To: <20220525015140.384-4-axe.yang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 8 Jun 2022 16:13:15 +0200
Message-ID: <CAPDyKFqq64L3_Mco2aEbu6mC_W98pPpwk4kd1F1um0pHVR5oOw@mail.gmail.com>
Subject: Re: [RESEND v12 3/3] mmc: mediatek: add support for SDIO eint wakup IRQ
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_071406_118180_724A3DE0 
X-CRM114-Status: GOOD (  42.46  )
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

On Wed, 25 May 2022 at 03:51, Axe Yang <axe.yang@mediatek.com> wrote:
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
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Co-developed-by: Yong Mao <yong.mao@mediatek.com>
> Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 80 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 74 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 195dc897188b..2d5b23616df6 100644
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
> @@ -1520,17 +1523,41 @@ static void __msdc_enable_sdio_irq(struct msdc_host *host, int enb)
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
> +                       pinctrl_select_state(host->pinctrl, host->pins_eint);

This looks a bit odd to me. The pins are not supposed to be configured
for wakeirq at this point, right?

As I understand it, the pin state for wakeirq should be set from the
->runtime_suspend() callback, no?

> +                       ret = dev_pm_set_dedicated_wake_irq_reverse(host->dev, host->eint_irq);
> +
> +                       if (ret) {
> +                               dev_err(host->dev, "Failed to register SDIO wakeup irq!\n");
> +                               host->pins_eint = NULL;
> +                               pm_runtime_get_noresume(host->dev);
> +                       } else {
> +                               dev_info(host->dev, "SDIO eint irq: %d!\n", host->eint_irq);

If you want to log a message, please use a dev_dbg for this instead.

> +                               device_init_wakeup(host->dev, true);

To me, it looks like this is better called from ->probe(), once.

> +                       }
> +
> +                       pinctrl_select_state(host->pinctrl, host->pins_uhs);

Assuming that we can drop the earlier call to pinctrl_select_state()
to set "host->pins_eint", this call can be dropped too.

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
> @@ -2631,6 +2658,19 @@ static int msdc_drv_probe(struct platform_device *pdev)
>                 goto host_free;
>         }
>
> +       /* Support for SDIO eint irq ? */
> +       if ((mmc->pm_caps & MMC_PM_WAKE_SDIO_IRQ) && (mmc->pm_caps & MMC_PM_KEEP_POWER)) {
> +               host->eint_irq = platform_get_irq_byname(pdev, "sdio_wakeup");
> +               if (host->eint_irq > 0) {
> +                       host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
> +                       if (IS_ERR(host->pins_eint)) {
> +                               dev_err_probe(&pdev->dev, PTR_ERR(host->pins_eint),
> +                                             "Cannot find pinctrl eint!\n");

We can probably use dev_err() instead of dev_err_probe() as
pinctrl_lookup_state() should never return -EPROBE_DEFER, I think.

> +                               host->pins_eint = NULL;
> +                       }
> +               }
> +       }
> +
>         msdc_of_property_parse(pdev, host);
>
>         host->dev = &pdev->dev;
> @@ -2845,6 +2885,12 @@ static int __maybe_unused msdc_runtime_suspend(struct device *dev)
>         struct msdc_host *host = mmc_priv(mmc);
>
>         msdc_save_reg(host);
> +
> +       if (sdio_irq_claimed(mmc) && host->pins_eint) {
> +               disable_irq(host->irq);
> +               pinctrl_select_state(host->pinctrl, host->pins_eint);
> +               sdr_clr_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);

__msdc_enable_sdio_irq() also calls "sdr_clr_bits(host->base +
MSDC_INTEN, MSDC_INTEN_SDIOIRQ);"

Perhaps we should call __msdc_enable_sdio_irq() here instead? To be consistent.

> +       }
>         msdc_gate_clock(host);
>         return 0;
>  }
> @@ -2860,12 +2906,19 @@ static int __maybe_unused msdc_runtime_resume(struct device *dev)
>                 return ret;
>
>         msdc_restore_reg(host);
> +
> +       if (sdio_irq_claimed(mmc) && host->pins_eint) {

msdc_restore_reg() already calls __msdc_enable_sdio_irq(), but based
only upon whether sdio_irq_claimed() returns true.

It looks like we should align the code in
msdc_runtime_resume|suspend(). Perhaps sdio_irq_claimed() should
indicate in both cases that __msdc_enable_sdio_irq() needs to be
called, while "host->pins_eint" means that we have also additional
wakeup configurations (pins and irqs) to handle.

> +               sdr_set_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
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
> @@ -2874,11 +2927,26 @@ static int __maybe_unused msdc_suspend(struct device *dev)
>                         return ret;
>         }
>
> +       if (sdio_irq_claimed(mmc) && host->pins_eint) {
> +               pm_runtime_put_sync_suspend(dev);
> +
> +               return 0;
> +       }
> +

I assume the point with the above is to trigger rpm_suspend() to be
called for the device, so that the wakeirq can be enabled, correctly?

However, this isn't the correct way to do it (for various reasons I
can explain, if you want). Instead I think there are two options going
forward:
1. Deal with the wakeirq from the system suspend/resume callbacks,
locally in the driver.
2. Extend pm_runtime_force_suspend|resume() to let it deal with the
wakeirq for us. Similar to what rpm_suspend|resume() do.

I am inclined to try with option 2) first, as this would prevent the
boilerplate code that otherwise gets introduced by option 1). To help
out, I have prepared a patch that I am about to send, I will keep you
posted.

>         return pm_runtime_force_suspend(dev);
>  }
>
>  static int __maybe_unused msdc_resume(struct device *dev)
>  {
> +       struct mmc_host *mmc = dev_get_drvdata(dev);
> +       struct msdc_host *host = mmc_priv(mmc);
> +
> +       if (sdio_irq_claimed(mmc) && host->pins_eint) {
> +               pm_runtime_get_sync(dev);

Similar comments apply to this as for msdc_suspend().

> +
> +               return 0;
> +       }
> +
>         return pm_runtime_force_resume(dev);
>  }
>

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
