Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFA3C433E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:51:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F970233ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F970233ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3M1DbDb+mxT+p5B8VjSePEkpI0zivBcYYgSFKtKlCJE=; b=y5qPKoVI9viF99nr/4VR3RjKD
	UPaxinSysk6DU6mOHPiMlIg1a6D3DEfFcyq6K6vBr1mxD0MEuMuGz7ZDbtmYn0kG3HTiXzzh1XSJn
	eF/ugs/2jWMHD5EoDI4y0iIWXvdDIDl9mAebWoh08RwJYAa7NZWT+/k5g2Wv9tlr1Aotwe/GzvG0s
	6MfhT3fhjSU6zx78rOs7Ul9GJG/TPMIGE9pIah3qD0xPupEIpMCLyRzEuFH0KFGPHeEhm9xf5n2eZ
	ZtBjH1ePj71yi74HFbqALly3ALukNKqkuLFjSbMQPZjZsJS3hDO3axZmwdRHK+hB0cda2UhHlaNIB
	qeSiFk9pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzegT-0005TR-MU; Wed, 13 Jan 2021 11:51:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzeg5-0005GL-Dm; Wed, 13 Jan 2021 11:51:07 +0000
X-UUID: 37191775b54845088a9f7a4707fc1556-20210113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Tbii394xvE8UD1rPrLWNMHZdRyISmIXZS75N/3FfrEo=; 
 b=Ite83aepL1VgBqIkkzQxGQuFreH4VSuCTw3g6KJN+Dj/KLpr6urn1dO9+LtGhlSGrMCR89EORcNbf2HgtAwfASqh6kKMqz0pHhtA1cMFoYCk9qRDyMEIpcYmDHWP7edtRGUeFdVdZXK/2HjIrNgdZvWFrBtu4dYqTAbNq7iC2Qo=;
X-UUID: 37191775b54845088a9f7a4707fc1556-20210113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1220866115; Wed, 13 Jan 2021 03:51:01 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 03:40:59 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 19:40:58 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Jan 2021 19:40:56 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Ryder Lee
 <ryder.lee@mediatek.com>
