Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D7FC636CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3J+hmh0/1S38KQRXamDBaq5kS72FcUE3OEFO2SKmYA=; b=2txBfgnkEOJ4OHy4VHVLCJ9IJJ
	YSytTUy4E2ZKrDdGAcN89nrkOTH+cgu69TXdSnXpIWifRfJ6uBNs/RtSox9asXiS712YJIb/KW3Q1
	gZxwdqgb9kO+wMzLkbB7SZmyPadAdJPcntWY8I4MT475mcCI6pZ5cGeYXIJXondZRwhzc9vcMfaFe
	+03SSztePEYYFmVjVce8lYm/M0sZkfoRBU6idFUrYhKo+UOjIDX3nAe1NTuKJjFcgF0vdD5ELbxcU
	QSxJKRw7zzSwlkw1CJJZRCX5Fd1karPMO6sEnyz3Sn7gsHIlwCsRQ99VXicoeXqmbE5j6CZROkTKX
	+xOxjvmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQsN0-009nYy-AN; Sat, 11 Feb 2023 16:04:58 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQsMn-009nQZ-Q6; Sat, 11 Feb 2023 16:04:47 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pQsMm-0004M8-1w;
	Sat, 11 Feb 2023 17:04:44 +0100
Date: Sat, 11 Feb 2023 16:03:09 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: [PATCH v5 05/12] net: ethernet: mtk_eth_soc: set MDIO bus clock
 frequency
Message-ID: <046e17da34d00d4f545e970272ed6db0afee07eb.1676128246.git.daniel@makrotopia.org>
References: <cover.1676128246.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1676128246.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_080445_934803_BE942AE6 
X-CRM114-Status: GOOD (  12.52  )
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

Set MDIO bus clock frequency and allow setting a custom maximum
frequency from device tree.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Bjørn Mork <bjorn@mork.no>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 21 +++++++++++++++++++++
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  7 +++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index cfb15a84b894..030d87c42bd4 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -789,8 +789,10 @@ static const struct phylink_mac_ops mtk_phylink_ops = {
 
 static int mtk_mdio_init(struct mtk_eth *eth)
 {
+	unsigned int max_clk = 2500000, divider;
 	struct device_node *mii_np;
 	int ret;
+	u32 val;
 
 	mii_np = of_get_child_by_name(eth->dev->of_node, "mdio-bus");
 	if (!mii_np) {
@@ -818,6 +820,25 @@ static int mtk_mdio_init(struct mtk_eth *eth)
 	eth->mii_bus->parent = eth->dev;
 
 	snprintf(eth->mii_bus->id, MII_BUS_ID_SIZE, "%pOFn", mii_np);
+
+	if (!of_property_read_u32(mii_np, "clock-frequency", &val)) {
+		if (val > MDC_MAX_FREQ || val < MDC_MAX_FREQ / MDC_MAX_DIVIDER) {
+			dev_err(eth->dev, "MDIO clock frequency out of range");
+			ret = -EINVAL;
+			goto err_put_node;
+		}
+		max_clk = val;
+	}
+	divider = min_t(unsigned int, DIV_ROUND_UP(MDC_MAX_FREQ, max_clk), 63);
+
+	/* Configure MDC Divider */
+	val = mtk_r32(eth, MTK_PPSC);
+	val &= ~PPSC_MDC_CFG;
+	val |= FIELD_PREP(PPSC_MDC_CFG, divider) | PPSC_MDC_TURBO;
+	mtk_w32(eth, val, MTK_PPSC);
+
+	dev_dbg(eth->dev, "MDC is running on %d Hz\n", MDC_MAX_FREQ / divider);
+
 	ret = of_mdiobus_register(eth->mii_bus, mii_np);
 
 err_put_node:
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 7230dcb29315..7014c02ba2d4 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -363,6 +363,13 @@
 #define RX_DMA_VTAG_V2		BIT(0)
 #define RX_DMA_L4_VALID_V2	BIT(2)
 
+/* PHY Polling and SMI Master Control registers */
+#define MTK_PPSC		0x10000
+#define PPSC_MDC_CFG		GENMASK(29, 24)
+#define PPSC_MDC_TURBO		BIT(20)
+#define MDC_MAX_FREQ		25000000
+#define MDC_MAX_DIVIDER		63
+
 /* PHY Indirect Access Control registers */
 #define MTK_PHY_IAC		0x10004
 #define PHY_IAC_ACCESS		BIT(31)
-- 
2.39.1


