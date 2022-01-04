Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7691CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 09:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q22GQ8hBBopBtvavo9bCyXR/ugm2N3uqLq1II0Q2c/c=; b=jthCtNFVL/Enh9
	e41rSyIF+8NZ31A9GscyMzuF0vJv/m/uraTft7AHi5etEh/yKZzW4c8BfP0I0nB2raxUW8CIF+nZs
	+BtjzRk8rO8axITtQOyNLeuOxS/OlB3zAt85rF5c+d90O5M9/ZwV9VA2W//phUsE6QzxP5zV/sr0Z
	APlhJYSUb3MhLt66LsJB+CRj4QPHlXTsjSOLC1mClsnMjcmZk+t5pN4MbEYSZRx9YNE6ac1H+tUdZ
	s+Ch7xOQkICwQ+hTW7BrGwMi31B+3dLNwWtFEj+rZ766mYN1vdajw5MEq2AalyAUt+UIcC4P68cu9
	75W2mSnDsR7L87gdmb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4g0r-00Axyh-SV; Tue, 04 Jan 2022 09:21:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4fwk-00AwNW-7m; Tue, 04 Jan 2022 09:17:36 +0000
X-UUID: e3dda21a131048c08748592dda7e190f-20220104
X-UUID: e3dda21a131048c08748592dda7e190f-20220104
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1923551785; Tue, 04 Jan 2022 02:17:29 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 01:17:27 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 4 Jan 2022 17:17:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 4 Jan 2022 17:17:18 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jernej Skrabec <jernej.skrabec@siol.net>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Rob Landley <rob@landley.net>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Alexandre Courbot <acourbot@chromium.org>, <tfiga@chromium.org>,
 <drinkcat@chromium.org>, <pihsun@chromium.org>, <hsinyi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>, daoyuan huang
 <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 <menghui.lin@mediatek.com>, <sj.huang@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <randy.wu@mediatek.com>,
 <moudy.ho@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <srv_heupstream@mediatek.com>
Subject: [PATCH v11 4/4] soc: mediatek: mutex: add functions that operate
 registers by CMDQ
Date: Tue, 4 Jan 2022 17:17:12 +0800
Message-ID: <20220104091712.25670-5-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220104091712.25670-1-moudy.ho@mediatek.com>
References: <20220104091712.25670-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_011734_328531_BEF3CDB6 
X-CRM114-Status: GOOD (  19.17  )
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

Considering that some functions have timing requirements
in specific situation, this patch adds several interface that
operate registers by CMDQ.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 72 +++++++++++++++++++++++++-
 include/linux/soc/mediatek/mtk-mutex.h |  6 +++
 2 files changed, 76 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 64a4f79e432e..615c42260a50 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -7,10 +7,14 @@
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 #include <linux/soc/mediatek/mtk-mutex.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#define MTK_MUTEX_ENABLE			BIT(0)
 
 #define MT2701_MUTEX0_MOD0			0x2c
 #define MT2701_MUTEX0_SOF0			0x30
@@ -156,6 +160,7 @@ struct mtk_mutex_data {
 	const unsigned int mutex_mdp_mod_mask;
 	const unsigned int mutex_mdp_sof_mask;
 	const bool no_clk;
+	const bool has_gce_client_reg;
 };
 
 struct mtk_mutex_ctx {
@@ -164,6 +169,8 @@ struct mtk_mutex_ctx {
 	void __iomem			*regs;
 	struct mtk_mutex		mutex[10];
 	const struct mtk_mutex_data	*data;
+	phys_addr_t			addr;
+	struct cmdq_client_reg		cmdq_reg;
 };
 
 static const unsigned int mt2701_mutex_mod[DDP_COMPONENT_ID_MAX] = {
@@ -338,6 +345,7 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 	.mutex_mdp_mod_mask = MT8183_MUTEX_MDP_MOD_MASK,
 	.mutex_mdp_sof_mask = MT8183_MUTEX_MDP_SOF_MASK,
 	.no_clk = true,
+	.has_gce_client_reg = true,
 };
 
 static const struct mtk_mutex_data mt8192_mutex_driver_data = {
@@ -510,6 +518,25 @@ u32 mtk_mutex_get_mdp_mod(struct mtk_mutex *mutex, enum mtk_mdp_comp_id id)
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_get_mdp_mod);
 
+void mtk_mutex_add_mod_by_cmdq(struct mtk_mutex *mutex, u32 mod,
+			       struct mmsys_cmdq_cmd *cmd)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int offset;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg, mutex->id);
+	cmdq_pkt_write_mask(cmd->pkt, mtx->cmdq_reg.subsys, mtx->addr + offset,
+			    mod, mtx->data->mutex_mdp_mod_mask);
+
+	offset = DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id);
+	cmdq_pkt_write_mask(cmd->pkt, mtx->cmdq_reg.subsys, mtx->addr + offset,
+			    0, mtx->data->mutex_mdp_sof_mask);
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_add_mod_by_cmdq);
+
 void mtk_mutex_enable(struct mtk_mutex *mutex)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
