Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB9ACD98D2
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zfgey8wi8pckGyHiNYDJA2CHFfMtkrqEl07FMub/Hg=; b=m1fvdY3mtToE4RmEBmolIu8e/2
	cUZPOkZTC8r8zzGKErc9HmDQIxtLBr16rrg/McUpXcT2FbwdXtTPTgYb4gMUCqsf6p4Az3y3oh62Z
	th6mJyyy9QYq2q6DFyDimFQqXvjtfIlpeczBjPyYLqbloZv8i5GmO9mtqCqMrxRxfH0tZEzVLlkGw
	42mQroZYEymqDjPWRBm7pP8kCgKRTvciJc51knLTST58aihJv/Y1us/sJGUlyQAV6s53YCweIwGL/
	ibvoWpqN9ufk20ev18Ua5czKsPU3dBjhu/vcardW1dQXbDBzyYO093b/ORxKcThYtxj/MlMX54gw6
	FQHrfOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkbS-0000000D0Is-0AMk;
	Sun, 14 Jun 2026 13:10:18 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYkbN-0000000D0Bz-1hvj
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 13:10:15 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-91591f19c30so358258985a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 06:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781442612; x=1782047412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zfgey8wi8pckGyHiNYDJA2CHFfMtkrqEl07FMub/Hg=;
        b=S7e0yDFoaZq43Z1YGiDuS57U5Yf25Q9bMTAccOzIaVoWyhWoTrin4f/NdhBPrXKLWJ
         fZ2Kj2x+YjwD5+nUP9jLcgrUM6xLl3oATU/bgZfYTzHD4HNcFkR2CLBNXTzYPCqFbdWs
         Pdz/qo8aGoqPePJy/EvAbQY7R9WmyPlVrXbXu6iGx6q64xDwrKCYGZPP9ALBYoTAh7Nd
         JheXMx5OpFYfbqgotp6F1OsoSlB6tiHPCrp7gFaaznpdgxtLig82kPrZqJWeWv0WnOYw
         6ZZJTslcU6NSnDeWJBX/Ub12cJEEunYnBx2SAEiC/YMVI0cVu1K1MORCGI2/JUZ35bzu
         0i2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781442612; x=1782047412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5zfgey8wi8pckGyHiNYDJA2CHFfMtkrqEl07FMub/Hg=;
        b=AodJSNnIMqBRMmodkI+tG3KNNvQ155h4uC0KnyvyDLLGYN2VnbL3LYaTe2iD4EAbc5
         /GDaHnP9Uiur3S10Af6IyxKbJfmF4NwbL4z5/05HGTsDGncNwntxRqQDssaEZPh8MNbM
         iWl+KeWpwlgTo5Yjuh6qSqR09n3CTNGXnVGuQNWjRbTwCGazl6/EO24Ef4xLFXWAxcSM
         hfcmbiTNgN4+rtqCvq5ZwQDISu1wxXWm698FoZoqq/CXlzlw0yPkQ+qYiFlkOH6wl9qt
         0EWlqn5G3P8uy2mTh62wMkhpv77tqIkS3gW1D//nxZEXVmyHRsvDtiRZO/+GVnBYRvn2
         /QRw==
X-Forwarded-Encrypted: i=1; AFNElJ8jglbsR+ruRv1r4hvFIj6wlJGjf0JBlaIzWkkxdmIzf722hrZmae/NJFlB/RjoRVMK45MmYRjHgdwqSfLc1w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdgXTYpbzeKwYuUyYkmkd5Ix0bFbOBrb0yevFrVaUEx62Kc986
	daYV6F8iP7Ib7QOhoLNjCMef1R9vQgqDMu+JrO6cx9pYHkYl5wJ4dL4g
X-Gm-Gg: Acq92OGTLfYgxzsWd8U0usG/t0BdYPoMyirKHK77DVpY/CGFABycXxB/zpuQsY/gEYa
	uUxKOYaRSzlaSEsGVizwbKqIYzpC9d7KL6EF4PxEUKeZssmTBk3uJ7LEAWxPJoUH0BMByBFGYqN
	odGAHPIRTgeOoHx1/1hh5k5Ho4qo77IjybAXvm93ZX9nPxiyeYMVSE+DNHqbqFW7drlnK1gLnyG
	e/+VfAzchLUgzlNpoAuZoJhryKp9JYnH4QMbUpTRZNkrlIGZ8zBYShEAYsmyl7vmueORUmsEUGX
	G/Xzy9RzJls+5qdtYZMw9XJ1Dl0pFDaUn8nydS6HSOww7jkKc1E8auwRBs4jfRnMSc3IBR375ct
	ll76P8sdDtWcYvnKGNLe88/IRoxHWjgtMGKPmnFDQ/gdyj+o8TphqK5hAZyxZ3oKI0qNl0qY6ZA
	033IKpuh6/fCaKc18sBtgxgs22A4Ay5xKaipS4G1kpt1o8HwH7EqzRABhNj11hIStjZ0l31dbCj
	oBC2NaqdW/LWFHgBOsm8ka44CAiJgRftMCGh7WAb8w=
X-Received: by 2002:a05:620a:2590:b0:915:aa7d:42bc with SMTP id af79cd13be357-917eefc36aemr1143196185a.10.1781442611978;
        Sun, 14 Jun 2026 06:10:11 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91619f1b400sm752878985a.15.2026.06.14.06.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:10:11 -0700 (PDT)
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
Subject: [PATCH 3/6] media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer capacity
Date: Sun, 14 Jun 2026 09:10:00 -0400
Message-ID: <20260614131003.2524025-4-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614131003.2524025-1-michael.bommarito@gmail.com>
References: <20260614131003.2524025-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_061013_465742_C98B4B2D 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
DMA buffer, sized for a grid equal to the PPS uAPI array capacity. Bound
the loop to that capacity so the writes stay inside the buffer.

Fixes: cb5dd5a0fa51 ("media: hantro: Introduce G2/HEVC decoder")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
This is an i.MX8M Hantro G2 SoC block not reachable on the x86 KUnit host,
so the driver-side out-of-bounds write is not reproduced here.

 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index e8c2e83..94fbd79 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -22,6 +22,12 @@ static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
 	bool tiles_enabled, uniform_spacing;
 	u32 no_chroma = 0;
 
+	/* Bound the loops to the tile_sizes buffer capacity. */
+	num_tile_cols = min_t(unsigned int, num_tile_cols,
+			      ARRAY_SIZE(pps->column_width_minus1));
+	num_tile_rows = min_t(unsigned int, num_tile_rows,
+			      ARRAY_SIZE(pps->row_height_minus1));
+
 	tiles_enabled = !!(pps->flags & V4L2_HEVC_PPS_FLAG_TILES_ENABLED);
 	uniform_spacing = !!(pps->flags & V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING);
 
-- 
2.53.0


