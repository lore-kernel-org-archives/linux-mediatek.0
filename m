Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6883CD98F6
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 02:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U3LnPj4hsy7t9yGnUJKMptAoaBCn6LSom4+XC5E/nvU=; b=GzltX2FoapsCrRat4VC83rfwQs
	i5bZdGC8mJKM+qL2Ao1eA2Zmx7VtYIMbM3J9eYbL4E7bfbH8oFw5zyqmMx6CR4DHIc7pc88hMVdWl
	iSmJtPScSjpyo+nFe1fr/F+8h1vAlFG3+fZTtQpGZ//8aJ3XrauoSHH7d822+mtmWg9zW5VAP7mdo
	TYYKms9JsXkLZBxeeipnfFrG/ljq2DnGwf2NrpogeTEnCDOfKnhhtgk6RDzM/P34Ln4HJXMtYJDPM
	M8uG5e0nTyr8IfOHBPsrtQWuU6SB5NMxemLVLBWegQSV++OGDYNd+Y/x1ylIKAUOkbgs/M8udhdkW
	0JKnLO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsS-0000000GUKh-2Yd3;
	Wed, 17 Jun 2026 02:19:40 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsN-0000000GUCa-3Qz1
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 02:19:37 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-91578122305so816003785a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 19:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662775; x=1782267575; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3LnPj4hsy7t9yGnUJKMptAoaBCn6LSom4+XC5E/nvU=;
        b=jFjXhi6tHwlhFv8YQLBKGGlbzNHXWY+uormjOuMHGvbgManHrJLxO/gmRdq/yPpLjG
         +VMCnjrxncftKiHTo/l4YnVOfSzPGS5aGZzmQsfQsFJmKuVTW+NJwldkgOACj6YjVW3Y
         HLbV4IHYpAlyYPIWGhd+8yc4ZO7kpxAbOaV2f49PRwhMrZFPcVbIRPJ/AbBsRbqzWUmk
         IuZAVAlpu0NKrOI1DwJVMQS4IOVJefN+ccNhzSMqOiPrnR1Zt9BDj04qntg1uv/B0slI
         Ktneo1Rgfh6Eh1W/N7gBEy8xxl24COwWhvlFhrbKuZaiLPwihysNYGswjjlcBUg72GVP
         kvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662775; x=1782267575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U3LnPj4hsy7t9yGnUJKMptAoaBCn6LSom4+XC5E/nvU=;
        b=UQ25Lv+jhrdXxwERl4xhCdOWkqGERE49EUrX1Mns8Gw/kSl6oDEmV/dHdeimfyt433
         uoUyovGq4owmhViQC5TlAph1ZgZVGKnED781yLSknyDEqokPJ+f5/C6TKEMs5uvHlhWr
         qq2fVar+YUpjdfZ8n7051kqvnV949NovH0o5Bfqo+ySpQN/N/VSEIMqEEKASCgBpv8qo
         QcgeqMykh00F61XNB5msg/BEeEXUnagHZ3YoT8rlr/lEkY0je5h7RQUIa8rSKFIcupAj
         UlBPtIDqBXzNR6xYH8N2uyDbGR9VF3aYTDqNHGuob2YXbaAtq/OmRemInr38srn4zPnO
         W9xQ==
X-Forwarded-Encrypted: i=1; AFNElJ/K0olc4Sc539dCHVFoBcUk9khJhikZNaWxSFNZypinCpSwccKR3uLP171Rr1HL2AaS7fB/RNjAx/SnnQdTyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDkshEo1FfX+tCeavTsELKJQZbpmEzOkw5cXX0lOCQbB9Uz1At
	YljlOcWZTx7Lyj3JkI+IpZCSGhf8qEBNKJ5bX0d618rQewLiwVUjLDwI
X-Gm-Gg: Acq92OFy6IyltRLsuLqpGJD2iiicVJa8CXDKx4xmkL4WcQyz/RnLAoZlwwejErhTt5F
	EZDtMR5Ih2O7iysU9S2Smiw7AvrqHraUPaOgwAkTGZXVH+JBTdKdmGtOxaZj88j/KguGoNygAnL
	3hwizbmuzggyvx8fVvc9pkHmW8rlyy02YIod/BZt/BVhmVkV+/NqNHBB0bnAa0nJ554WqovQrr2
	Cb8kx1DBMAjnVbFAGfktgv3wRPpCZsvT1lkcjfEnjAgzqZUcgdR5w13HdeqtxkkIF935Z5zMcyu
	yn4cwXnz71goV4TiKQ7qvKOdFngb3hvovdzXIt+hDDKJBLv1pOh8gcK20PUWR57dxAEwpEdrIeL
	jcOEDnHkCOw/PyTKCVVijRRbmpFJzj00OSXikbcDLRE7eCe2O5BclBt7UlBaFaAqr/3t4kVslPl
	zFyqVCTP4POIeDJGFW//LaImMoEIAL/R8/KGeAdXXE5F6srSeWWkKbAO5CUHUaZXVhtOBUyhMaW
	t6Qq/D4UAfEoX/1J1m97/s8mSFFTOrF
X-Received: by 2002:a05:620a:7084:b0:915:eec4:1ec5 with SMTP id af79cd13be357-91d8e49c839mr409744485a.51.1781662774717;
        Tue, 16 Jun 2026 19:19:34 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:34 -0700 (PDT)
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
Subject: [PATCH v3 5/9] media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer capacity
Date: Tue, 16 Jun 2026 22:19:02 -0400
Message-ID: <20260617021906.2746743-6-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_191935_865651_35B66821 
X-CRM114-Status: GOOD (  11.30  )
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

prepare_tile_info_buffer() writes one entry per tile into the tile_sizes
DMA buffer, sized for a grid equal to the PPS uAPI array capacity. Use the
bounded v4l2_hevc_pps_num_tile_columns() / v4l2_hevc_pps_num_tile_rows()
helpers so the loops stay inside the buffer.

Fixes: cb5dd5a0fa51 ("media: hantro: Introduce G2/HEVC decoder")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index e8c2e83379def..e7a7c7a42467a 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -5,6 +5,8 @@
  * Copyright (C) 2020 Safran Passenger Innovations LLC
  */
 
+#include <media/v4l2-hevc.h>
+
 #include "hantro_hw.h"
 #include "hantro_g2_regs.h"
 
@@ -15,8 +17,8 @@ static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
 	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
 	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
 	u16 *p = (u16 *)((u8 *)ctx->hevc_dec.tile_sizes.cpu);
-	unsigned int num_tile_rows = pps->num_tile_rows_minus1 + 1;
-	unsigned int num_tile_cols = pps->num_tile_columns_minus1 + 1;
+	unsigned int num_tile_rows = v4l2_hevc_pps_num_tile_rows(pps);
+	unsigned int num_tile_cols = v4l2_hevc_pps_num_tile_columns(pps);
 	unsigned int pic_width_in_ctbs, pic_height_in_ctbs;
 	unsigned int max_log2_ctb_size, ctb_size;
 	bool tiles_enabled, uniform_spacing;
-- 
2.53.0