@@ -521,6 +548,20 @@ void mtk_mutex_enable(struct mtk_mutex *mutex)
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_enable);
 
+void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
+			      struct mmsys_cmdq_cmd *cmd)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	cmdq_pkt_write_mask(cmd->pkt, mtx->cmdq_reg.subsys,
+			    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),
+			    MTK_MUTEX_ENABLE, MTK_MUTEX_ENABLE);
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_enable_by_cmdq);
+
 void mtk_mutex_disable(struct mtk_mutex *mutex)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
@@ -532,6 +573,20 @@ void mtk_mutex_disable(struct mtk_mutex *mutex)
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_disable);
 
+void mtk_mutex_disable_by_cmdq(struct mtk_mutex *mutex,
+			       struct mmsys_cmdq_cmd *cmd)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	cmdq_pkt_write_mask(cmd->pkt, mtx->cmdq_reg.subsys,
+			    mtx->addr + DISP_REG_MUTEX_EN(mutex->id),
+			    0x0, MTK_MUTEX_ENABLE);
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_disable_by_cmdq);
+
 void mtk_mutex_acquire(struct mtk_mutex *mutex)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
@@ -559,8 +614,8 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_mutex_ctx *mtx;
-	struct resource *regs;
-	int i;
+	struct resource *regs, addr;
+	int i, ret;
 
 	mtx = devm_kzalloc(dev, sizeof(*mtx), GFP_KERNEL);
 	if (!mtx)
@@ -580,6 +635,19 @@ static int mtk_mutex_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (of_address_to_resource(dev->of_node, 0, &addr) < 0)
+		mtx->addr = 0L;
+	else
+		mtx->addr = addr.start;
+
+	if (mtx->data->has_gce_client_reg) {
+		ret = cmdq_dev_get_client_reg(dev, &mtx->cmdq_reg, 0);
+		if (ret) {
+			dev_err(dev, "No mediatek,gce-client-reg!\n");
+			return ret;
+		}
+	}
+
 	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mtx->regs = devm_ioremap_resource(dev, regs);
 	if (IS_ERR(mtx->regs)) {
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index b2608f4220ee..05de7ad4a124 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -17,8 +17,14 @@ int mtk_mutex_prepare(struct mtk_mutex *mutex);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
 u32 mtk_mutex_get_mdp_mod(struct mtk_mutex *mutex, enum mtk_mdp_comp_id id);
+void mtk_mutex_add_mod_by_cmdq(struct mtk_mutex *mutex, u32 mod,
+			       struct mmsys_cmdq_cmd *cmd);
 void mtk_mutex_enable(struct mtk_mutex *mutex);
+void mtk_mutex_enable_by_cmdq(struct mtk_mutex *mutex,
+			      struct mmsys_cmdq_cmd *cmd);
 void mtk_mutex_disable(struct mtk_mutex *mutex);
+void mtk_mutex_disable_by_cmdq(struct mtk_mutex *mutex,
+			       struct mmsys_cmdq_cmd *cmd);
 void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 			   enum mtk_ddp_comp_id id);
 void mtk_mutex_unprepare(struct mtk_mutex *mutex);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
