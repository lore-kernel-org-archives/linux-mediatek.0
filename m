Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF966CCF2DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2026 06:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhnH2Fl7Ngxx8M1a91ckV8yYy0vtR+vF5EQHpmiM6YM=; b=akUl6Z3tr8jqce
	Ctpcr68SWNmocNiqMxBWPu3dL/oGsL+Gk3Ou6TIdWX1u/r7hGs3LtBhSD19OusCe0Kfx2hWsumcBj
	tVbxwymsF/f8hHN+CCQfsFroiVRTJwBnqpqP1J+LX8bwRhbn1VFJ4LLCp6xAc6AdmSNXg8To83ZlW
	scW8RSj3Euz8VfWfTAsm1uKbPmGRFmXIgSNclurxoOu6hFIIO/Rod5sbmjQFb+MzqajwyDplHPOVn
	1UCmBQIvqwV/R1KbmiabCtYxrAoXoU3I6OmzIpH6b/7jaL4LlASD9SsG/5e3+UztWk/jgQ4iw+u2Y
	AgZ5VAimNC7GxUsseAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgYO-00000006fuk-3MK9;
	Mon, 19 Oct 2026 06:09:00 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIgYK-00000006fsV-18q0
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Oct 2026 06:08:59 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5019131eec.0
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Oct 2026 23:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792390135; x=1792994935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KhnH2Fl7Ngxx8M1a91ckV8yYy0vtR+vF5EQHpmiM6YM=;
        b=O+276bPyF9AFSlpgAGEbOuH+hs6B1g5hc0obyECs2nNlU6Fze6tjrnoeFpc1dPvrVX
         S9kOuGiFmB62VptF8doSdhz8PC6tQepY1dPCktYEfju6YG7M8nBg3zs6vLoAKfLMGJPt
         psLuw/VttnSn4eAdZCRIZS0DXlt2fkVkEN3Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390135; x=1792994935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KhnH2Fl7Ngxx8M1a91ckV8yYy0vtR+vF5EQHpmiM6YM=;
        b=C5N92NHSJILfCJ3zvfeB0VWbfcgOJpnTdDK4iPgoqp2IO26RKEVa2NP1NkJPYXPQFu
         WdnEryVMFxdvzgsJFQxAe+tGhquyvbLte+O3YCj05iubV/u+s8APcdIDzFuV6oMjjCF0
         DJYUUgBP5BhXQOv6evSDtZDYaUnzy3ROi7/v2fnBKO1vKp1d/EBPADOfnxCCjRYHPGVd
         mIzmiiCFFpFpW64CveHiwAjE52bvH+SNJKxOlDnpG7h4AZZrBIk3ZxaIQiLP5qu0ZOIi
         cFt2Y3YJ8tBWLVEgu9BjOMd63yh4zP8so9QgFOxR3DqhtauyOpmbBYG0tj+5UThA9dNN
         VlEQ==
X-Forwarded-Encrypted: i=1; AKwUvByrXDP/rsC7f/QAkWwoCHhoeESY29s9IpCG/b9QIBwzNGqnwNo02vBkzqyVHgwaEUmpPuCmP/xw80DgGH5UsQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJuqyuwRKD6101GRQHCm5VlGg8B2haxhFkao+xk645+yurMrZRQ
	Z0Y22+Xx9DsizikzqPRsZsLm7Waol+VbqI/NEAV6ygT6YTtommvBK3t83QYmpaYeFA==
