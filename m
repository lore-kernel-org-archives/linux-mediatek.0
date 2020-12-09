Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76570C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:02:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA03823B87
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA03823B87
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7q9omamnonSGOn0hN5cOUKFYuCPSO+UN3YM/kTEXKAA=; b=YqmKgSIrWRyP1rZScWlKlEYh0
	ONfRwXIK7cMhYVQuzi7yenNFVFP92kSmWJdmLyymNo81x32wWff2aEIjq6XCBbEGaOxUXEkVp1dEh
	xIX98hDwrZrucJcbHda1ZzDBdOwcp2RO6+ujjKf96UtGKN1fV+H21Hq3ghE65S4aI9n7Iiu6PEzKG
	pqw4H7yD+yObLdu1fnnk6+Yc1QLISy3Uc472VqGUqRTamOdQssxYACAV4y9EoSJ6fEC4PsQ1YmHZ3
	RrjcKIJQa7CObgWxjJjrQVzjwF8DMB93lju5nprJjDYo4wmTFHTQzzlh+8Ly0FBXaYVl0yFZ5mdfz
	aUpp2gNUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmuQ6-0004RO-D1; Wed, 09 Dec 2020 08:01:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmuQ2-0004QI-Ru; Wed, 09 Dec 2020 08:01:51 +0000
X-UUID: 40500d20595f460c921f1aef8f2a456c-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=k/yzc9xQTyYsE2xP1FrcWIvFIv+IFxhsciRLmdT9/7I=; 
 b=BCoY5Fr00qvFisJ1t6coR50V5+QJ+CUVsLyKVzgjeIP4b6N7ucjiESIYSrjIG42jvq4VfiYNrtCOpHvhIiTO2n7DWraGcEa/d+YBzwApYiA8l+/hryhh5UyXUDoVikYkzU6zvU/TTyalbWgBAgcbZBHr/Sj0eAuUDgW51Dx+Dow=;
X-UUID: 40500d20595f460c921f1aef8f2a456c-20201209
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 541049919; Wed, 09 Dec 2020 00:01:45 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 00:01:43 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:01:41 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 16:01:41 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v5 02/27] dt-bindings: memory: mediatek: Add a common
 larb-port header file
Date: Wed, 9 Dec 2020 16:00:37 +0800
Message-ID: <20201209080102.26626-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201209080102.26626-1-yong.wu@mediatek.com>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_030151_083052_65EFBE68 
X-CRM114-Status: GOOD (  16.14  )
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
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Put all the macros about smi larb/port togethers, this is a preparing
patch for extending LARB_NR and adding new dom-id support.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 include/dt-bindings/memory/mt2712-larb-port.h  |  2 +-
 include/dt-bindings/memory/mt6779-larb-port.h  |  2 +-
 include/dt-bindings/memory/mt8167-larb-port.h  |  2 +-
 include/dt-bindings/memory/mt8173-larb-port.h  |  2 +-
 include/dt-bindings/memory/mt8183-larb-port.h  |  2 +-
 include/dt-bindings/memory/mtk-smi-larb-port.h | 15 +++++++++++++++
 6 files changed, 20 insertions(+), 5 deletions(-)
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
diff --git a/include/dt-bindings/memory/mt8167-larb-port.h b/include/dt-bindings/memory/mt8167-larb-port.h
index 000fb299a408..fcb9a49ec60e 100644
--- a/include/dt-bindings/memory/mt8167-larb-port.h
+++ b/include/dt-bindings/memory/mt8167-larb-port.h
@@ -8,7 +8,7 @@
 #ifndef __DTS_IOMMU_PORT_MT8167_H
 #define __DTS_IOMMU_PORT_MT8167_H
 
-#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
+#include <dt-bindings/memory/mtk-smi-larb-port.h>
 
 #define M4U_LARB0_ID			0
 #define M4U_LARB1_ID			1
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
index 000000000000..53354cf4f6e3
--- /dev/null
+++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Yong Wu <yong.wu@mediatek.com>
+ */
+#ifndef __DT_BINDINGS_MEMORY_MTK_MEMORY_PORT_H_
+#define __DT_BINDINGS_MEMORY_MTK_MEMORY_PORT_H_
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
