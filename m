Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9712CD98DC
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ElgwnBNirjLiswOhHY1Csa+P9LjdxoJoEu8lkda184=; b=PqJFJ/FJcKrMJG1L1YlupTTs45
	JMGV4WD8c4h3hvcZgVC+HBSa+6wSBplpwPSFl7jA/9I1mBM9DBuL/3yv4xulBR/FZ9gE4voY0EobS
	Fh8YaPLi5vcNf6r1m2RNmjB7e2wsnM1CdmTPKsoR0amiUr9xbKxX1fykIv9AQy/AWPDLfTRV+fMff
	UOulgQoUaDf845LzzcwlMmvamzbqchERFoF9Xg4xFbRe210xFtyS8+obV8qJSYBn96WEcMYj2+Rk+
	aFMxWx2pXfUWPrCJQ/eHEhNlDjkOjp8DzKOeSqHsctW5t0FqMCOF9GzHZIKKQtnQpvQcz314r42eG
	PGa1YGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnC7-0000000D9YA-1gzC;
	Sun, 14 Jun 2026 15:56:19 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnC4-0000000D9Vw-00pI
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 15:56:17 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-8ce9df49c5fso42698366d6.1
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 08:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452575; x=1782057375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ElgwnBNirjLiswOhHY1Csa+P9LjdxoJoEu8lkda184=;
        b=N955MgIBF3k+oMtpEOQHmLM5DeVMbyrN1PeO5Z8RZ///58nstpUI8AVLArXfYwEayY
         PCWIhgvFHEIqMEzcs6zEapmQs1OpszYfvpeY0Vpf1eLCC4nV9r5iwsEh4MoigSflcVul
         E/hWF90jQ0MZq/diX5eUHBBYm2ffVCKTEnRMqYlMRPBZDZoAGMwRJ0IUiK6ZvhN61IQr
         mg22nKbdzKzzsMMLYAtN6Acm3yquxVo150yZQVVRQnvmA7Dimd38hG+oapUIW3baGJeJ
         OR5pp/qfyxUyGzhW0LmfvBOatgVED24NvsXFOqp+IL8FuQfpn4d23AhjvLGE4RK+PNFM
         /a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452575; x=1782057375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0ElgwnBNirjLiswOhHY1Csa+P9LjdxoJoEu8lkda184=;
        b=mvFrnBhJwQpbw7nQ5QTmd5Dk/ZfbOx7hxcSEMpoK8a4PqZ8e4vbRr1MIUYzMREKFy+
         Zd3BZgnewjPNCRgBD4YiI6UgOG6jLu55UhPMLFifoy343936EVYc/KMgfVXoR6jRlIGp
         /rj5SjaXPhoFXLqa3LHuo/OyFWOuZDkaE6puqmb+mA1Ktn1ofZMdmfu/Nin3QMbqeQv1
         6I10LIDVjSHX+kT4mvJDHqXvvyxAldMOPaBbsrhPYrZs1LQm10ulKTCjAvtdDrMH7p3R
         iHBAC+plTuQf18pQ9n3fzoZSBdyTROqfSQpLFLB+zi360bDizazlRl/Beih3MHosKYrY
         W/5g==
X-Forwarded-Encrypted: i=1; AFNElJ/VyCXXvVdAk0LFjnIMeMlcjtrupxjU5CPreaLtVQxf80Y83SaqyjpotIZildflLQTTu6pSm/eSJLPzvbTCtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMgdtH/bdl/nahAdSGB67cpxBHz/BONPPUTM6VSjyb2ZdR3BCk
	jw32drfVUz7a5wUXtGmdqyaVBH/eJ+bTMGP9tkwOKYJhj9JbR8/9ynMP
