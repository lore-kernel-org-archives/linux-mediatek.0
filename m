Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A08606A33A
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 05:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Etl0HcFN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VWLWlaR2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HcVK4QLyG35uHjO5ETCyA4fpt6MBDPBpxxzf/iYZMFY=; b=Etl0HcFNQP79NJ+ciC/LHARASM
	X8h5pVv0lETsnMUQYb8ffKFSWbbWDg1gaiJhwtoTVGiQhm5qLG+ZQaW3ld+yuyyU2jbZBKWPA1m29
	qH2JuXsnpFj7cAMMbETqOrkT8HHS1f7jzAg1pDVSrUTeGyoZDwrmcn+G9RL4zdWVG4DcHlejejJEB
	GWUBwDXkTzR4JGpXouwrhlFKRh5RJdR59BByJykbO/RS72b11Z6FhT8ACKuLmgJCo8YRjP5jhBhmi
	/5WeOq56gP7HBT8mX9djaizyAD5vv490Ajqw2HfM39ghvCax2IqbyGjklkgkbLyVhVZnYlPeQVlnz
	w5SuXsVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWodz-0000000Ey6S-118i;
	Fri, 27 Nov 2026 05:37:11 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWodw-0000000Ey5X-1oqV
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 05:37:10 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-3866a784546so10565351eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 21:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795757827; x=1796362627; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HcVK4QLyG35uHjO5ETCyA4fpt6MBDPBpxxzf/iYZMFY=;
        b=VWLWlaR2Os9gVlOhpGMtTV5UYWac8LmVmHfSD3aCmzo6fTRrzXEug44rNmvBd51vS2
         a57ieuZ6Tu8eWp468D0jnd6pmgnt6526Ri1oP845/xCbgMglPqZ7WnH8SgwB2t2QciSn
         p6TdIRj7evGJe2JMt/7g6AB3P3Dy/E4/d9d3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795757827; x=1796362627;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HcVK4QLyG35uHjO5ETCyA4fpt6MBDPBpxxzf/iYZMFY=;
        b=2a1bl8jJm2L71D58B4R2WgIJCh1dfEXEXZLQdkKm0VSmIm0WMdMukXwhvgy7i8kfdj
         vjDqDGc8hDVFHQwbl5rtflE0r6K3dvSZAD31LJ3M85GDm31fw8U3C34xfJddgMe7FGQn
         +Ea+7BH5GYgxRnUCh+RKYmuZ8e970w3EQ1hXAb+AegSuuv2JwuDMyL/UI1+EPMjvGKfm
         3OwJONSvbiqI39V+wM7hnn0BhgtuK8dlCCBYBOXekk/zzgP4hJAS1BXYrjCCxKWuIq52
         /yZjDTKFnOzZQgQPOl4l+IfTqGeH6bC2GYYxdv04UfuZKiYWmYoFjcZ9Bb4wU+ngh2LQ
         YEEA==
X-Forwarded-Encrypted: i=1; AL+hErF0U+0xJOnoeBIWRjvpS5Ycf8Bz0fdaghFZ1N02ivnY5zHwXEZhv0FcV/UL2n2dV9LIMAJlcx39KS1kHCn+KQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8vLxn1Y0hBr+e2x56mtaLKrWX9A+GaR/tqxxZiNwmBEV7xz0sL
	D0CHr8d/lcmnvdBukB/l0E1Rrj5YqqNVWO7NbtgbvFEzVuASTzmJ2hCOhWFoUrjaaBu/8GCfIuN
	bNhN5kw==
X-Gm-Gg: AZFdTZcI9hoHxpS2yt+/3oMkv70OFuvZhq9MbnSlHwCwnZmp+3JeqdI2VWTwUlYq6l7
	RLt+eDCf/nGAY6tosV7JebzLy19L9tTZ25CA4it+ivw2RudSZ/tPHXuyKW9oGT/mMmPr7mFwwQE
	gtZ6BZwxowG7HsIr4jfIlt7T+rglsM99QsH+16cnMnC/gkzRLudMmdQLFZNuY0Awl9Vdh2rQqm1
	JUfQ+p+xNgbOqlWE7+6lAaL3jgTfNaOTcBDAd4AxXdOpRmpRzuuyhC2ID7uczUoUHgjGz5s8k2y
	b/wCOTWfLlM1UXWW8PtxVeUpAU3DNUM4b3eGrRLYSbajq6feKDCjlxox+Cz18dEOhgbVnQRauYf
	z9Gu8m6iyMz2Z5F5P/crSkDEm6div8ih1MjeH4c1TEpMXL1MmTjDHUSgL7Sow8dxD4DvZsQJlnn
	gQ2b0riO7Bc6+5/Nv5MOehcZbO7EZ7z/c6iSwLsJ4Wt3JbHFBliDo2BPs8HsrMNdPqJcoYN30od
	/rEhxw7FwfuhSYhbCJzPyq9E2Su+Dydt/JMgrdk/yIyn9xnVhbFHgX2f/ArORlLYwzCKcy7Q448
	1quJeReRMjsClFvxzcaTrPezwdnRc7XU0FPpMBtA2I7aDBtYHStZ3q8+aYkkL9qGVQHTXnQUSkW
	G+Un1NrI4+z8pgM8kagN14A==
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr26792280eec.14.1795757827391;
        Thu, 26 Nov 2026 21:37:07 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm83106035eec.5.2026.11.26.21.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:37:06 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 13:37:00 +0800
