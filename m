Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA199CD98F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 02:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuBm79rRC3GqReCC3VjX/W1uFvcufiVMiTRTGLknay4=; b=VzPaSKzDq7GrqLJr8vSVkOecuA
	GBAA8qGBpuurxbLtGCa91RvDnH6ZXP2oMNBiXXn0mssX2V37Kmt2U1ki9GOFk/6BbR4MkkH8jiLd5
	z3coUl6SCbRu4IJjz4O/vVcMvR5bNH8YaLCiBYSHCYvjVjmwbsAlOBy7lh/+RS2HttLOl/tcPy5Lx
	R31tfzuXs/nbmB7x7fqYKI7D2ovEhJlw4C5m56Wvmpps78o2HOhlH4i0Hepuuid3JvpCt3+I30/Kl
	5ZSYdmo/zkmJNMBtIsB1Fxf4/AIqPYBeFvJLrdxgEAKeVMyEwN7nrGZnzCVYrsfrVFdATMtcPD7ji
	U9MirQ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsS-0000000GULB-3Q78;
	Wed, 17 Jun 2026 02:19:40 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsP-0000000GUF9-2hkg
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 02:19:39 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-91563382bcfso592749785a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 19:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662776; x=1782267576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuBm79rRC3GqReCC3VjX/W1uFvcufiVMiTRTGLknay4=;
        b=XxrQIto10QueTzSSBf91dwfrJfreCxV3zs4sCA6L64lXi4gdGPhUGH/rLkOa5QwseN
         CsAXg2Tl2DdhSCGhawa/Q2ELII1QVQA5gutVyQ4zf92VhCQPvkt+ptr7Cn1EtQE1wox1
         KWpJzq5wrCclHPtsnuueB9BVDxMYasmbIXuRi8xfrURvYPoGks0uvo5o1DS2ZjAZWB7/
         IK0xUmmrUFn70fMG6Ge8aJyBpSQYvrrWr6HzVxtF9gkz4JTGi+sGEsUsd8WSyd48eYJp
         timhJSA3iy4BQn8pULMpV5MFoxXnPENinyxXQoRU5eO5ZhTKA7UUq++6ziWX0GlomFdZ
         anIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662776; x=1782267576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UuBm79rRC3GqReCC3VjX/W1uFvcufiVMiTRTGLknay4=;
        b=DQ8fXEYbVh7EZ4GNF8MUI0EHGrW7lzMYNj87S71DEN0k9nvwaSx7OwYFEHym7lgAo0
         AQb1SbrhLvs/xdYeXXrHcBuaSG/BUXtKneEW7KqNvVUsbR6aR5kCXMHEs97Vp9hxNLdi
         ZnIrGLV2gQteDm5oAK1NWWvtAA6YEk4d/hhqEYScPNj3AqXkqMKPWgq70+o4VIL+sK2j
         /ppTbSxLnaBn9jPnxDZysszH5W0Fj1es2W505GaBkTWZuJIJUr5K150vcTUcljczd5Gt
         55CQ3CZ+D9Eb3Z9pj/OozicYDckgBLrECGFUpkO56pIpnQwrAnK+hZMI6ZcU7o0dWc/+
         TeCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xmfeOkLxBtD9rddUSNQ4V/1e/GCVQzZ3frv0lZf5nHRICGAR80R0zk8h9sF1FUZo5fH6fX/yli2CZfhL4wA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+IZvAQOTyPTGhpnkX1pS8aABIl7v/PkbJPUUEnCKhNjG2Tbll
	e8qGL1MR9MwFNdmcXvp5Xr0bSwY2klojq5yGl+//8ewPuqS6sGVKXDtj
