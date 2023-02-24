Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3705CC61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 12:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yi14cTdYANNPEap3pqdxxJ1hsHfM+r9CN0mSG8FKdBA=; b=mdD/oZiNq8VKD/FFkPqKfoousJ
	W23ucq14talgrA/F2LoSN32Af7yEU5b/H0Fe/OUg8X1LKBnsYFf1Zt/ck8MeEQveysyVMccvD++jY
	uoA4P3a4Mv5K3QKuSWbDBIVSiWNqPI2iUqnCszyYmjh94YR8qnksfDIenI60yLaqgzfnyIhJnLMv1
	lgZfP3xc5xikC2GDdHZBDZ23tI/LIr9dvFLpIXXkgYXvSWLNDEn9R9VUFehqwCJlNGbBc9IrIcitU
	UazqRY+SC29zTSYKvjiiN2+cwKDFFgD2kff8fhrhlUPMvZNSJteAj7qg/M7inSuDctjQKgfOyW+FF
	fBFyPfCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXLT-002Qhi-54; Fri, 24 Feb 2023 12:38:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVXLE-002PWz-Jl; Fri, 24 Feb 2023 12:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yi14cTdYANNPEap3pqdxxJ1hsHfM+r9CN0mSG8FKdBA=; b=14UfcOsBa6nbww2NhPSDz98UyC
	+sFNmp9pAjgVPiU7itFTJ8ULwVo44eVKET6hhwcpDD9Ac85eLDe1GACqUf9OGWjD6FTYEM/5jE8Al
	zAkAa2nqiOzIrCe41tOYLlf4Yyz1TL2M+jCPM7m0Hb1fEec7gjX7nQdW+KrSyeEt561a8VH1cW1Qj
	PlP01S1KwGMV50TSql80FwfcOunRRZp9Cnye1PWNbaXd7pOO9Blm1mW+z8qGFO9ielq5nBHDPKEVf
	JiRKF+BWhR4Str2km1OS56pv4aAzeNsieIYJ20mfcknAkdYNSfmb7Mek3M3KBR7jW7iSfjfZBBtZd
	Uob2NqrA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49018 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1pVXJ6-0000dF-68; Fri, 24 Feb 2023 12:36:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1pVXJ5-00CT9m-CT; Fri, 24 Feb 2023 12:36:11 +0000
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
Subject: [PATCH RFC net-next 1/4] net: mtk_eth_soc: tidy
 mtk_gmac0_rgmii_adjust()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1pVXJ5-00CT9m-CT@rmk-PC.armlinux.org.uk>
Date: Fri, 24 Feb 2023 12:36:11 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_043824_672783_81613FEA 
X-CRM114-Status: GOOD (  10.49  )
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

Get rid of the multiple tenary operators in mtk_gmac0_rgmii_adjust()
replacing them with a single if(), thus making the code easier to read.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 34 ++++++++++++---------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 14be6ea51b88..c63f17929ccf 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -397,38 +397,42 @@ static int mt7621_gmac0_rgmii_adjust(struct mtk_eth *eth,
 static void mtk_gmac0_rgmii_adjust(struct mtk_eth *eth,
 				   phy_interface_t interface, int speed)
 {
-	u32 val;
+	unsigned long rate;
+	u32 tck, rck, intf;
 	int ret;
 
 	if (interface == PHY_INTERFACE_MODE_TRGMII) {
 		mtk_w32(eth, TRGMII_MODE, INTF_MODE);
-		val = 500000000;
-		ret = clk_set_rate(eth->clks[MTK_CLK_TRGPLL], val);
+		ret = clk_set_rate(eth->clks[MTK_CLK_TRGPLL], 500000000);
 		if (ret)
 			dev_err(eth->dev, "Failed to set trgmii pll: %d\n", ret);
 		return;
 	}
 
-	val = (speed == SPEED_1000) ?
-		INTF_MODE_RGMII_1000 : INTF_MODE_RGMII_10_100;
-	mtk_w32(eth, val, INTF_MODE);
+	if (speed == SPEED_1000) {
+		intf = INTF_MODE_RGMII_1000;
+		rate = 250000000;
+		rck = RCK_CTRL_RGMII_1000;
+		tck = TCK_CTRL_RGMII_1000;
+	} else {
+		intf = INTF_MODE_RGMII_10_100;
+		rate = 500000000;
+		rck = RCK_CTRL_RGMII_10_100;
+		tck = TCK_CTRL_RGMII_10_100;
+	}
+
+	mtk_w32(eth, intf, INTF_MODE);
 
 	regmap_update_bits(eth->ethsys, ETHSYS_CLKCFG0,
 			   ETHSYS_TRGMII_CLK_SEL362_5,
 			   ETHSYS_TRGMII_CLK_SEL362_5);
 
-	val = (speed == SPEED_1000) ? 250000000 : 500000000;
-	ret = clk_set_rate(eth->clks[MTK_CLK_TRGPLL], val);
+	ret = clk_set_rate(eth->clks[MTK_CLK_TRGPLL], rate);
 	if (ret)
 		dev_err(eth->dev, "Failed to set trgmii pll: %d\n", ret);
 
-	val = (speed == SPEED_1000) ?
-		RCK_CTRL_RGMII_1000 : RCK_CTRL_RGMII_10_100;
-	mtk_w32(eth, val, TRGMII_RCK_CTRL);
-
-	val = (speed == SPEED_1000) ?
-		TCK_CTRL_RGMII_1000 : TCK_CTRL_RGMII_10_100;
-	mtk_w32(eth, val, TRGMII_TCK_CTRL);
+	mtk_w32(eth, rck, TRGMII_RCK_CTRL);
+	mtk_w32(eth, tck, TRGMII_TCK_CTRL);
 }
 
 static struct phylink_pcs *mtk_mac_select_pcs(struct phylink_config *config,
-- 
2.30.2


