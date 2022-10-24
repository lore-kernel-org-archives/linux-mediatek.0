Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5A4C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 10:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0WDnY7AAndUxdcLRvSTyIT3p0ruIicuD2oUiZdAyLo=; b=zjNHXCiythqMKSL6b+fJrYcBoF
	MrZZ6afxGMcx5qXBBvPn4haQw86LPxIgeXKukEor7Ee0C9ksOs95T5wuTPnb+LVREPNWeE1Voms43
	fQtukCHStW69D3qXNxu4cH9jtBg8VNWrfsR27YpETRm7jXt8bZeiR8fVLbheTuSYDRc9nXYB4xY3m
	54VvKY74CwF0jntDBkEkcipAzN15OFG0WFnjaIK9DN0nnkVhQnQZ2oMioEYnq9mmalNxgWJPy19lz
	yVmFSqVQ3ptIJuMLzpVcaBhk4QLZ8tPHsdYmeup7fmeM5WhnGgbJcrMVOzbow1nHaVsyEHzLGCZXa
	C+k+tZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omudW-000hOa-6t; Mon, 24 Oct 2022 10:24:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omucE-000gos-GJ; Mon, 24 Oct 2022 10:23:33 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CA3B76602820;
	Mon, 24 Oct 2022 11:23:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666607007;
	bh=615h96gUK/xOVr7Z2EpouoQJj5rgXwUMGa3d/wQkph0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dc3t/uzOVt8Agcq54h5L4FWdILi8zhHt7O1se9iEgZvv65dbFIueHDtnetnDKxbal
	 k3RjV5+OBQwgU98SHRLCky6S42MNKle0HdulhAzhvgY4owMp5tfC5sDopgAzF0UgAW
	 GvPFmfFjHgeE9YuVZQaUWoj3Q7JU5bn80RWz9AUbsfskLxENlaa9GJ+YiQrZT2I2Fe
	 C0sqR3HQc5Hx3dks7mU6FfvrP7zZlmqAOFlFtywEvJhxoLVQxRnoqtRsjnr7j53hik
	 WnKtqbaoOrzS94/bBG9XAnNY9H+g6u7c/bcgaE8KHhVj6nhCDabPu0a3NG682Y+X5a
	 nR7vvfv9Q4W+w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	msp@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] clk: mediatek: mt8186-topckgen: Drop flags for main/univpll fixed factors
Date: Mon, 24 Oct 2022 12:22:59 +0200
Message-Id: <20221024102307.33722-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_032330_828404_97BB877A 
X-CRM114-Status: GOOD (  14.43  )
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

The mainpll and univpll clocks are used as clock sources for multiple
peripherals of different kind, some of which are critical (like AXIs);
a rate change on any of these two will produce a rate change on many
devices and that's likely to produce system instability if not done
correctly: this is the reason why we have "fixed factor" clocks, used
by MUX clocks to provide different rates based on PLL output dividers.

Though, there's one fundamental issue that must be resolved somehow:

When performing GPU DVFS, we get a rate request that will try to change
the frequency of MAINPLL due to the CLK_TOP_MFG mux having clk26m,
mfgpll (the GPU dedicated PLL), mainpll_d3, mainpll_d5 (fixed factor
dividers) as possible parents.

In order to solve that, there are two ways:
 1. Add new "fake" mainpll_d3_fixed, mainpll_d5_fixed clocks, clones
    of mainpll_d3, mainpll_d5 clocks, for the only purpose of not
    declaring CLK_SET_RATE_PARENT; or
 2. Simply drop said flag from the original dividers.

