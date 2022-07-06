Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A03CCA47C
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 08:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDZsBKJCrPvrRed10JTTLn5RY5HzOJYgNfc59ZsTy1o=; b=QpgazoehWydcsHSYPiSE72gvp4
	S/ut7oySy+Xk7WqrFSWvU9Kref8PPjw/m0g+3Yq2MUHt5u8yatWembw48+/bfs29VsXz0GnPjM39Q
	tqZilF9OreoWgUai6FcjugHNPwFinRNr1WBT2oNmD9v3etbPSYwBzDi4ecoIK6mi086p6/liFTPen
	hxtaKiI3NiXPt446XMJbbmld+GCoSkkkr3A9CktxM4tHIoEKSyZXno3Zzh1S0LVK4kCf5sQEQzkzf
	ghQyX3PEYIzjX5BGRUdHKUiDi2ucAE7P4UY8XRasxAysUHnlAJkQdszXFJvmXoQTmde+vSNxI3I7q
	Z0mBGp5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90IY-007LWT-MK; Wed, 06 Jul 2022 08:22:14 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90IV-007LRZ-Sy
	for linux-mediatek@lists.infradead.org; Wed, 06 Jul 2022 08:22:13 +0000
Received: by mail-pj1-x1036.google.com with SMTP id y14-20020a17090a644e00b001ef775f7118so11212086pjm.2
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Jul 2022 01:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EDZsBKJCrPvrRed10JTTLn5RY5HzOJYgNfc59ZsTy1o=;
        b=BG33RCKbSZjiCGlqGQwuXJB4QMtQuJ7poldXwAhU5R2EBuTZJsWxFs/9j0HX0ebrrE
         Musc2wXQ/Faa2gc25JxI+ZQNzyi27DPVm/JxnTfKz9VAhLczwQxc2pOmWo6i586+H3XX
         +sA9CCVEEmJu4mdI272CRC6MAu8UH9CzMtcao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EDZsBKJCrPvrRed10JTTLn5RY5HzOJYgNfc59ZsTy1o=;
        b=3qVF7F3NF0dDxcGR9FEG9JWn3W35xHzFU/ZdWVCqIbL6ZoCgGaVbuPSb7KDnDMcxxC
         ewSizTBzsW2+2L2igNvGebN0PoNreP2ETO8/cIQhFiq6BHC2S6drdYe51BcPtY+n/RTW
         +fhig0xXepiVX1vz84grZyx4GqMPrfmgunFYErn3FC/c08H8oJ8Fo78/TqgNCF8bxm6d
         m+LcIU3Rhph3pKHUCXDftlm/AfYP2mh41FC/HtRquJp3WpX5NmHfGPgtkmN0HotJ/0X5
         h637sYOzScxZxjZszUc7qImk/F23fsluG0vl3/cVpQcB6PrGh4qSGWtbTCR/x+PYVoWK
         /tSw==
X-Gm-Message-State: AJIora9RSAzpk2JzW1/APogAm3fmuwLZah56nOABF6h6MwLOzQMTIcW2
	hTBWTg4IMluu8D4qY9vyEfZ1SQ==
X-Google-Smtp-Source: AGRyM1u8CxD0ORsdxHN8AhIq+XV1uXWF78ZIBZA3x9laIWEkb3wQRviHyBH0bTlGFY6NfylpUhWjiw==
X-Received: by 2002:a17:902:ab1b:b0:16b:e155:f32c with SMTP id ik27-20020a170902ab1b00b0016be155f32cmr17034027plb.104.1657095729035;
        Wed, 06 Jul 2022 01:22:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74a3:a7a4:af57:d7f])
        by smtp.gmail.com with ESMTPSA id rm1-20020a17090b3ec100b001ed27d132c1sm20767040pjb.2.2022.07.06.01.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:22:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 5/6] media: mediatek: vcodec: decoder: Drop max_{width,height} from mtk_vcodec_ctx
Date: Wed,  6 Jul 2022 16:21:37 +0800
Message-Id: <20220706082138.2668163-6-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706082138.2668163-1-wenst@chromium.org>
References: <20220706082138.2668163-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_012211_946394_E9AE2407 
X-CRM114-Status: GOOD (  11.18  )
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

This partially reverts commit b018be06f3c7 ("media: mediatek: vcodec:
Read max resolution from dec_capability").

After the previous patches:

  - media: mediatek: vcodec: decoder: Fix 4K frame size enumeration
  - media: mediatek: vcodec: decoder: Skip alignment for default resolution
  - media: mediatek: vcodec: decoder: Fix resolution clamping in TRY_FMT

the max_{width,height} fields in |struct mtk_vcodec_ctx| no longer have
any real users. Remove them.

Fixes: b018be06f3c7 ("media: mediatek: vcodec: Read max resolution from dec_capability")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 9 ---------
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 4 ----
 2 files changed, 13 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index cdd07fa612ee..2d370e8041c1 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -177,8 +177,6 @@ void mtk_vcodec_dec_set_default_params(struct mtk_vcodec_ctx *ctx)
 	q_data->coded_height = DFT_CFG_HEIGHT;
 	q_data->fmt = ctx->dev->vdec_pdata->default_cap_fmt;
 	q_data->field = V4L2_FIELD_NONE;
-	ctx->max_width = MTK_VDEC_MAX_W;
-	ctx->max_height = MTK_VDEC_MAX_H;
 
 	q_data->sizeimage[0] = q_data->coded_width * q_data->coded_height;
 	q_data->bytesperline[0] = q_data->coded_width;
@@ -514,13 +512,6 @@ static int vidioc_vdec_s_fmt(struct file *file, void *priv,
 	if (fmt == NULL)
 		return -EINVAL;
 
-	if (!(ctx->dev->dec_capability & VCODEC_CAPABILITY_4K_DISABLED) &&
-	    fmt->fourcc != V4L2_PIX_FMT_VP8_FRAME) {
-		mtk_v4l2_debug(3, "4K is enabled");
-		ctx->max_width = VCODEC_DEC_4K_CODED_WIDTH;
-		ctx->max_height = VCODEC_DEC_4K_CODED_HEIGHT;
-	}
-
 	q_data->fmt = fmt;
 	vidioc_try_fmt(ctx, f, q_data->fmt);
 	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index 4140b4dd85bf..4f15f5f60e40 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -286,8 +286,6 @@ struct vdec_pic_info {
  *	  mtk_video_dec_buf.
  * @hw_id: hardware index used to identify different hardware.
  *
- * @max_width: hardware supported max width
- * @max_height: hardware supported max height
  * @msg_queue: msg queue used to store lat buffer information.
  */
 struct mtk_vcodec_ctx {
@@ -334,8 +332,6 @@ struct mtk_vcodec_ctx {
 	struct mutex lock;
 	int hw_id;
 
-	unsigned int max_width;
-	unsigned int max_height;
 	struct vdec_msg_queue msg_queue;
 };
 
-- 
2.37.0.rc0.161.g10f37bed90-goog


