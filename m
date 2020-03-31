Return-Path: <SRS0=zTQl=5Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A156AC43331
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 07:37:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72AB820748
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2020 07:37:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i9zNWmyn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QPs5ozvI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72AB820748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emwJ8OyTC25msBvZQtslG1LcT1qJzf1y6dWd3McYrH8=; b=i9zNWmynOnEqWD
	/KzAZnQJu6hddtI3AXVqcWE2AAr1Sv9cccklZ7CY8oppZ37lb3bCqpMKKTYSkfF+Db6VpV5T/o2qY
	xha4iART8gwnCLD9YMEdpb1j/vqiTryoJjbYcyxhKG6dRuY6hHHT+sm0e1H/euBydCKPi9G5hTMna
	4NVHTvB/xsMtvDa64eiLCvOlDcJaSmObpynhE8e5j6sh8DgyDew+2z/P0ixFu9FLaW1YZ1udcQ0qT
	UmZgbOs9R6fN0IVKnTYTb2IV4UD/PeeyDv5fcBup7chEE+mxif5QSa44iiz5a/DayuxFk4493EgxC
	fwvTXVF3/6JliZnCbNSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJBSm-0000RD-Fq; Tue, 31 Mar 2020 07:37:32 +0000
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJBSB-0008K3-UZ
 for linux-mediatek@lists.infradead.org; Tue, 31 Mar 2020 07:36:58 +0000
Received: by mail-vk1-xa42.google.com with SMTP id s139so5418717vka.13
 for <linux-mediatek@lists.infradead.org>; Tue, 31 Mar 2020 00:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S6Q9hQ2oX9Ox06YI7dtd+yeRUlkspby1i/hG2sHJOwk=;
 b=QPs5ozvIbF42Ytw0UwR9mtN42EIVg+Uhckg5kKc+/HZlfqR2lrKjQMDMC0u16BYIRJ
 lGDVlYNa6YxP1XX2KmFecCHQO+1hdmrptQMWezPbNv8ZGok0DAVsLxwy3rE+1DjsWUgW
 j8mmb1/Dd5UoAKKQMzm6uy6q2u1RWfpt2inKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S6Q9hQ2oX9Ox06YI7dtd+yeRUlkspby1i/hG2sHJOwk=;
 b=P8RoYVEuZSbI3iiSHbHBfTC0gxzZ6zBnN5R/X9rMgxN1pNkdtHPYXwntKOLobA/lTY
 UviuzBB571N54dic/eU2SHyesXs4RgKhS0gD+OKoEhO8jwMaoOT/Twuyrk3GYU3xGBAa
 sR29cYgaMYConl4EWp9KSq3DFCzDgDBM8IXNgj6Q820SloGRkgBkw6/eQeInE862loxd
 y9qLKhZdXBEyEdSLO1Y3LdWc0OaXQ6zpyN8oRmGRtFySxTflTThWFkppM3wZf0bByhdi
 wGdTvnsfdUF/d07xiK/KbeaBGG7+kL1mff0IMGyz1ObdiW0Xjau/IPSKj4A06RMa3DpS
 0qPQ==
X-Gm-Message-State: AGi0PuZsyIKqpR33WrhYNjM6rMOLBBR5RxzppUPKIDG9i6n60Cfhtinv
 XVmNuN528BGFJmM+I7QTm3NXvEl0Zyvivt/x2Lp1Dw==
X-Google-Smtp-Source: APiQypLerFdT3MKzpJXcwDaQOekBA6oEi5+6wAfkecHdEyHJfLkPPjYL+dMfVJRSqp0BLWf6eFEaeWcDO7a0xb6AIq0=
X-Received: by 2002:a05:6122:2d0:: with SMTP id
 k16mr10595740vki.54.1585640214209; 
 Tue, 31 Mar 2020 00:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <1585627657-3265-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1585627657-3265-4-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1585627657-3265-4-git-send-email-hsin-hsiung.wang@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 31 Mar 2020 15:36:43 +0800
Message-ID: <CANMq1KBqeUHj0gKcknPDvgzRzGMt26pq-_rt_ZM89phCHO9jqQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/5] mfd: Add support for the MediaTek MT6358 PMIC
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_003656_009991_B9BDC45B 
X-CRM114-Status: GOOD (  24.15  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 lkml <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Sebastian Reichel <sre@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 31, 2020 at 12:07 PM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> This adds support for the MediaTek MT6358 PMIC. This is a
> multifunction device with the following sub modules:
>
> - Regulator
> - RTC
> - Codec
> - Interrupt
>
> It is interfaced to the host controller using SPI interface
> by a proprietary hardware called PMIC wrapper or pwrap.
> MT6358 MFD is a child device of the pwrap.
>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

This is missing a few comments from Lee Jones on v10, actually, repeated below:
https://patchwork.kernel.org/patch/11431239/#23244041

> ---
>  drivers/mfd/Makefile                 |   2 +-
>  drivers/mfd/mt6358-irq.c             | 236 +++++++++++++++++++++++++++++
>  drivers/mfd/mt6397-core.c            |  55 ++++++-
>  include/linux/mfd/mt6358/core.h      | 158 ++++++++++++++++++++
>  include/linux/mfd/mt6358/registers.h | 282 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   3 +
>  6 files changed, 731 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/mfd/mt6358-irq.c
>  create mode 100644 include/linux/mfd/mt6358/core.h
>  create mode 100644 include/linux/mfd/mt6358/registers.h
>
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index b83f172..9af1414 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -238,7 +238,7 @@ obj-$(CONFIG_INTEL_SOC_PMIC)        += intel-soc-pmic.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)     += intel_soc_pmic_bxtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)     += intel_soc_pmic_chtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)  += intel_soc_pmic_chtdc_ti.o
> -mt6397-objs    := mt6397-core.o mt6397-irq.o
> +mt6397-objs                    := mt6397-core.o mt6397-irq.o mt6358-irq.o
>  obj-$(CONFIG_MFD_MT6397)       += mt6397.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_MRFLD)     += intel_soc_pmic_mrfld.o
>
> diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
> new file mode 100644
> index 0000000..022e5f5
> --- /dev/null
> +++ b/drivers/mfd/mt6358-irq.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2019 MediaTek Inc.

