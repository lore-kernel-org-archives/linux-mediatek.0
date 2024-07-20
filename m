Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49213C3DA49
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Jul 2024 07:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKk4Fa5ga7eSZuwHvllppXgaLImiDdg00J3kssvSahY=; b=bCYdQjQib8j4T2g3HxpKgqbWpM
	y0rkupYiDuzUb59628TewIDmJ9yClJeK6MAutO6c22TO4pPb23/bgoAZ8kUvK9zI13MZYxrjtnxtu
	2q/qMmAiC9xgONsccnSNdTUldt4xJGOtss3XDwc7oSONzaO3WULlSwuzmJgPu8vNotXl9mQJR7ndM
	QKtfF7FfNbNUX088ZGLWqBwly4PSChmonB5ScTsyr0nS6umOsbtTA4fscBGZWGlJC8iC9LjgMfAPn
	rojREGHhUuZA17pvNzbzHq69l059+c8em3RE5P74vYHVXc/IaO0+qgk2Je5HS5vzcT0a1d/upjxfw
	sC6mwdbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV4O3-00000004dhh-3mgt;
	Sat, 20 Jul 2024 07:20:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV4Kf-00000004cEa-2zQQ;
	Sat, 20 Jul 2024 07:16:44 +0000
X-UUID: 017dfff0466811efa6c87f6b4542ff6b-20240720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YKk4Fa5ga7eSZuwHvllppXgaLImiDdg00J3kssvSahY=;
	b=UPGIfvSOXmrJ9f04MENWEGXwJ/dWFmHPGQhJ5ddTdZkSDIYKresxAd3lIDrL7UQo4j/9eVYonLMD9Ne/yA32tjGOKX8djHY47a2BPnLbvJdC2Fv4ctpRgLCwPGqIcVAfb0Mfhd64qIcTwT/yfpIBwoZV9vtByZMKBI1AL+7h3RE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:b32eb966-127a-4d20-8609-ca2cdb336779,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:37e990d5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 017dfff0466811efa6c87f6b4542ff6b-20240720
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1608744630; Sat, 20 Jul 2024 00:16:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 20 Jul 2024 00:16:36 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 20 Jul 2024 15:16:35 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Jeffrey Kardatzke <jkardatzke@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski
	<m.szyprowski@samsung.com>
CC: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, Hsin-Yi
 Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel
 Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, Yunfei Dong
	<yunfei.dong@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, Brian
 Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, "T . J .
 Mercier" <tjmercier@google.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v7 19/28] media: mediatek: vcodec: disable wait interrupt for svp mode
Date: Sat, 20 Jul 2024 15:15:57 +0800
Message-ID: <20240720071606.27930-20-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240720071606.27930-1-yunfei.dong@mediatek.com>
References: <20240720071606.27930-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_001641_893521_7E14B293 
X-CRM114-Status: GOOD (  14.19  )
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

Waiting interrupt in optee-os for svp mode, need to disable it in kernel
in case of interrupt is cleaned.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../vcodec/decoder/mtk_vcodec_dec_hw.c        | 34 +++++------
 .../vcodec/decoder/mtk_vcodec_dec_pm.c        |  6 +-
 .../decoder/vdec/vdec_h264_req_multi_if.c     | 57 +++++++++++--------
 3 files changed, 54 insertions(+), 43 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
index 881d5de41e05..1982c088c6da 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
@@ -72,26 +72,28 @@ static irqreturn_t mtk_vdec_hw_irq_handler(int irq, void *priv)
 
 	ctx = mtk_vcodec_get_curr_ctx(dev->main_dev, dev->hw_idx);
 
-	/* check if HW active or not */
-	cg_status = readl(dev->reg_base[VDEC_HW_SYS] + VDEC_HW_ACTIVE_ADDR);
-	if (cg_status & VDEC_HW_ACTIVE_MASK) {
-		mtk_v4l2_vdec_err(ctx, "vdec active is not 0x0 (0x%08x)", cg_status);
-		return IRQ_HANDLED;
-	}
+	if (!ctx->is_secure_playback) {
+		/* check if HW active or not */
+		cg_status = readl(dev->reg_base[VDEC_HW_SYS] + VDEC_HW_ACTIVE_ADDR);
+		if (cg_status & VDEC_HW_ACTIVE_MASK) {
+			mtk_v4l2_vdec_err(ctx, "vdec active is not 0x0 (0x%08x)", cg_status);
+			return IRQ_HANDLED;
+		}
 
-	dec_done_status = readl(vdec_misc_addr);
-	if ((dec_done_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS) !=
-	    MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
-		return IRQ_HANDLED;
+		dec_done_status = readl(vdec_misc_addr);
+		if ((dec_done_status & MTK_VDEC_IRQ_STATUS_DEC_SUCCESS) !=
+		    MTK_VDEC_IRQ_STATUS_DEC_SUCCESS)
+			return IRQ_HANDLED;
 
-	/* clear interrupt */
-	writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
-	writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
+		/* clear interrupt */
+		writel(dec_done_status | VDEC_IRQ_CFG, vdec_misc_addr);
+		writel(dec_done_status & ~VDEC_IRQ_CLR, vdec_misc_addr);
 
-	wake_up_dec_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->hw_idx);
+		wake_up_dec_ctx(ctx, MTK_INST_IRQ_RECEIVED, dev->hw_idx);
 
-	mtk_v4l2_vdec_dbg(3, ctx, "wake up ctx %d, dec_done_status=%x",
-			  ctx->id, dec_done_status);
+		mtk_v4l2_vdec_dbg(3, ctx, "wake up ctx %d, dec_done_status=%x",
+				  ctx->id, dec_done_status);
+	}
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c
index aefd3e9e3061..a94eda936f16 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_pm.c
@@ -238,7 +238,8 @@ void mtk_vcodec_dec_enable_hardware(struct mtk_vcodec_dec_ctx *ctx, int hw_idx)
 		mtk_vcodec_dec_child_dev_on(ctx->dev, MTK_VDEC_LAT0);
 	mtk_vcodec_dec_child_dev_on(ctx->dev, hw_idx);
 
