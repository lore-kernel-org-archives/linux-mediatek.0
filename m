Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECBA606A31A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 07:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oj3Mkjgf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=b8IMOZR3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lcSfZoh2GdSZxoMIwbjzTgmOBV7Hx3Y2JlLufTmLUeY=; b=Oj3MkjgfC3+SfnPLCcS1ucbxiV
	hJ5OuPYlesQHwKwOiOmT9At3szQGc3BjajPb26NqaWSx+xEZ9hpNd+fZLcvep+mGi2vw8hlwcPc/t
	S8HaEmPjWgnsRnX+GNrmWUi9ggyFFIpTaxxMHXS+CCjS7pvjQJUFS06XB2imOBecjsB+g6UcoP5wP
	/EjgWm05eudaVEoRBb+OczlLw1SGOmEbeP/Jnld+OP/lo6jIoJUP1F+U7N/7iNloyf6xV1c8F4BdT
	tyd8GMi6gUmd9YTMjOZuVAVA9OpCFoZOoRWQzEgqMq0dY0VsGVNXorjeH6VxwmwyTWyNZ7DMJjG+C
	SJfbEd+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA9D-0000000FpbG-3XSJ;
	Fri, 23 Oct 2026 07:57:07 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA97-0000000FpUC-0OM7
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Oct 2026 07:57:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ea7987517aso2949555ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2026 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742220; x=1793347020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcSfZoh2GdSZxoMIwbjzTgmOBV7Hx3Y2JlLufTmLUeY=;
        b=b8IMOZR3TZ0K4InR2BNOKJYDMJmxWbIVr5LvYDSwNaXBVu8JBrcMFcQF+ouG8u0y1u
         ymFu5zxOiGz6WHHRq5ONz2DSJ4reG7QwkPME9X7GNnv5SMYffD7deAqketaaQUaBnFys
         VSBFViobp8oGVuQDssgFdLDyH4Aa3nBGz/GA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742220; x=1793347020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcSfZoh2GdSZxoMIwbjzTgmOBV7Hx3Y2JlLufTmLUeY=;
        b=luvfGqqKA2vjq95O4WV9AHy5PGNWcYfnb+sKYH8YmU7W6uPVVEzpX8S68Emj0xZXLo
         thw7TY+e9XFuUUcVr1RavEHz0iu8rzuBjZOrsI3cos6LaUEFV2sv0huGNNf+c1Tm2S6q
         zXsO4YUlKnFXKY8O6PnAq+FAMEEmChf2dTdNbdDjRHk88IvOEWkz9oYCZ4R/qQHeycVU
         72Jly0HOSGlPHYZFr4fbBP+cTVPppRFGjw2HFXquCJ9rJQszMqPyOqC1Qlpt0udB52vs
         FhirZ2Squ+Lh7388lMOrc3M5y0YBRTVT7qKou7sgUZzgUgq21W3nPFzndJ7iwxSk5Gs+
         2aSw==
X-Forwarded-Encrypted: i=1; AKwUvBwEoOU01sQmyiRsafF6Kb3jfetV9oz0z7rsnhEadv4m9PIaqhbMVUqTkgAjrLRXJHiYUgJ4aX9SzQvgZyDrsA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJcDSXRgBaW8Pt8/hKHTdPg8jCDc1nKwZZvS/A9bZ8BiRnsbdQh
	DbiHCQ8AXj0UdrXuRynteX2sqtjCPJ6Fbbxhf8CZF1y3ndZmiSQxMUbpH8ZU+CB2Rg==
X-Gm-Gg: AYBFou1FJuBuGFTWkFYreDHwAVvo2CaT0ZhiURhaG6on2NwQgjdQGUK/2oasSNvpoWH
	yMJtTyQV0aZQNcZ59cjtyqeWe0Hk4IWUa2YpxB1baecMC6B3xnJi0VMR8C/sJdgnvV79snWYOPj
	JQp6CsMX1RXP5RuP6mPGqelOomDm310B6wWy2ZL4GteJMEczZsweehIgNvXBOQDBPz6TXvllQ5u
	5Ad6zsbrRsiSQ3/OW3f51YC00zs72aEEWqmHVKVa/FvKWXmdH5qBZ4BhDZd872kEGyagtycpLrV
	oWoW9BOpcdW+8KTrbFdxHP29E9OJKG6ZQi67O2/fMaOJzbOa8F3qIJ4TmvOcosRMJwki8GqT0eb
	mGr1vUdK+6SkSLnVW1DCf5qWLBX2OShBve513rPPM7haLsBYtuDtnPdA6By7v97LmolR2SXQ+aS
	GJdhpKceuQuaa1tLYlKFvZBPFuffW+KuW07M9rgrykt5RU8PuXq9XWFDk0Zl/dueBDMPWWyX5r/
	XmPKuoJJV26Dv0KCkCJE1PbuTIF0gKnALYyfeK8fWqJ/yPTdnNvzttMAuuiovEjYRGV3dXmmt1i
	suWjji9T7QxD1DIFHA37klTWlM5Vkk0hVIjhfYE=
X-Received: by 2002:a17:90b:4a92:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3adce7a6682mr1200815a91.22.1792742220188;
        Fri, 23 Oct 2026 00:57:00 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:2210:4aae:b72d:9083])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm2483537a91.0.2026.10.23.00.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:59 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH v2 2/2] media: mediatek: vcodec: Complete request on NULL va in stateless decoder
Date: Fri, 23 Oct 2026 15:55:20 +0800
Message-ID: <20261023075642.3671805-3-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261023075642.3671805-1-fshao@chromium.org>
References: <20261023075642.3671805-1-fshao@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005701_167510_18D85FE3 
X-CRM114-Status: GOOD (  15.68  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If vb2_plane_vaddr() returns NULL for the source buffer because it has
no kernel mapping, mtk_vdec_worker() finishes the m2m job without
returning any buffer or completing the media request, so userspace
waiting on the request never gets a result. The source buffer was only
peeked and stays at the head of the ready list, so
v4l2_m2m_job_finish() also schedules the same job again, which fails
the same way.

Remove the source buffer from the ready list and return it with
VB2_BUF_STATE_ERROR, complete the request controls, and manually
complete the media request before finishing the job. Look up the
request before the address check and log the error before returning
the buffer.

Fixes: 7b182b8d9c85 ("media: mediatek: vcodec: Refactor get and put capture buffer flow")
Signed-off-by: Fei Shao <fshao@chromium.org>

---

Changes in v2:
- Call media_request_manual_complete() instead of
  mtk_vdec_stateless_cap_to_disp() to avoid dequeuing a capture buffer
  that may be in use by the core workqueue on MediaTek LAT platforms.

 .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
index ab1894fba0d9..402d20572f2d 100644
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
+		media_request_manual_complete(mreq);
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
2.56.0.257.gf7497c7d27-goog


