Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0185CD5BAA
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 18:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUupb00qUDRStdXnj1nJ2QrJYhHtRgXvfohXbm+8Fh4=; b=lkJA64X6ijVvizmh0U9ykW/FQ6
	Ex8gD4oGsPa0uPSvPOqDUPeqqjERVc9kTk+VEXZrgl2CkFiwEWCTJAs1+3i66wuDXyZPtHUtXiujh
	JOt+8vGVXLOoh+/XGACa9VpLKN0O7XjYbcf/d753vP+6yBrbpjKYPjwhQU55NAoc0p/Vbuwf/UhA1
	BJml4BTb6TVECAi1ge5ILhFHdbvcVgBYSA4vQZySX2OT2Y8k6L7wMPqYxDEGTyA+yxH5THvnjGF6y
	GWasLV+WGVLJ2SjgJsuQbtabliPAIgoQr6nFFUYGNZCqfmARY43hevY0l6W/vUZUspS7tiISLxQuC
	n6SJY37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPlpU-00000005Ucj-2ORR;
	Wed, 20 May 2026 18:39:40 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPloo-00000005T6O-0INW
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 18:39:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 30568440E80;
	Wed, 20 May 2026 20:38:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779302334; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JUupb00qUDRStdXnj1nJ2QrJYhHtRgXvfohXbm+8Fh4=;
	b=jgl9S/zb02YvbpSWBGrl+UzPOWGyOoBohk4peKGufmcxTHyggdEy1yRZCk4BKbazxnb7Gr
	7uOLRMgwlRGwOwyWbsydjwiFA3YI/mu66hxDPCws5iVU+iCQDhRRxR5szr4rzR/DnJ5Nki
	1A4EuxAtn1ysJ8Y8gsIPEyLzzdH2nNRlBnajY966DKXHzBEm6RkiD4MBBSmlEMiIaKMOJz
	02rTiSD6E99wZ3q5P5D+NYUfgC+nC8oe05bVfMtKjjJT/Qx0B2pXIUa2KoP9hM7bcas5+d
	EVKHTtxU0AQ8oOItLNvUOOMcV791Me3UDlj55X4tO5QSbcb9y2HJQWuvewzJRQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	ryder.lee@mediatek.com,
	helgaas@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v8 1/3] PCI: mediatek: Use actual physical address instead of virt_to_phys()
Date: Wed, 20 May 2026 18:38:25 +0000
Message-Id: <20260520183827.908243-2-cjd@cjdns.fr>
In-Reply-To: <20260520183827.908243-1-cjd@cjdns.fr>
References: <20260520183827.908243-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_113900_585505_147D5BFA 
X-CRM114-Status: GOOD (  13.33  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The driver previously used virt_to_phys() on the ioremapped register base
(port->base) to compute the MSI message address. Using virt_to_phys() on an
IO mapped address is incorrect because it expects a kernel virtual address.

To fix it, store the physical start of the I/O register region in
mtk_pcie_port->phys_base and use it to build the MSI address. This replaces
the incorrect virt_to_phys() usage and ensures MSI addresses are generated
correctly.

Fixes: 43e6409db64d ("PCI: mediatek: Add MSI support for MT2712 and MT7622")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/pci/controller/pcie-mediatek.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 75722524fe74..c503fbd774d0 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -175,6 +175,7 @@ struct mtk_pcie_soc {
 /**
  * struct mtk_pcie_port - PCIe port information
  * @base: IO mapped register base
+ * @phys_base: Physical address of the I/O register base region
  * @list: port list
  * @pcie: pointer to PCIe host info
  * @reset: pointer to port reset control
@@ -196,6 +197,7 @@ struct mtk_pcie_soc {
  */
 struct mtk_pcie_port {
 	void __iomem *base;
+	phys_addr_t phys_base;
 	struct list_head list;
 	struct mtk_pcie *pcie;
 	struct reset_control *reset;
@@ -405,7 +407,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	phys_addr_t addr;
 
 	/* MT2712/MT7622 only support 32-bit MSI addresses */
-	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
+	addr = port->phys_base + PCIE_MSI_VECTOR;
 	msg->address_hi = 0;
 	msg->address_lo = lower_32_bits(addr);
 
@@ -520,7 +522,7 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
 	u32 val;
 	phys_addr_t msg_addr;
 
-	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
+	msg_addr = port->phys_base + PCIE_MSI_VECTOR;
 	val = lower_32_bits(msg_addr);
 	writel(val, port->base + PCIE_IMSI_ADDR);
 
@@ -953,6 +955,7 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
 	struct mtk_pcie_port *port;
 	struct device *dev = pcie->dev;
 	struct platform_device *pdev = to_platform_device(dev);
+	struct resource *res;
 	char name[20];
 	int err;
 
@@ -961,7 +964,14 @@ static int mtk_pcie_parse_port(struct mtk_pcie *pcie,
 		return -ENOMEM;
 
 	snprintf(name, sizeof(name), "port%d", slot);
-	port->base = devm_platform_ioremap_resource_byname(pdev, name);
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
+	if (!res) {
+		dev_err(dev, "failed to get port%d base\n", slot);
+		return -EINVAL;
+	}
+
+	port->phys_base = res->start;
+	port->base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(port->base)) {
 		dev_err(dev, "failed to map port%d base\n", slot);
 		return PTR_ERR(port->base);
-- 
2.39.5


