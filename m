Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868B9C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8eDDouoS55OjEH1GaOczO0hS5WxYzw2AeckE04g2o8=; b=vDZCs/SMSOxfIdTQmEoHDTyAgg
	9ke6cb7/J6PFb05OaBrHFMGZJYbTzTqgSmknbHTWS9KGcEh2DfNtGTFNEiwA1/8z0B97iXEEnvRMa
	z5z55r+VwV4udPULP+qQoQikuGxvXcIFM8fPPNezDzRQZG5qOTD2qDFGp3EXLbtTPzqJevbw3G2dr
	r2ez5ELrdtDCMMxFOVuVbfBt3vqboitsj782nTKyZG+fzeQNXghVEiWTe9OsI2UpW1XO3HoGDckCG
	hVYrLfDqmJzpIq1MEJxGqgjMaSEHM9+rO6r8gVBG/u1+K7CjQeVn7dHI2bwEI1EX71r77HhNfJAm0
	kDf1m5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCuo-008f9O-2t;
	Mon, 20 Mar 2023 10:38:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peCuh-008f0X-0Z;
	Mon, 20 Mar 2023 10:38:52 +0000
X-UUID: 64ce269ec70b11edb5598346aad47b14-20230320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=H8eDDouoS55OjEH1GaOczO0hS5WxYzw2AeckE04g2o8=;
	b=OTsbm6f+dqudX/bgXqZEj6aYrwWqLqTrB2E05PYQ+c+RQGyBSDee5YCHS8oWdza4XfG2WYWFjDFnDPL2OD8orYwPmS+V7kh/umU57bmOncDS4/yOepeO8cxdLMXnXkZAwRB4AfcSg7HtdbSXOvIJCd623qci644boTXY/IPKxrs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:6f1c45cc-246d-492c-bea2-c9739787870c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:e6b5c8b3-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 64ce269ec70b11edb5598346aad47b14-20230320
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1901301688; Mon, 20 Mar 2023 03:38:46 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 20 Mar 2023 18:28:43 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 20 Mar 2023 18:28:42 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 3/6 RESEND] media: mediatek: vcodec: Add a debugfs file to get different useful information
Date: Mon, 20 Mar 2023 18:28:35 +0800
Message-ID: <20230320102838.8313-4-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320102838.8313-1-yunfei.dong@mediatek.com>
References: <20230320102838.8313-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_033851_221829_274E6471 
X-CRM114-Status: GOOD (  15.41  )
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

In oder to get each instance information according to test command, adding
one file node "vdec".

Can use echo command to set different string value as 'echo -picinfo > vdec'
to get real and aligned resolution.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/mtk_vcodec_dbgfs.c        | 85 +++++++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_dbgfs.h        | 20 +++++
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |  2 +
 3 files changed, 107 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
index bef78c028a75..9e7d57d21cea 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
@@ -10,6 +10,86 @@
 #include "mtk_vcodec_drv.h"
 #include "mtk_vcodec_util.h"
 
