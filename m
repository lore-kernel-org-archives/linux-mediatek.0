Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A36CD98D2
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 07:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tvO6+MpilClcYNX4EokLZGsJsErKgA+iDUMEt0HQsM4=; b=Xj9DwDjTuwtGAxI/j77m8bKYAf
	BP7jEPqTe8ve6RWvR/E9QFfNaZnl/tD25Wl6hn6y6E1daC9QErwO7cvZZMj1tEzgwbBQ/a4MKovom
	U+AOuIkFjLo/1Dx/GGaGHu9Il3ee0ZWHgicQAexHwvOg1VMA/LjUNVcVp7hqYHhtZEhhNE3O1V1I2
	W+7gekfIioMKHYYlBNusOT+n/8zZ98uloMM6Ltg3xLsEyJ+YUvFb1wt+avyavrwUR/t39evsqQC6N
	xwAxR83ygqJsZI9yAEXsWYE83sC+ry8RylvOSaxD3vNhgQIi5dsiQjSFg7mYLEC8c+EV5DTMtOYSn
	aWrW9e5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOfO-0000000FPLT-0qzg;
	Tue, 16 Jun 2026 07:57:02 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOfM-0000000FPKn-1Wu0
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 07:57:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-45ef4223be7so2387943f8f.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 00:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1781596618; x=1782201418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tvO6+MpilClcYNX4EokLZGsJsErKgA+iDUMEt0HQsM4=;
        b=IMBNnOmL+agRLt6TZya6Gru45zuB0P/bvgP1QVH5ctbK6WnX8mKZ3WvsG0lQegg76J
         Cyp75obuH8e7kUu4URjI4kKwsGxkeadiw4nPUAMMk0eA1c0CT+yvluQZ+/6mac4XC9fO
         0+k5lWb5+vZ87T0gGUYyXH8K8bBnIJUQJhn+jSSC9Ip9ROLmjbyO0Eyg03eQsPVoTNBa
         2wxv7+Jb4TjL3Sd0iLViI2qPDY3IHfOw0LVxgPvfjFH/PRRJk7XgJatbzXEyW/OA5laF
         d35GBKHx6hfpO3nUJcq7VcHKeHkXB4bA0F7IVeSFWteVPJ5Gd/UVxx3INqE0Xj4RFdx6
         En4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781596618; x=1782201418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvO6+MpilClcYNX4EokLZGsJsErKgA+iDUMEt0HQsM4=;
        b=tTKwA4j4UO+IqFFzcOpuOZYvC8pov31fPeXRlTaLzN2w1EA7+CIZKrVoPzk+1Ds/cB
         RdS74F5EIu4ViR7++qfY7VPMLQ+Neu0MoeoA259lDxeD8cmYre0mviYjPRE1/DdIMO0i
         sSX4UUePV04fDrvXNHw4g3yUGJzmafMRwAIROa9bU6l7MYgax3hRzrB9mdSuQ8r/FPIg
         YmSfGxVYlJ7f20gSmS7bOjkdBb+jWvdD7OLlzwAK+RSjOjFp7HFMuzk6hgkkIJkEIxbr
         d9UoiVDwMxdvZ383lT58DSu5EO00wBz9oMrIFqAvBD3HGpZ9qQ2mmU7u9/j+5JcumgZX
         Sx7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/iGhJBHc3WvDI+gkNWO9qlNh6D+QSksjuV9hVzd7L7e+Oka1qpHnOk+GYWERcX3GJBE1BVAPmn+slaACv8Gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbWtw2IRZwr73oXsNGcTYeWoULLeHlY5DiIWVXXIgTey0B18JP
	wvUuDJyqfNdVQdPr3+ysePs6n6YWvFOUFMCG7XMzgG6D2xsanViVp4OQB5loOuCRgOg8
