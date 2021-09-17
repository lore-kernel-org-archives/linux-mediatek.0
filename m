Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D08C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 03:28:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 004F061056
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 03:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 004F061056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEu1V7D1HCMTbQHbkRn1x7eoE7dNmDQ/YTjz79pLQx8=; b=W+9/E7ES842qfG
	F3IrDN4eQ35BSNQsxjTreOqACDbeeIyQyka3ACcrEqaIYCmND9xoUj5SuK4kiuNW8gek2BLaWWRuJ
	HGMcaRZx61byakQ16IJtCS5OIILTtQghivzV9VJ/Bx8K2bF+W83rFQmByRfQsA7bMtBVTMxB1kTp+
	8mmGB+njAYq1O2pZZ/0nPPnQpS1jMX0tKTPdbaddaR59EBoziq7rtjHT3q360jTW6lezS7uFTJve8
	9Y0Z/UQ9YPPYX34wTpP0+6KndaTQ7GjN72/fl+qPbMRus1SVrxcryGAbBDa1HVF5b9TmWY9cgjxBz
	LK4ump+CehtinhUMNPAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR4YE-00D8lY-Fk; Fri, 17 Sep 2021 03:28:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR4YB-00D8k8-7C
 for linux-mediatek@lists.infradead.org; Fri, 17 Sep 2021 03:28:32 +0000
X-UUID: c7079849e5f741a288c744e47b5bba7e-20210916
X-UUID: c7079849e5f741a288c744e47b5bba7e-20210916
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roy-cw.yeh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 864216713; Thu, 16 Sep 2021 20:28:27 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 20:27:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 17 Sep 2021 11:27:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 17 Sep 2021 11:27:44 +0800
From: roy-cw.yeh <roy-cw.yeh@mediatek.com>
To: "river . cheng" <river.cheng@mediatek.com>
CC: <linux-mediatek@lists.infradead.org>, Roy-CW.Yeh <roy-cw.yeh@mediatek.com>
Subject: [PATCH v1 2/9] soc: mediatek: mutex: expand parameter for mdp mutex
 function
Date: Fri, 17 Sep 2021 11:27:21 +0800
Message-ID: <20210917032728.22367-3-roy-cw.yeh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210917032728.22367-1-roy-cw.yeh@mediatek.com>
References: <20210917032728.22367-1-roy-cw.yeh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_202831_317173_D2E3A4A7 
X-CRM114-Status: GOOD (  12.36  )
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
