Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E83CD98C5
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z35bHdhSh8a/Z8G1ETcqSJjtROGT6H3Pl9v+4lJ8nHY=; b=rBGJQhtnqBLq/t0zURCnyRjrCe
	aLM4V+ko74QnFweAdQYhGiNhFlqYq8+h7m5oOJ3UNQtGq1Vu5oJ0sI27srprqfzdFf971B1C6oPZ8
	cwtJi/lmq4Dnx9HWoKlIzDWiBXAgmlq+XVetuV7YIwsvx/xt3Q9cpjJgnpIazx33g3tHAdl7kNGpQ
	7Td4lOpIYmVK2grQEJ/891g7w5P0bseqSzuykFN8LO22t1ET8rqwlvXduoLM3Fr59ma+Imu5bUgrc
	SIV7tiv2GNqAtM2zcDGGxiXlxZUGGqv8ndDzVckuMl28f8D9KlJmL9yTw8FOwzplH/PngmxDTBvYl
	rhodczzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnC7-0000000D9YS-2NmA;
	Sun, 14 Jun 2026 15:56:19 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnC5-0000000D9Wh-2GzD
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 15:56:18 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8ce9df4732cso31197126d6.1
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452576; x=1782057376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z35bHdhSh8a/Z8G1ETcqSJjtROGT6H3Pl9v+4lJ8nHY=;
        b=GBRdwVM1J1qjW9f1O3+eKycj7mwECZpZUEgLgQ1BCfMqLQrTAwqUqvXzfC1Q+WkLJM
         Koy2dyziaJ0CTP8cYawFVpFIdHNimMSDSWUb0Ti2eDWMMMs1JJf1/mtFWg62WAEDVsbW
         4fwQZ9a53q+OxMr0kEbVC5fZOp/IDWwMfXb0O/vNVOXUf/++YwpwBIIhd6xO8wW0V+AK
         z4WrMhaat+J7UkQ1fLnJ66i/uPF8vrfEynEwfBnthx1ADIAf3Epj9YFonOXwwZo4nt5M
         JC2fd9MpU6uBwkInhyEjdmqIk0cWLg9O7nK1WDVdcL/3WhKpxq3H2u6OreQfWopcqRbQ
         +wLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452576; x=1782057376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z35bHdhSh8a/Z8G1ETcqSJjtROGT6H3Pl9v+4lJ8nHY=;
        b=VuB6hgF3KHjyx4sv7+phTD9f6FfwJLjugVnqv2fS2LwGf81WUWc/d+DUyUTgL3bPcV
         jFO07OC0d1D58txIV+cxLL4/YvNmEYmzs61dP5duVtyKEdsXVgcs5YOiGZeVAcw0DNbe
         OO0eYWI/qIfn9NsofgDYjHdAch/QmS5rypZbtEzW2ye8prLpyfa4StJxhS15FVk8j0iu
         gxGURI8fxOjADtzjNoS1r0k1Lva4rlFk4snq4NQ6S5CIea/jovaLPn/64Z0sr/7jFT5f
         HcgRQ64+2xdegbV/buXfJVN3EuZNN0dla/5S7LaL/7fDe1y7i2j7uolfMuk88IKMHWHp
         KZ7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/dRacWj2f7j0/+lqr0JbvLOyjbXfP7SfljZTu0sEkSu+6/Sp2KFQaMk/sEiCf/YqFUvagh1OtgVGXk8Dsv/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxF7hMPPEyofbs8vw5Z/mF3DXvCXOx9uUTJSehBCSeWUYwSJY+D
	Wh0IsuTAZjP77dVy7IrQtDSgRi1U7Uu2f8V/M2hHP74abcljdubtb/k/
X-Gm-Gg: Acq92OFdah+OLfd7KDz83qFzKqLlcNc3cx9b7VZCf2fsGCh9IEFzBDXizID5bJMdE7d
	xkGHLr0kAMYS5RMEvIQ4mO0gqaVBotQQY69u/VzdXATBPdsG6IWbXDu5aa0AHESf0PSpKSYynhW
	PgjEiCq2ALlL6YXjHp3FWDi5V17PPjToz9tvtPGq7VU2Ii4IOxiNUBIvI5tJK+pZ11ZjcvOjBiM
	l8tPukdz0n+WW8WHy3OLXLrdwUVQC6bejbZOaEGgvZu+NpbzveZCe98Yg9jE43xoVc0r9C44eG6
	x+KMH8I1S9fGJnZ2xvPLvSp2ztHKgBAfiBVOUmHsGiFCH0LNMjnvxDQ1TNEq5rk1+Rj2BcroR4/
	VFcd4P5xlOzyJ8Rp9IyQgUXKaqeOpkrVABFfHwgq6ZuIS5uX2yr5H3kz6o0fPUA82mSnSrIqHU3
	7jPyj8kVim69Xd50FX81axNr9mDqwQjj/zmHZyG5TwuzkRhb52HB6KpgUUMZuQNds+uA9gp8F3Y
	YNek+Dm3soEUCQcHY9NlqbTWvGTj0SUd0HTAajE4+4=
