Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B04C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 10:25:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31301207ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 10:25:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XcUMVZ2W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HUxgxgNr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31301207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sr/76ecMdZ32mXo+79faNKtnJGNG9ZRZxwgy3gprt74=; b=XcUMVZ2W/HreTJ
	0bojswlFecK7Z/CtchJwXHjzr58QZajqOVI8RUSF7deGHN1+7Mp5Fnr63hEE2kCy4naQVzSSvAQ1I
	3fiEUWQqMks0PlWpii+TnqRzDe9QeaAqNa5l2rUWqxJGnGuupU3ULaoknvKk57Rtzm4upPDRkAGrb
	fi5At4mSjgyuw1RlibTRnyhzUKDpW9Pd+FKKyWfxODCUVeu6O5w8WN+WX1QcQruLawdjhJZSftVwm
	vu4XUL3A238Cw/svMfvBY7fT/SXX5VcHfkwJZl1uTpMh75trlNXDiPkE58OILu+VUSKgacNjuAWpT
	Ti+49D7f36fZXMi94Qbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jibRX-0003mS-Hr; Tue, 09 Jun 2020 10:25:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jibQz-0003Ey-5P; Tue, 09 Jun 2020 10:24:51 +0000
X-UUID: e34d14bbbd4f4812986301b8f7bd9823-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=e4RQaGCdlkfFoYLE7hTu3wJhro4b3MNKFPXh2iwfQPU=; 
 b=HUxgxgNrdyi/wh4p/8FnL9EQ95y0VdF9j9GP3nucbQjr7HMABv9/FkAmbE54AwzN9t3uCp1T+lYGT9IxVoM9gibp/+plNrx74yDsXwQv/M7sHXemaPbc0yTrJN5r1l1yvMqufgkNRPLtiJO3NtmsqWtTwS7KwYkaEhsu2XOmtXI=;
X-UUID: e34d14bbbd4f4812986301b8f7bd9823-20200609
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 519537090; Tue, 09 Jun 2020 02:24:39 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 03:24:31 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 18:24:31 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 9 Jun 2020 18:24:30 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] soc: mediatek: devapc: add devapc-mt6873 driver
Date: Tue, 9 Jun 2020 18:24:21 +0800
Message-ID: <1591698261-22639-3-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1591698261-22639-1-git-send-email-neal.liu@mediatek.com>
References: <1591698261-22639-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT6873 bus frabric provides TrustZone security support and data
protection to prevent slaves from being accessed by unexpected
masters.
The security violations are logged and sent to the processor for
further analysis or countermeasures.

Any occurrence of security violation would raise an interrupt, and
it will be handled by devapc-mt6873 driver. The violation
information is printed in order to find the murderer.

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
---
 drivers/soc/mediatek/Kconfig                      |    6 +
 drivers/soc/mediatek/Makefile                     |    1 +
 drivers/soc/mediatek/devapc/Kconfig               |   25 +
 drivers/soc/mediatek/devapc/Makefile              |   13 +
 drivers/soc/mediatek/devapc/devapc-mt6873.c       | 1733 +++++++++++++++++++++
 drivers/soc/mediatek/devapc/devapc-mt6873.h       |  130 ++
 drivers/soc/mediatek/devapc/devapc-mtk-multi-ao.c | 1019 ++++++++++++
 drivers/soc/mediatek/devapc/devapc-mtk-multi-ao.h |  183 +++
 include/linux/soc/mediatek/devapc_public.h        |   41 +
 9 files changed, 3151 insertions(+)
 create mode 100644 drivers/soc/mediatek/devapc/Kconfig
 create mode 100644 drivers/soc/mediatek/devapc/Makefile
 create mode 100644 drivers/soc/mediatek/devapc/devapc-mt6873.c
 create mode 100644 drivers/soc/mediatek/devapc/devapc-mt6873.h
 create mode 100644 drivers/soc/mediatek/devapc/devapc-mtk-multi-ao.c
 create mode 100644 drivers/soc/mediatek/devapc/devapc-mtk-multi-ao.h
 create mode 100644 include/linux/soc/mediatek/devapc_public.h

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index 2114b56..cc46f50 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -44,4 +44,10 @@ config MTK_SCPSYS
 	  Say yes here to add support for the MediaTek SCPSYS power domain
 	  driver.
 
+menu "Security"
+
+source "drivers/soc/mediatek/devapc/Kconfig"
+
+endmenu # Security
+
 endmenu
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index b017330..7154a2a 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
 obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
 obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
 obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
