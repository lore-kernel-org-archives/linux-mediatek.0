Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4E5C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2026 12:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X/P0XI2f+jIz2x5Bw9cZxHv5AndciwcR9koDyZ8FmdY=; b=EDCJwpVUsuOA5mPLvRfoHJ6KSz
	VT6dxYkv+kx2cifrrj63rO2ilUp1kvXEa86w5VFbvNpZa0pJDS6wv7gg5jFdh3tmTnhqbX8eCQW9c
	9zYoYcX1r15CrtXTamfVwJZF1h5Xolq3YX8iusjwS0z0idksi7RxEAzaThso7vboBQvAPwl8pVIgQ
	9TWPYJuUD1WwXhl1Jgxitrn0ySouPs1UJ6DNLk9dg9vtrZD5/ymTlHBjDpwRqM8ev+tw/6ZY3+al7
	RcE4H9I5foK+e+zziG7w2uB7tyYpDL67MLT4mNKPa2pDlaD6lH71/ClHzLpgZCd172fJujKyWCFdF
	rPFZJojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whR53-0000000H3wW-1x6c;
	Wed, 08 Jul 2026 12:08:45 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whR51-0000000H3vV-33A8
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jul 2026 12:08:44 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2caf228a910so4067465ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jul 2026 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783512523; x=1784117323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X/P0XI2f+jIz2x5Bw9cZxHv5AndciwcR9koDyZ8FmdY=;
        b=npHLKXMCZf1w8s7W8+b9foi/zVHcPzJvM91nn5BHEEQkgjm3aJqtXdqtHQFMC9RLtC
         TMPbUaFExlxc7Tchczn/YFqe8N3Bzts7Lrwnt9xy2lWx6g8CCBeyFo9pXgoYNnB5BcX1
         ot61mdVi8DrMp9hJANMlKuM22nnBozNsPRyIUTB7am04op5/gUUjDeqY/rQipJvThmt7
         A8LNtowhG1lQr4PnREwuKfxqe6/y+R8j6LIAKeIsxr0WAPtTJthOPv5MyD6Etk4ncWBJ
         Jh2rgGRq/tYzlqKyaVzLeelKFRAplBfkK5MrtjRPVqF2rISTnkoPm+KS5OYQbM+qMlzi
         FWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512523; x=1784117323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X/P0XI2f+jIz2x5Bw9cZxHv5AndciwcR9koDyZ8FmdY=;
        b=A5j2R80MmkvRZsTwMhK+PNmaL+0vwxUNCN0GVy/6bGk3oudCJgl1gqi2dlRlL/ul4Z
         iSZpVKqJmNx+02n7AulI4y55jNydStwYjp0HQMJ2FRXMiWaA3G/0bENl8kbxMH13+EGl
         31B3WgK6MMVts/e5LOliCKB4qCq3CVxZp0jh40fBBm/u6fw0i1KRk1siMjTJzxPQMyGV
         +qucK+YzUzoedtzjed/0NTGwe3p+grZqbzNVmDaz8zYai3O4taXgS3+r8bXRxRyFwE0b
         YOzXrnN1t7ft8gVSmJ9rJHnY2ZXa4pdz1Ngg28z4+7BPEguj/mV5C3ULStfnThX2qDjI
         qVaQ==
X-Forwarded-Encrypted: i=1; AHgh+RopjTKuL/lc5k1kT/P/eikKCcNfS18mN1Hr0a7knl2AgG5F2B0+1kqPHTMIiD3HdDTdnUSPmVMVharT1oWXoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YweCfgMXFDFcSeBjyHjck+sGTtoShGsuY8sf80vXIg/qb21CyP5
	UZ9JaTpvd8AyHGKXKo0M2YF6tI7xUtbURZvLqgVo8Y+DxF8U0FjjCyeltS+kI53qxagsYw==
X-Gm-Gg: AfdE7cno0d6iZSxwHb+Gx1jD1EpW3hBr0BTjZLEWe0Hlk4rQuve06tq5W28uIrRIqHy
	6HaEGNAAAx5bmKD/Pj9vkqK1kfwUMQelMTubZDHiGIUSIUEWgyNWLP20IWArTqyPN9V4FYX8XoJ
	Y3dzW8F8aA9GhuR59S/WKgQwzXBRs03TWmjYSZ5G9JCgZy91KFXjf2YDIqEomiOAHsbSYskjZ/X
	tFZG+D7FqNthEbjdxx3QGjM7VsB0YHvyFxK4iBSXhU+LZr1+HWVA04uZWEQuIer2hLv2ekNC0m1
	y1J1KMzDfYUAK7hkFGs+WZCovZokafFFqbAd1iB1SPnu025gqeTHclpbbVR7ox2ll82LpHdYSX7
	PpLyPakNWFVPBE5EkUCsjZcTBGFkEM7b5OaTm74I7wnzurNN6Y84zG1DaKijpKdPGDblHyHEUHf
	DZPtkJj4QWyA08ug==
X-Received: by 2002:a17:903:fa5:b0:2cc:a977:4260 with SMTP id d9443c01a7336-2ccea3b0e5bmr25272395ad.21.1783512522781;
        Wed, 08 Jul 2026 05:08:42 -0700 (PDT)
Received: from lgs.. ([101.36.109.218])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1f030sm27088705ad.51.2026.07.08.05.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:08:42 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Fan Wu <fanwu01@zju.edu.cn>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] media: mtk-jpeg: drain hardware completion before freeing context
Date: Wed,  8 Jul 2026 20:08:33 +0800
Message-ID: <20260708120833.755998-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_050843_778333_AA9D2D3A 
X-CRM114-Status: GOOD (  12.84  )
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

The change referenced by the Fixes tag cancels ctx->jpeg_work before
freeing the JPEG context from mtk_jpeg_release().

That prevents a queued or running JPEG worker from dereferencing the
context after it has been freed. However, on multi-core hardware the
worker can program a hardware instance, arm the per-hardware timeout
work, store the context in hw_param.curr_ctx and then return while the
hardware completion is still pending.

In that state cancel_work_sync(&ctx->jpeg_work) can complete even though
the IRQ handler or timeout work can still recover the same context from
hw_param.curr_ctx. If userspace closes the file before the hardware
completion path has run, release can free the context and a later IRQ or
timeout work can dereference the freed ctx while updating the done queues.

Drain the in-flight hardware completion state associated with the context
before freeing it.

Fixes: 34c519feef3e ("media: mtk-jpeg: fix use-after-free in release path due to uncancelled work")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec483081..bc9eea0483ce 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1202,8 +1202,11 @@ static int mtk_jpeg_release(struct file *file)
 	struct mtk_jpeg_dev *jpeg = video_drvdata(file);
 	struct mtk_jpeg_ctx *ctx = mtk_jpeg_file_to_ctx(file);
 
-	if (jpeg->variant->jpeg_worker)
+	if (jpeg->variant->jpeg_worker) {
 		cancel_work_sync(&ctx->jpeg_work);
+		mtk_jpeg_release_hw(jpeg, ctx);
+	}
+
 	mutex_lock(&jpeg->lock);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
-- 
2.43.0


