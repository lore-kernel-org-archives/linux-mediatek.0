Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0017DCD98DE
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/sfSCxlJV21DnAv9Ka6YHdwihRoTK4jXXXiCxaH1uE=; b=zp6FbK8pz7ymJdvK5vLy/dr9+f
	W08CsqjgX19SUU4dfFXeiqWu9Ms0NOKbj1prlfJZyG+/OsDq3WDFu5G/jhsydwLw3S11yeGpCkqRW
	UfJ+NmBiEhL+mbM/a29NcXu7WrT+YbHubhxRmJNhU3Q1kUd299MzCSa3MV0Lc4hyxItefZcvjT/oA
	QsQmdlJW8NCYeegXXO8dB7hRxAcwHcltyBuSqw6yK65/7FwZWikTxr8FNaO3m/lyIxEOpt2P5FiWH
	at4FjoDgv97fqVXLKaGkSRvx1JqghLhb7Kaao0kO/xAwTchXdYy+fh6yOhfNJJZ+d2H6u7xjsNvS/
	FCfseoEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnCA-0000000D9dr-3yg3;
	Sun, 14 Jun 2026 15:56:22 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYnC7-0000000D9XU-0dqp
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 15:56:20 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-8ce0f17a69cso20617506d6.0
        for <linux-mediatek@lists.infradead.org>; Sun, 14 Jun 2026 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452578; x=1782057378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/sfSCxlJV21DnAv9Ka6YHdwihRoTK4jXXXiCxaH1uE=;
        b=hopVLVqVWy0EKyQ3Agb/Y/QcoZSFF1ifY6TCzA/jsCp0tE8yWVbHM1S/ZySXVsELFy
         iw0lVJP2IW3dVVFsu3bAGK27HMNYpFm9JqSW7+MPsCYcWPCB5WD1G/17OGZGqnFvPvWc
         RE+Dx9TU6GO/3j6Q/PszEle5rOXuenREHgBd34svkvPryooC3kkRs0FfVmp+2KR9MfSk
         vwv75OKCj7WgyKba6oN3JE8qmDGIG9CE7m7Yf9XvhQQmy+wm0OZeTyMB1iEfcI1bpr2g
         9Uc8o+yQW2SMp3GREDAHkIPE+L9mj68gCBUxzNP/G9oLoo1VqMQyJSnK3+k77BzWNnSI
         h+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452578; x=1782057378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/sfSCxlJV21DnAv9Ka6YHdwihRoTK4jXXXiCxaH1uE=;
        b=AbMh0zog8mJfTSUA0dwCj25hb0RUx+GT7iHaeU/hAi8c5aF6uyS01pCEgo7BF+spIO
         V0mHej19Ddzmwvg09bgyWRtWTeADjR8ieZ/JJCu7dp45HrY586QcYfguLnWlddDO3YUm
         BeazS+srLu9LJApLMDnp0CIJEBAj5aKyO8nM+x6yXb6VrinItm/S7fKe5BmGyzoa/GUO
         PlfIju6yrXtovVH/qH5BqXiYUeqvXushcSRrEKczBWFt7/s19pJC/CgJPNWgJV7xrh1I
         hx0F2QQCbHHHtuE4BcF936VKNGHd/Kd7LAitdynFy5LEKi8rJ9EIpXg7S/0Y8gkTrPpX
         naPw==
X-Forwarded-Encrypted: i=1; AFNElJ9T5P70kpRHVZMU+s2Qkd3dl4vaKdqcVK9gbq1d7TnuMl7pRwpkg0gA/b5WRdqN2mukmtbF2yH8Me6kdRpfzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcF9dZFwv1Uz1qMk3vbdQig15sFAWLOp93b924pIZB1Xt8LXlr
	SGAIk89ZfB8xwi5aMtfNkyNAZdrXJg3RZqTRhfEpfOJQRgqH3mNN4SzD
X-Gm-Gg: Acq92OH42phlClt6eyV57/2rEAXvfKIcqyeFJ3EKvVen9eruJ0cgzA0Jf4OR5PBzFix
	evxaX80H70vlDwkqZimeBqozlqAhNxZdzXXIIdbvejFSuTwNCtv8TRh62viVFxAC6KzyBac6DlR
	D1EXrufOlW9CbvE8A0q2K/ET68j2W6Ra93xbCzsgIxRg8Nz6U6PAUCx5dEeSbjrm8U49CuRElJF
	Wr0LbdjZv1oP1Br2KeG22bvktIFAlrNRI/IPk4FSqn0jLwd1o9rGan5tuplcod201HWEmCZrAi3
	+K/VZYsVBdyF0Akwi4oPdAGxZxvimiw4qWwcuRBRhaK4lo5DfVVUgziTa8svVn68dSu4xYtRkgy
	P15SZhdyXZMg6m7lZzgjBZk+NL7pN0npmnOe2AlZZgMiquZecJ1+KEFgdiyckuNTb7DrZIR2zLl
	jSzX/raiYTsrdr3NOBGfeOO05sZjKWjkzOzmTYkD/OD/1KzcKeHq2OVj2sozwU4XauQbjQZw0Ki
	8VbYbzHPPEScTSQbfB9DKImGHrfB7+sw/LfQgkDkDs=
X-Received: by 2002:ad4:5dc2:0:b0:8ce:d302:f069 with SMTP id 6a1803df08f44-8d32b47b28emr185934816d6.3.1781452577762;
        Sun, 14 Jun 2026 08:56:17 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:17 -0700 (PDT)
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
Subject: [PATCH v2 3/6] media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer capacity
Date: Sun, 14 Jun 2026 11:56:05 -0400
Message-ID: <20260614155609.3107600-4-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155609.3107600-1-michael.bommarito@gmail.com>
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_085619_204706_208D6012 
X-CRM114-Status: UNSURE (   9.91  )
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
 drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index e8c2e83379def..94fbd79885aa5 100644
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


