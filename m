Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36C7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 06:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5qY8mYMgV2onxWqM62aAsdnv7QzfAk3wu0Y5Jz3+K0k=; b=H/oXXdUhelIytl
	nh5zmXt2pO4PoGqgi8xBb5kIiXjghBR1BeD0GGsfLgJCcrtb36JVv7k06r0T3s9y/Io277iqRnuah
	WY9OjqV9ZoRaNvOP/Wlv+FKZVmZaK1kD9SUrSIfwslR1zasZfqAsBYj8kYmzLfHgHVUyk87IhMQ2k
	CCTOH+WH/hv1LcfoWdWBRQB/C5xYu+xoPgOrokojlw7riQH5F+Kq1QPcNFYVUMhf+j6La4ueMS3/M
	jQWD1zH1MzXglGvtinZaw/9q7skOHi7e2rH6zs94XU5bueOsDW1hDEnd8mmq7fa12ePjrX9O+ZDnT
	GFgcKDte1F41oyHVpVnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9L7W-00DYlg-7l; Mon, 17 Jan 2022 06:03:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9L6n-00DYUz-JS; Mon, 17 Jan 2022 06:03:15 +0000
X-UUID: 17a44f97e826423a90b5d6d349111626-20220116
X-UUID: 17a44f97e826423a90b5d6d349111626-20220116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 136538284; Sun, 16 Jan 2022 23:03:10 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Jan 2022 21:53:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 13:53:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 13:53:07 +0800
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
Subject: [PATCH v1 02/14] soc: mediatek: mutex: expand parameter for mdp mutex
 function
Date: Mon, 17 Jan 2022 13:52:42 +0800
Message-ID: <20220117055254.9777-3-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
References: <20220117055254.9777-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_220313_658068_2F16E547 
X-CRM114-Status: GOOD (  14.73  )
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
---
This patch is base on [1][2]
[1] soc: mediatek: mutex: add functions that operate registers by CMDQ
- https://patchwork.kernel.org/project/linux-mediatek/patch/20220104091712.25670-5-moudy.ho@mediatek.com/
[2] media: platform: mtk-mdp3: add Mediatek MDP3 driver
- https://patchwork.kernel.org/project/linux-mediatek/patch/20220105093758.6850-4-moudy.ho@mediatek.com/
---
 .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  3 ++-
 drivers/soc/mediatek/mtk-mutex.c              | 26 +++++++++++++------
 include/linux/soc/mediatek/mtk-mutex.h        |  2 +-
 3 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
index 4a08502952d6..87751f0e2513 100644
--- a/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
+++ b/drivers/media/platform/mtk-mdp3/mtk-mdp3-cmdq.c
@@ -101,7 +101,8 @@ static int mdp_path_subfrm_require(struct mdp_path_subfrm *subfrm,
 	}
 
 	if (subfrm->mutex_mod)
-		mtk_mutex_add_mod_by_cmdq(mutex[mutex_id], subfrm->mutex_mod, cmd);
+		mtk_mutex_add_mod_by_cmdq(mutex[mutex_id], subfrm->mutex_mod,
+					  0, 0, cmd);
 
 	/* Set SOF */
 	for (index = 0; index < config->num_components; index++) {
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 89daab7e6863..7da0f44b6f9a 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -27,8 +27,9 @@
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
@@ -180,6 +181,11 @@
 #define MT8183_MUTEX_MOD_MDP_AAL0		BIT(23)
 #define MT8183_MUTEX_MOD_MDP_CCORR0		BIT(24)
 
+#define MT8183_MDP_PIPE_IMGI                   MT8183_MUTEX_MDP_START
+#define MT8183_MDP_PIPE_RDMA0                  (MT8183_MUTEX_MDP_START + 1)
+#define MT8183_MDP_PIPE_WPEI                   (MT8183_MUTEX_MDP_START + 2)
+#define MT8183_MDP_PIPE_WPEI2                  (MT8183_MUTEX_MDP_START + 3)
+
 struct mtk_mutex {
 	int id;
 	bool claimed;
@@ -364,10 +370,10 @@ static const unsigned int mt8183_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 
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
 
 static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
@@ -606,7 +612,7 @@ u32 mtk_mutex_get_mdp_mod(struct mtk_mutex *mutex, enum mtk_mdp_comp_id id)
 EXPORT_SYMBOL_GPL(mtk_mutex_get_mdp_mod);
 
 void mtk_mutex_add_mod_by_cmdq(struct mtk_mutex *mutex, u32 mod,
-			       struct mmsys_cmdq_cmd *cmd)
+			       u32 mod1, u32 sof, struct mmsys_cmdq_cmd *cmd)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
 						 mutex[mutex->id]);
@@ -618,9 +624,13 @@ void mtk_mutex_add_mod_by_cmdq(struct mtk_mutex *mutex, u32 mod,
 	cmdq_pkt_write_mask(cmd->pkt, mtx->cmdq_reg.subsys, mtx->addr + offset,
 			    mod, mtx->data->mutex_mdp_mod_mask);
 
+	offset = DISP_REG_MUTEX_MOD1(mtx->data->mutex_mod_reg, mutex->id);
+	cmdq_pkt_write_mask(cmd->pkt, mtx->cmdq_reg.subsys, mtx->addr + offset,
+			    mod1, mtx->data->mutex_mdp_mod_mask);
+
 	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
 	cmdq_pkt_write_mask(cmd->pkt, mtx->cmdq_reg.subsys, mtx->addr + offset,
-			    0, mtx->data->mutex_mdp_sof_mask);
+			    sof, mtx->data->mutex_mdp_sof_mask);
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_add_mod_by_cmdq);
 
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index 05de7ad4a124..dbb7324c12d9 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -18,7 +18,7 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
 u32 mtk_mutex_get_mdp_mod(struct mtk_mutex *mutex, enum mtk_mdp_comp_id id);
 void mtk_mutex_add_mod_by_cmdq(struct mtk_mutex *mutex, u32 mod,
-			       struct mmsys_cmdq_cmd *cmd);
+			       u32 mod1, u32 sof, struct mmsys_cmdq_cmd *cmd);
 void mtk_mutex_enable(struct mtk_mutex *mutex);
 void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
 			      struct mmsys_cmdq_cmd *cmd);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
