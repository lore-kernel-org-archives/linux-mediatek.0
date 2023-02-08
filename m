Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24E6C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 09:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAjHxEsnyEoI0bt0L75RtJVBnjmbipaXcQ/p3RqlNjU=; b=wmAd/o8H3SiaYK2wl1e9xk+mne
	wlrts+ZiTzKanlW9sV6ZNoHR4s0gc3qnOmTqeY9Hz/uaOI3NTf7KjonFYVV/Z8kYLGdW1ABnbxAos
	dFSb2BUqQ95x7SSjgDjxlqNT4pNMIVKpTkkd6ZpY6PQJCiXNFIb2b17p5vWjvnrR8sQeHNgJNDy8i
	JSqTPpTshjpTF78FrTpXasOs+/PbTLo6OvSnAOMbckaMjgYCYD6CkW4iuvHemzhynbKAr/IuWsBwL
	M/qYkD1ZkD/2Ai6ftw3Twf1IxFWnWxChU+4HBRS7Y9P1cOxgU25efmRkBqQB8aJjNBSS+svN3k+VM
	dtH/mE9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgr4-00EtTO-DX; Wed, 08 Feb 2023 09:35:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPglo-00Er3v-66; Wed, 08 Feb 2023 09:29:41 +0000
X-UUID: 18a367c6a79311eda08d4d6090ec5a5c-20230208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pAjHxEsnyEoI0bt0L75RtJVBnjmbipaXcQ/p3RqlNjU=;
	b=J3B/IXY/Kyokhu3UYgwV04gAXL12q8+8+sb25o2eFoP1rwzhodD2ucdjuwKXF6wEMv7zNCCEGVrPnK0sz4OaE6nV7blOsnWJcoNgx6n3ZDqj6nVnSvGQnXm6cXmXcTR+Fy+NuXO1CpCQtCEqwhdykMk6gyGFBSGG0EgfhbOeUdo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:6243a9c5-0429-4057-b77f-d83f94240448,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:7f10ab56-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 18a367c6a79311eda08d4d6090ec5a5c-20230208
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1452115144; Wed, 08 Feb 2023 02:29:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 8 Feb 2023 17:08:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 8 Feb 2023 17:08:57 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Ping-Hsun
 Wu" <ping-hsun.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v6 02/12] media: platform: mtk-mdp3: add files for chip configuration
Date: Wed, 8 Feb 2023 17:08:45 +0800
Message-ID: <20230208090855.18934-3-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230208090855.18934-1-moudy.ho@mediatek.com>
References: <20230208090855.18934-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_012940_258917_CEA913B9 
X-CRM114-Status: GOOD (  19.27  )
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

In order to be compatible with more MDP3 chip settings in further,
integrate and separate chip-related configurations into specific files.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 drivers/media/platform/mediatek/mdp3/Makefile |  2 +-
 .../platform/mediatek/mdp3/mdp_cfg_data.c     | 38 +++++++++++++++++++
 .../platform/mediatek/mdp3/mtk-mdp3-cfg.h     | 12 ++++++
 .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 33 +---------------
 4 files changed, 53 insertions(+), 32 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h

diff --git a/drivers/media/platform/mediatek/mdp3/Makefile b/drivers/media/platform/mediatek/mdp3/Makefile
index 63e6c87e480b..2ee24195a2dd 100644
--- a/drivers/media/platform/mediatek/mdp3/Makefile
+++ b/drivers/media/platform/mediatek/mdp3/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-mtk-mdp3-y += mtk-mdp3-core.o mtk-mdp3-vpu.o mtk-mdp3-regs.o
+mtk-mdp3-y += mdp_cfg_data.o mtk-mdp3-core.o mtk-mdp3-vpu.o mtk-mdp3-regs.o
 mtk-mdp3-y += mtk-mdp3-m2m.o
 mtk-mdp3-y += mtk-mdp3-comp.o mtk-mdp3-cmdq.o
 
diff --git a/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
new file mode 100644
index 000000000000..837b8202dcc7
--- /dev/null
+++ b/drivers/media/platform/mediatek/mdp3/mdp_cfg_data.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#include "mtk-mdp3-core.h"
+
+static const struct of_device_id mt8183_mdp_probe_infra[MDP_INFRA_MAX] = {
+	[MDP_INFRA_MMSYS] = { .compatible = "mediatek,mt8183-mmsys" },
+	[MDP_INFRA_MUTEX] = { .compatible = "mediatek,mt8183-disp-mutex" },
+	[MDP_INFRA_SCP] = { .compatible = "mediatek,mt8183-scp" }
+};
+
+static const struct mdp_platform_config mt8183_plat_cfg = {
+	.rdma_support_10bit		= true,
+	.rdma_rsz1_sram_sharing		= true,
+	.rdma_upsample_repeat_only	= true,
+	.rsz_disable_dcm_small_sample	= false,
+	.wrot_filter_constraint		= false,
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
+const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
+	.mdp_probe_infra = mt8183_mdp_probe_infra,
+	.mdp_cfg = &mt8183_plat_cfg,
+	.mdp_mutex_table_idx = mt8183_mutex_idx,
+};
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
new file mode 100644
index 000000000000..e0a698cba6ff
--- /dev/null
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cfg.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MTK_MDP3_CFG_H__
+#define __MTK_MDP3_CFG_H__
+
+extern const struct mtk_mdp_driver_data mt8183_mdp_driver_data;
+
+#endif  /* __MTK_MDP3_CFG_H__ */
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 2d1f6ae9f080..207b54f84fc0 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -12,40 +12,11 @@
 #include <linux/remoteproc.h>
 #include <linux/remoteproc/mtk_scp.h>
 #include <media/videobuf2-dma-contig.h>
+
 #include "mtk-mdp3-core.h"
+#include "mtk-mdp3-cfg.h"
 #include "mtk-mdp3-m2m.h"
 
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
-
-static const struct mtk_mdp_driver_data mt8183_mdp_driver_data = {
-	.mdp_probe_infra = mt8183_mdp_probe_infra,
-	.mdp_cfg = &mt8183_plat_cfg,
-	.mdp_mutex_table_idx = mt8183_mutex_idx,
-};
-
 static const struct of_device_id mdp_of_ids[] = {
 	{ .compatible = "mediatek,mt8183-mdp3-rdma",
 	  .data = &mt8183_mdp_driver_data,
-- 
2.18.0


