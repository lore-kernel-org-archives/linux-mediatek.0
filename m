Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1D5C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 12:32:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 841EE20799
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 12:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 841EE20799
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MLvr/n/XVnwQSpqSI2kEeuCVVWlSg0ad+x/YcBKks2w=; b=Wkz/ZijGUOfu4+hN2UTVB7o2Z
	Z4h0A1Y+MhF69UgR+EDX87xDyCyIerbFPYy1uenwaqSkK+RxaYHI35vTbr9h0k3ZVEMODf7OYihX4
	dLFh9jfwCx22bkWE+exikKQj2x2F1RTxqcOS8EM7lt4zvIWYzVJmGJ9pJbcDoOGQWlDZeLnevSYmv
	+oRHyttdHfbufyCtNjBTkUVHJbAf443X8BQ4WFugm6g6fX2DnvIJ3SYR4tdQX7FeuFR846Thnth78
	52PssTNpc/YQuf3qHsUY21CIBBdCJFXekEwxSB5muB7+nCvjmYdOiKfuURfaRMqC4aezh3vQ6IMPV
	cuA2w3CRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4jzY-0000nG-OT; Wed, 27 Jan 2021 12:32:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4jzV-0000lb-1d; Wed, 27 Jan 2021 12:32:10 +0000
X-UUID: 8416e3a29c0c471abe13f862e90dd9fe-20210127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DkkpS463sKMt7rQVu29v7oabEPT49RSNtolILn0Z62M=; 
 b=Gi+u3AvdiKGNyFnVABGf0f47C20wFOiEW3QAKPqtJSGZfAPKQyXvJyfpqNMNo8wpJXL8+Q3AS9a4hMwly+7nihJpmw/b2sKkv3QfsleI4ZXdQGeuCHCO7E4XZxUgII+1i+xTaFzm9YTcndHJZmHVMh0yfwIKA+XHuLzbQfUNdeI=;
X-UUID: 8416e3a29c0c471abe13f862e90dd9fe-20210127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1176183970; Wed, 27 Jan 2021 04:31:59 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Jan 2021 04:31:57 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Jan 2021 20:31:47 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Jan 2021 20:31:46 +0800
Message-ID: <1611750706.14672.54.camel@mhfsdcap03>
Subject: Re: [v7,5/7] PCI: mediatek-gen3: Add MSI support
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
Date: Wed, 27 Jan 2021 20:31:46 +0800
In-Reply-To: <661df220100e0d4e69f5cde90c083f4a@kernel.org>
References: <20210113114001.5804-1-jianjun.wang@mediatek.com>
 <20210113114001.5804-6-jianjun.wang@mediatek.com>
 <661df220100e0d4e69f5cde90c083f4a@kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 52086F8DF21D0DC94E6865952853E5AE50C784BC2F4DE274A2DEE05417034C012000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_073209_381355_F3E8A303 
