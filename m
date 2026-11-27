Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61789606A335
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 08:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4TOqB68f;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kM5ZUkJ0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q5w77D7bCNwgnD5x2dPm0vEej/OnOjmyeNCcnbSGWxw=; b=4TOqB68f/dkYCEh/eKgiUsdKHz
	cUpFWd6RUGyKJ+3Q0YPVWwjA89ju1ZRkm7enpX28e3e1WhzsgbKUqmig+VzHlmG9OowRv1Kuf4ST0
	9jQutF92nFf9FbVujBb7CUxe18I20wnzWyK4wkusGKVTnuyaSpBb8kgo0egvpgVEKvds2gtf+M03U
	ACSeRVCItcjxUo2mUAR7Xi+DwFmhmL3Z1L/IUghmQPKuXSztGWDDqIMx6WGJLClN5tdPkrlYiEbNU
	XeVsXfA4s+JVUUOKgagrvtIBbX1csHK31/XACsXGnxfzHc/IE0kcB2FA/CaQtuRLILkFKVkYwLEIY
	5+U3GgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrQm-0000000FG8w-0SVI;
	Fri, 27 Nov 2026 08:35:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrQe-0000000FG5e-37FV;
	Fri, 27 Nov 2026 08:35:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1631544EAC;
	Fri, 27 Nov 2026 08:35:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795768534;
	b=FC/779T8vFhhKZQfJuPDJEHkI2kexb9upaJNuJVecWrhwbot7bWM9DLW6f33RLtC59ml
	 ztPkmNtyo0nBAeiEkJaLc/yltlAH0Ri5Pa3qYpQFlJfiuc5fLrXI0GDGlEuUXlaYwtt9H
	 WPddM1dc9e0AJCufXyFW64monErk2UEJ1txEHjBUgee4Ee2QGIA1pQDxbE9J9DXonOcxp
	 E0XINk7AKtOGw6URCAATeqCeztsXQpbG26K1NpZaCwe/+gP3GaJZStM9zqjngkPXTWFS3
	 K5QZPc+Maz9AI/gVGRyjSyE11C+sC2sPP7If9PmG4sf8JnIGHqxhkTS5mttZ1KSTLkw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795768534;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Q5w77D7bCNwgnD5x2dPm0vEej/OnOjmyeNCcnbSGWxw=;
	b=M5CDMwulLXgaZRZtQik376s7OKoxcjyWPRbmCHJhl9EIX3fu2+7UJgOkmvrbApYRy6HI
	 PaYnlbY0O8UPImFsoD8g8CYosScJU7mXlhiXmO6+I7oa1kN8ji0T7pubWUrAedlSXLvDD
	 gFIVHCvZ0fP+YodkrLnS7sFdUscuH30/AFDfMhcMysBrSqG1BWiij93wP6KCgAC7avsIk
	 plf/COEcVUZ1Y1/ZoLtmiIYq/W8y3MERe+xtGzPSOyhbnGlQCO5UPnwtfXyVfIJK4/XoX
	 q5asw4NdSfJLat1AvyIX4VarmJjKC5RgyXNUWUYLryWwGzazarum7y5wSIJ+LzC8pnA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E950C1F00893;
	Fri, 27 Nov 2026 08:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795768534;
	bh=Q5w77D7bCNwgnD5x2dPm0vEej/OnOjmyeNCcnbSGWxw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=kM5ZUkJ0hvyTRCJTSwbWshtW6ye16V6Y1h6ev/j1v3DqNVvWtcfMDqM2yWXUOgIrQ
	 iIAQcXrGXwVs2l4C2I3IbPbLMsZZaTayvmUt2svdPLdf4fFSOh8LIVb1xMQLyMIlD/
	 feZ+wAtmTiu+tuGCkDMYlcl2wnbRDR7DHaj9CKsx5OLVSQBRKJOGdLyjp/gqwv1hIb
	 rtRtjJh3ZHLU0ZTgpElPpZEPkcq3aIKCQpyZoCDrCJSUi37KC7qi1dEVGPyqhlN8e0
	 GhsD41rgqTg/HxNzcE0A0tKCfpJdPlxuCmt7jNI0+O+AM4CKegjt4sTNfIVVrzoW5b
	 macbw3kv2xKDQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 748CF4B639;
	Fri, 27 Nov 2026 08:35:28 +0000 (UTC)
