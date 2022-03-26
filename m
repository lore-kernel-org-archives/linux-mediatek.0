Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FCAC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Mar 2022 03:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xXin138pKSGD1IytVnn/H3t1a/llaU9K7K2kIs6mLtY=; b=B3V68nozdaLaRX
	tQ5c03SbJLs4NTUe9clL8vZujkSGgVlD4gZt2m90ZYPJ2QpRWi/rBAnaXYqdoWPuEfIjVAboox77u
	4zirKnacj5JVqpg+CW4wsi9U2EcknZw60sCYc8eiHRoh5mNb2HdJYJ9C/Q91zi0Rl8bFin8Pq09ET
	VOpKQOep/DZYqh1zbWRSyrrmP0EDw91Yof0fsAVam/UfEuPQ7FPF+3+mI8bPjjY6LbZmndjAzxuCU
	JryW6gT/Ez2cGQHDc3FF1MKMyuA1eo0C94zdxHufRC9+vBnhFvu5s7YcJZ0AlCX2M28dtaIPohpOW
	ys2zny6ARwUhkzwiSGhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXx5n-003fQq-97; Sat, 26 Mar 2022 03:27:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXx5Z-003fPB-Ja; Sat, 26 Mar 2022 03:27:44 +0000
X-UUID: 7688c51d98964a48a79c621e4fb485bc-20220325
X-UUID: 7688c51d98964a48a79c621e4fb485bc-20220325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2092544333; Fri, 25 Mar 2022 20:27:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Mar 2022 20:27:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Mar 2022 11:27:34 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 26 Mar 2022 11:27:33 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] PCI: mediatek: Update entries to distinguish MediaTek PCIe
 controller
Date: Sat, 26 Mar 2022 11:27:08 +0800
Message-ID: <20220326032708.3626-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_202741_696556_CA8A32A0 
X-CRM114-Status: GOOD (  12.02  )
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

Add model numbers in Kconfig and update driver name in
pcie-mediatek-gen3.c to distinguish the MediaTek PCIe controllers.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/pci/controller/Kconfig              | 11 +++++++----
 drivers/pci/controller/pcie-mediatek-gen3.c | 12 ++++++------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 601f2531ee91..dd7a2caf8da9 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -237,8 +237,11 @@ config PCIE_MEDIATEK
 	depends on OF
 	depends on PCI_MSI_IRQ_DOMAIN
 	help
-	  Say Y here if you want to enable PCIe controller support on
-	  MediaTek SoCs.
+	  Adds support for PCIe MAC controller for MediaTek SoCs.
+
+	  The following SoCs are supported for this PCIe controller:
+	  MT2701 and MT7623 with no MSI supported.
+	  MT2712, MT7622 and MT7629 support up to 32 MSI interrupt numbers.
 
 config PCIE_MEDIATEK_GEN3
 	tristate "MediaTek Gen3 PCIe controller"
@@ -250,8 +253,8 @@ config PCIE_MEDIATEK_GEN3
 	  and support up to 256 MSI interrupt numbers for
 	  multi-function devices.
 
-	  Say Y here if you want to enable Gen3 PCIe controller support on
-	  MediaTek SoCs.
+	  The following SoCs are supported for this PCIe controller:
+	  MT8192 and MT8195.
 
 config VMD
 	depends on PCI_MSI && X86_64 && SRCU && !UML
diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 7705d61fba4c..6745076a02b9 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1011,21 +1011,21 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
 				      mtk_pcie_resume_noirq)
 };
 
-static const struct of_device_id mtk_pcie_of_match[] = {
+static const struct of_device_id mtk_pcie_gen3_of_match[] = {
 	{ .compatible = "mediatek,mt8192-pcie" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
+MODULE_DEVICE_TABLE(of, mtk_pcie_gen3_of_match);
 
-static struct platform_driver mtk_pcie_driver = {
+static struct platform_driver mtk_pcie_driver_gen3 = {
 	.probe = mtk_pcie_probe,
 	.remove = mtk_pcie_remove,
 	.driver = {
-		.name = "mtk-pcie",
-		.of_match_table = mtk_pcie_of_match,
+		.name = "mtk-pcie-gen3",
+		.of_match_table = mtk_pcie_gen3_of_match,
 		.pm = &mtk_pcie_pm_ops,
 	},
 };
 
-module_platform_driver(mtk_pcie_driver);
+module_platform_driver(mtk_pcie_driver_gen3);
 MODULE_LICENSE("GPL v2");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