X-CRM114-Status: GOOD (  30.67  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rex-BC.Chen@mediatek.com,
 qizhong.cheng@mediatek.com, chuanjia.liu@mediatek.com,
 linux-pci@vger.kernel.org, drinkcat@chromium.org,
 Ryder Lee <ryder.lee@mediatek.com>, anson.chuang@mediatek.com,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Sj
 Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>, sin_jieyang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-01-26 at 13:57 +0000, Marc Zyngier wrote:
> On 2021-01-13 11:39, Jianjun Wang wrote:
> > Add MSI support for MediaTek Gen3 PCIe controller.
> > 
> > This PCIe controller supports up to 256 MSI vectors, the MSI hardware
> > block diagram is as follows:
> > 
> >                   +-----+
> >                   | GIC |
> >                   +-----+
> >                      ^
> >                      |
> >                  port->irq
> >                      |
> >              +-+-+-+-+-+-+-+-+
> >              |0|1|2|3|4|5|6|7| (PCIe intc)
> >              +-+-+-+-+-+-+-+-+
> >               ^ ^           ^
> >               | |    ...    |
> >       +-------+ +------+    +-----------+
> >       |                |                |
> > +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
> > |0|1|...|30|31|  |0|1|...|30|31|  |0|1|...|30|31| (MSI sets)
> > +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
> >  ^ ^      ^  ^    ^ ^      ^  ^    ^ ^      ^  ^
> >  | |      |  |    | |      |  |    | |      |  |  (MSI vectors)
> >  | |      |  |    | |      |  |    | |      |  |
> > 
> >   (MSI SET0)       (MSI SET1)  ...   (MSI SET7)
> > 
> > With 256 MSI vectors supported, the MSI vectors are composed of 8 sets,
> > each set has its own address for MSI message, and supports 32 MSI 
> > vectors
> > to generate interrupt.
> > 
> > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 261 ++++++++++++++++++++
> >  1 file changed, 261 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> > b/drivers/pci/controller/pcie-mediatek-gen3.c
> > index 7979a2856c35..471d97cd1ef9 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/irqdomain.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > +#include <linux/msi.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_clk.h>
> >  #include <linux/of_pci.h>
> > @@ -52,11 +53,28 @@
> >  #define PCIE_LINK_STATUS_REG		0x154
> >  #define PCIE_PORT_LINKUP		BIT(8)
> > 
> > +#define PCIE_MSI_SET_NUM		8
> > +#define PCIE_MSI_IRQS_PER_SET		32
> > +#define PCIE_MSI_IRQS_NUM \
> > +	(PCIE_MSI_IRQS_PER_SET * (PCIE_MSI_SET_NUM))
> 
> Spurious inner bracketing.
> 
> > +
> >  #define PCIE_INT_ENABLE_REG		0x180
> > +#define PCIE_MSI_ENABLE			GENMASK(PCIE_MSI_SET_NUM + 8 - 1, 8)
> > +#define PCIE_MSI_SHIFT			8
> >  #define PCIE_INTX_SHIFT			24
> >  #define PCIE_INTX_MASK			GENMASK(27, 24)
> > 
> >  #define PCIE_INT_STATUS_REG		0x184
> > +#define PCIE_MSI_SET_ENABLE_REG		0x190
> > +#define PCIE_MSI_SET_ENABLE		GENMASK(PCIE_MSI_SET_NUM - 1, 0)
> > +
> > +#define PCIE_MSI_SET_BASE_REG		0xc00
> > +#define PCIE_MSI_SET_OFFSET		0x10
> > +#define PCIE_MSI_SET_STATUS_OFFSET	0x04
> > +#define PCIE_MSI_SET_ENABLE_OFFSET	0x08
> > +
> > +#define PCIE_MSI_SET_ADDR_HI_BASE	0xc80
> > +#define PCIE_MSI_SET_ADDR_HI_OFFSET	0x04
> > 
> >  #define PCIE_TRANS_TABLE_BASE_REG	0x800
> >  #define PCIE_ATR_SRC_ADDR_MSB_OFFSET	0x4
> > @@ -76,6 +94,18 @@
> >  #define PCIE_ATR_TLP_TYPE_MEM		PCIE_ATR_TLP_TYPE(0)
> >  #define PCIE_ATR_TLP_TYPE_IO		PCIE_ATR_TLP_TYPE(2)
> > 
> > +/**
> > + * struct mtk_pcie_msi - MSI information for each set
> > + * @dev: pointer to PCIe device
> > + * @base: IO mapped register base
> > + * @msg_addr: MSI message address
> > + */
> > +struct mtk_msi_set {
> > +	struct device *dev;
> > +	void __iomem *base;
> > +	phys_addr_t msg_addr;
> > +};
> > +
> >  /**
> >   * struct mtk_pcie_port - PCIe port information
> >   * @dev: pointer to PCIe device
> > @@ -88,6 +118,11 @@
> >   * @num_clks: PCIe clocks count for this port
> >   * @irq: PCIe controller interrupt number
> >   * @intx_domain: legacy INTx IRQ domain
> > + * @msi_domain: MSI IRQ domain
> > + * @msi_bottom_domain: MSI IRQ bottom domain
> > + * @msi_sets: MSI sets information
> > + * @lock: lock protecting IRQ bit map
> > + * @msi_irq_in_use: bit map for assigned MSI IRQ
> >   */
> >  struct mtk_pcie_port {
> >  	struct device *dev;
> > @@ -101,6 +136,11 @@ struct mtk_pcie_port {
> > 
> >  	int irq;
> >  	struct irq_domain *intx_domain;
> > +	struct irq_domain *msi_domain;
> > +	struct irq_domain *msi_bottom_domain;
> > +	struct mtk_msi_set msi_sets[PCIE_MSI_SET_NUM];
> > +	struct mutex lock;
> > +	DECLARE_BITMAP(msi_irq_in_use, PCIE_MSI_IRQS_NUM);
> >  };
> > 
> >  /**
> > @@ -243,6 +283,15 @@ static int mtk_pcie_startup_port(struct
> > mtk_pcie_port *port)
> >  		return err;
> >  	}
> > 
> > +	/* Enable MSI */
> > +	val = readl_relaxed(port->base + PCIE_MSI_SET_ENABLE_REG);
> > +	val |= PCIE_MSI_SET_ENABLE;
> > +	writel_relaxed(val, port->base + PCIE_MSI_SET_ENABLE_REG);
> > +
> > +	val = readl_relaxed(port->base + PCIE_INT_ENABLE_REG);
> > +	val |= PCIE_MSI_ENABLE;
> > +	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
> > +
> >  	/* Set PCIe translation windows */
> >  	resource_list_for_each_entry(entry, &host->windows) {
> >  		struct resource *res = entry->res;
> > @@ -286,6 +335,129 @@ static int mtk_pcie_set_affinity(struct irq_data 
> > *data,
> >  	return -EINVAL;
> >  }
> > 
> > +static struct irq_chip mtk_msi_irq_chip = {
> > +	.name = "MSI",
> > +	.irq_ack = irq_chip_ack_parent,
> > +};
> > +
> > +static struct msi_domain_info mtk_msi_domain_info = {
> > +	.flags		= (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_PCI_MSIX |
> > +			   MSI_FLAG_USE_DEF_CHIP_OPS | MSI_FLAG_MULTI_PCI_MSI),
> > +	.chip		= &mtk_msi_irq_chip,
> > +};
> > +
> > +static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg 
> > *msg)
> > +{
> > +	struct mtk_msi_set *msi_set = irq_data_get_irq_chip_data(data);
> > +	unsigned long hwirq;
> > +
> > +	hwirq =	data->hwirq % PCIE_MSI_IRQS_PER_SET;
> > +
> > +	msg->address_hi = upper_32_bits(msi_set->msg_addr);
> > +	msg->address_lo = lower_32_bits(msi_set->msg_addr);
> > +	msg->data = hwirq;
> > +	dev_dbg(msi_set->dev, "msi#%#lx address_hi %#x address_lo %#x data 
> > %d\n",
> > +		hwirq, msg->address_hi, msg->address_lo, msg->data);
> > +}
> > +
> > +static void mtk_msi_bottom_irq_ack(struct irq_data *data)
> > +{
> > +	struct mtk_msi_set *msi_set = irq_data_get_irq_chip_data(data);
> > +	unsigned long hwirq;
> > +
> > +	hwirq =	data->hwirq % PCIE_MSI_IRQS_PER_SET;
> > +
> > +	writel_relaxed(BIT(hwirq), msi_set->base + 
> > PCIE_MSI_SET_STATUS_OFFSET);
> > +}
> > +
> > +static struct irq_chip mtk_msi_bottom_irq_chip = {
> > +	.irq_ack		= mtk_msi_bottom_irq_ack,
> > +	.irq_compose_msi_msg	= mtk_compose_msi_msg,
> > +	.irq_set_affinity	= mtk_pcie_set_affinity,
> > +	.name			= "PCIe",
> 
> nit: "MSI", rather than "PCIe".
> 
> > +};
> > +
> > +static int mtk_msi_bottom_domain_alloc(struct irq_domain *domain,
> > +				       unsigned int virq, unsigned int nr_irqs,
> > +				       void *arg)
> > +{
> > +	struct mtk_pcie_port *port = domain->host_data;
> > +	struct mtk_msi_set *msi_set;
> > +	int i, hwirq, set_idx;
> > +
> > +	mutex_lock(&port->lock);
> > +
> > +	hwirq = bitmap_find_free_region(port->msi_irq_in_use, 
> > PCIE_MSI_IRQS_NUM,
> > +					order_base_2(nr_irqs));
> > +
> > +	mutex_unlock(&port->lock);
> > +
> > +	if (hwirq < 0)
> > +		return -ENOSPC;
> > +
> > +	set_idx = hwirq / PCIE_MSI_IRQS_PER_SET;
> > +	msi_set = &port->msi_sets[set_idx];
> > +
> > +	for (i = 0; i < nr_irqs; i++)
> > +		irq_domain_set_info(domain, virq + i, hwirq + i,
> > +				    &mtk_msi_bottom_irq_chip, msi_set,
> > +				    handle_edge_irq, NULL, NULL);
> > +
> > +	return 0;
> > +}
> > +
> > +static void mtk_msi_bottom_domain_free(struct irq_domain *domain,
> > +				       unsigned int virq, unsigned int nr_irqs)
> > +{
> > +	struct mtk_pcie_port *port = domain->host_data;
> > +	struct irq_data *data = irq_domain_get_irq_data(domain, virq);
> > +
> > +	mutex_lock(&port->lock);
> > +
> > +	bitmap_clear(port->msi_irq_in_use, data->hwirq, nr_irqs);
> > +
> > +	mutex_unlock(&port->lock);
> > +
> > +	irq_domain_free_irqs_common(domain, virq, nr_irqs);
> > +}
> > +
> > +static int mtk_msi_bottom_domain_activate(struct irq_domain *domain,
> > +					  struct irq_data *data, bool reserve)
> > +{
> > +	struct mtk_msi_set *msi_set = irq_data_get_irq_chip_data(data);
> > +	unsigned long hwirq;
> > +	u32 val;
> > +
> > +	hwirq =	data->hwirq % PCIE_MSI_IRQS_PER_SET;
> > +
> > +	val = readl_relaxed(msi_set->base + PCIE_MSI_SET_ENABLE_OFFSET);
> > +	val |= BIT(hwirq);
> > +	writel_relaxed(val, msi_set->base + PCIE_MSI_SET_ENABLE_OFFSET);
> 
> This isn't an activate. This is an unmask, which suffers from the same
> issue as its INTx sibling.
> 
> > +
> > +	return 0;
> > +}
> > +
> > +static void mtk_msi_bottom_domain_deactivate(struct irq_domain 
> > *domain,
> > +					     struct irq_data *data)
> > +{
> > +	struct mtk_msi_set *msi_set = irq_data_get_irq_chip_data(data);
> > +	unsigned long hwirq;
> > +	u32 val;
> > +
> > +	hwirq =	data->hwirq % PCIE_MSI_IRQS_PER_SET;
> > +
> > +	val = readl_relaxed(msi_set->base + PCIE_MSI_SET_ENABLE_OFFSET);
> > +	val &= ~BIT(hwirq);
> > +	writel_relaxed(val, msi_set->base + PCIE_MSI_SET_ENABLE_OFFSET);
> > +}
> 
> Same thing, this is a mask. I don't think this block requires any
> activate/deactivate callbacks for its lower irqdomain.
> 
> As it stands, you can't mask a MSI at the low-level, which is
> pretty bad (you need to mask them at the PCI source, which can
> end-up disabling all vectors in the case of Multi-MSI).

Hi Marc,

Thanks for your review. 

This mtk_msi_bottom_domain is the parent domain of pci_msi_domain, but
the mask/unmask callback of pci_msi_domain does not call the callback of
its parent. Therefore if these functions are put in the mask/unmask
callbacks, they will not have a chance to be called. 
> 
> > +
> > +static const struct irq_domain_ops mtk_msi_bottom_domain_ops = {
> > +	.alloc = mtk_msi_bottom_domain_alloc,
> > +	.free = mtk_msi_bottom_domain_free,
> > +	.activate = mtk_msi_bottom_domain_activate,
> > +	.deactivate = mtk_msi_bottom_domain_deactivate,
> > +};
> > +
> >  static void mtk_intx_mask(struct irq_data *data)
> >  {
> >  	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
> > @@ -350,6 +522,9 @@ static int mtk_pcie_init_irq_domains(struct
> > mtk_pcie_port *port,
> >  {
> >  	struct device *dev = port->dev;
> >  	struct device_node *intc_node;
> > +	struct fwnode_handle *fwnode = of_node_to_fwnode(node);
> > +	struct msi_domain_info *info;
> > +	int i, ret;
> > 
> >  	/* Setup INTx */
> >  	intc_node = of_get_child_by_name(node, "interrupt-controller");
> > @@ -365,7 +540,57 @@ static int mtk_pcie_init_irq_domains(struct
> > mtk_pcie_port *port,
> >  		return -ENODEV;
> >  	}
> > 
> > +	/* Setup MSI */
> > +	mutex_init(&port->lock);
> > +
> > +	port->msi_bottom_domain = irq_domain_add_linear(node, 
> > PCIE_MSI_IRQS_NUM,
> > +				  &mtk_msi_bottom_domain_ops, port);
> > +	if (!port->msi_bottom_domain) {
> > +		dev_info(dev, "failed to create MSI bottom domain\n");
> > +		ret = -ENODEV;
> > +		goto err_msi_bottom_domain;
> > +	}
> > +
> > +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> > +	if (!info) {
> > +		ret = -ENOMEM;
> > +		goto err_msi_bottom_domain;
> > +	}
> > +
> > +	memcpy(info, &mtk_msi_domain_info, sizeof(*info));
> 
> Why the memcpy()? There is nothing in mtk_msi_domain_info that is
> per-domain, and you should be able to use this structure for all
> ports, shouldn't you?

Yes, it used to update the info->chip_data for each port, but since the
msi_set has been used for msi_bottom_domain ,it has no effect anymore, I
will drop it in the next version, thanks. 
> 
> > +	info->chip_data = port;
> > +
> > +	port->msi_domain = pci_msi_create_irq_domain(fwnode, info,
> > +						     port->msi_bottom_domain);
> > +	if (!port->msi_domain) {
> > +		dev_info(dev, "failed to create MSI domain\n");
> > +		ret = -ENODEV;
> > +		goto err_msi_domain;
> > +	}
> > +
> > +	for (i = 0; i < PCIE_MSI_SET_NUM; i++) {
> > +		struct mtk_msi_set *msi_set = &port->msi_sets[i];
> > +
> > +		msi_set->dev = port->dev;
> 
> Given that this is only used in a debug message, and that the addresses
> are already non-ambiguous, you can probably remove this field.

OK, I will remove it in the next version.

> 
> > +		msi_set->base = port->base + PCIE_MSI_SET_BASE_REG +
> > +				i * PCIE_MSI_SET_OFFSET;
> > +		msi_set->msg_addr = port->reg_base + PCIE_MSI_SET_BASE_REG +
> > +				    i * PCIE_MSI_SET_OFFSET;
> > +
> > +		writel_relaxed(lower_32_bits(msi_set->msg_addr), msi_set->base);
> > +		writel_relaxed(upper_32_bits(msi_set->msg_addr),
> > +			       port->base + PCIE_MSI_SET_ADDR_HI_BASE +
> > +			       i * PCIE_MSI_SET_ADDR_HI_OFFSET);
> 
> Please a comment on what this is doing...

This codes are used to configure the capture address of each MSI set,
the lower 32 bits of MSI address should be written to msi_set->base, but
the strange thing is that the address where need to write the higher 32
bits are not near each set, they are start from
PCIE_MSI_SET_ADDR_HI_BASE, and have PCIE_MSI_SET_ADDR_HI_OFFSET apart.

That's why it looks so weired...

> 
> > +	}
> > +
> >  	return 0;
> > +
> > +err_msi_domain:
> > +	irq_domain_remove(port->msi_bottom_domain);
> > +err_msi_bottom_domain:
> > +	irq_domain_remove(port->intx_domain);
> > +
> > +	return ret;
> >  }
> > 
> >  static void mtk_pcie_irq_teardown(struct mtk_pcie_port *port)
> > @@ -375,9 +600,34 @@ static void mtk_pcie_irq_teardown(struct
> > mtk_pcie_port *port)
> >  	if (port->intx_domain)
> >  		irq_domain_remove(port->intx_domain);
> > 
> > +	if (port->msi_domain)
> > +		irq_domain_remove(port->msi_domain);
> > +
> > +	if (port->msi_bottom_domain)
> > +		irq_domain_remove(port->msi_bottom_domain);
> > +
> >  	irq_dispose_mapping(port->irq);
> >  }
> > 
> > +static void mtk_pcie_msi_handler(struct mtk_pcie_port *port, int 
> > set_idx)
> > +{
> > +	struct mtk_msi_set *msi_set = &port->msi_sets[set_idx];
> > +	unsigned long msi_enable, msi_status;
> > +	unsigned int virq;
> > +	irq_hw_number_t bit, hwirq;
> > +
> > +	msi_enable = readl_relaxed(msi_set->base + 
> > PCIE_MSI_SET_ENABLE_OFFSET);
> > +	while ((msi_status =
> > +		readl_relaxed(msi_set->base + PCIE_MSI_SET_STATUS_OFFSET) &
> > +			      msi_enable)) {
> > +		for_each_set_bit(bit, &msi_status, PCIE_MSI_IRQS_PER_SET) {
> > +			hwirq = bit + set_idx * PCIE_MSI_IRQS_PER_SET;
> > +			virq = irq_find_mapping(port->msi_bottom_domain, hwirq);
> > +			generic_handle_irq(virq);
> > +		}
> > +	}
> 
> This doesn't look very readable. How about something like:
> 
>          do {
>                  msi_status = readl_relaxed(...) & msi_enable;
>                  if (!msi_status)
>                          break;
> 
>                  for_each_set_bit(...) {
>                          ...
>                  }
>          } while(true);
> 

I will modify it in the next version, thanks.

> > +}
> > +
> >  static void mtk_pcie_irq_handler(struct irq_desc *desc)
> >  {
> >  	struct mtk_pcie_port *port = irq_desc_get_handler_data(desc);
> > @@ -398,6 +648,17 @@ static void mtk_pcie_irq_handler(struct irq_desc 
> > *desc)
> >  		}
> >  	}
> > 
> > +	if (status & PCIE_MSI_ENABLE) {
> 
> Same comment has for INTx.
> 
> > +		irq_bit = PCIE_MSI_SHIFT;
> > +		for_each_set_bit_from(irq_bit, &status, PCIE_MSI_SET_NUM +
> > +				      PCIE_MSI_SHIFT) {
> > +			mtk_pcie_msi_handler(port, irq_bit - PCIE_MSI_SHIFT);
> > +
> > +			writel_relaxed(BIT(irq_bit),
> > +				       port->base + PCIE_INT_STATUS_REG);
> > +		}
> > +	}
> > +
> >  	chained_irq_exit(irqchip, desc);
> >  }
> 
> Thanks,
> 
>          M.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
