Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135D2C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 03:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fcv8Vi5ZUFv/ANYiMyYzvw4iJaLbArLioIEUEspblwc=; b=ldDA6TIOASYSr3sLXN9VvIDkNq
	HoBXis77lLHu/KlLTeEdKM/lhGJDeahAeiAKhL8/GQZT9DyhcZgiuGHNoWcVvAZyLHeqXi/1tNzFP
	22ale14izZW7bvDrS1ZcE4xALY54kPx6FlualzdrwbPeLUBz8QXalETfYq4RosvGDeIwCB/KwdgqC
	kfXXfc3pp58niC2AG64CbenDm23QPQBlnVwMDNoWdpoV31gtz2gb6QmFRsX15SmT2i/SmeipDeolK
	Q8ntvhCiDCz/pFgJ/1SMXOlnFP93uPPtSFvQ9qUvRWa/mOwRNKQ6B+w2f51e7mMPx6MNlTgUGxnn9
	RuNYNO5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCtJI-00AcM9-07;
	Tue, 12 Dec 2023 03:19:52 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCtJE-00AcKR-1F;
	Tue, 12 Dec 2023 03:19:49 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rCtJ2-0002iU-3D;
	Tue, 12 Dec 2023 03:19:38 +0000
Date: Tue, 12 Dec 2023 03:19:34 +0000
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
Subject: [PATCH v5 4/5] clk: mediatek: add pcw_chg_bit control for PLLs of
 MT7988
Message-ID: <a43ad2a0131ea35988dd490ab235d16d4119bc3a.1702350213.git.daniel@makrotopia.org>
References: <152b256d253508cdc7514c0f1c5a9324bde83d46.1702350213.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152b256d253508cdc7514c0f1c5a9324bde83d46.1702350213.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_191948_454120_1182440E 
X-CRM114-Status: GOOD (  15.91  )
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
---
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