X-Gm-Gg: Acq92OFMk0owyKSUOeizle+nOmmfRtuAhma87qXK6TJT7ulbsEOtZEv5szI/FLiJblo
	BpVbcgqfsdiDQwVlkgonnZ02D+nKWq6s5mYZgiACccaOx9NYbdVrt8A3PA5Dq2S0FY32Fx7YDp7
	6ZhObVKXDf2dZGBz19wd9gKBjRGticIzK7LuGjhuXwDQrYxCGOVxqbtjBgXUGZcOm1ZOqF7tzD+
	palmVJ2eyhLFdgT5hEUDEK5j0nsfSshPrwvmYHy+ahfplRsHKFJSwOzt+SBn4k6YE7nVhlQUhke
	xWjIG1iM2BlNI1ZgStrVmw0y8IcrZkea73vdPUl8R+oln1JkfDEDgioDQHuSaqLbCVp9FB2L0AQ
	AYy8T6J/gFXireFD/ZlaHhoKMKIOASJEQa5yqHpuk8k5Z4QOeCZ22OghOLsxXVJVC3ENhUKjbRZ
	3L5rd0caGV0wNu/wdCevN2x7UnHSESPqLEnd7/Ns/nwK/Dc+A1uPqJdeA96QgtCtqY7Vo2TGYQs
	Qt0KEuDBiKXnDDoOw/08v97K2/uAqvRpDjveqMJ/6RcJA==
X-Received: by 2002:a05:6000:1862:b0:461:b44c:a7a6 with SMTP id ffacd0b85a97d-461b44ca88dmr403954f8f.34.1781596618356;
        Tue, 16 Jun 2026 00:56:58 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c35sm43503294f8f.22.2026.06.16.00.56.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 00:56:57 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: vcodec: fix use-after-free in decoder release path
Date: Tue, 16 Jun 2026 09:56:55 +0200
Message-ID: <20260616075655.95711-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_005700_428717_FA2401DA 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

fops_vcodec_release() frees the decoder context with kfree(ctx) but
never cancels the per-context decode_work worker first. Although
v4l2_m2m_ctx_release() waits for any in-flight m2m job to finish, the
workqueue handler (mtk_vdec_worker) may still be running and accessing
the context after v4l2_m2m_job_finish() returns. Once kfree(ctx) runs,
that worker dereferences freed memory, resulting in a use-after-free.

Cancel the pending decode work with cancel_work_sync(&ctx->decode_work)
after the controls and m2m context are torn down and before kfree(ctx),
mirroring the fix already applied to the encoder release path in
commit 76e35091ffc7 ("media: mediatek: vcodec: fix use-after-free in
encoder release path").

decode_work is always initialised before release can run:
fops_vcodec_open() calls mtk_vcodec_dec_set_default_params() (its only
caller) unconditionally after a successful v4l2_m2m_ctx_init(), and that
function runs INIT_WORK(&ctx->decode_work, ...). A context can only reach
fops_vcodec_release() via an open() that returned 0, i.e. one that passed
that INIT_WORK. cancel_work_sync() on a properly initialised work_struct
is therefore always safe, even if the work was never queued. This is
unlike the 2023 msg_queue->core_work regression, where the work item
could be uninitialised at cancel time.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2: reword the commit message to stay within 75 columns (no functional
    change; checkpatch).
v1: https://lore.kernel.org/linux-media/20260615140526.52617-1-doruk@0sec.ai/

 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
index e936ed8dffbaf..30906b24c608a 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
@@ -313,6 +313,15 @@ static int fops_vcodec_release(struct file *file)
 	v4l2_fh_exit(&ctx->fh);
 	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
 
+	/*
+	 * Cancel any pending decode work before freeing the context.
+	 * Although v4l2_m2m_ctx_release() waits for m2m job completion,
+	 * the workqueue handler (mtk_vdec_worker) may still be accessing
+	 * the context after v4l2_m2m_job_finish() returns. Without this,
+	 * a use-after-free occurs when the worker accesses ctx after kfree.
+	 */
+	cancel_work_sync(&ctx->decode_work);
+
 	mtk_vcodec_dbgfs_remove(dev, ctx->id);
 	spin_lock_irqsave(&dev->dev_ctx_lock, flags);
 	list_del_init(&ctx->list);
-- 
2.43.0


