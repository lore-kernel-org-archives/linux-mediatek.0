Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979C7C7619A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Apr 2023 13:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PePDMwKaKXpGWihmfKFx/uB+X5rFJB1pjEC6KIOCAQU=; b=VYbiTAJvvwNT0A
	mxWU+Yy7HJhNjof5H9jZ7P5JZ06DvRCshJOc5Ti7ezPG4k7vGVD9gGI4OmA/iDarueRc+vWL14AyI
	rgepJMED/HbihCTV5ZqsdSrsy3rrpS3AoyhlqnJPhb68uh4ojFHStQ94uJSmpN6xfrFeAlr/ce6aX
	jMQJrJPy34Kfms3ROQXyKKYAJVMzHim0r9y60MDKm0JtU46KKWoY2j75O/5NQ7QTs5iNZ4gvfIu/5
	BeTIoH0zLi24w+YK2JRaeKLpxP83dLSSHez3XwCEyTxG6hHCTPa/CYl73v3jrqhfvVQ9w3RheK08u
	jLkaCVbznUYMbWT9yOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pixWc-00CVE3-1M;
	Sun, 02 Apr 2023 13:13:38 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pixWV-00CVCs-0h;
	Sun, 02 Apr 2023 13:13:35 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id C4B5C61CDF;
	Sun,  2 Apr 2023 13:13:23 +0000 (UTC)
Received: from frank-G5.. (fttx-pool-217.61.149.201.bambit.de [217.61.149.201])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 8262B4092B;
	Sun,  2 Apr 2023 13:12:01 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] PCI: mediatek-gen3: handle PERST after reset
Date: Sun,  2 Apr 2023 15:11:19 +0200
Message-Id: <20230402131119.98805-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 8b6dfb75-3da6-40a2-b803-4599ce6843ed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230402_061331_418924_89920E45 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

De-assert PERST in separate step after reset signals to fully comply
the PCIe CEM clause 2.2.

This fixes some NVME detection issues on mt7986.

Fixes: d3bf75b579b9 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
Patch is taken from user Ruslan aka RRKh61 (permitted me to send it
with me as author).

https://forum.banana-pi.org/t/bpi-r3-nvme-connection-issue/14563/17
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b8612ce5f4d0..176b1a04565d 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -350,7 +350,13 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	msleep(100);
 
 	/* De-assert reset signals */
-	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB);
+	val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB);
+	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+
+	msleep(100);
+
+	/* De-assert PERST# signals */
+	val &= ~(PCIE_PE_RSTB);
 	writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
 
 	/* Check if the link is up or not */
-- 
2.34.1


