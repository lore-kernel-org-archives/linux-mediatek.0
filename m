Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF8DC6379F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 09:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpS7zOQiS8xm+MgSXF0zo7YlE8zlcISMKY7OkefTdQ8=; b=0XYUQMLHBMxt8jDEDEoKM/G58S
	H0/TAqYVFCxLGSTGSsehRoh2+nqie2nW0ZpAC6Z3wIqHkfRqwH7fDBl+nKxri68cKZ9u1GzhnXjDA
	xFeQpU78w/qL52rx3MNak6jAGngaGnGr6A34JT/okW2VaBO8OhgOcbYPWvUpNoLXj0nAeCwCG1D0W
	q99Yn0ke+jKAaUbHp+RjA+dDPAtXA6Cin02OSvM9foHKj0n1jJHk9ZWOrDv+7O5KQPmEpnuaHGuCN
	+Rh4EKY70dtlvDR7F+VPHeme0tUPVRz9smpYGdZwnRJ/CTJyXJbg90IZ32lfeYZKkmaMMjxj46llM
	NsM9HoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgSG-00EhRA-Cx; Wed, 08 Feb 2023 09:09:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPgRv-00EhEb-Gb; Wed, 08 Feb 2023 09:09:10 +0000
X-UUID: 39f10ca6a79011edbbe3f76fe852e059-20230208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=KpS7zOQiS8xm+MgSXF0zo7YlE8zlcISMKY7OkefTdQ8=;
	b=f86rdaVL3q/lbHKfyVB/jqUIlonardrLQlpELWZYAQX00yJvEnMTtkvsMYbbXQBIU4DCRmkXuhQ2QBmXwqGiDCJJ7r0miO4Ydd5nJOCw93Nn5G1vYzRUmPHMBCyoZu73pMuoxvBi5zcTEnIea6bFrWAGTbFRtXZ3Tv7CozQfubs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:b93d3344-292f-4bef-a2a2-0d6f81538327,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:0c73aa56-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 39f10ca6a79011edbbe3f76fe852e059-20230208
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1629270905; Wed, 08 Feb 2023 02:09:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 8 Feb 2023 17:08:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 8 Feb 2023 17:08:58 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ping-Hsun
 Wu <ping-hsun.wu@mediatek.com>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v6 10/12] media: platform: mtk-mdp3: Split general definitions used in MDP3
Date: Wed, 8 Feb 2023 17:08:53 +0800
Message-ID: <20230208090855.18934-11-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230208090855.18934-1-moudy.ho@mediatek.com>
References: <20230208090855.18934-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_010907_577115_7301C506 
X-CRM114-Status: GOOD (  15.62  )
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

Separate the generic definitions used in MDP3 to avoid recursive includes
when splitting chip-related definitions in further.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 .../platform/mediatek/mdp3/mtk-img-ipi.h      | 46 +---------------
 .../platform/mediatek/mdp3/mtk-mdp3-type.h    | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+), 45 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h b/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
index c7f231f8ea3e..f5296994137a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-img-ipi.h
@@ -8,7 +8,7 @@
 #ifndef __MTK_IMG_IPI_H__
 #define __MTK_IMG_IPI_H__
 
-#include <linux/types.h>
+#include "mtk-mdp3-type.h"
 
 /*
  * ISP-MDP generic input information
@@ -16,12 +16,6 @@
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
@@ -71,17 +65,6 @@ struct img_image_buffer {
 
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
@@ -146,20 +129,6 @@ struct img_comp_frame {
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
@@ -267,19 +236,6 @@ struct img_compparam {
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
index 000000000000..ae0396806152
--- /dev/null
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-type.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2023 MediaTek Inc.
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


