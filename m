Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD8AC624D0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bG2pMm0qwXP8URwYF59N+uYdVu8xUiwyKW9MTQJcAuA=; b=lKCpNb9UyPFJZfWdlt0K+lKloY
	P9I1IFVX0HciV1EggFVTnl+jgFFj3Z1PupqvuSkxtH+G9I4ATS/Sufgei7xAyJZlh5WeIlZvDITly
	YiPUAsMLOBzkzAtxc1rQEQCz7l0e1CWS4vbe8aV76zB6ZCAvMhfrANZtRwkyvsqXORIADj8PdBuPL
	3PD7ywiJVGcS8L+Tz/hV00QHG6QwTZm3jDUTQmoAhsYb4v7VBajU9bx2h0il4/1OiL5Z0kS7otHJA
	pqop8YMUEvGtMN/5TK4NhnbiAkhqkNqAsASPLAPrq16uQlkLIssRCcIo1sVrkuGMTy3jHCo4ca9AP
	cAmCU8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1j3J-0000000EUR9-3GdJ;
	Wed, 02 Sep 2026 11:22:49 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1j3H-0000000EUPR-2jow
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 11:22:48 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-853c947bfefso882574b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 04:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788348166; x=1788952966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bG2pMm0qwXP8URwYF59N+uYdVu8xUiwyKW9MTQJcAuA=;
        b=LNltt7HqgYUgiaHkKIaKEanhJwkfoqVXMuuB1Eqb7Gbs5h5t+dajKlz3upLSOfO56Y
         rn1CJo+qBaJCnaP//XCdBDveJOwNrxsUtqWXHCRxGsm5up8nfwhvdqRGIfqcAA6E/FFY
         VyHxNZ4peCoMYtKrz98r8cgptFiUdtvqymEiNWVR1/C/qnMB/Ll3rR9lRIX0/qUITnMV
         6d5v8NdwLamKb97oA838D3ST5O4GE1oyQKmjy0Gp7usLc8F7jXDFb3deOgflbZKAwfRJ
         ZFCf8YndmBiHuDRpC7g+ltL9hHnjBEhr41UWrItLSdHIudhCMnpqW4T3GCuRJJVi7EUa
         jO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788348166; x=1788952966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bG2pMm0qwXP8URwYF59N+uYdVu8xUiwyKW9MTQJcAuA=;
        b=DeI9ARxO6jU6p/tmGNG9aLUOGXKmzLBhO78jA9n14D+pwdOzcp+tgTTW6baklyEA4l
         tVonazXGHYUo2E9opCv5E6a7dvbCsSwm7Wc7VTp1N2TF4aFUjExg4AiKgqMWzmnyLPiC
         u/PfWY464rkAcVmnB3sr22F1A111RUI1FTfqSP2z/yyaXxsOp/2rnQjsr31oKyb0ztoL
         5gD15yWdQsJhPzSAeruG5Oz5D9xGnyFdpnJOb5V72CeS8MPRVDXjXV3uVSpzNiTxnbR/
         8SX0ehZD//4a3x/0Y1LxrhY4Lr/pBm+DGgXldB+yw4g7mhwI1sRZSQx6Ht6L480FxrqT
         7rUA==
X-Forwarded-Encrypted: i=1; AKwUvBw2qDbFiK7MweeXgWWQDbtYDOoFpVsf67HMy999YrrP/BGOcOonQSz/qdds6dra3rQIsMb+9lndEeNd8VTqEg==@lists.infradead.org
X-Gm-Message-State: AFuF++kxdre1hNfrBKna+3Vj2mT2jQ9f1pHisjd/34+3H70khMxT2O95
	9frNiJ9uBmm0oAbzy2aH02ef4SCK1bTFlHMilk9NHn0Ol4Ya643u5M76
X-Gm-Gg: AYBFou0FennKIwJSf6azr0GjBIBaOSGREH7Yo+rTmLwIIWyMPgABlqhlNqsbZYDZn5r
	ctVXmZcQxkYQkYH20kyg14c7KH4XfsWkBwnriC9HC4pzbf/Xpf02mRQviNVw/jDVPSB0zdkMST5
	Ku42cqFR7YB8jm/lj+PdY+8crSsh/qLt7P2RhKLG3ms3bcTlFw1iP6Lux5AqSccRijRNg18sin9
	OOncw/1DkfPIVt0JEuG+pOMKLNPDM9SgiHB6yaBIjgBT36HbtH3JlzUVi1KyGt8Rw40c8aGfDzH
	OaVsnBBbYT95TfL6Vt6xwc5QKFT7bRcKI7AGymUcZt7o8Z6R5gW5ZzUNKFnBCt5Ybf55t/moPdi
	dhhz9dGKl7fr4S6Ac+c3TbnljcLrkN2QynRt+UnpnisT+QCkHgeSc3Iumy+gwIT1El2uJIaOkWx
	LYBZpL6fxAKWWX7WWDWAzsek0j1A0DiXvOWBPpkSeFfoD2SHJ96ytfuxbyIvc1XeITawWvqA==
X-Received: by 2002:a05:6a00:178e:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-85f42e35709mr1863167b3a.8.1788348165513;
        Wed, 02 Sep 2026 04:22:45 -0700 (PDT)
Received: from hnkz-ubuntu-server ([2404:7a80:860:3300:f22f:74ff:feda:3295])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc11f8471sm1167571b3a.58.2026.09.02.04.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:22:45 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: Bin Liu <bin.liu@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kazuki Hanai <hnkz.64@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Xia Jiang <xia.jiang@mediatek.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] media: mediatek: jpeg: Avoid context access after job finish
Date: Wed,  2 Sep 2026 20:22:28 +0900
Message-ID: <20260902112230.452176-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_042247_705550_41B24500 
X-CRM114-Status: GOOD (  12.33  )
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

v4l2_m2m_job_finish() publishes job completion and wakes waiters
before it returns. A concurrent file release can therefore finish
v4l2_m2m_ctx_release() and free the context while the single-core IRQ
handler continues with its tail.

Both handlers only need the device for the matching runtime PM put.
Use the IRQ-owned jpeg pointer instead of dereferencing ctx after
completion has been published. This preserves the get/put pairing and
removes the post-completion context access.

Fixes: 45f13a57d813 ("media: platform: Add jpeg enc feature")
Fixes: 5827e4b14ee7 ("media: platform: Improve power on and power off flow")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index d147ec4830811..9010e7b1108fa 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1574,7 +1574,7 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-	pm_runtime_put(ctx->jpeg->dev);
+	pm_runtime_put(jpeg->dev);
 	return IRQ_HANDLED;
 }
 
@@ -1855,7 +1855,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	v4l2_m2m_buf_done(dst_buf, buf_state);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
-	pm_runtime_put(ctx->jpeg->dev);
+	pm_runtime_put(jpeg->dev);
 	return IRQ_HANDLED;
 }
 
-- 
2.53.0

