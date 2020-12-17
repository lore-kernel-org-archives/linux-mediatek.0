Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB3BC4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 18:13:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82B992395A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 18:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82B992395A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sfldCn+IcTa8hEe5//tTJDAE6i11txUcZ1EwIASKF+0=; b=iflY0yDgtjUch5JWIemrFBuzR
	3RrS0vuSNmUR3T6LZT+X+WzdcP6T/R/vHZP3LSJ0cF/Y5RrPiqSYngyHpDSCiddjh/BOsGjskWdtO
	TCitir2I4C28QuV3EYrmPWjCyPTa0dWf8FcQ327THLyuAYi2Ecv+/VCadqJputnOH0VnN/jmJNfQ0
	ryPUpF3FEL5ATQJIqqQBpGzhiCFzeX/+TNdEuloQof/jmsMyIAH6fZkpaN8EGzwEhurB0qnaYSRHp
	AmZBY1COChwx1rgwntG3a8Opit44IK4jkO6eZpOGZJIsj2A5jMzLZrD1np/QfY+s5J4qhKW8GDDj7
	+AH/LJHNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpxmX-00050j-Dr; Thu, 17 Dec 2020 18:13:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpxmR-0004xx-09
 for linux-mediatek@lists.infradead.org; Thu, 17 Dec 2020 18:13:39 +0000
X-UUID: f09d8f0c24074a3eb64c57730e74563d-20201217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tV5NSBjBk4aY43rSPqHNAKoVrAYbceanwNKkl7XsXks=; 
 b=PXcLt0mv0tMGeAmJWIl6e++CqOb2x5iVsE4UASoAdEAF/nYVTj3Xtm0NTu0LLoVLjsvk0QPyLyspUo10yLMjn50ffHCDAkMGb8GPZMSG7AdBl21T6mgskikp3DZpHrBlb/gla9+5ULQrYtdmhInvecG3dPkQu5AVjtOffZUx7aY=;
X-UUID: f09d8f0c24074a3eb64c57730e74563d-20201217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1666783608; Thu, 17 Dec 2020 10:13:28 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 10:13:25 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Dec 2020 02:13:20 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Dec 2020 02:13:21 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v3 1/8] mt76: mt7921: add module support
Date: Fri, 18 Dec 2020 02:13:14 +0800
Message-ID: <781bd384227cddeb18cd47dd861c0f5400625f55.1608227863.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1608227863.git.objelf@gmail.com>
References: <cover.1608227863.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 66CDB51BBAA2786F22A91D77AA86C1D99EF9FD178393AD1DF7AE9E90FC2C15FE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_131335_852136_CFF293DE 
X-CRM114-Status: GOOD (  22.35  )
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
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Soul.Huang@mediatek.com,
 Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Add mt7921 as the pci driver module.

The purpose of the patch is to check about if the following patches are
able to compile properly.

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/Kconfig    |  1 +
 drivers/net/wireless/mediatek/mt76/Makefile   |  1 +
 .../net/wireless/mediatek/mt76/mt7921/Kconfig | 10 +++
 .../wireless/mediatek/mt76/mt7921/Makefile    |  5 ++
 .../net/wireless/mediatek/mt76/mt7921/pci.c   | 63 +++++++++++++++++++
 5 files changed, 80 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/Makefile
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/pci.c

diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
index 31015d2a8e7d..5f42ce3267cb 100644
--- a/drivers/net/wireless/mediatek/mt76/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/Kconfig
@@ -29,3 +29,4 @@ source "drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig"
 source "drivers/net/wireless/mediatek/mt76/mt7603/Kconfig"
 source "drivers/net/wireless/mediatek/mt76/mt7615/Kconfig"
 source "drivers/net/wireless/mediatek/mt76/mt7915/Kconfig"
+source "drivers/net/wireless/mediatek/mt76/mt7921/Kconfig"
diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index e53584db0756..1d72093b61a3 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -31,3 +31,4 @@ obj-$(CONFIG_MT76x2_COMMON) += mt76x2/
 obj-$(CONFIG_MT7603E) += mt7603/
 obj-$(CONFIG_MT7615_COMMON) += mt7615/
 obj-$(CONFIG_MT7915E) += mt7915/
+obj-$(CONFIG_MT7921E) += mt7921/
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
new file mode 100644
index 000000000000..24932d2e8dee
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
@@ -0,0 +1,10 @@
+# SPDX-License-Identifier: ISC
+config MT7921E
+	tristate "MediaTek MT7921E (PCIe) support"
+	select MT76_CORE
+	depends on MAC80211
+	depends on PCI
+	help
+	  This adds support for MT7921E 802.11ax 2x2:2SS wireless devices.
+
+	  To compile this driver as a module, choose M here.
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
new file mode 100644
index 000000000000..fa7b42721631
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
@@ -0,0 +1,5 @@
+#SPDX-License-Identifier: ISC
+
+obj-$(CONFIG_MT7921E) += mt7921e.o
+
+mt7921e-y := pci.o
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
new file mode 100644
index 000000000000..9f003775c4d8
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2020 MediaTek Inc.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+static const struct pci_device_id mt7921_pci_device_table[] = {
+	{ PCI_DEVICE(0x14c3, 0x7961) },
+	{ },
+};
+
+static int mt7921_pci_probe(struct pci_dev *pdev,
+			    const struct pci_device_id *id)
+{
+	int ret;
+
+	ret = pcim_enable_device(pdev);
+	if (ret)
+		return ret;
+
+	ret = pcim_iomap_regions(pdev, BIT(0), pci_name(pdev));
+	if (ret)
+		return ret;
+
+	pci_set_master(pdev);
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_LEGACY);
+	if (ret < 0)
+		return ret;
+
+	ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
+	if (ret)
+		goto err_free_pci_vec;
+
+	return 0;
+
+err_free_pci_vec:
+	pci_free_irq_vectors(pdev);
+
+	return ret;
+}
+
+static void mt7921_pci_remove(struct pci_dev *pdev)
+{
+	pci_free_irq_vectors(pdev);
+}
+
+struct pci_driver mt7921_pci_driver = {
+	.name		= KBUILD_MODNAME,
+	.id_table	= mt7921_pci_device_table,
+	.probe		= mt7921_pci_probe,
+	.remove		= mt7921_pci_remove,
+};
+
+module_pci_driver(mt7921_pci_driver);
+
+MODULE_DEVICE_TABLE(pci, mt7921_pci_device_table);
+MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
+MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