From: Murad Dadashev via B4 Relay <devnull+llamapersonaltv.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 11:35:12 +0300
Subject: [PATCH 01/10] wifi: mt76: mt7603: split core code into
 mt7603-common
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-mt7603u-v1-1-369bee9846f8@gmail.com>
References: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
In-Reply-To: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Murad Dadashev <llamapersonaltv@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795768526; l=6183;
 i=llamapersonaltv@gmail.com; s=20261127; h=from:subject:message-id;
 bh=W2N+5ZLUXvTja8Y897hub4FOC2EwEVpLge1TCsyEDw4=;
 b=o5hEDXEAkl4Jw2g3aB4mVaTHQIOAWtfdirlsY0tTSQw1tRYShBCDvFAXOKyuUn6S5/E7DSerA
 tZH3Q1WKX7cDBDuB3K+HWl5IoRKAKemGZqPJg05OB0GTh9xDR/XbP1G
X-Developer-Key: i=llamapersonaltv@gmail.com; a=ed25519;
 pk=CeMIX207ioWRbMAA6A2GYgT+DpeVlKHVn7I0KjfHeCg=
X-Endpoint-Received: by B4 Relay for llamapersonaltv@gmail.com/20261127
 with auth_id=1664
X-Original-From: Murad Dadashev <llamapersonaltv@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: llamapersonaltv@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Murad Dadashev <llamapersonaltv@gmail.com>

Move everything except the PCIe and SoC glue into a new mt7603-common
module and export the symbols the glue uses. The PCIe/SoC module init
moves from main.c to pci.c.

This prepares for adding a USB driver for MT7603U that shares the core
code, in the same way mt7615-common is shared by the mt7615 and mt7663
bus drivers.

No functional change for MT7603E and MT76x8.

Signed-off-by: Murad Dadashev <llamapersonaltv@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/Kconfig  |  6 ++++-
 drivers/net/wireless/mediatek/mt76/mt7603/Makefile | 10 +++++---
 drivers/net/wireless/mediatek/mt76/mt7603/core.c   |  1 +
 drivers/net/wireless/mediatek/mt76/mt7603/init.c   |  3 +++
 drivers/net/wireless/mediatek/mt76/mt7603/main.c   | 30 ++--------------------
 drivers/net/wireless/mediatek/mt76/mt7603/pci.c    | 28 ++++++++++++++++++++
 6 files changed, 45 insertions(+), 33 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7603/Kconfig
index ae40a596e49c3e8bbc932bc9a893c293a0945518..dfdd4da15bb0d03843f3d25958cb9391ec7cd54d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/Kconfig
@@ -1,7 +1,11 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
+config MT7603_COMMON
+	tristate
+	select MT76_CORE
+
 config MT7603E
 	tristate "MediaTek MT7603E (PCIe) and MT76x8 WLAN support"
-	select MT76_CORE
+	select MT7603_COMMON
 	depends on MAC80211
 	depends on PCI
 	help
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/Makefile b/drivers/net/wireless/mediatek/mt76/mt7603/Makefile
index e954165ee13399cde435382c6e14fb6360818b27..ad2ab9970d51c9a4a3e458dbbfa72379447f6051 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/Makefile
@@ -1,7 +1,9 @@
 # SPDX-License-Identifier: BSD-3-Clause-Clear
+obj-$(CONFIG_MT7603_COMMON) += mt7603-common.o
 obj-$(CONFIG_MT7603E) += mt7603e.o
 
-mt7603e-y := \
-	pci.o soc.o main.o init.o mcu.o \
-	core.o dma.o mac.o eeprom.o \
-	beacon.o debugfs.o
+mt7603-common-y := \
+	main.o init.o mcu.o core.o dma.o mac.o \
+	eeprom.o beacon.o debugfs.o
+
+mt7603e-y := pci.o soc.o
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/core.c b/drivers/net/wireless/mediatek/mt76/mt7603/core.c
index 9c2943fd904e4cf0a4754eec9d7d31330e96bd7a..a99e4d3156eb94d580fe6b8c262b8f7c19368fb2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/core.c
@@ -55,6 +55,7 @@ irqreturn_t mt7603_irq_handler(int irq, void *dev_instance)
 
 	return IRQ_HANDLED;
 }
