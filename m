Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C0EC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 03:56:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9402322D03
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 03:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9402322D03
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NCc6rBg+iF/SEzTCZwrKCVzkVVK0ok7u3NpdvS+v/yo=; b=IqmZZKyBHyA0egDrrehN2Q0fs
	SKz9eRc5PhiLVfgQ4nrE+QgquIGITx1m8IK4QP8p8YF2bEiVupL/Q9BKTuabho6QHM4YDTBnNzBcX
	TH19IAl7E8n9DmDpr7kOQ0AMTymmR+sGzbKW3GegdAFL0ROAw6kWPr+pHS24B1gCEolyYzAczylKz
	asQmQfqu8d32r+s+lcbsk/qQ1agWaSv+YblC6zeRpBcBQsFzM0aRkqIVdP7YKkRCaHN9ep+hG9AsF
	pS6XK8zO0l/Wu9IcboqYRsS7JxxFs0PxwP3CgamIYki+FCx5aVUluNSqNUfuunUmZFsG7C0WIctOg
	4pL6NIj3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krYmL-0005AD-Ti; Tue, 22 Dec 2020 03:56:05 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krYmI-00058f-BS
 for linux-mediatek@lists.infradead.org; Tue, 22 Dec 2020 03:56:04 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id x26so6390137vsq.1
 for <linux-mediatek@lists.infradead.org>; Mon, 21 Dec 2020 19:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zBdY+iGV2k1HyD2s2ItPRsC+/Ij4zOZsTARmabtWF14=;
 b=BEtMAK/Ln7aSQYZB3kzWI2QxXg3ZjJTwvkkPaJIi8TiAvqmropOMZ2PHYAhx7rJzki
 TlQGDs5l4Ngxi5eZ3K6mHDk7R5TIpMvxlnOWsdiA6wkNUiKMvFSVF9/fkj1lzGerCq/0
 IPTWf4AApotLJTiBuuxr/E+GW0Eat60kG2B6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBdY+iGV2k1HyD2s2ItPRsC+/Ij4zOZsTARmabtWF14=;
 b=SgCbjPJxwIialTOYnN/rJ++qJ7+5mLYp6HuEwy9SKJoVsVmUD6LWFaCUOxMRodOqON
 8aP7VjohmrjvC3HmOM3MbQAt5CnLDANkbdQW61PjhN9h6FKMmqasonhNsW9u0yvHtp/S
 81tA5ofCDm3xxoX55rb5iZPjD/8ihcsxU5r7kvk//uzH/7bqg/q3trEBiRwjPKo60MkB
 lRzJz8Yx2MKpSKsyXkNjv83LBRHR+wDLgdJVioEfNGTH9WijZ7Zel/K+GUeU6gZCItbP
 noiBB/GEIqyuaTP6Kvq3fbyuw5j7FFh9eF5sdNUzQH/+oynQbeSgm86nhMHk4nNasr7h
 56DQ==
X-Gm-Message-State: AOAM532AN5aXE0hYwwFm/RY9MBfu4xv7G31eIw8dnRvdyyOnXqF9sl0C
 Z5D2u9TMG0iJ8n/5XoX4Dxk+3CBFlW6mY6Ve+m96Gg==
X-Google-Smtp-Source: ABdhPJzZ0hdnkwXJgJV2+C+Ef3YdVvAN8t9K9JjReqGbKUR1SNJ3k+OtA3Skw19bt8acyhLtegwBYiZy1L1X2Z295M8=
X-Received: by 2002:a67:6182:: with SMTP id v124mr14263455vsb.16.1608609358592; 
 Mon, 21 Dec 2020 19:55:58 -0800 (PST)
MIME-Version: 1.0
References: <20201202133813.6917-1-jianjun.wang@mediatek.com>
 <20201202133813.6917-3-jianjun.wang@mediatek.com>
 <CANMq1KCSWf4PDMVhxFiLHOHe3dFqZbq1gzn4ph8aApVMX56MDg@mail.gmail.com>
 <1608608319.14736.97.camel@mhfsdcap03>
In-Reply-To: <1608608319.14736.97.camel@mhfsdcap03>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 22 Dec 2020 11:55:47 +0800
Message-ID: <CANMq1KB3UXg8QKwuv3mFaodx-s_AXSrOWp6C+RN7LaA69nsTyg@mail.gmail.com>
Subject: Re: [v5,2/3] PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
To: Jianjun Wang <jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_225602_479314_BA6F574D 
X-CRM114-Status: GOOD (  25.91  )
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
Cc: youlin.pei@mediatek.com, Devicetree List <devicetree@vger.kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, qizhong.cheng@mediatek.com,
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Sj Huang <sj.huang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, sin_jieyang@mediatek.com,
 "David S . Miller" <davem@davemloft.net>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 22, 2020 at 11:38 AM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