Subject: [PATCH v3] media: mediatek: vcodec: Validate source buffer vaddr
 in buf_prepare
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-vcodec-null-va-v3-1-e24521086062@chromium.org>
X-B4-Tracking: v=1; b=H4sIAPsWCWsC/5WOyw6CMBREf4V07SV9SEFX/odhUcuF1iA1LTQaw
 r/b4sK1y5PMnJmVBPQWAzkXK/EYbbBuSiAOBdFGTQOC7RITTrlkjNcQtetQw7SMI0QFuqOUNnj
 qmZAklZ4ee/vahdf2y2G53VHP2ZITvXcPmI1H9RNTLmhdySMvhaxZQytg0Aej3EWbFLfLo3R+y
 G1jw+z8e/8beV75y9Bu2/YBVy2uy/QAAAA=
X-Change-ID: 20261127-vcodec-null-va-cd0008e9f136
To: Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_213708_512208_A8BCDBC7 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If an OUTPUT buffer has no kernel mapping, vb2_plane_vaddr() returns
NULL. Both the stateful and stateless decoder workers only peek the
source buffer and finish the m2m job without returning it, so the buffer
stays at the head of the ready list and the same job is scheduled again.
In the stateless decoder, the media request is also never completed; in
the stateful decoder, vb2ops_vdec_stateful_buf_queue() also passes the
source address to vdec_if_decode() without a NULL check.

Add a vb2_plane_vaddr() NULL check for OUTPUT buffers in the shared
vb2ops_vdec_buf_prepare() instead, then remove the late checks from both
workers. Unmappable buffers are rejected before entering the queue, and
userspace gets immediate feedback.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
Signed-off-by: Fei Shao <fshao@chromium.org>
---
Changes in v3:
- Consolidate into a single patch.
  Validate OUTPUT buffer in shared vb2ops_vdec_buf_prepare() and drop
  the late checks from both workers per suggestion in v2.
- Link to v2: https://lore.kernel.org/all/20261023075642.3671805-1-fshao@chromium.org/

Changes in v2:
- Call media_request_manual_complete() instead of
  mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
  that may be in use by the core workqueue on MediaTek LAT platforms.
- Link to v1: https://lore.kernel.org/all/20261019060825.4163770-1-fshao@chromium.org/
---
 drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c   | 8 +++++++-
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c    | 6 ------
 .../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c   | 6 ------
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index d76e891f784b..a5c6b56be927 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -811,8 +811,14 @@ int vb2ops_vdec_buf_prepare(struct vb2_buffer *vb)
 					  i, vb2_plane_size(vb, i), q_data->sizeimage[i]);
 			return -EINVAL;
 		}
-		if (!V4L2_TYPE_IS_OUTPUT(vb->type))
+		if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
+			if (!vb2_plane_vaddr(vb, i)) {
+				mtk_v4l2_vdec_err(ctx, "failed to get vaddr for plane %d", i);
+				return -EFAULT;
+			}
+		} else {
 			vb2_set_plane_payload(vb, i, q_data->sizeimage[i]);
+		}
 	}
 
 	return 0;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
index aa9bdee7a96c..fbd5791e78c1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c
@@ -347,12 +347,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 	buf.va = vb2_plane_vaddr(&src_buf->vb2_buf, 0);
 	buf.dma_addr = vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf, 0);
 	buf.size = (size_t)src_buf->vb2_buf.planes[0].bytesused;
-	if (!buf.va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "[%d] id=%d src_addr is NULL!!", ctx->id,
-				  src_buf->vb2_buf.index);
-		return;
-	}
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, buf.va, &buf.dma_addr, buf.size, src_buf);
 	dst_buf->vb2_buf.timestamp = src_buf->vb2_buf.timestamp;
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index ab1894fba0d9..3d5f9e11a49b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -342,12 +342,6 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
 	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
 	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
-	if (!bs_src->va) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
-				  vb2_src->index);
-		return;
-	}
 
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);

---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-vcodec-null-va-cd0008e9f136


