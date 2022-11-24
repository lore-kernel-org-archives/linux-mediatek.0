Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F593C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 12:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RVnHnjZIbc03C/0P+k/dMEPQcRFLgg8+dULkY97lXN8=; b=0qSi9lQOJKceS9kJH7QlobZmfP
	WG3EBko7itUhgW/NUY5HrOsSLzee+iO+pVxhSl2NxbkdoY1P+Cld3o1m8iurZM/F2i/NPoKzGMsWG
	HYGO6gKbR+twtUBiuyIqVcKKQz6YAJ7uvGsDC5+EXqCjhW6DkNlTy7oZtBH9ZQCPWAWgTHi7Nm41f
	tmfvAHefVIFIptWWX5PoQQxAnjYUTzcnXCl7oI//An7+8FZKW1XcOGyLtFa+2avt1lguIXSpUIww4
	ZDf5WcLDDQrmFTXNcy1ahFFJkeBUfho8ZT+uyCzGgC/4+PDjeb/HKq3xsNA9Zn6tROIQ+ouaJqC7S
	dd54WDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyBVi-008O1S-7X; Thu, 24 Nov 2022 12:39:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyBVd-008Nvi-2q
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 12:39:19 +0000
X-UUID: e310918107c64ed781bb0a3e34458a37-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RVnHnjZIbc03C/0P+k/dMEPQcRFLgg8+dULkY97lXN8=;
	b=r/XA/CDG2XV1FPGBL7abSaaqJu9HLMHRR7siaWKGmlZzRYq2XxilsVgpfVIwnaoMHob5Zd2VZBEyN4Hi/DVAC+qTUchm64jbnIkK3tfBSqqY8HAgfgd/yqdtsFWDH+8WXKs5fjuUaXoA1mJ3mr+6ozIHca2UnxUBF3mn12iUWhI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:463e7ab2-a737-4909-a4b3-3bf925be7088,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.14,REQID:463e7ab2-a737-4909-a4b3-3bf925be7088,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:dcaaed0,CLOUDID:ae8c25dc-6ad4-42ff-91f3-18e0272db660,B
	ulkID:221124203905EGA8MR5C,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e310918107c64ed781bb0a3e34458a37-20221124
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 989845558; Thu, 24 Nov 2022 05:39:03 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 20:39:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 24 Nov 2022 20:39:01 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v4 1/9] media: platform: mtk-mdp3: add chip configuration header file
Date: Thu, 24 Nov 2022 20:38:51 +0800
Message-ID: <20221124123859.24395-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221124123859.24395-1-moudy.ho@mediatek.com>
References: <20221124123859.24395-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_043917_152843_5B121358 
X-CRM114-Status: GOOD (  15.72  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In order to be compatible with more MDP3 chip settings in the future,
move the chip-related configuration to a separate header file.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../mediatek/mdp3/mt8183/mdp3-plat-mt8183.h   | 35 +++++++++++++++++++
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 27 ++------------
 2 files changed, 37 insertions(+), 25 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h

diff --git a/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h b/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
new file mode 100644
index 000000000000..3084f62e7df5
--- /dev/null
+++ b/drivers/media/platform/mediatek/mdp3/mt8183/mdp3-plat-mt8183.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MDP3_PLAT_MT8183_H__
+#define __MDP3_PLAT_MT8183_H__
+
+static const struct mdp_platform_config mt8183_plat_cfg = {
+	.rdma_support_10bit		= true,
+	.rdma_rsz1_sram_sharing		= true,
+	.rdma_upsample_repeat_only	= true,
+	.rsz_disable_dcm_small_sample	= false,
+	.wrot_filter_constraint		= false,
+};
+
+static const struct of_device_id mt8183_mdp_probe_infra[MDP_INFRA_MAX] = {
+	[MDP_INFRA_MMSYS] = { .compatible = "mediatek,mt8183-mmsys" },
+	[MDP_INFRA_MUTEX] = { .compatible = "mediatek,mt8183-disp-mutex" },
+	[MDP_INFRA_SCP] = { .compatible = "mediatek,mt8183-scp" }
+};
+
+static const u32 mt8183_mutex_idx[MDP_MAX_COMP_COUNT] = {
+	[MDP_COMP_RDMA0] = MUTEX_MOD_IDX_MDP_RDMA0,
+	[MDP_COMP_RSZ0] = MUTEX_MOD_IDX_MDP_RSZ0,
+	[MDP_COMP_RSZ1] = MUTEX_MOD_IDX_MDP_RSZ1,
+	[MDP_COMP_TDSHP0] = MUTEX_MOD_IDX_MDP_TDSHP0,
+	[MDP_COMP_WROT0] = MUTEX_MOD_IDX_MDP_WROT0,
+	[MDP_COMP_WDMA] = MUTEX_MOD_IDX_MDP_WDMA,
+	[MDP_COMP_AAL0] = MUTEX_MOD_IDX_MDP_AAL0,
+	[MDP_COMP_CCORR0] = MUTEX_MOD_IDX_MDP_CCORR0,
+};
+
+#endif  /* __MDP3_PLAT_MT8183_H__ */
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 2d1f6ae9f080..658037d06250 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -12,33 +12,10 @@
 #include <linux/remoteproc.h>
 #include <linux/remoteproc/mtk_scp.h>
 #include <media/videobuf2-dma-contig.h>
+
 #include "mtk-mdp3-core.h"
 #include "mtk-mdp3-m2m.h"
-
-static const struct mdp_platform_config mt8183_plat_cfg = {
-	.rdma_support_10bit		= true,
-	.rdma_rsz1_sram_sharing		= true,
-	.rdma_upsample_repeat_only	= true,
-	.rsz_disable_dcm_small_sample	= false,
-	.wrot_filter_constraint		= false,
-};
-
-static const struct of_device_id mt8183_mdp_probe_infra[MDP_INFRA_MAX] = {
-	[MDP_INFRA_MMSYS] = { .compatible = "mediatek,mt8183-mmsys" },
-	[MDP_INFRA_MUTEX] = { .compatible = "mediatek,mt8183-disp-mutex" },
-	[MDP_INFRA_SCP] = { .compatible = "mediatek,mt8183-scp" }
-};
-
-static const u32 mt8183_mutex_idx[MDP_MAX_COMP_COUNT] = {
-	[MDP_COMP_RDMA0] = MUTEX_MOD_IDX_MDP_RDMA0,
-	[MDP_COMP_RSZ0] = MUTEX_MOD_IDX_MDP_RSZ0,
-	[MDP_COMP_RSZ1] = MUTEX_MOD_IDX_MDP_RSZ1,
-	[MDP_COMP_TDSHP0] = MUTEX_MOD_IDX_MDP_TDSHP0,
-	[MDP_COMP_WROT0] = MUTEX_MOD_IDX_MDP_WROT0,
-	[MDP_COMP_WDMA] = MUTEX_MOD_IDX_MDP_WDMA,
-	[MDP_COMP_AAL0] = MUTEX_MOD_IDX_MDP_AAL0,
-	[MDP_COMP_CCORR0] = MUTEX_MOD_IDX_MDP_CCORR0,
-};
+#include "mt8183/mdp3-plat-mt8183.h"
 
 static const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
 	.mdp_probe_infra = mt8183_mdp_probe_infra,
-- 
2.18.0


