Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8D2CD98DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 15:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUP9Gv/A+Fvu6KFm5rkfbHWBhQLayglfD2AoltKeA+s=; b=k/Z3cgxrqKQ90JbvLg2GdZdU7R
	NEhjnQZxbymrlAwF3FtNMsK+m1ajElc+8+m6XtdifXH7GD7atBE7ysumFx7tkCcGhytRJC77PvvJP
	xqgTifsMSSLGbjYRKoMwCMvXRcDGIhpSdz/FonzhCuuJpxE2I6lUrGX5oV7IgeJYvHvY4xkHOmapb
	QvMsSDFcKHEb6Bfto970MQxX2VkMQbE9LuxORdr7wkPaMhinNZV20BM/BfJ9tt+u6ay/0HX+prPTo
	4aZgnJsML3wjUJlKwwS0rk/4YPVQsQCgeKvhKJct6HfYh9hZXUfBBX5MchE2/+sKPYTm89VxYfKs+
	aKLu091Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnCD-0000000D9gq-0KyA;
	Sun, 14 Jun 2026 15:56:25 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnC8-0000000D9Z2-30uj
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 15:56:22 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8ccf01ba514so27487836d6.0
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 08:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452579; x=1782057379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUP9Gv/A+Fvu6KFm5rkfbHWBhQLayglfD2AoltKeA+s=;
        b=P1Q8Oe/H40PFjWbm8ZpCMD/F42sx8AlyeXKRiXaMGWKct22kzM7ij6T1uf9PJQZw8P
         GhUEsyFFLj2xL7I9Ir+ut1GQmyXFZK0B/YJhy2LRSwUDgBMTq3nM6q/Afow/v2tZsX0j
         I0xOwSr5H92USMLuvfO44T7QelnkWqzw2H70x4XmWgfV13Zq/Y5hP0ZnqpsjXr+JC400
         LjZoa9S0/w7zKOVY0OKYnblr03QBjjVYLvxMMxQzebwCVMnnK1m9k9NS4k9PsA6z7Gbs
         mZNEXNLzFu7Vwz0xPQ3wxjJDLvrnWrQcy/t2H1uYIKUBDrhIVvGU1MuZ6WPjLJox9xyD
         jPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452579; x=1782057379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cUP9Gv/A+Fvu6KFm5rkfbHWBhQLayglfD2AoltKeA+s=;
        b=QqqdFFxbhRsISh/QWg9qKrmjxXnx7Eb8tazT7Pt2c70ucaCBx81WaeCWEhb1nt8YpL
         le3mAp9TSvT/8Z4QiC7nygfTSqGzrsuu7MKRj4CePIUK8erQ4cAcxuwP7qyTpCmXrVwJ
         o5GYWWXErelbqQUI+uzTMDKhEOBqGPlBJ71yT8NAfprrWqncWvTxsoAziP/FklbjGt85
         vP6PaqkP9ZoKX/QCxCw/s0KMzsCR+cu7nkbx109QyqM5b5+eZ+IJPf24N69wxJto2Y8Z
         0UHl5uwtbWgbejy1Cj0QwD4rn+e8DnSpUW8gW/rj8ittq/3XASGBGWy+87/jto8alUP+
         QWFw==
X-Forwarded-Encrypted: i=1; AFNElJ/PYBRWS1J/9qMt73UmaB8EdMH2DAsS90RIsMA9a6GZSrngLkkZb7IpLgl/Wljm5Pfph1SO1f3jyScDZYQm7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTj6WK5hJqTgeUX8VxKnd4pNYY/tE/XNKf5UFrdeeUNzmFH/wl
	eYvuKzUaCIw0Sd51osmmQqtCamX8jRzal/xmMhZfJBDyUc9sN5QLVXTc