2020

> +
> +#include <linux/interrupt.h>
> +#include <linux/mfd/mt6358/core.h>
> +#include <linux/mfd/mt6358/registers.h>
> +#include <linux/mfd/mt6397/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +static struct irq_top_t mt6358_ints[] = {
> +       MT6358_TOP_GEN(BUCK),
> +       MT6358_TOP_GEN(LDO),
> +       MT6358_TOP_GEN(PSC),
> +       MT6358_TOP_GEN(SCK),
> +       MT6358_TOP_GEN(BM),
> +       MT6358_TOP_GEN(HK),
> +       MT6358_TOP_GEN(AUD),
> +       MT6358_TOP_GEN(MISC),
> +};
> +
> +static void pmic_irq_enable(struct irq_data *data)
> +{
> +       unsigned int hwirq = irqd_to_hwirq(data);
> +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct pmic_irq_data *irqd = chip->irq_data;
> +
> +       irqd->enable_hwirq[hwirq] = true;
> +}
> +
> +static void pmic_irq_disable(struct irq_data *data)
> +{
> +       unsigned int hwirq = irqd_to_hwirq(data);
> +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct pmic_irq_data *irqd = chip->irq_data;
> +
> +       irqd->enable_hwirq[hwirq] = false;
> +}
> +
> +static void pmic_irq_lock(struct irq_data *data)
> +{
> +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +
> +       mutex_lock(&chip->irqlock);
> +}
> +
> +static void pmic_irq_sync_unlock(struct irq_data *data)
> +{
> +       unsigned int i, top_gp, gp_offset, en_reg, int_regs, shift;
> +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +       struct pmic_irq_data *irqd = chip->irq_data;
> +
> +       for (i = 0; i < irqd->num_pmic_irqs; i++) {
> +               if (irqd->enable_hwirq[i] == irqd->cache_hwirq[i])
> +                       continue;
> +
> +               /* Find out the IRQ group */
> +               top_gp = 0;
> +               while ((top_gp + 1) < irqd->num_top &&
> +                      i >= mt6358_ints[top_gp + 1].hwirq_base)
> +                       top_gp++;
> +
> +               /* Find the irq registers */

From Lee Jones: 'Nit: "IRQ"'

> +               gp_offset = i - mt6358_ints[top_gp].hwirq_base;
> +               int_regs = gp_offset / MT6358_REG_WIDTH;
> +               shift = gp_offset % MT6358_REG_WIDTH;
> +               en_reg = mt6358_ints[top_gp].en_reg +
> +                        (mt6358_ints[top_gp].en_reg_shift * int_regs);
> +
[...]
> +static const struct irq_domain_ops mt6358_irq_domain_ops = {
> +       .map = pmic_irq_domain_map,
> +       .xlate = irq_domain_xlate_twocell,
> +};
> +
> +int mt6358_irq_init(struct mt6397_chip *chip)
> +{
> +       int i, j, ret;
> +       struct pmic_irq_data *irqd;
> +
> +       irqd = devm_kzalloc(chip->dev, sizeof(struct pmic_irq_data *),

From Lee Jones: 'sizeof(*irqd)'

> +                           GFP_KERNEL);
> +       if (!irqd)
> +               return -ENOMEM;
> +
> +       chip->irq_data = irqd;
> +
[...]
> @@ -154,19 +184,33 @@ static int mt6397_probe(struct platform_device *pdev)
>         if (pmic->irq <= 0)
>                 return pmic->irq;
>
> -       ret = mt6397_irq_init(pmic);
> -       if (ret)
> -               return ret;
> -
>         switch (pmic->chip_id) {
>         case MT6323_CHIP_ID:
> +               ret = mt6397_irq_init(pmic);
> +               if (ret)
> +                       return ret;
> +
>                 ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
>                                            mt6323_devs, ARRAY_SIZE(mt6323_devs),
>                                            NULL, 0, pmic->irq_domain);
>                 break;
>
> +       case MT6358_CHIP_ID:
> +               ret = mt6358_irq_init(pmic);
> +               if (ret)
> +                       return ret;
> +
> +               ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
> +                                          mt6358_devs, ARRAY_SIZE(mt6358_devs),
> +                                          NULL, 0, pmic->irq_domain);
> +               break;

From Lee Jones: "In a subsequent patch you can choose the correct
mtXXXX_devs structure to pass and call devm_mfd_add_devices() only
once below the switch()."

Can you look into that as a follow-up patch?


> +
>         case MT6391_CHIP_ID:
>         case MT6397_CHIP_ID:
> +               ret = mt6397_irq_init(pmic);
> +               if (ret)
> +                       return ret;
> +
>                 ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
>                                            mt6397_devs, ARRAY_SIZE(mt6397_devs),
>                                            NULL, 0, pmic->irq_domain);

[snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
