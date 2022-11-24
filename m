Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8419C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 13:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xF/zeCCVLyEJ+xAWRxshxuUk+t638QqKQjpL5e1kXQ=; b=CC2XKtIhQNqEAtFmL+vRQDVnbB
	Ftb1HGw5wCB5huzpQYEned9fw7tfoZgoxT92uvKJujYa3s/Oom3vF+YL77qqys7hRZ5gqi4pLIZfB
	mGnfQcAZu6NJo270SWKNhnViaehh+xobdCoQpVga0z+3OD8SWXkTtrc+jLVGUro7oPqFlawVW0XzU
	aYTQBZtCcKVrIxm4I15N7/GbFbAp+enzdoUO8ql9UnA7/LLLQ298WzAiN7tNc3IxAd8+WvcOldNhR
	LNY2iPMrC9LRsDwoyPDzz+zxt5yJN91QYLoHG9MYfmx1gmKYzRbRYCS5UFYz6N9F+xfchDh/ycArw
	22kTV0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyC9P-008hpu-IY; Thu, 24 Nov 2022 13:20:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyBz5-008d4a-GV
	for linux-mediatek@lists.infradead.org; Thu, 24 Nov 2022 13:09:46 +0000
X-UUID: 29a688541ab24823b687b924e6c46d79-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6xF/zeCCVLyEJ+xAWRxshxuUk+t638QqKQjpL5e1kXQ=;
	b=BiCVU0LFJ5Q7bqBu9sXCj16AQUZKS4dOZetnq2R/lDukQ6ZFs1jG9fXJ/GmnquvTYoRwZL4db+7Hm/XrJGYeHAEOdKlPdhHEa2bt8s2XLTKXnkEF2bn6x5fGt6+GCqwxzHaBtVPh7XAdHoNxeQJYSvKqIzCMyAaNdPJ73nI1cGo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e167d25c-1f6d-4724-b883-4a47db483763,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:d34dbb2f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 29a688541ab24823b687b924e6c46d79-20221124
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1835579395; Thu, 24 Nov 2022 06:09:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 20:39:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 24 Nov 2022 20:39:02 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v4 8/9] media: platform: mtk-mdp3: Split general definitions used in MDP3
Date: Thu, 24 Nov 2022 20:38:58 +0800
Message-ID: <20221124123859.24395-9-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221124123859.24395-1-moudy.ho@mediatek.com>
References: <20221124123859.24395-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_050943_593165_7F12E597 
X-CRM114-Status: GOOD (  14.67  )
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

Separate the generic definitions used in mdp3 to avoid recursive includes
when splitting chip-related definitions in further.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-img-ipi.h      | 45 +---------------
 .../platform/mediatek/mdp3/mtk-mdp3-type.h    | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+), 44 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h b/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
index c7f231f8ea3e..239578f9ff96 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
@@ -9,6 +9,7 @@
 #define __MTK_IMG_IPI_H__
 
 #include <linux/types.h>
+#include "mtk-mdp3-type.h"
 
 /*
  * ISP-MDP generic input information
@@ -16,12 +17,6 @@
  *     6da52bdcf4bf76a0983b313e1d4745d6
  */
 
-#define IMG_MAX_HW_INPUTS	3
-
-#define IMG_MAX_HW_OUTPUTS	4
-
-#define IMG_MAX_PLANES		3
-
 #define IMG_IPI_INIT    1
 #define IMG_IPI_DEINIT  2
 #define IMG_IPI_FRAME   3
@@ -71,17 +66,6 @@ struct img_image_buffer {
 
 #define IMG_SUBPIXEL_SHIFT	20
 
-struct img_crop {
-	s32 left;
-	s32 top;
-	u32 width;
-	u32 height;
-	u32 left_subpix;
-	u32 top_subpix;
-	u32 width_subpix;
-	u32 height_subpix;
-} __packed;
-
 #define IMG_CTRL_FLAG_HFLIP	BIT(0)
 #define IMG_CTRL_FLAG_DITHER	BIT(1)
 #define IMG_CTRL_FLAG_SHARPNESS	BIT(4)
@@ -146,20 +130,6 @@ struct img_comp_frame {
 	u32 out_total_width;
 } __packed;
 
-struct img_region {
-	s32 left;
-	s32 right;
-	s32 top;
-	s32 bottom;
-} __packed;
-
-struct img_offset {
-	s32 left;
-	s32 top;
-	u32 left_subpix;
-	u32 top_subpix;
-} __packed;
-
 struct img_comp_subfrm {
 	u32 tile_disable;
 	struct img_region in;
@@ -267,19 +237,6 @@ struct img_compparam {
 	};
 } __packed;
 
-#define IMG_MAX_COMPONENTS	20
-
-struct img_mux {
-	u32 reg;
-	u32 value;
-	u32 subsys_id;
-} __packed;
-
-struct img_mmsys_ctrl {
-	struct img_mux sets[IMG_MAX_COMPONENTS * 2];
-	u32 num_sets;
-} __packed;
-
 struct img_config {
 	struct img_compparam components[IMG_MAX_COMPONENTS];
 	u32 num_components;
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
new file mode 100644
index 000000000000..37cd7b27548f
--- /dev/null
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Ping-Hsun Wu <ping-hsun.wu@mediatek.com>
+ */
+
+#ifndef __MTK_MDP3_TYPE_H__
+#define __MTK_MDP3_TYPE_H__
+
+#include <linux/types.h>
+
+#define IMG_MAX_HW_INPUTS	3
+#define IMG_MAX_HW_OUTPUTS	4
+#define IMG_MAX_PLANES		3
+#define IMG_MAX_COMPONENTS	20
+
+struct img_crop {
+	s32 left;
+	s32 top;
+	u32 width;
+	u32 height;
+	u32 left_subpix;
+	u32 top_subpix;
+	u32 width_subpix;
+	u32 height_subpix;
+} __packed;
+
+struct img_region {
+	s32 left;
+	s32 right;
+	s32 top;
+	s32 bottom;
+} __packed;
+
+struct img_offset {
+	s32 left;
+	s32 top;
+	u32 left_subpix;
+	u32 top_subpix;
+} __packed;
+
+struct img_mux {
+	u32 reg;
+	u32 value;
+	u32 subsys_id;
+} __packed;
+
+struct img_mmsys_ctrl {
+	struct img_mux sets[IMG_MAX_COMPONENTS * 2];
+	u32 num_sets;
+} __packed;
+
+#endif  /* __MTK_MDP3_TYPE_H__ */
-- 
2.18.0


