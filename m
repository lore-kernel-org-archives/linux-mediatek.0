Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AB6C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 20:01:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A16FA206F1
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 20:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C/Anxjt6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GmsD9FU5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A16FA206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GmiacL86+vZqWDGCUv4K3z6dqkKxOZeRXGi8lALkCe0=; b=C/Anxjt6oY/pyG
	Q51XNpJjcKsnW2pMsZbzxSgKsqZKUxMxYh9E7AyqANVBX1NPxoGZOKtnB93n0U8otCK5k2TkTzDIc
	cfXo56EsW5U65ydN1q1Zw6nwalMBrZlCHeybNiARSYh9xPKs+DB0m1IHTnz/I4g/ZG4QNQlhGlK+q
	ezcPrn9gYeMMIp2ri7ODkIAhZWnmUlCvvvS9jxKitQm8tO+9/E+HWxCdyf4AMbzhJVJc/zDTfclWb
	nmuC4PU4paS8z3lZTMU3j/bYWy8zoCiZfWApwOCXwtpF3KnaQCukzy0DFFtd6/yiMbbQPn9YvF4/a
	wZuTRRQSpM46m1dlzodw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlHm1-0004Vu-B3; Tue, 16 Jun 2020 20:01:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlHly-0004V1-Hf
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 20:01:31 +0000
X-UUID: c23eb82a745145008ae59431cc48b1b7-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MPlbLoYu4SxADLEwOMGhe4GB3UlXiF6xAyq5JyY/ozM=; 
 b=GmsD9FU5gHLOUA6G0lHFkD9wCztwFVYZKbhmyvviFzug5/nW4Xy/T2XMIkfZKx4S3m3ufqF3gnxIJN0lHKv+WQxuQjudWGTBetPFGkIoeaWQvZGhMBn/XmyrWRqQzBRbds8UQO8UG0V5CoLz6mA0HbaXBy+zFBRsqu6mwGHrKI0=;
X-UUID: c23eb82a745145008ae59431cc48b1b7-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1028439141; Tue, 16 Jun 2020 12:01:01 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 13:01:18 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 04:01:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 17 Jun 2020 04:01:17 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 2/2] mt76: mt7615: fix different licenses in same driver
Date: Wed, 17 Jun 2020 04:01:18 +0800
Message-ID: <dae8a31520c0f30741f6e3bde76b7d4c8cf18de3.1592337119.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <f878543ad56fa3b74f5bfcb49e2112d3e4cc92ee.1592337119.git.ryder.lee@mediatek.com>
References: <f878543ad56fa3b74f5bfcb49e2112d3e4cc92ee.1592337119.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_130130_596715_7154F784 
X-CRM114-Status: UNSURE (   8.03  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Avoid using different licenses in the same driver.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
@Sean @Lorenzo: For mt7615, I need to gather ACK from all people involved with the code. 
---
 drivers/net/wireless/mediatek/mt76/mt7615/Kconfig    | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/mmio.c     | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/usb_mcu.c  | 2 +-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
index e25db1135eda..d84548d5e000 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: ISC
 
 config MT7615_COMMON
 	tristate
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
index 2e99845b9c96..39b7db871fc1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
@@ -1,3 +1,6 @@
+// SPDX-License-Identifier: ISC
+/* Copyright (C) 2020 MediaTek Inc. */
+
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
index 19a15f353e1e..27136ff1aac9 100644
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
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
