Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8407FCD98DE
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVl0d1DZ0/rxF5BIn+S5uaENMoHy7Qrp86HW8O6zq18=; b=SJtwqIBJg3e4NXPj/02DeM+kgo
	5DwCbfu8kuxLeq0OHzhDsmEucR9mpjpGsMnOVAv8dqVHAEo4tn7V0Vozul0jDnB5JrbQRQ/l5T7b/
	ZHy9Qtqd1H3cAoxbxyHnwFN7EKaP3wz5PgVzBIhlQwzbNjf0tJEn/WcmmzyKpBN3/8w/pXWRHWdYx
	jmsHtUEETa7cMiIajkDlrjse1dAO0o4Par84MJqIO+lyI233lG/zOaoAlXEXSU7kGotCRmtoR2Xmh
	hNWR2/RoZg9YCszIaL7dsyveLeXT4GtnJv0u1oMMPaIwnjVMGtoA1+PuIebV6Ht53o6J4AKXkf6LB
	dvR0J6cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkbS-0000000D0JD-0lvk;
	Sun, 14 Jun 2026 13:10:18 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkbP-0000000D0DG-0QNZ
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 13:10:16 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-9159da9bba5so177324185a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 06:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781442614; x=1782047414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVl0d1DZ0/rxF5BIn+S5uaENMoHy7Qrp86HW8O6zq18=;
        b=fBK8CeaU4P9iKngqxJmtvI7KCJocYsHCNPKNWLwsOWYBqpV502fdukKkd1BE20cgeF
         m6NxiLEK6HrBbGlxqA2bPb2iVDN/pMO0HeXke2Y6+1/7cvoOQ/BT6Yz2+lZcC0g0XVBV
         yhmOa5cGNMxx5+j7jekHa65RciQansBuCWsTY61YU4f3W1byn+dSfQEIxkFM2j0rwsqM
         X1stSYJIYsu/uQFAO7WGOi0Uciprhl6WpDD1fHneRW75o/1D8HqxoU8bmTOt3/PIFTTo
         W+1Od2tXe3POY9Gff99Soo2K+pWaZc2J1cLbJ5ZOt1nXTuEB0vYr6c4OAl1JUkJNqLbe
         GA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442614; x=1782047414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lVl0d1DZ0/rxF5BIn+S5uaENMoHy7Qrp86HW8O6zq18=;
        b=NJ5SzQu1JbdlSSbBw855igmPdf7RzNMTVO/IIhfIHAOCs6SaoOmovILYN8MJikn2jq
         u9Ly4EIC0GLiAL/st3SgStdXcy6iWYbEscl8QqWCLDziS5H/6pi1m40NuMhYwYw7zkP2
         ttRqxej3GC10o6i2p3jJBWhLCKYrzbufdgqL6tGUATItawa4Oi4URDMjDQUqtrriRH29
         QxeGG1OHVIA/9jjw0Ha6y2olvb5232Y1qJFZinGzud/vizQuzdfcmnXd/H08tHPxmDHi
         38Tj0ur3Flu3ZS+twOQK4gLf7tBXuUOwAcTehu1+73HJc9e3WfL/JtUQl3aygAsDy9QK
         RBbg==
X-Forwarded-Encrypted: i=1; AFNElJ8/uB5pGvLUVp+ZXSSH0667iGipSqYWqNx4ciXjShU7WMqUigla1jNrmJ7X1CYBhASQPkW2gFOYUDAEsre11A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4O6xcnDDCXD9tci6ZJKRjpC7Qw6UNhtJyLUjF8D4nBsxvR+tz
	bBIKzsOKkfQ/p79gC7UYcYEqbsRP0jCX4PMTiIoGkVG3VxSsk9B9EQis
X-Gm-Gg: Acq92OFZIIBmljzfKavnlyAW1Y7hztFl7ZtZGgrJPC9jYhTHAQnOIZKA8SnOMU1Qhbs
	+Cxp4BB2ASyWXKzKLnbJEe0WfUmJKr6G1rAUKW6QF9eEGonLBe6gpP5BvIpwdg2pwBl7Zv15me3
	iDc5wQ2h1BTa79tzx5Tt29PSQBawZq+LFbjcAayCAW7jM9Ru6kDvafP5DZrXHsK5LhD4qkLTL4x
	6UI95pTIzRcx+mvG2C+IFSMuHvA5LeeCErwRxRHJQXfZfpnu6fsiivSPx7RVHC1O+hYPsP0ZUv7
	BvESu6JYPr+mEKhPhNgeDsIwIq+KtlMvUZ6nCPfie6tU41R4SsbdQA5ZlpqXh31seBAdUKz3Zub
	iHjT1jcOZulgsCLGI2kZsfBl9z+v4bUw2R01v4Mp5FAx1R2iC8T8x/9CjI0SkxxOGNDuezyZ5Xb
	4wW2BfRKhWZB8b8Au5fxaE8yCmiveLpqCcqeRMLx1BncBltl8zanhA0ZL4F0We7QBvkSUeIpd+u
	QTKTe6qFUyxma74YT1NgrKXc26GPvXTYPfvyKmGMK8=
X-Received: by 2002:a05:620a:26a1:b0:915:83fa:b3e0 with SMTP id af79cd13be357-9161bac7727mr1528176685a.5.1781442613683;
        Sun, 14 Jun 2026 06:10:13 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm752878985a.15.2026.06.14.06.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:10:12 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>
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
Subject: [PATCH 4/6] media: verisilicon: rockchip: bound VPU981 AV1 tile loop and guard divisor
Date: Sun, 14 Jun 2026 09:10:01 -0400
Message-ID: <20260614131003.2524025-5-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614131003.2524025-1-michael.bommarito@gmail.com>
References: <20260614131003.2524025-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_061015_211124_0DF8BACD 
X-CRM114-Status: GOOD (  12.17  )
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
This is a Rockchip RK35xx SoC block not reachable on the x86 KUnit host,
so the driver-side out-of-bounds write is not reproduced here.

 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 29 +++++++++++++------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4e21ad..71d2ef7 100644
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