X-Gm-Gg: Acq92OFXbhTigEVa6gnbRWgS1/ME7HoMao+hhg8sdAamjzmJnsYrqdFb3MLuQuO56fo
	gUTEJ3In7Tpt9vVNNWb/9m5dA0xlIsx1M/gfBgQ5rWN1q7Vs1vIVOoFQxqn2zxxd+VMmjjvn3hB
	RYXlXCTngxisuRzz3Pfp6AOJDElbVRq6Xd/iNM6e2lnuiHs/mmzZYm0tr5qBbOaKq5dC3WduUT1
	4nwjBvpbjSSZYvv/kJQJwxyfU9/VYXakU73FrdeXv8TdFIPMNS1cB/BidwSz2aU12phY2s18ASd
	Ea6QQApGLs2p4ZJqZaHz7GCstHvO8IE7y+8oD8O9Dl1SL2/vQGln3et727pG0WeXc78/MTABFk2
	hELXpmQ9YpfpCIcG0+Ivpr/0I1VzfOiesCnHwOwn3We4B7Rf82hg19bnc3lNKN6p2mzDzTFIRSl
	aCrVrWvHRnA1mZyL31RWGrLKke485a0rJ191HFmqKMlzd++tl3UitPwJEDSQ46aSa/bmRC9Gi5/
	Cxolr0YTTtVn1edunLFdMEtRcfswSwJ
X-Received: by 2002:a05:620a:17a6:b0:915:9125:e649 with SMTP id af79cd13be357-91d8dcae125mr414112385a.44.1781662776545;
        Tue, 16 Jun 2026 19:19:36 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:36 -0700 (PDT)
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
Subject: [PATCH v3 6/9] media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffer
Date: Tue, 16 Jun 2026 22:19:03 -0400
Message-ID: <20260617021906.2746743-7-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_191937_855928_D045C121 
X-CRM114-Status: GOOD (  15.83  )
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
DMA buffer, which holds AV1_MAX_TILES entries; tile_cols and tile_rows
come from the bitstream. Guard the division against a zero tile_cols by
initialising the context-update values to zero and computing them only
when tile_cols is non-zero, and stop the descriptor writes once the
tile_info buffer is full. The tile geometry written to the hardware
registers is left unmodified; the per-dimension and total tile bounds are
enforced by the control validation.

Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 32 +++++++++++++++----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index e4e21ad373233..fd00dbd79fe46 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -578,16 +578,30 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
 	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
 	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
 	    ctrls->tile_group_entry;
-	int context_update_y =
-	    tile_info->context_update_tile_id / tile_info->tile_cols;
-	int context_update_x =
-	    tile_info->context_update_tile_id % tile_info->tile_cols;
-	int context_update_tile_id =
-	    context_update_x * tile_info->tile_rows + context_update_y;
+	int context_update_y = 0;
+	int context_update_x = 0;
+	int context_update_tile_id = 0;
 	u8 *dst = av1_dec->tile_info.cpu;
+	u8 *dst_end = dst + av1_dec->tile_info.size;
 	struct hantro_dev *vpu = ctx->dev;
 	int tile0, tile1;
 
+	/*
+	 * tile_cols and tile_rows are bounded by the V4L2 control validation
+	 * (V4L2_AV1_MAX_TILE_{COLS,ROWS} and V4L2_AV1_MAX_TILE_COUNT). Guard
+	 * the divisor here, and keep the descriptor writes within the
+	 * AV1_MAX_TILES tile_info buffer below; the register values use the
+	 * unmodified tile geometry.
+	 */
+	if (tile_info->tile_cols) {
+		context_update_y =
+		    tile_info->context_update_tile_id / tile_info->tile_cols;
+		context_update_x =
+		    tile_info->context_update_tile_id % tile_info->tile_cols;
+		context_update_tile_id =
+		    context_update_x * tile_info->tile_rows + context_update_y;
+	}
+
 	memset(dst, 0, av1_dec->tile_info.size);
 
 	for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
@@ -598,6 +612,10 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
 			    tile_info->height_in_sbs_minus_1[tile1] + 1;
 			u32 x0 = tile_info->width_in_sbs_minus_1[tile0] + 1;
 
+			/* Stop once the tile_info descriptor buffer is full. */
+			if (dst + 16 > dst_end)
+				break;
+
 			/* tile size in SB units (width,height) */
 			*dst++ = x0;
 			*dst++ = 0;
@@ -622,6 +640,8 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
 			*dst++ = (end >> 16) & 255;
 			*dst++ = (end >> 24) & 255;
 		}
+		if (dst + 16 > dst_end)
+			break;
 	}
 
 	hantro_reg_write(vpu, &av1_multicore_expect_context_update, !!(context_update_x == 0));
-- 
2.53.0


