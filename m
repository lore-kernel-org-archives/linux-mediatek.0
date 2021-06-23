Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85467C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:23:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ABF560FD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 07:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ABF560FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xh2omN2hdMJpVRjBFqSJ4oQA9fHRu3uanp5OzTdP1W0=; b=caC/kv5Rea0hFk
	xgeCum1zcsmfE/rej/loXiKrYIX3GcoUKto2u6eJHeMjEkVNofIL/uw2OLRGHWD0ZrDTYQBbGpv8q
	EoPwFBR6WsnBEH35fhTZud/evdnbhiblfWKtcLPgSx0FzwrOzL2cJILvHi97oN+ZsqPmj7tC3kxhP
	JT3cM9xgNzXxmM+X8hyE5R2d8yl4oEqHZDCMmhD/Xw9toS9rdoruxsZVE3QjPKJhifYU2D0yMo6bZ
	yCLhfpuHQK5oBGrpf5NRmbzYzkm0YXJrnhRnZqMwQeXYLPV4gjRUDWhNYJuTBpjylDmKs+OzquGfZ
	nDiFYiNKzKB8hOVpTseQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvxEJ-009iHn-CT; Wed, 23 Jun 2021 07:23:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvxEE-009iGs-5v; Wed, 23 Jun 2021 07:23:21 +0000
X-UUID: e4c0fb7bef1446cc83b7ce117869f92a-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KqJHzJtdOaySmEdggwDuobNf6e6TW/vqXVD/DW/dLmk=; 
 b=cMdZBOYgHhwCQ0gmRAEe4M9R5I1KgBo2rtjDWJU4pqxKp7tUYlW6Scg01AjTgMaqq5En06XwcHPvJMwEl3GJCRjbvqLhoYbzHPT+uQ85XcDXXkDpZc9MrBg+28DXasu70xJEvTe9a/BxTYNJ3cvOVt5H+qzl1aYpyMm4g4sKL9Q=;
X-UUID: e4c0fb7bef1446cc83b7ce117869f92a-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kyrie.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 334631300; Wed, 23 Jun 2021 00:23:15 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 00:13:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 15:13:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Jun 2021 15:13:10 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Bin Liu
 <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>, kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH 2/3] media: mtk-jpegdec: use component framework to manage jpg
 DEC HW
Date: Wed, 23 Jun 2021 15:13:02 +0800
Message-ID: <1624432383-2428-3-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1624432383-2428-1-git-send-email-kyrie.wu@mediatek.com>
References: <1624432383-2428-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_002318_294802_D84FB050 
X-CRM114-Status: GOOD (  19.78  )
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

Mtk jpeg decoder has several hardware, one HW may register a device
node; use component framework to manage jpg decoder HW device node,
in this case, one device node could represent all jpg HW.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c   | 329 ++++++++++++++--------
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h   |  32 +++
 drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c | 213 +++++++++++++-
 3 files changed, 462 insertions(+), 112 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index b8d1303..faa01b5 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1218,6 +1218,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 	struct mtk_jpegenc_pm *pm;
 	struct mtk_jpegenc_clk *jpegclk;
 	struct mtk_jpegenc_clk_info *clk_info;
+	struct mtk_jpegdec_pm *dec_pm;
+	struct mtk_jpegdec_clk *dec_jpegclk;
+	struct mtk_jpegdec_clk_info *dec_clk_info;
 	int ret, i;
 
 	if (jpeg->variant->is_encoder) {
@@ -1240,14 +1243,27 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 		}
 		return;
 	}
-	ret = mtk_smi_larb_get(jpeg->larb);
-	if (ret)
-		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
 
-	ret = clk_bulk_prepare_enable(jpeg->variant->num_clks,
-				      jpeg->variant->clks);
-	if (ret)
-		dev_err(jpeg->dev, "Failed to open jpeg clk: %d\n", ret);
+	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+		comp_dev = jpeg->hw_dev[i];
+		if (!comp_dev) {
+			pr_err("Failed to get hw dev\n");
+			return;
+		}
+
+		dec_pm = &comp_dev->dec_pm;
+		dec_jpegclk = &dec_pm->dec_clk;
+		dec_clk_info = dec_jpegclk->clk_info;
+
+		ret = clk_prepare_enable(dec_clk_info->jpegdec_clk);
+		if (ret) {
+			pr_err("jpegdec clk_prepare_enable %d %s fail\n",
+			       i, dec_jpegclk->clk_info->clk_name);
+			return;
+		}
+	}
+
+	return;
 }
 
 static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
