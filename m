Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1419AC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 01:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGp76l0JTssfF5UsumECyLLQbuaQD+9TlfTkIEpD06Q=; b=qsWoLpVqns0fqb
	1OL1Zox8XoZYnViu/Xluw50wL+h4Dn8O24VBOklPz/e+T5jeaB7ALbRnFUgQYH6o8SdxiNfNxgbpM
	dKaCHtFQKgsbCWFcbiafKgpQMvEWIz3N4c7kwFTgRZvI4DGGfX0666AX/qBefW22E+ZXWUhw3r4Ln
	YrKSiibl3yD+1ZryR1v4rfnzur1jyEFtZ+Ox6UCgBu1STQ1hny8W9W6TbpMYYtpc32LQeqLIR0sHL
	qkhtYynhyko1NC9z446kldW+V30Yjmh1YDjxnaMnT7OX7RIJYzARBTy/QWj2RunLVpIjFZatMrDaM
	9W9xy4OPldIBS35A0SqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0CgE-00BeSD-0R; Thu, 23 Dec 2021 01:14:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0Cdx-00BdFt-SZ; Thu, 23 Dec 2021 01:11:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6002A61C1E;
 Thu, 23 Dec 2021 01:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB67C36AE8;
 Thu, 23 Dec 2021 01:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640221900;
 bh=JEMd6rbvAJo5/E0VVbBCtxpY1OwkDouz6ExYkZiuVQU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hW0hvav0Nme8bJkjVlYbJCp4QsLxXxZtPVZphM7W3oFDqz+0Dwc7l6amya0PB4RNc
 9hdMc9o3yDOCsEzZtWGM04BvH+GbSb1qS/dxZNFDYS/3SAIyfSPsY4jTq/9+KDq9ys
 lMG3FQwHF8i8YXznN9YQT7zJSjctduMwkNpRpbytk2IkJFk5qkcI38p2xxfMEyT7er
 owdv/I6d6/oReZn5tuXFKN4xP4GUzQ20V3QRO6CmhP9TIINcey+ZwuZJQPkt3Gm3cV
 g8R8kAHaMKKOz0R0/1H7iMiwdMSImmzIcU1ymEdE0QxsCiRIC7FqTjuF8tqPI736XI
 dHGJ2KzX33Byg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org,
	Fan Fei <ffclaire1224@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 17/23] PCI: mt7621: Rename mt7621_pci_ to mt7621_pcie_
Date: Wed, 22 Dec 2021 19:10:48 -0600
Message-Id: <20211223011054.1227810-18-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211223011054.1227810-1-helgaas@kernel.org>
References: <20211223011054.1227810-1-helgaas@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_171142_066452_2E0C3310 
X-CRM114-Status: GOOD (  17.20  )
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

From: Bjorn Helgaas <bhelgaas@google.com>

