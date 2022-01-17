Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE1FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 06:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NUm6Lh3+Y82KqrLavnvlqca4zmJhvI5dx/4S30vjmY=; b=eu8UY/BEBE80h1
	5fcNqqxBqohyIPiBB9HJE9gbBWdFc7iuYI9gmNzOBw/SHkrea9ewyb/PBoP2AceLdX2qMwsV5HKNA
	tAWdwaEhsV3PMi6HqnBA5jF0r2B8i922PhcsmE89joi9g1v6+fkJf88h6PwKOhWj/FjfNLRqrPVeB
	Vmam6405XiIdelOmz4AHcrcyw8YwAW6nSiLeVyLsgJTeRq+PNpO0vM1mX9i3Hf8zgQgnmLG6t+0ji
	TIoW4PYHwcHhImLJI8q4jvdIawLgJswrozgpHaB7FFJCmhX+VVy8G/mw/u2ZAuWrGOHhslyqK3lDM
	E2rJWYgbGhVogpaCwvNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9LAM-00DaVb-Ez; Mon, 17 Jan 2022 06:06:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9L6v-00DYUz-Ci; Mon, 17 Jan 2022 06:03:27 +0000
X-UUID: 3c427f1011fc4ccc9934043ead200718-20220116
X-UUID: 3c427f1011fc4ccc9934043ead200718-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 960089337; Sun, 16 Jan 2022 23:03:10 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:10 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 17 Jan 2022 13:53:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 13:53:08 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Fabien Parent
 <fparent@baylibre.com>, "Roy-CW . Yeh" <roy-cw.yeh@mediatek.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, daoyuan huang <daoyuan.huang@mediatek.com>, 
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 09/14] media: platform: mtk-mdp3: Add support MT8195
Date: Mon, 17 Jan 2022 13:52:49 +0800
Message-ID: <20220117055254.9777-10-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_220321_520374_95443FE3 
X-CRM114-Status: GOOD (  17.98  )
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

From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>

Add support MT8195

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
---
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   | 438 ++++++++++++++++--
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 345 +++++++++++++-
 .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |   3 +-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  67 ++-
 .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   2 +
 .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |   6 +
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  86 +++-
 .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |   2 +
 8 files changed, 883 insertions(+), 66 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index 879a120f78d9..ce9326cc790f 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -5,12 +5,15 @@
  */
 
 #include <linux/platform_device.h>
+#include <linux/kernel.h>
 #include "mtk-mdp3-cmdq.h"
 #include "mtk-mdp3-comp.h"
 #include "mtk-mdp3-core.h"
 #include "mtk-mdp3-m2m.h"
 
 #define MDP_PATH_MAX_COMPS	IMG_MAX_COMPONENTS
+#define BYTE_PER_MB_Y				(4)
+#define BYTE_PER_MB_C				(2)
 
 struct mdp_path {
 	struct mdp_dev		*mdp_dev;
@@ -26,12 +29,18 @@ struct mdp_path {
 	((ctx)->comp->ops && (ctx)->comp->ops->op)
 #define call_op(ctx, op, ...) \
 	(has_op(ctx, op) ? (ctx)->comp->ops->op(ctx, ##__VA_ARGS__) : 0)
-
 struct mdp_path_subfrm {
 	s32	mutex_id;
 	u32	mutex_mod;
+	u32	mutex_mod2;
 	s32	sofs[MDP_PATH_MAX_COMPS];
 	u32	num_sofs;
+
+	s32	mutex2_id;
+	u32	mutex2_mod;
+	u32	mutex2_mod2;
+	s32	sof2s[MDP_PATH_MAX_COMPS];
+	u32	num_sof2s;
 };
 
 static bool is_output_disable(const struct img_compparam *param, u32 count)
@@ -76,8 +85,11 @@ static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
 	const struct mtk_mdp_driver_data *data = path->mdp_dev->mdp_data;
 	struct device *dev = &path->mdp_dev->pdev->dev;
 	struct mtk_mutex **mutex = path->mdp_dev->mdp_mutex;
-	s32 mutex_id = -1;
+	struct mtk_mutex **mutex2 = path->mdp_dev->mdp_mutex2;
+	s32 mutex_id = MDP_PIPE_NONE;
+	s32 mutex2_id = MDP_PIPE_NONE;
 	u32 mutex_sof = 0;
+	u32 mutex2_sof = 0;
 	int index, j;
 	enum mtk_mdp_comp_id public_id = MDP_COMP_NONE;
 
@@ -85,57 +97,225 @@ static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
 	memset(subfrm, 0, sizeof(*subfrm));
 
 	for (index = 0; index < config->num_components; index++) {
+		if (is_dummy_engine(path->mdp_dev, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		if (is_output_disable(ctx->param, count))
 			continue;
 
 		public_id = path->comps[index].comp->public_id;
 		switch (public_id) {
-		case MDP_COMP_AAL0:
+		case MDP_COMP_ISP_IMGI:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_IMGI);
+			mutex_id = data->pipe_info[j].mutex_id;
+			break;
+		case MDP_COMP_WPEI:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_WPEI);
+			mutex_id = data->pipe_info[j].mutex_id;
 			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
 			break;
-		case MDP_COMP_CCORR0:
+		case MDP_COMP_WPEI2:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_WPEI2);
+			mutex_id = data->pipe_info[j].mutex_id;
 			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
 			break;
-		case MDP_COMP_WDMA:
+		case MDP_COMP_RDMA0:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_RDMA0);
+			mutex_id = data->pipe_info[j].mutex_id;
 			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
-			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WDMA;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RDMA0;
 			break;
-		case MDP_COMP_WROT0:
+		case MDP_COMP_VPP1_SOUT:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_VPP1_SOUT);
+			mutex_id = data->pipe_info[j].mutex_id;
 			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
-			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WROT0;
+			subfrm->mutex2_mod2 |= data->comp_data[public_id].mutex.mod2;
 			break;
-		case MDP_COMP_TDSHP0:
+		case MDP_COMP_FG0:
 			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
-			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_TDSHP0;
 			break;
-		case MDP_COMP_RSZ1:
+		case MDP_COMP_STITCH:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_HDR0:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_AAL0:
 			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
-			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RSZ1;
 			break;
 		case MDP_COMP_RSZ0:
 			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
 			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RSZ0;
 			break;
-		case MDP_COMP_RDMA0:
-			j = mdp_get_mutex_idx(data, MDP_PIPE_RDMA0);
-			mutex_id = data->pipe_info[j].mutex_id;
+		case MDP_COMP_TDSHP0:
 			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
-			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RDMA0;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_TDSHP0;
 			break;
-		case MDP_COMP_ISP_IMGI:
-			j = mdp_get_mutex_idx(data, MDP_PIPE_IMGI);
-			mutex_id = data->pipe_info[j].mutex_id;
+		case MDP_COMP_COLOR0:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
 			break;
-		case MDP_COMP_WPEI:
-			j = mdp_get_mutex_idx(data, MDP_PIPE_WPEI);
-			mutex_id = data->pipe_info[j].mutex_id;
+		case MDP_COMP_OVL0:
 			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
 			break;
-		case MDP_COMP_WPEI2:
-			j = mdp_get_mutex_idx(data, MDP_PIPE_WPEI2);
-			mutex_id = data->pipe_info[j].mutex_id;
+		case MDP_COMP_PAD0:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_TCC0:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_CCORR0:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_WDMA:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WDMA;
+			break;
+		case MDP_COMP_WROT0:
+			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_WROT0;
+			break;
+		case MDP_COMP_SPLIT:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_SPLIT);
+			mutex2_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_SPLIT;
+			mutex2_sof = data->pipe_info[j].sof;
+			break;
+		case MDP_COMP_SPLIT2:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_SPLIT2);
+			mutex2_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_SPLIT2;
+			mutex2_sof = data->pipe_info[j].sof;
+			break;
+		case MDP_COMP_RDMA1:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_RDMA1);
+			mutex2_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_RDMA1;
+			break;
+		case MDP_COMP_RDMA2:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_RDMA2);
+			mutex2_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_RDMA2;
+			break;
+		case MDP_COMP_RDMA3:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_RDMA3);
+			mutex2_id = data->pipe_info[j].mutex_id;
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_RDMA3;
+			break;
+		case MDP_COMP_VPP0_SOUT:
+			j = mdp_get_mutex_idx(data, MDP_PIPE_VPP0_SOUT);
+			mutex2_id = data->pipe_info[j].mutex_id;
 			subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->mutex2_mod2 |= data->comp_data[public_id].mutex.mod2;
