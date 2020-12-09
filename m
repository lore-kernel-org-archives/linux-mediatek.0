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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDC0C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:13:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21ED423B98
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21ED423B98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kTgeGBT5WhvvTKXj9SmhL6ekA2Gekj1XMG3CKQn1sT4=; b=is53GeYZbUI1PX8H5LlVE6vc3
	ekPG/La1y0WTcoHd4BB0Rsw873flPvTCtKO2eqHUUeCuWFq5KaohGUYCbYBxHEV4i49E3t70VZlzU
	xggBBhsNApOtDVsZOfwsqpJE72J74FVOwgyODn7+DAPIL+3zFo5I7+urw3vbA4RGQH1j4XkGK5y5J
	pXUd/YaIbtljiQ/fQRfYe0rA1ge1c77mLQYIUCHDoVdDW80+5SFrHGyj2oTUSi/O2RFtZ0tRLRLb1
	6oD4/7rdlVqRQ6OTWKod+tSHiauwRHgWOA/GKQ8byOsJ4jEF4+/EhVmzoxT14g5siYoW7gwSBy9eq
	3UJRiNYsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmuZl-0006On-1i; Wed, 09 Dec 2020 08:11:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmuZX-0006H8-2q; Wed, 09 Dec 2020 08:11:40 +0000
X-UUID: 47c796dee8bc4612a6c21a90c7243cbe-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qIZq1oGv4lzd44ZPcZLr3O+supNCn3ovk2vn+kwAmyI=; 
 b=mgBkY/WR3ocU6Bl/rBSrTrPzvW+tK2+A6TfNGg9Y8YJ4k3FSlo51KVb423Pk2LloXQSlc9RUk4ezpCe5SNJVVWw/276ja744o/LTFpV9WYtM1kJv4xmfgUq/ljP9wH/F/2LAV+JamqNbms/ds9yUCZFQu8P8cscHLi1QkaUkRSE=;
X-UUID: 47c796dee8bc4612a6c21a90c7243cbe-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1769432288; Wed, 09 Dec 2020 00:11:33 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 00:02:10 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:02:09 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 16:02:08 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v5 05/27] dt-bindings: memory: mediatek: Rename header guard
 for SMI header file
Date: Wed, 9 Dec 2020 16:00:40 +0800
Message-ID: <20201209080102.26626-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201209080102.26626-1-yong.wu@mediatek.com>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_031139_282354_8B389E15 
X-CRM114-Status: GOOD (  12.10  )
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
index b6b2c6bf4459..5c7f303f078c 100644
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
 
 #include <dt-bindings/memory/mtk-smi-larb-port.h>
 
diff --git a/include/dt-bindings/memory/mt6779-larb-port.h b/include/dt-bindings/memory/mt6779-larb-port.h
index 60f57f54393e..bc93757df2bf 100644
--- a/include/dt-bindings/memory/mt6779-larb-port.h
+++ b/include/dt-bindings/memory/mt6779-larb-port.h
@@ -4,8 +4,8 @@
  * Author: Chao Hao <chao.hao@mediatek.com>
  */
 
-#ifndef _DTS_IOMMU_PORT_MT6779_H_
-#define _DTS_IOMMU_PORT_MT6779_H_
+#ifndef _DT_BINDINGS_MEMORY_MT6779_LARB_PORT_H_
+#define _DT_BINDINGS_MEMORY_MT6779_LARB_PORT_H_
 
 #include <dt-bindings/memory/mtk-smi-larb-port.h>
 
diff --git a/include/dt-bindings/memory/mt8167-larb-port.h b/include/dt-bindings/memory/mt8167-larb-port.h
index fcb9a49ec60e..8570aab09db8 100644
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
 
 #include <dt-bindings/memory/mtk-smi-larb-port.h>
 
diff --git a/include/dt-bindings/memory/mt8173-larb-port.h b/include/dt-bindings/memory/mt8173-larb-port.h
index d8c99c946053..1b568973fc2d 100644
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
 
 #include <dt-bindings/memory/mtk-smi-larb-port.h>
 
diff --git a/include/dt-bindings/memory/mt8183-larb-port.h b/include/dt-bindings/memory/mt8183-larb-port.h
index 275c095a6fd6..3095630bb190 100644
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
 
 #include <dt-bindings/memory/mtk-smi-larb-port.h>
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
