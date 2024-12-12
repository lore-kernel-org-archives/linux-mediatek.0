Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C16E77182
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2024 00:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6jwKzAcvPxFaW5jYxOoQEVAWqy/uLBXM/0haKGRk0KE=; b=zfVRssV0GSpgQH+iG/i7VJLqvN
	sS24VqNwj0NFRhBna1BYSptH3347g1+EKnSOs0TBDOvuHDNR6oxySFcNUmBlyStf1S1zpTa9Nvl7U
	tXLUkbm1l+aEQ+5LOtxEUvNDs6Rd2beAZmHJdMln4IG1Mmtz2rYmkIowVeaSO8ATecfzNAoXvJEa6
	llywLGJph6H1pV3tGdB9b44ez6OOlbrhy7mliRbwfYrfkxDvCtCTQejoosfVtI6Xb6Re3jD1AUbME
	rj/CMREN/3hZnifPSc1F2s3P/vkrbcgOvPExvSIOkUSAnoJIiqzZTFMwNaiL0lkrn7mIrnG9gjieS
	qKop7jlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWvQ-0000000GaTm-0VEA;
	Thu, 12 Dec 2024 00:19:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWvN-0000000GaTH-3xoL
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Dec 2024 00:19:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A743BA42112;
	Thu, 12 Dec 2024 00:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD65C4CED2;
	Thu, 12 Dec 2024 00:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733962764;
	bh=2BjK7sTMogm7uyjtjoOaPa8oXC0k42R+bEB1rCldpN4=;
	h=From:To:Cc:Subject:Date:From;
	b=Z1RB0iDZYQuyJP67g0uDT1D/JBF1/82IZ6xE2Vap1+rzDkQPNqawERYId1+0YUnk1
	 +PSG8uImWBY0qZ9xGXgBPytcTTM+aOF2QgJjs2Rc4yMcYRdTm3m/9OyuQUAkLLk1gr
	 l5YC7R5yho33fyUwiESlbzse2GQ5YVIgyzomWtHM1Q2N9RPX+zN0wBCc2zthgYAJ8b
	 QITLD7oXSu32cQdNttwe8K/GlILYyuf1eoncMnJmw0zW44qUjZlFeM4CDag2i09UV4
	 z0xYquU6lHl6fBKKQcBw1lOBFRa5fyqBpdKKzvxgYHaoSoUCM1V5NFeDTssl/aZk5z
	 oz1xere4XjvhA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jens Ziller <zillerbaer@gmx.de>,
	Shuijing Li <shuijing.li@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] Revert "drm/mediatek: dsi: Correct calculation formula of PHY Timing"
Date: Thu, 12 Dec 2024 00:19:08 +0000
Message-Id: <20241212001908.6056-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_161926_043474_2C855967 
X-CRM114-Status: UNSURE (   7.37  )
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

This reverts commit 417d8c47271d5cf1a705e997065873b2a9a36fd4.

With this patch the panel in the Tentacruel ASUS Chromebook CM14
(CM1402F) flickers. There are 1 or 2 times per second a black panel.
Stable Kernel 6.11.5 and mainline 6.12-rc4 works only when reverse
this patch.

Reported-by: Jens Ziller <zillerbaer@gmx.de>
Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 31 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 33ceeb8d6925..3907863579b9 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -246,23 +246,22 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
 	u32 data_rate_mhz = DIV_ROUND_UP(dsi->data_rate, HZ_PER_MHZ);
 	struct mtk_phy_timing *timing = &dsi->phy_timing;
 
-	timing->lpx = (80 * data_rate_mhz / (8 * 1000)) + 1;
-	timing->da_hs_prepare = (59 * data_rate_mhz + 4 * 1000) / 8000 + 1;
-	timing->da_hs_zero = (163 * data_rate_mhz + 11 * 1000) / 8000 + 1 -
+	timing->lpx = (60 * data_rate_mhz / (8 * 1000)) + 1;
+	timing->da_hs_prepare = (80 * data_rate_mhz + 4 * 1000) / 8000;
+	timing->da_hs_zero = (170 * data_rate_mhz + 10 * 1000) / 8000 + 1 -
 			     timing->da_hs_prepare;
-	timing->da_hs_trail = (78 * data_rate_mhz + 7 * 1000) / 8000 + 1;
-
-	timing->ta_go = 4 * timing->lpx;
-	timing->ta_sure = 3 * timing->lpx / 2;
-	timing->ta_get = 5 * timing->lpx;
-	timing->da_hs_exit = (118 * data_rate_mhz / (8 * 1000)) + 1;
-
-	timing->clk_hs_prepare = (57 * data_rate_mhz / (8 * 1000)) + 1;
-	timing->clk_hs_post = (65 * data_rate_mhz + 53 * 1000) / 8000 + 1;
-	timing->clk_hs_trail = (78 * data_rate_mhz + 7 * 1000) / 8000 + 1;
-	timing->clk_hs_zero = (330 * data_rate_mhz / (8 * 1000)) + 1 -
-			      timing->clk_hs_prepare;
-	timing->clk_hs_exit = (118 * data_rate_mhz / (8 * 1000)) + 1;
+	timing->da_hs_trail = timing->da_hs_prepare + 1;
+
+	timing->ta_go = 4 * timing->lpx - 2;
+	timing->ta_sure = timing->lpx + 2;
+	timing->ta_get = 4 * timing->lpx;
+	timing->da_hs_exit = 2 * timing->lpx + 1;
+
+	timing->clk_hs_prepare = 70 * data_rate_mhz / (8 * 1000);
+	timing->clk_hs_post = timing->clk_hs_prepare + 8;
+	timing->clk_hs_trail = timing->clk_hs_prepare;
+	timing->clk_hs_zero = timing->clk_hs_trail * 4;
+	timing->clk_hs_exit = 2 * timing->clk_hs_trail;
 
 	timcon0 = FIELD_PREP(LPX, timing->lpx) |
 		  FIELD_PREP(HS_PREP, timing->da_hs_prepare) |
-- 
2.34.1