+obj-$(CONFIG_MTK_DEVAPC) += devapc/
diff --git a/drivers/soc/mediatek/devapc/Kconfig b/drivers/soc/mediatek/devapc/Kconfig
new file mode 100644
index 0000000..9428360
--- /dev/null
+++ b/drivers/soc/mediatek/devapc/Kconfig
@@ -0,0 +1,25 @@
+config MTK_DEVAPC
+	tristate "Mediatek Device APC Support"
+	help
+	  Device APC is a kernel driver controlling internal device security.
+	  If someone tries to access a device, which is not allowed by the
+	  device, it cannot access the device and will get a violation
+	  interrupt. Device APC prevents malicious access to internal devices.
+
+config DEVAPC_ARCH_MULTI
+	tristate "Mediatek Device APC driver architecture multi"
+	help
+	  Say yes here to enable support Mediatek
+	  Device APC driver which is based on Infra
+	  architecture.
+	  This architecture supports multiple Infra AO.
+
+config DEVAPC_MT6873
+	tristate "Mediatek MT6873 Device APC driver"
+	select MTK_DEVAPC
+	select DEVAPC_ARCH_MULTI
+	help
+	  Say yes here to enable support Mediatek MT6873
+	  Device APC driver.
+	  This driver is combined with DEVAPC_ARCH_MULTI for
+	  common handle flow.
diff --git a/drivers/soc/mediatek/devapc/Makefile b/drivers/soc/mediatek/devapc/Makefile
new file mode 100644
index 0000000..bd471f2
--- /dev/null
+++ b/drivers/soc/mediatek/devapc/Makefile
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ifeq ($(CONFIG_MTK_GCOV_KERNEL),y)
+GCOV_PROFILE := y
+endif
+
+obj-$(CONFIG_MTK_DEVAPC) := devapc.o
+
+# Core
+devapc-$(CONFIG_DEVAPC_ARCH_MULTI) += devapc-mtk-multi-ao.o
+
+# Platform
+devapc-$(CONFIG_DEVAPC_MT6873) += devapc-mt6873.o
diff --git a/drivers/soc/mediatek/devapc/devapc-mt6873.c b/drivers/soc/mediatek/devapc/devapc-mt6873.c
new file mode 100644
index 0000000..5181897
--- /dev/null
+++ b/drivers/soc/mediatek/devapc/devapc-mt6873.c
@@ -0,0 +1,1733 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ */
+
+#include <linux/bug.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <asm-generic/io.h>
+
+#include "devapc-mt6873.h"
+#include "devapc-mtk-multi-ao.h"
+
+static struct mtk_device_info mt6873_devices_infra[] = {
+	/* sys_idx, ctrl_idx, vio_idx, device, vio_irq */
+	/* 0 */
+	{0, 0, 0, "MFGSYS", true},
+	{0, 1, 1, "MFGSYS", true},
+	{0, 2, 2, "MFGSYS", true},
+	{0, 3, 3, "MFGSYS", true},
+	{0, 4, 4, "MFGSYS", true},
+	{0, 5, 5, "MFGSYS", true},
+	{0, 6, 6, "MFGSYS", true},
+	{0, 7, 7, "MFGSYS", true},
+	{0, 8, 8, "MFGSYS", true},
+	{0, 9, 9, "APUSYS", true},
+
+	/* 10 */
+	{0, 10, 10, "APUSYS", true},
+	{0, 11, 11, "APUSYS", true},
+	{0, 12, 12, "APUSYS", true},
+	{0, 13, 13, "APUSYS", true},
+	{0, 14, 14, "APUSYS", true},
+	{0, 15, 15, "MCUSYS_CFGREG_APB_S", true},
+	{0, 16, 16, "MCUSYS_CFGREG_APB_S-1", true},
+	{0, 17, 17, "MCUSYS_CFGREG_APB_S-2", true},
+	{0, 18, 18, "MCUSYS_CFGREG_APB_S-3", true},
+	{0, 19, 19, "MCUSYS_CFGREG_APB_S-4", true},
+
+	/* 20 */
+	{0, 20, 20, "L3C_S", true},
+	{0, 21, 21, "L3C_S-1", true},
+	{0, 22, 352, "PCIE_AXI_S", true},
+	{1, 0, 22, "MMSYS", true},
+	{1, 1, 23, "MMSYS_DISP", true},
+	{1, 2, 24, "SMI", true},
+	{1, 3, 25, "SMI", true},
+	{1, 4, 26, "SMI", true},
+	{1, 5, 27, "MMSYS_DISP", true},
+	{1, 6, 28, "MMSYS_DISP", true},
+
+	/* 30 */
+	{1, 7, 29, "MMSYS_DISP", true},
+	{1, 8, 30, "MMSYS_DISP", true},
+	{1, 9, 31, "MMSYS_DISP", true},
+	{1, 10, 32, "MMSYS_DISP", true},
+	{1, 11, 33, "MMSYS_DISP", true},
+	{1, 12, 34, "MMSYS_DISP", true},
+	{1, 13, 35, "MMSYS_DISP", true},
+	{1, 14, 36, "MMSYS_DISP", true},
+	{1, 15, 37, "MMSYS_DISP", true},
+	{1, 16, 38, "MMSYS_DISP", true},
+
+	/* 40 */
+	{1, 17, 39, "MMSYS_DISP", true},
+	{1, 18, 40, "MMSYS_DISP", true},
+	{1, 19, 41, "MMSYS_DISP", true},
+	{1, 20, 42, "MMSYS_DISP", true},
+	{1, 21, 43, "MMSYS_DISP", true},
+	{1, 22, 44, "MMSYS_DISP", true},
+	{1, 23, 45, "MMSYS_MDP", true},
+	{1, 24, 46, "MMSYS_MDP", true},
+	{1, 25, 47, "MMSYS_MDP", true},
+	{1, 26, 48, "MMSYS_MDP", true},
+
+	/* 50 */
+	{1, 27, 49, "MMSYS_MDP", true},
+	{1, 28, 50, "MMSYS_MDP", true},
+	{1, 29, 51, "MMSYS_IOMMU", true},
+	{1, 30, 52, "MMSYS_IOMMU", true},
+	{1, 31, 53, "MMSYS_IOMMU", true},
+	{1, 32, 54, "MMSYS_IOMMU", true},
+	{1, 33, 55, "MMSYS_IOMMU", true},
+	{1, 34, 56, "SMI", true},
+	{1, 35, 57, "SMI", true},
+	{1, 36, 58, "SMI", true},
+
+	/* 60 */
+	{1, 37, 59, "SMI", true},
+	{1, 38, 60, "MMSYS", true},
+	{1, 39, 61, "MMSYS", true},
+	{1, 40, 62, "IMGSYS", true},
+	{1, 41, 63, "IMGSYS", true},
+	{1, 42, 64, "IMGSYS", true},
+	{1, 43, 65, "IMGSYS", true},
+	{1, 44, 66, "IMGSYS", true},
+	{1, 45, 67, "IMGSYS", true},
+	{1, 46, 68, "IMGSYS", true},
+
+	/* 70 */
+	{1, 47, 69, "IMGSYS", true},
+	{1, 48, 70, "IMGSYS", true},
+	{1, 49, 71, "IMGSYS", true},
+	{1, 50, 72, "IMGSYS", true},
+	{1, 51, 73, "IMGSYS", true},
+	{1, 52, 74, "IMGSYS", true},
+	{1, 53, 75, "IMGSYS", true},
+	{1, 54, 76, "SMI", true},
+	{1, 55, 77, "IMGSYS", true},
+	{1, 56, 78, "IMGSYS", true},
+
+	/* 80 */
+	{1, 57, 79, "IMGSYS", true},
+	{1, 58, 80, "IMGSYS", true},
+	{1, 59, 81, "IMGSYS", true},
+	{1, 60, 82, "IMGSYS", true},
+	{1, 61, 83, "IMGSYS", true},
+	{1, 62, 84, "IMGSYS", true},
+	{1, 63, 85, "IMGSYS", true},
+	{1, 64, 86, "IMGSYS", true},
+	{1, 65, 87, "IMGSYS", true},
+	{1, 66, 88, "IMGSYS", true},
+
+	/* 90 */
+	{1, 67, 89, "IMGSYS", true},
+	{1, 68, 90, "IMGSYS", true},
+	{1, 69, 91, "IMGSYS", true},
+	{1, 70, 92, "IMGSYS", true},
+	{1, 71, 93, "IMGSYS", true},
+	{1, 72, 94, "IMGSYS", true},
+	{1, 73, 95, "IMGSYS", true},
+	{1, 74, 96, "IMGSYS", true},
+	{1, 75, 97, "IMGSYS", true},
+	{1, 76, 98, "SMI", true},
+
+	/* 100 */
+	{1, 77, 99, "IMGSYS", true},
+	{1, 78, 100, "IMGSYS", true},
+	{1, 79, 101, "IMGSYS", true},
+	{1, 80, 102, "IMGSYS", true},
+	{1, 81, 103, "IMGSYS", true},
+	{1, 82, 104, "IMGSYS", true},
+	{1, 83, 105, "IMGSYS", true},
+	{1, 84, 106, "VDECSYS", true},
+	{1, 85, 107, "VDECSYS", true},
+	{1, 86, 108, "VDECSYS", true},
+
+	/* 110 */
+	{1, 87, 109, "VDECSYS", true},
+	{1, 88, 110, "VDECSYS", true},
+	{1, 89, 111, "VDECSYS", true},
+	{1, 90, 112, "VDECSYS", true},
+	{1, 91, 113, "VDECSYS", true},
+	{1, 92, 114, "VENCSYS", true},
+	{1, 93, 115, "VENCSYS", true},
+	{1, 94, 116, "VENCSYS", true},
+	{1, 95, 117, "VENCSYS", true},
+	{1, 96, 118, "VENCSYS", true},
+
+	/* 120 */
+	{1, 97, 119, "VENCSYS", true},
+	{1, 98, 120, "VENCSYS", true},
+	{1, 99, 121, "VENCSYS", true},
+	{1, 100, 122, "CAMSYS", true},
+	{1, 101, 123, "SMI", true},
+	{1, 102, 124, "SMI", true},
+	{1, 103, 125, "CAMSYS", true},
+	{1, 104, 126, "CAMSYS_SENINF", true},
+	{1, 105, 127, "CAMSYS_SENINF", true},
+	{1, 106, 128, "CAMSYS_SENINF", true},
+
+	/* 130 */
+	{1, 107, 129, "CAMSYS_SENINF", true},
+	{1, 108, 130, "CAMSYS_SENINF", true},
+	{1, 109, 131, "CAMSYS_SENINF", true},
+	{1, 110, 132, "CAMSYS_SENINF", true},
+	{1, 111, 133, "CAMSYS_SENINF", true},
+	{1, 112, 134, "SMI", true},
+	{1, 113, 135, "SMI", true},
+	{1, 114, 136, "CAMSYS", true},
+	{1, 115, 137, "SMI", true},
+	{1, 116, 138, "SMI", true},
+
+	/* 140 */
+	{1, 117, 139, "SMI", true},
+	{1, 118, 140, "CAMSYS", true},
+	{1, 119, 141, "CAMSYS", true},
+	{1, 120, 142, "CAMSYS", true},
+	{1, 121, 143, "CAMSYS", true},
+	{1, 122, 144, "CAMSYS", true},
+	{1, 123, 145, "CAMSYS", true},
+	{1, 124, 146, "CAMSYS", true},
+	{1, 125, 147, "CAMSYS", true},
+	{1, 126, 148, "CAMSYS", true},
+
+	/* 150 */
+	{1, 127, 149, "CAMSYS", true},
+	{1, 128, 150, "CAMSYS", true},
+	{1, 129, 151, "CAMSYS", true},
+	{1, 130, 152, "CAMSYS", true},
+	{1, 131, 153, "CAMSYS", true},
+	{1, 132, 154, "CAMSYS", true},
+	{1, 133, 155, "CAMSYS", true},
+	{1, 134, 156, "CAMSYS", true},
+	{1, 135, 157, "CAMSYS", true},
+	{1, 136, 158, "CAMSYS", true},
+
+	/* 160 */
+	{1, 137, 159, "CAMSYS", true},
+	{1, 138, 160, "CAMSYS", true},
+	{1, 139, 161, "CAMSYS", true},
+	{1, 140, 162, "CAMSYS", true},
+	{1, 141, 163, "CAMSYS", true},
+	{1, 142, 164, "CAMSYS", true},
+	{1, 143, 165, "CAMSYS", true},
+	{1, 144, 166, "CAMSYS", true},
+	{1, 145, 167, "CAMSYS", true},
+	{1, 146, 168, "CAMSYS", true},
+
+	/* 170 */
+	{1, 147, 169, "CAMSYS", true},
+	{1, 148, 170, "CAMSYS", true},
+	{1, 149, 171, "CAMSYS", true},
+	{1, 150, 172, "CAMSYS", true},
+	{1, 151, 173, "CAMSYS", true},
+	{1, 152, 174, "CAMSYS", true},
+	{1, 153, 175, "CAMSYS", true},
+	{1, 154, 176, "CAMSYS", true},
+	{1, 155, 177, "CAMSYS", true},
+	{1, 156, 178, "CAMSYS", true},
+
+	/* 180 */
+	{1, 157, 179, "CAMSYS", true},
+	{1, 158, 180, "CAMSYS", true},
+	{1, 159, 181, "CAMSYS", true},
+	{1, 160, 182, "CAMSYS", true},
+	{1, 161, 183, "CAMSYS", true},
+	{1, 162, 184, "CAMSYS", true},
+	{1, 163, 185, "CAMSYS", true},
+	{1, 164, 186, "CAMSYS", true},
+	{1, 165, 187, "CAMSYS", true},
+	{1, 166, 188, "CAMSYS", true},
+
+	/* 190 */
+	{1, 167, 189, "CAMSYS", true},
+	{1, 168, 190, "CAMSYS", true},
+	{1, 169, 191, "CAMSYS", true},
+	{1, 170, 192, "CAMSYS", true},
+	{1, 171, 193, "CAMSYS", true},
+	{1, 172, 194, "CAMSYS", true},
+	{1, 173, 195, "CAMSYS", true},
+	{1, 174, 196, "CAMSYS", true},
+	{1, 175, 197, "CAMSYS", true},
+	{1, 176, 198, "CAMSYS", true},
+
+	/* 200 */
+	{1, 177, 199, "CAMSYS", true},
+	{1, 178, 200, "CAMSYS", true},
+	{1, 179, 201, "CAMSYS", true},
+	{1, 180, 202, "CAMSYS", true},
+	{1, 181, 203, "CAMSYS", true},
+	{1, 182, 204, "CAMSYS", true},
+	{1, 183, 205, "CAMSYS", true},
+	{1, 184, 206, "CAMSYS", true},
+	{1, 185, 207, "CAMSYS", true},
+	{1, 186, 208, "CAMSYS", true},
+
+	/* 210 */
+	{1, 187, 209, "CAMSYS", true},
+	{1, 188, 210, "CAMSYS", true},
+	{1, 189, 211, "CAMSYS", true},
+	{1, 190, 212, "CAMSYS", true},
+	{1, 191, 213, "CAMSYS", true},
+	{1, 192, 214, "CAMSYS", true},
+	{1, 193, 215, "CAMSYS", true},
+	{1, 194, 216, "CAMSYS", true},
+	{1, 195, 217, "CAMSYS", true},
+	{1, 196, 218, "CAMSYS", true},
+
+	/* 220 */
+	{1, 197, 219, "CAMSYS", true},
+	{1, 198, 220, "CAMSYS", true},
+	{1, 199, 221, "CAMSYS", true},
+	{1, 200, 222, "CAMSYS", true},
+	{1, 201, 223, "CAMSYS", true},
+	{1, 202, 224, "CAMSYS", true},
+	{1, 203, 225, "CAMSYS", true},
+	{1, 204, 226, "CAMSYS", true},
+	{1, 205, 227, "CAMSYS", true},
+	{1, 206, 228, "CAMSYS", true},
+
+	/* 230 */
+	{1, 207, 229, "CAMSYS", true},
+	{1, 208, 230, "CAMSYS", true},
+	{1, 209, 231, "CAMSYS", true},
+	{1, 210, 232, "CAMSYS", true},
+	{1, 211, 233, "CAMSYS", true},
+	{1, 212, 234, "CAMSYS", true},
+	{1, 213, 235, "CAMSYS", true},
+	{1, 214, 236, "CAMSYS", true},
+	{1, 215, 237, "CAMSYS", true},
+	{1, 216, 238, "CAMSYS", true},
+
+	/* 240 */
+	{1, 217, 239, "CAMSYS", true},
+	{1, 218, 240, "CAMSYS", true},
+	{1, 219, 241, "CAMSYS", true},
+	{1, 220, 242, "CAMSYS", true},
+	{1, 221, 243, "CAMSYS", true},
+	{1, 222, 244, "CAMSYS", true},
+	{1, 223, 245, "CAMSYS", true},
+	{1, 224, 246, "CAMSYS", true},
+	{1, 225, 247, "CAMSYS", true},
+	{1, 226, 248, "CAMSYS", true},
+
+	/* 250 */
+	{1, 227, 249, "CAMSYS", true},
+	{1, 228, 250, "CAMSYS", true},
+	{1, 229, 251, "CAMSYS", true},
+	{1, 230, 252, "CAMSYS", true},
+	{1, 231, 253, "CAMSYS", true},
+	{1, 232, 254, "CAMSYS", true},
+	{1, 233, 255, "CAMSYS", true},
+	{1, 234, 256, "CAMSYS", true},
+	{1, 235, 257, "CAMSYS", true},
+	{1, 236, 258, "CAMSYS", true},
+
+	/* 260 */
+	{1, 237, 259, "CAMSYS", true},
+	{1, 238, 260, "CAMSYS", true},
+	{1, 239, 261, "CAMSYS", true},
+	{1, 240, 262, "CAMSYS", true},
+	{1, 241, 263, "CAMSYS", true},
+	{1, 242, 264, "CAMSYS", true},
+	{1, 243, 265, "CAMSYS", true},
+	{1, 244, 266, "CAMSYS", true},
+	{1, 245, 267, "CAMSYS", true},
+	{1, 246, 268, "CAMSYS", true},
+
+	/* 270 */
+	{1, 247, 269, "CAMSYS", true},
+	{1, 248, 270, "CAMSYS", true},
+	{1, 249, 271, "CAMSYS", true},
+	{1, 250, 272, "CAMSYS", true},
+	{1, 251, 273, "CAMSYS", true},
+	{1, 252, 274, "CAMSYS", true},
+	{1, 253, 275, "CAMSYS", true},
+	{1, 254, 276, "CAMSYS", true},
+	{1, 255, 277, "CAMSYS", true},
+	{2, 0, 278, "CAMSYS", true},
+
+	/* 280 */
+	{2, 1, 279, "CAMSYS", true},
+	{2, 2, 280, "CAMSYS", true},
+	{2, 3, 281, "CAMSYS", true},
+	{2, 4, 282, "CAMSYS", true},
+	{2, 5, 283, "CAMSYS", true},
+	{2, 6, 284, "CAMSYS", true},
+	{2, 7, 285, "CAMSYS", true},
+	{2, 8, 286, "CAMSYS", true},
+	{2, 9, 287, "CAMSYS", true},
+	{2, 10, 288, "CAMSYS", true},
+
+	/* 290 */
+	{2, 11, 289, "CAMSYS", true},
+	{2, 12, 290, "CAMSYS", true},
+	{2, 13, 291, "CAMSYS", true},
+	{2, 14, 292, "CAMSYS", true},
+	{2, 15, 293, "CAMSYS", true},
+	{2, 16, 294, "CAMSYS", true},
+	{2, 17, 295, "CAMSYS_CCU", true},
+	{2, 18, 296, "CAMSYS_CCU", true},
+	{2, 19, 297, "CAMSYS_CCU", true},
+	{2, 20, 298, "CAMSYS_CCU", true},
+
+	/* 300 */
+	{2, 21, 299, "CAMSYS_CCU", true},
+	{2, 22, 300, "CAMSYS_CCU", true},
+	{2, 23, 301, "CAMSYS_CCU", true},
+	{2, 24, 302, "CAMSYS_CCU", true},
+	{2, 25, 303, "CAMSYS_CCU", true},
+	{2, 26, 304, "CAMSYS_CCU", true},
+	{2, 27, 305, "CAMSYS_CCU", true},
+	{2, 28, 306, "CAMSYS_CCU", true},
+	{2, 29, 307, "CAMSYS_CCU", true},
+	{2, 30, 308, "CAMSYS_CCU", true},
+
+	/* 310 */
+	{2, 31, 309, "CAMSYS_CCU", true},
+	{2, 32, 310, "CAMSYS_CCU", true},
+	{2, 33, 311, "CAMSYS_CCU", true},
+	{2, 34, 312, "CAMSYS_CCU", true},
+	{2, 35, 313, "CAMSYS_CCU", true},
+	{2, 36, 314, "CAMSYS_CCU", true},
+	{2, 37, 315, "CAMSYS_CCU", true},
+	{2, 38, 316, "CAMSYS_CCU", true},
+	{2, 39, 317, "CAMSYS_CCU", true},
+	{2, 40, 318, "IPESYS", true},
+
+	/* 320 */
+	{2, 41, 319, "IPESYS", true},
+	{2, 42, 320, "IPESYS", true},
+	{2, 43, 321, "IPESYS", true},
+	{2, 44, 322, "IPESYS", true},
+	{2, 45, 323, "SMI", true},
+	{2, 46, 324, "SMI", true},
+	{2, 47, 325, "IPESYS", true},
+	{2, 48, 326, "IPESYS", true},
+	{2, 49, 327, "IPESYS", true},
+	{2, 50, 328, "SMI", true},
+
+	/* 330 */
+	{2, 51, 329, "IPESYS", true},
+	{2, 52, 330, "MDPSYS", true},
+	{2, 53, 331, "MDPSYS", true},
+	{2, 54, 332, "SMI", true},
+	{2, 55, 333, "MDPSYS", true},
+	{2, 56, 334, "MDPSYS", true},
+	{2, 57, 335, "MDPSYS", true},
+	{2, 58, 336, "MDPSYS", true},
+	{2, 59, 337, "MDPSYS", true},
+	{2, 60, 338, "MDPSYS", true},
+
+	/* 340 */
+	{2, 61, 339, "MDPSYS", true},
+	{2, 62, 340, "MDPSYS", true},
+	{2, 63, 341, "MDPSYS", true},
+	{2, 64, 342, "MDPSYS", true},
+	{2, 65, 343, "MDPSYS", true},
+	{2, 66, 344, "MDPSYS", true},
+	{2, 67, 345, "MDPSYS", true},
+	{2, 68, 346, "MDPSYS", true},
+	{2, 69, 347, "MDPSYS", true},
+	{-1, -1, 355, "OOB_way_en", true},
+
+	/* 350 */
+	{-1, -1, 356, "OOB_way_en", true},
+	{-1, -1, 357, "OOB_way_en", true},
+	{-1, -1, 358, "OOB_way_en", true},
+	{-1, -1, 359, "OOB_way_en", true},
+	{-1, -1, 360, "OOB_way_en", true},
+	{-1, -1, 361, "OOB_way_en", true},
+	{-1, -1, 362, "OOB_way_en", true},
+	{-1, -1, 363, "OOB_way_en", true},
+	{-1, -1, 364, "OOB_way_en", true},
+	{-1, -1, 365, "OOB_way_en", true},
+
+	/* 360 */
+	{-1, -1, 366, "Decode_error", true},
+	{-1, -1, 367, "SRAMROM", true},
+	{-1, -1, 368, "CQDMA_SECURE", false},
+	{-1, -1, 369, "reserve", false},
+	{-1, -1, 370, "DEVICE_APC_INFRA_AO", false},
+	{-1, -1, 371, "DEVICE_APC_INFRA_PDN", false},
+
+};
+
+static struct mtk_device_info mt6873_devices_peri[] = {
+	/* sys_idx, ctrl_idx, vio_idx, device, vio_irq */
+	/* 0 */
+	{0, 0, 0, "SPM_APB_S", true},
+	{0, 1, 1, "SPM_APB_S-1", true},
+	{0, 2, 2, "SPM_APB_S-2", true},
+	{0, 3, 3, "SPM_APB_S-3", true},
+	{0, 4, 4, "SPM_APB_S-4", true},
+	{0, 5, 5, "APMIXEDSYS_APB_S", true},
+	{0, 6, 6, "APMIXEDSYS_APB_S-1", true},
+	{0, 7, 7, "TOPCKGEN_APB_S", true},
+	{0, 8, 8, "INFRACFG_AO_APB_S", true},
+	{0, 9, 9, "INFRACFG_AO_MEM_APB_S", true},
+
+	/* 10 */
+	{0, 10, 10, "PERICFG_AO_APB_S", true},
+	{0, 11, 11, "GPIO_APB_S", true},
+	{0, 12, 13, "TOPRGU_APB_S", true},
+	{0, 13, 14, "RESERVED_APB_S", true},
+	{0, 14, 15, "DEVICE_APC_INFRA_AO_APB_S", true},
+	{0, 15, 16, "BCRM_INFRA_AO_APB_S", true},
+	{0, 16, 17, "DEBUG_CTRL_INFRA_AO_APB_S", true},
+	{0, 17, 18, "DEVICE_APC_PERI_AO_APB_S", true},
+	{0, 18, 19, "BCRM_PERI_AO_APB_S", true},
+	{0, 19, 20, "DEBUG_CTRL_PERI_AO_APB_S", true},
+
+	/* 20 */
+	{0, 20, 21, "AP_CIRQ_EINT_APB_S", true},
+	{0, 21, 23, "PMIC_WRAP_APB_S", true},
+	{0, 22, 24, "DEVICE_APC_AO_MM_APB_S", true},
+	{0, 23, 25, "KP_APB_S", true},
+	{0, 24, 26, "TOP_MISC_APB_S", true},
+	{0, 25, 27, "DVFSRC_APB_S", true},
+	{0, 26, 28, "MBIST_AO_APB_S", true},
+	{0, 27, 29, "DPMAIF_AO_APB_S", true},
+	{0, 28, 30, "DEVICE_MPU_AO_APB_S", true},
+	{0, 29, 31, "SYS_TIMER_APB_S", true},
+
+	/* 30 */
+	{0, 30, 32, "MODEM_TEMP_SHARE_APB_S", true},
+	{0, 31, 33, "DEVICE_APC_AO_MD_APB_S", true},
+	{0, 32, 34, "PMIF1_APB_S", true},
+	{0, 33, 35, "PMICSPI_MST_APB_S", true},
+	{0, 34, 36, "TIA_APB_S", true},
+	{0, 35, 37, "TOPCKGEN_INFRA_CFG_APB_S", true},
+	{0, 36, 38, "DRM_DEBUG_TOP_APB_S", true},
+	{0, 37, 62, "PWR_MD32_S", true},
+	{0, 38, 63, "PWR_MD32_S-1", true},
+	{0, 39, 64, "PWR_MD32_S-2", true},
+
+	/* 40 */
+	{0, 40, 65, "PWR_MD32_S-3", true},
+	{0, 41, 66, "PWR_MD32_S-4", true},
+	{0, 42, 67, "PWR_MD32_S-5", true},
+	{0, 43, 68, "PWR_MD32_S-6", true},
+	{0, 44, 69, "PWR_MD32_S-7", true},
+	{0, 45, 70, "PWR_MD32_S-8", true},
+	{0, 46, 71, "PWR_MD32_S-9", true},
+	{0, 47, 72, "PWR_MD32_S-10", true},
+	{0, 48, 73, "AUDIO_S", true},
+	{0, 49, 74, "AUDIO_S-1", true},
+
+	/* 50 */
+	{0, 50, 119, "SSUSB_S", true},
+	{0, 51, 120, "SSUSB_S-1", true},
+	{0, 52, 121, "SSUSB_S-2", true},
+	{0, 53, 122, "UFS_S", true},
+	{0, 54, 123, "UFS_S-1", true},
+	{0, 55, 124, "UFS_S-2", true},
+	{0, 56, 125, "UFS_S-3", true},
+	{0, 57, 126, "DEBUGSYS_APB_S", true},
+	{0, 58, 127, "DRAMC_MD32_S0_APB_S", true},
+	{0, 59, 128, "DRAMC_MD32_S0_APB_S-1", true},
+
+	/* 60 */
+	{0, 60, 129, "DRAMC_MD32_S1_APB_S", true},
+	{0, 61, 130, "DRAMC_MD32_S1_APB_S-1", true},
+	{0, 62, 137, "NOR_AXI_S", true},
+	{0, 63, 143, "PCIE_AHB_S", true},
+	{0, 64, 144, "DRAMC_CH0_TOP0_APB_S", true},
+	{0, 65, 145, "DRAMC_CH0_TOP1_APB_S", true},
+	{0, 66, 146, "DRAMC_CH0_TOP2_APB_S", true},
+	{0, 67, 147, "DRAMC_CH0_TOP3_APB_S", true},
+	{0, 68, 148, "DRAMC_CH0_TOP4_APB_S", true},
+	{0, 69, 149, "DRAMC_CH0_TOP5_APB_S", true},
+
+	/* 70 */
+	{0, 70, 150, "DRAMC_CH0_TOP6_APB_S", true},
+	{0, 71, 151, "DRAMC_CH1_TOP0_APB_S", true},
+	{0, 72, 152, "DRAMC_CH1_TOP1_APB_S", true},
+	{0, 73, 153, "DRAMC_CH1_TOP2_APB_S", true},
+	{0, 74, 154, "DRAMC_CH1_TOP3_APB_S", true},
+	{0, 75, 155, "DRAMC_CH1_TOP4_APB_S", true},
+	{0, 76, 156, "DRAMC_CH1_TOP5_APB_S", true},
+	{0, 77, 157, "DRAMC_CH1_TOP6_APB_S", true},
+	{0, 78, 158, "DRAMC_CH2_TOP0_APB_S", true},
+	{0, 79, 159, "DRAMC_CH2_TOP1_APB_S", true},
+
+	/* 80 */
+	{0, 80, 160, "DRAMC_CH2_TOP2_APB_S", true},
+	{0, 81, 161, "DRAMC_CH2_TOP3_APB_S", true},
+	{0, 82, 162, "DRAMC_CH2_TOP4_APB_S", true},
+	{0, 83, 163, "DRAMC_CH2_TOP5_APB_S", true},
+	{0, 84, 164, "DRAMC_CH2_TOP6_APB_S", true},
+	{0, 85, 165, "DRAMC_CH3_TOP0_APB_S", true},
+	{0, 86, 166, "DRAMC_CH3_TOP1_APB_S", true},
+	{0, 87, 167, "DRAMC_CH3_TOP2_APB_S", true},
+	{0, 88, 168, "DRAMC_CH3_TOP3_APB_S", true},
+	{0, 89, 169, "DRAMC_CH3_TOP4_APB_S", true},
+
+	/* 90 */
+	{0, 90, 170, "DRAMC_CH3_TOP5_APB_S", true},
+	{0, 91, 171, "DRAMC_CH3_TOP6_APB_S", true},
+	{0, 92, 174, "CCIF2_AP_APB_S", true},
+	{0, 93, 175, "CCIF2_MD_APB_S", true},
+	{0, 94, 176, "CCIF3_AP_APB_S", true},
+	{0, 95, 177, "CCIF3_MD_APB_S", true},
+	{0, 96, 178, "CCIF4_AP_APB_S", true},
+	{0, 97, 179, "CCIF4_MD_APB_S", true},
+	{0, 98, 180, "INFRA_BUS_TRACE_APB_S", true},
+	{0, 99, 181, "CCIF5_AP_APB_S", true},
+
+	/* 100 */
+	{0, 100, 182, "CCIF5_MD_APB_S", true},
+	{0, 101, 183, "SSC_INFRA_APB0_S", true},
+	{0, 102, 184, "SSC_INFRA_APB1_S", true},
+	{0, 103, 185, "SSC_INFRA_APB2_S", true},
+	{0, 104, 186, "DEVICE_MPU_ACP_APB_S", true},
+	{1, 0, 39, "TINYSYS", true},
+	{1, 1, 40, "TINYSYS", true},
+	{1, 2, 41, "TINYSYS", true},
+	{1, 3, 42, "TINYSYS", true},
+	{1, 4, 43, "TINYSYS", true},
+
+	/* 110 */
+	{1, 5, 44, "TINYSYS", true},
+	{1, 6, 45, "TINYSYS", true},
+	{1, 7, 46, "TINYSYS", true},
+	{1, 8, 47, "TINYSYS", true},
+	{1, 9, 48, "TINYSYS", true},
+	{1, 10, 49, "TINYSYS", true},
+	{1, 11, 50, "TINYSYS", true},
+	{1, 12, 51, "TINYSYS", true},
+	{1, 13, 52, "TINYSYS", true},
+	{1, 14, 53, "TINYSYS", true},
+
+	/* 120 */
+	{1, 15, 54, "TINYSYS", true},
+	{1, 16, 55, "TINYSYS", true},
+	{1, 17, 56, "TINYSYS", true},
+	{1, 18, 57, "TINYSYS", true},
+	{1, 19, 58, "TINYSYS", true},
+	{1, 20, 59, "TINYSYS", true},
+	{1, 21, 60, "TINYSYS", true},
+	{1, 22, 61, "TINYSYS", true},
+	{1, 23, 76, "MDSYS", true},
+	{1, 24, 77, "MDSYS", true},
+
+	/* 130 */
+	{1, 25, 78, "MDSYS", true},
+	{1, 26, 79, "MDSYS", true},
+	{1, 27, 80, "MDSYS", true},
+	{1, 28, 81, "MDSYS", true},
+	{1, 29, 82, "MDSYS", true},
+	{1, 30, 83, "MDSYS", true},
+	{1, 31, 84, "MDSYS", true},
+	{1, 32, 85, "MDSYS", true},
+	{1, 33, 86, "MDSYS", true},
+	{1, 34, 87, "MDSYS", true},
+
+	/* 140 */
+	{1, 35, 88, "MDSYS", true},
+	{1, 36, 89, "MDSYS", true},
+	{1, 37, 90, "MDSYS", true},
+	{1, 38, 91, "MDSYS", true},
+	{1, 39, 92, "MDSYS", true},
+	{1, 40, 93, "MDSYS", true},
+	{1, 41, 94, "MDSYS", true},
+	{1, 42, 95, "MDSYS", true},
+	{1, 43, 96, "MDSYS", true},
+	{1, 44, 97, "MDSYS", true},
+
+	/* 150 */
+	{1, 45, 98, "MDSYS", true},
+	{1, 46, 99, "MDSYS", true},
+	{1, 47, 100, "MDSYS", true},
+	{1, 48, 101, "MDSYS", true},
+	{1, 49, 102, "MDSYS", true},
+	{1, 50, 103, "MDSYS", true},
+	{1, 51, 104, "MDSYS", true},
+	{1, 52, 105, "MDSYS", true},
+	{1, 53, 106, "MDSYS", true},
+	{1, 54, 107, "MDSYS", true},
+
+	/* 160 */
+	{1, 55, 108, "MDSYS", true},
+	{1, 56, 109, "MDSYS", true},
+	{1, 57, 110, "MDSYS", true},
+	{1, 58, 111, "MDSYS", true},
+	{1, 59, 112, "MDSYS", true},
+	{1, 60, 113, "MDSYS", true},
+	{1, 61, 114, "MDSYS", true},
+	{1, 62, 115, "MDSYS", true},
+	{1, 63, 116, "MDSYS", true},
+	{1, 64, 117, "MDSYS", true},
+
+	/* 170 */
+	{1, 65, 118, "MDSYS", true},
+	{2, 0, 75, "CONNSYS", true},
+	{-1, -1, 187, "OOB_way_en", true},
+	{-1, -1, 188, "OOB_way_en", true},
+	{-1, -1, 189, "OOB_way_en", true},
+	{-1, -1, 190, "OOB_way_en", true},
+	{-1, -1, 191, "OOB_way_en", true},
+	{-1, -1, 192, "OOB_way_en", true},
+	{-1, -1, 193, "OOB_way_en", true},
+	{-1, -1, 194, "OOB_way_en", true},
+
+	/* 180 */
+	{-1, -1, 195, "OOB_way_en", true},
+	{-1, -1, 196, "OOB_way_en", true},
+	{-1, -1, 197, "OOB_way_en", true},
+	{-1, -1, 198, "OOB_way_en", true},
+	{-1, -1, 199, "OOB_way_en", true},
+	{-1, -1, 200, "OOB_way_en", true},
+	{-1, -1, 201, "OOB_way_en", true},
+	{-1, -1, 202, "OOB_way_en", true},
+	{-1, -1, 203, "OOB_way_en", true},
+	{-1, -1, 204, "OOB_way_en", true},
+
+	/* 190 */
+	{-1, -1, 205, "OOB_way_en", true},
+	{-1, -1, 206, "OOB_way_en", true},
+	{-1, -1, 207, "OOB_way_en", true},
+	{-1, -1, 208, "OOB_way_en", true},
+	{-1, -1, 209, "OOB_way_en", true},
+	{-1, -1, 210, "OOB_way_en", true},
+	{-1, -1, 211, "OOB_way_en", true},
+	{-1, -1, 212, "OOB_way_en", true},
+	{-1, -1, 213, "OOB_way_en", true},
+	{-1, -1, 214, "OOB_way_en", true},
+
+	/* 200 */
+	{-1, -1, 215, "OOB_way_en", true},
+	{-1, -1, 216, "OOB_way_en", true},
+	{-1, -1, 217, "OOB_way_en", true},
+	{-1, -1, 218, "OOB_way_en", true},
+	{-1, -1, 219, "OOB_way_en", true},
+	{-1, -1, 220, "OOB_way_en", true},
+	{-1, -1, 221, "OOB_way_en", true},
+	{-1, -1, 222, "OOB_way_en", true},
+	{-1, -1, 223, "OOB_way_en", true},
+	{-1, -1, 224, "OOB_way_en", true},
+
+	/* 210 */
+	{-1, -1, 225, "OOB_way_en", true},
+	{-1, -1, 226, "OOB_way_en", true},
+	{-1, -1, 227, "OOB_way_en", true},
+	{-1, -1, 228, "OOB_way_en", true},
+	{-1, -1, 229, "OOB_way_en", true},
+	{-1, -1, 230, "OOB_way_en", true},
+	{-1, -1, 231, "OOB_way_en", true},
+	{-1, -1, 232, "OOB_way_en", true},
+	{-1, -1, 233, "OOB_way_en", true},
+	{-1, -1, 234, "OOB_way_en", true},
+
+	/* 220 */
+	{-1, -1, 235, "OOB_way_en", true},
+	{-1, -1, 236, "OOB_way_en", true},
+	{-1, -1, 237, "OOB_way_en", true},
+	{-1, -1, 238, "OOB_way_en", true},
+	{-1, -1, 239, "OOB_way_en", true},
+	{-1, -1, 240, "OOB_way_en", true},
+	{-1, -1, 241, "OOB_way_en", true},
+	{-1, -1, 242, "OOB_way_en", true},
+	{-1, -1, 243, "OOB_way_en", true},
+	{-1, -1, 244, "OOB_way_en", true},
+
+	/* 230 */
+	{-1, -1, 245, "OOB_way_en", true},
+	{-1, -1, 246, "OOB_way_en", true},
+	{-1, -1, 247, "OOB_way_en", true},
+	{-1, -1, 248, "OOB_way_en", true},
+	{-1, -1, 249, "OOB_way_en", true},
+	{-1, -1, 250, "OOB_way_en", true},
+	{-1, -1, 251, "OOB_way_en", true},
+	{-1, -1, 252, "OOB_way_en", true},
+	{-1, -1, 253, "OOB_way_en", true},
+	{-1, -1, 254, "OOB_way_en", true},
+
+	/* 240 */
+	{-1, -1, 255, "OOB_way_en", true},
+	{-1, -1, 256, "OOB_way_en", true},
+	{-1, -1, 257, "OOB_way_en", true},
+	{-1, -1, 258, "OOB_way_en", true},
+	{-1, -1, 259, "OOB_way_en", true},
+	{-1, -1, 260, "OOB_way_en", true},
+	{-1, -1, 261, "OOB_way_en", true},
+	{-1, -1, 262, "OOB_way_en", true},
+	{-1, -1, 263, "OOB_way_en", true},
+	{-1, -1, 264, "OOB_way_en", true},
+
+	/* 250 */
+	{-1, -1, 265, "OOB_way_en", true},
+	{-1, -1, 266, "OOB_way_en", true},
+	{-1, -1, 267, "OOB_way_en", true},
+	{-1, -1, 268, "OOB_way_en", true},
+	{-1, -1, 269, "OOB_way_en", true},
+	{-1, -1, 270, "OOB_way_en", true},
+	{-1, -1, 271, "OOB_way_en", true},
+	{-1, -1, 272, "OOB_way_en", true},
+	{-1, -1, 273, "OOB_way_en", true},
+	{-1, -1, 274, "OOB_way_en", true},
+
+	/* 260 */
+	{-1, -1, 275, "OOB_way_en", true},
+	{-1, -1, 276, "OOB_way_en", true},
+	{-1, -1, 277, "OOB_way_en", true},
+	{-1, -1, 278, "OOB_way_en", true},
+	{-1, -1, 279, "OOB_way_en", true},
+	{-1, -1, 280, "OOB_way_en", true},
+	{-1, -1, 281, "OOB_way_en", true},
+	{-1, -1, 282, "OOB_way_en", true},
+	{-1, -1, 283, "OOB_way_en", true},
+	{-1, -1, 284, "OOB_way_en", true},
+
+	/* 270 */
+	{-1, -1, 285, "OOB_way_en", true},
+	{-1, -1, 286, "Decode_error", true},
+	{-1, -1, 287, "Decode_error", true},
+	{-1, -1, 288, "Decode_error", true},
+	{-1, -1, 289, "Decode_error", true},
+	{-1, -1, 290, "Decode_error", true},
+	{-1, -1, 291, "Decode_error", true},
+	{-2, -2, 292, "MDP_MALI", true},
+	{-1, -1, 293, "reserve", false},
+	{-2, -2, 294, "MMSYS_MALI", true},
+
+	/* 280 */
+	{-1, -1, 295, "PMIC_WRAP", false},
+	{-1, -1, 296, "PMIF1", false},
+	{-1, -1, 297, "DEVICE_APC_PERI_AO", false},
+	{-1, -1, 298, "DEVICE_APC_PERI_PDN", false},
+
+};
+
+static struct mtk_device_info mt6873_devices_peri2[] = {
+	/* sys_idx, ctrl_idx, vio_idx, device, vio_irq */
+	/* 0 */
+	{0, 0, 0, "EFUSE_DEBUG_AO_APB_S", true},
+	{0, 1, 1, "APXGPT_APB_S", true},
+	{0, 2, 2, "SEJ_APB_S", true},
+	{0, 3, 3, "AES_TOP0_APB_S", true},
+	{0, 4, 4, "SECURITY_AO_APB_S", true},
+	{0, 5, 5, "DEVICE_APC_PERI_AO2_APB_S", true},
+	{0, 6, 6, "BCRM_PERI_AO2_APB_S", true},
+	{0, 7, 7, "DEBUG_CTRL_PERI_AO2_APB_S", true},
+	{0, 8, 8, "SPMI_MST_APB_S", true},
+	{0, 9, 9, "DEBUG_CTRL_FMEM_AO_APB_S", true},
+
+	/* 10 */
+	{0, 10, 10, "BCRM_FMEM_AO_APB_S", true},
+	{0, 11, 11, "DEVICE_APC_FMEM_AO_APB_S", true},
+	{0, 12, 12, "PWM_APB_S", true},
+	{0, 13, 13, "GCE_APB_S", true},
+	{0, 14, 14, "GCE_APB_S-1", true},
+	{0, 15, 15, "GCE_APB_S-2", true},
+	{0, 16, 16, "GCE_APB_S-3", true},
+	{0, 17, 17, "DPMAIF_PDN_APB_S", true},
+	{0, 18, 18, "DPMAIF_PDN_APB_S-1", true},
+	{0, 19, 19, "DPMAIF_PDN_APB_S-2", true},
+
+	/* 20 */
+	{0, 20, 20, "DPMAIF_PDN_APB_S-3", true},
+	{0, 21, 21, "BND_EAST_APB0_S", true},
+	{0, 22, 22, "BND_EAST_APB1_S", true},
+	{0, 23, 23, "BND_EAST_APB2_S", true},
+	{0, 24, 24, "BND_EAST_APB3_S", true},
+	{0, 25, 25, "BND_EAST_APB4_S", true},
+	{0, 26, 26, "BND_EAST_APB5_S", true},
+	{0, 27, 27, "BND_EAST_APB6_S", true},
+	{0, 28, 28, "BND_EAST_APB7_S", true},
+	{0, 29, 29, "BND_EAST_APB8_S", true},
+
+	/* 30 */
+	{0, 30, 30, "BND_EAST_APB9_S", true},
+	{0, 31, 31, "BND_EAST_APB10_S", true},
+	{0, 32, 32, "BND_EAST_APB11_S", true},
+	{0, 33, 33, "BND_EAST_APB12_S", true},
+	{0, 34, 34, "BND_EAST_APB13_S", true},
+	{0, 35, 35, "BND_EAST_APB14_S", true},
+	{0, 36, 36, "BND_EAST_APB15_S", true},
+	{0, 37, 37, "BND_WEST_APB0_S", true},
+	{0, 38, 38, "BND_WEST_APB1_S", true},
+	{0, 39, 39, "BND_WEST_APB2_S", true},
+
+	/* 40 */
+	{0, 40, 40, "BND_WEST_APB3_S", true},
+	{0, 41, 41, "BND_WEST_APB4_S", true},
+	{0, 42, 42, "BND_WEST_APB5_S", true},
+	{0, 43, 43, "BND_WEST_APB6_S", true},
+	{0, 44, 44, "BND_WEST_APB7_S", true},
+	{0, 45, 45, "BND_NORTH_APB0_S", true},
+	{0, 46, 46, "BND_NORTH_APB1_S", true},
+	{0, 47, 47, "BND_NORTH_APB2_S", true},
+	{0, 48, 48, "BND_NORTH_APB3_S", true},
+	{0, 49, 49, "BND_NORTH_APB4_S", true},
+
+	/* 50 */
+	{0, 50, 50, "BND_NORTH_APB5_S", true},
+	{0, 51, 51, "BND_NORTH_APB6_S", true},
+	{0, 52, 52, "BND_NORTH_APB7_S", true},
+	{0, 53, 53, "BND_NORTH_APB8_S", true},
+	{0, 54, 54, "BND_NORTH_APB9_S", true},
+	{0, 55, 55, "BND_NORTH_APB10_S", true},
+	{0, 56, 56, "BND_NORTH_APB11_S", true},
+	{0, 57, 57, "BND_NORTH_APB12_S", true},
+	{0, 58, 58, "BND_NORTH_APB13_S", true},
+	{0, 59, 59, "BND_NORTH_APB14_S", true},
+
+	/* 60 */
+	{0, 60, 60, "BND_NORTH_APB15_S", true},
+	{0, 61, 61, "BND_SOUTH_APB0_S", true},
+	{0, 62, 62, "BND_SOUTH_APB1_S", true},
+	{0, 63, 63, "BND_SOUTH_APB2_S", true},
+	{0, 64, 64, "BND_SOUTH_APB3_S", true},
+	{0, 65, 65, "BND_SOUTH_APB4_S", true},
+	{0, 66, 66, "BND_SOUTH_APB5_S", true},
+	{0, 67, 67, "BND_SOUTH_APB6_S", true},
+	{0, 68, 68, "BND_SOUTH_APB7_S", true},
+	{0, 69, 69, "BND_SOUTH_APB8_S", true},
+
+	/* 70 */
+	{0, 70, 70, "BND_SOUTH_APB9_S", true},
+	{0, 71, 71, "BND_SOUTH_APB10_S", true},
+	{0, 72, 72, "BND_SOUTH_APB11_S", true},
+	{0, 73, 73, "BND_SOUTH_APB12_S", true},
+	{0, 74, 74, "BND_SOUTH_APB13_S", true},
+	{0, 75, 75, "BND_SOUTH_APB14_S", true},
+	{0, 76, 76, "BND_SOUTH_APB15_S", true},
+	{0, 77, 77, "BND_EAST_NORTH_APB0_S", true},
+	{0, 78, 78, "BND_EAST_NORTH_APB1_S", true},
+	{0, 79, 79, "BND_EAST_NORTH_APB2_S", true},
+
+	/* 80 */
+	{0, 80, 80, "BND_EAST_NORTH_APB3_S", true},
+	{0, 81, 81, "BND_EAST_NORTH_APB4_S", true},
+	{0, 82, 82, "BND_EAST_NORTH_APB5_S", true},
+	{0, 83, 83, "BND_EAST_NORTH_APB6_S", true},
+	{0, 84, 84, "BND_EAST_NORTH_APB7_S", true},
+	{0, 85, 85, "SYS_CIRQ_APB_S", true},
+	{0, 86, 86, "EFUSE_DEBUG_PDN_APB_S", true},
+	{0, 87, 87, "DEVICE_APC_INFRA_PDN_APB_S", true},
+	{0, 88, 88, "DEBUG_TRACKER_APB_S", true},
+	{0, 89, 89, "CCIF0_AP_APB_S", true},
+
+	/* 90 */
+	{0, 90, 90, "CCIF0_MD_APB_S", true},
+	{0, 91, 91, "CCIF1_AP_APB_S", true},
+	{0, 92, 92, "CCIF1_MD_APB_S", true},
+	{0, 93, 93, "MBIST_PDN_APB_S", true},
+	{0, 94, 94, "INFRACFG_PDN_APB_S", true},
+	{0, 95, 95, "TRNG_APB_S", true},
+	{0, 96, 96, "DX_CC_APB_S", true},
+	{0, 97, 97, "CQ_DMA_APB_S", true},
+	{0, 98, 98, "SRAMROM_APB_S", true},
+	{0, 99, 99, "INFRACFG_MEM_APB_S", true},
+
+	/* 100 */
+	{0, 100, 100, "RESERVED_DVFS_PROC_APB_S", true},
+	{0, 101, 103, "SYS_CIRQ1_APB_S", true},
+	{0, 102, 104, "SYS_CIRQ2_APB_S", true},
+	{0, 103, 105, "DEBUG_TRACKER_APB1_S", true},
+	{0, 104, 106, "EMI_APB_S", true},
+	{0, 105, 107, "EMI_MPU_APB_S", true},
+	{0, 106, 108, "DEVICE_MPU_PDN_APB_S", true},
+	{0, 107, 109, "APDMA_APB_S", true},
+	{0, 108, 110, "DEBUG_TRACKER_APB2_S", true},
+	{0, 109, 111, "BCRM_INFRA_PDN_APB_S", true},
+
+	/* 110 */
+	{0, 110, 112, "BCRM_PERI_PDN_APB_S", true},
+	{0, 111, 113, "BCRM_PERI_PDN2_APB_S", true},
+	{0, 112, 114, "DEVICE_APC_PERI_PDN_APB_S", true},
+	{0, 113, 115, "DEVICE_APC_PERI_PDN2_APB_S", true},
+	{0, 114, 116, "BCRM_FMEM_PDN_APB_S", true},
+	{-1, -1, 117, "OOB_way_en", true},
+	{-1, -1, 118, "OOB_way_en", true},
+	{-1, -1, 119, "OOB_way_en", true},
+	{-1, -1, 120, "OOB_way_en", true},
+	{-1, -1, 121, "OOB_way_en", true},
+
+	/* 120 */
+	{-1, -1, 122, "OOB_way_en", true},
+	{-1, -1, 123, "OOB_way_en", true},
+	{-1, -1, 124, "OOB_way_en", true},
+	{-1, -1, 125, "OOB_way_en", true},
+	{-1, -1, 126, "OOB_way_en", true},
+	{-1, -1, 127, "OOB_way_en", true},
+	{-1, -1, 128, "OOB_way_en", true},
+	{-1, -1, 129, "OOB_way_en", true},
+	{-1, -1, 130, "OOB_way_en", true},
+	{-1, -1, 131, "OOB_way_en", true},
+
+	/* 130 */
+	{-1, -1, 132, "OOB_way_en", true},
+	{-1, -1, 133, "OOB_way_en", true},
+	{-1, -1, 134, "OOB_way_en", true},
+	{-1, -1, 135, "OOB_way_en", true},
+	{-1, -1, 136, "OOB_way_en", true},
+	{-1, -1, 137, "OOB_way_en", true},
+	{-1, -1, 138, "OOB_way_en", true},
+	{-1, -1, 139, "OOB_way_en", true},
+	{-1, -1, 140, "OOB_way_en", true},
+	{-1, -1, 141, "OOB_way_en", true},
+
+	/* 140 */
+	{-1, -1, 142, "OOB_way_en", true},
+	{-1, -1, 143, "OOB_way_en", true},
+	{-1, -1, 144, "OOB_way_en", true},
+	{-1, -1, 145, "OOB_way_en", true},
+	{-1, -1, 146, "OOB_way_en", true},
+	{-1, -1, 147, "OOB_way_en", true},
+	{-1, -1, 148, "OOB_way_en", true},
+	{-1, -1, 149, "OOB_way_en", true},
+	{-1, -1, 150, "OOB_way_en", true},
+	{-1, -1, 151, "OOB_way_en", true},
+
+	/* 150 */
+	{-1, -1, 152, "OOB_way_en", true},
+	{-1, -1, 153, "OOB_way_en", true},
+	{-1, -1, 154, "OOB_way_en", true},
+	{-1, -1, 155, "OOB_way_en", true},
+	{-1, -1, 156, "OOB_way_en", true},
+	{-1, -1, 157, "OOB_way_en", true},
+	{-1, -1, 158, "OOB_way_en", true},
+	{-1, -1, 159, "OOB_way_en", true},
+	{-1, -1, 160, "OOB_way_en", true},
+	{-1, -1, 161, "OOB_way_en", true},
+
+	/* 160 */
+	{-1, -1, 162, "OOB_way_en", true},
+	{-1, -1, 163, "OOB_way_en", true},
+	{-1, -1, 164, "OOB_way_en", true},
+	{-1, -1, 165, "OOB_way_en", true},
+	{-1, -1, 166, "OOB_way_en", true},
+	{-1, -1, 167, "OOB_way_en", true},
+	{-1, -1, 168, "OOB_way_en", true},
+	{-1, -1, 169, "OOB_way_en", true},
+	{-1, -1, 170, "OOB_way_en", true},
+	{-1, -1, 171, "OOB_way_en", true},
+
+	/* 170 */
+	{-1, -1, 172, "OOB_way_en", true},
+	{-1, -1, 173, "OOB_way_en", true},
+	{-1, -1, 174, "OOB_way_en", true},
+	{-1, -1, 175, "OOB_way_en", true},
+	{-1, -1, 176, "OOB_way_en", true},
+	{-1, -1, 177, "OOB_way_en", true},
+	{-1, -1, 178, "OOB_way_en", true},
+	{-1, -1, 179, "OOB_way_en", true},
+	{-1, -1, 180, "OOB_way_en", true},
+	{-1, -1, 181, "OOB_way_en", true},
+
+	/* 180 */
+	{-1, -1, 182, "OOB_way_en", true},
+	{-1, -1, 183, "OOB_way_en", true},
+	{-1, -1, 184, "OOB_way_en", true},
+	{-1, -1, 185, "OOB_way_en", true},
+	{-1, -1, 186, "OOB_way_en", true},
+	{-1, -1, 187, "OOB_way_en", true},
+	{-1, -1, 188, "OOB_way_en", true},
+	{-1, -1, 189, "OOB_way_en", true},
+	{-1, -1, 190, "OOB_way_en", true},
+	{-1, -1, 191, "OOB_way_en", true},
+
+	/* 190 */
+	{-1, -1, 192, "OOB_way_en", true},
+	{-1, -1, 193, "OOB_way_en", true},
+	{-1, -1, 194, "OOB_way_en", true},
+	{-1, -1, 195, "OOB_way_en", true},
+	{-1, -1, 196, "OOB_way_en", true},
+	{-1, -1, 197, "OOB_way_en", true},
+	{-1, -1, 198, "OOB_way_en", true},
+	{-1, -1, 199, "OOB_way_en", true},
+	{-1, -1, 200, "OOB_way_en", true},
+	{-1, -1, 201, "OOB_way_en", true},
+
+	/* 200 */
+	{-1, -1, 202, "OOB_way_en", true},
+	{-1, -1, 203, "OOB_way_en", true},
+	{-1, -1, 204, "OOB_way_en", true},
+	{-1, -1, 205, "OOB_way_en", true},
+	{-1, -1, 206, "OOB_way_en", true},
+	{-1, -1, 207, "OOB_way_en", true},
+	{-1, -1, 208, "OOB_way_en", true},
+	{-1, -1, 209, "OOB_way_en", true},
+	{-1, -1, 210, "OOB_way_en", true},
+	{-1, -1, 211, "OOB_way_en", true},
+
+	/* 210 */
+	{-1, -1, 212, "OOB_way_en", true},
+	{-1, -1, 213, "OOB_way_en", true},
+	{-1, -1, 214, "OOB_way_en", true},
+	{-1, -1, 215, "OOB_way_en", true},
+	{-1, -1, 216, "OOB_way_en", true},
+	{-1, -1, 217, "OOB_way_en", true},
+	{-1, -1, 218, "OOB_way_en", true},
+	{-1, -1, 219, "OOB_way_en", true},
+	{-1, -1, 220, "OOB_way_en", true},
+	{-1, -1, 221, "OOB_way_en", true},
+
+	/* 220 */
+	{-1, -1, 222, "OOB_way_en", true},
+	{-1, -1, 223, "OOB_way_en", true},
+	{-1, -1, 224, "OOB_way_en", true},
+	{-1, -1, 225, "OOB_way_en", true},
+	{-1, -1, 226, "OOB_way_en", true},
+	{-1, -1, 227, "OOB_way_en", true},
+	{-1, -1, 228, "OOB_way_en", true},
+	{-1, -1, 229, "OOB_way_en", true},
+	{-1, -1, 230, "OOB_way_en", true},
+	{-1, -1, 231, "OOB_way_en", true},
+
+	/* 230 */
+	{-1, -1, 232, "OOB_way_en", true},
+	{-1, -1, 233, "OOB_way_en", true},
+	{-1, -1, 234, "Decode_error", true},
+	{-1, -1, 235, "Decode_error", true},
+	{-1, -1, 236, "Decode_error", true},
+	{-1, -1, 237, "Decode_error", true},
+	{-1, -1, 238, "Decode_error", true},
+	{-1, -1, 239, "Decode_error", true},
+	{-1, -1, 240, "Decode_error", true},
+	{-1, -1, 241, "Decode_error", true},
+
+	/* 240 */
+	{-1, -1, 242, "CQ_DMA", false},
+	{-1, -1, 243, "EMI", false},
+	{-1, -1, 244, "EMI_MPU", false},
+	{-1, -1, 245, "GCE", false},
+	{-1, -1, 246, "AP_DMA", false},
+	{-1, -1, 347, "DEVICE_APC_PERI_AO2", false},
+	{-1, -1, 248, "DEVICE_APC_PERI_PDN2", false},
+
+};
+
+static struct mtk_device_info mt6873_devices_peri_par[] = {
+	/* sys_idx, ctrl_idx, vio_idx, device, vio_irq */
+	/* 0 */
+	{0, 0, 0, "AUXADC_APB_S", true},
+	{0, 1, 1, "UART0_APB_S", true},
+	{0, 2, 2, "UART1_APB_S", true},
+	{0, 3, 3, "UART2_APB_S", true},
+	{0, 4, 4, "IIC_P2P_REMAP_APB4_S", true},
+	{0, 5, 5, "SPI0_APB_S", true},
+	{0, 6, 6, "PTP_THERM_CTRL_APB_S", true},
+	{0, 7, 7, "BTIF_APB_S", true},
+	{0, 8, 8, "DISP_PWM_APB_S", true},
+	{0, 9, 9, "SPI1_APB_S", true},
+
+	/* 10 */
+	{0, 10, 10, "SPI2_APB_S", true},
+	{0, 11, 11, "SPI3_APB_S", true},
+	{0, 12, 12, "IIC_P2P_REMAP_APB0_S", true},
+	{0, 13, 13, "IIC_P2P_REMAP_APB1_S", true},
+	{0, 14, 14, "SPI4_APB_S", true},
+	{0, 15, 15, "SPI5_APB_S", true},
+	{0, 16, 16, "IIC_P2P_REMAP_APB2_S", true},
+	{0, 17, 17, "IIC_P2P_REMAP_APB3_S", true},
+	{0, 18, 18, "SPI6_APB_S", true},
+	{0, 19, 19, "SPI7_APB_S", true},
+
+	/* 20 */
+	{0, 20, 20, "BCRM_PERI_PAR_PDN_APB_S", true},
+	{0, 21, 21, "DEVICE_APC_PERI_PAR_PDN_APB_S", true},
+	{0, 22, 22, "PTP_THERM_CTRL2_APB_S", true},
+	{0, 23, 23, "NOR_APB_S", true},
+	{0, 24, 24, "DEVICE_APC_PERI_PAR_AO_APB_S", true},
+	{0, 25, 25, "DEBUG_CTRL_PERI_PAR_AO_APB_S", true},
+	{0, 26, 26, "BCRM_PERI_PAR_AO_APB_S", true},
+	{-1, -1, 27, "OOB_way_en", true},
+	{-1, -1, 28, "OOB_way_en", true},
+	{-1, -1, 29, "OOB_way_en", true},
+
+	/* 30 */
+	{-1, -1, 30, "OOB_way_en", true},
+	{-1, -1, 31, "OOB_way_en", true},
+	{-1, -1, 32, "OOB_way_en", true},
+	{-1, -1, 33, "OOB_way_en", true},
+	{-1, -1, 34, "OOB_way_en", true},
+	{-1, -1, 35, "OOB_way_en", true},
+	{-1, -1, 36, "OOB_way_en", true},
+	{-1, -1, 37, "OOB_way_en", true},
+	{-1, -1, 38, "OOB_way_en", true},
+	{-1, -1, 39, "OOB_way_en", true},
+
+	/* 40 */
+	{-1, -1, 40, "OOB_way_en", true},
+	{-1, -1, 41, "OOB_way_en", true},
+	{-1, -1, 42, "OOB_way_en", true},
+	{-1, -1, 43, "OOB_way_en", true},
+	{-1, -1, 44, "OOB_way_en", true},
+	{-1, -1, 45, "OOB_way_en", true},
+	{-1, -1, 46, "OOB_way_en", true},
+	{-1, -1, 47, "OOB_way_en", true},
+	{-1, -1, 48, "OOB_way_en", true},
+	{-1, -1, 49, "OOB_way_en", true},
+
+	/* 50 */
+	{-1, -1, 50, "OOB_way_en", true},
+	{-1, -1, 51, "OOB_way_en", true},
+	{-1, -1, 52, "OOB_way_en", true},
+	{-1, -1, 53, "OOB_way_en", true},
+	{-1, -1, 54, "OOB_way_en", true},
+	{-1, -1, 55, "OOB_way_en", true},
+	{-1, -1, 56, "Decode_error", true},
+	{-1, -1, 57, "Decode_error", true},
+	{-1, -1, 58, "DISP_PWM", false},
+	{-1, -1, 59, "IMP_IIC_WRAP", false},
+
+	/* 60 */
+	{-1, -1, 60, "DEVICE_APC_PERI_PAR__AO", false},
+	{-1, -1, 61, "DEVICE_APC_PERI_PAR_PDN", false},
+};
+
+static struct mtk_device_num mtk6873_devices_num[] = {
+	{SLAVE_TYPE_INFRA, VIO_SLAVE_NUM_INFRA},
+	{SLAVE_TYPE_PERI, VIO_SLAVE_NUM_PERI},
+	{SLAVE_TYPE_PERI2, VIO_SLAVE_NUM_PERI2},
+	{SLAVE_TYPE_PERI_PAR, VIO_SLAVE_NUM_PERI_PAR},
+};
+
+static struct PERIAXI_ID_INFO peri_mi_id_to_master[] = {
+	{"THERM2",       { 0, 0, 0 } },
+	{"SPM",          { 0, 1, 0 } },
+	{"CCU",          { 0, 0, 1 } },
+	{"THERM",        { 0, 1, 1 } },
+	{"SPM_DRAMC",    { 1, 1, 0 } },
+};
+
+static struct INFRAAXI_ID_INFO infra_mi_id_to_master[] = {
+	{"CONNSYS_WFDMA",   { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } },
+	{"CONNSYS_ICAP",    { 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 } },
+	{"CONNSYS_MCU_SYS", { 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 } },
+	{"CONNSYS_GPS",     { 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 } },
+	{"Tinysys",         { 0, 1, 0, 0, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0 } },
+	{"CQ_DMA",          { 0, 0, 1, 0, 0, 0, 0, 2, 2, 2, 0, 0, 0, 0 } },
+	{"DebugTop",        { 0, 0, 1, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 0 } },
+	{"SSUSB",           { 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 2, 0 } },
+	{"SSUSB2",          { 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 2, 0 } },
+	{"NOR",             { 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 2, 0 } },
+	{"PWM",             { 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0 } },
+	{"SPI6",            { 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0 } },
+	{"SPI0",            { 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0 } },
+	{"APU",             { 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 2, 2, 0, 0 } },
+	{"SPI2",            { 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0 } },
+	{"SPI3",            { 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0 } },
+	{"SPI4",            { 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0 } },
+	{"SPI5",            { 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0 } },
+	{"SPI7",            { 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0 } },
+	{"Audio",           { 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 0, 1, 0, 0 } },
+	{"SPI1",            { 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0 } },
+	{"AP_DMA_EXT",      { 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 2, 2, 2, 0 } },
+	{"THERM2",          { 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0 } },
+	{"SPM",             { 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0 } },
+	{"CCU",             { 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0 } },
+	{"THERM",           { 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0 } },
+	{"DX_CC",           { 0, 0, 1, 0, 1, 1, 0, 2, 2, 2, 2, 0, 0, 0 } },
+	{"GCE",             { 0, 0, 1, 0, 0, 0, 1, 2, 2, 0, 0, 0, 0, 0 } },
+	{"PCIE",            { 0, 0, 1, 0, 0, 1, 1, 2, 2, 2, 2, 2, 0, 0 } },
+	{"DPMAIF",          { 0, 1, 1, 0, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0 } },
+	{"SSPM",            { 0, 0, 0, 1, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0 } },
+	{"UFS",             { 0, 1, 0, 1, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0 } },
+	{"MSDC0",           { 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 } },
+	{"MSDC1",           { 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 } },
+	{"MSDC2",           { 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0 } },
+	{"CPUEB",           { 0, 0, 1, 1, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0 } },
+	{"APMCU_write",     { 1, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0 } },
+	{"APMCU_write",     { 1, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0 } },
+	{"APMCU_write",     { 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0 } },
+	{"APMCU_read",      { 1, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0 } },
+	{"APMCU_read",      { 1, 2, 2, 2, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0 } },
+	{"APMCU_read",      { 1, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 } },
+	{"APMCU_read",      { 1, 2, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0 } },
+	{"APMCU_read",      { 1, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0, 0 } },
+	{"APMCU_read",      { 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 0, 0, 0 } },
+};
+
+static const char *infra_mi_trans(u32 bus_id)
+{
+	int master_count = ARRAY_SIZE(infra_mi_id_to_master);
+	const char *master = "UNKNOWN_MASTER_FROM_INFRA";
+	int i, j;
+
+	for (i = 0; i < master_count; i++) {
+		for (j = 0; j < INFRAAXI_MI_BIT_LENGTH; j++) {
+			if (infra_mi_id_to_master[i].bit[j] == 2)
+				continue;
+
+			if (((bus_id >> j) & 0x1) ==
+					infra_mi_id_to_master[i].bit[j])
+				continue;
+			break;
+		}
+
+		if (j == INFRAAXI_MI_BIT_LENGTH)
+			master = infra_mi_id_to_master[i].master;
+	}
+
+	return master;
+}
+
+static const char *peri_mi_trans(u32 bus_id)
+{
+	int master_count = ARRAY_SIZE(peri_mi_id_to_master);
+	const char *master = "UNKNOWN_MASTER_FROM_PERI";
+	int i, j;
+
+	if ((bus_id & 0x3) == 0x0)
+		return infra_mi_trans(bus_id >> 2);
+	else if ((bus_id & 0x3) == 0x2)
+		return "MD_AP_M";
+	else if ((bus_id & 0x3) == 0x3)
+		return "AP_DMA_M";
+
+	bus_id = bus_id >> 2;
+
+	for (i = 0 ; i < master_count; i++) {
+		for (j = 0 ; j < PERIAXI_MI_BIT_LENGTH ; j++) {
+			if (peri_mi_id_to_master[i].bit[j] == 2)
+				continue;
+
+			if (((bus_id >> j) & 0x1) ==
+					peri_mi_id_to_master[i].bit[j])
+				continue;
+			break;
+		}
+
+		if (j == PERIAXI_MI_BIT_LENGTH)
+			master = peri_mi_id_to_master[i].master;
+	}
+
+	return master;
+}
+
+static const char *mt6873_bus_id_to_master(u32 bus_id, u32 vio_addr,
+					   int slave_type, int shift_sta_bit,
+					   int domain)
+{
+	u8 h_1byte;
+
+	if (bus_id == 0x0 && vio_addr == 0x0)
+		return NULL;
+
+	h_1byte = (vio_addr >> 24) & 0xFF;
+
+	if ((vio_addr >= TINYSYS_START_ADDR && vio_addr <= TINYSYS_END_ADDR) ||
+	    (vio_addr >= MD_START_ADDR && vio_addr <= MD_END_ADDR)) {
+		if (domain == 0x1)
+			return "SSPM";
+		else if (domain == 0x2)
+			return "CONNSYS";
+
+	} else if (vio_addr >= CONN_START_ADDR && vio_addr <= CONN_END_ADDR) {
+		if (domain == 0x1)
+			return "MD";
+		else if (domain == 0x2)
+			return "ADSP";
+	}
+
+	if (slave_type == SLAVE_TYPE_INFRA) {
+		if (vio_addr <= 0x1FFFFF) {
+			if ((bus_id & 0x1) == 0)
+				return "EMI_L2C_M";
+
+			return infra_mi_trans(bus_id >> 1);
+
+		} else if (shift_sta_bit == 3) {
+			if ((bus_id & 0x1) == 0)
+				return "EMI_L2C_M";
+
+			return infra_mi_trans(bus_id >> 1);
+
+		} else if (shift_sta_bit == 4) {
+			if ((bus_id & 0x1) == 1)
+				return "GCE_M";
+
+			return infra_mi_trans(bus_id >> 1);
+		}
+
+		return infra_mi_trans(bus_id);
+
+	} else if (slave_type == SLAVE_TYPE_PERI) {
+		if ((h_1byte >= 0x14 && h_1byte < 0x18) ||
+		    (h_1byte >= 0x1A && h_1byte < 0x1C) ||
+		    (h_1byte >= 0x1F && h_1byte < 0x20)) {
+			if ((bus_id & 0x1) == 1)
+				return "GCE_M";
+
+			return infra_mi_trans(bus_id >> 1);
+		}
+
+		if (shift_sta_bit == 3 || shift_sta_bit == 4 ||
+		    shift_sta_bit == 8) {
+			if ((bus_id & 0x1) == 0)
+				return "MD_AP_M";
+
+			return peri_mi_trans(bus_id >> 1);
+		}
+		return peri_mi_trans(bus_id);
+
+	} else if (slave_type == SLAVE_TYPE_PERI2) {
+		return peri_mi_trans(bus_id);
+
+	} else if (slave_type == SLAVE_TYPE_PERI_PAR) {
+		return peri_mi_trans(bus_id);
+	}
+
+	return "UNKNOWN_MASTER";
+}
+
+/* violation index corresponds to subsys */
+const char *index_to_subsys(int slave_type, u32 vio_index, u32 vio_addr)
+{
+	int i;
+
+	/* Filter by violation address */
+	if ((vio_addr & 0xFF000000) == CONN_START_ADDR)
+		return "CONNSYS";
+
+	/* Filter by violation index */
+	if (slave_type == SLAVE_TYPE_INFRA &&
+	    vio_index < VIO_SLAVE_NUM_INFRA) {
+		for (i = 0; i < VIO_SLAVE_NUM_INFRA; i++) {
+			if (vio_index == mt6873_devices_infra[i].vio_index)
+				return mt6873_devices_infra[i].device;
+		}
+
+	} else if (slave_type == SLAVE_TYPE_PERI &&
+		   vio_index < VIO_SLAVE_NUM_PERI)
+		for (i = 0; i < VIO_SLAVE_NUM_PERI; i++) {
+			if (vio_index == mt6873_devices_peri[i].vio_index)
+				return mt6873_devices_peri[i].device;
+		}
+
+	else if (slave_type == SLAVE_TYPE_PERI2 &&
+		 vio_index < VIO_SLAVE_NUM_PERI2)
+		for (i = 0; i < VIO_SLAVE_NUM_PERI2; i++) {
+			if (vio_index == mt6873_devices_peri2[i].vio_index)
+				return mt6873_devices_peri2[i].device;
+		}
+
+	else if (slave_type == SLAVE_TYPE_PERI_PAR &&
+		 vio_index < VIO_SLAVE_NUM_PERI_PAR)
+		for (i = 0; i < VIO_SLAVE_NUM_PERI_PAR; i++) {
+			if (vio_index == mt6873_devices_peri_par[i].vio_index)
+				return mt6873_devices_peri_par[i].device;
+		}
+
+	return "OUT_OF_BOUND";
+}
+
+static void mm2nd_vio_handler(void __iomem *infracfg,
+			      struct mtk_devapc_vio_info *vio_info,
+			      bool mdp_vio, bool disp2_vio, bool mmsys_vio)
+{
+	u32 vio_sta, vio_dbg, rw;
+	u32 vio_sta_num;
+	u32 vio0_offset;
+	char mm_str[64] = {0};
+	void __iomem *reg;
+	int i;
+
+	if (!infracfg)
+		return;
+
+	if (mdp_vio) {
+		vio_sta_num = INFRACFG_MDP_VIO_STA_NUM;
+		vio0_offset = INFRACFG_MDP_SEC_VIO0_OFFSET;
+
+		strncpy(mm_str, "INFRACFG_MDP_SEC_VIO",
+			sizeof("INFRACFG_MDP_SEC_VIO"));
+
+	} else if (mmsys_vio) {
+		vio_sta_num = INFRACFG_MM_VIO_STA_NUM;
+		vio0_offset = INFRACFG_MM_SEC_VIO0_OFFSET;
+
+		strncpy(mm_str, "INFRACFG_MM_SEC_VIO",
+			sizeof("INFRACFG_MM_SEC_VIO"));
+
+	} else {
+		pr_err(PFX "%s: param check failed, %s:%s, %s:%s, %s:%s\n",
+		       __func__,
+		       "mdp_vio", mdp_vio ? "true" : "false",
+		       "disp2_vio", disp2_vio ? "true" : "false",
+		       "mmsys_vio", mmsys_vio ? "true" : "false");
+		return;
+	}
+
+	/* Get mm2nd violation status */
+	for (i = 0; i < vio_sta_num; i++) {
+		reg = infracfg + vio0_offset + i * 4;
+		vio_sta = readl(reg);
+		if (vio_sta)
+			pr_info(PFX "MM 2nd violation: %s%d:0x%x\n",
+				mm_str, i, vio_sta);
+	}
+
+	/* Get mm2nd violation address */
+	reg = infracfg + vio0_offset + i * 4;
+	vio_info->vio_addr = readl(reg);
+
+	/* Get mm2nd violation information */
+	reg = infracfg + vio0_offset + (i + 1) * 4;
+	vio_dbg = readl(reg);
+
+	vio_info->domain_id = (vio_dbg & INFRACFG_MM2ND_VIO_DOMAIN_MASK) >>
+		INFRACFG_MM2ND_VIO_DOMAIN_SHIFT;
+
+	vio_info->master_id = (vio_dbg & INFRACFG_MM2ND_VIO_ID_MASK) >>
+		INFRACFG_MM2ND_VIO_ID_SHIFT;
+
+	rw = (vio_dbg & INFRACFG_MM2ND_VIO_RW_MASK) >>
+		INFRACFG_MM2ND_VIO_RW_SHIFT;
+	vio_info->read = (rw == 0);
+	vio_info->write = (rw == 1);
+}
+
+static u32 mt6873_shift_group_get(int slave_type, u32 vio_idx)
+{
+	if (slave_type == SLAVE_TYPE_INFRA) {
+		if ((vio_idx >= 0 && vio_idx <= 8) || vio_idx == 355)
+			return 0;
+		else if ((vio_idx >= 9 && vio_idx <= 14) || vio_idx == 356)
+			return 1;
+		else if ((vio_idx >= 15 && vio_idx <= 19) || vio_idx == 357)
+			return 2;
+		else if ((vio_idx >= 20 && vio_idx <= 21) || vio_idx == 358)
+			return 3;
+		else if (vio_idx >= 22 && vio_idx <= 347)
+			return 4;
+		else if ((vio_idx >= 348 && vio_idx <= 354) ||
+			 (vio_idx >= 359 && vio_idx <= 365) ||
+			 vio_idx == 366)
+			return 5;
+
+		pr_err(PFX "%s:%d Wrong vio_idx:0x%x\n",
+		       __func__, __LINE__, vio_idx);
+
+	} else if (slave_type == SLAVE_TYPE_PERI) {
+		if (vio_idx >= 0 && vio_idx <= 4)
+			return 0;
+		else if (vio_idx >= 5 && vio_idx <= 6)
+			return 1;
+		else if ((vio_idx >= 7 && vio_idx <= 38) || vio_idx == 187 ||
+			 (vio_idx >= 188 && vio_idx <= 219) ||
+			 vio_idx == 286)
+			return 2;
+		else if ((vio_idx >= 39 && vio_idx <= 61) || vio_idx == 220)
+			return 3;
+		else if ((vio_idx >= 62 && vio_idx <= 72) || vio_idx == 221)
+			return 4;
+		else if ((vio_idx >= 73 && vio_idx <= 74) || vio_idx == 222)
+			return 5;
+		else if (vio_idx == 75 || vio_idx == 223)
+			return 6;
+		else if ((vio_idx >= 76 && vio_idx <= 118) || vio_idx == 224)
+			return 7;
+		else if ((vio_idx >= 119 && vio_idx <= 121) || vio_idx == 225)
+			return 8;
+		if (vio_idx >= 122 && vio_idx <= 125)
+			return 9;
+		else if (vio_idx == 126 || (vio_idx >= 226 && vio_idx <= 227) ||
+			 vio_idx == 287)
+			return 10;
+		if (vio_idx >= 127 && vio_idx <= 128)
+			return 11;
+		if (vio_idx >= 129 && vio_idx <= 130)
+			return 12;
+		else if ((vio_idx >= 131 && vio_idx <= 141) ||
+			 (vio_idx >= 228 && vio_idx <= 238) ||
+			 vio_idx == 288)
+			return 13;
+		else if ((vio_idx >= 142 && vio_idx <= 143) ||
+			 (vio_idx >= 239 && vio_idx <= 240) ||
+			 vio_idx == 289)
+			return 14;
+		else if ((vio_idx >= 144 && vio_idx <= 173) || vio_idx == 241 ||
+			 (vio_idx >= 242 && vio_idx <= 271) ||
+			 vio_idx == 290)
+			return 15;
+		else if ((vio_idx >= 174 && vio_idx <= 186) || vio_idx == 272 ||
+			 (vio_idx >= 273 && vio_idx <= 285) ||
+			 vio_idx == 291)
+			return 16;
+
+		pr_err(PFX "%s:%d Wrong vio_idx:0x%x\n",
+		       __func__, __LINE__, vio_idx);
+
+	} else if (slave_type == SLAVE_TYPE_PERI2) {
+		if ((vio_idx >= 0 && vio_idx <= 12) || vio_idx == 117 ||
+		    (vio_idx >= 118 && vio_idx <= 130) ||
+		    vio_idx == 234)
+			return 0;
+		else if (vio_idx >= 13 && vio_idx <= 16)
+			return 1;
+		else if (vio_idx >= 17 && vio_idx <= 20)
+			return 2;
+		else if ((vio_idx >= 21 && vio_idx <= 36) || vio_idx == 131 ||
+			 (vio_idx >= 132 && vio_idx <= 147) ||
+			 vio_idx == 235)
+			return 3;
+		else if ((vio_idx >= 37 && vio_idx <= 44) || vio_idx == 148 ||
+			 (vio_idx >= 149 && vio_idx <= 156) ||
+			 vio_idx == 236)
+			return 4;
+		else if ((vio_idx >= 45 && vio_idx <= 60) || vio_idx == 157 ||
+			 (vio_idx >= 158 && vio_idx <= 173) ||
+			 vio_idx == 237)
+			return 5;
+		else if ((vio_idx >= 61 && vio_idx <= 76) || vio_idx == 174 ||
+			 (vio_idx >= 175 && vio_idx <= 190) ||
+			 vio_idx == 238)
+			return 6;
+		else if ((vio_idx >= 77 && vio_idx <= 84) || vio_idx == 191 ||
+			 (vio_idx >= 192 && vio_idx <= 199) ||
+			 vio_idx == 239)
+			return 7;
+		else if ((vio_idx >= 85 && vio_idx <= 105) || vio_idx == 200 ||
+			 (vio_idx >= 201 && vio_idx <= 221) ||
+			 vio_idx == 240)
+			return 8;
+		else if ((vio_idx >= 106 && vio_idx <= 116) || vio_idx == 222 ||
+			 (vio_idx >= 223 && vio_idx <= 233) ||
+			 vio_idx == 241)
+			return 9;
+
+		pr_err(PFX "%s:%d Wrong vio_idx:0x%x\n",
+		       __func__, __LINE__, vio_idx);
+
+	} else if (slave_type == SLAVE_TYPE_PERI_PAR) {
+		if ((vio_idx >= 0 && vio_idx <= 23) || vio_idx == 27 ||
+		    (vio_idx >= 28 && vio_idx <= 51) ||
+		    vio_idx == 56)
+			return 0;
+		else if ((vio_idx >= 24 && vio_idx <= 26) || vio_idx == 52 ||
+			 (vio_idx >= 53 && vio_idx <= 55) ||
+			 vio_idx == 57)
+			return 1;
+
+		pr_err(PFX "%s:%d Wrong vio_idx:0x%x\n",
+		       __func__, __LINE__, vio_idx);
+
+	} else {
+		pr_err(PFX "%s:%d Wrong slave_type:0x%x\n",
+		       __func__, __LINE__, slave_type);
+	}
+
+	return 31;
+}
+
+static struct mtk_devapc_dbg_status mt6873_devapc_dbg_stat = {
+	.enable_ut = PLAT_DBG_UT_DEFAULT,
+	.enable_WARN = PLAT_DBG_WARN_DEFAULT,
+	.enable_dapc = PLAT_DBG_DAPC_DEFAULT,
+};
+
+static const char * const slave_type_to_str[] = {
+	"SLAVE_TYPE_INFRA",
+	"SLAVE_TYPE_PERI",
+	"SLAVE_TYPE_PERI2",
+	"SLAVE_TYPE_PERI_PAR",
+	"WRONG_SLAVE_TYPE",
+};
+
+static int mtk_vio_mask_sta_num[] = {
+	VIO_MASK_STA_NUM_INFRA,
+	VIO_MASK_STA_NUM_PERI,
+	VIO_MASK_STA_NUM_PERI2,
+	VIO_MASK_STA_NUM_PERI_PAR,
+};
+
+static struct mtk_devapc_vio_info mt6873_devapc_vio_info = {
+	.vio_mask_sta_num = mtk_vio_mask_sta_num,
+	.sramrom_vio_idx = SRAMROM_VIO_INDEX,
+	.mdp_vio_idx = MDP_VIO_INDEX,
+	.disp2_vio_idx = MDP_VIO_INDEX,
+	.mmsys_vio_idx = MMSYS_VIO_INDEX,
+	.sramrom_slv_type = SRAMROM_SLAVE_TYPE,
+	.mm2nd_slv_type = MM2ND_SLAVE_TYPE,
+};
+
+static const struct mtk_infra_vio_dbg_desc mt6873_vio_dbgs = {
+	.vio_dbg_mstid = INFRA_VIO_DBG_MSTID,
+	.vio_dbg_mstid_start_bit = INFRA_VIO_DBG_MSTID_START_BIT,
+	.vio_dbg_dmnid = INFRA_VIO_DBG_DMNID,
+	.vio_dbg_dmnid_start_bit = INFRA_VIO_DBG_DMNID_START_BIT,
+	.vio_dbg_w_vio = INFRA_VIO_DBG_W_VIO,
+	.vio_dbg_w_vio_start_bit = INFRA_VIO_DBG_W_VIO_START_BIT,
+	.vio_dbg_r_vio = INFRA_VIO_DBG_R_VIO,
+	.vio_dbg_r_vio_start_bit = INFRA_VIO_DBG_R_VIO_START_BIT,
+	.vio_addr_high = INFRA_VIO_ADDR_HIGH,
+	.vio_addr_high_start_bit = INFRA_VIO_ADDR_HIGH_START_BIT,
+};
+
+static const struct mtk_sramrom_sec_vio_desc mt6873_sramrom_sec_vios = {
+	.vio_id_mask = SRAMROM_SEC_VIO_ID_MASK,
+	.vio_id_shift = SRAMROM_SEC_VIO_ID_SHIFT,
+	.vio_domain_mask = SRAMROM_SEC_VIO_DOMAIN_MASK,
+	.vio_domain_shift = SRAMROM_SEC_VIO_DOMAIN_SHIFT,
+	.vio_rw_mask = SRAMROM_SEC_VIO_RW_MASK,
+	.vio_rw_shift = SRAMROM_SEC_VIO_RW_SHIFT,
+};
+
+static const u32 mt6873_devapc_pds[] = {
+	PD_VIO_MASK_OFFSET,
+	PD_VIO_STA_OFFSET,
+	PD_VIO_DBG0_OFFSET,
+	PD_VIO_DBG1_OFFSET,
+	PD_VIO_DBG2_OFFSET,
+	PD_APC_CON_OFFSET,
+	PD_SHIFT_STA_OFFSET,
+	PD_SHIFT_SEL_OFFSET,
+	PD_SHIFT_CON_OFFSET,
+};
+
+static struct mtk_devapc_soc mt6873_data = {
+	.dbg_stat = &mt6873_devapc_dbg_stat,
+	.slave_type_arr = slave_type_to_str,
+	.slave_type_num = SLAVE_TYPE_NUM,
+	.device_info[SLAVE_TYPE_INFRA] = mt6873_devices_infra,
+	.device_info[SLAVE_TYPE_PERI] = mt6873_devices_peri,
+	.device_info[SLAVE_TYPE_PERI2] = mt6873_devices_peri2,
+	.device_info[SLAVE_TYPE_PERI_PAR] = mt6873_devices_peri_par,
+	.ndevices = mtk6873_devices_num,
+	.vio_info = &mt6873_devapc_vio_info,
+	.vio_dbgs = &mt6873_vio_dbgs,
+	.sramrom_sec_vios = &mt6873_sramrom_sec_vios,
+	.devapc_pds = mt6873_devapc_pds,
+	.subsys_get = &index_to_subsys,
+	.master_get = &mt6873_bus_id_to_master,
+	.mm2nd_vio_handler = &mm2nd_vio_handler,
+	.shift_group_get = mt6873_shift_group_get,
+};
+
+static const struct of_device_id mt6873_devapc_dt_match[] = {
+	{ .compatible = "mediatek,mt6873-devapc" },
+	{},
+};
+
+static int mt6873_devapc_probe(struct platform_device *pdev)
+{
+	return mtk_devapc_probe(pdev, &mt6873_data);
+}
+
+static int mt6873_devapc_remove(struct platform_device *dev)
+{
+	return mtk_devapc_remove(dev);
+}
+
+static struct platform_driver mt6873_devapc_driver = {
+	.probe = mt6873_devapc_probe,
+	.remove = mt6873_devapc_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = mt6873_devapc_dt_match,
+	},
+};
+
+module_platform_driver(mt6873_devapc_driver);
+
+MODULE_DESCRIPTION("Mediatek MT6873 Device APC Driver");
+MODULE_AUTHOR("Neal Liu <neal.liu@mediatek.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/mediatek/devapc/devapc-mt6873.h b/drivers/soc/mediatek/devapc/devapc-mt6873.h
new file mode 100644
index 0000000..d6e994c
--- /dev/null
+++ b/drivers/soc/mediatek/devapc/devapc-mt6873.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ */
+
+#ifndef __DEVAPC_MT6873_H__
+#define __DEVAPC_MT6873_H__
+
+/******************************************************************************
+ * VARIABLE DEFINITION
+ ******************************************************************************/
+/* dbg status default setting */
+#define PLAT_DBG_UT_DEFAULT		false
+#define PLAT_DBG_WARN_DEFAULT		true
+#define PLAT_DBG_DAPC_DEFAULT		false
+
+/******************************************************************************
+ * STRUCTURE DEFINITION
+ ******************************************************************************/
+enum DEVAPC_SLAVE_TYPE {
+	SLAVE_TYPE_INFRA = 0,
+	SLAVE_TYPE_PERI,
+	SLAVE_TYPE_PERI2,
+	SLAVE_TYPE_PERI_PAR,
+	SLAVE_TYPE_NUM,
+};
+
+enum DEVAPC_VIO_MASK_STA_NUM {
+	VIO_MASK_STA_NUM_INFRA = 12,
+	VIO_MASK_STA_NUM_PERI = 10,
+	VIO_MASK_STA_NUM_PERI2 = 8,
+	VIO_MASK_STA_NUM_PERI_PAR = 2,
+};
+
+enum DEVAPC_VIO_SLAVE_NUM {
+	VIO_SLAVE_NUM_INFRA = 366,
+	VIO_SLAVE_NUM_PERI = 284,
+	VIO_SLAVE_NUM_PERI2 = 247,
+	VIO_SLAVE_NUM_PERI_PAR = 62,
+};
+
+enum DEVAPC_PD_OFFSET {
+	PD_VIO_MASK_OFFSET = 0x0,
+	PD_VIO_STA_OFFSET = 0x400,
+	PD_VIO_DBG0_OFFSET = 0x900,
+	PD_VIO_DBG1_OFFSET = 0x904,
+	PD_VIO_DBG2_OFFSET = 0x908,
+	PD_APC_CON_OFFSET = 0xF00,
+	PD_SHIFT_STA_OFFSET = 0xF20,
+	PD_SHIFT_SEL_OFFSET = 0xF30,
+	PD_SHIFT_CON_OFFSET = 0xF10,
+};
+
+#define SRAMROM_SLAVE_TYPE	SLAVE_TYPE_INFRA	/* Infra */
+#define MM2ND_SLAVE_TYPE	SLAVE_TYPE_PERI		/* Peri */
+
+enum OTHER_TYPES_INDEX {
+	SRAMROM_VIO_INDEX = 367,
+	CONN_VIO_INDEX = 75, /* starts from 0x18 */
+	MDP_VIO_INDEX = 292,
+	MMSYS_VIO_INDEX = 294,
+};
+
+enum INFRACFG_MM2ND_VIO_NUM {
+	INFRACFG_MM_VIO_STA_NUM = 2,
+	INFRACFG_MDP_VIO_STA_NUM = 8,
+};
+
+enum DEVAPC_MODULE_ADDR {
+	TINYSYS_START_ADDR = 0x10500000,
+	TINYSYS_END_ADDR = 0x108FFFFF,
+	MD_START_ADDR = 0x20000000,
+	MD_END_ADDR = 0x2FFFFFFF,
+	CONN_START_ADDR = 0x18000000,
+	CONN_END_ADDR = 0x18FFFFFF,
+};
+
+enum INFRACFG_MM2ND_OFFSET {
+	INFRACFG_MM_SEC_VIO0_OFFSET = 0xB30,
+	INFRACFG_MDP_SEC_VIO0_OFFSET = 0xB40,
+};
+
+enum BUSID_LENGTH {
+	PERIAXI_MI_BIT_LENGTH = 3,
+	INFRAAXI_MI_BIT_LENGTH = 14,
+};
+
+struct PERIAXI_ID_INFO {
+	const char	*master;
+	u8		bit[PERIAXI_MI_BIT_LENGTH];
+};
+
+struct INFRAAXI_ID_INFO {
+	const char	*master;
+	u8		bit[INFRAAXI_MI_BIT_LENGTH];
+};
+
+/******************************************************************************
+ * PLATFORM DEFINATION
+ ******************************************************************************/
+
+/* For Infra VIO_DBG */
+#define INFRA_VIO_DBG_MSTID			0xFFFFFFFF
+#define INFRA_VIO_DBG_MSTID_START_BIT		0
+#define INFRA_VIO_DBG_DMNID			0x0000003F
+#define INFRA_VIO_DBG_DMNID_START_BIT		0
+#define INFRA_VIO_DBG_W_VIO			0x00000040
+#define INFRA_VIO_DBG_W_VIO_START_BIT		6
+#define INFRA_VIO_DBG_R_VIO			0x00000080
+#define INFRA_VIO_DBG_R_VIO_START_BIT		7
+#define INFRA_VIO_ADDR_HIGH			0x00000F00
+#define INFRA_VIO_ADDR_HIGH_START_BIT		8
+
+/* For SRAMROM VIO */
+#define SRAMROM_SEC_VIO_ID_MASK			0x00FFFF00
+#define SRAMROM_SEC_VIO_ID_SHIFT		8
+#define SRAMROM_SEC_VIO_DOMAIN_MASK		0x0F000000
+#define SRAMROM_SEC_VIO_DOMAIN_SHIFT		24
+#define SRAMROM_SEC_VIO_RW_MASK			0x80000000
+#define SRAMROM_SEC_VIO_RW_SHIFT		31
+
+/* For MM 2nd VIO */
+#define INFRACFG_MM2ND_VIO_DOMAIN_MASK		0x00000030
+#define INFRACFG_MM2ND_VIO_DOMAIN_SHIFT		4
+#define INFRACFG_MM2ND_VIO_ID_MASK		0x00FFFF00
+#define INFRACFG_MM2ND_VIO_ID_SHIFT		8
+#define INFRACFG_MM2ND_VIO_RW_MASK		0x01000000
+#define INFRACFG_MM2ND_VIO_RW_SHIFT		24
+
+#endif /* __DEVAPC_MT6873_H__ */
diff --git a/drivers/soc/mediatek/devapc/devapc-mtk-multi-ao.c b/drivers/soc/mediatek/devapc/devapc-mtk-multi-ao.c
new file mode 100644
index 0000000..4b8d859
--- /dev/null
+++ b/drivers/soc/mediatek/devapc/devapc-mtk-multi-ao.c
@@ -0,0 +1,1019 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/clk.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/of_address.h>
+#include <linux/proc_fs.h>
+#include <linux/sched/debug.h>
+#include <linux/uaccess.h>
+#include <linux/soc/mediatek/mtk_sip_svc.h>
+#include <linux/soc/mediatek/devapc_public.h>
+#include "devapc-mtk-multi-ao.h"
+
+static struct mtk_devapc_context {
+	struct clk *devapc_infra_clk;
+	u32 devapc_irq;
+
+	/* HW reg mapped addr */
+	void __iomem *devapc_pd_base[4];
+	void __iomem *infracfg_base;
+
+	struct mtk_devapc_soc *soc;
+} mtk_devapc_ctx[1];
+
+static LIST_HEAD(viocb_list);
+static DEFINE_SPINLOCK(devapc_lock);
+
+/*
+ * mtk_devapc_pd_get - get devapc pd_types of register address.
+ *
+ * Returns the value of reg addr
+ */
+static void __iomem *mtk_devapc_pd_get(int slave_type,
+				       enum DEVAPC_PD_REG_TYPE pd_reg_type,
+				       u32 index)
+{
+	struct mtk_devapc_vio_info *vio_info = mtk_devapc_ctx->soc->vio_info;
+	u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+	const u32 *devapc_pds = mtk_devapc_ctx->soc->devapc_pds;
+	void __iomem *reg;
+
+	if (!devapc_pds)
+		return NULL;
+
+	if ((slave_type < slave_type_num &&
+	     index < vio_info->vio_mask_sta_num[slave_type]) &&
+	    pd_reg_type < PD_REG_TYPE_NUM) {
+		reg = mtk_devapc_ctx->devapc_pd_base[slave_type] +
+			devapc_pds[pd_reg_type];
+
+		if (pd_reg_type == VIO_MASK || pd_reg_type == VIO_STA)
+			reg += 0x4 * index;
+
+	} else {
+		pr_err(PFX "%s:0x%x or %s:0x%x or %s:0x%x is out of boundary\n",
+		       "slave_type", slave_type,
+		       "pd_reg_type", pd_reg_type,
+		       "index", index);
+		return NULL;
+	}
+
+	return reg;
+}
+
+/*
+ * sramrom_vio_handler - clean sramrom violation & print violation information
+ *			 for debugging.
+ */
+static void sramrom_vio_handler(void)
+{
+	const struct mtk_sramrom_sec_vio_desc *sramrom_vios;
+	struct mtk_devapc_vio_info *vio_info;
+	struct arm_smccc_res res;
+	size_t sramrom_vio_sta;
+	int sramrom_vio;
+	u32 rw;
+
+	sramrom_vios = mtk_devapc_ctx->soc->sramrom_sec_vios;
+	vio_info = mtk_devapc_ctx->soc->vio_info;
+
+	arm_smccc_smc(MTK_SIP_KERNEL_CLR_SRAMROM_VIO,
+		      0, 0, 0, 0, 0, 0, 0, &res);
+
+	sramrom_vio = res.a0;
+	sramrom_vio_sta = res.a1;
+	vio_info->vio_addr = res.a2;
+
+	if (sramrom_vio == SRAM_VIOLATION)
+		pr_info(PFX "%s, SRAM violation is triggered\n", __func__);
+	else if (sramrom_vio == ROM_VIOLATION)
+		pr_info(PFX "%s, ROM violation is triggered\n", __func__);
+	else
+		return;
+
+	vio_info->master_id = (sramrom_vio_sta & sramrom_vios->vio_id_mask)
+			>> sramrom_vios->vio_id_shift;
+	vio_info->domain_id = (sramrom_vio_sta & sramrom_vios->vio_domain_mask)
+			>> sramrom_vios->vio_domain_shift;
+	rw = (sramrom_vio_sta & sramrom_vios->vio_rw_mask) >>
+			sramrom_vios->vio_rw_shift;
+
+	if (rw)
+		vio_info->write = 1;
+	else
+		vio_info->read = 1;
+
+	pr_info(PFX "%s: %s:0x%x, %s:0x%x, %s:%s, %s:0x%x\n",
+		__func__, "master_id", vio_info->master_id,
+		"domain_id", vio_info->domain_id,
+		"rw", rw ? "Write" : "Read",
+		"vio_addr", vio_info->vio_addr);
+}
+
+static void mask_module_irq(int slave_type, u32 module, bool mask)
+{
+	struct mtk_devapc_vio_info *vio_info = mtk_devapc_ctx->soc->vio_info;
+	u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+	u32 apc_register_index;
+	u32 apc_set_index;
+	void __iomem *reg;
+
+	apc_register_index = module / (MOD_NO_IN_1_DEVAPC * 2);
+	apc_set_index = module % (MOD_NO_IN_1_DEVAPC * 2);
+
+	if (slave_type < slave_type_num &&
+	    apc_register_index < vio_info->vio_mask_sta_num[slave_type]) {
+		reg = mtk_devapc_pd_get(slave_type, VIO_MASK,
+					apc_register_index);
+
+		if (mask)
+			writel(readl(reg) | (1 << apc_set_index), reg);
+		else
+			writel(readl(reg) & (~(1 << apc_set_index)), reg);
+
+	} else {
+		pr_err(PFX "%s: %s, %s:0x%x, %s:0x%x, %s:%s\n",
+		       __func__, "out of boundary",
+		       "slave_type", slave_type,
+		       "module_index", module,
+		       "mask", mask ? "true" : "false");
+	}
+}
+
+static int32_t check_vio_status(int slave_type, u32 module)
+{
+	struct mtk_devapc_vio_info *vio_info = mtk_devapc_ctx->soc->vio_info;
+	u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+	u32 apc_register_index;
+	u32 apc_set_index;
+	void __iomem *reg;
+
+	apc_register_index = module / (MOD_NO_IN_1_DEVAPC * 2);
+	apc_set_index = module % (MOD_NO_IN_1_DEVAPC * 2);
+
+	if (slave_type < slave_type_num &&
+	    apc_register_index < vio_info->vio_mask_sta_num[slave_type]) {
+		reg = mtk_devapc_pd_get(slave_type, VIO_STA,
+					apc_register_index);
+
+	} else {
+		pr_err(PFX "%s: %s, %s:0x%x, %s:0x%x\n",
+		       __func__, "out of boundary",
+		       "slave_type", slave_type,
+		       "module_index", module);
+		return -EOVERFLOW;
+	}
+
+	if (readl(reg) & (0x1 << apc_set_index))
+		return VIOLATION_TRIGGERED;
+
+	return 0;
+}
+
+static int32_t clear_vio_status(int slave_type, u32 module)
+{
+	struct mtk_devapc_vio_info *vio_info = mtk_devapc_ctx->soc->vio_info;
+	u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+	u32 apc_register_index;
+	u32 apc_set_index;
+	void __iomem *reg;
+
+	apc_register_index = module / (MOD_NO_IN_1_DEVAPC * 2);
+	apc_set_index = module % (MOD_NO_IN_1_DEVAPC * 2);
+
+	if (slave_type < slave_type_num &&
+	    apc_register_index < vio_info->vio_mask_sta_num[slave_type]) {
+		reg = mtk_devapc_pd_get(slave_type, VIO_STA,
+					apc_register_index);
+		writel(0x1 << apc_set_index, reg);
+
+	} else {
+		pr_err(PFX "%s: %s, %s:0x%x, %s:0x%x\n",
+		       __func__, "out of boundary",
+		       "slave_type", slave_type,
+		       "module_index", module);
+		return -EOVERFLOW;
+	}
+
+	if (check_vio_status(slave_type, module))
+		return -EIO;
+
+	return 0;
+}
+
+static const char *slave_type_to_string(u32 slave_type)
+{
+	u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+	const char * const *slave_type_arr;
+
+	slave_type_arr = mtk_devapc_ctx->soc->slave_type_arr;
+
+	if (slave_type < slave_type_num)
+		return slave_type_arr[slave_type];
+	else
+		return slave_type_arr[slave_type_num];
+}
+
+static void devapc_vio_info_print(void)
+{
+	struct mtk_devapc_vio_info *vio_info;
+
+	vio_info = mtk_devapc_ctx->soc->vio_info;
+
+	/* Print violation information */
+	if (vio_info->write)
+		pr_info(PFX "Write Violation\n");
+	else if (vio_info->read)
+		pr_info(PFX "Read Violation\n");
+
+	pr_info(PFX "%s%x, %s%x, %s%x, %s%x\n",
+		"Vio Addr:0x", vio_info->vio_addr,
+		"High:0x", vio_info->vio_addr_high,
+		"Bus ID:0x", vio_info->master_id,
+		"Dom ID:0x", vio_info->domain_id);
+}
+
+static bool check_type2_vio_status(int slave_type, int *vio_idx, int *index)
+{
+	u32 sramrom_vio_idx, mdp_vio_idx, disp2_vio_idx, mmsys_vio_idx;
+	const struct mtk_device_info **device_info;
+	const struct mtk_device_num *ndevices;
+	int sramrom_slv_type, mm2nd_slv_type;
+	bool mdp_vio, disp2_vio, mmsys_vio;
+	int i;
+
+	sramrom_slv_type = mtk_devapc_ctx->soc->vio_info->sramrom_slv_type;
+	sramrom_vio_idx = mtk_devapc_ctx->soc->vio_info->sramrom_vio_idx;
+
+	mm2nd_slv_type = mtk_devapc_ctx->soc->vio_info->mm2nd_slv_type;
+	mdp_vio_idx = mtk_devapc_ctx->soc->vio_info->mdp_vio_idx;
+	disp2_vio_idx = mtk_devapc_ctx->soc->vio_info->disp2_vio_idx;
+	mmsys_vio_idx = mtk_devapc_ctx->soc->vio_info->mmsys_vio_idx;
+
+	device_info = mtk_devapc_ctx->soc->device_info;
+	ndevices = mtk_devapc_ctx->soc->ndevices;
+
+	/* check SRAMROM */
+	if (slave_type == sramrom_slv_type &&
+	    check_vio_status(slave_type, sramrom_vio_idx)) {
+		pr_info(PFX "SRAMROM violation is triggered\n");
+		sramrom_vio_handler();
+
+		*vio_idx = sramrom_vio_idx;
+		for (i = 0; i < ndevices[slave_type].vio_slave_num; i++) {
+			if (device_info[slave_type][i].vio_index == *vio_idx)
+				*index = i;
+		}
+
+		return true;
+	}
+
+	/* check mm2nd */
+	if (slave_type == mm2nd_slv_type) {
+		mdp_vio = check_vio_status(slave_type, mdp_vio_idx) ==
+			VIOLATION_TRIGGERED;
+		disp2_vio = check_vio_status(slave_type, disp2_vio_idx) ==
+			VIOLATION_TRIGGERED;
+		mmsys_vio = check_vio_status(slave_type, mmsys_vio_idx) ==
+			VIOLATION_TRIGGERED;
+
+		if (mdp_vio || disp2_vio || mmsys_vio) {
+			pr_info(PFX "MM2nd violation is triggered\n");
+			mtk_devapc_ctx->soc->mm2nd_vio_handler
+				(mtk_devapc_ctx->infracfg_base,
+				 mtk_devapc_ctx->soc->vio_info,
+				 mdp_vio,
+				 disp2_vio,
+				 mmsys_vio);
+
+			if (mdp_vio)
+				*vio_idx = mdp_vio_idx;
+			else if (disp2_vio)
+				*vio_idx = disp2_vio_idx;
+			else if (mmsys_vio)
+				*vio_idx = mmsys_vio_idx;
+
+			for (i = 0; i < ndevices[slave_type].vio_slave_num;
+					i++) {
+				if (device_info[slave_type][i].vio_index ==
+						*vio_idx)
+					*index = i;
+			}
+
+			devapc_vio_info_print();
+			return true;
+		}
+	}
+
+	return false;
+}
+
+/*
+ * sync_vio_dbg - start to get violation information by selecting violation
+ *		  group and enable violation shift.
+ *
+ * Returns sync done or not
+ */
+static u32 sync_vio_dbg(int slave_type, u32 shift_bit)
+{
+	u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+	void __iomem *pd_vio_shift_sta_reg;
+	void __iomem *pd_vio_shift_sel_reg;
+	void __iomem *pd_vio_shift_con_reg;
+	u32 shift_count;
+	u32 sync_done;
+
+	if (slave_type >= slave_type_num ||
+	    shift_bit >= (MOD_NO_IN_1_DEVAPC * 2)) {
+		pr_err(PFX "param check failed, %s:0x%x, %s:0x%x\n",
+		       "slave_type", slave_type,
+		       "shift_bit", shift_bit);
+		return 0;
+	}
+
+	pd_vio_shift_sta_reg = mtk_devapc_pd_get(slave_type, VIO_SHIFT_STA, 0);
+	pd_vio_shift_sel_reg = mtk_devapc_pd_get(slave_type, VIO_SHIFT_SEL, 0);
+	pd_vio_shift_con_reg = mtk_devapc_pd_get(slave_type, VIO_SHIFT_CON, 0);
+
+	writel(0x1 << shift_bit, pd_vio_shift_sel_reg);
+	writel(0x1, pd_vio_shift_con_reg);
+
+	for (shift_count = 0; (shift_count < 100) &&
+	     ((readl(pd_vio_shift_con_reg) & 0x3) != 0x3);
+	     ++shift_count)
+		;
+
+	if ((readl(pd_vio_shift_con_reg) & 0x3) == 0x3)
+		sync_done = 1;
+	else
+		sync_done = 0;
+
+	/* Disable shift mechanism */
+	writel(0x0, pd_vio_shift_con_reg);
+	writel(0x0, pd_vio_shift_sel_reg);
+	writel(0x1 << shift_bit, pd_vio_shift_sta_reg);
+
+	return sync_done;
+}
+
+static const char * const perm_to_str[] = {
+	"NO_PROTECTION",
+	"SECURE_RW_ONLY",
+	"SECURE_RW_NS_R_ONLY",
+	"FORBIDDEN",
+	"NO_PERM_CTRL"
+};
+
+static const char *perm_to_string(u8 perm)
+{
+	if (perm < PERM_TYPE_NUM)
+		return perm_to_str[perm];
+	else
+		return perm_to_str[PERM_TYPE_NUM];
+}
+
+static void devapc_vio_reason(u8 perm)
+{
+	pr_info(PFX "Permission setting: %s\n", perm_to_string(perm));
+
+	if (perm == NO_PROTECTION || perm >= PERM_TYPE_NUM)
+		pr_info(PFX "Reason: power/clock is not enabled\n");
+	else if (perm == SEC_RW_ONLY ||
+		 perm == SEC_RW_NS_R ||
+		 perm == FORBIDDEN)
+		pr_info(PFX "Reason: might be permission denied\n");
+}
+
+/*
+ * get_permission - get slave's access permission of domain id.
+ *
+ * Returns the value of access permission
+ */
+static u8 get_permission(int slave_type, int module_index, int domain)
+{
+	u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+	const struct mtk_device_info **device_info;
+	const struct mtk_device_num *ndevices;
+	int sys_index, ctrl_index, vio_index;
+	struct arm_smccc_res res;
+	u32 ret, apc_set_index;
+
+	ndevices = mtk_devapc_ctx->soc->ndevices;
+
+	if (slave_type >= slave_type_num ||
+	    module_index >= ndevices[slave_type].vio_slave_num) {
+		pr_err(PFX "%s: param check failed, %s:0x%x, %s:0x%x\n",
+		       __func__,
+		       "slave_type", slave_type,
+		       "module_index", module_index);
+		return 0xFF;
+	}
+
+	device_info = mtk_devapc_ctx->soc->device_info;
+
+	sys_index = device_info[slave_type][module_index].sys_index;
+	ctrl_index = device_info[slave_type][module_index].ctrl_index;
+	vio_index = device_info[slave_type][module_index].vio_index;
+
+	if (sys_index == -1 || ctrl_index == -1)
+		return 0xFF;
+
+	arm_smccc_smc(MTK_SIP_KERNEL_DAPC_PERM_GET, slave_type, sys_index,
+		      domain, ctrl_index, vio_index, 0, 0, &res);
+	ret = res.a0;
+
+	if (ret == DEAD) {
+		pr_err(PFX "%s: permission get failed, ret:0x%x\n",
+		       __func__, ret);
+		return 0xFF;
+	}
+
+	apc_set_index = ctrl_index % MOD_NO_IN_1_DEVAPC;
+	ret = (ret & (0x3 << (apc_set_index * 2))) >> (apc_set_index * 2);
+
+	return (ret & 0x3);
+}
+
+/*
+ * mtk_devapc_vio_check - check violation shift status is raised or not.
+ *
+ * Returns the value of violation shift status reg
+ */
+static void mtk_devapc_vio_check(int slave_type, int *shift_bit)
+{
+	u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+	struct mtk_devapc_vio_info *vio_info;
+	u32 vio_shift_sta;
+	int i;
+
+	if (slave_type >= slave_type_num) {
+		pr_err(PFX "%s: param check failed, %s:0x%x\n",
+		       __func__, "slave_type", slave_type);
+		return;
+	}
+
+	vio_info = mtk_devapc_ctx->soc->vio_info;
+	vio_shift_sta = readl(mtk_devapc_pd_get(slave_type, VIO_SHIFT_STA, 0));
+
+	if (!vio_shift_sta) {
+		pr_info(PFX "violation is triggered before. %s:0x%x\n",
+			"shift_bit", *shift_bit);
+
+	} else if (vio_shift_sta & (0x1UL << *shift_bit)) {
+		pr_debug(PFX "%s: 0x%x is matched with %s:%d\n",
+			 "vio_shift_sta", vio_shift_sta,
+			 "shift_bit", *shift_bit);
+
+	} else {
+		pr_info(PFX "%s: 0x%x is not matched with %s:%d\n",
+			"vio_shift_sta", vio_shift_sta,
+			"shift_bit", *shift_bit);
+
+		for (i = 0; i < MOD_NO_IN_1_DEVAPC * 2; i++) {
+			if (vio_shift_sta & (0x1 << i)) {
+				*shift_bit = i;
+				break;
+			}
+		}
+	}
+
+	vio_info->shift_sta_bit = *shift_bit;
+}
+
+static void devapc_extract_vio_dbg(int slave_type)
+{
+	u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+	void __iomem *vio_dbg0_reg, *vio_dbg1_reg, *vio_dbg2_reg;
+	const struct mtk_infra_vio_dbg_desc *vio_dbgs;
+	struct mtk_devapc_vio_info *vio_info;
+	u32 dbg0;
+
+	if (slave_type >= slave_type_num) {
+		pr_err(PFX "%s: param check failed, %s:0x%x\n",
+		       __func__, "slave_type", slave_type);
+		return;
+	}
+
+	vio_dbg0_reg = mtk_devapc_pd_get(slave_type, VIO_DBG0, 0);
+	vio_dbg1_reg = mtk_devapc_pd_get(slave_type, VIO_DBG1, 0);
+	vio_dbg2_reg = mtk_devapc_pd_get(slave_type, VIO_DBG2, 0);
+
+	vio_dbgs = mtk_devapc_ctx->soc->vio_dbgs;
+	vio_info = mtk_devapc_ctx->soc->vio_info;
+
+	/* Extract violation information */
+	dbg0 = readl(vio_dbg0_reg);
+	vio_info->master_id = readl(vio_dbg1_reg);
+	vio_info->vio_addr = readl(vio_dbg2_reg);
+
+	vio_info->domain_id = (dbg0 & vio_dbgs->vio_dbg_dmnid)
+		>> vio_dbgs->vio_dbg_dmnid_start_bit;
+	vio_info->write = ((dbg0 & vio_dbgs->vio_dbg_w_vio)
+			>> vio_dbgs->vio_dbg_w_vio_start_bit) == 1;
+	vio_info->read = ((dbg0 & vio_dbgs->vio_dbg_r_vio)
+			>> vio_dbgs->vio_dbg_r_vio_start_bit) == 1;
+	vio_info->vio_addr_high = (dbg0 & vio_dbgs->vio_addr_high)
+		>> vio_dbgs->vio_addr_high_start_bit;
+
+	devapc_vio_info_print();
+}
+
+/*
+ * mtk_devapc_dump_vio_dbg - shift & dump the violation debug information.
+ */
+static bool mtk_devapc_dump_vio_dbg(int slave_type, int *vio_idx, int *index)
+{
+	const struct mtk_device_info **device_info;
+	const struct mtk_device_num *ndevices;
+	void __iomem *pd_vio_shift_sta_reg;
+	u32 shift_bit;
+	int i;
+
+	if (!vio_idx)
+		return NULL;
+
+	device_info = mtk_devapc_ctx->soc->device_info;
+	ndevices = mtk_devapc_ctx->soc->ndevices;
+
+	pd_vio_shift_sta_reg = mtk_devapc_pd_get(slave_type, VIO_SHIFT_STA, 0);
+
+	for (i = 0; i < ndevices[slave_type].vio_slave_num; i++) {
+		if (!device_info[slave_type][i].enable_vio_irq)
+			continue;
+
+		*vio_idx = device_info[slave_type][i].vio_index;
+		if (check_vio_status(slave_type, *vio_idx) !=
+				VIOLATION_TRIGGERED)
+			continue;
+
+		shift_bit = mtk_devapc_ctx->soc->shift_group_get(slave_type,
+								 *vio_idx);
+
+		mtk_devapc_vio_check(slave_type, &shift_bit);
+
+		if (!sync_vio_dbg(slave_type, shift_bit))
+			continue;
+
+		devapc_extract_vio_dbg(slave_type);
+		*index = i;
+
+		return true;
+	}
+
+	return false;
+}
+
+/*
+ * start_devapc - initialize devapc status and start receiving interrupt
+ *		  while devapc violation is triggered.
+ */
+static void start_devapc(void)
+{
+	u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+	const struct mtk_device_info **device_info;
+	const struct mtk_device_num *ndevices;
+	void __iomem *pd_vio_shift_sta_reg;
+	void __iomem *pd_apc_con_reg;
+	int slave_type, i, vio_idx, index;
+	u32 vio_shift_sta;
+
+	ndevices = mtk_devapc_ctx->soc->ndevices;
+
+	device_info = mtk_devapc_ctx->soc->device_info;
+
+	for (slave_type = 0; slave_type < slave_type_num; slave_type++) {
+		pd_apc_con_reg = mtk_devapc_pd_get(slave_type, APC_CON, 0);
+		pd_vio_shift_sta_reg = mtk_devapc_pd_get
+			(slave_type, VIO_SHIFT_STA, 0);
+
+		if (!pd_apc_con_reg || !pd_vio_shift_sta_reg || !device_info)
+			return;
+
+		/* Clear DEVAPC violation status */
+		writel(BIT(31), pd_apc_con_reg);
+
+		/* Clear violation shift status */
+		vio_shift_sta = readl(pd_vio_shift_sta_reg);
+		if (vio_shift_sta)
+			writel(vio_shift_sta, pd_vio_shift_sta_reg);
+
+		check_type2_vio_status(slave_type, &vio_idx, &i);
+
+		/* Clear violation status */
+		for (i = 0; i < ndevices[slave_type].vio_slave_num; i++) {
+			if (!device_info[slave_type][i].enable_vio_irq)
+				continue;
+
+			vio_idx = device_info[slave_type][i].vio_index;
+			if ((check_vio_status(slave_type, vio_idx) ==
+					VIOLATION_TRIGGERED) &&
+					clear_vio_status(slave_type, vio_idx)) {
+				pr_warn(PFX "%s, %s:0x%x, %s:0x%x\n",
+					"clear vio status failed",
+					"slave_type", slave_type,
+					"vio_index", vio_idx);
+
+				index = i;
+				mtk_devapc_dump_vio_dbg(slave_type, &vio_idx,
+							&index);
+				i = index - 1;
+			}
+
+			mask_module_irq(slave_type, vio_idx, false);
+		}
+	}
+}
+
+/*
+ * devapc_extra_handler -
+ * 1. trigger kernel exception/kernel warning to increase devapc
+ * violation severity level
+ * 2. call subsys handler to get more debug information
+ */
+static void devapc_extra_handler(int slave_type, const char *vio_master,
+				 u32 vio_index, u32 vio_addr)
+{
+	const struct mtk_device_info **device_info;
+	struct mtk_devapc_dbg_status *dbg_stat;
+	struct mtk_devapc_vio_info *vio_info;
+	struct devapc_vio_callbacks *viocb;
+	char dispatch_key[48] = {0};
+	enum infra_subsys_id id;
+
+	device_info = mtk_devapc_ctx->soc->device_info;
+	dbg_stat = mtk_devapc_ctx->soc->dbg_stat;
+	vio_info = mtk_devapc_ctx->soc->vio_info;
+
+	pr_info(PFX "%s:%d\n", "vio_trigger_times",
+		mtk_devapc_ctx->soc->vio_info->vio_trigger_times++);
+
+	/* Dispatch slave owner if APMCU access. Others, dispatch master */
+	if (!strncmp(vio_master, "APMCU", 5))
+		strncpy(dispatch_key,
+			mtk_devapc_ctx->soc->subsys_get(slave_type, vio_index,
+							vio_addr),
+			sizeof(dispatch_key) - 1);
+	else
+		strncpy(dispatch_key, vio_master, sizeof(dispatch_key) - 1);
+
+	dispatch_key[sizeof(dispatch_key) - 1] = '\0';
+
+	/* Callback func for vio master */
+	if (!strncasecmp(vio_master, "MD", 2)) {
+		id = INFRA_SUBSYS_MD;
+		strncpy(dispatch_key, "MD", sizeof(dispatch_key) - 1);
+
+	} else if (!strncasecmp(vio_master, "CONN", 4) ||
+		   !strncasecmp(dispatch_key, "CONN", 4)) {
+		id = INFRA_SUBSYS_CONN;
+		strncpy(dispatch_key, "CONNSYS", sizeof(dispatch_key) - 1);
+
+	} else if (!strncasecmp(vio_master, "TINYSYS", 7)) {
+		id = INFRA_SUBSYS_ADSP;
+		strncpy(dispatch_key, "TINYSYS", sizeof(dispatch_key) - 1);
+
+	} else if (!strncasecmp(vio_master, "GCE", 3) ||
+		   !strncasecmp(dispatch_key, "GCE", 3)) {
+		id = INFRA_SUBSYS_GCE;
+		strncpy(dispatch_key, "GCE", sizeof(dispatch_key) - 1);
+
+	} else if (!strncasecmp(vio_master, "APMCU", 5)) {
+		if (vio_info->domain_id == 0)
+			id = INFRA_SUBSYS_APMCU;
+		else
+			id = INFRA_SUBSYS_GZ;
+	} else {
+		id = DEVAPC_SUBSYS_RESERVED;
+	}
+
+	list_for_each_entry(viocb, &viocb_list, list) {
+		if (viocb->id == id && viocb->debug_dump)
+			viocb->debug_dump();
+
+		/* always call clkmgr cb if it's registered */
+		if (viocb->id == DEVAPC_SUBSYS_CLKMGR &&
+		    viocb->debug_dump)
+			viocb->debug_dump();
+	}
+
+	/* Severity level */
+	if (dbg_stat->enable_WARN)
+		WARN(1, "Device APC Violation Issue/%s", dispatch_key);
+}
+
+/*
+ * devapc_violation_irq - the devapc Interrupt Service Routine (ISR) will dump
+ *			  violation information including which master violates
+ *			  access slave.
+ */
+static irqreturn_t devapc_violation_irq(int irq_number, void *dev_id)
+{
+	u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+	const struct mtk_device_info **device_info;
+	struct mtk_devapc_vio_info *vio_info;
+	int slave_type, vio_idx, index;
+	const char *vio_master;
+	unsigned long flags;
+	bool normal;
+	u8 perm;
+
+	spin_lock_irqsave(&devapc_lock, flags);
+
+	device_info = mtk_devapc_ctx->soc->device_info;
+	vio_info = mtk_devapc_ctx->soc->vio_info;
+	normal = false;
+	vio_idx = -1;
+	index = -1;
+
+	/* There are multiple DEVAPC_PD */
+	for (slave_type = 0; slave_type < slave_type_num; slave_type++) {
+		if (!check_type2_vio_status(slave_type, &vio_idx, &index))
+			if (!mtk_devapc_dump_vio_dbg(slave_type, &vio_idx,
+						     &index))
+				continue;
+
+		/* Ensure that violation info are written before
+		 * further operations
+		 */
+		smp_mb();
+		normal = true;
+
+		mask_module_irq(slave_type, vio_idx, true);
+
+		if (clear_vio_status(slave_type, vio_idx))
+			pr_warn(PFX "%s, %s:0x%x, %s:0x%x\n",
+				"clear vio status failed",
+				"slave_type", slave_type,
+				"vio_index", vio_idx);
+
+		perm = get_permission(slave_type, index, vio_info->domain_id);
+
+		vio_master = mtk_devapc_ctx->soc->master_get
+			(vio_info->master_id,
+			 vio_info->vio_addr,
+			 slave_type,
+			 vio_info->shift_sta_bit,
+			 vio_info->domain_id);
+
+		if (!vio_master) {
+			pr_warn(PFX "master_get failed\n");
+			vio_master = "UNKNOWN_MASTER";
+		}
+
+		pr_info(PFX "%s - %s:0x%x, %s:0x%x, %s:0x%x, %s:0x%x\n",
+			"Violation", "slave_type", slave_type,
+			"sys_index",
+			device_info[slave_type][index].sys_index,
+			"ctrl_index",
+			device_info[slave_type][index].ctrl_index,
+			"vio_index",
+			device_info[slave_type][index].vio_index);
+
+		pr_info(PFX "%s %s %s %s\n",
+			"Violation - master:", vio_master,
+			"access violation slave:",
+			device_info[slave_type][index].device);
+
+		devapc_vio_reason(perm);
+
+		devapc_extra_handler(slave_type, vio_master, vio_idx,
+				     vio_info->vio_addr);
+
+		mask_module_irq(slave_type, vio_idx, false);
+	}
+
+	if (normal) {
+		spin_unlock_irqrestore(&devapc_lock, flags);
+		return IRQ_HANDLED;
+	}
+
+	spin_unlock_irqrestore(&devapc_lock, flags);
+	return IRQ_HANDLED;
+}
+
+void register_devapc_vio_callback(struct devapc_vio_callbacks *viocb)
+{
+	INIT_LIST_HEAD(&viocb->list);
+	list_add_tail(&viocb->list, &viocb_list);
+}
+EXPORT_SYMBOL(register_devapc_vio_callback);
+
+/*
+ * mtk_devapc_dbg_read - dump status of struct mtk_devapc_dbg_status.
+ * Currently, we have 3 debug status:
+ * 1. enable_ut: enable/disable devapc ut commands
+ * 2. enable_WARN
+ * 3. enable_dapc: enable/disable dump access permission control
+ *
+ */
+ssize_t mtk_devapc_dbg_read(struct file *file, char __user *buffer,
+			    size_t count, loff_t *ppos)
+{
+	struct mtk_devapc_dbg_status *dbg_stat = mtk_devapc_ctx->soc->dbg_stat;
+	struct mtk_devapc_vio_info *vio_info = mtk_devapc_ctx->soc->vio_info;
+	char msg_buf[1024] = {0};
+	char *p = msg_buf;
+	int len;
+
+	if (!dbg_stat || !vio_info)
+		return -EINVAL;
+
+	devapc_log(p, msg_buf, "DEVAPC debug status:\n");
+	devapc_log(p, msg_buf, "\tenable_ut = %d\n", dbg_stat->enable_ut);
+	devapc_log(p, msg_buf, "\tenable_WARN = %d\n", dbg_stat->enable_WARN);
+	devapc_log(p, msg_buf, "\tenable_dapc = %d\n", dbg_stat->enable_dapc);
+	devapc_log(p, msg_buf, "\tviolation count = %d\n",
+		   vio_info->vio_trigger_times);
+	devapc_log(p, msg_buf, "\n");
+
+	len = p - msg_buf;
+
+	return simple_read_from_buffer(buffer, count, ppos, msg_buf, len);
+}
+
+/*
+ * mtk_devapc_dbg_write - control status of struct mtk_devapc_dbg_status.
+ * There are 4 nodes we can control:
+ * 1. enable_ut
+ * 2. enable_WARN
+ * 3. enable_dapc
+ * 4. dump_apc
+ */
+ssize_t mtk_devapc_dbg_write(struct file *file, const char __user *buffer,
+			     size_t count, loff_t *data)
+{
+	u32 slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+	long param, sys_index, domain, ctrl_index;
+	struct mtk_devapc_dbg_status *dbg_stat;
+	u32 slave_type, apc_set_idx, ret;
+	char *parm_str, *cmd_str, *pinput;
+	struct arm_smccc_res res;
+	char input[32] = {0};
+	int err, len;
+
+	dbg_stat = mtk_devapc_ctx->soc->dbg_stat;
+	if (!dbg_stat)
+		return -EINVAL;
+
+	len = (count < (sizeof(input) - 1)) ? count : (sizeof(input) - 1);
+	if (copy_from_user(input, buffer, len))
+		return -EFAULT;
+
+	input[len] = '\0';
+	pinput = input;
+
+	cmd_str = strsep(&pinput, " ");
+
+	if (!cmd_str)
+		return -EINVAL;
+
+	parm_str = strsep(&pinput, " ");
+
+	if (!parm_str)
+		return -EINVAL;
+
+	err = kstrtol(parm_str, 10, &param);
+
+	if (err)
+		return err;
+
+	if (!strncmp(cmd_str, "enable_ut", sizeof("enable_ut"))) {
+		dbg_stat->enable_ut = (param != 0);
+		return count;
+
+	} else if (!strncmp(cmd_str, "enable_WARN", sizeof("enable_WARN"))) {
+		if (dbg_stat->enable_ut)
+			dbg_stat->enable_WARN = (param != 0);
+
+		return count;
+
+	} else if (!strncmp(cmd_str, "enable_dapc", sizeof("enable_dapc"))) {
+		dbg_stat->enable_dapc = (param != 0);
+
+		return count;
+
+	} else if (!strncmp(cmd_str, "dump_apc", sizeof("dump_apc"))) {
+		if (!dbg_stat->enable_dapc)
+			return -EINVAL;
+
+		/* slave_type is already parse before */
+		slave_type = (u32)param;
+
+		if (slave_type >= slave_type_num)
+			return -EFAULT;
+
+		sys_index = 0xFFFFFFFF;
+		ctrl_index = 0xFFFFFFFF;
+		domain = DOMAIN_OTHERS;
+
+		/* Parse sys_index */
+		parm_str = strsep(&pinput, " ");
+		if (parm_str)
+			err = kstrtol(parm_str, 10, &sys_index);
+
+		/* Parse domain id */
+		parm_str = strsep(&pinput, " ");
+		if (parm_str)
+			err = kstrtol(parm_str, 10, &domain);
+
+		/* Parse ctrl_index */
+		parm_str = strsep(&pinput, " ");
+		if (parm_str)
+			err = kstrtol(parm_str, 10, &ctrl_index);
+
+		arm_smccc_smc(MTK_SIP_KERNEL_DAPC_PERM_GET, slave_type,
+			      sys_index, domain, ctrl_index, 0, 0, 0, &res);
+		ret = res.a0;
+
+		if (ret == DEAD)
+			return -EINVAL;
+
+		apc_set_idx = ctrl_index % MOD_NO_IN_1_DEVAPC;
+		ret = (ret & (0x3 << (apc_set_idx * 2))) >> (apc_set_idx * 2);
+
+		pr_info(PFX "Permission is %s\n",
+			perm_to_string((ret & 0x3)));
+
+		return count;
+	}
+
+	return -EINVAL;
+}
+
+static const struct file_operations devapc_dbg_fops = {
+	.owner = THIS_MODULE,
+	.write = mtk_devapc_dbg_write,
+	.read = mtk_devapc_dbg_read,
+};
+
+int mtk_devapc_probe(struct platform_device *pdev, struct mtk_devapc_soc *soc)
+{
+	struct device_node *node = pdev->dev.of_node;
+	u32 slave_type_num;
+	int slave_type;
+	int ret;
+
+	if (IS_ERR(node))
+		return -ENODEV;
+
+	mtk_devapc_ctx->soc = soc;
+	slave_type_num = mtk_devapc_ctx->soc->slave_type_num;
+
+	for (slave_type = 0; slave_type < slave_type_num; slave_type++) {
+		mtk_devapc_ctx->devapc_pd_base[slave_type] =
+			of_iomap(node, slave_type);
+		if (!mtk_devapc_ctx->devapc_pd_base[slave_type])
+			return -EINVAL;
+	}
+
+	mtk_devapc_ctx->infracfg_base = of_iomap(node, slave_type_num + 1);
+	if (!mtk_devapc_ctx->infracfg_base)
+		return -EINVAL;
+
+	mtk_devapc_ctx->devapc_irq = irq_of_parse_and_map(node, 0);
+	if (!mtk_devapc_ctx->devapc_irq)
+		return -EINVAL;
+
+	/* CCF (Common Clock Framework) */
+	mtk_devapc_ctx->devapc_infra_clk = devm_clk_get(&pdev->dev,
+							"devapc-infra-clock");
+
+	if (IS_ERR(mtk_devapc_ctx->devapc_infra_clk))
+		return -EINVAL;
+
+	proc_create("devapc_dbg", 0664, NULL, &devapc_dbg_fops);
+
+	if (clk_prepare_enable(mtk_devapc_ctx->devapc_infra_clk))
+		return -EINVAL;
+
+	start_devapc();
+
+	ret = devm_request_irq(&pdev->dev, mtk_devapc_ctx->devapc_irq,
+			       (irq_handler_t)devapc_violation_irq,
+			       IRQF_TRIGGER_NONE, "devapc", NULL);
+	if (ret) {
+		pr_err(PFX "request devapc irq failed, ret:%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_devapc_probe);
+
+int mtk_devapc_remove(struct platform_device *dev)
+{
+	clk_disable_unprepare(mtk_devapc_ctx->devapc_infra_clk);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_devapc_remove);
+
+MODULE_DESCRIPTION("Mediatek Device APC Driver");
+MODULE_AUTHOR("Neal Liu <neal.liu@mediatek.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/soc/mediatek/devapc/devapc-mtk-multi-ao.h b/drivers/soc/mediatek/devapc/devapc-mtk-multi-ao.h
new file mode 100644
index 0000000..e321184
--- /dev/null
+++ b/drivers/soc/mediatek/devapc/devapc-mtk-multi-ao.h
@@ -0,0 +1,183 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ */
+
+#ifndef __DEVAPC_MTK_MULTI_AO_H__
+#define __DEVAPC_MTK_MULTI_AO_H__
+
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+/******************************************************************************
+ * VARIABLE DEFINATION
+ ******************************************************************************/
+#define MOD_NO_IN_1_DEVAPC	16
+#define VIOLATION_TRIGGERED	1
+#define DEAD			0xdeadbeaf
+#define PFX			"[DEVAPC]: "
+#define SLAVE_TYPE_NUM_MAX	5
+
+#define devapc_log(p, s, fmt, args...) \
+	do { \
+		typeof(p) (_p) = (p); \
+		((_p) += scnprintf(_p, sizeof(s) - strlen(s), fmt, ##args)); \
+	} while (0)
+
+#define UNUSED(x)		(void)(x)
+
+/******************************************************************************
+ * DATA STRUCTURE & FUNCTION DEFINATION
+ ******************************************************************************/
+enum DEVAPC_PD_REG_TYPE {
+	VIO_MASK = 0,
+	VIO_STA,
+	VIO_DBG0,
+	VIO_DBG1,
+	VIO_DBG2,
+	APC_CON,
+	VIO_SHIFT_STA,
+	VIO_SHIFT_SEL,
+	VIO_SHIFT_CON,
+	PD_REG_TYPE_NUM,
+};
+
+enum DEVAPC_UT_CMD {
+	DEVAPC_UT_DAPC_VIO = 1,
+	DEVAPC_UT_SRAM_VIO,
+};
+
+enum DEVAPC_DOM_ID {
+	DOMAIN_0 = 0,
+	DOMAIN_1,
+	DOMAIN_2,
+	DOMAIN_3,
+	DOMAIN_4,
+	DOMAIN_5,
+	DOMAIN_6,
+	DOMAIN_7,
+	DOMAIN_8,
+	DOMAIN_9,
+	DOMAIN_10,
+	DOMAIN_11,
+	DOMAIN_12,
+	DOMAIN_13,
+	DOMAIN_14,
+	DOMAIN_15,
+	DOMAIN_OTHERS,
+};
+
+enum SRAMROM_VIO {
+	ROM_VIOLATION = 0,
+	SRAM_VIOLATION,
+};
+
+enum DEVAPC_PERM_TYPE {
+	NO_PROTECTION = 0,
+	SEC_RW_ONLY,
+	SEC_RW_NS_R,
+	FORBIDDEN,
+	PERM_TYPE_NUM,
+};
+
+struct mtk_devapc_dbg_status {
+	bool enable_ut;
+	bool enable_WARN;
+	bool enable_dapc; /* dump APC */
+};
+
+struct mtk_device_info {
+	int sys_index;
+	int ctrl_index;
+	int vio_index;
+	const char *device;
+	bool enable_vio_irq;
+};
+
+struct mtk_device_num {
+	int slave_type;
+	u32 vio_slave_num;
+};
+
+struct mtk_devapc_vio_info {
+	bool read;
+	bool write;
+	u32 vio_addr;
+	u32 vio_addr_high;
+	u32 master_id;
+	u32 domain_id;
+	int *vio_mask_sta_num;
+	int sramrom_slv_type;
+	int sramrom_vio_idx;
+	int mm2nd_slv_type;
+	int mdp_vio_idx;
+	int disp2_vio_idx;
+	int mmsys_vio_idx;
+	int vio_trigger_times;
+	int shift_sta_bit;
+};
+
+struct mtk_infra_vio_dbg_desc {
+	u32 vio_dbg_mstid;
+	u8 vio_dbg_mstid_start_bit;
+	u32 vio_dbg_dmnid;
+	u8 vio_dbg_dmnid_start_bit;
+	u32 vio_dbg_w_vio;
+	u8 vio_dbg_w_vio_start_bit;
+	u32 vio_dbg_r_vio;
+	u8 vio_dbg_r_vio_start_bit;
+	u32 vio_addr_high;
+	u8 vio_addr_high_start_bit;
+};
+
+struct mtk_sramrom_sec_vio_desc {
+	u32 vio_id_mask;
+	u8 vio_id_shift;
+	u32 vio_domain_mask;
+	u8 vio_domain_shift;
+	u32 vio_rw_mask;
+	u8 vio_rw_shift;
+};
+
+struct mtk_devapc_pd_desc {
+	u32 pd_vio_mask_offset;
+	u32 pd_vio_sta_offset;
+	u32 pd_vio_dbg0_offset;
+	u32 pd_vio_dbg1_offset;
+	u32 pd_apc_con_offset;
+	u32 pd_shift_sta_offset;
+	u32 pd_shift_sel_offset;
+	u32 pd_shift_con_offset;
+};
+
+struct mtk_devapc_soc {
+	struct mtk_devapc_dbg_status *dbg_stat;
+	const char * const *slave_type_arr;
+	u32 slave_type_num;
+	const struct mtk_device_info *device_info[SLAVE_TYPE_NUM_MAX];
+	const struct mtk_device_num *ndevices;
+	struct mtk_devapc_vio_info *vio_info;
+	const struct mtk_infra_vio_dbg_desc *vio_dbgs;
+	const struct mtk_sramrom_sec_vio_desc *sramrom_sec_vios;
+	const u32 *devapc_pds;
+
+	/* platform specific operations */
+	const char* (*subsys_get)(int slave_type, u32 vio_index,
+				  u32 vio_addr);
+	const char* (*master_get)(u32 bus_id, u32 vio_addr,
+				  int slave_type, int shift_sta_bit,
+				  int domain);
+	void (*mm2nd_vio_handler)(void __iomem *infracfg,
+				  struct mtk_devapc_vio_info *vio_info,
+				  bool mdp_vio, bool disp2_vio, bool mmsys_vio);
+	u32 (*shift_group_get)(int slave_type, u32 vio_index);
+};
+
+int mtk_devapc_probe(struct platform_device *pdev, struct mtk_devapc_soc *soc);
+int mtk_devapc_remove(struct platform_device *dev);
+ssize_t mtk_devapc_dbg_read(struct file *file, char __user *buffer,
+			    size_t count, loff_t *ppos);
+ssize_t mtk_devapc_dbg_write(struct file *file, const char __user *buffer,
+			     size_t count, loff_t *data);
+
+#endif /* __DEVAPC_MTK_MULTI_AO_H__ */
diff --git a/include/linux/soc/mediatek/devapc_public.h b/include/linux/soc/mediatek/devapc_public.h
new file mode 100644
index 0000000..085c4b5
--- /dev/null
+++ b/include/linux/soc/mediatek/devapc_public.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ */
+
+#ifndef __DEVAPC_PUBLIC_H__
+#define __DEVAPC_PUBLIC_H__
+
+#include <linux/types.h>
+
+enum infra_subsys_id {
+	INFRA_SUBSYS_MD = 0,
+	INFRA_SUBSYS_CONN,
+	INFRA_SUBSYS_ADSP,
+	INFRA_SUBSYS_GCE,
+	INFRA_SUBSYS_APMCU,
+	INFRA_SUBSYS_GZ,
+	DEVAPC_SUBSYS_CLKMGR,
+	DEVAPC_SUBSYS_TEST,
+	DEVAPC_SUBSYS_RESERVED,
+};
+
+enum devapc_cb_status {
+	DEVAPC_OK = 0,
+	DEVAPC_NOT_KE,
+};
+
+struct devapc_vio_callbacks {
+	struct list_head list;
+	enum infra_subsys_id id;
+	void (*debug_dump)(void);
+	enum devapc_cb_status (*debug_dump_adv)(uint32_t vio_addr);
+};
+
+uint32_t devapc_vio_check(void);
+void dump_dbg_info(void);
+void register_devapc_vio_callback(struct devapc_vio_callbacks *viocb);
+void devapc_catch_illegal_range(phys_addr_t phys_addr, size_t size);
+
+#endif  /* __DEVAPC_PUBLIC_H__ */
+
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
