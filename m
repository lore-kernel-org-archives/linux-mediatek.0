Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F537C27C40
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppO9GUYa8NK1DN6UjuZNbD5je5ZHPwfaBaPR38+Na58=; b=V13xtulfixHmK6aFGkihOOQ3Vi
	c1++b4Misr8S5GfJ4qrXbzCxnmpNO58DAnFn6doi/U7L07iFnLo73BeDJYuuDr8BCnLLco9/dMYqO
	fNvEc65+V1sNmulV0zM/SoJlFLCxlOEkOYkCgDVkRvQAd+IGIyl+1VCQF1eVh4PnhPF/5WXI/GSiR
	zZ8ff2OIVS+ZDjHeWE1MDniNU9ArcNCKC8fQR7yTGWJ1ZdsvKr4yRwRBwMPqrB5X2stp4V+6Lv1Wy
	h4Xu2+kBwxxY+QVfp4ypuhfmxV/7XH6M8sSoGFLe2saot3PIN4vYigqp6FTCqTtfwqjZx4TlKBlNd
	9ICD49fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ6Xu-002gXS-0M;
	Thu, 24 Aug 2023 09:22:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ6XG-002g6r-25;
	Thu, 24 Aug 2023 09:21:55 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:c310:4c8a:3a97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 42D116607324;
	Thu, 24 Aug 2023 10:21:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1692868905;
	bh=7SuYFFsy0UMAkQQkxSlRxpuDU3mFA9H4F51e8vN5B0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oW8M0zme51EF2mG+W34pgdyjpdQHpfMyMUr6LW6PIKBgj8IArSpUTgUzgiXQD1Stl
	 QkLf3jZeNZM/ExuwvJpAE1hrtB1bMt7qi+tJYdr4lCGVKJxR1/lv20PLQB1fC3E2tV
	 3gIUY1/HxFsfqx3bgnQqAvYQInBM+i9W0C86fk5eDifFIrmEnq6AObhn+i/LHGosMb
	 mx1RK1HxYnXHIyGU00aYeRkoYv5fU25gESjqHrSGitBNSEW5FZk2KRGHqJ0ZFL8wRd
	 Ah9uOscxkilvMJkG8dbuUGKdjILYM5mXxJKOHrUO4togCQoceF/lH3uLK1fkGFzh5Q
	 zugcb//lCquSQ==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v5 07/10] media: verisilicon: postproc: Fix down scale test
Date: Thu, 24 Aug 2023 11:21:30 +0200
Message-Id: <20230824092133.39510-8-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824092133.39510-1-benjamin.gaignard@collabora.com>
References: <20230824092133.39510-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_022150_815250_E9B09941 
X-CRM114-Status: GOOD (  10.81  )
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

Do not allow down scaling if the source buffer resolution is
smaller  than destination one.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Fixes: fbb6c848dd89 ("media: destage Hantro VPU driver")
---
Note: Marek has propose exactly the same fix in this patch:
[PATCH] media: verisilicon: Do not enable G2 postproc downscale if source is narrower than destination

 drivers/media/platform/verisilicon/hantro_postproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index e624cd98f41b..77d8ecfbe12f 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -107,7 +107,7 @@ static void hantro_postproc_g1_enable(struct hantro_ctx *ctx)
 
 static int down_scale_factor(struct hantro_ctx *ctx)
 {
-	if (ctx->src_fmt.width == ctx->dst_fmt.width)
+	if (ctx->src_fmt.width <= ctx->dst_fmt.width)
 		return 0;
 
 	return DIV_ROUND_CLOSEST(ctx->src_fmt.width, ctx->dst_fmt.width);
-- 
2.39.2


