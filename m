Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D54C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 02:26:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2773613A7
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 02:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2773613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oL7DGDEoigxuRz+Zv+PkF2iDCYLw0j+8f18I0kJByx0=; b=uxYAZAhU0fCdf0
	IEKt4rDKZ2s/xlIq+b2LQzo4mHoJbfQBU8/8yphza6e5OLY0oKdZkfHRl2bky0jzgl3/XB7pTBxpf
	cUX7gRDKanQAYxmKEHa3aOk6/JI2UOaB/WCNN4Yrn9lzoKVwu4JPY8ryGVq3YAX93fhnGYPAnxZfx
	YUek/Gk/DLf0j7JRfLROZ3mAW2ZbVAfDgKF7jVrAa7zpZEjPoXS9YY7ASENua20eCCTiYDU7uyTg5
	fs0NQR/UOuyWu/u0pKpBgHknl9YLyY9CgDkKgwIyKO+/Y2BTF+qsXoyNzxg9sVtqeieoxiZ1o4QKS
	5CvZHj1VOdxYHWnjbrOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdkGK-009XTG-0A; Fri, 22 Oct 2021 02:26:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdkCF-009Vrj-Ps; Fri, 22 Oct 2021 02:22:22 +0000
X-UUID: 6dbad25e4f7d4f18bc0f445101af3eee-20211021
X-UUID: 6dbad25e4f7d4f18bc0f445101af3eee-20211021
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1366436243; Thu, 21 Oct 2021 19:22:09 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Oct 2021 19:22:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Oct 2021 10:21:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Oct 2021 10:21:53 +0800
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
Subject: [PATCH v3 2/9] soc: mediatek: mutex: expand parameter for mdp mutex
 function
Date: Fri, 22 Oct 2021 10:21:39 +0800
Message-ID: <20211022022146.3577-3-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211022022146.3577-1-roy-cw.yeh@mediatek.com>
References: <20211022022146.3577-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_192215_929750_5AD54312 
X-CRM114-Status: GOOD (  13.99  )
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

Expand parameter for mdp mutex function

Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 26 ++++++++++++++++++--------
 include/linux/soc/mediatek/mtk-mutex.h |  2 +-
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 814f58f692cf..c100a5249016 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -25,8 +25,9 @@
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
 #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
-#define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	(mutex_mod_reg + 0x20 * (n))
-#define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	(mutex_sof_reg + 0x20 * (n))
+#define DISP_REG_MUTEX_MOD(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20 * (n))
+#define DISP_REG_MUTEX_MOD1(mutex_mod_reg, n)	((mutex_mod_reg) + 0x20 * (n) + 0x4)
+#define DISP_REG_MUTEX_SOF(mutex_sof_reg, n)	((mutex_sof_reg) + 0x20 * (n))
 #define DISP_REG_MUTEX_MOD2(n)			(0x34 + 0x20 * (n))
 
 #define INT_MUTEX				BIT(1)
@@ -116,6 +117,11 @@
 #define MT8183_MUTEX_MDP_MOD_MASK		0x07FFFFFF
 #define MT8183_MUTEX_MDP_SOF_MASK		0x00000007
 
+#define MT8183_MDP_PIPE_IMGI			MT8183_MUTEX_MDP_START
+#define MT8183_MDP_PIPE_RDMA0			(MT8183_MUTEX_MDP_START + 1)
+#define MT8183_MDP_PIPE_WPEI			(MT8183_MUTEX_MDP_START + 2)
+#define MT8183_MDP_PIPE_WPEI2			(MT8183_MUTEX_MDP_START + 3)
+
 struct mtk_mutex {
 	int id;
 	bool claimed;
@@ -254,10 +260,10 @@ static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 
 /* indicate which mutex is used by each pipepline */
 static const unsigned int mt8183_mutex_mdp_offset[MDP_PIPE_MAX] = {
-	[MDP_PIPE_IMGI] = MT8183_MUTEX_MDP_START,
-	[MDP_PIPE_RDMA0] = MT8183_MUTEX_MDP_START + 1,
-	[MDP_PIPE_WPEI] = MT8183_MUTEX_MDP_START + 2,
-	[MDP_PIPE_WPEI2] = MT8183_MUTEX_MDP_START + 3
+	[MDP_PIPE_IMGI] = MT8183_MDP_PIPE_IMGI,
+	[MDP_PIPE_RDMA0] = MT8183_MDP_PIPE_RDMA0,
+	[MDP_PIPE_WPEI] = MT8183_MDP_PIPE_WPEI,
+	[MDP_PIPE_WPEI2] = MT8183_MDP_PIPE_WPEI2,
 };
 
 static const struct mtk_mutex_data mt2701_mutex_driver_data = {
@@ -410,7 +416,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
 
 void mtk_mutex_add_mdp_mod(struct mtk_mutex *mutex, u32 mod,
-			   struct mmsys_cmdq_cmd *cmd)
+			   u32 mod1, u32 sof, struct mmsys_cmdq_cmd *cmd)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
@@ -422,9 +428,13 @@ void mtk_mutex_add_mdp_mod(struct mtk_mutex *mutex, u32 mod,
 	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
 			    mod, mtx->data->mutex_mdp_mod_mask);
 
+	offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg, mutex->id);
+	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
+			    mod1, mtx->data->mutex_mdp_mod_mask);
+
 	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
 	cmdq_pkt_write_mask(cmd->pkt, mtx->subsys_id, mtx->addr + offset,
-			    0, mtx->data->mutex_mdp_sof_mask);
+			    sof, mtx->data->mutex_mdp_sof_mask);
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_add_mdp_mod);
 
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index d08b98419dd9..a2b81ce55b5d 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -17,7 +17,7 @@ int mtk_mutex_prepare(struct mtk_mutex *mutex);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
 void mtk_mutex_add_mdp_mod(struct mtk_mutex *mutex, u32 mod,
-			   struct mmsys_cmdq_cmd *cmd);
+			   u32 mod1, u32 sof, struct mmsys_cmdq_cmd *cmd);
 void mtk_mutex_enable(struct mtk_mutex *mutex);
 void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
 			      struct mmsys_cmdq_cmd *cmd);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
