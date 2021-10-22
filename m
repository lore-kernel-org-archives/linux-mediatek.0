Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21275C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 15:04:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB63D61205
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 15:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB63D61205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMFdi5IU4K6qqh2EQiqSV0S+mAU1FA4rswV+/qqkAzc=; b=We3zqrEjdOkYzf
	sPnEEap13AUf1Y5RSd3VsTbGcTVxCbTm5o5GJWS+rO0XDAPrt+sN+nCX7Pp1EhiJLQymoh/b84p3z
	Evk8mRj+YaCVbxeCU9HQfW0BzLmLSUvYyuZNJ40V5ZQTZ0mvlero54atxySX4bZwem8l8QTIWFNpv
	IhyaR1yjmqFQ8nqRG5V0UCNCeu3BpJUA1rawKZUA39eWUWb7d5AGYkLpZTGiiNdVSwHirEXwDPtQw
	OGqOQksoID+hgJ1V0EvEP5RzrCJIVU+1gZIZA7wf/8awh+5XejxrYd+wjkDudYlPZliPrTImT5MLa
	LsEk7yCoGv16J0Vvz34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdw61-00BLKq-0E; Fri, 22 Oct 2021 15:04:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdw5l-00BLCf-Ls
 for linux-mediatek@lists.infradead.org; Fri, 22 Oct 2021 15:04:23 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:50fa:5c7d:20f4:e8d3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D29DF1F417C2;
 Fri, 22 Oct 2021 16:04:19 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, kernel@collabora.com,
 acourbot@chromium.org, andrew-ct.chen@mediatek.com, courbot@chromium.org,
 dafna3@gmail.com, eizan@chromium.org, houlong.wei@mediatek.com,
 hsinyi@chromium.org, hverkuil@xs4all.nl, irui.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 maoguang.meng@mediatek.com, matthias.bgg@gmail.com, mchehab@kernel.org,
 minghsiu.tsai@mediatek.com, tfiga@chromium.org, tiffany.lin@mediatek.com
Subject: [PATCH 3/3] meida: mtk-vcodec: remove unused func parameter
Date: Fri, 22 Oct 2021 17:04:10 +0200
Message-Id: <20211022150410.29335-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211022150410.29335-1-dafna.hirschfeld@collabora.com>
References: <20211022150410.29335-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_080421_940935_D7920A8E 
X-CRM114-Status: GOOD (  10.75  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The prarameter bs_size to function vpu_enc_encode
is not used. Remove it.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c | 9 +++------
 drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c  | 3 +--
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c       | 1 -
 drivers/media/platform/mtk-vcodec/venc_vpu_if.h       | 1 -
 4 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
index b6a4f2074fa5..bf03888a824f 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c
@@ -367,8 +367,7 @@ static int h264_encode_sps(struct venc_h264_inst *inst,
 
 	mtk_vcodec_debug_enter(inst);
 
-	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL,
-			     bs_buf, bs_size, NULL);
+	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_SPS, NULL, bs_buf, NULL);
 	if (ret)
 		return ret;
 
@@ -394,8 +393,7 @@ static int h264_encode_pps(struct venc_h264_inst *inst,
 
 	mtk_vcodec_debug_enter(inst);
 
-	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL,
-			     bs_buf, bs_size, NULL);
+	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_PPS, NULL, bs_buf, NULL);
 	if (ret)
 		return ret;
 
@@ -451,8 +449,7 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
 	mtk_vcodec_debug(inst, "frm_count = %d,skip_frm_count =%d,frm_type=%d.\n",
 			 frame_info.frm_count, frame_info.skip_frm_count,
 			 frame_info.frm_type);
-	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf,
-			     bs_buf, bs_size, &frame_info);
+	ret = vpu_enc_encode(&inst->vpu_inst, H264_BS_MODE_FRAME, frm_buf, bs_buf, &frame_info);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
index 8267a9c4fd25..6b66957d5192 100644
--- a/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc/venc_vp8_if.c
@@ -302,8 +302,7 @@ static int vp8_enc_encode_frame(struct venc_vp8_inst *inst,
 
 	mtk_vcodec_debug(inst, "->frm_cnt=%d", inst->frm_cnt);
 
-	ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, bs_size,
-			     NULL);
+	ret = vpu_enc_encode(&inst->vpu_inst, 0, frm_buf, bs_buf, NULL);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
index be6d8790a41e..e7899d8a3e4e 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.c
@@ -225,7 +225,6 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
 int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
 		   struct venc_frm_buf *frm_buf,
 		   struct mtk_vcodec_mem *bs_buf,
-		   unsigned int *bs_size,
 		   struct venc_frame_info *frame_info)
 {
 	const bool is_ext = MTK_ENC_CTX_IS_EXT(vpu->ctx);
diff --git a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
index f9be9cab7ff7..f83bc1b3f2bf 100644
--- a/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
+++ b/drivers/media/platform/mtk-vcodec/venc_vpu_if.h
@@ -45,7 +45,6 @@ int vpu_enc_set_param(struct venc_vpu_inst *vpu,
 int vpu_enc_encode(struct venc_vpu_inst *vpu, unsigned int bs_mode,
 		   struct venc_frm_buf *frm_buf,
 		   struct mtk_vcodec_mem *bs_buf,
-		   unsigned int *bs_size,
 		   struct venc_frame_info *frame_info);
 int vpu_enc_deinit(struct venc_vpu_inst *vpu);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