After some careful validation, I cannot see anything calling a rate
change request during runtime for MAINPLL, nor for UNIVPLL (which would,
again, mean that we're reclocking lots of peripherals at once!), so it
is safe *and sane* to simply remove the CLK_SET_RATE_PARENT flag to all
of the main/univpll fixed factor divider clocks.

Besides, if for any (doubtful) reason main/univpll rate change will be
required in the future, it's still possible to call that on the PLL main
clocks, so we're still covered anyway.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8186-topckgen.c | 62 +++++++++++-----------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8186-topckgen.c b/drivers/clk/mediatek/clk-mt8186-topckgen.c
index d7f2c4663c85..62b5ff4a5723 100644
--- a/drivers/clk/mediatek/clk-mt8186-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8186-topckgen.c
@@ -19,37 +19,37 @@ static const struct mtk_fixed_clk top_fixed_clks[] = {
 };
 
 static const struct mtk_fixed_factor top_divs[] = {
-	FACTOR(CLK_TOP_MAINPLL_D2, "mainpll_d2", "mainpll", 1, 2),
-	FACTOR(CLK_TOP_MAINPLL_D2_D2, "mainpll_d2_d2", "mainpll_d2", 1, 2),
-	FACTOR(CLK_TOP_MAINPLL_D2_D4, "mainpll_d2_d4", "mainpll_d2", 1, 4),
-	FACTOR(CLK_TOP_MAINPLL_D2_D16, "mainpll_d2_d16", "mainpll_d2", 1, 16),
-	FACTOR(CLK_TOP_MAINPLL_D3, "mainpll_d3", "mainpll", 1, 3),
-	FACTOR(CLK_TOP_MAINPLL_D3_D2, "mainpll_d3_d2", "mainpll_d3", 1, 2),
-	FACTOR(CLK_TOP_MAINPLL_D3_D4, "mainpll_d3_d4", "mainpll_d3", 1, 4),
-	FACTOR(CLK_TOP_MAINPLL_D5, "mainpll_d5", "mainpll", 1, 5),
-	FACTOR(CLK_TOP_MAINPLL_D5_D2, "mainpll_d5_d2", "mainpll_d5", 1, 2),
-	FACTOR(CLK_TOP_MAINPLL_D5_D4, "mainpll_d5_d4", "mainpll_d5", 1, 4),
-	FACTOR(CLK_TOP_MAINPLL_D7, "mainpll_d7", "mainpll", 1, 7),
-	FACTOR(CLK_TOP_MAINPLL_D7_D2, "mainpll_d7_d2", "mainpll_d7", 1, 2),
-	FACTOR(CLK_TOP_MAINPLL_D7_D4, "mainpll_d7_d4", "mainpll_d7", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL, "univpll", "univ2pll", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D2, "univpll_d2", "univpll", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D2_D2, "univpll_d2_d2", "univpll_d2", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D2_D4, "univpll_d2_d4", "univpll_d2", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll", 1, 3),
-	FACTOR(CLK_TOP_UNIVPLL_D3_D2, "univpll_d3_d2", "univpll_d3", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D3_D4, "univpll_d3_d4", "univpll_d3", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_D3_D8, "univpll_d3_d8", "univpll_d3", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_D3_D32, "univpll_d3_d32", "univpll_d3", 1, 32),
-	FACTOR(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll", 1, 5),
-	FACTOR(CLK_TOP_UNIVPLL_D5_D2, "univpll_d5_d2", "univpll_d5", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D5_D4, "univpll_d5_d4", "univpll_d5", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll", 1, 7),
-	FACTOR(CLK_TOP_UNIVPLL_192M, "univpll_192m", "univ2pll", 1, 13),
-	FACTOR(CLK_TOP_UNIVPLL_192M_D4, "univpll_192m_d4", "univpll_192m", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_192M_D8, "univpll_192m_d8", "univpll_192m", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_192M_D16, "univpll_192m_d16", "univpll_192m", 1, 16),
-	FACTOR(CLK_TOP_UNIVPLL_192M_D32, "univpll_192m_d32", "univpll_192m", 1, 32),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D2, "mainpll_d2", "mainpll", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D2_D2, "mainpll_d2_d2", "mainpll_d2", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D2_D4, "mainpll_d2_d4", "mainpll_d2", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D2_D16, "mainpll_d2_d16", "mainpll_d2", 1, 16, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D3, "mainpll_d3", "mainpll", 1, 3, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D3_D2, "mainpll_d3_d2", "mainpll_d3", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D3_D4, "mainpll_d3_d4", "mainpll_d3", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D5, "mainpll_d5", "mainpll", 1, 5, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D5_D2, "mainpll_d5_d2", "mainpll_d5", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D5_D4, "mainpll_d5_d4", "mainpll_d5", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D7, "mainpll_d7", "mainpll", 1, 7, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D7_D2, "mainpll_d7_d2", "mainpll_d7", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_MAINPLL_D7_D4, "mainpll_d7_d4", "mainpll_d7", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL, "univpll", "univ2pll", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D2, "univpll_d2", "univpll", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D2_D2, "univpll_d2_d2", "univpll_d2", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D2_D4, "univpll_d2_d4", "univpll_d2", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll", 1, 3, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D3_D2, "univpll_d3_d2", "univpll_d3", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D3_D4, "univpll_d3_d4", "univpll_d3", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D3_D8, "univpll_d3_d8", "univpll_d3", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D3_D32, "univpll_d3_d32", "univpll_d3", 1, 32, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll", 1, 5, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D5_D2, "univpll_d5_d2", "univpll_d5", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D5_D4, "univpll_d5_d4", "univpll_d5", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll", 1, 7, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M, "univpll_192m", "univ2pll", 1, 13, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M_D4, "univpll_192m_d4", "univpll_192m", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M_D8, "univpll_192m_d8", "univpll_192m", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M_D16, "univpll_192m_d16", "univpll_192m", 1, 16, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_192M_D32, "univpll_192m_d32", "univpll_192m", 1, 32, 0),
 	FACTOR(CLK_TOP_APLL1_D2, "apll1_d2", "apll1", 1, 2),
 	FACTOR(CLK_TOP_APLL1_D4, "apll1_d4", "apll1", 1, 4),
 	FACTOR(CLK_TOP_APLL1_D8, "apll1_d8", "apll1", 1, 8),
-- 
2.37.2