>
> On Mon, 2020-12-21 at 10:18 +0800, Nicolas Boichat wrote:
> > On Wed, Dec 2, 2020 at 9:39 PM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> > > [snip]
> > > +static irq_hw_number_t mtk_pcie_msi_get_hwirq(struct msi_domain_info *info,
> > > +                                             msi_alloc_info_t *arg)
> > > +{
> > > +       struct msi_desc *entry = arg->desc;
> > > +       struct mtk_pcie_port *port = info->chip_data;
> > > +       int hwirq;
> > > +
> > > +       mutex_lock(&port->lock);
> > > +
> > > +       hwirq = bitmap_find_free_region(port->msi_irq_in_use, PCIE_MSI_IRQS_NUM,
> > > +                                       order_base_2(entry->nvec_used));
> > > +       if (hwirq < 0) {
> > > +               mutex_unlock(&port->lock);
> > > +               return -ENOSPC;
> > > +       }
> > > +
> > > +       mutex_unlock(&port->lock);
> > > +
> > > +       return hwirq;
> >
> > Code is good, but I had to look twice to make sure the mutex is
> > unlocked. Is the following marginally better?
> >
> > hwirq = ...;
> >
> > mutex_unlock(&port->lock);
> >
> > if (hwirq < 0)
> >    return -ENOSPC;
> >
> > return hwirq;
>
> Impressive, I will fix it in the next version, and I think the hwirq can
> be returned directly since it will be a negative value if
> bitmap_find_free_region is failed. The code will be like the following:
>
> hwirq = ...;
>
> mutex_unlock(&port->lock);
>
> return hwirq;

SG, as long as you're okay with returning -ENOMEM instead of -ENOSPC.

But now I'm having doubt if negative return values are ok, as
irq_hw_number_t is unsigned long.

msi_domain_alloc
(https://elixir.bootlin.com/linux/latest/source/kernel/irq/msi.c#L143)
uses it to call irq_find_mapping
(https://elixir.bootlin.com/linux/latest/source/kernel/irq/irqdomain.c#L882)
without check, and I'm not convinced irq_find_mapping will error out
gracefully...

> >
> > > +}
> > > +
> > > [snip]
> > > +static void mtk_pcie_msi_handler(struct irq_desc *desc)
> > > +{
> > > +       struct mtk_pcie_msi *msi_info = irq_desc_get_handler_data(desc);
> > > +       struct irq_chip *irqchip = irq_desc_get_chip(desc);
> > > +       unsigned long msi_enable, msi_status;
> > > +       unsigned int virq;
> > > +       irq_hw_number_t bit, hwirq;
> > > +
> > > +       chained_irq_enter(irqchip, desc);
> > > +
> > > +       msi_enable = readl(msi_info->base + PCIE_MSI_ENABLE_OFFSET);
> > > +       while ((msi_status = readl(msi_info->base + PCIE_MSI_STATUS_OFFSET))) {
> > > +               msi_status &= msi_enable;
> >
> > I don't know much about MSI, but what happens if you have a bit that
> > is set in PCIE_MSI_STATUS_OFFSET register, but not in msi_enable?
>
> If the bit that in PCIE_MSI_STATUS_OFFSET register is set but not in
> msi_enable, it must be an abnormal usage of MSI or something goes wrong,
> it should be ignored in case we can not find the corresponding handler.
>
> > Sounds like you'll just spin-loop forever without acknowledging the
> > interrupt.
>
> The interrupt will be acknowledged in the irq_ack callback of
> mtk_msi_irq_chip, which belongs to the msi_domain.

Let's try to go through it (and please explain to me if I get this wrong).

Say we have:

msi_enable = [PCIE_MSI_ENABLE_OFFSET] = 0x1;

while loop:

msi_status = [PCIE_MSI_STATUS_OFFSET] = 0x3;
msi_status &= msi_enable => msi_status = 0x3 & 0x1 = 0x1;
for_each_set_bit(msi_status) {
   do something that presumably will disable the MSI interrupt status?
}
(next loop iteration)

msi_status = [PCIE_MSI_STATUS_OFFSET] = 0x2;
msi_status &= msi_enable => msi_status = 0x2 & 0x1 = 0x0;
for_each_set_bit(msi_status) => does nothing.

msi_status = [PCIE_MSI_STATUS_OFFSET] = 0x2;
(infinite loop)

Basically, I'm wondering if you should replace the while condition
statement with:

while ((msi_status = readl(msi_info->base + PCIE_MSI_STATUS_OFFSET) &
msi_enable))

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
