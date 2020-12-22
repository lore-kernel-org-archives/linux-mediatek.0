Return-Path: <SRS0=m1jb=F2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B69C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 08:42:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D8E4229CA
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Dec 2020 08:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D8E4229CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PVSrGXkxdMXYW3AkeFrmZEd/h65cRvat71iUaYzt/3M=; b=hjM4JrPTgElqFbo/VO14j5lwG
	QieHUJYOzY8+iWQPrP44glEayrGhfghMdbVAAqOfN01YtS7eBuyZzOyOkAnpLYqtU7TNHhkrKqPUT
	LFN4ZsW+Sz0wOrOBXb51uMEwlkZn11Ng8RG+OMpTbmPW9B6CzrrQVnlK8zNVTSoYfRZjHXq78ddOr
	gjOLY6b23qxMWdSaZEN2meghFDD1uLlUSr4bAzUOHIxtGIAWcAGqoqRi7QOFCGuBEKFCOhZesvKl+
	GCFH0ToSQJ/k8RH90bqqD6enmQNNBmARz9ch7o2noSmYTU3EIFaE/wBE7rzFS8QU4FZaPqQC/QjD8
	0i6Qfe0sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krdFk-0003FS-Hr; Tue, 22 Dec 2020 08:42:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krdFi-0003E5-87; Tue, 22 Dec 2020 08:42:43 +0000
X-UUID: cd3a09e6bd6a431ba82881450e3b3e26-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YLfMy68wBB6UlNustrhsqE6gJYC3N0UvKOcE4aN9Y+k=; 
 b=VaN4Cy8Rsgdt8m3E+NW3DBk5X+RJNigwT5q0LkDBbPNHO6Fn/wEt1LIvYhyI8zzwfbAwoUHFX/ULirsOEcUGiCC2A72ajK0Y8VQqwOz2WhLbo5Xp8VeKTm4rbFXt5qPbY6tvnquxpz1jT8UmkfVS4bx4kPJNi62d1foZQW/nWFI=;
X-UUID: cd3a09e6bd6a431ba82881450e3b3e26-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1386259301; Tue, 22 Dec 2020 00:42:32 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 00:38:22 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 22 Dec 2020 16:38:16 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Dec 2020 16:38:15 +0800
Message-ID: <1608626297.14736.113.camel@mhfsdcap03>
Subject: Re: [v5,2/3] PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 22 Dec 2020 16:38:17 +0800
In-Reply-To: <CANMq1KB3UXg8QKwuv3mFaodx-s_AXSrOWp6C+RN7LaA69nsTyg@mail.gmail.com>
References: <20201202133813.6917-1-jianjun.wang@mediatek.com>
 <20201202133813.6917-3-jianjun.wang@mediatek.com>
 <CANMq1KCSWf4PDMVhxFiLHOHe3dFqZbq1gzn4ph8aApVMX56MDg@mail.gmail.com>
 <1608608319.14736.97.camel@mhfsdcap03>
 <CANMq1KB3UXg8QKwuv3mFaodx-s_AXSrOWp6C+RN7LaA69nsTyg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 00173604EC7CD22A602B7873EB32C70165C8892601EF854DADCCF59B40BAB8542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_034242_432183_DD216F40 
X-CRM114-Status: GOOD (  34.51  )
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
 lkml <linux-kernel@vger.kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Bjorn
 Helgaas <bhelgaas@google.com>, sin_jieyang@mediatek.com, "David
 S . Miller" <davem@davemloft.net>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-12-22 at 11:55 +0800, Nicolas Boichat wrote:
