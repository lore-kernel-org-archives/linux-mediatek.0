Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806F2C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nzlpIUT4lEvqqQ2sInZrVUOZPNbqCmjgYeDw6YvLC0A=; b=eoYNp+FDuYVTPi20Lih/HsNIdN
	2cHLSRP4+PiL3Me7lhD9Pa9/ks/1aw1RWo9d/EgRavWOtE+Xk1jBjCXDbBRTzW9WU+PXxYsRg3IJd
	lzsM8MiTO+zskdqS3Xy1/xqj07JrMzREdcLhzVVnBDu3ROCnCJRpysMN46zmICcitA63EoSU8dEd0
	bSHApYUskeXd8uKTVchebm2Eq3lKgTH2nERooiMEj0G98vZRoyXfK89dkRFUdHoEuIWu3o3LitYPM
	lDAYwkCx77YHTqClldUEjueFj2GY46wdxga3JXAaJMfDE9vSC/+S4GEFNAW4XtdPV1EJO1zSLAjXF
	pMP9o+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omudS-000hMl-5c; Mon, 24 Oct 2022 10:24:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omucE-000gpV-Vz; Mon, 24 Oct 2022 10:23:33 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E1D306602823;
	Mon, 24 Oct 2022 11:23:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666607009;
	bh=HJKRfPEokO3fEPoEdcjIjEuvPiIooT5R8la1dbxAxaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M2olirON2kaZKyRzZ2CLZr3tA9QIDqQhyOKcQRuMd+aFW8wlRsxu2ntRkRLJDmm7+
	 vKJDxuuPFoEHytpEyivXKPSzVkmXuKWgz2ek4Fxywuv1XhtOWY+w7Vkhcz6E7qglbd
	 jnqH7/WOKTRCHqMA+dHxNBTvE+Keaj1kGVEqppmbzQUPKKVXdNhU3P+EROm+bAJpwP
	 roaZs0f0LaqerBS7/xFgesx0aTLH8gE2v3Rv7ay2xICVEm5ViV3L8+Kn8pBpl/blwo
	 sKHvpfKPVHwOJTqIo4YJVSBrD6u++fsf5E1UdadsTKhdMHazRJaWKXFE/1mf506N/C
	 PX6CHbLEyaHzg==
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
Subject: [PATCH 04/10] clk: mediatek: mt8183: Drop flags for sys/univpll fixed factors
Date: Mon, 24 Oct 2022 12:23:01 +0200
Message-Id: <20221024102307.33722-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_032331_305289_C6CB2B0C 
X-CRM114-Status: GOOD (  10.03  )
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

The syspll and univpll clocks are used as clock sources for multiple
peripherals of different kind, some of which are critical (like AXIs);
a rate change on any of these two will produce a rate change on many
devices and that's likely to produce system instability if not done
correctly: this is the reason why we have (a lot of) "fixed factor"
sys/univpll divider clocks, used by MUX clocks to provide different
rates based on PLL output dividers.

Following what was done on clk-mt8186-topckgen and also solving the
same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
clocks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8183.c | 76 +++++++++++++++----------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index c3a39db524be..23afc9584638 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -32,42 +32,42 @@ static const struct mtk_fixed_factor top_early_divs[] = {
 
 static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_F26M_CK_D2, "csw_f26m_ck_d2", "clk26m", 1, 2),
