Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DF3EE498E
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 18:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kda1VoM6G+9dVGzYidol8WAGxR45wgLSfP7vaPbIv6Y=; b=E6AOWm9kB96PcArXot07iD8hAZ
	wWCq008afsfYTvd9Vqj3agEw7qtxjRZWJLwVqDvgHLo/9nlEqQCsKavgiF4UKve3YNEsADrLEpWvR
	hIzrMg53gSP4MxwJF4hivYgx/Pm1wc3Ru95FmNwgEIaIWPUpJKAsFO4o0qRsxwGk7n8CoHwEue6JG
	7u1r10hnOVVAg8xUJ20jXtneAFflb2OcnFvC7P7GJBWqdzEvVIQT5mOHJPZyqWjv/tv2VWpDU9wv2
	YFyDPL0ei/GsCX0Mri/EaT7g4LYcZeQVPRK8l0oiDnjwOQ7CSimb1vy9Tk5IYGSojOf622pW3u692
	+lDb8FYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX41A-009r7D-2v;
	Fri, 18 Aug 2023 18:16:16 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX416-009r6U-2m;
	Fri, 18 Aug 2023 18:16:14 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qX40d-00007g-2n;
	Fri, 18 Aug 2023 18:15:44 +0000
Date: Fri, 18 Aug 2023 19:15:24 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: ethernet: mtk_eth_soc: add reset bits for MT7988
Message-ID: <b983a3adf5184a30e4ce620fbbf028c9c76648ae.1692382239.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_111612_920135_D27100F0 
X-CRM114-Status: GOOD (  14.11  )
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

Add bits needed to reset the frame engine on MT7988.

Fixes: 445eb6448ed3 ("net: ethernet: mtk_eth_soc: add basic support for MT7988 SoC")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 76 +++++++++++++++------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 11 ++-
 2 files changed, 64 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index fe05c90202699..2482f47313085 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3613,19 +3613,34 @@ static void mtk_hw_reset(struct mtk_eth *eth)
 {
 	u32 val;
 
-	if (mtk_is_netsys_v2_or_greater(eth)) {
+	if (mtk_is_netsys_v2_or_greater(eth))
 		regmap_write(eth->ethsys, ETHSYS_FE_RST_CHK_IDLE_EN, 0);
+
+	if (mtk_is_netsys_v3_or_greater(eth)) {
+		val = RSTCTRL_PPE0_V3;
+
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
+			val |= RSTCTRL_PPE1_V3;
+
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE2))
+			val |= RSTCTRL_PPE2;
+
+		val |= RSTCTRL_WDMA0 | RSTCTRL_WDMA1 | RSTCTRL_WDMA2;
+	} else if (mtk_is_netsys_v2_or_greater(eth)) {
 		val = RSTCTRL_PPE0_V2;
+
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
+			val |= RSTCTRL_PPE1;
 	} else {
 		val = RSTCTRL_PPE0;
 	}
 
-	if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
-		val |= RSTCTRL_PPE1;
-
 	ethsys_reset(eth, RSTCTRL_ETH | RSTCTRL_FE | val);
 
-	if (mtk_is_netsys_v2_or_greater(eth))
+	if (mtk_is_netsys_v3_or_greater(eth))
+		regmap_write(eth->ethsys, ETHSYS_FE_RST_CHK_IDLE_EN,
+			     0x6f8ff);
+	else if (mtk_is_netsys_v2_or_greater(eth))
 		regmap_write(eth->ethsys, ETHSYS_FE_RST_CHK_IDLE_EN,
 			     0x3ffffff);
 }
@@ -3651,13 +3666,21 @@ static void mtk_hw_warm_reset(struct mtk_eth *eth)
 		return;
 	}
 
-	if (mtk_is_netsys_v2_or_greater(eth))
+	if (mtk_is_netsys_v3_or_greater(eth)) {
+		rst_mask = RSTCTRL_ETH | RSTCTRL_PPE0_V3;
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
+			rst_mask |= RSTCTRL_PPE1_V3;
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE2))
+			rst_mask |= RSTCTRL_PPE2;
+
+		rst_mask |= RSTCTRL_WDMA0 | RSTCTRL_WDMA1 | RSTCTRL_WDMA2;
+	} else if (mtk_is_netsys_v2_or_greater(eth)) {
 		rst_mask = RSTCTRL_ETH | RSTCTRL_PPE0_V2;
-	else
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
+			rst_mask |= RSTCTRL_PPE1;
+	} else {
 		rst_mask = RSTCTRL_ETH | RSTCTRL_PPE0;
-
-	if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
-		rst_mask |= RSTCTRL_PPE1;
+	}
 
 	regmap_update_bits(eth->ethsys, ETHSYS_RSTCTRL, rst_mask, rst_mask);
 
