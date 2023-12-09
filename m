Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12328C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Dec 2023 21:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acHW+d1HVHx7EqJUtDOl640c8ywp4oVQHuJ7PFl91E0=; b=nMY7F/lxeyHC0YK8GxLs5bBpRL
	6yrEwbHdojdFuDg2IDMrCKHkY+hGE6Y0yCnOkW9TnJQbaZcWloCMujhZHTCmvswHpxb9nJF+Gi4dW
	oP8fj7cY2oSr+B5ecbRmb3VyNRVFJpj4VLmM3RUK46IeJuCXdB1Nr3Bs8p7Ma/B8RPnB4NT2pl9JW
	S59Iw4DJcqdNzqqiCu2eaB0aSYP8Woqn/T1JEn5xqtQ1yQe6iK6G6jrB4sxqo7r7dCJjtkb6TBMeD
	3JNAb+qiMiB52kdCSZpH9o6y/9yltMiCMJoWhyeAQFrtATWRIu49nrflLqAJh2Wo6I02jSJF4JbNu
	8lwm6++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rC5JP-000aJW-00;
	Sat, 09 Dec 2023 21:56:39 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rC5JH-000aFk-2I;
	Sat, 09 Dec 2023 21:56:33 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rC5Iy-0000AX-1S;
	Sat, 09 Dec 2023 21:56:13 +0000
Date: Sat, 9 Dec 2023 21:56:09 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Daniel Golle <daniel@makrotopia.org>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	"Garmin.Chang" <Garmin.Chang@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Jiasheng Jiang <jiasheng@iscas.ac.cn>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Frank Wunderlich <frank-w@public-files.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: [PATCH v4 3/4] clk: mediatek: Add pcw_chg_shift control
Message-ID: <28c8ccd234ba311591b6db0de131fde36d3ec409.1702158423.git.daniel@makrotopia.org>
References: <097e82b0d66570763d64be1715517d8b032fcf95.1702158423.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <097e82b0d66570763d64be1715517d8b032fcf95.1702158423.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231209_135631_754413_CEB99B38 
X-CRM114-Status: GOOD (  14.59  )
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

From: Sam Shih <sam.shih@mediatek.com>

Introduce pcw_chg_shfit control to replace hardcoded PCW_CHG_MASK macro.
This will needed for clocks on the MT7988 SoC.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v4: always set .pcw_chg_shift if .pcw_chg_reg is used instead of
    having an if-expression in mtk_pll_set_rate_regs().
v3: use git --from ...
v2: no changes

 drivers/clk/mediatek/clk-mt6779.c            | 1 +
 drivers/clk/mediatek/clk-mt8183-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 1 +
 drivers/clk/mediatek/clk-pll.c               | 3 +--
 drivers/clk/mediatek/clk-pll.h               | 2 ++
 8 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index ffedb1fe3c672..e66461f341dd3 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1166,6 +1166,7 @@ static const struct mtk_gate apmixed_clks[] = {
 		.pcw_reg = _pcw_reg,					\
 		.pcw_shift = _pcw_shift,				\
 		.pcw_chg_reg = _pcw_chg_reg,				\
+		.pcw_chg_shift = PCW_CHG_SHIFT,				\
 		.div_table = _div_table,				\
 	}
 
diff --git a/drivers/clk/mediatek/clk-mt8183-apmixedsys.c b/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
index 2b261c0e2b61d..184e0cd1dde29 100644
--- a/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8183-apmixedsys.c
@@ -75,6 +75,7 @@ static const struct mtk_gate apmixed_clks[] = {
 		.pcw_reg = _pcw_reg,					\
 		.pcw_shift = _pcw_shift,				\
 		.pcw_chg_reg = _pcw_chg_reg,				\
+		.pcw_chg_shift = PCW_CHG_SHIFT,				\
 		.div_table = _div_table,				\
 	}
 
diff --git a/drivers/clk/mediatek/clk-mt8188-apmixedsys.c b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
index 41ab4d6896a49..87c5dfa3d1ac4 100644
--- a/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8188-apmixedsys.c
@@ -53,6 +53,7 @@ static const struct mtk_gate apmixed_clks[] = {
 		.pcw_reg = _pcw_reg,					\
 		.pcw_shift = _pcw_shift,				\
 		.pcw_chg_reg = _pcw_chg_reg,				\
+		.pcw_chg_shift = PCW_CHG_SHIFT,				\
 		.en_reg = _en_reg,					\
 		.pll_en_bit = _pll_en_bit,				\
 	}
diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index 3590932acc63a..67bf5ef3f0033 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -56,6 +56,7 @@ static const struct mtk_gate apmixed_clks[] = {
 		.pcw_reg = _pcw_reg,					\
 		.pcw_shift = _pcw_shift,				\
 		.pcw_chg_reg = _pcw_chg_reg,				\
+		.pcw_chg_shift = PCW_CHG_SHIFT,				\
 		.en_reg = _en_reg,					\
 		.pll_en_bit = _pll_en_bit,				\
 	}
diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
index 44a4c85a67ef5..ccd6bac7cb1fc 100644
--- a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
@@ -54,6 +54,7 @@ static const struct mtk_gate apmixed_clks[] = {
 		.pcw_reg = _pcw_reg,					\
 		.pcw_shift = _pcw_shift,				\
 		.pcw_chg_reg = _pcw_chg_reg,				\
+		.pcw_chg_shift = PCW_CHG_SHIFT,				\
 		.en_reg = _en_reg,					\
 		.pll_en_bit = _pll_en_bit,				\
 	}
diff --git a/drivers/clk/mediatek/clk-mt8365-apmixedsys.c b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
index 9b0bc5daeac06..daddca6db44e7 100644
--- a/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
@@ -39,6 +39,7 @@
 		.pcw_reg = _pcw_reg,					\
 		.pcw_shift = _pcw_shift,				\
 		.pcw_chg_reg = _pcw_chg_reg,				\
+		.pcw_chg_shift = PCW_CHG_SHIFT,				\
 		.div_table = _div_table,				\
 	}
 
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 513ab6b1b3229..139b01ab8d140 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -23,7 +23,6 @@
 #define CON0_BASE_EN		BIT(0)
 #define CON0_PWR_ON		BIT(0)
 #define CON0_ISO_EN		BIT(1)
-#define PCW_CHG_MASK		BIT(31)
 
 #define AUDPLL_TUNER_EN		BIT(31)
 
@@ -114,7 +113,7 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
 			pll->data->pcw_shift);
 	val |= pcw << pll->data->pcw_shift;
 	writel(val, pll->pcw_addr);
-	chg = readl(pll->pcw_chg_addr) | PCW_CHG_MASK;
+	chg = readl(pll->pcw_chg_addr) | BIT(pll->data->pcw_chg_shift);
 	writel(chg, pll->pcw_chg_addr);
 	if (pll->tuner_addr)
 		writel(val + 1, pll->tuner_addr);
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index f17278ff15d78..84bd8df13e2e5 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -22,6 +22,7 @@ struct mtk_pll_div_table {
 #define HAVE_RST_BAR	BIT(0)
 #define PLL_AO		BIT(1)
 #define POSTDIV_MASK	GENMASK(2, 0)
+#define PCW_CHG_SHIFT	31
 
 struct mtk_pll_data {
 	int id;
@@ -48,6 +49,7 @@ struct mtk_pll_data {
 	const char *parent_name;
 	u32 en_reg;
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
+	u8 pcw_chg_shift;
 };
 
 /*
-- 
2.43.0

