Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B49FCD98F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 02:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gsyD44v5d3JS7lai7ZiO/JkymT3Up+9z8qXjXKcYr8=; b=gC/D9J3zcMrQ0/0gw++yvQyvXA
	C3A/0OhtrUbEjKf0j6YSf4PWCTNxJcUFeDWgIYauKDz5+vtbd8JfbyIqvD76ElAXBD0S2iaw99p6+
	Dg9BDwUWhSN2aeKE4vlnecK1FW7grGoWuhwDmAy4IVAq24CT7A3K4cSHRJ1X98Wdw8GpBLW82RtfG
	xCcp6OxOAf5liIOL/iQ+rHR8liSZegIbuqRCcVnclLV0Rpi/29JOKPWCQmjEH4x1tIHSLWtmRG0Me
	wd7di9gQHHEQZoWHzHLXYNwNvR1V46YpmMLF4YUjQ5eU3gTKOwnBnNi2SEGIDOgVMcRGY1EySL6VY
	FKeMgYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsS-0000000GUK6-1SLY;
	Wed, 17 Jun 2026 02:19:40 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsM-0000000GUAw-1zVo
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 02:19:36 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-9157ec935c5so691028685a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 19:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662773; x=1782267573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gsyD44v5d3JS7lai7ZiO/JkymT3Up+9z8qXjXKcYr8=;
        b=a3Zj8sqrPB+xS6qWZjPoQX+iCv/PpW94OV0a9GjzeDJyXidGQRfJeeuyS90zNmpsTm
         CjIckXTGrAo3jIBonMcyneP5DdrrXQyL2nkJfcSJd2JpbDeVZ+YZtAw4kBzBq8uRhGpg
         oV8jFe+8L1wqWgnIByIyfzKavGSWmcR4JghnJkPoQNzKL2F4n24i0OwMdMbTEEHWNdLq
         m+BdHwCtnP0vNJPvkZ9sXbN+kD9P1DNL9wcnEyeetc9TzZCbDO0V8aDwPIAAS2QUwS+z
         QN8lXZTdNFX9M92LNY56+v5Ei9oFb277N7cV5ay9tzUU76fVceRkctUoFrNnpyCMFXYg
         13QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662773; x=1782267573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6gsyD44v5d3JS7lai7ZiO/JkymT3Up+9z8qXjXKcYr8=;
        b=nAO4O/fY8laoynYTOJ3P5NcZzhzIK5gzLZpqgXSOEwDzaGq7htgzylcEws/NB0iS+l
         pVwjrfwcGaPzLTuTOSXQIxDduxZQF/WB1lXt/ISj6eKV3Ug2gtLM+NSiOp0SlwZFgvkj
         bOea0WZD69Qyv/vqyb+rnsE10n5ovk88rHRsKLCr3xAF1D6jkzCx3kPPRfCLQkCtvfnE
         0q6/OH8T0IUYuLBg9H/uRkOPcr3loVOdoCr+UbeUz3yDGRPhwZVLEvd2cwCEUd05RrFr
         JJNaw9uefkoObYQ+TTUAMxSlaV7bpP+cGKYNPKd+folWxkBl31nieYQgbLNW86qxHVQ1
         lzRA==
X-Forwarded-Encrypted: i=1; AFNElJ84lAq56ZlDOUy00SykamfVl8ZTLHO3vNdIiwj82gr/yfBSaIC/JNlEOxTtosrFMgLiO6yl2QR3uFLRCra1Zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzzxQyHVqj9//WdquetEpNC5zT7LygRt5d44B5wI/G010bDRjs
	eFRJGVrXyhq6q/jg3KiMjWzvaqGEFZ6F3Ly5fEjtyP6RqnvWDWlDoQsk
X-Gm-Gg: Acq92OEq1Lfx4VhtRaFfY7dqmSlVvBMiiaG2EdlQQX6zw4yEVa/alpavAyjq8cZ4qt0
	OPPLZCW3gdtfBjnB/xjZqUHFDIAwq9LkSdlwx1reh3v5cK6Vo8zib+ra5kJA/FgyMt+JmBiY064
	fPMc6gWqsvW56OfsMUngd6BbJADbI0TB355ORTF9HgxXrUAZHe9AOnyoRGdcU8yHt0IVfJt0Ega
	DZijb/n9/pexqJ85TDXCwKH75tJhdPVx8FaQ9nXouvJcVYIUvmOwYbIT2srl0DM0WGsT2Tg4Fbf
	dHAERbf/JxGdtEx6oxdx/m26NAfZFlAT8GX8RmVCNkiguDEYMGO9aUaK1vCsUsyqwP974H73UT5
	P0QiUSPGgksysWn6qfcKtDPRCeEucWkVGU3rTEH8t5oahh8Ii8/PYqoyOTNa7CdYDeahpAg3Bnn
	oN354HzMMcplAgZWXloEB9rjfwZZCBWCZhHyAWzOI8rPBuIX0agqTO57iLxckDEfS+Y7lzMuh14
	cYbsxww8yiPgMECp6Eb/8F4DkzwnIFM