X-Gm-Gg: AYBFou2l21DD8DZ0nKGz4IoTlwSI8WHocNv9ajAkmkaHRdKtbZhEAJxHKlQPg0IGt6E
	r9S8ZtEDrBP1u1/1ycF/0xJ/qOi/lB802swvbvgqFU8Hu0E58j/hTJBiQwTLe8YAnHVvT/euG5q
	55MeUP2ckeztSG28b5wsF6HoJztpHFeYxQlZA/W5XrHHOn6H5ieZLi1RnTGIe7s4LNf/ppxcP2v
	NJd4/84ZfM9wMMv22D9bxx0XAYWUY1BQ/iTETaWGzNtk+Nh8Uve5/s2ZqNphSQIxG7WtfDwP6Ai
	PyR1971M+dmqbicJS5qN1i8R4joR8EvOf7Jc+JIJ+mXgVXVsslDcNLj+rwAOJJC7SDgnO9v2B2M
	TMO1wkJzDXOM3xNc4Jx0n3YsZ2KqLBolc/6lFtNvcMbxp5fruXjPgVwLQh6JzAczBbDv5fnljQ1
	r/GzyVG+zodny/CheGH3CzbiTBHpNJX55LXMrME+UIW8389gxpjZpLwFB8hvyINiGKpXkPBV8fQ
	uvD9Pf2WUWg7DO4yhJbPAlPFg4395nZAMDlhR8CNsix3DmGaOyYIaNacQ==
X-Received: by 2002:a05:7022:28a:b0:150:6c0e:2ce2 with SMTP id a92af1059eb24-185139aa4d9mr10544613c88.31.1792390135205;
        Sun, 18 Oct 2026 23:08:55 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:b024:9aa2:76e6:57d4])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm23281190c88.8.2026.10.18.23.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:08:54 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 2/2] media: mediatek: vcodec: Complete request on NULL va in stateless decoder
Date: Mon, 19 Oct 2026 14:06:20 +0800
Message-ID: <20261019060825.4163770-3-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261019060825.4163770-1-fshao@chromium.org>
References: <20261019060825.4163770-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_230856_324125_FF4685A4 
X-CRM114-Status: GOOD (  15.61  )
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

If vb2_plane_vaddr() returns NULL for the source buffer because it has
no kernel mapping, mtk_vdec_worker() finishes the m2m job without
returning any buffer or completing the media request, so userspace
waiting on the request never gets a result. The source buffer was only
peeked and stays at the head of the ready list, so
v4l2_m2m_job_finish() also schedules the same job again, which fails
the same way.

Handle it like a decode error, which takes three steps:

- Complete the request controls. The request cannot complete while its
  control object is still pending.
- Remove the source buffer from the ready list and return it with an
  error, so that the job is not scheduled again.
- Call mtk_vdec_stateless_cap_to_disp(). It returns the capture buffer
  and drops the driver's reference to the request, which completes the
  request under manual completion.

The media request is now looked up before the address check because
this path needs it, and the error is printed first because the buffer
must not be touched once it is returned.

Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index ab1894fba0d9..c97835f50ca1 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
@@ -342,23 +342,29 @@ static void mtk_vdec_worker(struct work_struct *work)
 	bs_src->va = vb2_plane_vaddr(vb2_src, 0);
 	bs_src->dma_addr = vb2_dma_contig_plane_dma_addr(vb2_src, 0);
 	bs_src->size = (size_t)vb2_src->planes[0].bytesused;
-	if (!bs_src->va) {
+
+	mreq = vb2_src->req_obj.req;
+	if (WARN_ON(!mreq)) {
 		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
+		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
+		return;
+	}
+
+	if (!bs_src->va) {
 		mtk_v4l2_vdec_err(ctx, "[%d] id=%d source buffer is NULL", ctx->id,
 				  vb2_src->index);
+		v4l2_ctrl_request_complete(mreq, &ctx->ctrl_hdl);
+		v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
+		v4l2_m2m_buf_done(vb2_v4l2_src, VB2_BUF_STATE_ERROR);
+		mtk_vdec_stateless_cap_to_disp(ctx, -EFAULT, mreq);
+		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
 		return;
 	}
 
 	mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=%p DMA=%pad Size=%zx vb=%p",
 			  ctx->id, bs_src->va, &bs_src->dma_addr, bs_src->size, vb2_src);
-	/* Apply request controls. */
-	mreq = vb2_src->req_obj.req;
-	if (WARN_ON(!mreq)) {
-		v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
-		mtk_v4l2_vdec_err(ctx, "vb2 buffer media request is NULL");
-		return;
-	}
 
+	/* Apply request controls. */
 	v4l2_ctrl_request_setup(mreq, &ctx->ctrl_hdl);
 
 	/* Keep a reference so that if the processing completes before this function
-- 
2.56.0.176.g3575e65682-goog


