Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB296606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 20:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kLPERNWM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2XcQvOl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2/+Zf3N1CnddY8JlOrVc8DsTWkURHkyHGw0xs/XTPrE=; b=kLPERNWM0/zDrc
	T0maOqamHs+rqmR31WAgl7Ao3xdRcIzIZugY5EVqpc3vP40C5/82QFVrQZkxXwznQPCNOC6NKC6Ve
	l/4RBJmy/PzVRL0wk6bOismSYa9PBoR/l4YccF9kA3RBfTuSux84/TznxphpkOKIAmVKojtbsAX0T
	mMj/7w33/VZoHWUEv56OGcMraC8jXU4BxahgB5q0N6p6bBeb615OTJZV3IuO6d9D/tS9Wz10/NVBL
	n6ExWbic3xq3LNCuYR39/uW+MTNTRgml0hax9t/PBHQkcokBv01GKriHm7yP2vD2iFILfpaLQp5vL
	0UoKjgnxlIBv2qy+itNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJQz-0000000BFdG-15L2;
	Wed, 25 Nov 2026 20:17:41 +0000
Received: from mail-oo2-x09.google.com ([2607:f8b0:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPn-0000000BEwJ-0121
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:28 +0000
Received: by mail-oo2-x09.google.com with SMTP id 006d021491bc7-71adbc33a72so1842158eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 12:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637786; x=1796242586; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2/+Zf3N1CnddY8JlOrVc8DsTWkURHkyHGw0xs/XTPrE=;
        b=v2XcQvOlpMzTnciCBh2U2tMRQM7LCwnr3uL6CFyVHpZAmLvTePrMiJOb/ckPMlVxFU
         V9eUP2hcI3HFMuPxtkczSz4XIZy4VEfPOG02d0rPTu79VPgScOk3sk4JXoBrYkM72Cir
         Ccf5q6qhJQRXkZo/31oYOrSJzy2vEcBfRYbjQrk7L1s0euyDeiWQ6bpszGXnB5vo0Byl
         DhK8QnpVcyKVMpHfj4+vTCNgIdtzeZK7X9n6+lb/8GVzrgI8VoQ+U9f8vsW9+o/ac+eG
         eerQOMW0A06FxSIAnay4ulC4RQSEKJJodlkXnzeIap0+3VGCTmfp6heayD0L3LSSNx3z
         3mmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637786; x=1796242586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/+Zf3N1CnddY8JlOrVc8DsTWkURHkyHGw0xs/XTPrE=;
        b=y4d7prH8q16KYMlC77DBtwfFtr93RxEJVpIomoWUgQnJGQaYJT9t1kHVpPpObDSsg2
         Vg4m2/375y/PB21iXgu0G9yvKjPvzxByHRF6LMv6Rk9933BXtr4XUCiBl3jG8kJXWVY7
         8ZsKZMh7pXSjkOOtIPG8YCJtlrm6Ejg8CaTExpuPLF+3u3RAFAL/pWAQ4W/7gyH41ss9
         729REoFShLnAahSSKx5V9HYHYZ7Sr1DuCnS7Fzw7tP7ho9jsxMkRGuAoNxp01T3kY6TO
         bl6tzLFOowQ4WymAULbC+ziQxrbnghRr7jwo5TjjujA9oPFS5V61R5Ssl4S1Re8WI5iq
         88bA==
X-Forwarded-Encrypted: i=1; AL+hErFR1AAPZ8FNM+dLlz5cpqgJdOmpZxohXEHtjFCnxiWfV6TBk0y7DMNdVP315on9VJBoSHcVA9Wf3S/+yZlmig==@lists.infradead.org
X-Gm-Message-State: APuU4Z/83P73Q9I4ecoZ8zT6cEBIftcO9V5dr3PnnFthq0Cs9HBn3uXK
	/tTv2UJ8FD667S6N3jS0hgK4Y5RTDdljNfEIt+s79+yDb721JuvnyN4W
X-Gm-Gg: AZFdTZeFk0wLwmv0T9HVBOlz0+WVDC2MhMk+uW0Y5ve4+M8lyfENl9kJZN9107FotG1
	+RS/UAalVtsATYI+6BVbgd+hiXaYftlAuc2kqqRuQ+oiSStOpBZjx1egolpEEIHqmdq0KCA6wnb
	qxOG61aAb6Y8WpWpXAonmqPxs9KU0iIkIn/hiqCokwsH5eVoMJm++VfBESmIUXpUEOpP3RTvl8x
	W988KpTw7xpkT+VUNo/YfMoMi80ORySVqYOMTEjxcU9upEkUGqKOZY7aG4rCvMJFzOFINPj/Ari
	sXcilQjvmvSZTR+1iFne3AdCuPHYYj0FiLFdJv2BDk/E9mMwACuq1vEZt6NRF6/kll7VKeBzk6j
	fRcqfRgCPFTR0LVQ8QuKLAIN7TqrtH7tHYemgdScM4kKAE/algNJ5ufVCfw+p61wzxoKZCojNZ3
	/yEPfmS6uM97zP1h+2eTUAoZLRFmpYs924vYy4BKM+RsVVQW3bSbsZVhMjS1pvCrrmSXe18FNkw
	lfaog5ZVH3tDusgtzr1dVdYukq+cSJlgS86uyzI3DHcODFryKKv4IoyWJY3gFEsF+vOW1zFcFCP
	1bkcTGTgXB7QV6YTlyJfKfvSf8Uxc4WGjMLqSQNyhFJ/XG2Pd4WreZ9R
X-Received: by 2002:a05:6820:350f:20b0:702:6977:34db with SMTP id 006d021491bc7-71b395c579emr11640137eaf.72.1795637786196;
        Wed, 25 Nov 2026 12:16:26 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:25 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:12 -0600
Subject: [PATCH v2 9/9] media: mediatek: vcodec: Flag the last buffer
 before a resolution change
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-9-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=5381;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Y1SCU8OkUEdpQ3ilaD/8tRCyrFrvygGo3anBgXd8zNE=;
 b=Xymw8nTU27gApkcaTJe3iPpcMVrBpPIb8WcWK0w0YSKzWjrycv5MT5q0HoerLVJwtncP6cxbc
 lRpPQyXEkepCKrFLdP960Hof//sDKGkmtvh0aNmVF9i026i2WblqyJ4
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121627_086515_268152BF 
X-CRM114-Status: GOOD (  19.77  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the stateful decoder finds a resolution change, it flushes the
frames decoded before it and sends V4L2_EVENT_SOURCE_CHANGE, but never
returns a CAPTURE buffer with V4L2_BUF_FLAG_LAST: the destination buffer
of the job that found the change is taken off the queue and dropped.
dev-decoder.rst has the client wait for that buffer before it
reallocates, so a client following it waits forever and a mid-stream
resolution change stalls decoding (GStreamer's v4l2h264dec, for one).

After the flush, queue the event and then return an empty CAPTURE buffer
flagged LAST, or flag the next one queued if none is ready.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  2 +
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |  3 ++
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c       | 44 +++++++++++++++++++++-
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 71db692ed848..b8cc58e2a155 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -899,6 +899,8 @@ void vb2ops_vdec_stop_streaming(struct vb2_queue *q)
 		return;
 	}
 
+	ctx->last_buf_pending = false;
+
 	if (ctx->state >= MTK_STATE_HEADER) {
 
 		/* Until STREAMOFF is called on the CAPTURE queue
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
index c9d27534c63e..5c30a96c1ccd 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
@@ -170,6 +170,8 @@ struct mtk_vcodec_dec_request {
  * @empty_flush_buf: a fake size-0 capture buffer that indicates flush. Used
  *		     for stateful decoder.
  * @is_flushing: set to true if flushing is in progress.
+ * @last_buf_pending: return the next CAPTURE buffer queued as the LAST one
+ *                    (a resolution change found no buffer to flag).
  *
  * @current_codec: current set input codec, in V4L2 pixel format
  * @capture_fourcc: capture queue type in V4L2 pixel format
@@ -216,6 +218,7 @@ struct mtk_vcodec_dec_ctx {
 	struct vdec_pic_info last_decoded_picinfo;
 	struct v4l2_m2m_buffer empty_flush_buf;
 	bool is_flushing;
+	bool last_buf_pending;
 
 	u32 current_codec;
 	u32 capture_fourcc;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..6cff75cd9f32 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -208,6 +208,34 @@ static int mtk_vdec_flush_decoder(struct mtk_vcodec_dec_ctx *ctx)
 	return 0;
 }
 
+/*
+ * Return an empty CAPTURE buffer flagged LAST: the end of the frames decoded
+ * before a resolution change. Without it a client following
+ * dev-decoder.rst waits for it forever and never reallocates.
+ */
+static void mtk_vdec_return_last_buf(struct mtk_vcodec_dec_ctx *ctx)
+{
+	struct vb2_v4l2_buffer *dst_buf;
+	struct mtk_video_dec_buf *dst_buf_info;
+	unsigned int i;
+
+	dst_buf = v4l2_m2m_dst_buf_remove(ctx->m2m_ctx);
+	if (!dst_buf) {
+		ctx->last_buf_pending = true;
+		return;
+	}
+
+	dst_buf_info = container_of(dst_buf, struct mtk_video_dec_buf, m2m_buf.vb);
+	mutex_lock(&ctx->lock);
+	dst_buf_info->used = false;
+	mutex_unlock(&ctx->lock);
+
+	for (i = 0; i < dst_buf->vb2_buf.num_planes; i++)
+		vb2_set_plane_payload(&dst_buf->vb2_buf, i, 0);
+	dst_buf->flags |= V4L2_BUF_FLAG_LAST;
+	v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_DONE);
+}
+
 static void mtk_vdec_update_fmt(struct mtk_vcodec_dec_ctx *ctx,
 				unsigned int pixelformat)
 {
@@ -403,9 +431,12 @@ static void mtk_vdec_worker(struct work_struct *work)
 		 * before the resolution change point ready to be
 		 * dequeued on the CAPTURE queue, the driver sends a
 		 * V4L2_EVENT_SOURCE_CHANGE event for source change
-		 * type V4L2_EVENT_SRC_CH_RESOLUTION
+		 * type V4L2_EVENT_SRC_CH_RESOLUTION, then returns the
+		 * LAST buffer, so a client that sees LAST finds the
+		 * event already queued.
 		 */
 		mtk_vdec_queue_res_chg_event(ctx);
+		mtk_vdec_return_last_buf(ctx);
 	}
 	v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 }
@@ -433,6 +464,17 @@ static void vb2ops_vdec_stateful_buf_queue(struct vb2_buffer *vb)
 		buf = container_of(vb2_v4l2, struct mtk_video_dec_buf,
 				   m2m_buf.vb);
 		mutex_lock(&ctx->lock);
+		if (ctx->last_buf_pending && !buf->used) {
+			unsigned int i;
+
+			ctx->last_buf_pending = false;
+			mutex_unlock(&ctx->lock);
+			for (i = 0; i < vb->num_planes; i++)
+				vb2_set_plane_payload(vb, i, 0);
+			vb2_v4l2->flags |= V4L2_BUF_FLAG_LAST;
+			vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
+			return;
+		}
 		if (!buf->used) {
 			v4l2_m2m_buf_queue(ctx->m2m_ctx, vb2_v4l2);
 			buf->queued_in_vb2 = true;

-- 
2.56.1


