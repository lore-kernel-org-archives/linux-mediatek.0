Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEEEC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 10:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKOK8lviGgf2vrpFBhrGZiQNPnf2LYdvdKrwJ9TotZo=; b=YU5rOs8ilVO7SqxDHSyJWgk9n3
	lo019XeLmH3MUs1PCjdrnLihACEOYOEFCdJSj+j3z8PwT4vW9xdIwa4dEfTpPKH5dgz5M0CFv7MTc
	WTxVvMCxceiiQzwIK4LQ4mmoYSfdOV4T5FcKRWJ/YUztZgFyabnYgcjJLp3kBfUc+jPd6LLBU5eQT
	VUQJytP4pRviQRyUxLiLRtQGVyfxrLMCBWYoMKdJkeicCtI4ifoKjnVvgOU46kxLV8XgyoD7HN5k1
	a3+JWyMPTdGarPFj0V9iOSc37sNDyiyIhUa84Ac84zun6SHe7A8Sem0erSvNHGGXdWck7ALgnKmtB
	SFLUxU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1OY6-00000002LGZ-0nef;
	Mon, 29 Apr 2024 10:47:54 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1OY2-00000002LDo-0fFf;
	Mon, 29 Apr 2024 10:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714387670; x=1745923670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Mc4DmXEXO6Kz1kJ/fVcR7ZcfLPUG4RYhvrVnAwaq+0=;
  b=nGn8u6PFD9V+x8+C+PTitC8kIEN5+owjLW5/bpEidY9ooB/TrgYAaMI/
   xYPLAsGiaHPjcBXrltJ4YwxwpV2HzMlzHRSUa3dUXfqyH1BVvIYNFVDKP
   hspiLdiynFC68rmOld2Gvp6GtAc3WGQj9YzKc418+R3Ma/Nw8ZE57p/RR
   J7VSKpZtyhvqx0M3JE1nZgtUsecCjkFE5PdfpbicesvbLwJVfhVgiFEJ1
   cCSsTY08sGC6Z8E8jvrylWAcP7UXjarVtEK6f3yURSoPpDGQF+J1sagkl
   G0cd/FiVfcK3j/s+HEZ2uPUz+K4mXyjKnu+SMSId/66vy2bEuFRb0RSQO
   w==;
X-CSE-ConnectionGUID: ZBYkX2ZARLamslVfHFUqvQ==
X-CSE-MsgGUID: x8iyq+xUQkSv1d2HR4UCDw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10201846"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="10201846"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:47:49 -0700
X-CSE-ConnectionGUID: /nnKB6kaSHeZOlfWFHxV8w==
X-CSE-MsgGUID: k64qq1ZHTVWYmwqvHsqZzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26589567"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.45])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:47:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 07/10] PCI: Replace PCI_CONF1{,_EXT}_ADDRESS() with the new helpers
Date: Mon, 29 Apr 2024 13:46:30 +0300
Message-Id: <20240429104633.11060-8-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429104633.11060-1-ilpo.jarvinen@linux.intel.com>
References: <20240429104633.11060-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_034750_243586_EBE06F3E 
X-CRM114-Status: GOOD (  14.67  )
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

Replace the old PCI_CONF1{,_EXT}_ADDRESS() helpers used to calculate
PCI Configuration Space Type 1 addresses with the new
pci_conf1{,_ext}_offset() helpers that are more generic and more widely
available.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/controller/pci-ftpci100.c | 6 ++----
 drivers/pci/controller/pci-ixp4xx.c   | 5 ++---
 drivers/pci/controller/pcie-mt7621.c  | 7 +++----
 drivers/pci/pci.h                     | 8 --------
 4 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/controller/pci-ftpci100.c b/drivers/pci/controller/pci-ftpci100.c
