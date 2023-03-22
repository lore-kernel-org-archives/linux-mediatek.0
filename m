Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4834BC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZ5uBL9yfgd1NIw9cHlnnPWSdj4uOU4U2/td14iVscM=; b=iOZ4sR0VphHAMm1/D9ARaqK7tB
	rkCzsDPxbmBrWb79gKZ9F0uZrKLE1BGCQhHFoklOPhCej7bThcLoXJeLUw0M0lw7G9sQFXY5mF05t
	34SCan7GVmzO4odZd9Fzu4mY9a8BEw52iZo17PRFvKz7jTEK9qGbRv95ORvJlpwqeBkYiNu2Mftx4
	/vWUbsdKTXMgzHg/p597VM6JXaPzbniXPFEhhahx4LPqupBd5s3KAYlc8uFQZE2+BzK7UpUba0TBY
	b6ERZ8bL+tkA9AOWyJqcLplbMnJbyOJTPThVOc1ukny6QZsDOMBkvx9ZyVMG+sRrOIyQwFeVt2ujJ
	34IO4XHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pev47-00FVbS-2A;
	Wed, 22 Mar 2023 09:47:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pev3i-00FVLO-0h;
	Wed, 22 Mar 2023 09:47:09 +0000
X-UUID: 7ca9ea46c89611edb7d8d11f642b8e78-20230322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QZ5uBL9yfgd1NIw9cHlnnPWSdj4uOU4U2/td14iVscM=;
	b=F+k3V6X2OL49MtBhgoDYG9dKfU1E+eltP6HnA3BWhmu3iv6IBWUQWdlerDic7cW7nUBYFGWleEOt19LzBItSK9ID4vgDPwmf0qnQconlU87xM57HkHFCDtG+QWexQZm643Opak4++YqMllnmK2pN6FUfAYP6udmE0rVVMBRDtSY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:008e693c-4088-4491-93e4-1c72f1ec3efb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:738305b4-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 7ca9ea46c89611edb7d8d11f642b8e78-20230322
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 954870270; Wed, 22 Mar 2023 02:46:58 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 22 Mar 2023 17:46:24 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 22 Mar 2023 17:46:23 +0800
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
Subject: [PATCH v2,4/7] media: mediatek: vcodec: Get each context resolution information
Date: Wed, 22 Mar 2023 17:46:14 +0800
Message-ID: <20230322094617.19410-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322094617.19410-1-yunfei.dong@mediatek.com>
References: <20230322094617.19410-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_024706_291411_D24FECFC 
X-CRM114-Status: GOOD (  13.30  )
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

Will store the string to temp buffer like "echo '-picinfo' > vdec" when
user want to get needed information.

Then getting debug information using command 'cat vdec' calling mtk_vdec_dbgfs_read
to analysis the temp buffer.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../mediatek/vcodec/mtk_vcodec_dbgfs.c        | 44 +++++++++++++++++++
 .../mediatek/vcodec/mtk_vcodec_dbgfs.h        |  8 ++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
index 49f0891e4923..19a1dc068efd 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
@@ -27,9 +27,53 @@ static ssize_t mtk_vdec_dbgfs_write(struct file *filp, const char __user *ubuf,
 	return len;
 }
 
+static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
+				   size_t count, loff_t *ppos)
+{
+	struct mtk_vcodec_dev *vcodec_dev = filp->private_data;
+	struct mtk_vcodec_dbgfs *dbgfs = &vcodec_dev->dbgfs;
+	struct mtk_vcodec_dbgfs_inst *dbgfs_inst;
+	struct mtk_vcodec_ctx *ctx;
+	int total_len = 100 * (dbgfs->inst_count == 0 ? 1 : dbgfs->inst_count);
+	int used_len = 0, curr_len, ret;
+	bool dbgfs_index[MTK_VDEC_DBGFS_MAX] = {0};
+	char *buf = kmalloc(total_len, GFP_KERNEL);
+
+	if (!buf)
+		return -ENOMEM;
+
+	if (strstr(dbgfs->dbgfs_buf, "-picinfo"))
+		dbgfs_index[MTK_VDEC_DBGFS_PICINFO] = true;
+
+	mutex_lock(&dbgfs->dbgfs_lock);
+	list_for_each_entry(dbgfs_inst, &dbgfs->dbgfs_head, node) {
+		ctx = dbgfs_inst->vcodec_ctx;
+
+		curr_len = snprintf(buf + used_len, total_len - used_len,
+				    "inst[%d]:\n ", ctx->id);
+		used_len += curr_len;
+
+		if (dbgfs_index[MTK_VDEC_DBGFS_PICINFO]) {
+			curr_len = snprintf(buf + used_len, total_len - used_len,
+					    "\treal(%dx%d)=>align(%dx%d)\n",
+					    ctx->picinfo.pic_w, ctx->picinfo.pic_h,
+					    ctx->picinfo.buf_w, ctx->picinfo.buf_h);
+			used_len += curr_len;
+		}
+	}
+	mutex_unlock(&dbgfs->dbgfs_lock);
+
+	buf[used_len + 1] = '\0';
+	ret = simple_read_from_buffer(ubuf, count, ppos, buf, used_len);
+
+	kfree(buf);
+	return ret;
+}
+
 static const struct file_operations vdec_fops = {
 	.open = simple_open,
 	.write = mtk_vdec_dbgfs_write,
+	.read = mtk_vdec_dbgfs_read,
 };
 
 void mtk_vcodec_dbgfs_create(struct mtk_vcodec_ctx *ctx)
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
index 47c0a986877d..de886d79ad01 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
@@ -10,6 +10,14 @@
 struct mtk_vcodec_dev;
 struct mtk_vcodec_ctx;
 
+/*
+ * enum mtk_vdec_dbgfs_log_index  - used to get different debug information
+ */
+enum mtk_vdec_dbgfs_log_index {
+	MTK_VDEC_DBGFS_PICINFO,
+	MTK_VDEC_DBGFS_MAX,
+};
+
 /**
  * struct mtk_vcodec_dbgfs_inst  - debugfs informatiaoin for each inst
  * @node: list node for each inst
-- 
2.18.0


