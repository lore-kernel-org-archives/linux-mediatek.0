Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DA1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJoy27wV6ypMdTtfKQbP77QJcW7fLK6rXZSzl0/R3Xw=; b=07Qrh1xjai7maY
	rmWOhNvsFHU86ezJAlyelKIwbjcV1RhtnL54rmIzDIv7ONDzbpkWhDfV1/+JEL3xyqETC9x8ccy4r
	49qONe9TVW9m2poxLzWRiV3SU9vunOaU1HroL1fb7e5+ieYWxWKtP7DXJ3qK5TcQKZVNMfJJ4MgHj
	U4mPNcbuSqem4Fp7/hFdlsIobjCU+AuRkNNUgINihZaD+4ElJrH8hQVoUu7A8cI0Tg3HXxK9c1F8K
	htr/XojicoUme+qGeNJqGLrW0cb+XNy4a472p4QKvwvSNAlmu0qaL2l/Le4mA/NTSwM2WxZV8ULYP
	B+KjJcoMHBqgCD/I/mGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nARV4-009BGD-I7; Thu, 20 Jan 2022 07:04:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nARSz-0099uF-Q0; Thu, 20 Jan 2022 07:02:44 +0000
X-UUID: 818873d4ec56437dbceba8f05d37239e-20220120
X-UUID: 818873d4ec56437dbceba8f05d37239e-20220120
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 978976455; Thu, 20 Jan 2022 00:02:39 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 23:02:37 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 20 Jan 2022 15:02:35 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Jan 2022 15:02:34 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Fabien Parent <fparent@baylibre.com>
CC: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>, "John
 Crispin" <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Biao Huang <biao.huang@mediatek.com>,
 Yinghua Pan <ot_yinghua.pan@mediatek.com>, <srv_heupstream@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH net-next v1 5/9] net: ethernet: mtk-star-emac: add clock pad
 selection for RMII
Date: Thu, 20 Jan 2022 15:02:22 +0800
Message-ID: <20220120070226.1492-6-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120070226.1492-1-biao.huang@mediatek.com>
References: <20220120070226.1492-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_230241_956503_E1C84866 
X-CRM114-Status: GOOD (  18.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch add a new dts property named "mediatek,rmii-rxc" parsing
in driver, which will configure MAC to select which pin the RMII reference
clock is connected to, TXC or RXC.

TXC pad is the default reference clock pin. If user wants to use RXC pad
instead, add "mediatek,rmii-rxc" to corresponding device node.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Signed-off-by: Yinghua Pan <ot_yinghua.pan@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 403439782db9..ab2fe72fdd6a 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -189,6 +189,8 @@ static const char *const mtk_star_clk_names[] = { "core", "reg", "trans" };
 #define MTK_PERICFG_REG_NIC_CFG_CON_V2		0x0c10
 #define MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF	GENMASK(3, 0)
 #define MTK_PERICFG_BIT_NIC_CFG_CON_RMII	1
+#define MTK_PERICFG_BIT_NIC_CFG_CON_CLK		BIT(0)
+#define MTK_PERICFG_BIT_NIC_CFG_CON_CLK_V2	BIT(8)
 
 /* Represents the actual structure of descriptors used by the MAC. We can
  * reuse the same structure for both TX and RX - the layout is the same, only
@@ -265,6 +267,7 @@ struct mtk_star_priv {
 	int speed;
 	int duplex;
 	int pause;
+	bool rmii_rxc;
 
 	const struct mtk_star_compat *compat_data;
 
@@ -1528,6 +1531,8 @@ static int mtk_star_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	priv->rmii_rxc = of_property_read_bool(of_node, "mediatek,rmii-rxc");
+
 	if (priv->compat_data->set_interface_mode) {
 		ret = priv->compat_data->set_interface_mode(ndev);
 		if (ret) {
@@ -1571,17 +1576,21 @@ static int mt8516_set_interface_mode(struct net_device *ndev)
 {
 	struct mtk_star_priv *priv = netdev_priv(ndev);
 	struct device *dev = mtk_star_get_dev(priv);
-	unsigned int intf_val = 0;
+	unsigned int intf_val = 0, rmii_rxc = 0;
 
 	switch (priv->phy_intf) {
 	case PHY_INTERFACE_MODE_RMII:
 		intf_val = MTK_PERICFG_BIT_NIC_CFG_CON_RMII;
+		rmii_rxc = priv->rmii_rxc ? 0 : MTK_PERICFG_BIT_NIC_CFG_CON_CLK;
 		break;
 	default:
 		dev_err(dev, "This interface not supported\n");
 		return -EINVAL;
 	}
 
+	regmap_update_bits(priv->pericfg, MTK_PERICFG_REG_NIC_CFG1_CON,
+			   MTK_PERICFG_BIT_NIC_CFG_CON_CLK,
+			   rmii_rxc);
 	regmap_update_bits(priv->pericfg, MTK_PERICFG_REG_NIC_CFG0_CON,
 			   MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF,
 			   intf_val);
@@ -1597,6 +1606,7 @@ static int mt8365_set_interface_mode(struct net_device *ndev)
 	switch (priv->phy_intf) {
 	case PHY_INTERFACE_MODE_RMII:
 		intf_val = MTK_PERICFG_BIT_NIC_CFG_CON_RMII;
+		intf_val |= priv->rmii_rxc ? 0 : MTK_PERICFG_BIT_NIC_CFG_CON_CLK_V2;
 		break;
 	default:
 		dev_err(dev, "This interface not supported\n");
@@ -1604,7 +1614,8 @@ static int mt8365_set_interface_mode(struct net_device *ndev)
 	}
 
 	regmap_update_bits(priv->pericfg, MTK_PERICFG_REG_NIC_CFG_CON_V2,
-			   MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF,
+			   MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF |
+			   MTK_PERICFG_BIT_NIC_CFG_CON_CLK_V2,
 			   intf_val);
 	return 0;
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
