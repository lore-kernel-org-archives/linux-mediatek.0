Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D204AC433E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:31:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 794FF22482
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 794FF22482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hqrw6qcqZyaTi3Hif7M20tshyrYY1RMvcjH00a2YzCQ=; b=G0xnuzD593RlyAwjAKlaETpCQ
	zfJMY7f89iJrx9i+PJdK4Oh7j42j27u3JGO7LZxePkESCoUbXc3fpknzeAT4vrI1IoEQlfRcQ3GNX
	4ItxrlJQ2rwSuGIB72+Hnwp9vEGOT7X8Lat7tc3Gyhit6Vh//q9CWtgkmOTTqCzLUW/oxsuq432ee
	BOlzVLWtGzN3XbtpcWsDrzTwT89cwV7iiJC9paLs/og+sSYjtewdwmEUwfSzkdwtsGIU1G990D1wY
	o/QpyRmFuCuQM3v7rzZD8HNh8/hb+0YKh1C4TepDJAuehuOUjj4/yzl9M44kkZFBqTH0w/lh267YE
	dq07h2Bzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyvPo-0005Tf-3x; Mon, 11 Jan 2021 11:31:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyvOx-000558-Tb; Mon, 11 Jan 2021 11:30:27 +0000
X-UUID: 7cba74a1f0ae4d0081696405250d4a65-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HyPGI27Df0V0KuqRhFPkTe5ErUqUe+V63zAU4Mc06uU=; 
 b=EOufGf4aMOfVHhwzr8kVxeWtx8Pgq0wrsjzfRw7wcwV2dkbCFac/n0pmjNN53mOXhQ0cSuzB9PFEcl3wkPSLPBEb8Vnw6E2I1VFWeuHduvNXzCfZmpkOecQ3OZU8M1VmnDPaT6UcXuF2Uau2ni9dFy1ttjnX30GqNCmEvhAstso=;
X-UUID: 7cba74a1f0ae4d0081696405250d4a65-20210111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1980774839; Mon, 11 Jan 2021 03:30:14 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 03:20:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 19:20:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 19:20:10 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v6 04/33] dt-bindings: memory: mediatek: Rename header guard
 for SMI header file
Date: Mon, 11 Jan 2021 19:18:45 +0800
Message-ID: <20210111111914.22211-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_063024_175807_6821D7AF 
X-CRM114-Status: GOOD (  11.68  )
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

Only rename the header guard for all the SoC larb port header file.
No funtional change.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/memory/mt2701-larb-port.h | 4 ++--
 include/dt-bindings/memory/mt2712-larb-port.h | 4 ++--
 include/dt-bindings/memory/mt6779-larb-port.h | 4 ++--
 include/dt-bindings/memory/mt8167-larb-port.h | 4 ++--
 include/dt-bindings/memory/mt8173-larb-port.h | 4 ++--
 include/dt-bindings/memory/mt8183-larb-port.h | 4 ++--
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/dt-bindings/memory/mt2701-larb-port.h b/include/dt-bindings/memory/mt2701-larb-port.h
index 2d85c2ec6cfd..25d03526f142 100644
--- a/include/dt-bindings/memory/mt2701-larb-port.h
+++ b/include/dt-bindings/memory/mt2701-larb-port.h
@@ -4,8 +4,8 @@
  * Author: Honghui Zhang <honghui.zhang@mediatek.com>
  */
 
-#ifndef _MT2701_LARB_PORT_H_
-#define _MT2701_LARB_PORT_H_
+#ifndef _DT_BINDINGS_MEMORY_MT2701_LARB_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT2701_LARB_PORT_H_
 
 /*
  * Mediatek m4u generation 1 such as mt2701 has flat m4u port numbers,
diff --git a/include/dt-bindings/memory/mt2712-larb-port.h b/include/dt-bindings/memory/mt2712-larb-port.h
index 83e8070b4c1c..e41a2841bcff 100644
--- a/include/dt-bindings/memory/mt2712-larb-port.h
+++ b/include/dt-bindings/memory/mt2712-larb-port.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2017 MediaTek Inc.
  * Author: Yong Wu <yong.wu@mediatek.com>
  */
