Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FE7C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 03:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psZaW/6dBZXiO/JKNFbhuc9d6DjsbIxF/hKhKcSJFCA=; b=KIDmQXglibtCGDnz9bvjkzTUfi
	Vc/pDLbH5ZsEqNRAyCFjrzpq6UKG8us3p8zLkozvS6Ul87kbNU5iaMOqL6CAbFS1lkXipPMxxIp0q
	LsiYw8SWYJof6Uw+5cWz2wQrNFETFT4WxTuLTIEpDc2O3X5zmazpB2MA+pswFXkuh3k/eVWgLESAj
	5UbJH0MB0+l+4MT/kLz3h5gbeCSVUwLquz2LNn5uDvsH5JHz8zw7sb0ojB6WElCYsnrIvhht4gEHL
	sRGRzUzLbSpYqPAKKVErdKDApMKLMuG8w2ugd/9ohLN5MTidjPOJcK3cyWwb+EzkPj/9SznzUtrd7
	I8oeG2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Oig-009KYq-N7; Wed, 29 Jun 2022 03:50:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6OiW-009KWO-29; Wed, 29 Jun 2022 03:50:17 +0000
X-UUID: b4734a12502044229da0ddfd2bd15853-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:ea6b7ab9-9351-4604-af9b-58c7c27a92a9,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:87442a2,CLOUDID:b0380c86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b4734a12502044229da0ddfd2bd15853-20220628
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 204727622; Tue, 28 Jun 2022 20:49:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 29 Jun 2022 11:17:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 29 Jun 2022 11:17:57 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Fabien
 Parent <fparent@baylibre.com>
CC: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
	<sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Biao Huang <biao.huang@mediatek.com>, Yinghua Pan
	<ot_yinghua.pan@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH net-next v5 05/10] net: ethernet: mtk-star-emac: add clock pad selection for RMII
Date: Wed, 29 Jun 2022 11:17:38 +0800
Message-ID: <20220629031743.22115-6-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629031743.22115-1-biao.huang@mediatek.com>
References: <20220629031743.22115-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_205016_138738_106FA36C 
X-CRM114-Status: GOOD (  19.56  )
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

This patch add a new dts property named "mediatek,rmii-rxc" parsing
in driver, which will configure MAC to select which pin the RMII reference
clock is connected to, TXC or RXC.

TXC pad is the default reference clock pin. If user wants to use RXC pad
instead, add "mediatek,rmii-rxc" to corresponding device node.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Signed-off-by: Yinghua Pan <ot_yinghua.pan@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 3776af9ac1ff..b4d37728be69 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -188,6 +188,8 @@ static const char *const mtk_star_clk_names[] = { "core", "reg", "trans" };
 #define MTK_PERICFG_REG_NIC_CFG_CON_V2		0x0c10
 #define MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF	GENMASK(3, 0)
 #define MTK_PERICFG_BIT_NIC_CFG_CON_RMII	1
+#define MTK_PERICFG_BIT_NIC_CFG_CON_CLK		BIT(0)
+#define MTK_PERICFG_BIT_NIC_CFG_CON_CLK_V2	BIT(8)
 
 /* Represents the actual structure of descriptors used by the MAC. We can
  * reuse the same structure for both TX and RX - the layout is the same, only
@@ -264,6 +266,7 @@ struct mtk_star_priv {
 	int speed;
 	int duplex;
 	int pause;
+	bool rmii_rxc;
 
 	const struct mtk_star_compat *compat_data;
 
@@ -1527,6 +1530,8 @@ static int mtk_star_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	priv->rmii_rxc = of_property_read_bool(of_node, "mediatek,rmii-rxc");
+
 	if (priv->compat_data->set_interface_mode) {
 		ret = priv->compat_data->set_interface_mode(ndev);
 		if (ret) {
@@ -1571,17 +1576,25 @@ static int mt8516_set_interface_mode(struct net_device *ndev)
 {
 	struct mtk_star_priv *priv = netdev_priv(ndev);
 	struct device *dev = mtk_star_get_dev(priv);
-	unsigned int intf_val;
+	unsigned int intf_val, ret, rmii_rxc;
 
 	switch (priv->phy_intf) {
 	case PHY_INTERFACE_MODE_RMII:
 		intf_val = MTK_PERICFG_BIT_NIC_CFG_CON_RMII;
+		rmii_rxc = priv->rmii_rxc ? 0 : MTK_PERICFG_BIT_NIC_CFG_CON_CLK;
 		break;
 	default:
 		dev_err(dev, "This interface not supported\n");
 		return -EINVAL;
 	}
 
+	ret = regmap_update_bits(priv->pericfg,
+				 MTK_PERICFG_REG_NIC_CFG1_CON,
+				 MTK_PERICFG_BIT_NIC_CFG_CON_CLK,
+				 rmii_rxc);
+	if (ret)
+		return ret;
+
 	return regmap_update_bits(priv->pericfg,
 				  MTK_PERICFG_REG_NIC_CFG0_CON,
 				  MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF,
@@ -1597,6 +1610,7 @@ static int mt8365_set_interface_mode(struct net_device *ndev)
 	switch (priv->phy_intf) {
 	case PHY_INTERFACE_MODE_RMII:
 		intf_val = MTK_PERICFG_BIT_NIC_CFG_CON_RMII;
+		intf_val |= priv->rmii_rxc ? 0 : MTK_PERICFG_BIT_NIC_CFG_CON_CLK_V2;
 		break;
 	default:
 		dev_err(dev, "This interface not supported\n");
@@ -1605,7 +1619,8 @@ static int mt8365_set_interface_mode(struct net_device *ndev)
 
 	return regmap_update_bits(priv->pericfg,
 				  MTK_PERICFG_REG_NIC_CFG_CON_V2,
-				  MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF,
+				  MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF |
+				  MTK_PERICFG_BIT_NIC_CFG_CON_CLK_V2,
 				  intf_val);
 }
 
-- 
2.25.1