+			break;
+		case MDP_COMP_TCC1:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_FG1:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_FG2:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_FG3:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_HDR1:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_HDR2:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_HDR3:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_AAL1:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_AAL2:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_AAL3:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_RSZ1:
+			if (data->comp_data[public_id].mutex.mmsys_id) {
+				subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+				subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_RSZ1;
+			} else {
+				subfrm->mutex_mod |= data->comp_data[public_id].mutex.mod;
+				subfrm->sofs[subfrm->num_sofs++] = MDP_COMP_RSZ1;
+			}
+			break;
+		case MDP_COMP_RSZ2:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_RSZ2;
+			break;
+		case MDP_COMP_RSZ3:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_RSZ3;
+			break;
+		case MDP_COMP_TDSHP1:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_TDSHP1;
+			break;
+		case MDP_COMP_TDSHP2:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_TDSHP2;
+			break;
+		case MDP_COMP_TDSHP3:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_TDSHP3;
+			break;
+		case MDP_COMP_COLOR1:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_COLOR2:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_COLOR3:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_OVL1:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_PAD1:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_PAD2:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_PAD3:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			break;
+		case MDP_COMP_WROT1:
+			subfrm->mutex2_mod |= data->comp_data[public_id].mutex.mod;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_WROT1;
+			break;
+		case MDP_COMP_WROT2:
+			subfrm->mutex2_mod2 |= data->comp_data[public_id].mutex.mod2;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_WROT2;
+			break;
+		case MDP_COMP_WROT3:
+			subfrm->mutex2_mod2 |= data->comp_data[public_id].mutex.mod2;
+			subfrm->sof2s[subfrm->num_sof2s++] = MDP_COMP_WROT3;
+			break;
+		case MDP_COMP_VDO0DL0:
+			subfrm->mutex2_mod2 |= data->comp_data[public_id].mutex.mod2;
+			break;
+		case MDP_COMP_VDO1DL0:
+			subfrm->mutex2_mod2 |= data->comp_data[public_id].mutex.mod2;
+			break;
+		case MDP_COMP_VDO0DL1:
+			subfrm->mutex2_mod2 |= data->comp_data[public_id].mutex.mod2;
+			break;
+		case MDP_COMP_VDO1DL1:
+			subfrm->mutex2_mod2 |= data->comp_data[public_id].mutex.mod2;
 			break;
 		default:
 			break;
@@ -143,17 +323,23 @@ static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
 	}
 
 	subfrm->mutex_id = mutex_id;
-	if (-1 == mutex_id) {
+	subfrm->mutex2_id = mutex2_id;
+
+	if (mutex_id == MDP_PIPE_NONE && mutex2_id == MDP_PIPE_NONE) {
 		dev_err(dev, "No mutex assigned");
 		return -EINVAL;
 	}
 
 	/* Set mutex modules */
-	if (subfrm->mutex_mod) {
+	if (subfrm->mutex_mod || subfrm->mutex_mod2) {
 		mtk_mutex_add_mod_by_cmdq(mutex[mutex_id], subfrm->mutex_mod,
-					  0, mutex_sof, cmd);
+					  subfrm->mutex_mod2, mutex_sof, cmd);
 	}
 
+	if (subfrm->mutex2_mod || subfrm->mutex2_mod2) {
+		mtk_mutex_add_mod_by_cmdq(mutex2[mutex2_id], subfrm->mutex2_mod,
+					  subfrm->mutex2_mod2, mutex2_sof, cmd);
+	}
 	return 0;
 }
 
@@ -163,14 +349,16 @@ static int mdp_path_subfrm_run(const struct mdp_path_subfrm *subfrm,
 {
 	struct device *dev = &path->mdp_dev->pdev->dev;
 	struct mtk_mutex **mutex = path->mdp_dev->mdp_mutex;
+	struct mtk_mutex **mutex2 = path->mdp_dev->mdp_mutex2;
 	s32 mutex_id = subfrm->mutex_id;
+	s32 mutex2_id = subfrm->mutex2_id;
 
-	if (-1 == mutex_id) {
+	if (mutex_id == MDP_PIPE_NONE && mutex2_id == MDP_PIPE_NONE) {
 		dev_err(dev, "Incorrect mutex id");
 		return -EINVAL;
 	}
 
-	if (subfrm->mutex_mod) {
+	if (subfrm->mutex_mod || subfrm->mutex_mod2) {
 		int index, evt;
 
 		/* Wait WROT SRAM shared to DISP RDMA */
@@ -235,6 +423,71 @@ static int mdp_path_subfrm_run(const struct mdp_path_subfrm *subfrm,
 				MM_REG_WAIT(cmd, evt);
 		}
 	}
+
+	if (subfrm->mutex2_mod || subfrm->mutex2_mod2) {
+		int index, evt;
+
+		/* Clear SOF event for each engine */
+		for (index = 0; index < subfrm->num_sof2s; index++) {
+			switch (subfrm->sof2s[index]) {
+			case MDP_COMP_RDMA1:
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA1_SOF);
+				break;
+			case MDP_COMP_RDMA2:
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA2_SOF);
+				break;
+			case MDP_COMP_RDMA3:
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA3_SOF);
+				break;
+			case MDP_COMP_WROT1:
+				evt = mdp_get_event_idx(path->mdp_dev, WROT1_SOF);
+				break;
+			case MDP_COMP_WROT2:
+				evt = mdp_get_event_idx(path->mdp_dev, WROT2_SOF);
+				break;
+			case MDP_COMP_WROT3:
+				evt = mdp_get_event_idx(path->mdp_dev, WROT3_SOF);
+				break;
+			default:
+				evt = -1;
+				break;
+			}
+			if (evt > 0)
+				MM_REG_CLEAR(cmd, evt);
+		}
+
+		/* Enable the mutex */
+		mtk_mutex_enable_by_cmdq(mutex2[mutex2_id], cmd);
+
+		/* Wait SOF events and clear mutex modules (optional) */
+		for (index = 0; index < subfrm->num_sof2s; index++) {
+			switch (subfrm->sof2s[index]) {
+			case MDP_COMP_RDMA1:
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA1_SOF);
+				break;
+			case MDP_COMP_RDMA2:
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA2_SOF);
+				break;
+			case MDP_COMP_RDMA3:
+				evt = mdp_get_event_idx(path->mdp_dev, RDMA3_SOF);
+				break;
+			case MDP_COMP_WROT1:
+				evt = mdp_get_event_idx(path->mdp_dev, WROT1_SOF);
+				break;
+			case MDP_COMP_WROT2:
+				evt = mdp_get_event_idx(path->mdp_dev, WROT2_SOF);
+				break;
+			case MDP_COMP_WROT3:
+				evt = mdp_get_event_idx(path->mdp_dev, WROT3_SOF);
+				break;
+			default:
+				evt = -1;
+				break;
+			}
+			if (evt > 0)
+				MM_REG_WAIT(cmd, evt);
+		}
+	}
 	return 0;
 }
 