@@ -1255,6 +1271,8 @@ static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 	struct mtk_jpeg_dev *comp_dev;
 	struct mtk_jpegenc_pm *pm;
 	struct mtk_jpegenc_clk *jpegclk;
+	struct mtk_jpegdec_pm *dec_pm;
+	struct mtk_jpegdec_clk *dec_jpegclk;
 	int i;
 
 	if (jpeg->variant->is_encoder) {
@@ -1271,56 +1289,20 @@ static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 		}
 		return;
 	}
-	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
-				   jpeg->variant->clks);
-	mtk_smi_larb_put(jpeg->larb);
-}
-
-static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
-{
-	struct mtk_jpeg_dev *jpeg = priv;
-	struct mtk_jpeg_ctx *ctx;
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-	struct mtk_jpeg_src_buf *jpeg_src_buf;
-	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
-	u32	dec_irq_ret;
-	u32 dec_ret;
-	int i;
-
-	cancel_delayed_work(&jpeg->job_timeout_work);
-
-	dec_ret = mtk_jpeg_dec_get_int_status(jpeg->reg_base);
-	dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
-	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
-	if (!ctx) {
-		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
-		return IRQ_HANDLED;
-	}
-
-	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
 
-	if (dec_irq_ret >= MTK_JPEG_DEC_RESULT_UNDERFLOW)
-		mtk_jpeg_dec_reset(jpeg->reg_base);
+	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+		comp_dev = jpeg->hw_dev[i];
+		if (!comp_dev) {
+			pr_err("Failed to get hw dev\n");
+			return;
+		}
 
-	if (dec_irq_ret != MTK_JPEG_DEC_RESULT_EOF_DONE) {
-		dev_err(jpeg->dev, "decode failed\n");
-		goto dec_end;
+		dec_pm = &comp_dev->dec_pm;
+		dec_jpegclk = &dec_pm->dec_clk;
+		clk_disable_unprepare(dec_jpegclk->clk_info->jpegdec_clk);
 	}
 
-	for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
-		vb2_set_plane_payload(&dst_buf->vb2_buf, i,
-				      jpeg_src_buf->dec_param.comp_size[i]);
-
-	buf_state = VB2_BUF_STATE_DONE;
-
-dec_end:
-	v4l2_m2m_buf_done(src_buf, buf_state);
-	v4l2_m2m_buf_done(dst_buf, buf_state);
-	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-	pm_runtime_put(ctx->jpeg->dev);
-	return IRQ_HANDLED;
+	return;
 }
 
 static void mtk_jpeg_set_default_params(struct mtk_jpeg_ctx *ctx)
