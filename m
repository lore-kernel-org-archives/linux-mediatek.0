Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C64C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 17:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pISgyEEbNgckM754GgOyys7xZ+HZ3agTVDRjwAkig0I=; b=xdrD8LYRnH3o7NAT5aaju7XTee
	LJP04RW6wMDmhw2RPV8zuxxoAb2fTadGmou3y+gi8gy8YJon+JN+lqQFSuVMoGIQgto9AIMRxLnR4
	cq8P9wducwoceAyCjsu4wwE88GqrUgfMGZvIs2mTt/aTP+2aHkYuSGTEpqXGtWHp3tnIhoM7gqaDh
	E3CUvw5dcH+PZxkzZcxyiF03nuuVIzJVbnN1ejT4IdQj8/FgeJAoH+s6gJ9Bv7RMRwTS3CFKfoHN8
	mJRXoFymX+4lMGBzPKSvi9TXxLu4d9hjZ+e2Ct+7iN8ehtGKc2NkFnfiHruqWrJ55rvUMBHqLTCUz
	6MViUw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r57vn-00DilA-0q;
	Mon, 20 Nov 2023 17:19:31 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r57vb-00DiaF-39;
	Mon, 20 Nov 2023 17:19:21 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r57vQ-0008L6-0R;
	Mon, 20 Nov 2023 17:19:09 +0000
Date: Mon, 20 Nov 2023 17:19:05 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Daniel Golle <daniel@makrotopia.org>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	"Garmin.Chang" <Garmin.Chang@mediatek.com>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 3/4] clk: mediatek: Add pcw_chg_shift control
Message-ID: <cb983f0d30f019120cf49f24efb655cf794084d3.1700498124.git.daniel@makrotopia.org>
References: <b277c5f084ff35849efb8250510b2536053d1316.1700498124.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b277c5f084ff35849efb8250510b2536053d1316.1700498124.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_091920_060250_45C50AC8 
X-CRM114-Status: GOOD (  13.69  )
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

Introduce pcw_chg_shfit control to optionally use that instead of the
hardcoded PCW_CHG_MASK macro.
This will needed for clocks on the MT7988 SoC.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-pll.c | 5 ++++-
 drivers/clk/mediatek/clk-pll.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 513ab6b1b3229..9f08bc5d2a8a2 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -114,7 +114,10 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
 			pll->data->pcw_shift);
 	val |= pcw << pll->data->pcw_shift;
 	writel(val, pll->pcw_addr);
-	chg = readl(pll->pcw_chg_addr) | PCW_CHG_MASK;
+	if (pll->data->pcw_chg_shift)
+		chg = readl(pll->pcw_chg_addr) | BIT(pll->data->pcw_chg_shift);
+	else
+		chg = readl(pll->pcw_chg_addr) | PCW_CHG_MASK;
 	writel(chg, pll->pcw_chg_addr);
 	if (pll->tuner_addr)
 		writel(val + 1, pll->tuner_addr);
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index f17278ff15d78..d28d317e84377 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -44,6 +44,7 @@ struct mtk_pll_data {
 	u32 pcw_reg;
 	int pcw_shift;
 	u32 pcw_chg_reg;
+	int pcw_chg_shift;
 	const struct mtk_pll_div_table *div_table;
 	const char *parent_name;
 	u32 en_reg;
-- 
2.42.1