X-Received: by 2002:a05:620a:19a5:b0:915:c4de:7ab7 with SMTP id af79cd13be357-91d8acdc2eemr405909185a.35.1781662773045;
        Tue, 16 Jun 2026 19:19:33 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:32 -0700 (PDT)
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
Subject: [PATCH v3 4/9] media: rkvdec: bound HEVC tile loops and PPS id to the array capacity
Date: Tue, 16 Jun 2026 22:19:01 -0400
Message-ID: <20260617021906.2746743-5-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_191934_555839_C8EC93F6 
X-CRM114-Status: GOOD (  16.39  )
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

compute_tiles_uniform() and compute_tiles_non_uniform() loop over
num_tile_columns_minus1 + 1 / num_tile_rows_minus1 + 1 entries, and
assemble_hw_pps() writes one COLUMN_WIDTH / ROW_HEIGHT register per tile
and indexes priv_tbl->param_set[] by pic_parameter_set_id, all taken from
the untrusted PPS. Use the bounded v4l2_hevc_pps_num_tile_columns() /
v4l2_hevc_pps_num_tile_rows() helpers for the tile loops, and bail out of
assemble_hw_pps() before indexing priv_tbl->param_set[] with an
out-of-range pic_parameter_set_id, so the writes stay within the hardware
tables.

Fixes: 3595375c2301 ("media: rkvdec: Add HEVC backend")
Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  | 14 ++++++++++----
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   |  7 +++++--
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-hevc.c |  2 ++
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 3119f3bc9f98b..753aef3aee51e 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/v4l2-common.h>
+#include <media/v4l2-hevc.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "rkvdec.h"
@@ -37,15 +38,17 @@ void compute_tiles_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size,
 			   s32 pic_in_cts_height, u16 *column_width, u16 *row_height)
 {
 	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	unsigned int num_cols = v4l2_hevc_pps_num_tile_columns(pps);
+	unsigned int num_rows = v4l2_hevc_pps_num_tile_rows(pps);
 	int i;
 
-	for (i = 0; i < pps->num_tile_columns_minus1 + 1; i++)
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
@@ -57,17 +60,20 @@ void compute_tiles_non_uniform(struct rkvdec_hevc_run *run, u16 log2_min_cb_size
 			       s32 pic_in_cts_height, u16 *column_width, u16 *row_height)
 {
 	const struct v4l2_ctrl_hevc_pps *pps = run->pps;
+	unsigned int num_cols = v4l2_hevc_pps_num_tile_columns(pps);
+	unsigned int num_rows = v4l2_hevc_pps_num_tile_rows(pps);
 	s32 sum = 0;
 	int i;
 
-	for (i = 0; i < pps->num_tile_columns_minus1; i++) {
+	/* The last tile entry is written after the loop, so iterate one less. */
+	for (i = 0; i < num_cols - 1; i++) {
 		column_width[i] = pps->column_width_minus1[i] + 1;
 		sum += column_width[i];
 	}
 	column_width[i] = pic_in_cts_width - sum;
 
 	sum = 0;
-	for (i = 0; i < pps->num_tile_rows_minus1; i++) {
+	for (i = 0; i < num_rows - 1; i++) {
 		row_height[i] = pps->row_height_minus1[i] + 1;
 		sum += row_height[i];
 	}
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index ac8b825d080a2..568746dae9a61 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -12,6 +12,7 @@
  *	Jeffy Chen <jeffy.chen@rock-chips.com>
  */
 
+#include <media/v4l2-hevc.h>
 #include <media/v4l2-mem2mem.h>
 
 #include "rkvdec.h"
@@ -156,6 +157,8 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	 * packet unit). so the driver copy SPS/PPS information to the exact PPS
 	 * packet unit for HW accessing.
 	 */
+	if (pps->pic_parameter_set_id >= ARRAY_SIZE(priv_tbl->param_set))
+		return;
 	hw_ps = &priv_tbl->param_set[pps->pic_parameter_set_id];
 	memset(hw_ps, 0, sizeof(*hw_ps));
 
@@ -274,9 +277,9 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 
 	if (pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED) {
 		/* Userspace also provide column width and row height for uniform spacing */
-		for (i = 0; i <= pps->num_tile_columns_minus1; i++)
+		for (i = 0; i < v4l2_hevc_pps_num_tile_columns(pps); i++)
 			WRITE_PPS(pps->column_width_minus1[i], COLUMN_WIDTH(i));
-		for (i = 0; i <= pps->num_tile_rows_minus1; i++)
+		for (i = 0; i < v4l2_hevc_pps_num_tile_rows(pps); i++)
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


