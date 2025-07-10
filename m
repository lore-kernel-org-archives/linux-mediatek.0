Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E227C83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 18:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4I0PFIaMBaCPYEhsVGTxsNMaZSF2zv8K67vNW2wzfuw=; b=dquv2zaT1zzsw3Zu5bELeq+VhS
	8DKYng9HyokcbDeEw6GANip2pb+VedZkFnvO45xYgXXL372BTQJfVB2eQTeY5GQAvgcHA6HIFgECN
	rjq2jDPSNF2QivbxWMzkaHUW5L3EeFtz/kkbELMKi2+XNctVClvmvL1HhFOEFtFCdnP3xo/Wsarkl
	rH3fcj0p5ec/ifzG1nPdO1QFpDqJhmhRCWS+luYPnoogvr7tNJgHj+XcbVX+0tE0AtH00o3Zq9dTl
	Lov4rR/Gkx+64qYI72c9mrDsfvNDgBC5VXgZHhMehVOzH6DhQg36RuT6Qk5xG2y1S0+YRnDjOJ0hE
	b+pHAD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZw0M-0000000Chfi-245R;
	Thu, 10 Jul 2025 18:28:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtos-0000000CMJQ-2CWw
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 16:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4I0PFIaMBaCPYEhsVGTxsNMaZSF2zv8K67vNW2wzfuw=;
	b=DDA2dW+PejeZf5W0sjt4dHdLgzRy96Or1l3+OyFcND9zm10RFhYyrJL6y1kp3GrBGYfcwT
	W3unCtuHiM0arwFi7dryAjYA0weDeO7rNwjVCNK5OueA24rMtK90eZq94c+ZjdJ4s1vp5G
	pMIEtHJzTad9fI00gAQbnqE7nN0S45Q=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-F7RHe87OO7CNIzspaLblKw-1; Thu, 10 Jul 2025 12:08:19 -0400
X-MC-Unique: F7RHe87OO7CNIzspaLblKw-1
X-Mimecast-MFC-AGG-ID: F7RHe87OO7CNIzspaLblKw_1752163699
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ff81086f57so13527066d6.3
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 09:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163699; x=1752768499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4I0PFIaMBaCPYEhsVGTxsNMaZSF2zv8K67vNW2wzfuw=;
        b=kIVqD8DFtmogSQShE3QY6QYBKCbLPq0sT90zdqTLJbUhSBFoHzxYXn8I9xtTYX0YRt
         tIPL9v3fKbuYIQ+zQ5CkoIB2Repr5c7OaUoW6ycj551stzOG5ywYfMOjMU5kIzIRZGp8
         NIiuXbFrM1Qg7txFtuXHNQIytJASclGC6aNIsQlQGOxvkL5egUypeQU1PtA1F+U7bA6U
         I7KewmDeuNXK2m9PgjsCwEL4/uS/Mxmo/mI+5/eoxVIIjJPMvZCUhS+9vvKYsUl2OSJA
         5KX7rtSdn0kCMgAvsI8gr7UeqmOVWtj9pRk5de7hqEp/hK/fLsc8BCd4Sv6+pyx55cOz
         WSBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7cMWTnKDSWec7asTVtNezyAn+NbAFoEgIDr+n6S0uaVhrJHgtl9oWfuhdH137xT53sEJb1oLrI8Ten8flJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWeVKRapaSUlSSAhASSMYpz7li/vrVACz8499QS67z+XropI7L
	WDEIwT8KLi70hm3db46LLXVNuE0JOPZ86FANZgWYk6vXG6ckUATUr+yUAot76DMGKHURx12TsBy
	tq3UA70R6xsmXoqWzvGZMeK84dEnLEeV7BkxKLt9OcoHIIT9ezDeAyBn8CX9ImtRtfQ5WpEreUz
	Czi2mx1Q==
X-Gm-Gg: ASbGncvBy61x1EiKGfufineHqdAFgOCYaiSMKJYvlkUJ6XoWSsOo2Ksb7gYXEh89lH9
	0i8Y5F4PtId94JfrKWOsSb2iruU+1vFrj6AN+gOJa0uJULjFrtQnGtHm71jaxrbvS7+D+Sermga
	8IN414wR+Sy2WR2RVcKeGBdi2/rnZIo/RvJ9xb/26P2cZBjfhyv2fLlqS490sI8Fq9bU4D+coox
	jYEkOPyVUPNcCa5JabJy3DeiUH1fC0C2YG1560nmuVjewjY9FIEW4p3CF47hXsbtsVTK5NSivZp
	rhKmdOvGujeitb2CKgBLHdN5Ubz2WHLm3sa9zB5M45j5TZspdPBCEV9u3u4w
X-Received: by 2002:a05:6214:4a84:b0:704:8aaa:319b with SMTP id 6a1803df08f44-70497fab6f5mr54886676d6.7.1752163698885;
        Thu, 10 Jul 2025 09:08:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPjEiUWwXCCHctPequGjvxsmcP2oTYR8PP+05MEZihcEYQLxAz0y6yXBwiYJgaIGBkfIQAEQ==
X-Received: by 2002:a05:6214:4a84:b0:704:8aaa:319b with SMTP id 6a1803df08f44-70497fab6f5mr54885916d6.7.1752163698330;
        Thu, 10 Jul 2025 09:08:18 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:17 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:14 -0400
Subject: [PATCH 4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert from
 round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-4-0ff274055e42@redhat.com>
References: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
In-Reply-To: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=1601;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=DwS1eyPB/neaQufQvNJoTsoU5XhXKJIB7F14A2pZwIo=;
 b=4cPcXNvbK3LJUngty9/hS4Cci5iNskdrVCzBboRgMF/vVZq4JO3qCRcMs3ZcshnLpFzqFvn2A
 ZJ4lm2QjCh4CBdhbHz6OimHjO2IugpTJTJVBSFGBISv7EeMJ0RGydsb
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dssU19kFdzb4MiRB950mXv7-chi6PUL85Bu-sf4RvyU_1752163699
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090822_631521_69EC384F 
X-CRM114-Status: GOOD (  13.11  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
index b38f3ae26b3f3d8c9e73b43d86510acf6cedb471..1426a2db984d53b91125b18f7725738c44f19555 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -418,13 +418,13 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return mtk_hdmi_pll_calc(hdmi_phy, hw, rate, parent_rate);
 }
 
-static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	hdmi_phy->pll_rate = rate;
-	return rate;
+	hdmi_phy->pll_rate = req->rate;
+	return 0;
 }
 
 static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
@@ -439,7 +439,7 @@ static const struct clk_ops mtk_hdmi_pll_ops = {
 	.prepare = mtk_hdmi_pll_prepare,
 	.unprepare = mtk_hdmi_pll_unprepare,
 	.set_rate = mtk_hdmi_pll_set_rate,
-	.round_rate = mtk_hdmi_pll_round_rate,
+	.determine_rate = mtk_hdmi_pll_determine_rate,
 	.recalc_rate = mtk_hdmi_pll_recalc_rate,
 };
 

-- 
2.50.0


