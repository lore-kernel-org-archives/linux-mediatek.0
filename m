Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C10C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omy/CemmEUqSfeI9bxjlTEDAt4GSH2fXIlmTOehEny0=; b=jPbQdRjF4hXMoF9G6TH7HEkJ41
	uB0aClFzMkjDmEykbsUlPqYGmUNadZy/vowHhWgAEGyMK2Lu6n4T/O40c5/FhM6Ci9hr+Bk/tlsCy
	SL1EgcRx4Wxy9PkC1vPuxh9+Xq6j1EAbQ5yCb4uC68LAruobn8Z0HSMJ6JjBnHO2+NA6KR/7zAudD
	h/3KPkUGJKlsBX9jQFTk50TZpV/uH0v0ysS5dCHemz/bjddpEToo+aA5SzuE2csn1K86LS1V/OHoa
	czcmTJ6LKypJFMgbJr5F31rEmsH6EajMtXT3jK5zAzkF9kZg+/bb0NcnJzUlMUFwxxVzP8MJHhhzb
	j03ed51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCc2Z-004O5M-2X;
	Mon, 11 Dec 2023 08:53:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCc2W-004O39-0M;
	Mon, 11 Dec 2023 08:53:26 +0000
X-UUID: b6634f70980211ee958cff29c719f35b-20231211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=omy/CemmEUqSfeI9bxjlTEDAt4GSH2fXIlmTOehEny0=;
	b=r/uI4m4y31cm/DQL/G7EaZcYapkapFR1NvY6fdVdL1hg1QxT7ISKVjH3Mwerye2NlobmkWYNxz0t5ZiWfGDMPDQjWl59FfiDXvhwAi9QdvT9Fz9iMUX88DWvmNsLQOZAGDLWcRmD8PllP4fcdpgZST1p69kWMmnuM9eoEqu2AIU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:5dce4d7f-3f86-4cc0-9c9c-62bea1afe68e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5d391d7,CLOUDID:50700e61-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b6634f70980211ee958cff29c719f35b-20231211
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 687043939; Mon, 11 Dec 2023 01:53:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 11 Dec 2023 16:53:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 11 Dec 2023 16:53:07 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Rob Herring
	<robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Marc Zyngier <maz@kernel.org>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, <linux-pci@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <jieyy.yang@mediatek.com>,
	<chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
	<jian.yang@mediatek.com>, <jianguo.zhang@mediatek.com>
Subject: [PATCH v2 2/3] PCI: mediatek-gen3: Do not break probe flow when MSI init fails
Date: Mon, 11 Dec 2023 16:52:55 +0800
Message-ID: <20231211085256.31292-3-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231211085256.31292-1-jianjun.wang@mediatek.com>
References: <20231211085256.31292-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_005324_183602_0A4EF6DD 
X-CRM114-Status: GOOD (  15.42  )
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

Since INTx can still work, the driver probe flow should not be broken by
MSI initialization failures. Additionally, moving the MSI initialization
code into a single function enhances readability.

Fixes: 1bdafba538be ("PCI: mediatek-gen3: Add MSI support")
Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 68 ++++++++++-----------
 1 file changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index c1ae3d19ec9a..c6a6876d233a 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -649,59 +649,51 @@ static const struct irq_domain_ops intx_domain_ops = {
 	.map = mtk_pcie_intx_map,
 };
 
-static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie *pcie)
+static int mtk_pcie_init_msi(struct mtk_gen3_pcie *pcie)
 {
 	struct device *dev = pcie->dev;
-	struct device_node *intc_node, *node = dev->of_node;
-	int ret;
-
-	raw_spin_lock_init(&pcie->irq_lock);
-
-	/* Setup INTx */
-	intc_node = of_get_child_by_name(node, "interrupt-controller");
-	if (!intc_node) {
-		dev_err(dev, "missing interrupt-controller node\n");
-		return -ENODEV;
-	}
-
-	pcie->intx_domain = irq_domain_add_linear(intc_node, PCI_NUM_INTX,
-						  &intx_domain_ops, pcie);
-	if (!pcie->intx_domain) {
-		dev_err(dev, "failed to create INTx IRQ domain\n");
-		ret = -ENODEV;
-		goto out_put_node;
-	}
+	struct device_node *node = dev->of_node;
 
-	/* Setup MSI */
 	mutex_init(&pcie->lock);
 
 	pcie->msi_bottom_domain = irq_domain_add_linear(node, PCIE_MSI_IRQS_NUM,
 				  &mtk_msi_bottom_domain_ops, pcie);
 	if (!pcie->msi_bottom_domain) {
 		dev_err(dev, "failed to create MSI bottom domain\n");
-		ret = -ENODEV;
-		goto err_msi_bottom_domain;
+		return -ENODEV;
 	}
 
-	pcie->msi_domain = pci_msi_create_irq_domain(dev->fwnode,
-						     &mtk_msi_domain_info,
+	pcie->msi_domain = pci_msi_create_irq_domain(dev->fwnode, &mtk_msi_domain_info,
 						     pcie->msi_bottom_domain);
 	if (!pcie->msi_domain) {
 		dev_err(dev, "failed to create MSI domain\n");
-		ret = -ENODEV;
-		goto err_msi_domain;
+		irq_domain_remove(pcie->msi_bottom_domain);
+		return -ENODEV;
 	}
 
-	of_node_put(intc_node);
 	return 0;
+}
 
-err_msi_domain:
-	irq_domain_remove(pcie->msi_bottom_domain);
-err_msi_bottom_domain:
-	irq_domain_remove(pcie->intx_domain);
-out_put_node:
+static int mtk_pcie_init_intx(struct mtk_gen3_pcie *pcie)
+{
+	struct device *dev = pcie->dev;
+	struct device_node *intc_node, *node = dev->of_node;
+
+	intc_node = of_get_child_by_name(node, "interrupt-controller");
+	if (!intc_node) {
+		dev_err(dev, "missing interrupt-controller node\n");
+		return -ENODEV;
+	}
+
+	pcie->intx_domain = irq_domain_add_linear(intc_node, PCI_NUM_INTX,
+						  &intx_domain_ops, pcie);
 	of_node_put(intc_node);
-	return ret;
+	if (!pcie->intx_domain) {
+		dev_err(dev, "failed to create INTx IRQ domain\n");
+		return -ENODEV;
+	}
+
+	return 0;
 }
 
 static void mtk_pcie_irq_teardown(struct mtk_gen3_pcie *pcie)
@@ -774,10 +766,16 @@ static int mtk_pcie_setup_irq(struct mtk_gen3_pcie *pcie)
 	struct platform_device *pdev = to_platform_device(dev);
 	int err;
 
-	err = mtk_pcie_init_irq_domains(pcie);
+	raw_spin_lock_init(&pcie->irq_lock);
+
+	err = mtk_pcie_init_intx(pcie);
 	if (err)
 		return err;
 
+	err = mtk_pcie_init_msi(pcie);
+	if (err)
+		dev_warn(dev, "no MSI supported, only INTx available\n");
+
 	pcie->irq = platform_get_irq(pdev, 0);
 	if (pcie->irq < 0)
 		return pcie->irq;
-- 
2.18.0


