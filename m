Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE47C3A59D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynTN1IuO1zTDye8FiGonLkDqRsMwWw2lbWlIxqdkx8o=; b=Q1U6qEfze55DYHxGxMVRHRihZt
	V/W6s6IyKZdwghxIRX+ukCDB41T8HRKv2BwRhqWuOfPCv0himUOAlyBahvbIvKx1RNqXN76ZNQHH9
	nO+oWTjJDB6PmxpMB9M2F0k9WDLfvBwGO7/UrkL/bAO2+hSS0RzeRPqGJcfcYPcxy7+9UpwKg6Itn
	GBR8PrDY3kEJ69u8mgEfpkMca7lHtfC41t2absKnqA0o4qZjjtRXEtUUJKOPyw/OnbC03f4tpQrTS
	hFg+IkmySWvoBX+KS4BQlEKSXvmGA3dBZVrp9cxv17sELIWPwcdT3bc/OQXfumtUUgCtSmiNghhG/
	KgRVGMWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOEH-00EZWX-0l;
	Wed, 13 Dec 2023 12:20:45 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOE7-00EZQm-09;
	Wed, 13 Dec 2023 12:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702470030;
	bh=9nciZ1s7i4iPVYsAX6ZTDm0XS3kNJiPzFH0jLeN0v0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JWgYlV/K+sX/Xg4s92JYgwTzZOX/1IDaVvv9M5HDRPpldhCk8rQ/LGh6kVLjX7BO0
	 kgJabGOn+G+9yas1/kvmCS2n3V7Oeu/NtbWXpd7L7ymDFV5bVJJLv5FDZQl6sjLl1o
	 EsLf0OAJ6DZw7HZ1ctmbWuVPiokcXNRjz3JSvbA0F4foify2H0xucCqf0lBuQWjMpl
	 Uajg4uM/w3iXsRSBYbPyODUOQ7nBtDgv8fn1DR54msAWXIvL5CkdOezAv6JE4yLWF6
	 L3QIMLYW3oglsNNpPpABh1+L7hcPU8aRsLJUbyCf8O3ZA0RL4ivIZTk2VXFuLX51PB
	 A1Fpn9jbwWSNw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2D2153781485;
	Wed, 13 Dec 2023 12:20:29 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	eugen.hristev@collabora.com,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com
Subject: [PATCH 2/4] media: mediatek: vcodec: fix possible unbalanced PM counter
Date: Wed, 13 Dec 2023 14:20:15 +0200
Message-Id: <20231213122017.102100-2-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231213122017.102100-1-eugen.hristev@collabora.com>
References: <20231213122017.102100-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_042035_217200_633706C5 
X-CRM114-Status: GOOD (  12.44  )
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

It is possible that mtk_vcodec_enc_pw_on fails, and in that scenario
the PM counter is not incremented, and subsequent call to
mtk_vcodec_enc_pw_off decrements the counter, leading to a PM imbalance.
Fix by bailing out of venc_if_encode in the case when mtk_vcodec_enc_pw_on
fails.

Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c     | 4 +++-
 .../platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h     | 2 +-
 drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c | 5 ++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
index a22b7dfc656e..1a2b14a3e219 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.c
@@ -58,13 +58,15 @@ int mtk_vcodec_init_enc_clk(struct mtk_vcodec_enc_dev *mtkdev)
 	return 0;
 }
 
-void mtk_vcodec_enc_pw_on(struct mtk_vcodec_pm *pm)
+int mtk_vcodec_enc_pw_on(struct mtk_vcodec_pm *pm)
 {
 	int ret;
 
 	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret)
 		dev_err(pm->dev, "pm_runtime_resume_and_get fail: %d", ret);
+
+	return ret;
 }
 
 void mtk_vcodec_enc_pw_off(struct mtk_vcodec_pm *pm)
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h
index 157ea08ba9e3..2e28f25e36cc 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h
+++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_pm.h
@@ -10,7 +10,7 @@
 #include "mtk_vcodec_enc_drv.h"
 
 int mtk_vcodec_init_enc_clk(struct mtk_vcodec_enc_dev *dev);
-void mtk_vcodec_enc_pw_on(struct mtk_vcodec_pm *pm);
+int mtk_vcodec_enc_pw_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_pw_off(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm);
 void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm);
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
index c402a686f3cb..e83747b8d69a 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc_drv_if.c
@@ -64,7 +64,9 @@ int venc_if_encode(struct mtk_vcodec_enc_ctx *ctx,
 	ctx->dev->curr_ctx = ctx;
 	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
 
-	mtk_vcodec_enc_pw_on(&ctx->dev->pm);
+	ret = mtk_vcodec_enc_pw_on(&ctx->dev->pm);
+	if (ret)
+		goto venc_if_encode_pw_on_err;
 	mtk_vcodec_enc_clock_on(&ctx->dev->pm);
 	ret = ctx->enc_if->encode(ctx->drv_handle, opt, frm_buf,
 				  bs_buf, result);
@@ -75,6 +77,7 @@ int venc_if_encode(struct mtk_vcodec_enc_ctx *ctx,
 	ctx->dev->curr_ctx = NULL;
 	spin_unlock_irqrestore(&ctx->dev->irqlock, flags);
 
+venc_if_encode_pw_on_err:
 	mtk_venc_unlock(ctx);
 	return ret;
 }
-- 
2.34.1


