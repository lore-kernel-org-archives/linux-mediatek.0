Return-Path: <SRS0=kVE3=AW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C8BC433E6
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 06:50:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56F1620720
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 06:50:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sXlFps5l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ItWXNmQh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56F1620720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/2PMatOb4Ax2rU1I8g9fHMw5ENoSz1AgRynea+tYTZ0=; b=sXlFps5l3RvmfBBdG4UKdkzxo
	0A2LN48BDLRvmudzF1hLbr2I1irjS4bG30qSa9NLuhqiCVn5cSJnUs8S/AnGikGmTT6EoX779sPmi
	Gxamc9ZNUNVVsa7yy/RP4ndUZ82cB8kDdLUfFCoeoBUJ4mgquZZsFYRmat00/MbKSQKHfaMYd04/U
	av8D6Yk4KZkyDERIc0OJ+MtHGqRQVHOkBVUiQnDMkCBpnUetwBdm1W7rIAq6+J8h0cy9LU8bzF71Z
	67VkLMZhKqu5pg+ZZ7mZzdOt2l4p/pNaiX0JUe3ixuq1mcnOzA3s5jODlYuB48R4F+cpxoz2c/PNJ
	TcnEvABGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju9Kl-00012s-4V; Sat, 11 Jul 2020 06:50:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju9Ke-00010z-Hy; Sat, 11 Jul 2020 06:49:57 +0000
X-UUID: c4737b200cbf4ec7b8d1d240f2cd1541-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=al19z6H/YaqTz2BTaMdhxJZ6fCtCLvOHwFXYnTxISm0=; 
 b=ItWXNmQhdyZlYK/65/8SI0A2ShA/GOKVvnOAF3fEZhzsKCjDe4wyw9fIYL8FVSs9tEw93gAR8DG9mHH2QqlTnyZIOysq/xU/JV9EpX5tmC8YL5uqzrsTcuhXppp5EtX5ULrUaGT8XMjl2sGMS49LSxZSGJa138O4/wGjS7oRRho=;
X-UUID: c4737b200cbf4ec7b8d1d240f2cd1541-20200710
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 916806429; Fri, 10 Jul 2020 22:49:43 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 23:49:49 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 14:49:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jul 2020 14:49:46 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 01/21] dt-binding: memory: mediatek: Add a common larb-port
 header file
Date: Sat, 11 Jul 2020 14:48:26 +0800
Message-ID: <20200711064846.16007-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200711064846.16007-1-yong.wu@mediatek.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B97F24F9EE4D61C0789D119FFDC457957A99B8B58BF659875E97995F26A574632000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_024956_754090_6D98525A 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, Tomasz
 Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Put all the macros about smi larb/port togethers, this is a preparing
patch for extending LARB_NR and adding new dom-id support.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 include/dt-bindings/memory/mt2712-larb-port.h  |  2 +-
 include/dt-bindings/memory/mt6779-larb-port.h  |  2 +-
 include/dt-bindings/memory/mt8173-larb-port.h  |  2 +-
 include/dt-bindings/memory/mt8183-larb-port.h  |  2 +-
 include/dt-bindings/memory/mtk-smi-larb-port.h | 15 +++++++++++++++
 5 files changed, 19 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/memory/mtk-smi-larb-port.h

diff --git a/include/dt-bindings/memory/mt2712-larb-port.h b/include/dt-bindings/memory/mt2712-larb-port.h
index 6f9aa7349cef..b6b2c6bf4459 100644
--- a/include/dt-bindings/memory/mt2712-larb-port.h
+++ b/include/dt-bindings/memory/mt2712-larb-port.h
@@ -6,7 +6,7 @@
 #ifndef __DTS_IOMMU_PORT_MT2712_H
 #define __DTS_IOMMU_PORT_MT2712_H
 
-#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
+#include <dt-bindings/memory/mtk-smi-larb-port.h>
 
 #define M4U_LARB0_ID			0
 #define M4U_LARB1_ID			1
diff --git a/include/dt-bindings/memory/mt6779-larb-port.h b/include/dt-bindings/memory/mt6779-larb-port.h
index 2ad0899fbf2f..60f57f54393e 100644
--- a/include/dt-bindings/memory/mt6779-larb-port.h
+++ b/include/dt-bindings/memory/mt6779-larb-port.h
@@ -7,7 +7,7 @@
 #ifndef _DTS_IOMMU_PORT_MT6779_H_
 #define _DTS_IOMMU_PORT_MT6779_H_
 
-#define MTK_M4U_ID(larb, port)		 (((larb) << 5) | (port))
+#include <dt-bindings/memory/mtk-smi-larb-port.h>
 
 #define M4U_LARB0_ID			 0
 #define M4U_LARB1_ID			 1
diff --git a/include/dt-bindings/memory/mt8173-larb-port.h b/include/dt-bindings/memory/mt8173-larb-port.h
index 9f31ccfeca21..d8c99c946053 100644
--- a/include/dt-bindings/memory/mt8173-larb-port.h
+++ b/include/dt-bindings/memory/mt8173-larb-port.h
@@ -6,7 +6,7 @@
 #ifndef __DTS_IOMMU_PORT_MT8173_H
 #define __DTS_IOMMU_PORT_MT8173_H
 
-#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
+#include <dt-bindings/memory/mtk-smi-larb-port.h>
 
 #define M4U_LARB0_ID			0
 #define M4U_LARB1_ID			1
diff --git a/include/dt-bindings/memory/mt8183-larb-port.h b/include/dt-bindings/memory/mt8183-larb-port.h
index 2c579f305162..275c095a6fd6 100644
--- a/include/dt-bindings/memory/mt8183-larb-port.h
+++ b/include/dt-bindings/memory/mt8183-larb-port.h
@@ -6,7 +6,7 @@
 #ifndef __DTS_IOMMU_PORT_MT8183_H
 #define __DTS_IOMMU_PORT_MT8183_H
 
-#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
+#include <dt-bindings/memory/mtk-smi-larb-port.h>
 
 #define M4U_LARB0_ID			0
 #define M4U_LARB1_ID			1
diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
new file mode 100644
index 000000000000..2ec7fe5ce4e9
--- /dev/null
+++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Yong Wu <yong.wu@mediatek.com>
+ */
+#ifndef __DTS_MTK_IOMMU_PORT_H_
+#define __DTS_MTK_IOMMU_PORT_H_
+
+#define MTK_LARB_NR_MAX			16
+
+#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
+#define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0xf)
+#define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
+
+#endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
