Return-Path: <SRS0=X6pk=PL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E72C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 11:16:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 978A160E97
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Oct 2021 11:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 978A160E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGL1Ygh2kl/z8hFId8ZvrZBNWrrwmybN4VCvXnnoRS8=; b=voAu61S5i7/k28
	u0Sl7ZOeaQ9p71f2AAIAwBpHUK8P3YJtVa4/MB5aHO5qD9JL4lvdcJ/nFqPkUhkYinkYsaEvdHlCJ
	7Gb5PXmmnU3wT3MrpReZcAoa0yQGlN0vjblW/OQxpqCj3C4aCYa7V/wk/LWxdb/pQU9uMmjRg9krW
	OrgkvltGiLONe9AJjBHi5+yQhxZo4UYiVrSDafwT7mu2Q4yG50LeYr0ttKVtdy10nOtN5nQBN/we3
	dSeCjm7e+wTVC5rwkq4QxrD1Wh85XqQTlfgAvPXyQAjzT3W9hHlNPBYxIeTmIXxCFSoq6XFDKYBEu
	jrgGJc6TjGMZzS8boQNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meF0f-00Cd75-Fw; Sat, 23 Oct 2021 11:16:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meEzL-00CcMB-Ky; Sat, 23 Oct 2021 11:15:01 +0000
X-UUID: be6ad2ec2277401fadd41eedda5535b8-20211023
X-UUID: be6ad2ec2277401fadd41eedda5535b8-20211023
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 79138695; Sat, 23 Oct 2021 04:14:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Oct 2021 04:14:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 23 Oct 2021 19:14:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Oct 2021 19:14:54 +0800
From: Flora Fu <flora.fu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>, Flora Fu
 <flora.fu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>
Subject: [RFC 06/13] soc: mediatek: apu: Add apu core driver
Date: Sat, 23 Oct 2021 19:14:02 +0800
Message-ID: <20211023111409.30463-7-flora.fu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211023111409.30463-1-flora.fu@mediatek.com>
References: <20211023111409.30463-1-flora.fu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_041459_720435_C5D1E585 
X-CRM114-Status: GOOD (  22.42  )
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

Add apu core driver.
The core driver will init the reset part of apu functions.

Signed-off-by: Flora Fu <flora.fu@mediatek.com>
---
 drivers/soc/mediatek/Kconfig           | 18 +++++
 drivers/soc/mediatek/apusys/Makefile   |  3 +
 drivers/soc/mediatek/apusys/apu-core.c | 91 ++++++++++++++++++++++++++
 drivers/soc/mediatek/apusys/apu-core.h | 11 ++++
 4 files changed, 123 insertions(+)
 create mode 100644 drivers/soc/mediatek/apusys/apu-core.c
 create mode 100644 drivers/soc/mediatek/apusys/apu-core.h

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index d9bac2710494..074b0cf24c44 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -24,6 +24,24 @@ config MTK_APU_PM
 	  APU power domain shall be enabled before accessing the
 	  internal sub modules.
 
+config MTK_APU
+	tristate "MediaTek APUSYS Support"
+	select REGMAP
+	select MTK_APU_PM
+	select MTK_SCP
+	help
+	  Say yes here to add support for the APU tinysys. The tinsys is
+	  running on a micro processor in APU.
+	  Its firmware is load and boot from Kernel side. Kernel and tinysys use
+	  IPI to tx/rx messages.
+
+config MTK_APU_DEBUG
+	tristate "MediaTek APUSYS debug functions"
+	depends on MTK_APU
+	help
+	  Say yes here to enalbe debug on APUSYS.
+	  Disable it if you don't need them.
+
 config MTK_CMDQ
 	tristate "MediaTek CMDQ Support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/soc/mediatek/apusys/Makefile b/drivers/soc/mediatek/apusys/Makefile
index 8821c0f0b7b7..6b5249ec7064 100644
--- a/drivers/soc/mediatek/apusys/Makefile
+++ b/drivers/soc/mediatek/apusys/Makefile
@@ -1,2 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_MTK_APU_PM) += mtk-apu-pm.o
+
+obj-$(CONFIG_MTK_APU) += apu.o
+apu-objs += apu-core.o
diff --git a/drivers/soc/mediatek/apusys/apu-core.c b/drivers/soc/mediatek/apusys/apu-core.c
new file mode 100644
index 000000000000..c1db2394307f
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-core.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+#include "apu-core.h"
+
+#define APUSYS_DEV_NAME "apusys"
+
+static struct apusys_core_info g_core_info;
+
+/*
+ * init function at other modulses
+ * call init function in order at apu.ko init stage
+ */
+static int (*apusys_init_func[])(struct apusys_core_info *) = {
+};
+
+/*
+ * exit function at other modulses
+ * call exit function in order at apu.ko exit stage
+ */
+static void (*apusys_exit_func[])(void) = {
+};
+
+static void create_dbg_root(void)
+{
+	g_core_info.dbg_root = debugfs_create_dir(APUSYS_DEV_NAME, NULL);
+
+	/* check dbg root create status */
+	if (IS_ERR_OR_NULL(g_core_info.dbg_root))
+		pr_info("failed to create debug dir.\n");
+}
+
+static void destroy_dbg_root(void)
+{
+	debugfs_remove_recursive(g_core_info.dbg_root);
+}
+
+static int __init apusys_init(void)
+{
+	int i, j, ret = 0;
+	int func_num = sizeof(apusys_init_func) / sizeof(int *);
+
+	/* init apusys_dev */
+	create_dbg_root();
+
+	/* call init func */
+	for (i = 0; i < func_num; i++) {
+		if (!apusys_init_func[i])
+			break;
+
+		ret = apusys_init_func[i](&g_core_info);
+		if (ret) {
+			pr_info("init function(%d) fail(%d)", i, ret);
+
+			/* exit device */
+			for (j = i - 1; j >= 0; j--)
+				apusys_exit_func[j]();
+
+			destroy_dbg_root();
+			break;
+		}
+	}
+
+	return 0;
+}
+
+static void __exit apusys_exit(void)
+{
+	int func_num = sizeof(apusys_exit_func) / sizeof(int *);
+	int i;
+
+	/* call release func */
+	for (i = 0; i < func_num; i++) {
+		if (!apusys_exit_func[i])
+			break;
+
+		apusys_exit_func[i]();
+	}
+
+	destroy_dbg_root();
+}
+
+module_init(apusys_init);
+module_exit(apusys_exit);
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/mediatek/apusys/apu-core.h b/drivers/soc/mediatek/apusys/apu-core.h
new file mode 100644
index 000000000000..bac730bbc7ea
--- /dev/null
+++ b/drivers/soc/mediatek/apusys/apu-core.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+#ifndef APU_CORE_H
+#define APU_CORE_H
+
+struct apusys_core_info {
+	struct dentry *dbg_root;
+};
+#endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