Rename mt7621_pci_* structs and functions to mt7621_pcie_* for consistency
with the rest of the file.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/pci/controller/pcie-mt7621.c | 36 ++++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
index 4138c0e83513..b8fea7afdb1b 100644
--- a/drivers/pci/controller/pcie-mt7621.c
+++ b/drivers/pci/controller/pcie-mt7621.c
@@ -93,8 +93,8 @@ struct mt7621_pcie_port {
  * reset lines are inverted.
  */
 struct mt7621_pcie {
-	void __iomem *base;
 	struct device *dev;
+	void __iomem *base;
 	struct list_head ports;
 	bool resets_inverted;
 };
@@ -129,7 +129,7 @@ static inline void pcie_port_write(struct mt7621_pcie_port *port,
 	writel_relaxed(val, port->base + reg);
 }
 
-static inline u32 mt7621_pci_get_cfgaddr(unsigned int bus, unsigned int slot,
+static inline u32 mt7621_pcie_get_cfgaddr(unsigned int bus, unsigned int slot,
 					 unsigned int func, unsigned int where)
 {
 	return (((where & 0xf00) >> 8) << 24) | (bus << 16) | (slot << 11) |
@@ -140,7 +140,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
 					 unsigned int devfn, int where)
 {
 	struct mt7621_pcie *pcie = bus->sysdata;
-	u32 address = mt7621_pci_get_cfgaddr(bus->number, PCI_SLOT(devfn),
+	u32 address = mt7621_pcie_get_cfgaddr(bus->number, PCI_SLOT(devfn),
 					     PCI_FUNC(devfn), where);
 
 	writel_relaxed(address, pcie->base + RALINK_PCI_CONFIG_ADDR);
@@ -148,7 +148,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
 	return pcie->base + RALINK_PCI_CONFIG_DATA + (where & 3);
 }
 
-static struct pci_ops mt7621_pci_ops = {
+static struct pci_ops mt7621_pcie_ops = {
 	.map_bus	= mt7621_pcie_map_bus,
 	.read		= pci_generic_config_read,
 	.write		= pci_generic_config_write,
@@ -156,7 +156,7 @@ static struct pci_ops mt7621_pci_ops = {
 
 static u32 read_config(struct mt7621_pcie *pcie, unsigned int dev, u32 reg)
 {
-	u32 address = mt7621_pci_get_cfgaddr(0, dev, 0, reg);
+	u32 address = mt7621_pcie_get_cfgaddr(0, dev, 0, reg);
 
 	pcie_write(pcie, address, RALINK_PCI_CONFIG_ADDR);
 	return pcie_read(pcie, RALINK_PCI_CONFIG_DATA);
@@ -165,7 +165,7 @@ static u32 read_config(struct mt7621_pcie *pcie, unsigned int dev, u32 reg)
 static void write_config(struct mt7621_pcie *pcie, unsigned int dev,
 			 u32 reg, u32 val)
 {
-	u32 address = mt7621_pci_get_cfgaddr(0, dev, 0, reg);
+	u32 address = mt7621_pcie_get_cfgaddr(0, dev, 0, reg);
 
 	pcie_write(pcie, address, RALINK_PCI_CONFIG_ADDR);
 	pcie_write(pcie, val, RALINK_PCI_CONFIG_DATA);
@@ -505,16 +505,16 @@ static int mt7621_pcie_register_host(struct pci_host_bridge *host)
 {
 	struct mt7621_pcie *pcie = pci_host_bridge_priv(host);
 
-	host->ops = &mt7621_pci_ops;
+	host->ops = &mt7621_pcie_ops;
 	host->sysdata = pcie;
 	return pci_host_probe(host);
 }
 
-static const struct soc_device_attribute mt7621_pci_quirks_match[] = {
+static const struct soc_device_attribute mt7621_pcie_quirks_match[] = {
 	{ .soc_id = "mt7621", .revision = "E2" }
 };
 
-static int mt7621_pci_probe(struct platform_device *pdev)
+static int mt7621_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct soc_device_attribute *attr;
@@ -535,7 +535,7 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pcie);
 	INIT_LIST_HEAD(&pcie->ports);
 
-	attr = soc_device_match(mt7621_pci_quirks_match);
+	attr = soc_device_match(mt7621_pcie_quirks_match);
 	if (attr)
 		pcie->resets_inverted = true;
 
@@ -572,7 +572,7 @@ static int mt7621_pci_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int mt7621_pci_remove(struct platform_device *pdev)
+static int mt7621_pcie_remove(struct platform_device *pdev)
 {
 	struct mt7621_pcie *pcie = platform_get_drvdata(pdev);
 	struct mt7621_pcie_port *port;
@@ -583,18 +583,18 @@ static int mt7621_pci_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id mt7621_pci_ids[] = {
+static const struct of_device_id mt7621_pcie_ids[] = {
 	{ .compatible = "mediatek,mt7621-pci" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, mt7621_pci_ids);
+MODULE_DEVICE_TABLE(of, mt7621_pcie_ids);
 
-static struct platform_driver mt7621_pci_driver = {
-	.probe = mt7621_pci_probe,
-	.remove = mt7621_pci_remove,
+static struct platform_driver mt7621_pcie_driver = {
+	.probe = mt7621_pcie_probe,
+	.remove = mt7621_pcie_remove,
 	.driver = {
 		.name = "mt7621-pci",
-		.of_match_table = of_match_ptr(mt7621_pci_ids),
+		.of_match_table = of_match_ptr(mt7621_pcie_ids),
 	},
 };
-builtin_platform_driver(mt7621_pci_driver);
+builtin_platform_driver(mt7621_pcie_driver);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