index ffdeed25e961..a8d0217a0b94 100644
--- a/drivers/pci/controller/pci-ftpci100.c
+++ b/drivers/pci/controller/pci-ftpci100.c
@@ -182,8 +182,7 @@ static int faraday_raw_pci_read_config(struct faraday_pci *p, int bus_number,
 				       unsigned int fn, int config, int size,
 				       u32 *value)
 {
-	writel(PCI_CONF1_ADDRESS(bus_number, PCI_SLOT(fn),
-				 PCI_FUNC(fn), config),
+	writel(pci_conf1_addr(bus_number, fn, config, true),
 			p->base + FTPCI_CONFIG);
 
 	*value = readl(p->base + FTPCI_DATA);
@@ -214,8 +213,7 @@ static int faraday_raw_pci_write_config(struct faraday_pci *p, int bus_number,
 {
 	int ret = PCIBIOS_SUCCESSFUL;
 
-	writel(PCI_CONF1_ADDRESS(bus_number, PCI_SLOT(fn),
-				 PCI_FUNC(fn), config),
+	writel(pci_conf1_addr(bus_number, fn, config, true),
 			p->base + FTPCI_CONFIG);
 
 	switch (size) {
diff --git a/drivers/pci/controller/pci-ixp4xx.c b/drivers/pci/controller/pci-ixp4xx.c
index ec0125344ca1..fd52f4a3ef31 100644
--- a/drivers/pci/controller/pci-ixp4xx.c
+++ b/drivers/pci/controller/pci-ixp4xx.c
@@ -192,9 +192,8 @@ static u32 ixp4xx_config_addr(u8 bus_num, u16 devfn, int where)
 		       BIT(32 - PCI_SLOT(devfn));
 	} else {
 		/* type 1 */
-		return (PCI_CONF1_ADDRESS(bus_num, PCI_SLOT(devfn),
-					  PCI_FUNC(devfn), where) &
-			~PCI_CONF1_ENABLE) | PCI_CONF1_TRANSACTION;
+		return pci_conf1_addr(bus_num, devfn, where, false) |
+		       PCI_CONF1_TRANSACTION;
 	}
 }
 
diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
index 79e225edb42a..2b2d9828a910 100644
--- a/drivers/pci/controller/pcie-mt7621.c
+++ b/drivers/pci/controller/pcie-mt7621.c
@@ -127,8 +127,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
 					 unsigned int devfn, int where)
 {
 	struct mt7621_pcie *pcie = bus->sysdata;
-	u32 address = PCI_CONF1_EXT_ADDRESS(bus->number, PCI_SLOT(devfn),
-					    PCI_FUNC(devfn), where);
+	u32 address = pci_conf1_ext_addr(bus->number, devfn, where, true);
 
 	writel_relaxed(address, pcie->base + RALINK_PCI_CONFIG_ADDR);
 
@@ -143,7 +142,7 @@ static struct pci_ops mt7621_pcie_ops = {
 
 static u32 read_config(struct mt7621_pcie *pcie, unsigned int dev, u32 reg)
 {
-	u32 address = PCI_CONF1_EXT_ADDRESS(0, dev, 0, reg);
+	u32 address = pci_conf1_ext_addr(0, PCI_DEVFN(dev, 0), reg, true);
 
 	pcie_write(pcie, address, RALINK_PCI_CONFIG_ADDR);
 	return pcie_read(pcie, RALINK_PCI_CONFIG_DATA);
@@ -152,7 +151,7 @@ static u32 read_config(struct mt7621_pcie *pcie, unsigned int dev, u32 reg)
 static void write_config(struct mt7621_pcie *pcie, unsigned int dev,
 			 u32 reg, u32 val)
 {
-	u32 address = PCI_CONF1_EXT_ADDRESS(0, dev, 0, reg);
+	u32 address = pci_conf1_ext_addr(0, PCI_DEVFN(dev, 0), reg, true);
 
 	pcie_write(pcie, address, RALINK_PCI_CONFIG_ADDR);
 	pcie_write(pcie, val, RALINK_PCI_CONFIG_DATA);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index cf0530a60105..fdf9624b0b12 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -833,12 +833,4 @@ struct pci_devres {
 
 struct pci_devres *find_pci_dr(struct pci_dev *pdev);
 
-#define PCI_CONF1_ADDRESS(bus, dev, func, reg) \
-	(PCI_CONF1_ENABLE | \
-	 pci_conf1_addr(bus, PCI_DEVFN(dev, func), reg & ~0x3U))
-
-#define PCI_CONF1_EXT_ADDRESS(bus, dev, func, reg) \
-	(PCI_CONF1_ENABLE | \
-	 pci_conf1_ext_addr(bus, PCI_DEVFN(dev, func), reg & ~0x3U))
-
 #endif /* DRIVERS_PCI_H */
-- 
2.39.2


