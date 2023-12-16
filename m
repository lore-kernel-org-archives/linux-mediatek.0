Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A881C35274
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Dec 2023 00:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1SxbJsT5wPgpGQsgDz26mhS8TIzyse1ptorI7vwkxk=; b=GZxUYCJ+N/XrcgZMbnmlIPORhd
	MtPl3AnJ9KFjItVNiCOKgGKDd6VaPczE5zLV6UQcz/QAPTblOwghCRDVU2uviiI4FouU8DFaywUrM
	WOK1JRHIWyO1OtZ7zAlOQ6T6vYLgcMnvQ6v7YSm33ZH+gqzhHpJRwo/h4b0TliWEYf9M47DhMNfEt
	PPVyNYP5ZkQMX/vchCIQy45wPQbmqin/4mTsht8Ak2Im8B+NqkD7TTMqqvlyisqQoXpnSwda7x51b
	9KePcyjA9mPHiAUSyqcPOJu/f/jEFSsqF//HXk9PNkOVMGjSh2zrxvl7SAV/Z4aFoXE5n/1KKYZ4l
	J/7w+w0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEITZ-004you-17;
	Sat, 16 Dec 2023 00:24:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEISq-004yHt-1j;
	Sat, 16 Dec 2023 00:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=b1SxbJsT5wPgpGQsgDz26mhS8TIzyse1ptorI7vwkxk=; b=MqdjiL5J9s75vGm5uCga8+RMzw
	bhBech79EJ7OvP5MmsJpJeCWUWbxFQVxBPKC3meT6lmeAqNIy8XT/DcLwejKga1THp2zgPByd0XKl
	4gr405qynGv0eVu3ulq3dgWiRqt73qP2IVw0FCmugA22LBpROQ3Ac/4b8NgGgO60mghSru8PDnMTi
	KGU7wAL/YAx8o08HSTSrbDHETEx9/Au/rHGTGmkT+coHaQ+svUF2EB8ufe79r7KyNLGQxQhrSefSf
	obIo1ncgTAHnJs4x7UJ53A7Mp0V4ZM9va1tIaP3qjm9qp5dg4n1uwUw/MPTPJzrULILxLpoxxX5lD
	5HHkkHvA==;
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rEISl-004mUN-CG; Sat, 16 Dec 2023 00:23:31 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rEISb-0001Yp-15;
	Sat, 16 Dec 2023 00:23:18 +0000
Date: Sat, 16 Dec 2023 00:23:14 +0000
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Daniel Golle <daniel@makrotopia.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	"Garmin.Chang" <Garmin.Chang@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	James Liao <jamesjj.liao@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: [PATCH v6 4/5] clk: mediatek: add pcw_chg_bit control for PLLs of
 MT7988
Message-ID: <384cb034139239e06d1f8091492f47263b66e2e9.1702685864.git.daniel@makrotopia.org>
References: <27f99db432e9ccc804cc5b6501d7d17d72cae879.1702685864.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27f99db432e9ccc804cc5b6501d7d17d72cae879.1702685864.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_002328_608899_57B9D609 
X-CRM114-Status: GOOD (  15.12  )
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

Introduce pcw_chg_bit member to struct mtk_pll_data and use it instead
of the previously hardcoded PCW_CHG_MASK macro if set.
This will needed for clocks on the MT7988 SoC.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
v6: no changes
v5: rename to .pcw_chg_bit, use ? operator instead of changing every
    single existing driver. The approach in v4 doesn't work as
    if .pcw_chg_reg is unset/0, pll->pcw_chg_addr will default to
    pll->base_addr + REG_CON1. Hence setting .pcw_chg_bit would be
    required for *all* drivers instead of just those setting
    .pcs_chf_reg. And that seems like an excessive change which can
    easily be avoided by using the ? operator to set the default
    at runtime (and we can easily cope with that overhead).
v4: always set .pcw_chg_shift if .pcw_chg_reg is used instead of
    having an if-expression in mtk_pll_set_rate_regs().
v3: use git --from ...
v2: no changes
 drivers/clk/mediatek/clk-pll.c | 5 +++--
 drivers/clk/mediatek/clk-pll.h | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 513ab6b1b3229..ce453e1718e53 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -23,7 +23,7 @@
 #define CON0_BASE_EN		BIT(0)
 #define CON0_PWR_ON		BIT(0)
 #define CON0_ISO_EN		BIT(1)
-#define PCW_CHG_MASK		BIT(31)
+#define PCW_CHG_BIT		31
 
 #define AUDPLL_TUNER_EN		BIT(31)
 
@@ -114,7 +114,8 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
 			pll->data->pcw_shift);
 	val |= pcw << pll->data->pcw_shift;
 	writel(val, pll->pcw_addr);
-	chg = readl(pll->pcw_chg_addr) | PCW_CHG_MASK;
+	chg = readl(pll->pcw_chg_addr) |
+	      BIT(pll->data->pcw_chg_bit ? : PCW_CHG_BIT);
 	writel(chg, pll->pcw_chg_addr);
 	if (pll->tuner_addr)
 		writel(val + 1, pll->tuner_addr);
diff --git a/drivers/clk/mediatek/clk-pll.h b/drivers/clk/mediatek/clk-pll.h
index f17278ff15d78..285c8db958b39 100644
--- a/drivers/clk/mediatek/clk-pll.h
+++ b/drivers/clk/mediatek/clk-pll.h
@@ -48,6 +48,7 @@ struct mtk_pll_data {
 	const char *parent_name;
 	u32 en_reg;
 	u8 pll_en_bit; /* Assume 0, indicates BIT(0) by default */
+	u8 pcw_chg_bit;
 };
 
 /*
-- 
2.43.0

