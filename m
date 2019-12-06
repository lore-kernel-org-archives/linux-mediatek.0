Return-Path: <SRS0=uEYr=Z4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ED8C43603
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2019 08:58:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C791C20659
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2019 08:58:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TDqjL3BE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="K49lk4An"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C791C20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLhyLC72JJTvfk5mMdOGySbBYe00mrvwvyGG72oehH8=; b=TDqjL3BEOB4bfm
	X/WcI2a6rJ7juhV/C8kAkdUnX46K5Qe6k37PrKp6MmzQ+/L+UU99WXuQ2cOGPehA58Ny+RimTGDQv
	0TITrSdVhIqdBDbM1R9i5EnJi2S5JS5LW40aEfIQ0IWVQLPPXYv4Cr9rLCGeYQZk3jmLg5RoO+num
	rGWo724ZIPpeyG3L4JpEjsnGBs8CghvJ0BeLqbGh5FAoYzr4s9ancGv0JG8OE0cbDCNPcvX92pngZ
	xMcCZ70o/e6mZTzJQm5xmsITaf44dfW+3nEX9/S8mzUFenafVRdO53zOxWeBqbtiaF1+FYlddhaLq
	SEhHjshopvGoeV3JuBKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1id9RX-0005Lk-2p; Fri, 06 Dec 2019 08:58:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id9RP-0005Bp-1O; Fri, 06 Dec 2019 08:58:25 +0000
X-UUID: 08e9d032d0a04fbc91c034a7fae60728-20191206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SOTafVilRh+dUaxelZIZmn7E79UtcnT9UfoFCTjh+RQ=; 
 b=K49lk4AncgphGZ+vXs9sLKBFCE7JTWrABNNUiyWpHMM5ozAWfStKYylvDdbuGD/yrR+LNAh5vqERTCrO5NBNUX9HcKPjBNUbZQ9avkAmqonlF2lJfdFTrdAA+uBU2n+2z+nSvDokxHJTrQ5KutrQAQa1kwbbKk2WH7en7r7AFcg=;
X-UUID: 08e9d032d0a04fbc91c034a7fae60728-20191206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1075378014; Fri, 06 Dec 2019 00:58:17 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 00:56:49 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 16:55:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Dec 2019 16:55:56 +0800
Message-ID: <1575622558.17300.5.camel@mtksdaap41>
Subject: Re: [PATCH v5 06/10] mfd: Add support for the MediaTek MT6358 PMIC
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Fri, 6 Dec 2019 16:55:58 +0800
In-Reply-To: <CANdKZ0eUDhhQPBBiOWZ0u03SFoFQM6b=ED9AGe+JtBSr_zeJKQ@mail.gmail.com>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-7-git-send-email-hsin-hsiung.wang@mediatek.com>
 <CANdKZ0eUDhhQPBBiOWZ0u03SFoFQM6b=ED9AGe+JtBSr_zeJKQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 537BB6683E4ECF705D4E44CF13D6ED29EF455E78C6A942E910245C10E9CACEEF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_005823_126098_0F8B135C 
X-CRM114-Status: GOOD (  25.87  )
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
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, srv_heupstream@mediatek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark
 Brown <broonie@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Liam
 Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Richard Fontana <rfontana@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>,
 Lee Jones <lee.jones@linaro.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 2019-12-02 at 16:06 +0800, Pi-Hsun Shih wrote:
