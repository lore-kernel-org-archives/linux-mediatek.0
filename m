Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C865C47258
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 02:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nG4MEfOtjTMFozhR+MMBa06cMwHk78fvnsRUvGipajY=; b=VND7DG+DKjBMjF1mcBy1+3b0Br
	1UNtyuYEJw7W9oVFeD89CqZK2WBWT9xjVoNiUKQvAlq/lH5jC7pla6BJgLF34y1na/JsmvjOys4wo
	2lZWZSc1qoBtTY5oD7wpASMJvgP8KTIyXoE+NEJFe49Ax1gHtN9BzubXgp8GsbELd7AtunO9Udc/G
	2EKiZ/2Fx6t/JQv5zKrTHpKcL+diLYpZ96K685LVkqRFOBFPqczdzQo9Ab+7kGRo36kxJ/C6/ijXh
	M3i38v6hlWazn/1eEe21YLR0CvqK6oSg5Xaekb4r7JUqaTNt1mSNaFmGZAbSt+N2ynpI+pWGuR6r1
	MTKsaSJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUHRZ-0000000B2Ad-2Nf9;
	Mon, 29 Jan 2024 02:32:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUHRW-0000000B27F-1OUV;
	Mon, 29 Jan 2024 02:32:15 +0000
X-UUID: 939e071abe4e11eea0bf134e88e6c2dc-20240128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nG4MEfOtjTMFozhR+MMBa06cMwHk78fvnsRUvGipajY=;
	b=bivIIOiTZW8mqQeE8LtWK9mECiyRQDDNfma1AT9C3W21Tl8K/dCImorXDKZyV23Ho2EpLvkKL9L/sN2CnPH1ftTgWb9N+nL4Azas8bVEEEhhZ+kSORh+etJWIETEL8iYiqRHIOCfrac0Wl3jASRf98JhZlbnlw5fHlan2PdEHFE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:ee5e8c65-3fa9-452e-91e5-c9f6ce0f1385,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:1,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-24
X-CID-META: VersionHash:6e16cf4,CLOUDID:3937c18e-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 939e071abe4e11eea0bf134e88e6c2dc-20240128
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1848930284; Sun, 28 Jan 2024 19:31:58 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 29 Jan 2024 10:31:56 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 29 Jan 2024 10:31:55 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Irui
 Wang <irui.wang@mediatek.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei
 Dong <yunfei.dong@mediatek.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,2/2] media: mediatek: vcodec: adding lock to protect encoder context list
Date: Mon, 29 Jan 2024 10:31:53 +0800
Message-ID: <20240129023153.28521-2-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240129023153.28521-1-yunfei.dong@mediatek.com>
References: <20240129023153.28521-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_183214_405893_6FA0EE71 
X-CRM114-Status: GOOD (  17.88  )
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

The ctx_list will be deleted when scp getting unexpected behavior, then the
ctx_list->next will be NULL, the kernel driver maybe access NULL pointer in
function vpu_enc_ipi_handler when going through each context, then reboot.

Need to add lock to protect the ctx_list to make sure the ctx_list->next isn't
NULL pointer.

'Fixes: 1972e32431ed ("media: mediatek: vcodec: Fix possible invalid memory access for encoder")'
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
change in v2:
- fix unlock issue.
---
 .../platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 4 ++--
 .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c    | 5 +++++
 .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h    | 2 ++
 drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c | 2 ++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 9a11a2c24804..8d578b690214 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -73,12 +73,12 @@ static void mtk_vcodec_vpu_reset_enc_handler(void *priv)
 
 	dev_err(&dev->plat_dev->dev, "Watchdog timeout!!");
 
-	mutex_lock(&dev->dev_mutex);
+	mutex_lock(&dev->dev_ctx_lock);
 	list_for_each_entry(ctx, &dev->ctx_list, list) {
 		ctx->state = MTK_STATE_ABORT;
 		mtk_v4l2_vdec_dbg(0, ctx, "[%d] Change to state MTK_STATE_ABORT", ctx->id);
 	}
-	mutex_unlock(&dev->dev_mutex);
+	mutex_unlock(&dev->dev_ctx_lock);
 }
 
 static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
index 6319f24bc714..3cb8a1622222 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
@@ -177,7 +177,9 @@ static int fops_vcodec_open(struct file *file)
 	mtk_v4l2_venc_dbg(2, ctx, "Create instance [%d]@%p m2m_ctx=%p ",
 			  ctx->id, ctx, ctx->m2m_ctx);
 
+	mutex_lock(&dev->dev_ctx_lock);
 	list_add(&ctx->list, &dev->ctx_list);
+	mutex_unlock(&dev->dev_ctx_lock);
 
 	mutex_unlock(&dev->dev_mutex);
 	mtk_v4l2_venc_dbg(0, ctx, "%s encoder [%d]", dev_name(&dev->plat_dev->dev),
@@ -212,7 +214,9 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
+	mutex_lock(&dev->dev_ctx_lock);
 	list_del_init(&ctx->list);
+	mutex_unlock(&dev->dev_ctx_lock);
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
 	return 0;
@@ -294,6 +298,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 
 	mutex_init(&dev->enc_mutex);
 	mutex_init(&dev->dev_mutex);
+	mutex_init(&dev->dev_ctx_lock);
 	spin_lock_init(&dev->irqlock);
 
 	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name), "%s",
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
index a042f607ed8d..0bd85d0fb379 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.h
@@ -178,6 +178,7 @@ struct mtk_vcodec_enc_ctx {
  *
  * @enc_mutex: encoder hardware lock.
  * @dev_mutex: video_device lock
+ * @dev_ctx_lock: the lock of context list
  * @encode_workqueue: encode work queue
  *
  * @enc_irq: h264 encoder irq resource
@@ -205,6 +206,7 @@ struct mtk_vcodec_enc_dev {
 	/* encoder hardware mutex lock */
 	struct mutex enc_mutex;
 	struct mutex dev_mutex;
+	struct mutex dev_ctx_lock;
 	struct workqueue_struct *encode_workqueue;
 
 	int enc_irq;
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
index 84ad1cc6ad17..51bb7ee141b9 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_vpu_if.c
@@ -47,12 +47,14 @@ static bool vpu_enc_check_ap_inst(struct mtk_vcodec_enc_dev *enc_dev, struct ven
 	struct mtk_vcodec_enc_ctx *ctx;
 	int ret = false;
 
+	mutex_lock(&enc_dev->dev_ctx_lock);
 	list_for_each_entry(ctx, &enc_dev->ctx_list, list) {
 		if (!IS_ERR_OR_NULL(ctx) && ctx->vpu_inst == vpu) {
 			ret = true;
 			break;
 		}
 	}
+	mutex_unlock(&enc_dev->dev_ctx_lock);
 
 	return ret;
 }
-- 
2.18.0