X-Gm-Gg: Acq92OHH85FFt0YEEaw0od3Bwx+AifDIdk2i4nxiwQsofy66WOWF/mGyVWSgKALLt9g
	3Kdn+k3R9kXL18YdJUMcoA7cJSmHr8iVfe3kvfKOZh6aMR2rTa2JI1QzdfrbUH/jGA6uGXz1czN
	hEPqOIduePkH0IrATZSJswjk98TgTFP67qnOfA0/QgddGEEUwlBd56mlhqlTQPrw+cYsPlUn8ir
	E43t9vmZY+7nOFCsL/Z+ONfmys/MqehpB2bWJdpJsNRnBMYsCrjUgqHYAoEYRUENmTInD+ShG7Y
	q5j7Fe1NnTyIXuVMse/A2JhQg1yMzlwnInpii2hOdXFH/DTsqzFGJTBtAJXLOh8ydv4bXT0crcR
	bJ9ePJNFB+0eSRZxBVLb52ygzVOoZdqNGIxkfuvjvZbJkmdED/qqCNXlseKZUrm32/DJ6g49Kpf
	NuN86lI2YsgYc0xWVPHPYf2Lz0zuT/I4DWOpu8rzqsEVwXpJe3PxaOEPrcHq4/9z93r1HZul0Gl
	u7/LvNmLJC3HT59syoH39uIhvJxD4ulxfDy+VRWD7Y=
X-Received: by 2002:a05:6214:621:b0:8d1:5830:6666 with SMTP id 6a1803df08f44-8d32b47a72bmr192789676d6.1.1781452579404;
        Sun, 14 Jun 2026 08:56:19 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:18 -0700 (PDT)
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
Subject: [PATCH v2 4/6] media: verisilicon: rockchip: bound VPU981 AV1 tile loop and guard divisor
Date: Sun, 14 Jun 2026 11:56:06 -0400
Message-ID: <20260614155609.3107600-5-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155609.3107600-1-michael.bommarito@gmail.com>
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_085620_778160_CFECECA1 
X-CRM114-Status: GOOD (  12.54  )
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

rockchip_vpu981_av1_dec_set_tile_info() divides context_update_tile_id by
tile_info->tile_cols and writes one descriptor per tile into the tile_info
DMA buffer, sized for AV1_MAX_TILES. tile_cols / tile_rows come straight
from the bitstream; reject a zero column or row count and bound the grid to
AV1_MAX_TILES so the division is safe and the writes stay in the buffer.

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4e21ad373233..71d2ef72c4402 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -578,21 +578,32 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
 	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
 	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
 	    ctrls->tile_group_entry;
-	int context_update_y =
-	    tile_info->context_update_tile_id / tile_info->tile_cols;
-	int context_update_x =
-	    tile_info->context_update_tile_id % tile_info->tile_cols;
-	int context_update_tile_id =
-	    context_update_x * tile_info->tile_rows + context_update_y;
+	unsigned int tile_cols, tile_rows;
+	int context_update_y, context_update_x, context_update_tile_id;
 	u8 *dst = av1_dec->tile_info.cpu;
 	struct hantro_dev *vpu = ctx->dev;
 	int tile0, tile1;
 
+	/* Guard the divisor and bound the grid to the tile_info buffer. */
+	tile_cols = tile_info->tile_cols;
+	tile_rows = tile_info->tile_rows;
+	if (!tile_cols || !tile_rows)
+		return;
+	if (tile_cols * tile_rows > AV1_MAX_TILES) {
+		tile_cols = min_t(unsigned int, tile_cols, AV1_MAX_TILES);
+		tile_rows = min_t(unsigned int, tile_rows,
+				  AV1_MAX_TILES / tile_cols);
+	}
+
+	context_update_y = tile_info->context_update_tile_id / tile_cols;
+	context_update_x = tile_info->context_update_tile_id % tile_cols;
+	context_update_tile_id = context_update_x * tile_rows + context_update_y;
+
 	memset(dst, 0, av1_dec->tile_info.size);
 
-	for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
-		for (tile1 = 0; tile1 < tile_info->tile_rows; tile1++) {
-			int tile_id = tile1 * tile_info->tile_cols + tile0;
+	for (tile0 = 0; tile0 < tile_cols; tile0++) {
+		for (tile1 = 0; tile1 < tile_rows; tile1++) {
+			int tile_id = tile1 * tile_cols + tile0;
 			u32 start, end;
 			u32 y0 =
 			    tile_info->height_in_sbs_minus_1[tile1] + 1;
-- 
2.53.0


