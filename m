Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B70CCF2D3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 06:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dB0hdLpMxxmIDQktWS9HU4azdlYS/KX+Qbr0A+9hyP8=; b=AYwB8adZ1hXTiC
	8zwHNhxG+mWs6WZVfxQn6dFqtJuELXE+Ny/di0bAX41rP/zd8AeUNBP+PTzzr7L7zyxiPaE91xBDD
	zNGbGhowKPYFPwMQ7NU1Hye0/qmOORIHAtvFQ2GCX7NVQKCIH7tw21C+EXyS9oeI3X90zKyW+XLla
	1disGvhyBflmspqUZPSGsQXC49SEBg8qASd5H25EytA7G1HVFlW8VIj0LZJxJMbrW7Fyaho+Xd/+q
	Feszvl8dIFylStqSStvAApr3aJMeGoz5iB7lt7xcooCedVqUcSojnRRF3UokKFCdtyKBwlShRCD2b
	E3dSVT81xUzO2EIErZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgYO-00000006fua-2mZZ;
	Mon, 19 Oct 2026 06:09:00 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgYH-00000006fqk-1sQr
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Oct 2026 06:08:54 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-15dd124bbe7so3243306c88.1
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Oct 2026 23:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792390132; x=1792994932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dB0hdLpMxxmIDQktWS9HU4azdlYS/KX+Qbr0A+9hyP8=;
        b=SYp1L29T5Xbs7KVs4cUK+6t3NbEcrXIdqm7Qi21FnbRnKOttfOOXt9Ycg0NTibVyye
         AAKzjmpSnVwRRfMDmzDbty8JbvD7IwMmKsRUpOHTxn81LilEUC0Ke5xZMlKcwT9g6WGI
         526sZXdsYi6Ed0XR7Ayh3TTr//25Ea9ModVTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390132; x=1792994932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dB0hdLpMxxmIDQktWS9HU4azdlYS/KX+Qbr0A+9hyP8=;
        b=JCAQT2Jt3G9K6vdL7YVyQTQPZVkXcy4TCvuA1pFSA1RA+m4QzFo6cNwSZKWsOqWOrW
         OtvUmJwWICXBgyDRMhBtWXFvLvaMxg5QR9jmIm9g2JkS2VbPGLBrXs5x7MvMV4GPxYV3
         9Ic5UKomOSJ7yJd6/2u5FYkmqTEOItbIhEWQnVRbehIzTE5gFIFmfNJNe0ddJ0T/MMFW
         JVbCKRZXFzNiUjjmEgs+Vc+KePgcU5F+SaQdmRgjVKrmeemvM8zAlwJbCMI9W6fZbHzc
         yXSBR3zailgFjhcWwlV30p65ycZu3FijNEpYZ3VoqggohNGFPWRYuKGdaAbeurXwdKZv
         DJCA==
X-Forwarded-Encrypted: i=1; AKwUvBxnKBzJ2Pu2kRYTXA8PQB7N7Gycl27q3CTv8nQalP0wzwqHwgRU1Wx6Xw7brRSmBnlvNoqR/YfMpZFsXuXNOQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJr+Jj3LLpEXJH2k6CkqxF23rryJIwOCFzqS7O32DDfW6h3xon8
	DHk1OEus9VQN/ReEY7e9ABqezIAeSlJ7pAKRxZY0d8ymgZB2q/adS0FmaVSfm/fvGA==
X-Gm-Gg: AYBFou24Ar8J+LLU0x/5XnJilIswKA5OybSqUKKNX9ERtNFykFec3t2ihM0yXWNP7gJ
	MFJ5W8Ys7seVK7EXaNVAlo06OdFjmp/yPlev9V1kw1ct3bHGDcI4vIvJARr+ivwet7HLW7kh2OY
	lo/uOiXMMZS1+4np1VsmhV2NthgmfE8/JaHH/p8UwcmvdW9op/XkX7UReRDgclQowGbKGxNCYNg
	FM4pR8TOLIfSym7M3bIm/RK1IiTJwyqJHSnY8qyg6uO6IzbEVGXY4P+yLsLIH2xxUNGHr/eTsmb
	yB8LFXOmjdwhVbI+3qkdvQDOMrYgyxnbmZJigmJfMeXoiza4dvx605InHNL61ZrLjxrEJcD/dUj
	GF5/qcAol31G3GcnkqbkAAYXdcJJdAhedIjw7WvCUqJdjY2rQBU/g1JkZurR/KvztGPRM28L68E
	PencWdYivpP0/gxGy6DKb9+tV8BLM4XczR8fFoFz0ZmBfdHeu/1c7izTI0VyquQXiDulpxB2Z66
	dJbZddJIARwe1J20Nr3FHZffbdnXpiLaiwgxWWJB6jP0HVElMVH+c3gIMxnanRaZDCowQ==
X-Received: by 2002:a05:7022:7e83:b0:144:c12b:dfc6 with SMTP id a92af1059eb24-18514a0bc6amr14145162c88.44.1792390132416;
        Sun, 18 Oct 2026 23:08:52 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:b024:9aa2:76e6:57d4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm23281190c88.8.2026.10.18.23.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:08:52 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 1/2] media: mediatek: vcodec: Return source buffer on NULL va in stateful decoder
Date: Mon, 19 Oct 2026 14:06:19 +0800
Message-ID: <20261019060825.4163770-2-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019060825.4163770-1-fshao@chromium.org>
References: <20261019060825.4163770-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_230853_479260_F5DE12F0 
X-CRM114-Status: GOOD (  13.00  )
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
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_vdec_worker() peeks the source buffer with v4l2_m2m_next_src_buf().
If vb2_plane_vaddr() returns NULL because the buffer has no kernel
mapping, the worker finishes the m2m job with the buffer still at the
head of the ready list. v4l2_m2m_job_finish() then schedules the same
job again, which fails the same way, so the decoder never makes
progress.

Remove the buffer from the ready list so that the job is not scheduled
again, and return it with VB2_BUF_STATE_ERROR so that userspace gets it
back. Print the error before that, as the buffer must not be touched
once it is returned.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Fei Shao <fshao@chromium.org>

---

 .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..a4cbb7c76998 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -348,9 +348,11 @@ static void mtk_vdec_worker(struct work_struct *work)
 	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
 	if (!buf.va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		mtk_v4l2_vdec_err(ctx, "[%d] id=%d src_addr is NULL!!", ctx->id,
 				  src_buf->vb2_buf.index);
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
-- 
2.56.0.176.g3575e65682-goog