+EXPORT_SYMBOL_GPL(mt7603_irq_handler);
 
 u32 mt7603_reg_map(struct mt7603_dev *dev, u32 addr)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/init.c b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
index 218ec406d2a8788ec0d683903652c2cd947de936..d4d631958c56fc0ee54596c5fed7a983fcf0278b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
@@ -20,6 +20,7 @@ const struct mt76_driver_ops mt7603_drv_ops = {
 	.update_survey = mt7603_update_channel,
 	.set_channel = mt7603_set_channel,
 };
+EXPORT_SYMBOL_GPL(mt7603_drv_ops);
 
 static void
 mt7603_set_tmac_template(struct mt7603_dev *dev)
@@ -561,6 +562,7 @@ int mt7603_register_device(struct mt7603_dev *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mt7603_register_device);
 
 void mt7603_unregister_device(struct mt7603_dev *dev)
 {
@@ -570,3 +572,4 @@ void mt7603_unregister_device(struct mt7603_dev *dev)
 	mt7603_dma_cleanup(dev);
 	mt76_free_device(&dev->mt76);
 }
+EXPORT_SYMBOL_GPL(mt7603_unregister_device);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/main.c b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
index 757664e9e1f20afa8a9f95070b6d57806dc4cc19..be4da5023e439a9e0f3386d1e2140464efad4e94 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/main.c
@@ -786,33 +786,7 @@ const struct ieee80211_ops mt7603_ops = {
 	.get_antenna = mt76_get_antenna,
 	.set_sar_specs = mt7603_set_sar_specs,
 };
+EXPORT_SYMBOL_GPL(mt7603_ops);
 
-MODULE_DESCRIPTION("MediaTek MT7603E and MT76x8 wireless driver");
+MODULE_DESCRIPTION("MediaTek MT7603 wireless core driver");
 MODULE_LICENSE("Dual BSD/GPL");
-
-static int __init mt7603_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&mt76_wmac_driver);
-	if (ret)
-		return ret;
-
-#ifdef CONFIG_PCI
-	ret = pci_register_driver(&mt7603_pci_driver);
-	if (ret)
-		platform_driver_unregister(&mt76_wmac_driver);
-#endif
-	return ret;
-}
-
-static void __exit mt7603_exit(void)
-{
-#ifdef CONFIG_PCI
-	pci_unregister_driver(&mt7603_pci_driver);
-#endif
-	platform_driver_unregister(&mt76_wmac_driver);
-}
-
-module_init(mt7603_init);
-module_exit(mt7603_exit);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/pci.c b/drivers/net/wireless/mediatek/mt76/mt7603/pci.c
index 5fee610597a4d7025091391eb516d64a91c1b5ce..f4677586f09ccbcc09bb7817a1d39987ac58c0ca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/pci.c
@@ -3,6 +3,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 
 #include "mt7603.h"
 
@@ -81,3 +82,30 @@ struct pci_driver mt7603_pci_driver = {
 	.probe		= mt76pci_probe,
 	.remove		= mt76pci_remove,
 };
+
+static int __init mt7603_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&mt76_wmac_driver);
+	if (ret)
+		return ret;
+
+	ret = pci_register_driver(&mt7603_pci_driver);
+	if (ret)
+		platform_driver_unregister(&mt76_wmac_driver);
+
+	return ret;
+}
+
+static void __exit mt7603_exit(void)
+{
+	pci_unregister_driver(&mt7603_pci_driver);
+	platform_driver_unregister(&mt76_wmac_driver);
+}
+
+module_init(mt7603_init);
+module_exit(mt7603_exit);
+
+MODULE_DESCRIPTION("MediaTek MT7603E and MT76x8 wireless driver");
+MODULE_LICENSE("Dual BSD/GPL");

-- 
2.47.3



