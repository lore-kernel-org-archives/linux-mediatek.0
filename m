Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B59C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 12:36:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D43207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 12:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l2CRmzxq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="PLaQehW0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87D43207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ClUf9jWLlyqlSgwgV0yTwWK45jOH/p96ooCmDnIBreA=; b=l2CRmzxqXvDB5tjFKoHTvMxAS
	fljWm4NLVKH4N2vNkenf6AeF9xLMKnSQ4Igr+6WTGCosq4V2dFcprYhr5SkNvn/NKU6ucxwzJqdDm
	KBROjfx2rdsFMkkUPPnkUeg2KCi0QKiFLIWz9w+tIunscoFHQ4oZLWR7PRTH5qSYhbupTLUpUmZdJ
	AEwJSAsn1417sdFM1ynKza5vikziylhbCpU+XzERfMuRAn6U+QVavC0ypKs2uXoe+SrpjmixO8Fh7
	rY4kJCDFMNrv+/09N7qtZg5I9hrYWyj8iPhc/jfjHvWsihVIlDyv/cH0PScYNa1fakIoKe5o6ejjz
	QwMvE9pXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8jo8-000790-Nv; Thu, 20 Aug 2020 12:36:40 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8jo4-00077n-FC
 for linux-mediatek@lists.infradead.org; Thu, 20 Aug 2020 12:36:37 +0000
Received: by mail-wm1-x344.google.com with SMTP id g75so1439090wme.4
 for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2020 05:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Moer/SJ9KLlu3c/uwDMNvHyn5qjYDQOmB7XI8YOHHus=;
 b=PLaQehW0vLNh+/cJ81yCL0Ml7HL17BTyC4aVxhL/dvOXOv9C7AX2jnPYMhxmMaGOs3
 46lAnhGgNaGPhAoCnzRbhqFs0sujzr02do1qasB12aONgUbOgLR4XJmVxu0u7ByevRqZ
 kIPUfzkx5QM11j5V8QvFuKB9TAWVuYQGkmQFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Moer/SJ9KLlu3c/uwDMNvHyn5qjYDQOmB7XI8YOHHus=;
 b=RbfkwzGHSoLKh6KLjN3+y+94xDFy2yzqFzqLst8fICnmi7AtWLsPVsL5xdEACiOVPm
 6R+4RE7WhhMwWUBivUxPybGWt0FmhIRqQ4CJ01vvszyr6X/BBX6zAaAdgE//clBk9v2T
 Mjxymd4idkybibgEIL3J5FH6sW6IKwrru3sPnBJhNc07upNcQ/JIVEAImVPFNxXUj7fU
 Xfb/n/WUqMLg3/Q7PbJRue3GvO1489OBqUBFe2nSpdXVMg3KeUBXnr7/Q+3UlaHQNf1o
 sMIOEPNiqC+gswq/SKkD9h21amsMOUgXBSEJ5aLwLNVlaZP322nrUlemdRVb/RBda8RQ
 Lddw==
X-Gm-Message-State: AOAM530C3mLtyp3ZSYyc22IyXSaQDEtZSYgVwSIyZ545igRbaR1x1vBU
 d3Z0DGQKiXU/RaPwkdHOH1xrNhK6f3457h4LALsdGg==
X-Google-Smtp-Source: ABdhPJzieD2BdIwd5/DSBke56nqPwJlmPQzUB3bcJJb0oKNuOfviI7H6eOIVa6cKDK/kzUs1LFUdrdxPzKW/gK24iQ0=
X-Received: by 2002:a7b:c0c8:: with SMTP id s8mr3467143wmh.4.1597926993474;
 Thu, 20 Aug 2020 05:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200819034231.20726-1-mark-pk.tsai@mediatek.com>
 <20200819153757.28993-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20200819153757.28993-1-mark-pk.tsai@mediatek.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 20 Aug 2020 21:36:22 +0900
Message-ID: <CAFr9PXnzdHs2F3pyF-493xuhn9wFU1G9eLXRtiW-rYNB5bLX7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] irqchip: irq-mst: Add MStar interrupt controller
 support
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_083636_698899_C4879CCE 
X-CRM114-Status: GOOD (  29.72  )
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
Cc: DTML <devicetree@vger.kernel.org>, alix.wu@mediatek.com,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>,
 yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark-PK, Marc

I'm not sure this will be the final version but I'm going to try to
integrate this with my current MStar/SigmaStar tree over the weekend
and then I guess I can give this a tested-by?

Assuming this version or the next is acceptable can I just follow up
with a small patch to add the instances I need in my dtsi or should I
wait until it's merged before doing that?

