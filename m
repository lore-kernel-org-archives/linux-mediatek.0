Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2541CC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 12:25:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B80C72311F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 12:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B80C72311F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3PtmZbYb4rcOWa0jCXt8y9ybDgWNf3fAQA+1HLnKK+M=; b=bynqKMldqlKg98VzMSaf5i7xm
	k0U9Hd4TJvy59/X3vgF29CGgddLIRYCH7nSggKp07JICGlnGqtVSp7F036sR30+vFNumAbvYipZXG
	MdgaNUtfRUFtoatEL04mZNklUz58KYpoe7oq7vXsfl5wPmlMNDRX+WWDqw7fgTITnxPEhxu5+8Nlv
	xZDNcnFN9JV+Aj+gpr+Z2xkAUst0ZkVam2oTTijvfL4Wz8lP+fXm/QCHAeSWoXmWjwUmanaeVMnIp
	OU043ruCNvwg/huqUIbw40mbGZHFIYK1hrPbco5L7dd9rpFR1mfYsWdYRNOsffXtt7F3p/IQW5vZe
	vK/yf/P6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4NPH-0006ky-P9; Tue, 26 Jan 2021 12:25:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4NPD-0006jd-Ft; Tue, 26 Jan 2021 12:25:12 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A605C23109;
 Tue, 26 Jan 2021 12:25:10 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1l4NPA-00A7Mc-LG; Tue, 26 Jan 2021 12:25:08 +0000
MIME-Version: 1.0
Date: Tue, 26 Jan 2021 12:25:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v7,4/7] PCI: mediatek-gen3: Add INTx support
In-Reply-To: <20210113114001.5804-5-jianjun.wang@mediatek.com>
References: <20210113114001.5804-1-jianjun.wang@mediatek.com>
 <20210113114001.5804-5-jianjun.wang@mediatek.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <123724a33c29d1f078f2a65795c6e208@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jianjun.wang@mediatek.com, bhelgaas@google.com,
 robh+dt@kernel.org, lorenzo.pieralisi@arm.com, ryder.lee@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sj.huang@mediatek.com, youlin.pei@mediatek.com, chuanjia.liu@mediatek.com,
 qizhong.cheng@mediatek.com, sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_072511_685330_79697C16 
X-CRM114-Status: GOOD (  28.95  )
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
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>, sin_jieyang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-01-13 11:39, Jianjun Wang wrote:
> Add INTx support for MediaTek Gen3 PCIe controller.
> 
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 163 ++++++++++++++++++++
>  1 file changed, 163 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> b/drivers/pci/controller/pcie-mediatek-gen3.c
> index c00ea7c167de..7979a2856c35 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -9,6 +9,9 @@
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/iopoll.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> @@ -49,6 +52,12 @@
>  #define PCIE_LINK_STATUS_REG		0x154
>  #define PCIE_PORT_LINKUP		BIT(8)
> 
> +#define PCIE_INT_ENABLE_REG		0x180
> +#define PCIE_INTX_SHIFT			24
> +#define PCIE_INTX_MASK			GENMASK(27, 24)

I guess this '24' is actually PCIE_INTX_SHIFT? In this case,
please write it as

GENMASK(PCIE_INTX_SHIFT + PCI_NUM_INTX - 1, PCIE_INTX_SHIFT)

to make it clear that you are dealing with one bit per INTx.