-#ifndef __DTS_IOMMU_PORT_MT2712_H
-#define __DTS_IOMMU_PORT_MT2712_H
+#ifndef _DT_BINDINGS_MEMORY_MT2712_LARB_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT2712_LARB_PORT_H_
 
 #include <dt-bindings/memory/mtk-memory-port.h>
 
diff --git a/include/dt-bindings/memory/mt6779-larb-port.h b/include/dt-bindings/memory/mt6779-larb-port.h
index 91b0be285f41..3fb438a96e35 100644
--- a/include/dt-bindings/memory/mt6779-larb-port.h
+++ b/include/dt-bindings/memory/mt6779-larb-port.h
@@ -4,8 +4,8 @@
  * Author: Chao Hao <chao.hao@mediatek.com>
  */
 
-#ifndef _DTS_IOMMU_PORT_MT6779_H_
-#define _DTS_IOMMU_PORT_MT6779_H_
+#ifndef _DT_BINDINGS_MEMORY_MT6779_LARB_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT6779_LARB_PORT_H_
 
 #include <dt-bindings/memory/mtk-memory-port.h>
 
diff --git a/include/dt-bindings/memory/mt8167-larb-port.h b/include/dt-bindings/memory/mt8167-larb-port.h
index 13925c4fee00..aae57d4824ca 100644
--- a/include/dt-bindings/memory/mt8167-larb-port.h
+++ b/include/dt-bindings/memory/mt8167-larb-port.h
@@ -5,8 +5,8 @@
  * Author: Honghui Zhang <honghui.zhang@mediatek.com>
  * Author: Fabien Parent <fparent@baylibre.com>
  */
-#ifndef __DTS_IOMMU_PORT_MT8167_H
-#define __DTS_IOMMU_PORT_MT8167_H
+#ifndef _DT_BINDINGS_MEMORY_MT8167_LARB_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT8167_LARB_PORT_H_
 
 #include <dt-bindings/memory/mtk-memory-port.h>
 
diff --git a/include/dt-bindings/memory/mt8173-larb-port.h b/include/dt-bindings/memory/mt8173-larb-port.h
index c2379b3236d6..167a7fc51868 100644
--- a/include/dt-bindings/memory/mt8173-larb-port.h
+++ b/include/dt-bindings/memory/mt8173-larb-port.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2015-2016 MediaTek Inc.
  * Author: Yong Wu <yong.wu@mediatek.com>
  */
-#ifndef __DTS_IOMMU_PORT_MT8173_H
-#define __DTS_IOMMU_PORT_MT8173_H
+#ifndef _DT_BINDINGS_MEMORY_MT8173_LARB_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT8173_LARB_PORT_H_
 
 #include <dt-bindings/memory/mtk-memory-port.h>
 
diff --git a/include/dt-bindings/memory/mt8183-larb-port.h b/include/dt-bindings/memory/mt8183-larb-port.h
index de8bf81b5d9e..36abdf0ce5a2 100644
--- a/include/dt-bindings/memory/mt8183-larb-port.h
+++ b/include/dt-bindings/memory/mt8183-larb-port.h
@@ -3,8 +3,8 @@
  * Copyright (c) 2018 MediaTek Inc.
  * Author: Yong Wu <yong.wu@mediatek.com>
  */
-#ifndef __DTS_IOMMU_PORT_MT8183_H
-#define __DTS_IOMMU_PORT_MT8183_H
+#ifndef _DT_BINDINGS_MEMORY_MT8183_LARB_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT8183_LARB_PORT_H_
 
 #include <dt-bindings/memory/mtk-memory-port.h>
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
