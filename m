Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEA7C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 03:06:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72C8A64DA3
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 03:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72C8A64DA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MpXgxeHBJDtNbA2C7zXi0nnIcnwodBZxhyjZn6h5DW4=; b=W3rT7xsz9EY+Sm08S7t/DkoJW
	9swsSHMwxnKdIj9X5NWBlxc17FimmVLW/qxlEfxxyJeh6f8t7TNz2rgeo1JLdLIRaFY6RXf/uurRE
	HXMWxpMs/RM9SNShIYnTM2tHT0iSbqHvX9AweaxHJCY9KDznAC88B+1AM5YN6ZhTbNsw0SZGYTe3D
	lJ/PWOKArIyPDfZP7jdVRCoGkQCluQvRKeox993gygWOfkZxt3lUj44PaeXDVS3Ik9Q8kHea+s8lw
	zFe7sDWnxUW7EpmCsGWcPlm0/fwt1olW3ByzN811SYssFmBpe5rNb1coQJWmFB0JS+apLTXcJh1TR
	f21HZopLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJpAR-005sLa-Py; Wed, 10 Mar 2021 03:05:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJpAJ-005sHP-Lt; Wed, 10 Mar 2021 03:05:44 +0000
X-UUID: cb370f486b2a4996be629f2a38386c2f-20210309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lgYMPyfI/gWImJMYFgXEdeuYn+Gaj//HQfyXplO2nUg=; 
 b=eAHR7Z6RgBLPZpqeXzb9EruqMIo/qOlOo/6Y4ox0RMVLVYB5QvAVmWbyIFrVCxOWZlpK11cB6/arcTCeHY36cddYg6saHulGstBStMlO8J+03UFCKGzfkQNKqWaQRpTjHKJETQUGmFJZUZ+Od+ytLqLwSu3aZ2IjUkWTgxQqf9s=;
X-UUID: cb370f486b2a4996be629f2a38386c2f-20210309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 354837759; Tue, 09 Mar 2021 19:05:31 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Mar 2021 19:05:29 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 10 Mar 2021 11:05:22 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Mar 2021 11:05:17 +0800
Message-ID: <1615345515.25662.12.camel@mhfsdcap03>
Subject: Re: [v8,4/7] PCI: mediatek-gen3: Add INTx support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
CC: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Sj
 Huang" <sj.huang@mediatek.com>, <youlin.pei@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <sin_jieyang@mediatek.com>, <drinkcat@chromium.org>,
 <Rex-BC.Chen@mediatek.com>, <anson.chuang@mediatek.com>
Date: Wed, 10 Mar 2021 11:05:15 +0800
In-Reply-To: <87r1koy442.wl-maz@kernel.org>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-5-jianjun.wang@mediatek.com>
 <87r1koy442.wl-maz@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D305C0EB95B1E4DB84B071274B4E294D18232D4B3400CB35DD62537707EF37132000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_030540_365133_F85142EB 
X-CRM114-Status: GOOD (  29.09  )
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