+static ssize_t mtk_vdec_dbgfs_write(struct file *filp, const char __user *ubuf,
+				    size_t count, loff_t *ppos)
+{
+	struct mtk_vcodec_dev *vcodec_dev = filp->private_data;
+	char buf[32] = { 0 };
+	int len, str_count = 0;
+	struct mtk_vcodec_dbgfs_inst *dbgfs_inst;
+	struct mtk_vcodec_ctx *ctx;
+
+	len = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, ubuf, count);
+	if (len <= 0)
+		return len;
+
+	list_for_each_entry(dbgfs_inst, &vcodec_dev->dbgfs.dbgfs_head, node) {
+		pr_info("dbgfs_inst id: %d\n", dbgfs_inst->inst_id);
+		ctx = dbgfs_inst->vcodec_ctx;
+
+		if (strstr(buf, "-picinfo")) {
+			str_count++;
+			pr_info("resolution: real(%dx%d)=>align(%dx%d)\n",
+				ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+				ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+		}
+	}
+
+	if (!str_count) {
+		pr_info("\t can not found useful cmd: %s\n", buf);
+		pr_info("\t -picinfo	     ex. echo -picinfo\n");
+	}
+
+	return count;
+}
+
+static const struct file_operations vdec_fops = {
+	.open = simple_open,
+	.write = mtk_vdec_dbgfs_write,
+};
+
+void mtk_vcodec_dbgfs_create(struct mtk_vcodec_ctx *ctx)
+{
+	struct mtk_vcodec_dbgfs_inst *dbgfs_inst;
+	struct mtk_vcodec_dev *vcodec_dev = ctx->dev;
+
+	dbgfs_inst = kzalloc(sizeof(*dbgfs_inst), GFP_KERNEL);
+	if (!dbgfs_inst)
+		return;
+
+	list_add_tail(&dbgfs_inst->node, &vcodec_dev->dbgfs.dbgfs_head);
+
+	vcodec_dev->dbgfs.inst_count++;
+
+	dbgfs_inst->inst_id = ctx->id;
+	dbgfs_inst->vcodec_ctx = ctx;
+
+	pr_info("dbgfs create: id(%d) total count: %d\n", dbgfs_inst->inst_id,
+		vcodec_dev->dbgfs.inst_count);
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dbgfs_create);
+
+void mtk_vcodec_dbgfs_remove(struct mtk_vcodec_dev *vcodec_dev, int ctx_id)
+{
+	struct mtk_vcodec_dbgfs_inst *dbgfs_inst;
+
+	list_for_each_entry(dbgfs_inst, &vcodec_dev->dbgfs.dbgfs_head, node) {
+		if (dbgfs_inst && dbgfs_inst->inst_id == ctx_id) {
+			vcodec_dev->dbgfs.inst_count--;
+			pr_info("dbgfs_inst remove id: %d total count: %d\n",
+				dbgfs_inst->inst_id,
+				vcodec_dev->dbgfs.inst_count);
+			break;
+		}
+	}
+
+	if (dbgfs_inst) {
+		list_del(&dbgfs_inst->node);
+		kfree(dbgfs_inst);
+	}
+}
+EXPORT_SYMBOL_GPL(mtk_vcodec_dbgfs_remove);
+
 void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev)
 {
 	struct dentry *vcodec_root;
@@ -22,6 +102,11 @@ void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev)
 
 	debugfs_create_x32("mtk_v4l2_dbg_level", 0644, vcodec_root, &mtk_v4l2_dbg_level);
 	debugfs_create_x32("mtk_vcodec_dbg", 0644, vcodec_root, &mtk_vcodec_dbg);
+
+	INIT_LIST_HEAD(&vcodec_dev->dbgfs.dbgfs_head);
+	debugfs_create_file("vdec", 0200, vcodec_root, vcodec_dev, &vdec_fops);
+
+	vcodec_dev->dbgfs.inst_count = 0;
 }
 EXPORT_SYMBOL_GPL(mtk_vcodec_dbgfs_init);
 
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
index 74f130f868c8..2d0b617e762e 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
@@ -8,15 +8,35 @@
 #define __MTK_VCODEC_DBGFS_H__
 
 struct mtk_vcodec_dev;
+struct mtk_vcodec_ctx;
+
+struct mtk_vcodec_dbgfs_inst {
+	struct list_head node;
+	int inst_id;
+	struct mtk_vcodec_ctx *vcodec_ctx;
+};
 
 struct mtk_vcodec_dbgfs {
+	struct list_head dbgfs_head;
 	struct dentry *vcodec_root;
+	int inst_count;
 };
 
 #if defined(CONFIG_DEBUG_FS)
+void mtk_vcodec_dbgfs_create(struct mtk_vcodec_ctx *ctx);
+void mtk_vcodec_dbgfs_remove(struct mtk_vcodec_dev *vcodec_dev, int ctx_id);
+
 void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev);
 void mtk_vcodec_dbgfs_deinit(struct mtk_vcodec_dev *vcodec_dev);
 #else
+static inline void mtk_vcodec_dbgfs_create(struct mtk_vcodec_ctx *ctx)
+{
+}
+
+static inline void mtk_vcodec_dbgfs_remove(struct mtk_vcodec_dev *vcodec_dev, int ctx_id)
+{
+}
+
 static inline void mtk_vcodec_dbgfs_init(struct mtk_vcodec_dev *vcodec_dev)
 {
 }
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index de29b1fb0436..8c2443a18f5e 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -215,6 +215,7 @@ static int fops_vcodec_open(struct file *file)
 	ctx->dev->vdec_pdata->init_vdec_params(ctx);
 
 	list_add(&ctx->list, &dev->ctx_list);
+	mtk_vcodec_dbgfs_create(ctx);
 
 	mutex_unlock(&dev->dev_mutex);
 	mtk_v4l2_debug(0, "%s decoder [%d]", dev_name(&dev->plat_dev->dev),
@@ -256,6 +257,7 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
+	mtk_vcodec_dbgfs_remove(dev, ctx->id);
 	list_del_init(&ctx->list);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
-- 
2.25.1


