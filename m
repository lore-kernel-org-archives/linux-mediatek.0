Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68DF606A322
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 07:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IHsxQOI2;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=BWYg622k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RX5QqI3n5ogrFRt3m2MadlsumYyF5inLL/iD7U/ArZw=; b=IHsxQOI2jkV+WAF7I3m6oAcFd+
	cm03GbxYt8OtpVRWKYpkhOyzPN6k41P9inF4IRFTuftzTWgKoiUneC9FPqx7WBy93H9LbckA8USZ9
	xSx/f0e8v/3Mcf+GiX/6ub0wDOCQGnF/Ggl4Ta73apdfkDWtq0DAqHUlwjGEROjzAD+7PITXhTRw3
	s3YyMUxuVq7ChB52jqs5wJbX3a3xiMTFOBpwSxMuDxU//3gJaaMQLNV0795X2Y58h7DNPFqnBnBKA
	QO+mhrMyxi7wVrBDWZ/U8GYlYTuFb44cLZIH+7qJN/ppNOgHe092Sh+m66XHZ6e2mB7//TUglQmwf
	GTRQKFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA97-0000000FpVS-21yV;
	Fri, 23 Oct 2026 07:57:01 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA94-0000000FpRl-1Sy4
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Oct 2026 07:56:59 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so357140a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2026 00:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792742217; x=1793347017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RX5QqI3n5ogrFRt3m2MadlsumYyF5inLL/iD7U/ArZw=;
        b=BWYg622k1PSaf70JhHJVQ3d8uRvABGu/fnsE8TMTjMcWZPLLGMi4t/ZYisFzkaSvu3
         EyfZEYa633GQ5gOn+wRucSypjSrn/96vJkbbW4OFRz8J/k/+zgrFiDuR037KgFEa+IOw
         weJcYuYlg5FzsRXS6hW5GtEfu4hTTB15eVijQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742217; x=1793347017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RX5QqI3n5ogrFRt3m2MadlsumYyF5inLL/iD7U/ArZw=;
        b=X0i5obB+d5RxX93drUvjpag5x17/spRsci23ax68SFCTz195sdEqvkot2Di0hQSjW6
         Zgj2Nr3gKYiUoUJZ2R9LkHF2welNlwR1uuE0pc4pc7lfqA7AOZWXYyQYHhQCAQDIP0Bn
         UvDS53Bbp7/ZWR94LesDkps98UsP/nk+Kd8BUCoU3yfUfmGmkoDhoPR3QhYBDiebBxZQ
         /vLqmaiYavHac3qqRhKXsaWgHZqiU5slTAvdRMOLATg6ynnpngdDV7lFB9+Dn6zJgkJ/
         HDe76LkrUPrj24pyn30sKSNYysVAKrnKyI7oJn3cKi+T5C0vNmfaC721Tfp4vO/VQ5jV
         kF6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzwtIfUT4x1olqayuSkdk3Zm0JK8MVgaTEmiAgTK5sgvv/5IYmpljFhE6z39YflTgelTNnlFnnijiJoBDCr3A==@lists.infradead.org
X-Gm-Message-State: AFq9FYI2MLkBFRBbrp0G9HY1iPN+16fXZJkZLjll1pgY/16nvZSsf6AZ
	QOSKgkX9Phs67zJe5Zr1kOmwmWwLyxuyMQ2Ydo9nzx6xtDgATjNwvH70K8Tfw3haIQ==
X-Gm-Gg: AYBFou3/E4UyesaDJDsURh3PRfmfUVqjqOxIS5xWFf7hA7SKrrLz312xmsyWC6LZuin
	kQDgkPrAi0UIkZhnXOy4NLaRHFuwg5frybuXiNUzO9zBfPnMh1AnY1iNjAiQ4hI4TUle+J283YY
	wZRdJOqeOXm1t/gPPtWcNF1DsAoiouu+UCjvgnpC3nq27FwYkr+xZu2+ATh1/xm8CRfxCvy550w
	TFG/jyXfGaKdAAwvM/1kz8aDqQi/GYUV8YRKwevtNlzqU+bVeuoq0twPScgeAlFtckOkcB9eaf8
	wL4G0fQdji4SDTACeI/3ofR44gEEV1YloMhWx/ptQpLMVbBxiK4QyXvpk5cK9HAfuGDYcaefE59
	5vKb3Fy1SUt41CeVX0UublaHLQKsPSI0qPYDDCyGPEnTUR+8xS0T48n7m/Zt6MdoznMfR7N665b
	OIT/j1ODkXBrQRHUs0DuPqjqNwWbTAG18Lhe3puULT6XkqSnp+B0tvp9wzmSoK6efdWiwoO2Efg
	5U3tUmuKEjfZYnErHqUlW750mnZmw97PzQyRugboAc63kP7iNkHItGmv5jwLvVSk6G063esn0A0
	wU59WCfn6XaSFR6dycgFv0ZveHc/X4Gk/5ke30h5OzpLg06DOg2Y94yokhp9
X-Received: by 2002:a17:90b:3143:b0:3ac:a7ee:6772 with SMTP id 98e67ed59e1d1-3adce135020mr1195926a91.63.1792742217327;
        Fri, 23 Oct 2026 00:56:57 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:203d:7:2210:4aae:b72d:9083])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adca08e785sm2483537a91.0.2026.10.23.00.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:56:57 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH v2 1/2] media: mediatek: vcodec: Return source buffer on NULL va in stateful decoder
Date: Fri, 23 Oct 2026 15:55:19 +0800
Message-ID: <20261023075642.3671805-2-fshao@chromium.org>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
In-Reply-To: <20261023075642.3671805-1-fshao@chromium.org>
References: <20261023075642.3671805-1-fshao@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005658_411278_F1F0270B 
X-CRM114-Status: GOOD (  12.35  )
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
Cc: linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

(no changes since v1)

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
2.56.0.257.gf7497c7d27-goog