@@ -1569,6 +1551,60 @@ irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
+{
+	struct mtk_jpeg_dev *jpeg = priv;
+	struct mtk_jpeg_ctx *ctx;
+	struct mtk_jpeg_dev *master_jpeg;
+	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_src_buf *jpeg_src_buf;
+	u32	dec_irq_ret;
+	u32 dec_ret;
+	u32 comp_size;
+	int i;
+	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
+
+	cancel_delayed_work(&jpeg->job_timeout_work);
+
+	src_buf = jpeg->hw_param.src_buffer;
+	dst_buf = jpeg->hw_param.dst_buffer;
+	ctx = jpeg->hw_param.curr_ctx;
+	master_jpeg = ctx->jpeg;
+	jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
+	dec_ret = mtk_jpeg_dec_get_int_status(jpeg->reg_base[0]);
+	dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
+	if (dec_irq_ret >= MTK_JPEG_DEC_RESULT_UNDERFLOW)
+		mtk_jpeg_dec_reset(jpeg->reg_base[0]);
+
+	if (dec_irq_ret != MTK_JPEG_DEC_RESULT_EOF_DONE) {
+		pr_err("%s : %d, jpeg decode failed\n", __func__, __LINE__);
+		goto irq_end;
+	}
+
+	for (i = 0; i < dst_buf->vb2_buf.num_planes; i++) {
+		comp_size = jpeg_src_buf->dec_param.comp_size[i];
+		vb2_set_plane_payload(&dst_buf->vb2_buf, i, comp_size);
+	}
+
+	buf_state = VB2_BUF_STATE_DONE;
+
+irq_end:
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	mtk_jpeg_put_buf(jpeg);
+	pm_runtime_put(jpeg->dec_pm.dev);
+	clk_disable_unprepare(jpeg->dec_pm.dec_clk.clk_info->jpegdec_clk);
+	if (ctx->fh.m2m_ctx &&
+	    (!list_empty(&ctx->fh.m2m_ctx->out_q_ctx.rdy_queue) ||
+	    !list_empty(&ctx->fh.m2m_ctx->cap_q_ctx.rdy_queue))) {
+		queue_work(master_jpeg->workqueue, &ctx->jpeg_work);
+	}
+
+	jpeg->hw_state = MTK_JPEG_HW_IDLE;
+	wake_up(&master_jpeg->hw_wq);
+	atomic_inc(&jpeg->hw_rdy);
+	return IRQ_HANDLED;
+}
+
 void mtk_jpegenc_timeout_work(struct work_struct *work)
 {
 	struct mtk_jpeg_dev *jpeg = container_of(work, struct mtk_jpeg_dev,
@@ -1606,24 +1642,36 @@ void mtk_jpegenc_timeout_work(struct work_struct *work)
 	mtk_jpeg_put_buf(jpeg);
 }
 
-static void mtk_jpeg_job_timeout_work(struct work_struct *work)
+void mtk_jpegdec_timeout_work(struct work_struct *work)
 {
 	struct mtk_jpeg_dev *jpeg = container_of(work, struct mtk_jpeg_dev,
-						 job_timeout_work.work);
-	struct mtk_jpeg_ctx *ctx;
-	struct vb2_v4l2_buffer *src_buf, *dst_buf;
-
-	ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
-	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		job_timeout_work.work);
+	struct mtk_jpeg_ctx *ctx = NULL;
+	struct mtk_jpeg_dev *master_jpeg;
+	struct vb2_v4l2_buffer *src_buf;
+	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
 
-	jpeg->variant->hw_reset(jpeg->reg_base);
+	src_buf = jpeg->hw_param.src_buffer;
+	ctx = jpeg->hw_param.curr_ctx;
+	if (!ctx) {
+		v4l2_err(&jpeg->v4l2_dev, "Context is NULL\n");
+		return;
+	}
 
-	pm_runtime_put(jpeg->dev);
+	master_jpeg = ctx->jpeg;
+	if (!master_jpeg) {
+		v4l2_err(&jpeg->v4l2_dev, "master_jpeg is NULL\n");
+		return;
+	}
 
-	v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
-	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
-	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+	mtk_jpeg_dec_reset(jpeg->reg_base[MTK_JPEGDEC_HW0]);
+	pm_runtime_put(jpeg->dec_pm.dev);
+	clk_disable_unprepare(jpeg->dec_pm.dec_clk.clk_info->jpegdec_clk);
+	jpeg->hw_state = MTK_JPEG_HW_IDLE;
+	atomic_inc(&jpeg->hw_rdy);
+	wake_up(&master_jpeg->hw_wq);
+	v4l2_m2m_buf_done(src_buf, buf_state);
+	mtk_jpeg_put_buf(jpeg);
 }
 
 static inline void mtk_jpeg_clk_release(struct mtk_jpeg_dev *jpeg)
@@ -1643,6 +1691,22 @@ static  const struct of_device_id mtk_jpegenc_drv_ids[] = {
 	{},
 };
 
