Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3020DCD98E1
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 15:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppzEj7clxwYqaF2xsc1Xu8dwkm63CSTY5UlsiLbKHOs=; b=I5PxRkceiuE8njW3GpXPziu0zj
	3KVjOzH/AOhe6uWZO6zioQOHTYTuonRDes+VnGkuDuL6IPOiIRhUCoKJQ7pCbd/mbSZAMJP/wEqK8
	uIGEITxQLJxbDqHv/MJ+D0pfuM7jtEtiZO/jcJ47d1rPQcE2144SbTt9Ur2958lwx9es6yg3Asd0o
	sHpir7GqTDyynOeoA3dX8PWDVbSsvfNXdPzeUpLRGU7N6T5M2qMcxflXjZw2x1r5ztgb6l+V1Xn8y
	zuKxi3D9fQIH+AR/cqgYtHOcSt8WirsWK5D3Ffxh0gXD3sf8h1BaIcr82CzNJUd1lT/cNpbGRtqsm
	QBn6FYQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnCD-0000000D9gw-0aze;
	Sun, 14 Jun 2026 15:56:25 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnC9-0000000D9bJ-3HMJ
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 15:56:22 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8cd45d4b7e2so31948276d6.2
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 08:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452581; x=1782057381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppzEj7clxwYqaF2xsc1Xu8dwkm63CSTY5UlsiLbKHOs=;
        b=ogwu2PdXHu8QFUOwBaxK57Vb1iEy9WuItug1DAXYXu5mDdBbo9/nY9WQquqZ+9AOBY
         vWHwxDbeoaUOXWGlEg3J2zK1wgqAOEtuScorz4Vou+YqwQU35+gy5T/kqvgumXnNxx5I
         Ud4lzw6MjZrZ2EYoMZUZGeBDm6MAlOSRG+PRYtD5jsH1l/+UQSUoAxlPSwVU4shYr4WY
         rTaFchizXQq6GH3mOiICUvZRScWlhWYUaQ4hIYEUG70GSOfMjoFZgl/cKltX3fVIN1mR
         bS7rXEbAW91k2LdSC4ObUL811b1S9yXBW+65VDuO1r0KtitMSRe9itqBkipcp9jvJduO
         QHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452581; x=1782057381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ppzEj7clxwYqaF2xsc1Xu8dwkm63CSTY5UlsiLbKHOs=;
        b=WbYbSpd8zNO3Zqr/f8QjjgAIfbUvQKdLtJw0QKGNUZABnsw62F0cXpoR/j/OJ4eC8p
         6v9ssarUDUnuJRKnA0Hf7vMqcFcrpY0hwKJNnqp3cYcEn9RKjZjrT5eKrhuit3uRv7Xy
         2Rgy1i0xBXV71SONSwbvIJv4Denpu1hxTdOqIdS1OQLHltJzMMXQT/8g/l1EFVkp1HHe
         CvDRt582rtsBlUzdriF122otQp1lkmjw1DaH4I4+JfG8VXqIu0c9IA+FY4y7doWeL24+
         rNPO0/zCql4axLHy92++yCWwgMNILujImRHq8vC+z2sGJuf/2HcLS57i2hrKtDMSfMd9
         mSGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OeCI0C9pUUNq0S7bI+lVmI41Ed4+icgqnAydxtaHtkH92PARph8jCKX3oubBVZkiyEMrN1O/OqHGd0Z72uw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWskECa5zYvcW095mMDCf9ZGaMluzxwng7L0W6f92Z9yG+Spqa
	6DKizU1jnGkL+QYRC3CtDiUwYw3Yurd0jkbCccMHBPigqD604CHscl9D
X-Gm-Gg: Acq92OEcPmuwV/jxqZRoB/erh66QbO+YCmWmgV7fgo3k/Nn4SmssctuQ4pTa4navtXS
	p+lT9jBkKAjq3m5hvNDBT+EC0Wm5gMUFskWk/ipvkiugKGTI7tlhvCPDrQEZ1nd4TnOYlQZiWWT
	KnZ8DntIqB9J0yyY61Z8ZNs6SRrxjJ36BSqxMaLBUqPdjS6xY29llG+ZVbJDm5UsYlk3GUoveAi
	EIY/0oqz/MbXWPtIjhFJ8hzRfqfIB58K8f3PHSY4Sk4+Ie1dPfJBtjpHt+i2jhAmfOLxHZw9XdJ
	dWNdnQQxCqckQh6kIAk6fLV1xqFpi820F1aoMnlbkXfZs1EUUXDBX/YegJ6nvQrJrdxrKnTbfnk
	dUly3faKELYG2ouPvbbfpiyGEr0kcrrHo7BZSrHsK6WulWI2qhXLgZpoqRE/oLdP53TLEYsqT8u
	E7MqyeCKrYSIYP5phlaXe0TgmXtO1qWSTJNHGPL+Jm5IDuGQ0ylj81WHm8tZo/9kjatzqO/Pska
	KYsPaoJapm31B/q3hCQrMILFoJ4mxslsfD1s2r3+R8=
X-Received: by 2002:a05:6214:40c:b0:8cc:ef56:d997 with SMTP id 6a1803df08f44-8d32bd2d8cfmr184388716d6.7.1781452580813;
        Sun, 14 Jun 2026 08:56:20 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:20 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] media: mediatek: vcodec: bound AV1 tile-start copy to the array capacity
Date: Sun, 14 Jun 2026 11:56:07 -0400
Message-ID: <20260614155609.3107600-6-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155609.3107600-1-michael.bommarito@gmail.com>
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_085621_851700_8A5596BA 
X-CRM114-Status: GOOD (  12.05  )
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

vdec_av1_slice_setup_tile() copies tile_cols + 1 / tile_rows + 1 start
positions into mi_col_starts[] / mi_row_starts[], which hold
V4L2_AV1_MAX_TILE_COLS + 1 / V4L2_AV1_MAX_TILE_ROWS + 1 entries. tile_cols
and tile_rows come straight from the bitstream; bound the copy to the array
capacity so the accesses stay in range.

Fixes: 0934d3759615 ("media: mediatek: vcodec: separate decoder and encoder")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 .../mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2d622e85f8271..49d9b4a72387e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1299,11 +1299,12 @@ static void vdec_av1_slice_setup_tile(struct vdec_av1_slice_frame *frame,
 	tile->uniform_tile_spacing_flag =
 		BIT_FLAG(ctrl_tile, V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING);
 
-	for (i = 0; i < tile->tile_cols + 1; i++)
+	/* Bound the copy to the mi_col_starts[]/mi_row_starts[] capacity. */
+	for (i = 0; i < tile->tile_cols + 1 && i < V4L2_AV1_MAX_TILE_COLS + 1; i++)
 		tile->mi_col_starts[i] =
 			ALIGN(ctrl_tile->mi_col_starts[i], BIT(mib_size_log2)) >> mib_size_log2;
 
-	for (i = 0; i < tile->tile_rows + 1; i++)
+	for (i = 0; i < tile->tile_rows + 1 && i < V4L2_AV1_MAX_TILE_ROWS + 1; i++)
 		tile->mi_row_starts[i] =
 			ALIGN(ctrl_tile->mi_row_starts[i], BIT(mib_size_log2)) >> mib_size_log2;
 }
-- 
2.53.0


