Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA88EE7FED
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8fTqSPosGVFRSuNbuDzcDh8MPrifrDs8eg/tRpTv6/E=; b=AwMNkLsQzhaUUb
	5LRIetevsRmk/swx6q2Z290nR8d7TXuQY/tOr78tJMq3S7IyncDh06gC9My28tzs5Q9Z9nmjv8YPI
	LaW/JTvL/ZNHjojcQpx2Nyre8nIuPUJR5cKlG7P1gBvQSriJIaMYKrS8TLrT4787OzKZ7n3zNsqE0
	yeURI/pp0j2ryWnV/i47QIImEi2GSAc6p9+e1DOtallQ4Ewsxe9jQ6uOR7uGPBw0ml6gwmZ5vG4cA
	UhJuXP7NUq2pDZmK36XPdmgr1dg9TBA65/FGyNAJu5wh2+YcKCtu7cEx91h4J+ZYBfRhBzXICIGKi
	OxMh9E64SmdA9Z/Gnr4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qebXv-00DqZU-0L;
	Fri, 08 Sep 2023 13:29:15 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qebXp-00DqXH-34
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Sep 2023 13:29:11 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso15421195ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Sep 2023 06:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694179748; x=1694784548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8fTqSPosGVFRSuNbuDzcDh8MPrifrDs8eg/tRpTv6/E=;
        b=MCw9whvhDlFuJeDiCwQGR3whMxH7TGN3cJRSksw2pd1kfpnjL4TyhHQQpnr9Nhwp/d
         giaDfbI/AhfQIVwRSUX8y6qXSXs3C+L/xcYcnf0qS4RsuMIFVZk6trnEKOnQ9dvRehqU
         sT1ZPRKRulHKJxvfv0JvEdDv49v3Cr46zkMzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694179748; x=1694784548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fTqSPosGVFRSuNbuDzcDh8MPrifrDs8eg/tRpTv6/E=;
        b=BEYjW+aTszoiMO6b70GKFZwwOtT3n6fU6rGc5Tt131ITJJWxUpWDlyDScon8EUBLqm
         Wh2jcO82jEP9k1MCGlAkWiLAYt1/oOcMvJOXKhRHFMJZkIjNOjxG52gvg9zTDn4GDaIP
         GoNAbU9Ghr7SsfGuExhVYFzaPpNxLdv2jVz4MyCFOuP42O287Eb2LQbbRY3pLmJW5fMJ
         F6ta8Xh6r6M7656KOUfG1Ruc3oFA1TY8zFj6LCEwKi5e87XtD4UrhOR4bAfm5LaROk/g
         F3Ak6jeP+TEWAbd1GnWGKhllxqqnmMkSUop6Y6U5iECMTgTfxBuTFF3KfDL0VboE9XEs
         gIKg==
X-Gm-Message-State: AOJu0YyphcRnMRvZMFfy2hqIolWoGPtxvXM63Pb4lHazcL7WezPl3QYK
	9pw3Mhjm0CAsmLboQbGVTVSsSg==
X-Google-Smtp-Source: AGHT+IHWCBplIrjcCzuUpgb9NC4rnhznC4Bx+ZzE6bt7VuZlgtVVJg0EhVEiMWW50/fNxqh+vxaWSQ==
X-Received: by 2002:a17:902:ce82:b0:1bd:c7e2:462 with SMTP id f2-20020a170902ce8200b001bdc7e20462mr3029639plg.11.1694179747803;
        Fri, 08 Sep 2023 06:29:07 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:2f7e:9c4:ed14:b826])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902778c00b001bc6536051bsm1562560pll.184.2023.09.08.06.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:29:07 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media: mtk-jpegenc: Fix bug in JPEG encode quality selection
Date: Fri,  8 Sep 2023 21:28:04 +0800
Message-ID: <20230908132839.2034566-1-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_062910_083058_1D0525B4 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: Bin Liu <bin.liu@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The driver uses the upper-bound approach to decide the target JPEG
encode quality, but there's a logic bug that if the desired quality is
higher than what the driver can support, the driver falls back to using
the worst quality.

Fix the bug by assuming using the best quality in the beginning, and
with trivial refactor to avoid long lines.

Fixes: 45f13a57d813 ("media: platform: Add jpeg enc feature")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 2bbc48c7402c..f8fa3b841ccf 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -127,6 +127,7 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 	u32 img_stride;
 	u32 mem_stride;
 	u32 i, enc_quality;
+	u32 nr_enc_quality = ARRAY_SIZE(mtk_jpeg_enc_quality);
 
 	value = width << 16 | height;
 	writel(value, base + JPEG_ENC_IMG_SIZE);
@@ -157,8 +158,8 @@ void mtk_jpeg_set_enc_params(struct mtk_jpeg_ctx *ctx,  void __iomem *base)
 	writel(img_stride, base + JPEG_ENC_IMG_STRIDE);
 	writel(mem_stride, base + JPEG_ENC_STRIDE);
 
-	enc_quality = mtk_jpeg_enc_quality[0].hardware_value;
-	for (i = 0; i < ARRAY_SIZE(mtk_jpeg_enc_quality); i++) {
+	enc_quality = mtk_jpeg_enc_quality[nr_enc_quality - 1].hardware_value;
+	for (i = 0; i < nr_enc_quality; i++) {
 		if (ctx->enc_quality <= mtk_jpeg_enc_quality[i].quality_param) {
 			enc_quality = mtk_jpeg_enc_quality[i].hardware_value;
 			break;
-- 
2.42.0.283.g2d96d420d3-goog