+static  const struct of_device_id mtk_jpegdec_drv_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-jpgdec0",
+		.data = (void *)MTK_JPEGDEC_HW0,
+	},
+	{
+		.compatible = "mediatek,mt8195-jpgdec1",
+		.data = (void *)MTK_JPEGDEC_HW1,
+	},
+	{
+		.compatible = "mediatek,mt8195-jpgdec2",
+		.data = (void *)MTK_JPEGDEC_HW2,
+	},
+	{},
+};
+
 static inline int mtk_vdec_compare_of(struct device *dev, void *data)
 {
 	return dev->of_node == data;
@@ -1672,6 +1736,25 @@ static const struct component_master_ops mtk_jpegenc_ops = {
 	.unbind = mtk_jpegenc_unbind,
 };
 
+static inline int mtk_jpegdec_bind(struct device *dev)
+{
+	struct mtk_jpeg_dev *data = dev_get_drvdata(dev);
+
+	return component_bind_all(dev, data);
+}
+
+static inline void mtk_jpegdec_unbind(struct device *dev)
+{
+	struct mtk_jpeg_dev *data = dev_get_drvdata(dev);
+
+	component_unbind_all(dev, data);
+}
+
+static const struct component_master_ops mtk_jpegdec_ops = {
+	.bind = mtk_jpegdec_bind,
+	.unbind = mtk_jpegdec_unbind,
+};
+
 struct component_match *mtk_jpegenc_match_add(struct mtk_jpeg_dev *jpeg)
 {
 	struct device *dev = jpeg->dev;
@@ -1717,11 +1800,54 @@ struct component_match *mtk_jpegenc_match_add(struct mtk_jpeg_dev *jpeg)
 	return match;
 }
 
+struct component_match *mtk_jpegdec_match_add(struct mtk_jpeg_dev *jpeg)
+{
+	struct device *dev = jpeg->dev;
+	struct component_match *match = NULL;
+	int i;
+	char compatible[128] = {0};
+
+	for (i = 0; i < ARRAY_SIZE(mtk_jpegdec_drv_ids); i++) {
+		struct device_node *comp_node;
+		enum mtk_jpegdec_hw_id comp_idx;
+		const struct of_device_id *of_id;
+
+		memcpy(compatible, mtk_jpegdec_drv_ids[i].compatible,
+		       sizeof(mtk_jpegdec_drv_ids[i].compatible));
+
+		comp_node = of_find_compatible_node(NULL, NULL,
+						    compatible);
+		if (!comp_node)
+			continue;
+
+		if (!of_device_is_available(comp_node)) {
+			of_node_put(comp_node);
+			v4l2_err(&jpeg->v4l2_dev, "Fail to get jpeg dec HW node\n");
+			continue;
+		}
+
+		of_id = of_match_node(mtk_jpegdec_drv_ids, comp_node);
+		if (!of_id) {
+			v4l2_err(&jpeg->v4l2_dev, "Failed to get match node\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		comp_idx = (enum mtk_jpegdec_hw_id)of_id->data;
+		v4l2_info(&jpeg->v4l2_dev, "Get component:hw_id(%d),jpeg_dev(0x%p),comp_node(0x%p)\n",
+			  comp_idx, jpeg, comp_node);
+
+		jpeg->component_node[comp_idx] = comp_node;
+
+		component_match_add_release(dev, &match, mtk_vdec_release_of,
+					    mtk_vdec_compare_of, comp_node);
+	}
+
+	return match;
+}
+
 static int mtk_jpeg_probe(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg;
-	struct resource *res;
-	int jpeg_irq;
 	int ret;
 	struct component_match *match;
 
@@ -1733,50 +1859,17 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 	spin_lock_init(&jpeg->hw_lock);
 	jpeg->dev = &pdev->dev;
 	jpeg->variant = of_device_get_match_data(jpeg->dev);
-	INIT_DELAYED_WORK(&jpeg->job_timeout_work, mtk_jpeg_job_timeout_work);
-
-	if (!jpeg->variant->is_encoder) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		jpeg->reg_base[MTK_JPEGENC_HW0] =
-			devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(jpeg->reg_base[MTK_JPEGENC_HW0])) {
-			ret = PTR_ERR(jpeg->reg_base[MTK_JPEGENC_HW0]);
-			return ret;
-		}
 
-		jpeg_irq = platform_get_irq(pdev, 0);
-		if (jpeg_irq < 0) {
-			dev_err(&pdev->dev, "Failed to get jpeg_irq %d.\n",
-				jpeg_irq);
-			return jpeg_irq;
-		}
-
-		ret = devm_request_irq(&pdev->dev, jpeg_irq,
-				       jpeg->variant->irq_handler,
-				       0, pdev->name, jpeg);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
-				jpeg_irq, ret);
-			goto err_req_irq;
-		}
-
-		ret = mtk_jpeg_clk_init(jpeg);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to init clk\n");
-			goto err_clk_init;
-		}
-	} else {
-		init_waitqueue_head(&jpeg->hw_wq);
+	init_waitqueue_head(&jpeg->hw_wq);
 
-		jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
-							  WQ_MEM_RECLAIM |
-							  WQ_FREEZABLE);
+	jpeg->workqueue = alloc_ordered_workqueue(MTK_JPEG_NAME,
+						  WQ_MEM_RECLAIM |
+						  WQ_FREEZABLE);
 		if (!jpeg->workqueue) {
 			dev_err(&pdev->dev, "Failed to create jpeg workqueue!\n");
 			ret = -EINVAL;
 			goto err_alloc_workqueue;
 		}