Thanks,

Daniel

On Thu, 20 Aug 2020 at 00:38, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> Add MStar interrupt controller support using hierarchy irq
> domain.
>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  drivers/irqchip/Kconfig        |   8 ++
>  drivers/irqchip/Makefile       |   1 +
>  drivers/irqchip/irq-mst-intc.c | 199 +++++++++++++++++++++++++++++++++
>  3 files changed, 208 insertions(+)
>  create mode 100644 drivers/irqchip/irq-mst-intc.c
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index bb70b7177f94..0b5ae5fa0d3c 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -571,4 +571,12 @@ config LOONGSON_PCH_MSI
>         help
>           Support for the Loongson PCH MSI Controller.
>
> +config MST_IRQ
> +       bool "MStar Interrupt Controller"
> +       default ARCH_MEDIATEK
> +       select IRQ_DOMAIN
> +       select IRQ_DOMAIN_HIERARCHY
> +       help
> +         Support MStar Interrupt Controller.
> +
>  endmenu
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 133f9c45744a..e2688a62403e 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -111,3 +111,4 @@ obj-$(CONFIG_LOONGSON_HTPIC)                += irq-loongson-htpic.o
>  obj-$(CONFIG_LOONGSON_HTVEC)           += irq-loongson-htvec.o
>  obj-$(CONFIG_LOONGSON_PCH_PIC)         += irq-loongson-pch-pic.o
>  obj-$(CONFIG_LOONGSON_PCH_MSI)         += irq-loongson-pch-msi.o
> +obj-$(CONFIG_MST_IRQ)                  += irq-mst-intc.o
> diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
> new file mode 100644
> index 000000000000..4be077591898
> --- /dev/null
> +++ b/drivers/irqchip/irq-mst-intc.c
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2020 MediaTek Inc.
> + * Author Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> + */
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#define INTC_MASK      0x0
> +#define INTC_EOI       0x20
> +
> +struct mst_intc_chip_data {
> +       raw_spinlock_t  lock;
> +       unsigned int    irq_start, nr_irqs;
> +       void __iomem    *base;
> +       bool            no_eoi;
> +};
> +
> +static void mst_set_irq(struct irq_data *d, u32 offset)
> +{
> +       irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +       struct mst_intc_chip_data *cd = irq_data_get_irq_chip_data(d);
> +       u16 val, mask;
> +       unsigned long flags;
> +
> +       mask = 1 << (hwirq % 16);
> +       offset += (hwirq / 16) * 4;
> +
> +       raw_spin_lock_irqsave(&cd->lock, flags);
> +       val = readw_relaxed(cd->base + offset) | mask;
> +       writew_relaxed(val, cd->base + offset);
> +       raw_spin_unlock_irqrestore(&cd->lock, flags);
> +}
> +
> +static void mst_clear_irq(struct irq_data *d, u32 offset)
> +{
> +       irq_hw_number_t hwirq = irqd_to_hwirq(d);
> +       struct mst_intc_chip_data *cd = irq_data_get_irq_chip_data(d);
> +       u16 val, mask;
> +       unsigned long flags;
> +
> +       mask = 1 << (hwirq % 16);
> +       offset += (hwirq / 16) * 4;
> +
> +       raw_spin_lock_irqsave(&cd->lock, flags);
> +       val = readw_relaxed(cd->base + offset) & ~mask;
> +       writew_relaxed(val, cd->base + offset);
> +       raw_spin_unlock_irqrestore(&cd->lock, flags);
> +}
> +
> +static void mst_intc_mask_irq(struct irq_data *d)
> +{
> +       mst_set_irq(d, INTC_MASK);
> +       irq_chip_mask_parent(d);
> +}
> +
> +static void mst_intc_unmask_irq(struct irq_data *d)
> +{
> +       mst_clear_irq(d, INTC_MASK);
> +       irq_chip_unmask_parent(d);
> +}
> +
> +static void mst_intc_eoi_irq(struct irq_data *d)
> +{
> +       struct mst_intc_chip_data *cd = irq_data_get_irq_chip_data(d);
> +
> +       if (!cd->no_eoi)
> +               mst_set_irq(d, INTC_EOI);
> +
> +       irq_chip_eoi_parent(d);
> +}
> +
> +static struct irq_chip mst_intc_chip = {
> +       .name                   = "mst-intc",
> +       .irq_mask               = mst_intc_mask_irq,
> +       .irq_unmask             = mst_intc_unmask_irq,
> +       .irq_eoi                = mst_intc_eoi_irq,
> +       .irq_get_irqchip_state  = irq_chip_get_parent_state,
> +       .irq_set_irqchip_state  = irq_chip_set_parent_state,
> +       .irq_set_affinity       = irq_chip_set_affinity_parent,
> +       .irq_set_vcpu_affinity  = irq_chip_set_vcpu_affinity_parent,
> +       .irq_set_type           = irq_chip_set_type_parent,
> +       .irq_retrigger          = irq_chip_retrigger_hierarchy,
> +       .flags                  = IRQCHIP_SET_TYPE_MASKED |
> +                                 IRQCHIP_SKIP_SET_WAKE |
> +                                 IRQCHIP_MASK_ON_SUSPEND,
> +};
> +
> +static int mst_intc_domain_translate(struct irq_domain *d,
> +                                    struct irq_fwspec *fwspec,
> +                                    unsigned long *hwirq,
> +                                    unsigned int *type)
> +{
> +       struct mst_intc_chip_data *cd = d->host_data;
> +
> +       if (is_of_node(fwspec->fwnode)) {
> +               if (fwspec->param_count != 3)
> +                       return -EINVAL;
> +
> +               /* No PPI should point to this domain */
> +               if (fwspec->param[0] != 0)
> +                       return -EINVAL;
> +
> +               if (fwspec->param[1] >= cd->nr_irqs)
> +                       return -EINVAL;
> +
> +               *hwirq = fwspec->param[1];
> +               *type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> +
> +static int mst_intc_domain_alloc(struct irq_domain *domain, unsigned int virq,
> +                                unsigned int nr_irqs, void *data)
> +{
> +       int i;
> +       irq_hw_number_t hwirq;
> +       struct irq_fwspec parent_fwspec, *fwspec = data;
> +       struct mst_intc_chip_data *cd = domain->host_data;
> +
> +       /* Not GIC compliant */
> +       if (fwspec->param_count != 3)
> +               return -EINVAL;
> +
> +       /* No PPI should point to this domain */
> +       if (fwspec->param[0])
> +               return -EINVAL;
> +
> +       hwirq = fwspec->param[1];
> +       for (i = 0; i < nr_irqs; i++)
> +               irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
> +                                             &mst_intc_chip,
> +                                             domain->host_data);
> +
> +       parent_fwspec = *fwspec;
> +       parent_fwspec.fwnode = domain->parent->fwnode;
> +       parent_fwspec.param[1] = cd->irq_start + hwirq;
> +       return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent_fwspec);
> +}
> +
> +static const struct irq_domain_ops mst_intc_domain_ops = {
> +       .translate      = mst_intc_domain_translate,
> +       .alloc          = mst_intc_domain_alloc,
> +       .free           = irq_domain_free_irqs_common,
> +};
> +
> +int __init
> +mst_intc_of_init(struct device_node *dn, struct device_node *parent)
> +{
> +       struct irq_domain *domain, *domain_parent;
> +       struct mst_intc_chip_data *cd;
> +       u32 irq_start, irq_end;
> +
> +       domain_parent = irq_find_host(parent);
> +       if (!domain_parent) {
> +               pr_err("mst-intc: interrupt-parent not found\n");
> +               return -EINVAL;
> +       }
> +
> +       if (of_property_read_u32_index(dn, "mstar,irqs-map-range", 0, &irq_start) ||
> +           of_property_read_u32_index(dn, "mstar,irqs-map-range", 1, &irq_end))
> +               return -EINVAL;
> +
> +       cd = kzalloc(sizeof(*cd), GFP_KERNEL);
> +       if (!cd)
> +               return -ENOMEM;
> +
> +       cd->base = of_iomap(dn, 0);
> +       if (!cd->base) {
> +               kfree(cd);
> +               return -ENOMEM;
> +       }
> +
> +       cd->no_eoi = of_property_read_bool(dn, "mstar,intc-no-eoi");
> +       raw_spin_lock_init(&cd->lock);
> +       cd->irq_start = irq_start;
> +       cd->nr_irqs = irq_end - irq_start + 1;
> +       domain = irq_domain_add_hierarchy(domain_parent, 0, cd->nr_irqs, dn,
> +                                         &mst_intc_domain_ops, cd);
> +       if (!domain) {
> +               iounmap(cd->base);
> +               kfree(cd);
> +               return -ENOMEM;
> +       }
> +
> +       return 0;
> +}
> +
> +IRQCHIP_DECLARE(mst_intc, "mstar,mst-intc", mst_intc_of_init);
> --
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
