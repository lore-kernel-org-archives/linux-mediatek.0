Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8429C369CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 17:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZQ4F7kGt6pV/zzUb5uMaILzlgimsXYfSNCl5wYcsv4s=; b=XaHywOGoVyFTC3NpBjYberFppj
	hu+yei9zOdr3EfzDoKrl4s5R27B+YrB85jfDrHFEFZlfVghFx++3CNdZs7iyyrYzcx7BEvVYh7pcT
	6wJv9Gotzykop475im9H0S5fA5na2AAURpGpyQYNEdaYMSDLyM2cx6Y4LCacETEYijOyejVrpb92n
	3b2u7Ojh7ieKcrg4VvwvHScTuOM9et8+6334o/UAlLB6Q1mJZk9k50UFpP31PSDta7m2oHAfNQGDG
	5n/BQXitUcP/vqI87IHM0E+9vu5ifPZd44qh+/W2td4spicjZNMwbdyr7bC9QMThD+brX0uKzxiYU
	n03YkUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e8i-0000000BNra-2b6e;
	Wed, 23 Apr 2025 17:44:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7cz5-0000000B8J5-0R99;
	Wed, 23 Apr 2025 16:30:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64BAE61569;
	Wed, 23 Apr 2025 16:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F861C4CEE2;
	Wed, 23 Apr 2025 16:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745425802;
	bh=N0YsuSsw6LR3Wlo+UHK1R+dAY9Z0n1sTB1iAGMETzA8=;
	h=From:To:Cc:Subject:Date:From;
	b=RU/7KPp4/suA/UnOfYAmeq4B9hf8W31UfZR5LRkYWcxfLFZYBDMKjvgXLGyReWrX8
	 cS2SyM3sVpgpl6SGTACLiUHe627IB58+zUmIQm2SrtID4W4+frlAS5ouaQwYz+ktdF
	 0u04e7SzXOt6kRrvWwOJQrmzJ/51E5u553kRkWOgcgCDBfWsub/zNq44crTNxZEN6U
	 S6pUqfqOKKlTWe5EeQf6cegnxJMg3ajfGPjLmGuve0FZbJ4XNNiUol+ZBlaeecm7zU
	 Bgip2TS4nNfEwva/VftKSzlzirD5f8Y6BgTBrrVdeM0F42a55oy5/2KfecU22d5DOo
	 j7zCE+QlnwIDQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Georgi Djakov <djakov@kerenl.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: mtk-dvfsrc: remove an unused variable
Date: Wed, 23 Apr 2025 18:29:52 +0200
Message-Id: <20250423162958.2223689-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

This structure was left unused by a previous patch:

drivers/soc/mediatek/mtk-dvfsrc.c:542:43: error: unused variable 'dvfsrc_bw_constr_mt8195' [-Werror,-Wunused-const-variable]

Fixes: b06785283ec1 ("soc: mediatek: mtk-dvfsrc: Rename and move bw constraints data")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/mediatek/mtk-dvfsrc.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-dvfsrc.c b/drivers/soc/mediatek/mtk-dvfsrc.c
index 7b8486ce1c66..41add5636b03 100644
--- a/drivers/soc/mediatek/mtk-dvfsrc.c
+++ b/drivers/soc/mediatek/mtk-dvfsrc.c
@@ -539,12 +539,6 @@ static const struct dvfsrc_opp_desc dvfsrc_opp_mt8195_desc[] = {
 	}
 };
 
-static const struct dvfsrc_bw_constraints dvfsrc_bw_constr_mt8195 = {
-	.max_dram_nom_bw = 255,
-	.max_dram_peak_bw = 255,
-	.max_dram_hrt_bw = 1023,
-};
-
 static const struct dvfsrc_soc_data mt8195_data = {
 	.opps_desc = dvfsrc_opp_mt8195_desc,
 	.regs = dvfsrc_mt8195_regs,
-- 
2.39.5