-	}
 
 	ret = v4l2_device_register(&pdev->dev, &jpeg->v4l2_dev);
 	if (ret) {
@@ -1834,8 +1927,21 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 						      &mtk_jpegenc_ops, match);
 		if (ret < 0)
 			goto err_vfd_jpeg_register;
+	} else if (!jpeg->variant->is_encoder) {
+		match = mtk_jpegdec_match_add(jpeg);
+		if (IS_ERR_OR_NULL(match))
+			goto err_vfd_jpeg_register;
+
+		video_set_drvdata(jpeg->vdev, jpeg);
+		platform_set_drvdata(pdev, jpeg);
+		ret = component_master_add_with_match(&pdev->dev,
+						      &mtk_jpegdec_ops, match);
+		if (ret < 0)
+			goto err_vfd_jpeg_register;
 	} else {
-		pm_runtime_enable(&pdev->dev);
+		pr_err("%s : %d, platform_device is not decoder && encoder.\n",
+		       __func__, __LINE__);
+		goto err_vfd_jpeg_register;
 	}
 
 	return 0;
@@ -1852,12 +1958,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
 err_dev_register:
 	mtk_jpeg_clk_release(jpeg);
 
-err_clk_init:
-
 err_alloc_workqueue:
 
-err_req_irq:
-
 	return ret;
 }
 
@@ -1922,12 +2024,12 @@ static const struct dev_pm_ops mtk_jpeg_pm_ops = {
 };
 
 static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
+	.is_encoder	= false,
 	.clks = mt8173_jpeg_dec_clocks,
 	.num_clks = ARRAY_SIZE(mt8173_jpeg_dec_clocks),
 	.formats = mtk_jpeg_dec_formats,
 	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
 	.qops = &mtk_jpeg_dec_qops,
-	.irq_handler = mtk_jpeg_dec_irq,
 	.hw_reset = mtk_jpeg_dec_reset,
 	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
 	.dev_name = "mtk-jpeg-dec",
@@ -1956,6 +2058,10 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.data = &mtk_jpegenc_drvdata,
 	},
 	{
+		.compatible = "mediatek,mt8195-jpgdec",
+		.data = &mt8173_jpeg_drvdata,
+	},
+	{
 		.compatible = "mediatek,mt8173-jpgdec",
 		.data = &mt8173_jpeg_drvdata,
 	},
