Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7A5CD98F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 02:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sml+UeKb9+6PbEr3ie8aYF51m/8hlVenyLRv+O5D8SY=; b=IxlPimRswvu/3VlxvBcUlaPuDa
	d+TTGQ7IKi6jE3pnnzONEPl+Iix6z/vE9SYbv3JPI91bu0RfwaysxlcLH290M5sfle7sIRauBNxEb
	Cpy1g6xeL/Tl2akcc2ApIiDnnWxBmP90/5pUABn99OHdYkCOcfhYo9m7pdiWpCSvSmCspQIIkfVlu
	XI7tN13PPR3Mr63e6Sl7o+EwU6WVe49+wyg6E8Qp9kOxe2G5s8pBQdQnYQ64UGOAnMeXclvQpJ2BY
	MniPlChhtoRxONSU98PtvA7P/OTnX3zq3bHF8056qK8dYM9C3x+cNVGcwTzPUCazivMHqQLdaeHgG
	LV/qu0cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsM-0000000GUBb-25YN;
	Wed, 17 Jun 2026 02:19:34 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZfsJ-0000000GU84-076C
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 02:19:32 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-9185503e6a5so70822685a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 19:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662770; x=1782267570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sml+UeKb9+6PbEr3ie8aYF51m/8hlVenyLRv+O5D8SY=;
        b=Ln2ZxH7IJUN+EgmKzoewKf4GY8mTUGAHZD3im5as9k2SSSQ0EwruFwdpnnxoip9N98
         kqMN4Lbu82d/sibinYgYXDR6J3hKGCGNBxLN3ll2i2S9TAUBqg33fOmOI5CIh+Q2ibT5
         3LaMkwCpnkxpW7sk+rg9r3uOjapxPXjPElSlPC5P1Xb/zdMjl1f/SAJRzCSKAEqtULz/
         YogCjh93+2mTNuDUWm9smc1rhyGhl5C14u3lqz8dUttY63aNEjd+25lNy8bR2cMmLkXG
         JIDt4LjkNqeRcLOmxFrQAlEGqNI4xAnYdvOv4dzqeJXcd6HUX4z6wuO5WijZOQ3XAFz9
         1Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662770; x=1782267570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sml+UeKb9+6PbEr3ie8aYF51m/8hlVenyLRv+O5D8SY=;
        b=kvSAILbUrXfTZjDB2yw6I9fnVzrEcsC9sqXmqMoMKvGAMkv9migfV5bf7qZMiF0Vt9
         GvzsaXqxwlaLcDAFPr1xIoutQjghKhF849tI3tvBZ60qLw0oracwHv/dsHz2HmbYQ3kN
         m/0oZp3g1bPRhiRnkIj+/RX7KPL+8Bbd3fMVn0ZiCY0w3cCN3rQSEhbpBfy/5F4UId4J
         s3uEuv3BlVTgCpbxtQFeB+p69PFpvVxap6ANq+q5kx/de5//cF+yTIutx8JAM4k/smhB
         BxW9bH+mX9DpYSb70VCkrqTp1lneZES8KZiYzevG59NVS5nCqUjoVykQ1I22ehzOnX++
         K1yQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZJSKdkRU8r0t5rueavT1IRo5CxRt5mv6cmwz5ndDPwftfYwyprRuLTocROcInLfKkj56BI5csdmFMnBJU/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmMM5YnVDR3hrMLfNWclnuwMebDKeDKR9vE98HJfxKlg/wQzbz
	SaX1SEQBq+SmF/nrTCBbkLAbRI5WDQEX5BpmWUZTGhi+MmQ8BK9Qa9u/
X-Gm-Gg: Acq92OEh18cKsgPYUUCQVta7rF8UIkSD4HNzuEQhvifEHhpohO17sljHc7Uhyk9RMX4
	Dk4LUV46qP0tmbeDFx8ZTsUr+sTscqbn+/YxmL5/OZmdSCooV68ajF+7BR5geDmyIaE6LdVJI+P
	o2Y8YMe2/BejwNShSrBPsQtYVMSQtdaG+QJUK2qVGILABv+NdK3O/7ZnOGbCTAaxqyU2QpdYnEO
	5CxKRGK5p94BG8HRhwsBD5hhr7ECMn38dwF72uDliSzd+JxGQZh5q36Whe/VjYVocWB3VuWW9w5
	oRb+lXNkJydvOC+3VFTVNYGF63dDHTyhkDNOWHFyV8at/h3XqwUULBJSVqwKaLZOY30X/8DDywe
	5uCTw0/AmaC3wJUr7+KuaQj/vz0uw39aY6nAiUlMVLRDp16DqOJlm1CztqecI5NEm7KTxs7Onj2
	dMt64EwmwSvZqqbYgh257tghN7D9CK9NlrDcEl+OuS4uSzWvg2rhIV9y5b7XSTDvR/oAAHm8Ptv
	H427t9DQEsVWZCyTaRyF1mHZKWzywhz
X-Received: by 2002:a05:620a:25cc:b0:915:351b:3ad5 with SMTP id af79cd13be357-91dcdd72cbfmr167100085a.29.1781662769637;
        Tue, 16 Jun 2026 19:19:29 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:28 -0700 (PDT)
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
Subject: [PATCH v3 2/9] media: v4l2-ctrls: validate AV1 tile counts
Date: Tue, 16 Jun 2026 22:18:59 -0400
Message-ID: <20260617021906.2746743-3-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_191931_208784_6E7F079B 
X-CRM114-Status: GOOD (  12.47  )
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

The stateless AV1 decoders use tile_info.tile_cols and tile_rows as loop
bounds and as indices into the mi_*_starts[] and *_in_sbs_minus_1[]
arrays, as the divisor for context_update_tile_id, and their product
bounds the per-tile descriptor buffers, but std_validate_compound() does
not bound these u8 fields. Reject a V4L2_CTRL_TYPE_AV1_FRAME whose
tile_cols or tile_rows exceeds V4L2_AV1_MAX_TILE_COLS / _ROWS, or whose
product exceeds V4L2_AV1_MAX_TILE_COUNT. A zero tile count is left to the
consuming driver so the zero-initialised control that existing userspace
submits is still accepted.

Fixes: 9de30f579980 ("media: Add AV1 uAPI")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6d478e1a5ef22..fb20ad13dfec7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -790,10 +790,30 @@ static int validate_av1_film_grain(struct v4l2_ctrl_av1_film_grain *fg)
 	return 0;
 }
 
+static int validate_av1_tile_info(struct v4l2_av1_tile_info *t)
+{
+	/*
+	 * tile_cols and tile_rows index the per-tile descriptor arrays and
+	 * bound the tile loops in the stateless AV1 drivers; the product
+	 * bounds the total tile descriptor count.
+	 */
+	if (t->tile_cols > V4L2_AV1_MAX_TILE_COLS ||
+	    t->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
+		return -EINVAL;
+
+	if ((u32)t->tile_cols * t->tile_rows > V4L2_AV1_MAX_TILE_COUNT)
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
-- 
2.53.0