Subject: [v7,4/7] PCI: mediatek-gen3: Add INTx support
Date: Wed, 13 Jan 2021 19:39:58 +0800
Message-ID: <20210113114001.5804-5-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210113114001.5804-1-jianjun.wang@mediatek.com>
References: <20210113114001.5804-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_065105_711789_CFAC1766 
X-CRM114-Status: GOOD (  21.93  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, qizhong.cheng@mediatek.com,
 chuanjia.liu@mediatek.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, anson.chuang@mediatek.com,
 Jianjun Wang <jianjun.wang@mediatek.com>, sin_jieyang@mediatek.com, Sj
 Huang <sj.huang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add INTx support for MediaTek Gen3 PCIe controller.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 163 ++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index c00ea7c167de..7979a2856c35 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -9,6 +9,9 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -49,6 +52,12 @@
 #define PCIE_LINK_STATUS_REG		0x154
 #define PCIE_PORT_LINKUP		BIT(8)
 
+#define PCIE_INT_ENABLE_REG		0x180
+#define PCIE_INTX_SHIFT			24
+#define PCIE_INTX_MASK			GENMASK(27, 24)
+
+#define PCIE_INT_STATUS_REG		0x184
+
 #define PCIE_TRANS_TABLE_BASE_REG	0x800
 #define PCIE_ATR_SRC_ADDR_MSB_OFFSET	0x4
 #define PCIE_ATR_TRSL_ADDR_LSB_OFFSET	0x8
@@ -77,6 +86,8 @@
  * @phy: PHY controller block
  * @clks: PCIe clocks
  * @num_clks: PCIe clocks count for this port
+ * @irq: PCIe controller interrupt number
+ * @intx_domain: legacy INTx IRQ domain
  */
 struct mtk_pcie_port {
 	struct device *dev;
@@ -87,6 +98,9 @@ struct mtk_pcie_port {
 	struct phy *phy;
 	struct clk_bulk_data *clks;
 	int num_clks;
+
+	int irq;
+	struct irq_domain *intx_domain;
 };
 
 /**
@@ -266,6 +280,149 @@ static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
 	return 0;
 }
 
+static int mtk_pcie_set_affinity(struct irq_data *data,
+				 const struct cpumask *mask, bool force)
+{
+	return -EINVAL;
+}
+
+static void mtk_intx_mask(struct irq_data *data)
+{
+	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
+	u32 val;
+
+	val = readl_relaxed(port->base + PCIE_INT_ENABLE_REG);
+	val &= ~BIT(data->hwirq + PCIE_INTX_SHIFT);
+	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
+}
+
+static void mtk_intx_unmask(struct irq_data *data)
+{
+	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
+	u32 val;
+
+	val = readl_relaxed(port->base + PCIE_INT_ENABLE_REG);
+	val |= BIT(data->hwirq + PCIE_INTX_SHIFT);
+	writel_relaxed(val, port->base + PCIE_INT_ENABLE_REG);
+}
+
+/**
+ * mtk_intx_eoi
+ * @data: pointer to chip specific data
+ *
+ * As an emulated level IRQ, its interrupt status will remain
+ * until the corresponding de-assert message is received; hence that
+ * the status can only be cleared when the interrupt has been serviced.
+ */
+static void mtk_intx_eoi(struct irq_data *data)
+{
+	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
+	unsigned long hwirq;
+
+	hwirq = data->hwirq + PCIE_INTX_SHIFT;
+	writel_relaxed(BIT(hwirq), port->base + PCIE_INT_STATUS_REG);
+}
+
+static struct irq_chip mtk_intx_irq_chip = {
+	.irq_mask		= mtk_intx_mask,
+	.irq_unmask		= mtk_intx_unmask,
+	.irq_eoi		= mtk_intx_eoi,
+	.irq_set_affinity	= mtk_pcie_set_affinity,
+	.name			= "PCIe",
+};
+
+static int mtk_pcie_intx_map(struct irq_domain *domain, unsigned int irq,
+			     irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler_name(irq, &mtk_intx_irq_chip,
+				      handle_fasteoi_irq, "INTx");
+	irq_set_chip_data(irq, domain->host_data);
+
+	return 0;
+}
+
+static const struct irq_domain_ops intx_domain_ops = {
+	.map = mtk_pcie_intx_map,
+};
+
+static int mtk_pcie_init_irq_domains(struct mtk_pcie_port *port,
+				     struct device_node *node)
+{
+	struct device *dev = port->dev;
+	struct device_node *intc_node;
+
+	/* Setup INTx */
+	intc_node = of_get_child_by_name(node, "interrupt-controller");
+	if (!intc_node) {
+		dev_err(dev, "missing PCIe Intc node\n");
+		return -ENODEV;
+	}
+
+	port->intx_domain = irq_domain_add_linear(intc_node, PCI_NUM_INTX,
+						  &intx_domain_ops, port);
+	if (!port->intx_domain) {
+		dev_err(dev, "failed to get INTx IRQ domain\n");
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static void mtk_pcie_irq_teardown(struct mtk_pcie_port *port)
+{
+	irq_set_chained_handler_and_data(port->irq, NULL, NULL);
+
+	if (port->intx_domain)
+		irq_domain_remove(port->intx_domain);
+
+	irq_dispose_mapping(port->irq);
+}
+
+static void mtk_pcie_irq_handler(struct irq_desc *desc)
+{
+	struct mtk_pcie_port *port = irq_desc_get_handler_data(desc);
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	unsigned long status;
+	unsigned int virq;
+	irq_hw_number_t irq_bit = PCIE_INTX_SHIFT;
+
+	chained_irq_enter(irqchip, desc);
+
+	status = readl_relaxed(port->base + PCIE_INT_STATUS_REG);
+	if (status & PCIE_INTX_MASK) {
+		for_each_set_bit_from(irq_bit, &status, PCI_NUM_INTX +
+				      PCIE_INTX_SHIFT) {
+			virq = irq_find_mapping(port->intx_domain,
+						irq_bit - PCIE_INTX_SHIFT);
+			generic_handle_irq(virq);
+		}
+	}
+
+	chained_irq_exit(irqchip, desc);
+}
+
+static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
+			      struct device_node *node)
+{
+	struct device *dev = port->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	int err;
+
+	err = mtk_pcie_init_irq_domains(port, node);
+	if (err) {
+		dev_err(dev, "failed to init PCIe IRQ domain\n");
+		return err;
+	}
+
+	port->irq = platform_get_irq(pdev, 0);
+	if (port->irq < 0)
+		return port->irq;
+
+	irq_set_chained_handler_and_data(port->irq, mtk_pcie_irq_handler, port);
+
+	return 0;
+}
+
 static int mtk_pcie_clk_init(struct mtk_pcie_port *port)
 {
 	int ret;
@@ -388,6 +545,10 @@ static int mtk_pcie_setup(struct mtk_pcie_port *port)
 		goto err_setup;
 	}
 
+	err = mtk_pcie_setup_irq(port, dev->of_node);
+	if (err)
+		goto err_setup;
+
 	dev_info(dev, "PCIe link up success!\n");
 
 	return 0;
@@ -423,6 +584,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 
 	err = pci_host_probe(host);
 	if (err) {
+		mtk_pcie_irq_teardown(port);
 		mtk_pcie_power_down(port);
 		return err;
 	}
@@ -440,6 +602,7 @@ static int mtk_pcie_remove(struct platform_device *pdev)
 	pci_remove_root_bus(host->bus);
 	pci_unlock_rescan_remove();
 
+	mtk_pcie_irq_teardown(port);
 	mtk_pcie_power_down(port);
 
 	return 0;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