On Tue, 2021-03-09 at 11:10 +0000, Marc Zyngier wrote:
> On Wed, 24 Feb 2021 06:11:29 +0000,
> Jianjun Wang <jianjun.wang@mediatek.com> wrote:
> > 
> > Add INTx support for MediaTek Gen3 PCIe controller.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 176 ++++++++++++++++++++
> >  1 file changed, 176 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> > index c602beb9afec..8b3b5f838b69 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -9,6 +9,9 @@
> >  #include <linux/clk.h>
> >  #include <linux/delay.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/irqdomain.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/pci.h>
> > @@ -45,6 +48,13 @@
> >  #define PCIE_LINK_STATUS_REG		0x154
> >  #define PCIE_PORT_LINKUP		BIT(8)
> >  
> > +#define PCIE_INT_ENABLE_REG		0x180
> > +#define PCIE_INTX_SHIFT			24
> > +#define PCIE_INTX_ENABLE \
> > +	GENMASK(PCIE_INTX_SHIFT + PCI_NUM_INTX - 1, PCIE_INTX_SHIFT)
> > +
> > +#define PCIE_INT_STATUS_REG		0x184
> > +
> >  #define PCIE_TRANS_TABLE_BASE_REG	0x800
> >  #define PCIE_ATR_SRC_ADDR_MSB_OFFSET	0x4
> >  #define PCIE_ATR_TRSL_ADDR_LSB_OFFSET	0x8
> > @@ -73,6 +83,9 @@
> >   * @phy: PHY controller block
> >   * @clks: PCIe clocks
> >   * @num_clks: PCIe clocks count for this port
> > + * @irq: PCIe controller interrupt number
> > + * @irq_lock: lock protecting IRQ register access
> > + * @intx_domain: legacy INTx IRQ domain
> >   */
> >  struct mtk_pcie_port {
> >  	struct device *dev;
> > @@ -83,6 +96,10 @@ struct mtk_pcie_port {
> >  	struct phy *phy;
> >  	struct clk_bulk_data *clks;
> >  	int num_clks;
> > +
> > +	int irq;
> > +	raw_spinlock_t irq_lock;
> > +	struct irq_domain *intx_domain;
> >  };
> >  
> >  /**
> > @@ -199,6 +216,11 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
> >  	val |= PCI_CLASS(PCI_CLASS_BRIDGE_PCI << 8);
> >  	writel_relaxed(val, port->base + PCIE_PCI_IDS_1);
> >  
> > +	/* Mask all INTx interrupts */
> > +	val = readl_relaxed(port->base + PCIE_INT_ENABLE_REG);
> > +	val &= ~PCIE_INTX_ENABLE;
> > +	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
> > +
> >  	/* Assert all reset signals */
> >  	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
> >  	val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
> > @@ -262,6 +284,154 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
> >  	return 0;
> >  }
> >  
> > +static int mtk_pcie_set_affinity(struct irq_data *data,
> > +				 const struct cpumask *mask, bool force)
> > +{
> > +	return -EINVAL;
> > +}
> > +
> > +static void mtk_intx_mask(struct irq_data *data)
> > +{
> > +	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
> > +	unsigned long flags;
> > +	u32 val;
> > +
> > +	raw_spin_lock_irqsave(&port->irq_lock, flags);
> > +	val = readl_relaxed(port->base + PCIE_INT_ENABLE_REG);
> > +	val &= ~BIT(data->hwirq + PCIE_INTX_SHIFT);
> > +	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
> > +	raw_spin_unlock_irqrestore(&port->irq_lock, flags);
> > +}
> > +
> > +static void mtk_intx_unmask(struct irq_data *data)
> > +{
> > +	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
> > +	unsigned long flags;
> > +	u32 val;
> > +
> > +	raw_spin_lock_irqsave(&port->irq_lock, flags);
> > +	val = readl_relaxed(port->base + PCIE_INT_ENABLE_REG);
> > +	val |= BIT(data->hwirq + PCIE_INTX_SHIFT);
> > +	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
> > +	raw_spin_unlock_irqrestore(&port->irq_lock, flags);
> > +}
> > +
> > +/**
> > + * mtk_intx_eoi
> > + * @data: pointer to chip specific data
> > + *
> > + * As an emulated level IRQ, its interrupt status will remain
> > + * until the corresponding de-assert message is received; hence that
> > + * the status can only be cleared when the interrupt has been serviced.
> > + */
> > +static void mtk_intx_eoi(struct irq_data *data)
> > +{
> > +	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
> > +	unsigned long hwirq;
> > +
> > +	hwirq = data->hwirq + PCIE_INTX_SHIFT;
> > +	writel_relaxed(BIT(hwirq), port->base + PCIE_INT_STATUS_REG);
> > +}
> > +
> > +static struct irq_chip mtk_intx_irq_chip = {
> > +	.irq_enable		= mtk_intx_unmask,
> > +	.irq_disable		= mtk_intx_mask,
> 
> Please get rid of enable/disable. Given that you already have
> mask/unmask with the *same* implementation, this offers zero benefit.

Hi Marc,

Thanks for your review.

We need to support suspend/resume feature, the HW will be powered off
when the system is suspended, and its register value will be cleared. If
the enable/disable callback is not implemented, the unmask function will
not be called when the system resume, so INTx will remain disabled.

Can I keep the enable/disable callback? Or do we have any solutions to
restore the register value when the system resume?

Thanks.
> 
> > +	.irq_mask		= mtk_intx_mask,
> > +	.irq_unmask		= mtk_intx_unmask,
> > +	.irq_eoi		= mtk_intx_eoi,
> > +	.irq_set_affinity	= mtk_pcie_set_affinity,
> > +	.name			= "INTx",
> > +};
> 
> [...]
> 
> Other that that, this look good to me.
> 
> Thanks,
> 
> 	M.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