> Hi,
> 
> On Fri, Aug 23, 2019 at 11:46 AM Hsin-Hsiung Wang
> <hsin-hsiung.wang@mediatek.com> wrote:
> >
> > This adds support for the MediaTek MT6358 PMIC. This is a
> > multifunction device with the following sub modules:
> >
> > - Regulator
> > - RTC
> > - Codec
> > - Interrupt
> >
> > It is interfaced to the host controller using SPI interface
> > by a proprietary hardware called PMIC wrapper or pwrap.
> > MT6358 MFD is a child device of the pwrap.
> >
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  drivers/mfd/Makefile                 |   3 +-
> >  drivers/mfd/mt6358-irq.c             | 231 ++++++++++++++++++++++++++++
> >  drivers/mfd/mt6397-core.c            |  52 ++++++-
> >  include/linux/mfd/mt6358/core.h      | 158 ++++++++++++++++++++
> >  include/linux/mfd/mt6358/registers.h | 282 +++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/mt6397/core.h      |   3 +
> >  6 files changed, 727 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/mfd/mt6358-irq.c
> >  create mode 100644 include/linux/mfd/mt6358/core.h
> >  create mode 100644 include/linux/mfd/mt6358/registers.h
> > (...)
> > diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
> > new file mode 100644
> > index 0000000..760b72f
> > --- /dev/null
> > +++ b/drivers/mfd/mt6358-irq.c
> > @@ -0,0 +1,231 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// Copyright (c) 2019 MediaTek Inc.
...
> > +static void pmic_irq_sync_unlock(struct irq_data *data)
> > +{
> > +       unsigned int i, top_gp, en_reg, int_regs, shift;
> > +       struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> > +       struct pmic_irq_data *irqd = chip->irq_data;
> > +
> > +       for (i = 0; i < irqd->num_pmic_irqs; i++) {
> > +               if (irqd->enable_hwirq[i] == irqd->cache_hwirq[i])
> > +                       continue;
> > +
> > +               /* Find out the irq group */
> > +               top_gp = 0;
> > +               while ((top_gp + 1) < ARRAY_SIZE(mt6358_ints) &&
> > +                      i >= mt6358_ints[top_gp + 1].hwirq_base)
> > +                       top_gp++;
> > +
> > +               if (top_gp >= ARRAY_SIZE(mt6358_ints)) {
> 
> Would this condition ever be true? The while loop before this always
> break when top_gp == ARRAY_SIZE(mt6358_ints) - 1.
> 

Thanks for reviewing. I will remove this part in next patch.

> > +                       mutex_unlock(&chip->irqlock);
> > +                       dev_err(chip->dev,
> > +                               "Failed to get top_group: %d\n", top_gp);
> > +                       return;
> > +               }
> > +
> > +               /* Find the irq registers */
> > +               int_regs = (i - mt6358_ints[top_gp].hwirq_base) /
> > +                           MT6358_REG_WIDTH;
> > +               en_reg = mt6358_ints[top_gp].en_reg +
> > +                       mt6358_ints[top_gp].en_reg_shift * int_regs;
> > +               shift = (i - mt6358_ints[top_gp].hwirq_base) % MT6358_REG_WIDTH;
> > +               regmap_update_bits(chip->regmap, en_reg, BIT(shift),
> > +                                  irqd->enable_hwirq[i] << shift);
> > +               irqd->cache_hwirq[i] = irqd->enable_hwirq[i];
> > +       }
> > +       mutex_unlock(&chip->irqlock);
> > +}
> > +
> > +static struct irq_chip mt6358_irq_chip = {
> > +       .name = "mt6358-irq",
> > +       .flags = IRQCHIP_SKIP_SET_WAKE,
> > +       .irq_enable = pmic_irq_enable,
> > +       .irq_disable = pmic_irq_disable,
> > +       .irq_bus_lock = pmic_irq_lock,
> > +       .irq_bus_sync_unlock = pmic_irq_sync_unlock,
> > +};
> > +
> > +static void mt6358_irq_sp_handler(struct mt6397_chip *chip,
> > +                                 unsigned int top_gp)
> > +{
> > +       unsigned int sta_reg, irq_status;
> > +       unsigned int hwirq, virq;
> > +       int ret, i, j;
> > +
> > +       for (i = 0; i < mt6358_ints[top_gp].num_int_regs; i++) {
> > +               sta_reg = mt6358_ints[top_gp].sta_reg +
> > +                       mt6358_ints[top_gp].sta_reg_shift * i;
> > +               ret = regmap_read(chip->regmap, sta_reg, &irq_status);
> > +               if (ret) {
> > +                       dev_err(chip->dev,
> > +                               "Failed to read irq status: %d\n", ret);
> > +                       return;
> > +               }
> > +
> > +               if (!irq_status)
> > +                       continue;
> > +
> > +               for (j = 0; j < MT6358_REG_WIDTH ; j++) {
> > +                       if ((irq_status & BIT(j)) == 0)
> > +                               continue;
> > +                       hwirq = mt6358_ints[top_gp].hwirq_base +
> > +                               MT6358_REG_WIDTH * i + j;
> > +                       virq = irq_find_mapping(chip->irq_domain, hwirq);
> > +                       if (virq)
> > +                               handle_nested_irq(virq);
> > +               }
> > +
> > +               regmap_write(chip->regmap, sta_reg, irq_status);
> > +       }
> > +}
> > +
> > +static irqreturn_t mt6358_irq_handler(int irq, void *data)
> > +{
> > +       struct mt6397_chip *chip = data;
> > +       struct pmic_irq_data *mt6358_irq_data = chip->irq_data;
> > +       unsigned int top_irq_status;
> > +       unsigned int i;
> > +       int ret;
> > +
> > +       ret = regmap_read(chip->regmap,
> > +                         mt6358_irq_data->top_int_status_reg,
> > +                         &top_irq_status);
> > +       if (ret) {
> > +               dev_err(chip->dev, "Can't read TOP_INT_STATUS ret=%d\n", ret);
> > +               return IRQ_NONE;
> > +       }
> > +
> > +       for (i = 0; i < mt6358_irq_data->num_top; i++) {
> > +               if (top_irq_status & BIT(mt6358_ints[i].top_offset))
> > +                       mt6358_irq_sp_handler(chip, i);
> > +       }
> > +
> > +       return IRQ_HANDLED;
> > +}
> > +
> > +static int pmic_irq_domain_map(struct irq_domain *d, unsigned int irq,
> > +                              irq_hw_number_t hw)
> > +{
> > +       struct mt6397_chip *mt6397 = d->host_data;
> > +
> > +       irq_set_chip_data(irq, mt6397);
> > +       irq_set_chip_and_handler(irq, &mt6358_irq_chip, handle_level_irq);
> > +       irq_set_nested_thread(irq, 1);
> > +       irq_set_noprobe(irq);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct irq_domain_ops mt6358_irq_domain_ops = {
> > +       .map = pmic_irq_domain_map,
> > +       .xlate = irq_domain_xlate_twocell,
> > +};
> > +
> > +int mt6358_irq_init(struct mt6397_chip *chip)
> > +{
> > +       int i, j, ret;
> > +       struct pmic_irq_data *irqd;
> > +
> > +       irqd = devm_kzalloc(chip->dev, sizeof(struct pmic_irq_data *),
> > +                           GFP_KERNEL);
> > +       if (!irqd)
> > +               return -ENOMEM;
> > +
> > +       chip->irq_data = irqd;
> > +
> > +       mutex_init(&chip->irqlock);
> > +       irqd->top_int_status_reg = MT6358_TOP_INT_STATUS0;
> > +       irqd->num_pmic_irqs = MT6358_IRQ_NR;
> > +       irqd->num_top = ARRAY_SIZE(mt6358_ints);
> 
> ARRAY_SIZE(mt6358_ints) is still used in pmic_irq_sync_unlock. Is this
> variable needed, or should the ARRAY_SIZE(mt6358_ints) in
> pmic_irq_sync_unlock be changed to irqd->num_top too?
> 

I will update to irqd->num_top from ARRAY_SIZE(mt6358_ints) in
pmic_irq_sync_unlock.

> > +
> > +       irqd->enable_hwirq = devm_kcalloc(chip->dev,
> > +                                         irqd->num_pmic_irqs,
> > +                                         sizeof(bool),
> > +                                         GFP_KERNEL);
> > +       if (!irqd->enable_hwirq)
> > +               return -ENOMEM;
> > +
> > +       irqd->cache_hwirq = devm_kcalloc(chip->dev,
> > +                                        irqd->num_pmic_irqs,
> > +                                        sizeof(bool),
> > +                                        GFP_KERNEL);
> > +       if (!irqd->cache_hwirq)
> > +               return -ENOMEM;
> > +
> > +       /* Disable all interrupts for initializing */
> > +       for (i = 0; i < irqd->num_top; i++) {
> > +               for (j = 0; j < mt6358_ints[i].num_int_regs; j++)
> > +                       regmap_write(chip->regmap,
> > +                                    mt6358_ints[i].en_reg +
> > +                                    mt6358_ints[i].en_reg_shift * j, 0);
> > +       }
> > +
> > +       chip->irq_domain = irq_domain_add_linear(chip->dev->of_node,
> > +                                                irqd->num_pmic_irqs,
> > +                                                &mt6358_irq_domain_ops, chip);
> > +       if (!chip->irq_domain) {
> > +               dev_err(chip->dev, "could not create IRQ domain\n");
> > +               return -ENODEV;
> > +       }
> > +
> > +       ret = devm_request_threaded_irq(chip->dev, chip->irq, NULL,
> > +                                       mt6358_irq_handler, IRQF_ONESHOT,
> > +                                       mt6358_irq_chip.name, chip);
> > +       if (ret) {
> > +               dev_err(chip->dev, "failed to register irq=%d; err: %d\n",
> > +                       chip->irq, ret);
> > +               return ret;
> > +       }
> > +
> > +       enable_irq_wake(chip->irq);
> > +       return ret;
> > +}
> > (...)
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