@@ -247,6 +500,9 @@ static int mdp_path_ctx_init(struct mdp_dev *mdp, struct mdp_path *path)
 		return -EINVAL;
 
 	for (index = 0; index < config->num_components; index++) {
+		if (is_dummy_engine(mdp, config->components[index].type))
+			continue;
+
 		ret = mdp_comp_ctx_init(mdp, &path->comps[index],
 					&config->components[index],
 					path->param);
@@ -276,13 +532,21 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 	/* Enable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		mmsys_dev = path->mdp_dev->mdp_mmsys;
+		if (data->mdp_cfg->mdp_version_8195) {
+			if (set->vpp_id)
+				mmsys_dev = path->mdp_dev->mdp_mmsys2;
+			else
+				mmsys_dev = path->mdp_dev->mdp_mmsys;
+		}
 
 		mtk_mmsys_write_reg_by_cmdq(mmsys_dev, cmd,
 					    set->reg, set->value, 0xFFFFFFFF);
 	}
 	/* Config sub-frame information */
 	for (index = (config->num_components - 1); index >= 0; index--) {
+		if (is_dummy_engine(path->mdp_dev, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		if (is_output_disable(ctx->param, count))
 			continue;
@@ -296,6 +560,9 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 		return ret;
 	/* Wait components done */
 	for (index = 0; index < config->num_components; index++) {
+		if (is_dummy_engine(path->mdp_dev, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		if (is_output_disable(ctx->param, count))
 			continue;
@@ -305,6 +572,9 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 	}
 	/* Advance to the next sub-frame */
 	for (index = 0; index < config->num_components; index++) {
+		if (is_dummy_engine(path->mdp_dev, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		ret = call_op(ctx, advance_subfrm, cmd, count);
 		if (ret)
@@ -313,7 +583,12 @@ static int mdp_path_config_subfrm(struct mmsys_cmdq_cmd *cmd,
 	/* Disable mux settings */
 	for (index = 0; index < ctrl->num_sets; index++) {
 		set = &ctrl->sets[index];
-		mmsys_dev = path->mdp_dev->mdp_mmsys;
+		if (data->mdp_cfg->mdp_version_8195) {
+			if (set->vpp_id)
+				mmsys_dev = path->mdp_dev->mdp_mmsys2;
+			else
+				mmsys_dev = path->mdp_dev->mdp_mmsys;
+		}
 
 		mtk_mmsys_write_reg_by_cmdq(mmsys_dev, cmd,
 					    set->reg, 0, 0xFFFFFFFF);
@@ -332,6 +607,9 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
 	/* Config path frame */
 	/* Reset components */
 	for (index = 0; index < config->num_components; index++) {
+		if (is_dummy_engine(mdp, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		ret = call_op(ctx, init_comp, cmd);
 		if (ret)
@@ -342,6 +620,9 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
 		const struct v4l2_rect *compose =
 			path->composes[ctx->param->outputs[0]];
 
+		if (is_dummy_engine(mdp, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		ret = call_op(ctx, config_frame, cmd, compose);
 		if (ret)
@@ -356,6 +637,9 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
 	}
 	/* Post processing information */
 	for (index = 0; index < config->num_components; index++) {
+		if (is_dummy_engine(mdp, config->components[index].type))
+			continue;
+
 		ctx = &path->comps[index];
 		ret = call_op(ctx, post_process, cmd);
 		if (ret)
@@ -364,6 +648,60 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
 	return 0;
 }
 
+static int mdp_hyfbc_config(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
+			    struct mdp_path *path, struct mdp_cmdq_param *param)
+{
+	struct device *dev = &mdp->pdev->dev;
+	const struct img_config *config = path->config;
+	struct mdp_m2m_ctx *ctx;
+	struct mdp_comp_ctx *comp_ctx = &path->comps[0];
+	const struct mdp_rdma_data *rdma = &comp_ctx->param->rdma;
+	struct hyfbc_init_info hyfbc;
+	struct mdp_frame *frame;
+	u32 wrot_id;
+	int ret;
+
+	ctx = (struct mdp_m2m_ctx *)param->mdp_ctx;
+	frame = &ctx->curr_param.output;
+
+	if (!MDP_COLOR_IS_HYFBC_COMPRESS(frame->mdp_fmt->mdp_color) ||
+	    frame->format.fmt.pix_mp.width % 32 == 0)
+		return 0;
+
+	// First engine should be rdma engine
+	if (!is_rdma(mdp, config->components[0].type)) {
+		dev_dbg(dev, "Not RDMA engine id, end patch.");
+		return 0;
+	}
+
+	wrot_id = config->components[(config->num_components - 1)].type;
+
+	hyfbc.is10b = (MDP_COLOR_IS_10BIT(frame->mdp_fmt->mdp_color));
+	hyfbc.width_in_mb = DIV_ROUND_UP(frame->format.fmt.pix_mp.width, 16);
+	hyfbc.height_in_mb = DIV_ROUND_UP(frame->format.fmt.pix_mp.height, 16);
+	hyfbc.w_stride_in_mb = DIV_ROUND_UP(ALIGN(frame->stride.width, 32), 16);
+	hyfbc.h_stride_in_mb = DIV_ROUND_UP(ALIGN(frame->stride.height, 32), 16);
+	hyfbc.byte_per_mb = BYTE_PER_MB_Y;
+	hyfbc.pa_base = rdma->ufo_dec_y;
+
+	ret = mdp_hyfbc_init(mdp, cmd, &hyfbc, wrot_id);
+	if (ret) {
+		dev_err(dev, "mdp_hyfbc_init: y patch fail.");
+		return ret;
+	}
+
+	hyfbc.byte_per_mb = BYTE_PER_MB_C;
+	hyfbc.pa_base = rdma->ufo_dec_c;
+
+	ret = mdp_hyfbc_init(mdp, cmd, &hyfbc, wrot_id);
+	if (ret) {
+		dev_err(dev, "mdp_hyfbc_init: c patch fail.");
+		return ret;
+	}
+
+	return 0;
+}
+
 static void mdp_auto_release_work(struct work_struct *work)
 {
 	struct mdp_cmdq_cb_param *cb_param;
@@ -376,6 +714,10 @@ static void mdp_auto_release_work(struct work_struct *work)
 
 	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
 	mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
+
+	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA1);
+	if (i >= 0)
+		mtk_mutex_unprepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
 	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 			    cb_param->num_comps);
 
@@ -419,6 +761,11 @@ static void mdp_handle_cmdq_callback(struct cmdq_cb_data data)
 		dev_err(dev, "%s:queue_work fail!\n", __func__);
 		i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
 		mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
+
+		i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA1);
+		if (i >= 0)
+			mtk_mutex_unprepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
+
 		mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 				    cb_param->num_comps);
 
@@ -481,8 +828,22 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
 	mtk_mutex_prepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
 
-	for (i = 0; i < param->config->num_components; i++)
+	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA1);
+	if (i >= 0)
+		mtk_mutex_prepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
+
+	for (i = 0; i < param->config->num_components; i++) {
+		if (is_dummy_engine(mdp, path->config->components[i].type))
+			continue;
+
 		mdp_comp_clock_on(&mdp->pdev->dev, path->comps[i].comp);
+	}
+
+	if (mdp->mdp_data->mdp_cfg->mdp_version_8195) {
+		ret = mdp_hyfbc_config(mdp, &cmd, path, param);
+		if (ret)
+			goto err_destroy_pkt;
+	}
 
 	ret = mdp_path_config(mdp, &cmd, path);
 	if (ret) {
@@ -503,9 +864,13 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 		goto err_destroy_pkt;
 	}
 
-	for (i = 0; i < param->config->num_components; i++)
+	for (i = 0; i < param->config->num_components; i++) {
+		if (is_dummy_engine(mdp, path->config->components[i].type))
+			continue;
+
 		memcpy(&comps[i], path->comps[i].comp,
 		       sizeof(struct mdp_comp));
+	}
 	cb_param->mdp = mdp;
 	cb_param->user_cmdq_cb = param->cmdq_cb;
 	cb_param->user_cb_data = param->cb_data;
@@ -528,6 +893,11 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
 err_clock_off:
 	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA0);
 	mtk_mutex_unprepare(mdp->mdp_mutex[mdp->mdp_data->pipe_info[i].mutex_id]);
+
+	i = mdp_get_mutex_idx(mdp->mdp_data, MDP_PIPE_RDMA1);
+	if (i >= 0)
+		mtk_mutex_unprepare(mdp->mdp_mutex2[mdp->mdp_data->pipe_info[i].mutex_id]);
+
 	mdp_comp_clocks_off(&mdp->pdev->dev, cb_param->comps,
 			    cb_param->num_comps);
 err_destroy_pkt:
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
index 8ca9c7e325e1..3d5cbd0e3805 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.c
@@ -27,6 +27,10 @@
 #include "mdp_reg_wdma.h"
 #include "mdp_reg_isp.h"
 
+#define is_wrot(id) \
+	((mdp)->mdp_data->comp_data[id].match.type == MDP_COMP_TYPE_WROT)
+#define byte2pixel(byte) ((byte) / 2)
+
 s32 get_comp_inner_id(struct mdp_dev *mdp_dev, enum mtk_mdp_comp_id id)
 {
 	if (!mdp_dev)
@@ -57,6 +61,20 @@ enum mtk_mdp_comp_id get_comp_public_id(struct mdp_dev *mdp_dev, s32 inner_id)
 	return public_id;
 }
 
+bool is_dummy_engine(struct mdp_dev *mdp_dev, s32 inner_id)
+{
+	enum mtk_mdp_comp_id public_id = get_comp_public_id(mdp_dev, inner_id);
+
+	return (mdp_dev->mdp_data->comp_data[public_id].match.type == MDP_COMP_TYPE_DUMMY);
+}
+
+bool is_rdma(struct mdp_dev *mdp_dev, s32 inner_id)
+{
+	enum mtk_mdp_comp_id public_id = get_comp_public_id(mdp_dev, inner_id);
+
+	return (mdp_dev->mdp_data->comp_data[public_id].match.type == MDP_COMP_TYPE_RDMA);
+}
+
 static const struct mdp_platform_config *__get_plat_cfg(const struct mdp_comp_ctx *ctx)
 {
 	if (!ctx)
@@ -423,14 +441,40 @@ static const struct mdp_comp_ops fg_ops = {
 
 static int init_rsz(struct mdp_comp_ctx *ctx, struct mmsys_cmdq_cmd *cmd)
 {
+	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
+	u32 value, mask, alias_id;
 
 	/* Reset RSZ */
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x10000, BIT(16));
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, 0x0, BIT(16));
 	/* Enable RSZ */
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_ENABLE, BIT(0), BIT(0));
+
+	if (mdp_cfg && mdp_cfg->mdp_version_8195) {
+		const struct mtk_mdp_driver_data *data = ctx->comp->mdp_dev->mdp_data;
+
+		value = (1 << 25);
+		mask = (1 << 25);
+		alias_id = data->config_table[CONFIG_VPP1_HW_DCM_1ST_DIS0];
+		mtk_mmsys_mdp_write_config(ctx->comp->mdp_dev->mdp_mmsys2,
+					   cmd, alias_id, value, mask);
+
+		alias_id = data->config_table[CONFIG_VPP1_HW_DCM_2ND_DIS0];
+		mtk_mmsys_mdp_write_config(ctx->comp->mdp_dev->mdp_mmsys2,
+					   cmd, alias_id, value, mask);
+
+		value = (1 << 4 | 1 << 5);
+		mask = (1 << 4 | 1 << 5);
+		alias_id = data->config_table[CONFIG_VPP1_HW_DCM_1ST_DIS1];
+		mtk_mmsys_mdp_write_config(ctx->comp->mdp_dev->mdp_mmsys2,
+					   cmd, alias_id, value, mask);
+
+		alias_id = data->config_table[CONFIG_VPP1_HW_DCM_2ND_DIS1];
+		mtk_mmsys_mdp_write_config(ctx->comp->mdp_dev->mdp_mmsys2,
+					   cmd, alias_id, value, mask);
+	}
 	return 0;
 }
 
@@ -501,6 +545,48 @@ static int config_rsz_subfrm(struct mdp_comp_ctx *ctx,
 	MM_REG_WRITE(cmd, subsys_id, base, PRZ_OUTPUT_IMAGE, subfrm->clip,
 		     0xFFFFFFFF);
 
+	if (mdp_cfg && mdp_cfg->mdp_version_8195) {
+		struct mdp_comp *merge;
+		const struct mtk_mdp_driver_data *data = ctx->comp->mdp_dev->mdp_data;
+		enum mtk_mdp_comp_id id = ctx->comp->public_id;
+		u32 alias_id;
+
+		switch (id) {
+		case MDP_COMP_RSZ2:
+			merge = ctx->comp->mdp_dev->comp[MDP_COMP_MERGE2];
+
+			alias_id = data->config_table[CONFIG_SVPP2_BUF_BF_RSZ_SWITCH];
+			mtk_mmsys_mdp_write_config(ctx->comp->mdp_dev->mdp_mmsys2,
+						   cmd, alias_id,
+						   subfrm->rsz_switch, 0xFFFFFFFF);
+			break;
+		case MDP_COMP_RSZ3:
+			merge = ctx->comp->mdp_dev->comp[MDP_COMP_MERGE3];
+
+			alias_id = data->config_table[CONFIG_SVPP3_BUF_BF_RSZ_SWITCH];
+			mtk_mmsys_mdp_write_config(ctx->comp->mdp_dev->mdp_mmsys2,
+						   cmd, alias_id,
+						   subfrm->rsz_switch, 0xFFFFFFFF);
+			break;
+		default:
+			goto subfrm_done;
+		}
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     VPP_MERGE_CFG_0, subfrm->merge_cfg, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     VPP_MERGE_CFG_4, subfrm->merge_cfg, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     VPP_MERGE_CFG_24, subfrm->merge_cfg, 0xFFFFFFFF);
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     VPP_MERGE_CFG_25, subfrm->merge_cfg, 0xFFFFFFFF);
+
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     VPP_MERGE_CFG_12, 0x1, 0xFFFFFFFF); // bypass mode
+		MM_REG_WRITE(cmd, merge->subsys_id, merge->reg_base,
+			     VPP_MERGE_ENABLE, 0x1, 0xFFFFFFFF);
+	}
+
+subfrm_done:
 	return 0;
 }
 
@@ -1020,10 +1106,12 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 {
 	const struct mdp_wrot_data *wrot = &ctx->param->wrot;
 	const struct mdp_platform_config *mdp_cfg = __get_plat_cfg(ctx);
+	const struct mtk_mdp_driver_data *data = ctx->comp->mdp_dev->mdp_data;
 	phys_addr_t base = ctx->comp->reg_base;
 	u8 subsys_id = ctx->comp->subsys_id;
 	bool comp;
 	u32 colorformat = ctx->outputs[0]->buffer.format.colorformat;
+	u32 alias_id;
 
 	/* Write frame base address */
 	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR, wrot->iova[0],
@@ -1084,11 +1172,36 @@ static int config_wrot_frame(struct mdp_comp_ctx *ctx,
 	if (wrot->fifo_test != 0)
 		MM_REG_WRITE(cmd, subsys_id, base, VIDO_FIFO_TEST,
 			     wrot->fifo_test, 0xFFF);
-	/* Filter enable */
-	if (mdp_cfg && mdp_cfg->wrot_filter_constraint)
-		MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
-			     wrot->filter, 0x77);
-
+	if (mdp_cfg) {
+		/* Filter enable */
+		if (mdp_cfg->wrot_filter_constraint)
+			MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
+				     wrot->filter, 0x77);
+
+		if (mdp_cfg->mdp_version_8195) {
+			/* Turn off WROT dma dcm */
+			MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN,
+				     (0x1 << 23) + (0x1 << 20), 0x900000);
+
+			if (wrot->vpp02vpp1) {
+				// Disable DCM (VPP02VPP1_RELAY)
+				alias_id = data->config_table[CONFIG_VPP0_HW_DCM_1ST_DIS0];
+				mtk_mmsys_mdp_write_config(ctx->comp->mdp_dev->mdp_mmsys,
+							   cmd, alias_id, 0x4000,
+							   0xFFFFFFFF);
+				// Set default size
+				alias_id = data->config_table[CONFIG_VPP0_DL_IRELAY_WR];
+				mtk_mmsys_mdp_write_config(ctx->comp->mdp_dev->mdp_mmsys2,
+							   cmd, alias_id, 0x0,
+							   0xFFFFFFFF);
+			} else {
+				alias_id = data->config_table[CONFIG_VPP0_HW_DCM_1ST_DIS0];
+				mtk_mmsys_mdp_write_config(ctx->comp->mdp_dev->mdp_mmsys,
+							   cmd, alias_id, 0x0,
+							   0xFFFFFFFF);
+			}
+		}
+	}
 	return 0;
 }
 
@@ -1566,17 +1679,30 @@ static const struct mdp_comp_ops camin_ops = {
 };
 
 static const struct mdp_comp_ops *mdp_comp_ops[MDP_COMP_TYPE_COUNT] = {
-	[MDP_COMP_TYPE_RDMA] =		&rdma_ops,
-	[MDP_COMP_TYPE_RSZ] =		&rsz_ops,
-	[MDP_COMP_TYPE_WROT] =		&wrot_ops,
-	[MDP_COMP_TYPE_WDMA] =		&wdma_ops,
-	[MDP_COMP_TYPE_PATH1] =		NULL,
-	[MDP_COMP_TYPE_PATH2] =		NULL,
-	[MDP_COMP_TYPE_CCORR] =		&ccorr_ops,
-	[MDP_COMP_TYPE_IMGI] =		&imgi_ops,
-	[MDP_COMP_TYPE_EXTO] =		NULL,
-	[MDP_COMP_TYPE_DL_PATH1] =	&camin_ops,
-	[MDP_COMP_TYPE_DL_PATH2] =	&camin_ops,
+	[MDP_COMP_TYPE_WPEI]     = &camin_ops,
+	[MDP_COMP_TYPE_SPLIT]    = &split_ops,
+	[MDP_COMP_TYPE_STITCH]   = &stitch_ops,
+	[MDP_COMP_TYPE_RDMA]     = &rdma_ops,
+	[MDP_COMP_TYPE_FG]       = &fg_ops,
+	[MDP_COMP_TYPE_HDR]      = &hdr_ops,
+	[MDP_COMP_TYPE_AAL]      = &aal_ops,
+	[MDP_COMP_TYPE_RSZ]      = &rsz_ops,
+	[MDP_COMP_TYPE_TDSHP]    = &tdshp_ops,
+	[MDP_COMP_TYPE_COLOR]    = &color_ops,
+	[MDP_COMP_TYPE_OVL]      = &ovl_ops,
+	[MDP_COMP_TYPE_PAD]      = &pad_ops,
+	[MDP_COMP_TYPE_TCC]      = &tcc_ops,
+	[MDP_COMP_TYPE_WROT]     = &wrot_ops,
+	[MDP_COMP_TYPE_WDMA]     = &wdma_ops,
+	[MDP_COMP_TYPE_MERGE]    = NULL,
+	[MDP_COMP_TYPE_PATH1]    = NULL,
+	[MDP_COMP_TYPE_PATH2]    = NULL,
+	[MDP_COMP_TYPE_CCORR]    = &ccorr_ops,
+	[MDP_COMP_TYPE_IMGI]     = &imgi_ops,
+	[MDP_COMP_TYPE_EXTO]     = NULL,
+	[MDP_COMP_TYPE_DL_PATH1] = &camin_ops,
+	[MDP_COMP_TYPE_DL_PATH2] = &camin_ops,
+	[MDP_COMP_TYPE_DUMMY]    = NULL,
 };
 
 static const struct of_device_id mdp_comp_dt_ids[] = {
@@ -2070,3 +2196,190 @@ int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
 		ctx->outputs[i] = &frame->outputs[param->outputs[i]];
 	return 0;
 }
+
+int mdp_hyfbc_init(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
+		   struct hyfbc_init_info *hyfbc, u32 wrot)
+{
+	struct mtk_mutex **mutex = mdp->mdp_mutex;
+	struct mtk_mutex **mutex2 = mdp->mdp_mutex2;
+	enum mtk_mdp_comp_id mtk_wrot = MDP_COMP_NONE;
+	phys_addr_t base;
+	u16 subsys_id;
+	u32 offset;
+	u32 mutex_id;
+	u32 mutex2_id;
+	u32 alias_id;
+	int evt;
+
+	mtk_wrot = get_comp_public_id(mdp, wrot);
+	if (!is_wrot(mtk_wrot)) {
+		dev_err(&mdp->pdev->dev, "Invalid wrot inner id %d", wrot);
+		return -EINVAL;
+	}
+
+	base = mdp->comp[mtk_wrot]->reg_base;
+	subsys_id = mdp->comp[mtk_wrot]->subsys_id;
+	offset = hyfbc->width_in_mb * hyfbc->byte_per_mb;
+
+	/* Reset WROT */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST,
+		     0x01, 0x00000001);
+	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT,
+		    0x01, 0x00000001);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SOFT_RST,
+		     0x00, 0x00000001);
+	MM_REG_POLL(cmd, subsys_id, base, VIDO_SOFT_RST_STAT,
+		    0x00, 0x00000001);
+
+	/* Write frame base address */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR,
+		     (hyfbc->pa_base + offset), 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_C,
+		     0x0, 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BASE_ADDR_V,
+		     0x0, 0xFFFFFFFF);
+
+	/* Write frame related registers */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL,
+		     0x5020, 0xF131512F);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_BKGD,
+		     ((hyfbc->is10b) ? 0xC8E438 : 0x18f4f8), 0xFFFFFFFF);
+
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_SCAN_10BIT,
+		     0x0, 0x0000000F);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_PENDING_ZERO,
+		     0x0, 0x04000000);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CTRL_2,
+		     0x0, 0x00000007);
+
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_PVRIC,
+		     0x0, 0x03);
+	/* Write pre-ultra threshold */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_DMA_PREULTRA,
+		     0x8804c, 0x00FFFFFF);
+	/* Write frame Y pitch */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE,
+		     (hyfbc->w_stride_in_mb * hyfbc->byte_per_mb), 0x0000FFFF);
+	/* Write frame UV pitch */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE_C,
+		     0x0, 0x0000FFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_STRIDE_V,
+		     0x0, 0x0000FFFF);
+	/* Write matrix control */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAT_CTRL,
+		     0x60, 0x000000F3);
+
+	/* Set the fixed ALPHA as 0xFF */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_DITHER,
+		     0xFF000000, 0xFF000000);
+	/* Set VIDO_EOL_SEL */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_RSV_1,
+		     0x80000000, 0x80000000);
+	/* Set VIDO_FIFO_TEST */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_FIFO_TEST,
+		     0x200, 0x00000FFF);
+
+	/* Filter enable */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
+		     0x0, 0x00000077);
+
+	/* Turn off WROT dma dcm */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN,
+		     (0x1 << 23) + (0x1 << 20), 0x00900000);
+
+	alias_id = mdp->mdp_data->config_table[CONFIG_VPP0_HW_DCM_1ST_DIS0];
+	mtk_mmsys_mdp_write_config(mdp->mdp_mmsys, cmd,
+				   alias_id, 0x0, 0xFFFFFFFF);
+
+	/* Set mutex modules */
+	switch (mtk_wrot) {
+	case MDP_COMP_WROT0:
+		mutex_id = 2;
+		mtk_mutex_add_mod_by_cmdq(mutex[mutex_id],
+					  0x800, 0x0, 0x0, cmd);
+		break;
+	case MDP_COMP_WROT1:
+		mutex2_id = 1;
+		mtk_mutex_add_mod_by_cmdq(mutex2[mutex2_id],
+					  0x80000000, 0x0, 0x0, cmd);
+		break;
+	case MDP_COMP_WROT2:
+		mutex2_id = 2;
+		mtk_mutex_add_mod_by_cmdq(mutex2[mutex2_id],
+					  0x0, 0x1, 0x0, cmd);
+		break;
+	case MDP_COMP_WROT3:
+		mutex2_id = 3;
+		mtk_mutex_add_mod_by_cmdq(mutex2[mutex2_id],
+					  0x0, 0x2, 0x0, cmd);
+		break;
+	default:
+		break;
+	}
+
+	/* Write Y pixel offset */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR,
+		     0x0, 0x0FFFFFFF);
+	/* Write U pixel offset */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR_C,
+		     0x0, 0x0FFFFFFF);
+	/* Write V pixel offset */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_OFST_ADDR_V,
+		     0x0, 0x0FFFFFFF);
+	/* Write source size */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_IN_SIZE,
+		     (hyfbc->height_in_mb << 16) | byte2pixel(hyfbc->byte_per_mb), 0xFFFFFFFF);
+	/* Write target size */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_TAR_SIZE,
+		     (hyfbc->height_in_mb << 16) | byte2pixel(hyfbc->byte_per_mb), 0xFFFFFFFF);
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_CROP_OFST, 0x0,
+		     0xFFFFFFFF);
+
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_MAIN_BUF_SIZE,
+		     ((byte2pixel(hyfbc->byte_per_mb) << 16) | 0x400), 0xFFFF7F00);
+
+	/* Enable WROT */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN, 0x01, 0x00000001);
+
+	switch (mtk_wrot) {
+	case MDP_COMP_WROT0:
+		evt = mdp_get_event_idx(mdp, WROT0_SOF);
+		MM_REG_CLEAR(cmd, evt);
+		mtk_mutex_enable_by_cmdq(mutex[mutex_id], cmd);
+		MM_REG_WAIT(cmd, evt);
+		evt = mdp_get_event_idx(mdp, WROT0_DONE);
+		MM_REG_WAIT(cmd, evt);
+		break;
+	case MDP_COMP_WROT1:
+		evt = mdp_get_event_idx(mdp, WROT1_SOF);
+		MM_REG_CLEAR(cmd, evt);
+		mtk_mutex_enable_by_cmdq(mutex2[mutex2_id], cmd);
+		MM_REG_WAIT(cmd, evt);
+		evt = mdp_get_event_idx(mdp, WROT1_DONE);
+		MM_REG_WAIT(cmd, evt);
+		break;
+	case MDP_COMP_WROT2:
+		evt = mdp_get_event_idx(mdp, WROT2_SOF);
+		MM_REG_CLEAR(cmd, evt);
+		mtk_mutex_enable_by_cmdq(mutex2[mutex2_id], cmd);
+		MM_REG_WAIT(cmd, evt);
+		evt = mdp_get_event_idx(mdp, WROT2_DONE);
+		MM_REG_WAIT(cmd, evt);
+		break;
+	case MDP_COMP_WROT3:
+		evt = mdp_get_event_idx(mdp, WROT3_SOF);
+		MM_REG_CLEAR(cmd, evt);
+		mtk_mutex_enable_by_cmdq(mutex2[mutex2_id], cmd);
+		MM_REG_WAIT(cmd, evt);
+		evt = mdp_get_event_idx(mdp, WROT3_DONE);
+		MM_REG_WAIT(cmd, evt);
+		break;
+	default:
+		break;
+	}
+
+	/* Disable WROT */
+	MM_REG_WRITE(cmd, subsys_id, base, VIDO_ROT_EN, 0x00, 0x00000001);
+
+	return 0;
+}
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
index 05a60771d4bc..391e9014dc99 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-comp.h
@@ -222,7 +222,8 @@ void mdp_comp_clocks_off(struct device *dev, struct mdp_comp *comps, int num);
 int mdp_comp_ctx_init(struct mdp_dev *mdp, struct mdp_comp_ctx *ctx,
 		      const struct img_compparam *param,
 		      const struct img_ipi_frameparam *frame);
