Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E578C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 06:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KgBxVMnc+KmFW6melfMyEpbcExw85uZygGjN4HsPd4Q=; b=BL4jEb21s/D0+P
	dULC3vSvhgkWxVJ0u7G6dfTCCEU68qGzEQrTJ5TBzvMJwG/zesXktfb5YqptUqskbsN7l5tnLCLl5
	Qimg8Ln+Q4kFfJYytNlN1FwkVc+nFqBCoNUpUBxc0i6ervjiZqjt381QCCZ2Oz4eRhiz1IDDdsemB
	rNGMT3qpu1drleLUuH/2y5pEALyigS25CFZI0JVjqVwPQhNMSjXsdWueYRejoF+ZriJYszYp216Hr
	hpPPgWyNMNq3oqz6lka6ZqrRu0zYMEWmBtUBMguqTWYG6q0XqB4zT9RqXittdtvslQgfttjgVo2H3
	TC3mr/4otaePPidDWQRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU0Pk-007vGI-Gd; Tue, 15 Mar 2022 06:12:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU0P8-007uue-N0; Tue, 15 Mar 2022 06:11:36 +0000
X-UUID: 22b8d035937f44769ff234391e77dc60-20220314
X-UUID: 22b8d035937f44769ff234391e77dc60-20220314
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 835249203; Mon, 14 Mar 2022 23:11:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Mar 2022 23:11:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 15 Mar 2022 14:11:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Mar 2022 14:11:25 +0800
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
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v13 1/6] soc: mediatek: mutex: add common interface to
 accommodate multiple modules operationg MUTEX
Date: Tue, 15 Mar 2022 14:10:26 +0800
Message-ID: <20220315061031.21642-2-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220315061031.21642-1-moudy.ho@mediatek.com>
References: <20220315061031.21642-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_231134_794544_9ABE235A 
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

In order to allow multiple modules to operate MUTEX hardware through
a common interfrace, a flexible index "mtk_mutex_table_index" needs to
be added to replace original component ID so that like DDP and MDP
can add their own MUTEX table settings independently.

In addition, 4 generic interface "mtk_mutex_set_mod", "mtk_mutex_set_sof",
"mtk_mutex_clear_mod" and "mtk_mutex_clear_sof" have been added, which is
expected to replace the "mtk_mutex_add_comp" and "mtk_mutex_remove_comp"
pair originally dedicated to DDP in the future.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c       | 122 +++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mutex.h |  33 +++++++
 2 files changed, 155 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index aaf8fc1abb43..778b01ce9e8f 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -156,6 +156,7 @@ struct mtk_mutex_data {
 	const unsigned int *mutex_sof;
 	const unsigned int mutex_mod_reg;
 	const unsigned int mutex_sof_reg;
+	const unsigned long long *mutex_table_mod;
 	const bool no_clk;
 };
 
@@ -445,6 +446,84 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_add_comp);
 
+void mtk_mutex_set_mod(struct mtk_mutex *mutex,
+		       enum mtk_mutex_table_index idx)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int reg;
+	unsigned int offset;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (idx == MUTEX_TABLE_IDX_NONE ||
+	    idx >= MUTEX_TABLE_IDX_MAX)
+		return;
+
+	if (mtx->data->mutex_table_mod[idx] <= BIT(31)) {
+		offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
+					    mutex->id);
+		reg = readl_relaxed(mtx->regs + offset);
+		reg |= mtx->data->mutex_table_mod[idx];
+		writel_relaxed(reg, mtx->regs + offset);
+	} else {
+		offset = DISP_REG_MUTEX_MOD2(mutex->id);
+		reg = readl_relaxed(mtx->regs + offset);
+		reg |= (mtx->data->mutex_table_mod[idx] >> 32);
+		writel_relaxed(reg, mtx->regs + offset);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_set_mod);
+
+void mtk_mutex_set_sof(struct mtk_mutex *mutex,
+		       enum mtk_mutex_table_index idx)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int sof_id;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (idx == MUTEX_TABLE_IDX_NONE ||
+	    idx >= MUTEX_TABLE_IDX_MAX)
+		return;
+
+	switch (idx) {
+	case MUTEX_TABLE_IDX_DDP_DSI0:
+		sof_id = MUTEX_SOF_DSI0;
+		break;
+	case MUTEX_TABLE_IDX_DDP_DSI1:
+		sof_id = MUTEX_SOF_DSI0;
+		break;
+	case MUTEX_TABLE_IDX_DDP_DSI2:
+		sof_id = MUTEX_SOF_DSI2;
+		break;
+	case MUTEX_TABLE_IDX_DDP_DSI3:
+		sof_id = MUTEX_SOF_DSI3;
+		break;
+	case MUTEX_TABLE_IDX_DDP_DPI0:
+		sof_id = MUTEX_SOF_DPI0;
+		break;
+	case MUTEX_TABLE_IDX_DDP_DPI1:
+		sof_id = MUTEX_SOF_DPI1;
+		break;
+	case MUTEX_TABLE_IDX_DDP_DP_INTF0:
+		sof_id = MUTEX_SOF_DP_INTF0;
+		break;
+	case MUTEX_TABLE_IDX_DDP_DP_INTF1:
+		sof_id = MUTEX_SOF_DP_INTF1;
+		break;
+	default:
+		sof_id = MUTEX_SOF_SINGLE_MODE;
+		break;
+	}
+
+	writel_relaxed(mtx->data->mutex_sof[sof_id],
+		       mtx->regs +
+		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg, mutex->id));
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_set_sof);
+
 void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 			   enum mtk_ddp_comp_id id)
 {
@@ -485,6 +564,49 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 }
 EXPORT_SYMBOL_GPL(mtk_mutex_remove_comp);
 
