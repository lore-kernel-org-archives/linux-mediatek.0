Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43578C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 12:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OIhci/zYM8WVXXXP4dJ8pS/3BNyD1Ofot8GqQvSd7Y=; b=SpyYsJL0JvWV75HxTqmficRdFq
	PU9G8TU/j9WV8jGecWAi+hZCKKM86/a8LVtjSXGnHlyjwf4bSwRvy/0Het8S3remvInPjD1c6+UFB
	TUjYWALi7ISlQIhT3LwDJzs1t06oOWkqCs6nsoM/DRy4o9fxPcnfwXL/PlxjX5UullgCmN0pUCmvF
	JW8VylNiNU4EHUuBvLxXe/8Xr8VQNVQEfGOMGc0DfW5BcPQzI0yKgfOJaZEfMKtWcP35nnxeYcBPJ
	tIFUoRVvV2YkMt8/edpidphRcf214RWUYP/0AGcOfuGSgj7dfne3EsEBjw+Ux0+hzNiydpbBwRA+G
	INgZ/OEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXJa-002Pea-F2; Fri, 24 Feb 2023 12:36:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXJO-002PYR-WE; Fri, 24 Feb 2023 12:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9OIhci/zYM8WVXXXP4dJ8pS/3BNyD1Ofot8GqQvSd7Y=; b=O/bOruc92YWbZ9DyTj5xYI6z8t
	lHDHvCMpc232LTY/oy4+PJ6F8luxZYxz5iVrGzWqlMK1D7OvdVXH2/KoMFAnIIPR/DCX/xhgO+Dh6
	xIaJTS4Oi4h4FB20NfmBgstq3u5PB3x4JgaUn5OteTUgn46MKYMdvr87/tPrUfCLdyS47LQ3xyC42
	2T/vKAsAAbV3fWx8xOSule8Ms6QpQW6SabtOtmrpI9y3DN3MD2LrTtOtMf5grpbZ9SMsGPD8/4lw3
	4ZwQLxRyEaPvhsfBRK31S+YmLFvcivmoVhRMLjBpt2KHN6dXjmgr/AY1p2n8EtI9YlLBl3nye19GJ
	ZE27T0PQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42320 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1pVXJB-0000dR-Bv; Fri, 24 Feb 2023 12:36:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1pVXJA-00CTAX-NA; Fri, 24 Feb 2023 12:36:16 +0000
In-Reply-To: <Y/ivHGroIVTe4YP/@shell.armlinux.org.uk>
References: <Y/ivHGroIVTe4YP/@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Daniel Golle <daniel@makrotopia.org>,
	 Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next 2/4] net: mtk_eth_soc: move trgmii ddr2 check to
 probe function
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1pVXJA-00CTAX-NA@rmk-PC.armlinux.org.uk>
Date: Fri, 24 Feb 2023 12:36:16 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_043631_055699_4733B17E 
X-CRM114-Status: GOOD (  13.70  )
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

If TRGMII mode is not permitted when using DDR2 mode, we should handle
that when setting up phylink's ->supported_interfaces so phylink knows
that this is not supported by the hardware. Move this check to
mtk_add_mac().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index c63f17929ccf..1b385dfe620f 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -374,17 +374,6 @@ static int mt7621_gmac0_rgmii_adjust(struct mtk_eth *eth,
 {
 	u32 val;
 
-	/* Check DDR memory type.
-	 * Currently TRGMII mode with DDR2 memory is not supported.
-	 */
-	regmap_read(eth->ethsys, ETHSYS_SYSCFG, &val);
-	if (interface == PHY_INTERFACE_MODE_TRGMII &&
-	    val & SYSCFG_DRAM_TYPE_DDR2) {
-		dev_err(eth->dev,
-			"TRGMII mode with DDR2 memory is not supported!\n");
-		return -EOPNOTSUPP;
-	}
-
 	val = (interface == PHY_INTERFACE_MODE_TRGMII) ?
 		ETHSYS_TRGMII_MT7621_DDR_PLL : 0;
 
@@ -4333,6 +4322,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	struct mtk_mac *mac;
 	int id, err;
 	int txqs = 1;
+	u32 val;
 
 	if (!_id) {
 		dev_err(eth->dev, "missing mac id\n");
@@ -4409,6 +4399,15 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 		__set_bit(PHY_INTERFACE_MODE_TRGMII,
 			  mac->phylink_config.supported_interfaces);
 
+	/* TRGMII is not permitted on MT7621 if using DDR2 */
+	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_GMAC1_TRGMII) &&
+	    MTK_HAS_CAPS(mac->hw->soc->caps, MTK_TRGMII_MT7621_CLK)) {
+		regmap_read(eth->ethsys, ETHSYS_SYSCFG, &val);
+		if (val & SYSCFG_DRAM_TYPE_DDR2)
+			__clear_bit(PHY_INTERFACE_MODE_TRGMII,
+				    mac->phylink_config.supported_interfaces);
+	}
+
 	if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_SGMII)) {
 		__set_bit(PHY_INTERFACE_MODE_SGMII,
 			  mac->phylink_config.supported_interfaces);
-- 
2.30.2