-	FACTOR(CLK_TOP_SYSPLL_CK, "syspll_ck", "mainpll", 1, 1),
-	FACTOR(CLK_TOP_SYSPLL_D2, "syspll_d2", "syspll_ck", 1, 2),
-	FACTOR(CLK_TOP_SYSPLL_D2_D2, "syspll_d2_d2", "syspll_d2", 1, 2),
-	FACTOR(CLK_TOP_SYSPLL_D2_D4, "syspll_d2_d4", "syspll_d2", 1, 4),
-	FACTOR(CLK_TOP_SYSPLL_D2_D8, "syspll_d2_d8", "syspll_d2", 1, 8),
-	FACTOR(CLK_TOP_SYSPLL_D2_D16, "syspll_d2_d16", "syspll_d2", 1, 16),
-	FACTOR(CLK_TOP_SYSPLL_D3, "syspll_d3", "mainpll", 1, 3),
-	FACTOR(CLK_TOP_SYSPLL_D3_D2, "syspll_d3_d2", "syspll_d3", 1, 2),
-	FACTOR(CLK_TOP_SYSPLL_D3_D4, "syspll_d3_d4", "syspll_d3", 1, 4),
-	FACTOR(CLK_TOP_SYSPLL_D3_D8, "syspll_d3_d8", "syspll_d3", 1, 8),
-	FACTOR(CLK_TOP_SYSPLL_D5, "syspll_d5", "mainpll", 1, 5),
-	FACTOR(CLK_TOP_SYSPLL_D5_D2, "syspll_d5_d2", "syspll_d5", 1, 2),
-	FACTOR(CLK_TOP_SYSPLL_D5_D4, "syspll_d5_d4", "syspll_d5", 1, 4),
-	FACTOR(CLK_TOP_SYSPLL_D7, "syspll_d7", "mainpll", 1, 7),
-	FACTOR(CLK_TOP_SYSPLL_D7_D2, "syspll_d7_d2", "syspll_d7", 1, 2),
-	FACTOR(CLK_TOP_SYSPLL_D7_D4, "syspll_d7_d4", "syspll_d7", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_CK, "univpll_ck", "univpll", 1, 1),
-	FACTOR(CLK_TOP_UNIVPLL_D2, "univpll_d2", "univpll_ck", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D2_D2, "univpll_d2_d2", "univpll_d2", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D2_D4, "univpll_d2_d4", "univpll_d2", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_D2_D8, "univpll_d2_d8", "univpll_d2", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll", 1, 3),
-	FACTOR(CLK_TOP_UNIVPLL_D3_D2, "univpll_d3_d2", "univpll_d3", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D3_D4, "univpll_d3_d4", "univpll_d3", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_D3_D8, "univpll_d3_d8", "univpll_d3", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll", 1, 5),
-	FACTOR(CLK_TOP_UNIVPLL_D5_D2, "univpll_d5_d2", "univpll_d5", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D5_D4, "univpll_d5_d4", "univpll_d5", 1, 4),
-	FACTOR(CLK_TOP_UNIVPLL_D5_D8, "univpll_d5_d8", "univpll_d5", 1, 8),
-	FACTOR(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll", 1, 7),
-	FACTOR(CLK_TOP_UNIVP_192M_CK, "univ_192m_ck", "univpll_192m", 1, 1),
-	FACTOR(CLK_TOP_UNIVP_192M_D2, "univ_192m_d2", "univ_192m_ck", 1, 2),
-	FACTOR(CLK_TOP_UNIVP_192M_D4, "univ_192m_d4", "univ_192m_ck", 1, 4),
-	FACTOR(CLK_TOP_UNIVP_192M_D8, "univ_192m_d8", "univ_192m_ck", 1, 8),
-	FACTOR(CLK_TOP_UNIVP_192M_D16, "univ_192m_d16", "univ_192m_ck", 1, 16),
-	FACTOR(CLK_TOP_UNIVP_192M_D32, "univ_192m_d32", "univ_192m_ck", 1, 32),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_CK, "syspll_ck", "mainpll", 1, 1, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D2, "syspll_d2", "syspll_ck", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D2_D2, "syspll_d2_d2", "syspll_d2", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D2_D4, "syspll_d2_d4", "syspll_d2", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D2_D8, "syspll_d2_d8", "syspll_d2", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D2_D16, "syspll_d2_d16", "syspll_d2", 1, 16, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D3, "syspll_d3", "mainpll", 1, 3, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D3_D2, "syspll_d3_d2", "syspll_d3", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D3_D4, "syspll_d3_d4", "syspll_d3", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D3_D8, "syspll_d3_d8", "syspll_d3", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D5, "syspll_d5", "mainpll", 1, 5, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D5_D2, "syspll_d5_d2", "syspll_d5", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D5_D4, "syspll_d5_d4", "syspll_d5", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D7, "syspll_d7", "mainpll", 1, 7, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D7_D2, "syspll_d7_d2", "syspll_d7", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_SYSPLL_D7_D4, "syspll_d7_d4", "syspll_d7", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_CK, "univpll_ck", "univpll", 1, 1, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D2, "univpll_d2", "univpll_ck", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D2_D2, "univpll_d2_d2", "univpll_d2", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D2_D4, "univpll_d2_d4", "univpll_d2", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D2_D8, "univpll_d2_d8", "univpll_d2", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D3, "univpll_d3", "univpll", 1, 3, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D3_D2, "univpll_d3_d2", "univpll_d3", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D3_D4, "univpll_d3_d4", "univpll_d3", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D3_D8, "univpll_d3_d8", "univpll_d3", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D5, "univpll_d5", "univpll", 1, 5, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D5_D2, "univpll_d5_d2", "univpll_d5", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D5_D4, "univpll_d5_d4", "univpll_d5", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D5_D8, "univpll_d5_d8", "univpll_d5", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D7, "univpll_d7", "univpll", 1, 7, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVP_192M_CK, "univ_192m_ck", "univpll_192m", 1, 1, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVP_192M_D2, "univ_192m_d2", "univ_192m_ck", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVP_192M_D4, "univ_192m_d4", "univ_192m_ck", 1, 4, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVP_192M_D8, "univ_192m_d8", "univ_192m_ck", 1, 8, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVP_192M_D16, "univ_192m_d16", "univ_192m_ck", 1, 16, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVP_192M_D32, "univ_192m_d32", "univ_192m_ck", 1, 32, 0),
 	FACTOR(CLK_TOP_APLL1_CK, "apll1_ck", "apll1", 1, 1),
 	FACTOR(CLK_TOP_APLL1_D2, "apll1_d2", "apll1", 1, 2),
 	FACTOR(CLK_TOP_APLL1_D4, "apll1_d4", "apll1", 1, 4),
@@ -101,8 +101,8 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_OSC_D4, "osc_d4", "osc", 1, 4),
 	FACTOR(CLK_TOP_OSC_D8, "osc_d8", "osc", 1, 8),
 	FACTOR(CLK_TOP_OSC_D16, "osc_d16", "osc", 1, 16),
-	FACTOR(CLK_TOP_UNIVPLL, "univpll", "univ2pll", 1, 2),
-	FACTOR(CLK_TOP_UNIVPLL_D3_D16, "univpll_d3_d16", "univpll_d3", 1, 16),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL, "univpll", "univ2pll", 1, 2, 0),
+	FACTOR_FLAGS(CLK_TOP_UNIVPLL_D3_D16, "univpll_d3_d16", "univpll_d3", 1, 16, 0),
 };
 
 static const char * const axi_parents[] = {
-- 
2.37.2