@@ -1980,6 +2086,7 @@ static struct platform_driver mtk_jpeg_driver = {
 
 static struct platform_driver * const mtk_jpeg_source_drivers[] = {
 	&mtk_jpegenc_hw_driver,
+	&mtk_jpegdec_hw_driver,
 	&mtk_jpeg_driver,
 };
 
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index d4259f9..156d7cb 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -92,6 +92,13 @@ enum mtk_jpegenc_hw_id {
 	MTK_JPEGENC_HW_MAX,
 };
 
+enum mtk_jpegdec_hw_id {
+	MTK_JPEGDEC_HW0,
+	MTK_JPEGDEC_HW1,
+	MTK_JPEGDEC_HW2,
+	MTK_JPEGDEC_HW_MAX,
+};
+
 /** * enum mtk_hw_idx - MTK hw index */
 enum mtk_jpeghw_idx {
 	JPEGENC_HW0,
@@ -121,6 +128,25 @@ struct mtk_jpegenc_pm {
 	struct mtk_jpeg_dev	*mtkdev;
 };
 
+/** * struct mtk_jpegdec_clk_info - Structure used to store clock name */
+struct mtk_jpegdec_clk_info {
+	const char	*clk_name;
+	struct clk	*jpegdec_clk;
+};
+
+/* struct mtk_vcodec_clk - Structure used to store vcodec clock information */
+struct mtk_jpegdec_clk {
+	struct mtk_jpegdec_clk_info	*clk_info;
+	int	clk_num;
+};
+
+/** * struct mtk_vcodec_pm - Power management data structure */
+struct mtk_jpegdec_pm {
+	struct mtk_jpegdec_clk	dec_clk;
+	struct device	*dev;
+	struct mtk_jpeg_dev	*mtkdev;
+};
+
 /**
  * struct mtk_jpeg_dev - JPEG IP abstraction
  * @lock:		the mutex protecting this structure
@@ -166,9 +192,13 @@ struct mtk_jpeg_dev {
 	struct mtk_jpeg_hw_param hw_param;
 	wait_queue_head_t hw_wq;
 	atomic_t hw_rdy;
+
+	int jpegdec_irq;
+	struct mtk_jpegdec_pm dec_pm;
 };
 
 extern struct platform_driver mtk_jpegenc_hw_driver;
+extern struct platform_driver mtk_jpegdec_hw_driver;
 
 /**
  * struct mtk_jpeg_fmt - driver's internal color format data
@@ -236,6 +266,8 @@ struct mtk_jpeg_ctx {
 };
 
 void mtk_jpegenc_timeout_work(struct work_struct *work);
+void mtk_jpegdec_timeout_work(struct work_struct *work);
 irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv);
+irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv);
 
 #endif /* _MTK_JPEG_CORE_H */
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
index afbbfd5..c1a5d08 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c
@@ -8,7 +8,18 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <media/videobuf2-core.h>
-
+#include <media/videobuf2-dma-contig.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+#include <linux/component.h>
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+
+#include "mtk_jpeg_core.h"
 #include "mtk_jpeg_dec_hw.h"
 
 #define MTK_JPEG_DUNUM_MASK(val)	(((val) - 1) & 0x3)
@@ -23,6 +34,100 @@ enum mtk_jpeg_color {
 	MTK_JPEG_COLOR_400		= 0x00110000
 };
 
+typedef irqreturn_t (*jpegdec_irq_handler)(int irq, void *priv);
+
+static int mtk_jpegdec_hw_bind(struct device *dev,
+			       struct device *master, void *data)
+{
+	struct mtk_jpeg_dev *comp_priv = dev_get_drvdata(dev);
+	struct mtk_jpeg_dev *master_priv = data;
+	int i;
+
+	for (i = 0; i < MTK_JPEGDEC_HW_MAX; i++) {
+		if (dev->of_node != master_priv->component_node[i])
+			continue;
+		master_priv->hw_dev[i] = comp_priv;
+		comp_priv->comp_idx = i;
+		master_priv->reg_base[i] =
+			comp_priv->reg_base[MTK_JPEGDEC_HW0];
+		break;
+	}
+	if (i == MTK_JPEGDEC_HW_MAX) {
+		dev_err(dev, "Failed to get component node\n");
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static void mtk_jpegdec_hw_unbind(struct device *dev,
+				  struct device *master, void *data)
+{
+	struct mtk_jpeg_dev *comp_priv = dev_get_drvdata(dev);
+
+	comp_priv->reg_base[MTK_JPEGDEC_HW0] = 0;
+}
+
+static const struct component_ops mtk_jpegdec_hw_component_ops = {
+	.bind = mtk_jpegdec_hw_bind,
+	.unbind = mtk_jpegdec_hw_unbind,
+};
+
+int mtk_jpegdec_init_pm(struct mtk_jpeg_dev *mtkdev)
+{
+	struct platform_device *pdev;
+	struct mtk_jpegdec_pm *pm;
+	struct mtk_jpegdec_clk *jpegdec_clk;
+	struct mtk_jpegdec_clk_info *clk_info;
+	int i = 0, ret = 0;
+
+	pdev = mtkdev->plat_dev;
+	pm = &mtkdev->dec_pm;
+	pm->mtkdev = mtkdev;
+
+	jpegdec_clk = &pm->dec_clk;
+	pm->dev = &pdev->dev;
+	jpegdec_clk->clk_num =
+		of_property_count_strings(pdev->dev.of_node, "clock-names");
+	if (jpegdec_clk->clk_num > 0) {
+		jpegdec_clk->clk_info = devm_kcalloc(&pdev->dev,
+						     jpegdec_clk->clk_num,
+						     sizeof(*clk_info),
+						     GFP_KERNEL);
+		if (!jpegdec_clk->clk_info)
+			return -ENOMEM;
+	} else {
+		pr_err("Failed to get jpegdec clock count\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < jpegdec_clk->clk_num; i++) {
+		clk_info = &jpegdec_clk->clk_info[i];
+		ret = of_property_read_string_index(pdev->dev.of_node,
+						    "clock-names", i,
+						    &clk_info->clk_name);
+		if (ret) {
+			pr_err("Failed to get jpegdec clock name id = %d", i);
+			return ret;
+		}
+
+		clk_info->jpegdec_clk = devm_clk_get(&pdev->dev,
+						     clk_info->clk_name);
+		if (IS_ERR(clk_info->jpegdec_clk)) {
+			pr_err("devm_clk_get (%d)%s fail",
+			       i, clk_info->clk_name);
+			return PTR_ERR(clk_info->jpegdec_clk);
+		}
+	}
+
+	pm_runtime_enable(pm->dev);
+	return ret;
+}
+
+void mtk_jpegdec_release_pm(struct mtk_jpeg_dev *dev)
+{
+	pm_runtime_disable(dev->dec_pm.dev);
+}
+
 static inline int mtk_jpeg_verify_align(u32 val, int align, u32 reg)
 {
 	if (val & (align - 1)) {
@@ -407,3 +512,109 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
 				   config->dma_last_mcu);
 	mtk_jpeg_dec_set_pause_mcu_idx(base, config->total_mcu);
 }
+
+static int mtk_jpegdec_hw_init_irq(struct mtk_jpeg_dev *dev,
+				   jpegdec_irq_handler irq_handler)
+{
+	struct platform_device *pdev = dev->plat_dev;
+	int ret;
+
+	dev->jpegdec_irq = platform_get_irq(pdev, 0);
+	if (dev->jpegdec_irq < 0) {
+		dev_err(&pdev->dev, "Failed to get irq resource");
+		return dev->jpegdec_irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev, dev->jpegdec_irq,
+			       irq_handler, 0, pdev->name, dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to install dev->jpegdec_irq %d (%d)",
+			dev->jpegdec_irq, ret);
+
+		return -ENOENT;
+	}
+
+	return 0;
+}
+
+static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
+{
+	struct mtk_jpeg_dev *dev;
+	jpegdec_irq_handler irq_handler;
+	int ret;
+
+	dev = devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+	dev->plat_dev = pdev;
+	spin_lock_init(&dev->irqlock);
+	mutex_init(&dev->dev_mutex);
+	atomic_set(&dev->hw_rdy, 1U);
+	spin_lock_init(&dev->hw_lock);
+
+	dev->hw_state = MTK_JPEG_HW_IDLE;
+	INIT_DELAYED_WORK(&dev->job_timeout_work, mtk_jpegdec_timeout_work);
+
+	ret = mtk_jpegdec_init_pm(dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get jpeg dec clock source");
+		return ret;
+	}
+
+	dev->reg_base[MTK_JPEGDEC_HW0] =
+		devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR((__force void *)dev->reg_base[MTK_JPEGDEC_HW0])) {
+		ret = PTR_ERR((__force void *)dev->reg_base[MTK_JPEGDEC_HW0]);
+		goto err;
+	}
+
+	irq_handler = of_device_get_match_data(&pdev->dev);
+	if (!irq_handler) {
+		dev_err(&pdev->dev, "Failed to get match data.\n");
+		goto err;
+	}
+
+	ret = mtk_jpegdec_hw_init_irq(dev, irq_handler);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register JPEGDEC irq handler.\n");
+		goto err;
+	}
+
+	platform_set_drvdata(pdev, dev);
+
+	ret = component_add(&pdev->dev, &mtk_jpegdec_hw_component_ops);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to component_add: %d\n", ret);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	mtk_jpegdec_release_pm(dev);
+	return ret;
+}
+
+static const struct of_device_id mtk_jpegdec_hw_ids[] = {
+	{
+		.compatible = "mediatek,mt8195-jpgdec0",
+		.data = mtk_jpegdec_hw_irq_handler,
+	},
+	{	.compatible = "mediatek,mt8195-jpgdec1",
+		.data = mtk_jpegdec_hw_irq_handler,
+	},
+	{	.compatible = "mediatek,mt8195-jpgdec2",
+		.data = mtk_jpegdec_hw_irq_handler,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_jpegdec_hw_ids);
+
+struct platform_driver mtk_jpegdec_hw_driver = {
+	.probe	= mtk_jpegdec_hw_probe,
+	.driver	= {
+		.name	= "mtk-jpegdec-hw",
+		.of_match_table = mtk_jpegdec_hw_ids,
+	},
+};
+
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
