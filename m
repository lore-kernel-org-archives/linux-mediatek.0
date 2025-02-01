Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9ADC0218A
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Feb 2025 17:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EeY00tIL/Jvr0IbJa3CUcJtP68ZHP/96PngFWZWU3hE=; b=P4b0FbEX9Wdown3+RKvLDqJsxh
	RQl9EGuTdDerAl5Y3Kr67t8wXCqr3Su4h6l/2pxAS0SLQ/FPp5Ks63lfJsJNp4rx1wC8zE0G/3lhK
	gISOL80WuA+rRlBQKJ+seVLeDDa4CTEThQqL8ETpbRMxgEpmrUrl2INH9a+qaPMukicbKvzJ15WOS
	N8Pw1NZfcXwomxwqJiRFyMa3cl6Scdky8a/t/PFTzgxt2YOVftDD7pR79RIKc4nq4zo6CnE56BGM3
	i5qR7tmEArPOYj4lyL8w7gTD6qotr4BEpkKPaGT72ECxLvsF3h7T+KGKqZwU6OopXh6HFbw3eY/NQ
	V2u1nlNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teHET-0000000CweE-2pqC;
	Sat, 01 Feb 2025 17:24:37 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teHD8-0000000Cwbh-3Qdz;
	Sat, 01 Feb 2025 17:23:16 +0000
X-CSE-ConnectionGUID: 19DO66UsQvC5nwOyinA5Tg==
X-CSE-MsgGUID: WMx+ps2zQIqUKFzcM/jIGQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Feb 2025 02:23:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.62])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 764AA4038594;
	Sun,  2 Feb 2025 02:23:00 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] net: ethernet: mtk_eth_soc: Use of_get_available_child_by_name()
Date: Sat,  1 Feb 2025 17:22:53 +0000
Message-ID: <20250201172258.56148-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_092314_968232_A26743A1 
X-CRM114-Status: GOOD (  10.40  )
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

Use the helper of_get_available_child_by_name() to simplify
mtk_mdio_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch is only compile tested and depend upon[1]
[1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.renesas.com/
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 25 +++++----------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 53485142938c..b318a5b58608 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -826,26 +826,18 @@ static const struct phylink_mac_ops mtk_phylink_ops = {
 static int mtk_mdio_init(struct mtk_eth *eth)
 {
 	unsigned int max_clk = 2500000, divider;
-	struct device_node *mii_np;
-	int ret;
+	struct device_node *mii_np _free(device_node) =
+		of_get_available_child_by_name(eth->dev->of_node, "mdio-bus");
 	u32 val;
 
-	mii_np = of_get_child_by_name(eth->dev->of_node, "mdio-bus");
 	if (!mii_np) {
 		dev_err(eth->dev, "no %s child node found", "mdio-bus");
 		return -ENODEV;
 	}
 
-	if (!of_device_is_available(mii_np)) {
-		ret = -ENODEV;
-		goto err_put_node;
-	}
-
 	eth->mii_bus = devm_mdiobus_alloc(eth->dev);
-	if (!eth->mii_bus) {
-		ret = -ENOMEM;
-		goto err_put_node;
-	}
+	if (!eth->mii_bus)
+		return -ENOMEM;
 
 	eth->mii_bus->name = "mdio";
 	eth->mii_bus->read = mtk_mdio_read_c22;
@@ -860,8 +852,7 @@ static int mtk_mdio_init(struct mtk_eth *eth)
 	if (!of_property_read_u32(mii_np, "clock-frequency", &val)) {
 		if (val > MDC_MAX_FREQ || val < MDC_MAX_FREQ / MDC_MAX_DIVIDER) {
 			dev_err(eth->dev, "MDIO clock frequency out of range");
-			ret = -EINVAL;
-			goto err_put_node;
+			return -EINVAL;
 		}
 		max_clk = val;
 	}
@@ -879,11 +870,7 @@ static int mtk_mdio_init(struct mtk_eth *eth)
 
 	dev_dbg(eth->dev, "MDC is running on %d Hz\n", MDC_MAX_FREQ / divider);
 
-	ret = of_mdiobus_register(eth->mii_bus, mii_np);
-
-err_put_node:
-	of_node_put(mii_np);
-	return ret;
+	return of_mdiobus_register(eth->mii_bus, mii_np);
 }
 
 static void mtk_mdio_cleanup(struct mtk_eth *eth)
-- 
2.43.0