+void mtk_mutex_clear_mod(struct mtk_mutex *mutex,
+			 enum mtk_mutex_table_index idx)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+	unsigned int reg;
+	unsigned int offset;
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	if (idx == MUTEX_TABLE_IDX_NONE ||
+	    idx >= MUTEX_TABLE_IDX_MAX)
+		return;
+
+	if (mtx->data->mutex_table_mod[idx] <= BIT(31)) {
+		offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
+					    mutex->id);
+		reg = readl_relaxed(mtx->regs + offset);
+		reg &= ~(mtx->data->mutex_table_mod[idx]);
+		writel_relaxed(reg, mtx->regs + offset);
+	} else {
+		offset = DISP_REG_MUTEX_MOD2(mutex->id);
+		reg = readl_relaxed(mtx->regs + offset);
+		reg &= ~(mtx->data->mutex_table_mod[idx] >> 32);
+		writel_relaxed(reg, mtx->regs + offset);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_clear_mod);
+
+void mtk_mutex_clear_sof(struct mtk_mutex *mutex)
+{
+	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
+						 mutex[mutex->id]);
+
+	WARN_ON(&mtx->mutex[mutex->id] != mutex);
+
+	writel_relaxed(MUTEX_SOF_SINGLE_MODE,
+		       mtx->regs +
+		       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
+					  mutex->id));
+}
+EXPORT_SYMBOL_GPL(mtk_mutex_clear_sof);
+
 void mtk_mutex_enable(struct mtk_mutex *mutex)
 {
 	struct mtk_mutex_ctx *mtx = container_of(mutex, struct mtk_mutex_ctx,
diff --git a/include/linux/soc/mediatek/mtk-mutex.h b/include/linux/soc/mediatek/mtk-mutex.h
index 6fe4ffbde290..c8355bb0e6d6 100644
--- a/include/linux/soc/mediatek/mtk-mutex.h
+++ b/include/linux/soc/mediatek/mtk-mutex.h
@@ -10,14 +10,47 @@ struct regmap;
 struct device;
 struct mtk_mutex;
 
+enum mtk_mutex_table_index {
+	MUTEX_TABLE_IDX_NONE = 0,	/* Invalid engine */
+
+	/* MDP table index */
+	MUTEX_TABLE_IDX_MDP_RDMA0,
+	MUTEX_TABLE_IDX_MDP_RSZ0,
+	MUTEX_TABLE_IDX_MDP_RSZ1,
+	MUTEX_TABLE_IDX_MDP_TDSHP0,
+	MUTEX_TABLE_IDX_MDP_WROT0,
+	MUTEX_TABLE_IDX_MDP_WDMA,
+	MUTEX_TABLE_IDX_MDP_AAL0,
+	MUTEX_TABLE_IDX_MDP_CCORR0,
+
+	/* DDP table index */
+	MUTEX_TABLE_IDX_DDP_DSI0,
+	MUTEX_TABLE_IDX_DDP_DSI1,
+	MUTEX_TABLE_IDX_DDP_DSI2,
+	MUTEX_TABLE_IDX_DDP_DSI3,
+	MUTEX_TABLE_IDX_DDP_DPI0,
+	MUTEX_TABLE_IDX_DDP_DPI1,
+	MUTEX_TABLE_IDX_DDP_DP_INTF0,
+	MUTEX_TABLE_IDX_DDP_DP_INTF1,
+
+	MUTEX_TABLE_IDX_MAX		/* ALWAYS keep at the end */
+};
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev);
 int mtk_mutex_prepare(struct mtk_mutex *mutex);
 void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 			enum mtk_ddp_comp_id id);
+void mtk_mutex_set_mod(struct mtk_mutex *mutex,
+		       enum mtk_mutex_table_index idx);
+void mtk_mutex_set_sof(struct mtk_mutex *mutex,
+		       enum mtk_mutex_table_index idx);
 void mtk_mutex_enable(struct mtk_mutex *mutex);
 void mtk_mutex_disable(struct mtk_mutex *mutex);
 void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 			   enum mtk_ddp_comp_id id);
+void mtk_mutex_clear_mod(struct mtk_mutex *mutex,
+			 enum mtk_mutex_table_index idx);
+void mtk_mutex_clear_sof(struct mtk_mutex *mutex);
 void mtk_mutex_unprepare(struct mtk_mutex *mutex);
 void mtk_mutex_put(struct mtk_mutex *mutex);
 void mtk_mutex_acquire(struct mtk_mutex *mutex);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