> On Tue, Dec 22, 2020 at 11:38 AM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> >
> > On Mon, 2020-12-21 at 10:18 +0800, Nicolas Boichat wrote:
> > > On Wed, Dec 2, 2020 at 9:39 PM Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> > > > [snip]
> > > > +static irq_hw_number_t mtk_pcie_msi_get_hwirq(struct msi_domain_info *info,
> > > > +                                             msi_alloc_info_t *arg)
> > > > +{
> > > > +       struct msi_desc *entry = arg->desc;
> > > > +       struct mtk_pcie_port *port = info->chip_data;
> > > > +       int hwirq;
> > > > +
> > > > +       mutex_lock(&port->lock);
> > > > +
> > > > +       hwirq = bitmap_find_free_region(port->msi_irq_in_use, PCIE_MSI_IRQS_NUM,
> > > > +                                       order_base_2(entry->nvec_used));
> > > > +       if (hwirq < 0) {
> > > > +               mutex_unlock(&port->lock);
> > > > +               return -ENOSPC;
> > > > +       }
> > > > +
> > > > +       mutex_unlock(&port->lock);
> > > > +
> > > > +       return hwirq;
> > >
> > > Code is good, but I had to look twice to make sure the mutex is
> > > unlocked. Is the following marginally better?
> > >
> > > hwirq = ...;
> > >
> > > mutex_unlock(&port->lock);
> > >
> > > if (hwirq < 0)
> > >    return -ENOSPC;
> > >
> > > return hwirq;
> >
> > Impressive, I will fix it in the next version, and I think the hwirq can
> > be returned directly since it will be a negative value if
> > bitmap_find_free_region is failed. The code will be like the following:
> >
> > hwirq = ...;
> >
> > mutex_unlock(&port->lock);
> >
> > return hwirq;
> 
> SG, as long as you're okay with returning -ENOMEM instead of -ENOSPC.
> 
> But now I'm having doubt if negative return values are ok, as
> irq_hw_number_t is unsigned long.
> 
> msi_domain_alloc
> (https://elixir.bootlin.com/linux/latest/source/kernel/irq/msi.c#L143)
> uses it to call irq_find_mapping
> (https://elixir.bootlin.com/linux/latest/source/kernel/irq/irqdomain.c#L882)
> without check, and I'm not convinced irq_find_mapping will error out
> gracefully...
> 
I see, it seems the msi_domain_alloc function assume the get_hwirq
callback always success, maybe I should allocate the real hwirq in the
msi_prepare
(https://elixir.bootlin.com/linux/latest/source/kernel/irq/msi.c#L304)
and set it to arg->hwirq, and override the set_desc
(https://elixir.bootlin.com/linux/latest/source/drivers/pci/msi.c#L1405)
to prevent the modify of arg->hwirq.

> > >
> > > > +}
> > > > +
> > > > [snip]
> > > > +static void mtk_pcie_msi_handler(struct irq_desc *desc)
> > > > +{
> > > > +       struct mtk_pcie_msi *msi_info = irq_desc_get_handler_data(desc);
> > > > +       struct irq_chip *irqchip = irq_desc_get_chip(desc);
> > > > +       unsigned long msi_enable, msi_status;
> > > > +       unsigned int virq;
> > > > +       irq_hw_number_t bit, hwirq;
> > > > +
> > > > +       chained_irq_enter(irqchip, desc);
> > > > +
> > > > +       msi_enable = readl(msi_info->base + PCIE_MSI_ENABLE_OFFSET);
> > > > +       while ((msi_status = readl(msi_info->base + PCIE_MSI_STATUS_OFFSET))) {
> > > > +               msi_status &= msi_enable;
> > >
> > > I don't know much about MSI, but what happens if you have a bit that
> > > is set in PCIE_MSI_STATUS_OFFSET register, but not in msi_enable?
> >
> > If the bit that in PCIE_MSI_STATUS_OFFSET register is set but not in
> > msi_enable, it must be an abnormal usage of MSI or something goes wrong,
> > it should be ignored in case we can not find the corresponding handler.
> >
> > > Sounds like you'll just spin-loop forever without acknowledging the
> > > interrupt.
> >
> > The interrupt will be acknowledged in the irq_ack callback of
> > mtk_msi_irq_chip, which belongs to the msi_domain.
> 
> Let's try to go through it (and please explain to me if I get this wrong).
> 
> Say we have:
> 
> msi_enable = [PCIE_MSI_ENABLE_OFFSET] = 0x1;
> 
> while loop:
> 
> msi_status = [PCIE_MSI_STATUS_OFFSET] = 0x3;
> msi_status &= msi_enable => msi_status = 0x3 & 0x1 = 0x1;
> for_each_set_bit(msi_status) {
>    do something that presumably will disable the MSI interrupt status?

Yes, the corresponding interrupt status will be cleared.

> }
> (next loop iteration)
> 
> msi_status = [PCIE_MSI_STATUS_OFFSET] = 0x2;
> msi_status &= msi_enable => msi_status = 0x2 & 0x1 = 0x0;
> for_each_set_bit(msi_status) => does nothing.
> 
> msi_status = [PCIE_MSI_STATUS_OFFSET] = 0x2;
> (infinite loop)
> 
> Basically, I'm wondering if you should replace the while condition
> statement with:
> 
> while ((msi_status = readl(msi_info->base + PCIE_MSI_STATUS_OFFSET) &
> msi_enable))
> 

Yes, it will be a dead loop if we receive an abnormal interrupt status,
I will fix it in the next version, thanks for your kindly review.

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