-	mtk_vcodec_dec_enable_irq(ctx->dev, hw_idx);
+	if (!ctx->is_secure_playback)
+		mtk_vcodec_dec_enable_irq(ctx->dev, hw_idx);
 
 	if (IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
 		mtk_vcodec_load_racing_info(ctx);
@@ -250,7 +251,8 @@ void mtk_vcodec_dec_disable_hardware(struct mtk_vcodec_dec_ctx *ctx, int hw_idx)
 	if (IS_VDEC_INNER_RACING(ctx->dev->dec_capability))
 		mtk_vcodec_record_racing_info(ctx);
 
-	mtk_vcodec_dec_disable_irq(ctx->dev, hw_idx);
+	if (!ctx->is_secure_playback)
+		mtk_vcodec_dec_disable_irq(ctx->dev, hw_idx);
 
 	mtk_vcodec_dec_child_dev_off(ctx->dev, hw_idx);
 	if (IS_VDEC_LAT_ARCH(ctx->dev->vdec_pdata->hw_arch) &&
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
index 86ce8988c716..25e4a5236dcc 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
@@ -592,14 +592,16 @@ static int vdec_h264_slice_core_decode(struct vdec_lat_buf *lat_buf)
 		goto vdec_dec_end;
 	}
 
-	/* wait decoder done interrupt */
-	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
-					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
-	if (timeout)
-		mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
-	inst->vsi_core->dec.timeout = !!timeout;
-
-	vpu_dec_core_end(vpu);
+	if (!ctx->is_secure_playback) {
+		/* wait decoder done interrupt */
+		timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+						       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+		if (timeout)
+			mtk_vdec_err(ctx, "core decode timeout: pic_%d", ctx->decoded_frame_cnt);
+		inst->vsi_core->dec.timeout = !!timeout;
+
+		vpu_dec_core_end(vpu);
+	}
 	mtk_vdec_debug(ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
 		       ctx->decoded_frame_cnt,
 		       inst->vsi_core->dec.crc[0], inst->vsi_core->dec.crc[1],
@@ -723,14 +725,16 @@ static int vdec_h264_slice_lat_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
 		vdec_msg_queue_qbuf(&inst->ctx->msg_queue.core_ctx, lat_buf);
 	}
 
-	/* wait decoder done interrupt */
-	timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
-					       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
-	if (timeout)
-		mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
-	inst->vsi->dec.timeout = !!timeout;
+	if (!inst->ctx->is_secure_playback) {
+		/* wait decoder done interrupt */
+		timeout = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+						       WAIT_INTR_TIMEOUT_MS, MTK_VDEC_LAT0);
+		if (timeout)
+			mtk_vdec_err(inst->ctx, "lat decode timeout: pic_%d", inst->slice_dec_num);
+		inst->vsi->dec.timeout = !!timeout;
 
-	err = vpu_dec_end(vpu);
+		err = vpu_dec_end(vpu);
+	}
 	if (err == SLICE_HEADER_FULL || err == TRANS_BUFFER_FULL) {
 		if (!IS_VDEC_INNER_RACING(inst->ctx->dev->dec_capability))
 			vdec_msg_queue_qbuf(&inst->ctx->msg_queue.lat_ctx, lat_buf);
@@ -830,16 +834,19 @@ static int vdec_h264_slice_single_decode(void *h_vdec, struct mtk_vcodec_mem *bs
 	if (err)
 		goto err_free_fb_out;
 
-	/* wait decoder done interrupt */
-	err = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
-					   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
-	if (err)
-		mtk_vdec_err(inst->ctx, "decode timeout: pic_%d", inst->ctx->decoded_frame_cnt);
-
-	inst->vsi->dec.timeout = !!err;
-	err = vpu_dec_end(vpu);
-	if (err)
-		goto err_free_fb_out;
+	if (!inst->ctx->is_secure_playback) {
+		/* wait decoder done interrupt */
+		err = mtk_vcodec_wait_for_done_ctx(inst->ctx, MTK_INST_IRQ_RECEIVED,
+						   WAIT_INTR_TIMEOUT_MS, MTK_VDEC_CORE);
+		if (err)
+			mtk_vdec_err(inst->ctx, "decode timeout: pic_%d",
+				     inst->ctx->decoded_frame_cnt);
+
+		inst->vsi->dec.timeout = !!err;
+		err = vpu_dec_end(vpu);
+		if (err)
+			goto err_free_fb_out;
+	}
 
 	memcpy(&inst->vsi_ctx, inst->vpu.vsi, sizeof(inst->vsi_ctx));
 	mtk_vdec_debug(inst->ctx, "pic[%d] crc: 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x",
-- 
2.18.0


