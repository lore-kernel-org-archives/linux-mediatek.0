Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE930C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 07:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kiyGQ1Zb1rn3YKpVOoODt9XJPfvDrMqpR8vjc+4O1js=; b=sc/BCJMjayvgLV
	Zq3kM4vt2fon4i9RUeScEcydk9Q5Ci+eszeEqrsldUif9AaW9QhMMiux0buNS1hcca8Xd4oq/sgQ3
	gwJpRXdjtZOc2hrv1O22T82uGw+uq0LKYXc3pbj72WqFDwCGeNlKbfZ6SnBtZtHkdiEwRnhUNhbzK
	pnwDoCos1JHt0KbBGhDok0Z5XfKaH0GF1VUbjgO0g4aD+tHe8dTtOVWDbhTso2rF7tHE3uccwZ1QL
	gjUcj+/xBMpgsftyoFCvs8RfZq8g+xZe6mshk1sFBeD8SR+2OuUklWooQCOXFk6W0Iax9O3QjAP5Z
	dE4KclxxFGWZFYmyLpWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXI1D-00FxNr-Up; Thu, 24 Mar 2022 07:36:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXI10-00FxLy-Mk; Thu, 24 Mar 2022 07:36:17 +0000
X-UUID: 2a94006c9e5a499183df22b7ea7466de-20220324
X-UUID: 2a94006c9e5a499183df22b7ea7466de-20220324
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1369683219; Thu, 24 Mar 2022 00:36:10 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Mar 2022 00:26:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Mar 2022 15:25:54 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 15:25:53 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>
CC: Jianjun Wang <jianjun.wang@mediatek.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <jieyy.yang@mediatek.com>,
 <chuanjia.liu@mediatek.com>, <qizhong.cheng@mediatek.com>,
 <jian.yang@mediatek.com>
Subject: [PATCH] PCI: mediatek-gen3: Print LTSSM state when PCIe link down
Date: Thu, 24 Mar 2022 15:25:48 +0800
Message-ID: <20220324072548.11408-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_003614_758528_D1146966 
X-CRM114-Status: GOOD (  12.09  )
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

Print current LTSSM state when PCIe link down instead of the register
value, make it easier to get the link status.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 40 ++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 7705d61fba4c..54663f025e27 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -153,6 +153,37 @@ struct mtk_gen3_pcie {
 	DECLARE_BITMAP(msi_irq_in_use, PCIE_MSI_IRQS_NUM);
 };
 
+/* LTSSM state in PCIE_LTSSM_STATUS_REG bit[28:24] */
+static const char *const ltssm_str[] = {
+	"detect.quiet",			/* 0x00 */
+	"detect.active",		/* 0x01 */
+	"polling.active",		/* 0x02 */
+	"polling.compliance",		/* 0x03 */
+	"polling.configuration",	/* 0x04 */
+	"config.linkwidthstart",	/* 0x05 */
+	"config.linkwidthaccept",	/* 0x06 */
+	"config.lanenumwait",		/* 0x07 */
+	"config.lanenumaccept",		/* 0x08 */
+	"config.complete",		/* 0x09 */
+	"config.idle",			/* 0x0A */
+	"recovery.receiverlock",	/* 0x0B */
+	"recovery.equalization",	/* 0x0C */
+	"recovery.speed",		/* 0x0D */
+	"recovery.receiverconfig",	/* 0x0E */
+	"recovery.idle",		/* 0x0F */
+	"L0",				/* 0x10 */
+	"L0s",				/* 0x11 */
+	"L1.entry",			/* 0x12 */
+	"L1.idle",			/* 0x13 */
+	"L2.idle",			/* 0x14 */
+	"L2.transmitwake",		/* 0x15 */
+	"disable",			/* 0x16 */
+	"loopback.entry",		/* 0x17 */
+	"loopback.active",		/* 0x18 */
+	"loopback.exit",		/* 0x19 */
+	"hotreset",			/* 0x1A */
+};
+
 /**
  * mtk_pcie_config_tlp_header() - Configure a configuration TLP header
  * @bus: PCI bus to query
@@ -327,8 +358,15 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 				 !!(val & PCIE_PORT_LINKUP), 20,
 				 PCI_PM_D3COLD_WAIT * USEC_PER_MSEC);
 	if (err) {
+		const char *ltssm_state;
+		int ltssm_index;
+
 		val = readl_relaxed(pcie->base + PCIE_LTSSM_STATUS_REG);
-		dev_err(pcie->dev, "PCIe link down, ltssm reg val: %#x\n", val);
+		ltssm_index = PCIE_LTSSM_STATE(val);
+		ltssm_state = ltssm_index >= ARRAY_SIZE(ltssm_str) ?
+			      "Unknown state" : ltssm_str[ltssm_index];
+		dev_err(pcie->dev, "PCIe link down, current ltssm state: %s\n",
+			ltssm_state);
 		return err;
 	}
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
