Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5BEC76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 09:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EHJLyaDloXo64Cbva9s+jdVQPscInXF4sT/C8pUOcqU=; b=eiIkvVQZq1LZEwDhG7oZ2rn15D
	fELMvwj3EsxJmkPNID/31BgDLKiXfdOUooSud8ZwVI/Q3YSm9gvltj+c8q3bVHKvuzes+2RMLjVpD
	M4k+OTbERarkORN54493TaKDr3ZdIxSHbFZ9UPeBexvEAzgTHYaJi0Nsry98auUFEUjEuf/XFRPGa
	4xgquhKQXSr+ecU+x+D/BJFSi6BBdG4IZvK1T6lbrtKRUjtXmpa6g122yzzadvIO9V1Xm4yEoIDN5
	+1QF+J4Ir7/JgJmpA+Q5J50bNYOCgSqGwd+2bRz7NjWoa5WLH2JkQ47Ol+OlMpKbjiLQcdk7fFtUf
	KrTXew1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGjE-00EmZj-2a;
	Mon, 03 Apr 2023 09:43:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjGjB-00EmXq-3C;
	Mon, 03 Apr 2023 09:43:55 +0000
X-UUID: 07f718fad20411ed8687db9d93187ff1-20230403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EHJLyaDloXo64Cbva9s+jdVQPscInXF4sT/C8pUOcqU=;
	b=RDa7M/psoS9CVrNzXYX+j64JFQ3nozNMmRgVCPVrWDspit1EE7a5iP7dMDRFMPGyUa2pPwbQb4lVQs4H30tXuXdA8b4Sqm3TSciKRceMvBGlES2GsJesf4I2Ac9+ofRoPP303CTROPT3/NhuHVanxh3q48268XmnL3ZnBtc7Ric=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:d71f145d-a586-491c-bda6-e3ea8be7759c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:0d33432a-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 07f718fad20411ed8687db9d93187ff1-20230403
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 409455088; Mon, 03 Apr 2023 02:43:47 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 3 Apr 2023 17:43:44 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 3 Apr 2023 17:43:44 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<maoguang.meng@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, Irui
 Wang <irui.wang@mediatek.com>
Subject: [PATCH] media: mediatek: vcodec: Coverity issues in encoder driver
Date: Mon, 3 Apr 2023 17:43:42 +0800
Message-ID: <20230403094342.27498-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_024354_043642_27B075CA 
X-CRM114-Status: GOOD (  13.96  )
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

CERT-C Characters and Strings:
check core id is in valid range:
dev->reg_base[dev->venc_pdata->core_id] evaluates to an address
that could be at negative offset of an array.

CERT-C Expression:
check buf is not NULL before used:
Dereferencing buf, which is known to be NULL.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 .../platform/mediatek/vcodec/mtk_vcodec_enc.c    |  2 +-
 .../mediatek/vcodec/mtk_vcodec_enc_drv.c         | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index d65800a3b89d..db65e77bd373 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -943,7 +943,7 @@ static int vb2ops_venc_start_streaming(struct vb2_queue *q, unsigned int count)
 		 * FIXME: This check is not needed as only active buffers
 		 * can be marked as done.
 		 */
-		if (buf->state == VB2_BUF_STATE_ACTIVE) {
+		if (buf && buf->state == VB2_BUF_STATE_ACTIVE) {
 			mtk_v4l2_debug(0, "[%d] id=%d, type=%d, %d -> VB2_BUF_STATE_QUEUED",
 					ctx->id, i, q->type,
 					(int)buf->state);
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
index 9095186d5495..125d5722d07b 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
@@ -89,16 +89,24 @@ static irqreturn_t mtk_vcodec_enc_irq_handler(int irq, void *priv)
 	struct mtk_vcodec_ctx *ctx;
 	unsigned long flags;
 	void __iomem *addr;
+	int core_id;
 
 	spin_lock_irqsave(&dev->irqlock, flags);
 	ctx = dev->curr_ctx;
 	spin_unlock_irqrestore(&dev->irqlock, flags);
 
-	mtk_v4l2_debug(1, "id=%d coreid:%d", ctx->id, dev->venc_pdata->core_id);
-	addr = dev->reg_base[dev->venc_pdata->core_id] +
-				MTK_VENC_IRQ_ACK_OFFSET;
+	core_id = dev->venc_pdata->core_id;
+	if (core_id < 0 || core_id >= NUM_MAX_VCODEC_REG_BASE) {
+		mtk_v4l2_err("Invalid core id: %d, ctx id: %d",
+			     core_id, ctx->id);
+		return IRQ_HANDLED;
+	}
+
+	mtk_v4l2_debug(1, "id: %d, core id: %d", ctx->id, core_id);
+
+	addr = dev->reg_base[core_id] + MTK_VENC_IRQ_ACK_OFFSET;
 
-	ctx->irq_status = readl(dev->reg_base[dev->venc_pdata->core_id] +
+	ctx->irq_status = readl(dev->reg_base[core_id] +
 				(MTK_VENC_IRQ_STATUS_OFFSET));
 
 	clean_irq_status(ctx->irq_status, addr);
-- 
2.25.1


