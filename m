Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A0DCD98DC
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viox6pD1QfsYaMbYifCSfXJ+WEadIZxjJ3+HuLOIzqg=; b=W00/x/RwA8yFVA9VPzOTBhj4TQ
	FcoBbSYWZk4tF1lnMBODOS17oTUAnsswERd5MllkJP2Ws3mn39ri3LsI0hofQNT+xfs31hpThg+lG
	64wiQ6gdSDlWOK9pvi0uyIvU0RuRoWHZjREMKDkarr8UlRnMQQ1WZPGsicWf39eGNCm3pjSWEclLT
	mc5SCdezdrC7jFxfvM0X0Ja/ODy82gpBJ5MLbwn/2cdOWm+CX7Q7EiJdzjK28eK3YDaAweMCPl+Iv
	fWkMO3Fl/+3xz3C1NtypRHQzmYlLajF/aexendyZzLNXreRjpzygqx8BWLEEp2xoSv1OfT6b6EY5v
	F9VAlnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkbO-0000000D0E2-38aA;
	Sun, 14 Jun 2026 13:10:14 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkbL-0000000D0Ag-3WX8
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 13:10:12 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-9157b895c57so231957785a.3
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781442610; x=1782047410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viox6pD1QfsYaMbYifCSfXJ+WEadIZxjJ3+HuLOIzqg=;
        b=M8HIOGKB4T7zRXetYJ/5N2HEerq8jt3zNXnVzehMLvMSfa8RIgePoXd83SedXQk/ju
         6OuAfXKkp7F5zxVE0wjpG6Ey1MDIMJrEoWJziKVs/10MKYXC4ve4VqoCYKOqyvBq5GWW
         +w6G91kKQgvBXYI81y1maj5PgmDl3HMHMMBA3CP+PZxGVMN19AE0aqbYwx5tqnQv/fyn
         6GH/XCxWRa5I6QOzFj40DNlB+s6rhBcTCxYA+roeHdDTQe1Z276E+DJz/ZrWuzXfoQsW
         iVTHCN5zRrKwIpErIsjc52w3As+xstr9nbZfZZBZrW15MLlERhLVgdlMT8qnqYtcBFL8
         XSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442610; x=1782047410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=viox6pD1QfsYaMbYifCSfXJ+WEadIZxjJ3+HuLOIzqg=;
        b=EOqcaKE4GBqwepHtmMgFyJI3iPfOk76j0HbWH6mZ0KkffwHejZXdRdBSzs3OpCii/b
         0a0KasV5Y9UZowjXH3ogMe8eRco4hkX1mY5kc7NJM0cJ7fnA3GjnrgBPb4h0wUu9qsrY
         JBxDClIlZUSef9JSpwAr3paWETk1KaFVaHENG4H4iTQqARovCXbUavY6SmowNiybx+fV
         cefNxpehqrFeEOlykVB4g5q8TultmR8vBjWZx6SmvqHla9JQrA/2wUNjE+Qx7LLCsEWX
         Nj6BSBbcpPDvYiYo++zrN7bCvdUnc0FLoP3XTY69/2Xxpak7+8XaAiai5cYF5QUq8sIt
         K90w==
X-Forwarded-Encrypted: i=1; AFNElJ8SEyMHUlw1T8PJQZCk/Ez9S0W416NJiFtEKHS3x8IPxaOiekW7kaf48UrkVIfHOzLDnqEXNbPiOJ7tGeG7TA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNacs2nCGlv2uA7BYeQITXIUvWaJJJPtCzuyUHRPeKbXtv/ZmV
	8/Dfiaon4VlLRk60Ohtd6P8DTmjAu/YjF8jf2JuIvvhpsDV7defguCb3
X-Gm-Gg: Acq92OEz5gqfki110EN+fp5+rfZt66A71STkmMzcthg9NWqhBlPxW1GHY13FLczdjZM
	IiV8o0zY7GmMxldC2bsOV4+6YDmi422msDCPiH/ytJTmYQlf/Au6DqhVCTeI5G9PS/+G98dUdFu
	fpS4sn4KT5FdVwQ3uG6x8G/XqgE8vKXneLP424z0z7yzMfIoMcCTznPF/8iuNhcvId+7C6UNjXw
	JQtOfZsWfbLWpo/ImAN8uq4hF2sGXxkXBAPl9W3o3kPiD4RxTToXjzhvHm2+eS69ouMbsuZaoLb
	vSFE1CFJHwbUQjOwx+UJVhOp9DjYQ6seGdIHgcacG8aCsNKY+GBufEqd9M0mvB3JFo5sulAGEu/
	12SPixkHRK9lm09uhRH+8xbuBH34RHsBVKRB9CueJRtZSAmBJRO3fwh+i66qgJ03wAahqqLlNFm
	16hzJX9sefYV6b0bP+fEB9fkYuW9ilGeNL+pk2NN5y8Z9rzVutDat67yfPn1aV/A/DJOLnZ/lpN
	3WzhPHUvFj8vd5Z5Xhbm5Q1yWUmcj/nWbkK8j2K4Mo=
X-Received: by 2002:a05:620a:bc8:b0:915:a73e:3544 with SMTP id af79cd13be357-917f1c56720mr1256745485a.56.1781442610430;
        Sun, 14 Jun 2026 06:10:10 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm752878985a.15.2026.06.14.06.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:10:09 -0700 (PDT)
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
Subject: [PATCH 2/6] media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
Date: Sun, 14 Jun 2026 09:09:59 -0400
Message-ID: <20260614131003.2524025-3-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614131003.2524025-1-michael.bommarito@gmail.com>
References: <20260614131003.2524025-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_061011_903899_4743F128 
X-CRM114-Status: GOOD (  17.37  )
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
The decoder is an ARM SoC block (Rockchip RK33xx/RK35xx) not reachable on
the x86 KUnit host, so the driver-side out-of-bounds write is not
reproduced here.

 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 22 +++++++++++++++----
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  8 +++++--
 .../rockchip/rkvdec/rkvdec-vdpu381-hevc.c     |  2 ++
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 3119f3b..d0f26f7 100644
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
index ac8b825..29b5adb 100644
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
index fe6414a..6dafa1d 100644
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