> +
> +#define PCIE_INT_STATUS_REG		0x184
> +
>  #define PCIE_TRANS_TABLE_BASE_REG	0x800
>  #define PCIE_ATR_SRC_ADDR_MSB_OFFSET	0x4
>  #define PCIE_ATR_TRSL_ADDR_LSB_OFFSET	0x8
> @@ -77,6 +86,8 @@
>   * @phy: PHY controller block
>   * @clks: PCIe clocks
>   * @num_clks: PCIe clocks count for this port
> + * @irq: PCIe controller interrupt number
> + * @intx_domain: legacy INTx IRQ domain
>   */
>  struct mtk_pcie_port {
>  	struct device *dev;
> @@ -87,6 +98,9 @@ struct mtk_pcie_port {
>  	struct phy *phy;
>  	struct clk_bulk_data *clks;
>  	int num_clks;
> +
> +	int irq;
> +	struct irq_domain *intx_domain;
>  };
> 
>  /**
> @@ -266,6 +280,149 @@ static int mtk_pcie_startup_port(struct
> mtk_pcie_port *port)
>  	return 0;
>  }
> 
> +static int mtk_pcie_set_affinity(struct irq_data *data,
> +				 const struct cpumask *mask, bool force)
> +{
> +	return -EINVAL;
> +}
> +
> +static void mtk_intx_mask(struct irq_data *data)
> +{
> +	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
> +	u32 val;
> +
> +	val = readl_relaxed(port->base + PCIE_INT_ENABLE_REG);
> +	val &= ~BIT(data->hwirq + PCIE_INTX_SHIFT);
> +	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);

This is missing some locking. Otherwise, two concurrent mask/unmask
for different interrupts will corrupt each other's state.

> +}
> +
> +static void mtk_intx_unmask(struct irq_data *data)
> +{
> +	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
> +	u32 val;
> +
> +	val = readl_relaxed(port->base + PCIE_INT_ENABLE_REG);
> +	val |= BIT(data->hwirq + PCIE_INTX_SHIFT);
> +	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);

Same thing here.

> +}
> +
> +/**
> + * mtk_intx_eoi
> + * @data: pointer to chip specific data
> + *
> + * As an emulated level IRQ, its interrupt status will remain
> + * until the corresponding de-assert message is received; hence that
> + * the status can only be cleared when the interrupt has been 
> serviced.
> + */
> +static void mtk_intx_eoi(struct irq_data *data)
> +{
> +	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
> +	unsigned long hwirq;
> +
> +	hwirq = data->hwirq + PCIE_INTX_SHIFT;
> +	writel_relaxed(BIT(hwirq), port->base + PCIE_INT_STATUS_REG);
> +}
> +
> +static struct irq_chip mtk_intx_irq_chip = {
> +	.irq_mask		= mtk_intx_mask,
> +	.irq_unmask		= mtk_intx_unmask,
> +	.irq_eoi		= mtk_intx_eoi,
> +	.irq_set_affinity	= mtk_pcie_set_affinity,
> +	.name			= "PCIe",

nit: "PCIe" is not really descriptive. "INTx" would be a bit better.

> +};
> +
> +static int mtk_pcie_intx_map(struct irq_domain *domain, unsigned int 
> irq,
> +			     irq_hw_number_t hwirq)
> +{
> +	irq_set_chip_and_handler_name(irq, &mtk_intx_irq_chip,
> +				      handle_fasteoi_irq, "INTx");
> +	irq_set_chip_data(irq, domain->host_data);

You probably want to set the chip_data *before* wiring
the handler, as otherwise you could end-up with a NULL
pointer in any of the callbacks if the interrupt fires
between the two.

> +
> +	return 0;
> +}
> +
> +static const struct irq_domain_ops intx_domain_ops = {
> +	.map = mtk_pcie_intx_map,
> +};
> +
> +static int mtk_pcie_init_irq_domains(struct mtk_pcie_port *port,
> +				     struct device_node *node)
> +{
> +	struct device *dev = port->dev;
> +	struct device_node *intc_node;
> +
> +	/* Setup INTx */
> +	intc_node = of_get_child_by_name(node, "interrupt-controller");
> +	if (!intc_node) {
> +		dev_err(dev, "missing PCIe Intc node\n");
> +		return -ENODEV;
> +	}
> +
> +	port->intx_domain = irq_domain_add_linear(intc_node, PCI_NUM_INTX,
> +						  &intx_domain_ops, port);
> +	if (!port->intx_domain) {
> +		dev_err(dev, "failed to get INTx IRQ domain\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static void mtk_pcie_irq_teardown(struct mtk_pcie_port *port)
> +{
> +	irq_set_chained_handler_and_data(port->irq, NULL, NULL);
> +
> +	if (port->intx_domain)
> +		irq_domain_remove(port->intx_domain);
> +
> +	irq_dispose_mapping(port->irq);
> +}
> +
> +static void mtk_pcie_irq_handler(struct irq_desc *desc)
> +{
> +	struct mtk_pcie_port *port = irq_desc_get_handler_data(desc);
> +	struct irq_chip *irqchip = irq_desc_get_chip(desc);
> +	unsigned long status;
> +	unsigned int virq;
> +	irq_hw_number_t irq_bit = PCIE_INTX_SHIFT;
> +
> +	chained_irq_enter(irqchip, desc);
> +
> +	status = readl_relaxed(port->base + PCIE_INT_STATUS_REG);
> +	if (status & PCIE_INTX_MASK) {

This "if (status & PCIE_INTX_MASK)" is already implicit from
the for_each_set_bit_from() iterator, and you can drop it.

> +		for_each_set_bit_from(irq_bit, &status, PCI_NUM_INTX +
> +				      PCIE_INTX_SHIFT) {
> +			virq = irq_find_mapping(port->intx_domain,
> +						irq_bit - PCIE_INTX_SHIFT);
> +			generic_handle_irq(virq);
> +		}
> +	}
> +
> +	chained_irq_exit(irqchip, desc);
> +}
> +
> +static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
> +			      struct device_node *node)
> +{
> +	struct device *dev = port->dev;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	int err;
> +
> +	err = mtk_pcie_init_irq_domains(port, node);
> +	if (err) {
> +		dev_err(dev, "failed to init PCIe IRQ domain\n");
> +		return err;
> +	}
> +
> +	port->irq = platform_get_irq(pdev, 0);
> +	if (port->irq < 0)
> +		return port->irq;
> +
> +	irq_set_chained_handler_and_data(port->irq, mtk_pcie_irq_handler, 
> port);

You seem to be missing something that will mask all INTx interrupts
as an initial state.

> +
> +	return 0;
> +}
> +
>  static int mtk_pcie_clk_init(struct mtk_pcie_port *port)
>  {
>  	int ret;
> @@ -388,6 +545,10 @@ static int mtk_pcie_setup(struct mtk_pcie_port 
> *port)
>  		goto err_setup;
>  	}
> 
> +	err = mtk_pcie_setup_irq(port, dev->of_node);
> +	if (err)
> +		goto err_setup;
> +
>  	dev_info(dev, "PCIe link up success!\n");
> 
>  	return 0;
> @@ -423,6 +584,7 @@ static int mtk_pcie_probe(struct platform_device 
> *pdev)
> 
>  	err = pci_host_probe(host);
>  	if (err) {
> +		mtk_pcie_irq_teardown(port);
>  		mtk_pcie_power_down(port);
>  		return err;
>  	}
> @@ -440,6 +602,7 @@ static int mtk_pcie_remove(struct platform_device 
> *pdev)
>  	pci_remove_root_bus(host->bus);
>  	pci_unlock_rescan_remove();
> 
> +	mtk_pcie_irq_teardown(port);
>  	mtk_pcie_power_down(port);
> 
>  	return 0;

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