X-Received: by 2002:ad4:596a:0:b0:8cc:e8f4:1630 with SMTP id 6a1803df08f44-8d32e50112cmr179007736d6.30.1781452576150;
        Sun, 14 Jun 2026 08:56:16 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:15 -0700 (PDT)
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
Subject: [PATCH v2 2/6] media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
Date: Sun, 14 Jun 2026 11:56:04 -0400
Message-ID: <20260614155609.3107600-3-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155609.3107600-1-michael.bommarito@gmail.com>
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_085617_605432_75BFE35E 
X-CRM114-Status: GOOD (  17.06  )
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

compute_tiles_uniform() / compute_tiles_non_uniform() and assemble_hw_pps()
loop over num_tile_columns_minus1 / num_tile_rows_minus1 to write the
per-tile column_width[] / row_height[] arrays, sized to the PPS uAPI arrays
column_width_minus1[20] / row_height_minus1[22]; bound the loops to that
capacity. assemble_hw_pps() also indexes the fixed param_set[] table by
pic_parameter_set_id, a driver-interpreted index the core does not reject;
bound it to the table size before the access.

Fixes: 3595375c2301 ("media: rkvdec: Add HEVC backend")
Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 22 +++++++++++++++----
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  8 +++++--
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  2 ++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 3119f3bc9f98b..d0f26f736a763 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -37,15 +37,22 @@ void compute_tiles_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size,
 			   s32 pic_in_cts_height, u16 *column_width, u16 *row_height)
 {
 	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	unsigned int num_cols, num_rows;
 	int i;
 
-	for (i = 0; i < pps->num_tile_columns_minus1 + 1; i++)
+	/* Bound the loops to the column_width[]/row_height[] capacity. */
+	num_cols = min_t(unsigned int, pps->num_tile_columns_minus1 + 1,
+			 ARRAY_SIZE(pps->column_width_minus1));
+	num_rows = min_t(unsigned int, pps->num_tile_rows_minus1 + 1,
+			 ARRAY_SIZE(pps->row_height_minus1));
+
+	for (i = 0; i < num_cols; i++)
 		column_width[i] = ((i + 1) * pic_in_cts_width) /
 				  (pps->num_tile_columns_minus1 + 1) -
 				  (i * pic_in_cts_width) /
 				  (pps->num_tile_columns_minus1 + 1);
 
-	for (i = 0; i < pps->num_tile_rows_minus1 + 1; i++)
+	for (i = 0; i < num_rows; i++)
 		row_height[i] = ((i + 1) * pic_in_cts_height) /
 				(pps->num_tile_rows_minus1 + 1) -
 				(i * pic_in_cts_height) /
@@ -57,17 +64,24 @@ void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size
 			       s32 pic_in_cts_height, u16 *column_width, u16 *row_height)
 {
 	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	unsigned int num_cols, num_rows;
 	s32 sum = 0;
 	int i;
 
-	for (i = 0; i < pps->num_tile_columns_minus1; i++) {
+	/* Leave one slot for the trailing last-tile entry written below. */
+	num_cols = min_t(unsigned int, pps->num_tile_columns_minus1,
+			 ARRAY_SIZE(pps->column_width_minus1) - 1);
+	num_rows = min_t(unsigned int, pps->num_tile_rows_minus1,
+			 ARRAY_SIZE(pps->row_height_minus1) - 1);
+
+	for (i = 0; i < num_cols; i++) {
 		column_width[i] = pps->column_width_minus1[i] + 1;
 		sum += column_width[i];
 	}
 	column_width[i] = pic_in_cts_width - sum;
 
 	sum = 0;
-	for (i = 0; i < pps->num_tile_rows_minus1; i++) {
+	for (i = 0; i < num_rows; i++) {
 		row_height[i] = pps->row_height_minus1[i] + 1;
 		sum += row_height[i];
 	}
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index ac8b825d080a2..29b5adb509727 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -156,6 +156,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	 * packet unit). so the driver copy SPS/PPS information to the exact PPS
 	 * packet unit for HW accessing.
 	 */
+	if (pps->pic_parameter_set_id >= ARRAY_SIZE(priv_tbl->param_set))
+		return;
 	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
 	memset(hw_ps, 0, sizeof(*hw_ps));
 
@@ -274,9 +276,11 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 
 	if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) {
 		/* Userspace also provide column width and row height for uniform spacing */
-		for (i = 0; i <= pps->num_tile_columns_minus1; i++)
+		for (i = 0; i <= pps->num_tile_columns_minus1 &&
+		     i < ARRAY_SIZE(pps->column_width_minus1); i++)
 			WRITE_PPS(pps->column_width_minus1[i], COLUMN_WIDTH(i));
-		for (i = 0; i <= pps->num_tile_rows_minus1; i++)
+		for (i = 0; i <= pps->num_tile_rows_minus1 &&
+		     i < ARRAY_SIZE(pps->row_height_minus1); i++)
 			WRITE_PPS(pps->row_height_minus1[i], ROW_HEIGHT(i));
 	} else {
 		WRITE_PPS(((sps->pic_width_in_luma_samples + ctb_size_y - 1) / ctb_size_y) - 1,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
index fe6414a175510..6dafa1dd28507 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c
@@ -145,6 +145,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	 * packet unit). so the driver copy SPS/PPS information to the exact PPS
 	 * packet unit for HW accessing.
 	 */
+	if (pps->pic_parameter_set_id >= ARRAY_SIZE(priv_tbl->param_set))
+		return;
 	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
 	memset(hw_ps, 0, sizeof(*hw_ps));
 
-- 
2.53.0