@@ -4009,11 +4032,17 @@ static void mtk_prepare_for_reset(struct mtk_eth *eth)
 	u32 val;
 	int i;
 
-	/* disabe FE P3 and P4 */
-	val = mtk_r32(eth, MTK_FE_GLO_CFG) | MTK_FE_LINK_DOWN_P3;
-	if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
-		val |= MTK_FE_LINK_DOWN_P4;
-	mtk_w32(eth, val, MTK_FE_GLO_CFG);
+	/* set FE PPE ports link down */
+	for (i = MTK_GMAC1_ID;
+	     i <= (mtk_is_netsys_v3_or_greater(eth) ? MTK_GMAC3_ID : MTK_GMAC2_ID);
+	     i += 2) {
+		val = mtk_r32(eth, MTK_FE_GLO_CFG(i)) | MTK_FE_LINK_DOWN_P(PSE_PPE0_PORT);
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
+			val |= MTK_FE_LINK_DOWN_P(PSE_PPE1_PORT);
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE2))
+			val |= MTK_FE_LINK_DOWN_P(PSE_PPE2_PORT);
+		mtk_w32(eth, val, MTK_FE_GLO_CFG(i));
+	}
 
 	/* adjust PPE configurations to prepare for reset */
 	for (i = 0; i < ARRAY_SIZE(eth->ppe); i++)
@@ -4074,11 +4103,18 @@ static void mtk_pending_work(struct work_struct *work)
 		}
 	}
 
-	/* enabe FE P3 and P4 */
-	val = mtk_r32(eth, MTK_FE_GLO_CFG) & ~MTK_FE_LINK_DOWN_P3;
-	if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
-		val &= ~MTK_FE_LINK_DOWN_P4;
-	mtk_w32(eth, val, MTK_FE_GLO_CFG);
+	/* set FE PPE ports link up */
+	for (i = MTK_GMAC1_ID;
+	     i <= (mtk_is_netsys_v3_or_greater(eth) ? MTK_GMAC3_ID : MTK_GMAC2_ID);
+	     i += 2) {
+		val = mtk_r32(eth, MTK_FE_GLO_CFG(i)) & ~MTK_FE_LINK_DOWN_P(PSE_PPE0_PORT);
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
+			val &= ~MTK_FE_LINK_DOWN_P(PSE_PPE1_PORT);
+		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE2))
+			val &= ~MTK_FE_LINK_DOWN_P(PSE_PPE2_PORT);
+
+		mtk_w32(eth, val, MTK_FE_GLO_CFG(i));
+	}
 
 	clear_bit(MTK_RESETTING, &eth->state);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 8d2d35b322351..bb4313c92fae0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -76,9 +76,8 @@
 #define	MTK_HW_LRO_SDL_REMAIN_ROOM	1522
 
 /* Frame Engine Global Configuration */
-#define MTK_FE_GLO_CFG		0x00
-#define MTK_FE_LINK_DOWN_P3	BIT(11)
-#define MTK_FE_LINK_DOWN_P4	BIT(12)
+#define MTK_FE_GLO_CFG(x)	(((x) == MTK_GMAC3_ID) ? 0x24 : 0x00)
+#define MTK_FE_LINK_DOWN_P(x)	BIT(((x) + 8) % 16)
 
 /* Frame Engine Global Reset Register */
 #define MTK_RST_GL		0x04
@@ -522,9 +521,15 @@
 /* ethernet reset control register */
 #define ETHSYS_RSTCTRL			0x34
 #define RSTCTRL_FE			BIT(6)
+#define RSTCTRL_WDMA0			BIT(24)
+#define RSTCTRL_WDMA1			BIT(25)
+#define RSTCTRL_WDMA2			BIT(26)
 #define RSTCTRL_PPE0			BIT(31)
 #define RSTCTRL_PPE0_V2			BIT(30)
 #define RSTCTRL_PPE1			BIT(31)
+#define RSTCTRL_PPE0_V3			BIT(29)
+#define RSTCTRL_PPE1_V3			BIT(30)
+#define RSTCTRL_PPE2			BIT(31)
 #define RSTCTRL_ETH			BIT(23)
 
 /* ethernet reset check idle register */
-- 
2.41.0