X-Gm-Gg: Acq92OH++/a0IhfoWX/lXUU9cd/AeYO23fOLb3bnaPV75NtGEqIVT+lM60NRJC4ZbSi
	mGsd+JZk89k+bgGasbR3qHTpZY0qEibFfDf1r8HBzYNBESLWJnFKvArue/bgdzpxoqfq2y+xPUW
	hnr0e7YBaLrO/W0eP5k5A6OpjVZZNsiyWMEqaHD7MkFxgQODCN/E+5hG9rm/l/Eo1bJRsyMpXBZ
	heuWfUtR8Ust7ruycB1HDgq60iCzanXjS+KnCff0bOumQUGt/6TOnYFqVQ8/gy+mvlAq5ecn2F9
	oot0KBX7zgwwQZp1P6X+gIf2dxBRjkzcbpROP5mRtxX8ODqLWsyAFuS18BjF+kOvTLSA+48E2bZ
	n2Z4Fxttc3oJw0N5vtgCw9rmXqfA38WQ4cjy5rkZK7jk7LELTWlbyFWXcaM1VPH4rRyZm541LSV
	IABTFDzhia36JjX4NUowx0F5H2BiZquhRcOO2WNkInY1pORT6RTtgSWLsu+3nI5W+sCs7A4lt3O
	/Zkle+Pb9VDSy1EV/borLJTILTEhhzaZQN5nBRejLs=
X-Received: by 2002:a05:6214:3993:b0:8ce:b018:89ff with SMTP id 6a1803df08f44-8d44f8fc7a0mr121880556d6.36.1781452574638;
        Sun, 14 Jun 2026 08:56:14 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:14 -0700 (PDT)
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
Subject: [PATCH v2 1/6] media: v4l2-ctrls: validate HEVC and AV1 tile counts
Date: Sun, 14 Jun 2026 11:56:03 -0400
Message-ID: <20260614155609.3107600-2-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155609.3107600-1-michael.bommarito@gmail.com>
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_085616_082795_5A26ED87 
X-CRM114-Status: GOOD (  13.17  )
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

The stateless HEVC and AV1 controls carry tile counts that several SoC
decoder drivers consume as loop bounds when laying out fixed-size hardware
descriptor buffers, but std_validate_compound() does not bound them.

For V4L2_CTRL_TYPE_HEVC_PPS with tiling enabled, num_tile_columns_minus1
and num_tile_rows_minus1 (u8) drive loops over column_width_minus1[20] and
row_height_minus1[22]. For V4L2_CTRL_TYPE_AV1_FRAME, tile_info.tile_cols
and tile_rows (u8) bound loops over the mi_*_starts[] / *_in_sbs_minus_1[]
arrays. Reject counts beyond the uAPI array capacity with -EINVAL.

These are active-count fields (loop bounds), so bounding the upper limit
here mirrors the existing num_active_dpb_entries check. Only the upper
bound is enforced; a zero tile count is left to the consuming driver, so
the zero-initialised AV1 frame control that existing userspace submits is
not rejected, and the AV1 divisor (context_update_tile_id / tile_cols) is
guarded where it is used in the rockchip decoder (patch 4).

Driver-interpreted index values (HEVC pic_parameter_set_id, AV1
context_update_tile_id) are bounded in the consuming drivers instead
(patches 2 and 4).

Fixes: 256fa3920874 ("media: v4l: Add definitions for HEVC stateless decoding")
Fixes: 9de30f579980 ("media: Add AV1 uAPI")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6b375720e395c..58e2eb7002a19 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -790,10 +790,25 @@ static int validate_av1_film_grain(struct v4l2_ctrl_av1_film_grain *fg)
 	return 0;
 }
 
+static int validate_av1_tile_info(struct v4l2_av1_tile_info *t)
+{
+	/* Loop bounds in the stateless AV1 drivers. */
+	if (t->tile_cols > V4L2_AV1_MAX_TILE_COLS)
+		return -EINVAL;
+
+	if (t->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 {
 	int ret = 0;
 
+	ret = validate_av1_tile_info(&f->tile_info);
+	if (ret)
+		return ret;
 	ret = validate_av1_quantization(&f->quantization);
 	if (ret)
 		return ret;
@@ -1242,6 +1257,14 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 
 			p_hevc_pps->flags &=
 				~V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED;
+		} else {
+			/* Loop bounds in the stateless HEVC drivers. */
+			if (p_hevc_pps->num_tile_columns_minus1 >=
+			    ARRAY_SIZE(p_hevc_pps->column_width_minus1))
+				return -EINVAL;
+			if (p_hevc_pps->num_tile_rows_minus1 >=
+			    ARRAY_SIZE(p_hevc_pps->row_height_minus1))
+				return -EINVAL;
 		}
 
 		if (p_hevc_pps->flags &
-- 
2.53.0