-
+int mdp_hyfbc_init(struct mdp_dev *mdp, struct mmsys_cmdq_cmd *cmd,
+		   struct hyfbc_init_info *hyfbc, u32 wrot);
 int mdp_get_event_idx(struct mdp_dev *mdp, enum mdp_comp_event event);
 
 #endif  /* __MTK_MDP3_COMP_H__ */
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
index bef8da6fff1c..d8161be8c556 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.c
@@ -44,6 +44,9 @@ static const struct of_device_id mdp_of_ids[] = {
 	{ .compatible = "mediatek,mt8183-mdp3",
 	  .data = &mt8183_mdp_driver_data,
 	},
+	{ .compatible = "mediatek,mt8195-mdp3",
+	  .data = &mt8195_mdp_driver_data,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mdp_of_ids);
@@ -150,7 +153,7 @@ static int mdp_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct mdp_dev *mdp;
 	struct device_node *mdp_node;
-	struct platform_device *mm_pdev;
+	struct platform_device *mm_pdev, *mm_pdev2;
 	u32 event_ofst;
 	int ret, i, mutex_id;
 
@@ -162,13 +165,28 @@ static int mdp_probe(struct platform_device *pdev)
 
 	mdp->pdev = pdev;
 	mdp->mdp_data = of_device_get_match_data(&pdev->dev);
+
+	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
+		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+
 	mm_pdev = __get_pdev_by_name(pdev, "mediatek,mmsys");
 	if (!mm_pdev) {
-		ret = -ENODEV;
-		goto err_return;
+		if (mdp->mdp_data->mdp_cfg->support_multi_larb) {
+			platform_set_drvdata(pdev, mdp);
+			goto success_return;
+		} else {
+			ret = -ENODEV;
+			goto err_return;
+		}
 	}
 	mdp->mdp_mmsys = &mm_pdev->dev;
 
+	mm_pdev2 = __get_pdev_by_name(pdev, "mediatek,mmsys2");
+	if (!mm_pdev2)
+		dev_err(dev, "Failed to get mdp mmsys2\n");
+	else
+		mdp->mdp_mmsys2 = &mm_pdev2->dev;
+
 	mdp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,mm-mutex", 0);
 	if (!mdp_node) {
 		ret = -ENODEV;
@@ -200,17 +218,43 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_return;
 	}
 
+	mdp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,mm-mutex2", 0);
+	if (!mdp_node) {
+		dev_err(dev, "Failed to get mdp mm-mutex2\n");
+	} else {
+		mm_pdev2 = of_find_device_by_node(mdp_node);
+		of_node_put(mdp_node);
+		if (WARN_ON(!mm_pdev2)) {
+			ret = -ENODEV;
+			goto err_return;
+		}
+	}
+
 	for (i = 0; i < mdp->mdp_data->pipe_info_len; i++) {
 		mutex_id = mdp->mdp_data->pipe_info[i].mutex_id;
-		if (mdp->mdp_mutex[mutex_id])
-			continue;
-
-		mdp->mdp_mutex[mutex_id] =
-			mtk_mutex_mdp_get(&mm_pdev->dev, mdp->mdp_data->pipe_info[i].pipe_id);
 
-		if (!mdp->mdp_mutex[mutex_id]) {
-			ret = -ENODEV;
-			goto err_return;
+		if (mdp->mdp_data->pipe_info[i].mmsys_id != 0) {
+			if (mdp->mdp_mutex2[mutex_id])
+				continue;
+			mdp->mdp_mutex2[mutex_id] =
+				mtk_mutex_mdp_get(&mm_pdev2->dev,
+						  mdp->mdp_data->pipe_info[i].pipe_id);
+
+			if (!mdp->mdp_mutex2[mutex_id]) {
+				ret = -ENODEV;
+				goto err_return;
+			}
+		} else {
+			if (mdp->mdp_mutex[mutex_id])
+				continue;
+			mdp->mdp_mutex[mutex_id] =
+				mtk_mutex_mdp_get(&mm_pdev->dev,
+						  mdp->mdp_data->pipe_info[i].pipe_id);
+
+			if (!mdp->mdp_mutex[mutex_id]) {
+				ret = -ENODEV;
+				goto err_return;
+			}
 		}
 	}
 
@@ -273,6 +317,7 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_unregister_device;
 	}
 
+success_return:
 	dev_dbg(dev, "mdp-%d registered successfully\n", pdev->id);
 	return 0;
 
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
index c668e317f947..8ee70763a18f 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-core.h
@@ -60,7 +60,9 @@ struct mtk_mdp_driver_data {
 struct mdp_dev {
 	struct platform_device			*pdev;
 	struct device				*mdp_mmsys;
+	struct device				*mdp_mmsys2;
 	struct mtk_mutex			*mdp_mutex[MDP_PIPE_MAX];
+	struct mtk_mutex			*mdp_mutex2[MDP_PIPE_MAX];
 	struct mdp_comp				*comp[MDP_MAX_COMP_COUNT];
 	const struct mtk_mdp_driver_data	*mdp_data;
 	s32					event[MDP_MAX_EVENT_COUNT];
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
index ca1c19c41950..1e749bb2b338 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-m2m.c
@@ -90,6 +90,7 @@ static void mdp_m2m_worker(struct work_struct *work)
 	param.type = ctx->curr_param.type;
 	param.num_inputs = 1;
 	param.num_outputs = 1;
+	param.frame_change = (ctx->frame_count[MDP_M2M_SRC] == 0);
 
 	frame = ctx_get_frame(ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	src_vb = v4l2_m2m_next_src_buf(ctx->m2m_ctx);
@@ -328,6 +329,11 @@ static int mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 		ctx->curr_param.ycbcr_enc = f->fmt.pix_mp.ycbcr_enc;
 		ctx->curr_param.quant = f->fmt.pix_mp.quantization;
 		ctx->curr_param.xfer_func = f->fmt.pix_mp.xfer_func;
+
+		if (MDP_COLOR_IS_HYFBC_COMPRESS(fmt->mdp_color)) {
+			frame->stride.width = ((f->fmt.pix_mp.width + 63) >> 6) << 6;
+			frame->stride.height = ((f->fmt.pix_mp.height + 31) >> 5) << 5;
+		}
 	} else {
 		capture->compose.left = 0;
 		capture->compose.top = 0;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
index 83e91735202b..8c2b74c67273 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.c
@@ -147,6 +147,47 @@ int mdp_enum_fmt_mplane(struct v4l2_fmtdesc *f)
 	return 0;
 }
 
+static u32 mdp_fmt_get_hyfbc_plane_size(u32 width,
+					u32 height, u32 color, unsigned int plane)
+{
+	u32 y_data_size = 0;
+	u32 c_data_size = 0;
+	u32 y_header_size = 0;
+	u32 c_header_size = 0;
+	u32 y_data_ofst = 0;
+	u32 c_data_ofst = 0;
+	u32 c_header_ofst = 0;
+
+	y_data_size = (((width + 63) >> 6) << 6) * (((height + 63) >> 6) << 6);
+	y_header_size = y_data_size >> 6;
+	if (MDP_COLOR_IS_10BIT_PACKED(color))
+		y_data_size = (y_data_size * 6) >> 2;
+
+	c_data_size = y_data_size >> 1;
+	c_header_size = (((y_header_size >> 1) + 63) >> 6) << 6;
+
+	// Setup source buffer base
+	y_data_ofst = ((y_header_size + 4095) >> 12) << 12; // align 4k
+	c_data_ofst = ((y_data_ofst + y_data_size + c_header_size + 4095) >> 12) << 12; // align 4k
+	c_header_ofst = c_data_ofst - c_header_size;
+
+	if (plane == 0)
+		return c_header_ofst;
+	else
+		return (c_data_ofst + c_data_size);
+}
+
+static u32 mdp_fmt_get_afbc_plane_size(u32 width, u32 height, u32 color)
+{
+	u32 align_w = ((width + 31) >> 5) << 5;
+	u32 align_h = ((height + 31) >> 5) << 5;
+
+	if (MDP_COLOR_IS_10BIT_PACKED(color))
+		return ((align_w >> 4) * (align_h >> 4) * (16 + 512));
+	else
+		return ((align_w >> 4) * (align_h >> 4) * (16 + 384));
+}
+
 const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
 					    struct mdp_frameparam *param,
 					    u32 ctx_id)
@@ -211,11 +252,17 @@ const struct mdp_format *mdp_try_fmt_mplane(struct v4l2_format *f,
 			bpl = min_bpl;
 		si = (bpl * pix_mp->height * fmt->depth[i]) / fmt->row_depth[i];
 
+		if (MDP_COLOR_IS_HYFBC_COMPRESS(fmt->mdp_color)) {
+			si = mdp_fmt_get_hyfbc_plane_size(pix_mp->width,
+							  pix_mp->height, fmt->mdp_color, i);
+		} else if (MDP_COLOR_IS_COMPRESS(fmt->mdp_color)) {
+			si = mdp_fmt_get_afbc_plane_size(pix_mp->width,
+							 pix_mp->height, fmt->mdp_color);
+		}
+
 		pix_mp->plane_fmt[i].bytesperline = bpl;
 		if (pix_mp->plane_fmt[i].sizeimage < si)
 			pix_mp->plane_fmt[i].sizeimage = si;
-		dev_dbg(dev, "%d: p%u, bpl:%u (%u), sizeimage:%u (%u)", ctx_id,
-			i, bpl, min_bpl, pix_mp->plane_fmt[i].sizeimage, si);
 	}
 
 	return fmt;
@@ -324,8 +371,14 @@ static u32 mdp_fmt_get_stride(const struct mdp_format *fmt,
 	enum mdp_color c = fmt->mdp_color;
 	u32 stride;
 
-	stride = (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
-		/ fmt->row_depth[0];
+	if (MDP_COLOR_IS_COMPRESS(c)) {
+		bytesperline = ((bytesperline + 31) >> 5) << 5;
+		stride = (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
+			/ fmt->row_depth[0];
+	} else {
+		stride = (bytesperline * MDP_COLOR_BITS_PER_PIXEL(c))
+			/ fmt->row_depth[0];
+	}
 	if (plane == 0)
 		return stride;
 	if (plane < MDP_COLOR_GET_PLANE_COUNT(c)) {
@@ -398,6 +451,19 @@ static void mdp_prepare_buffer(struct img_image_buffer *b,
 			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
 					       pix_mp->height, i) -
 					       vb->planes[i].data_offset;
+
+		if (MDP_COLOR_IS_HYFBC_COMPRESS(b->format.colorformat)) {
+			b->format.plane_fmt[i].size =
+				mdp_fmt_get_hyfbc_plane_size(pix_mp->width,
+							     pix_mp->height,
+							     b->format.colorformat, i);
+		} else if (MDP_COLOR_IS_COMPRESS(b->format.colorformat)) {
+			b->format.plane_fmt[i].size =
+				mdp_fmt_get_afbc_plane_size(pix_mp->width,
+							    pix_mp->height,
+							    b->format.colorformat);
+		}
+
 		b->iova[i] = vb2_dma_contig_plane_dma_addr(vb, i) +
 			     vb->planes[i].data_offset;
 	}
@@ -409,6 +475,18 @@ static void mdp_prepare_buffer(struct img_image_buffer *b,
 		b->format.plane_fmt[i].size =
 			mdp_fmt_get_plane_size(frame->mdp_fmt, stride,
 					       pix_mp->height, i);
+
+		if (MDP_COLOR_IS_HYFBC_COMPRESS(b->format.colorformat)) {
+			b->format.plane_fmt[i].size =
+				mdp_fmt_get_hyfbc_plane_size(pix_mp->width,
+							     pix_mp->height,
+							     b->format.colorformat, i);
+		} else if (MDP_COLOR_IS_COMPRESS(b->format.colorformat)) {
+			b->format.plane_fmt[i].size =
+				mdp_fmt_get_afbc_plane_size(pix_mp->width,
+							    pix_mp->height,
+							    b->format.colorformat);
+		}
 		b->iova[i] = b->iova[i - 1] + b->format.plane_fmt[i - 1].size;
 	}
 	b->usage = frame->usage;
diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
index 4a25f86bfaa5..1ef32b747233 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-regs.h
@@ -355,6 +355,8 @@ struct mdp_frame {
 	u32			dre:1;
 	u32			sharpness:1;
 	u32			dither:1;
+	/* H and V stride, only for HYFBC format */
+	struct v4l2_rect	stride;
 };
 
 static inline bool mdp_target_is_crop(u32 target)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
