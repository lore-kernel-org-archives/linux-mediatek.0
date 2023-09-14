Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5113EEAA66
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 19:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CjPS8aN2uAutoiuWUC/O0wHduIo9w3aFFbYbDgotjWg=; b=nuGLPMIYlfVy7jYlziO1Nv9YST
	8spZ5mkHv2/06IiaRIFP/h91BZf/f3fXzdT/vxed45tcJUZMOtyxEF/PnndJT1K0haNKzi5SSN9D2
	w3K0ptOcU4d9A6eQZju/A/2GKkRlr3s3HE19mybrut0WXHaMWiQDFmQW10maJBBQnENnisswCk3/j
	0s5BVU12VH4W5FwEsd4FBG7yJ2jioLKbqEN3iPMSHuXdAplOU0oNntuC0/UXXhu9IBM4rAmcpGs9c
	MF6RNKbq+0NdqmwMv9ESLYRiZE/YBiBh4l12kFFcCok8Rjst8X8N0LVLQu/BGKaXmV+4OJ/O1o9kW
	vx0QDreQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrw7-0099qx-1f;
	Thu, 14 Sep 2023 19:23:35 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgrw4-0099qK-0E;
	Thu, 14 Sep 2023 19:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694719411; x=1726255411;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bQ/m3C0Cjlp+qkmxV3qd9rgQFU2S555pRWmcCkVMVIg=;
  b=fPKDaBUqVs6t6gkxsdNzf6U1OQPwcK7x0o7EVvBzKpIPQkyCoSzcFrRf
   rrHLh14Bhq+j+MtsbpXMOlp2FaCQIUS3n27s/s+Tnjx/lPTJLAemUpHm8
   yXrGgtadzYmHlA0H+oDEB2t5vfHMeV0FoHClsMG2ty3Y+eCaDmIBVKO2A
   chVJSdnv5Mkz3hr2zaNYC1DLz67CijNqd7+qN0y4OZOGlPRFXzHwV27CF
   oOMdrfimiT7FM2nIxCJGAe+sHo3misaPXzo1c6CdP+Jgk3Av9zsr6iP13
   RVOdrdCknTgEj8cYtZMfoxFMbSxOXMbzdKL3ai77KjxsSvB3Ewzqco0jy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358467333"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="358467333"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 12:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="738016982"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="738016982"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 14 Sep 2023 12:23:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 99460204; Thu, 14 Sep 2023 22:23:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/1] PCI: mediatek: Correct type for virt_to_phys()
Date: Thu, 14 Sep 2023 22:23:24 +0300
Message-Id: <20230914192324.672997-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_122332_141346_C10FC9BF 
X-CRM114-Status: GOOD (  11.35  )
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

virt_to_phys() takes a regular pointer, while driver supplies __iomem
annotated one. Force type to void to make sparse happy, otherwise

   pcie-mediatek.c:400:40: sparse:     expected void volatile *address
   pcie-mediatek.c:400:40: sparse:     got void [noderef] __iomem *

   pcie-mediatek.c:523:44: sparse:     expected void volatile *address
   pcie-mediatek.c:523:44: sparse:     got void [noderef] __iomem *

Reported-by: Huacai Chen <chenhuacai@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309072237.9zxMv4MZ-lkp@intel.com/
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pci/controller/pcie-mediatek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 66a8f73296fc..5e795afd1cee 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -397,7 +397,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	phys_addr_t addr;
 
 	/* MT2712/MT7622 only support 32-bit MSI addresses */
-	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
+	addr = virt_to_phys((__force void *)port->base + PCIE_MSI_VECTOR);
 	msg->address_hi = 0;
 	msg->address_lo = lower_32_bits(addr);
 
@@ -520,7 +520,7 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
 	u32 val;
 	phys_addr_t msg_addr;
 
-	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
+	msg_addr = virt_to_phys((__force void *)port->base + PCIE_MSI_VECTOR);
 	val = lower_32_bits(msg_addr);
 	writel(val, port->base + PCIE_IMSI_ADDR);
 
-- 
2.40.0.1.gaa8946217a0b


