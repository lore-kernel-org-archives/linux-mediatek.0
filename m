Return-Path: <SRS0=rNmj=6C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B4EC2BA19
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Apr 2020 07:29:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 093E8214D8
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Apr 2020 07:29:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Scwryc8f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DY14Vdau"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 093E8214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=993OHtHB6hX4EGkAZf2v9c5Tf97ECBgstnnkzdWkEqE=; b=Scwryc8ffJ4ycp
	njyUVdFoYO6HYl3C1w6RL0BlYT3xn/fULU5w7C8RBjiejbU4ZVmSkg8XY8pIYvC9Ox8EbtQR/yym9
	+jfu3Ty2GisxTQyw6pyEwxOrKcSST56R4IqVlVdSzHfAXhyV/lS+qneHA42P2O1kKIKmXR3J5Dm05
	0uXCmRVboB7fyodmKV3bn1cWpirOGzMJ3CeojctoAmZkGqNxDRhWDYR4XVFEvSaZHM+/qnTZ2y3jH
	5tcUA7T9c52kbNBVAE/4JLJEmw64FhQ7mmNRgbYSk774XKl/AzTf3y/QjHRWgqi8YUangtpZWod6v
	Wko+Aoz9LXXBaDPmkMoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPhuO-0000mi-9a; Sat, 18 Apr 2020 07:29:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPhuK-0000lh-JB
 for linux-mediatek@lists.infradead.org; Sat, 18 Apr 2020 07:28:58 +0000
X-UUID: 66c722802e7d4a7c941fc48fbdfdad4c-20200417
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tHly56QipJaDD1jRdRq47FdIuCYneP5ID4zpWbIoq5M=; 
 b=DY14Vdau8PFNQTWJjr5Q8WjAueDg6lVVkGVp24YzofW3W3rORLISsD0g7fjjvvy6M5HauehBaA5ckv98kfJEAeDrxLTXSEKXN3FJUFDnqQKqn/XpMyJmCmqdEWaWryvGv9n29iBTix6l3uBNojP9bGovut4z4Zo2TZQJJahmy1s=;
X-UUID: 66c722802e7d4a7c941fc48fbdfdad4c-20200417
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 485490060; Fri, 17 Apr 2020 23:28:43 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Apr 2020 00:28:44 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 18 Apr 2020 15:28:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 18 Apr 2020 15:28:43 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: fix different licenses in same driver
Date: Sat, 18 Apr 2020 15:28:38 +0800
Message-ID: <3a5cb822eb4cd81d32b5480f1235c992ea4fbe06.1587193872.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200418_002856_644152_AB2D402C 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Avoid using different licenses in the same driver.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/Kconfig               | 2 +-
 drivers/net/wireless/mediatek/mt76/Makefile              | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7603/Kconfig        | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7603/Makefile       | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/Kconfig        | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c     | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c      | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/Kconfig        | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/Makefile       | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c       | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.h       | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/init.c         | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/initvals.h     | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/initvals_phy.h | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/main.c         | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/mcu.h          | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h       | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/phy.c          | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/phy.h          | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/usb.c          | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig        | 2 +-
 drivers/net/wireless/mediatek/mt76/mt76x2/Makefile       | 2 +-
 22 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
index cbc2d8a5d354..6e522bfca20a 100644
--- a/drivers/net/wireless/mediatek/mt76/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/Kconfig
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: ISC
 config MT76_CORE
 	tristate
 
diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index a1dfafec431b..32238349ec81 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: ISC
 obj-$(CONFIG_MT76_CORE) += mt76.o
 obj-$(CONFIG_MT76_USB) += mt76-usb.o
 obj-$(CONFIG_MT76x02_LIB) += mt76x02-lib.o
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7603/Kconfig
index 6a0080f1d91c..8bf53244472c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/Kconfig
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: ISC
 config MT7603E
 	tristate "MediaTek MT7603E (PCIe) and MT76x8 WLAN support"
 	select MT76_CORE
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/Makefile b/drivers/net/wireless/mediatek/mt76/mt7603/Makefile
index 6878e305c24d..0e5539fa4ef2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: ISC
 obj-$(CONFIG_MT7603E) += mt7603e.o
 
 mt7603e-y := \
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
index e25db1135eda..d84548d5e000 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: ISC
 
 config MT7615_COMMON
 	tristate
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
index 39642065531f..747f4b61e6da 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: ISC
 /* Copyright (C) 2019 MediaTek Inc.
  *
  * Author: Felix Fietkau <nbd@nbd.name>
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
index cd709fd617db..36c47500eb5b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: ISC
 /* Copyright (C) 2019 MediaTek Inc.
  *
  * Author: Felix Fietkau <nbd@nbd.name>
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/Kconfig b/drivers/net/wireless/mediatek/mt76/mt76x0/Kconfig
index 7c88ed8b8f1e..408ebe6e67a8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/Kconfig
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: ISC
 config MT76x0_COMMON
 	tristate
 	select MT76x02_LIB
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/Makefile b/drivers/net/wireless/mediatek/mt76/mt76x0/Makefile
index 8dcfb4cb4fdf..d6388e63c46e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: ISC
 obj-$(CONFIG_MT76x0U) += mt76x0u.o
 obj-$(CONFIG_MT76x0E) += mt76x0e.o
 obj-$(CONFIG_MT76x0_COMMON) += mt76x0-common.o
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
index 9087607b621e..ff70d30eebaa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-License-Identifier: ISC
 /*
  * Copyright (C) 2014 Felix Fietkau <nbd@openwrt.org>
  * Copyright (C) 2015 Jakub Kicinski <kubakici@wp.pl>
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.h
index 15540ce8db87..c9ddb47101ec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/eeprom.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: ISC */
 /*
  * Copyright (C) 2014 Felix Fietkau <nbd@openwrt.org>
  * Copyright (C) 2015 Jakub Kicinski <kubakici@wp.pl>
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/init.c b/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
index 57f8d56737eb..76c9ba4c3b00 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/init.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-License-Identifier: ISC
 /*
  * (c) Copyright 2002-2010, Ralink Technology, Inc.
  * Copyright (C) 2014 Felix Fietkau <nbd@openwrt.org>
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/initvals.h b/drivers/net/wireless/mediatek/mt76/mt76x0/initvals.h
index 3dcd9620a126..fef58c4589c1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/initvals.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/initvals.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: ISC */
 /*
  * (c) Copyright 2002-2010, Ralink Technology, Inc.
  * Copyright (C) 2015 Jakub Kicinski <kubakici@wp.pl>
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/initvals_phy.h b/drivers/net/wireless/mediatek/mt76/mt76x0/initvals_phy.h
index 42a79887bf79..93f82c320468 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/initvals_phy.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/initvals_phy.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: ISC */
 /*
  * (c) Copyright 2002-2010, Ralink Technology, Inc.
  * Copyright (C) 2015 Jakub Kicinski <kubakici@wp.pl>
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/main.c b/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
index 700ae9c12f1d..8243033dcb98 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/main.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-License-Identifier: ISC
 /*
  * Copyright (C) 2014 Felix Fietkau <nbd@openwrt.org>
  * Copyright (C) 2015 Jakub Kicinski <kubakici@wp.pl>
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.h b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.h
index 0ef29f15f866..706158b504e9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mcu.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: ISC */
 /*
  * Copyright (C) 2014 Felix Fietkau <nbd@openwrt.org>
  * Copyright (C) 2015 Jakub Kicinski <kubakici@wp.pl>
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
index 6953f253a28a..c5eae232a031 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/mt76x0.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: ISC */
 /*
  * Copyright (C) 2014 Felix Fietkau <nbd@openwrt.org>
  * Copyright (C) 2015 Jakub Kicinski <kubakici@wp.pl>
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
index 09f34deb6ba1..aa2e48c7a605 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-License-Identifier: ISC
 /*
  * (c) Copyright 2002-2010, Ralink Technology, Inc.
  * Copyright (C) 2014 Felix Fietkau <nbd@openwrt.org>
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.h b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.h
index 441d6559d4fd..fcedde763779 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+/* SPDX-License-Identifier: ISC */
 /*
  * (c) Copyright 2002-2010, Ralink Technology, Inc.
  * Copyright (C) 2018 Stanislaw Gruszka <stf_xl@wp.pl>
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
index 5535b9c0632f..e844b34d3f74 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/usb.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-License-Identifier: ISC
 /*
  * Copyright (C) 2015 Jakub Kicinski <kubakici@wp.pl>
  */
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig b/drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig
index 5fd4973e32df..0b6f9fcc3c54 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: ISC
 config MT76x2_COMMON
 	tristate
 	select MT76x02_LIB
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/Makefile b/drivers/net/wireless/mediatek/mt76/mt76x2/Makefile
index caf089538c11..893d872d6196 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: ISC
 obj-$(CONFIG_MT76x2_COMMON) += mt76x2-common.o
 obj-$(CONFIG_MT76x2E) += mt76x2e.o
 obj-$(CONFIG_MT76x2U) += mt76x2u.o
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
