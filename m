Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29789C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 02:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6GVmRCYYqLh2s+YZr4fjpcjSMg3BWWGjyPsb4nPw1k=; b=YwjzMTa0Qq9wGs
	kbDXG0dkuwFsSac9q9w8audxes5pwevWgnackX9rBk08IV3zSSZe+yqITs0T5LdPWqg5XCIzIt8ZS
	3DWXYLyk71w07HZ30cbfbB2Q7UB5T80aKH4hGwIjlOP+ukRuVvaXzi4UWowXpukYU7reBGYJuYsZn
	b9K04rti9cGo1NLAwWqOAaZ2u0iazPjBQZQ5wdWLyFyy5tVKFuPodWlfW/r1BZ1Ojwcjz9JYBRGYH
	Xx0ZrLXVEcKKUkMPZZzT1duvAQJ8VLTEwvthz0Msa+BqmG1wYP7O6Wr41ptTG6ux2SqK9AvLCXkiX
	d0iFE0NFMu/RePIG2iXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCu5k-00E1Xb-52; Thu, 27 Jan 2022 02:00:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCu4A-00E0gl-Aq; Thu, 27 Jan 2022 01:59:15 +0000
X-UUID: b1af162b4f6742f998c613a9a69ad05e-20220126
X-UUID: b1af162b4f6742f998c613a9a69ad05e-20220126
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1241407124; Wed, 26 Jan 2022 18:59:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 17:59:10 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 27 Jan 2022 09:59:09 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Jan 2022 09:59:08 +0800
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
Subject: [PATCH net-next v2 8/9] net: ethernet: mtk-star-emac: add support for
 MII interface
Date: Thu, 27 Jan 2022 09:58:56 +0800
Message-ID: <20220127015857.9868-9-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127015857.9868-1-biao.huang@mediatek.com>
References: <20220127015857.9868-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_175914_409696_BEB57A05 
X-CRM114-Status: GOOD (  15.57  )
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

Add support for MII interface.
If user wants to use MII, assign "MII" to "phy-mode" property in dts.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Signed-off-by: Yinghua Pan <ot_yinghua.pan@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index d5e974e0db6d..167a019fd8f5 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -193,6 +193,7 @@ static const char *const mtk_star_clk_names[] = { "core", "reg", "trans" };
 #define MTK_PERICFG_REG_NIC_CFG1_CON		0x03c8
 #define MTK_PERICFG_REG_NIC_CFG_CON_V2		0x0c10
 #define MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF	GENMASK(3, 0)
+#define MTK_PERICFG_BIT_NIC_CFG_CON_MII		0
 #define MTK_PERICFG_BIT_NIC_CFG_CON_RMII	1
 #define MTK_PERICFG_BIT_NIC_CFG_CON_CLK		BIT(0)
 #define MTK_PERICFG_BIT_NIC_CFG_CON_CLK_V2	BIT(8)
@@ -1463,6 +1464,7 @@ static int mtk_star_set_timing(struct mtk_star_priv *priv)
 	unsigned int delay_val = 0;
 
 	switch (priv->phy_intf) {
+	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_RMII:
 		delay_val |= FIELD_PREP(MTK_STAR_BIT_INV_RX_CLK, priv->rx_inv);
 		delay_val |= FIELD_PREP(MTK_STAR_BIT_INV_TX_CLK, priv->tx_inv);
@@ -1545,7 +1547,8 @@ static int mtk_star_probe(struct platform_device *pdev)
 	ret = of_get_phy_mode(of_node, &priv->phy_intf);
 	if (ret) {
 		return ret;
-	} else if (priv->phy_intf != PHY_INTERFACE_MODE_RMII) {
+	} else if (priv->phy_intf != PHY_INTERFACE_MODE_RMII &&
+		   priv->phy_intf != PHY_INTERFACE_MODE_MII) {
 		dev_err(dev, "unsupported phy mode: %s\n",
 			phy_modes(priv->phy_intf));
 		return -EINVAL;
@@ -1610,9 +1613,12 @@ static int mt8516_set_interface_mode(struct net_device *ndev)
 {
 	struct mtk_star_priv *priv = netdev_priv(ndev);
 	struct device *dev = mtk_star_get_dev(priv);
-	unsigned int intf_val, ret, rmii_rxc;
+	unsigned int intf_val, ret, rmii_rxc = 0;
 
 	switch (priv->phy_intf) {
+	case PHY_INTERFACE_MODE_MII:
+		intf_val = MTK_PERICFG_BIT_NIC_CFG_CON_MII;
+		break;
 	case PHY_INTERFACE_MODE_RMII:
 		intf_val = MTK_PERICFG_BIT_NIC_CFG_CON_RMII;
 		rmii_rxc = priv->rmii_rxc ? 0 : MTK_PERICFG_BIT_NIC_CFG_CON_CLK;
@@ -1642,6 +1648,9 @@ static int mt8365_set_interface_mode(struct net_device *ndev)
 	unsigned int intf_val;
 
 	switch (priv->phy_intf) {
+	case PHY_INTERFACE_MODE_MII:
+		intf_val = MTK_PERICFG_BIT_NIC_CFG_CON_MII;
+		break;
 	case PHY_INTERFACE_MODE_RMII:
 		intf_val = MTK_PERICFG_BIT_NIC_CFG_CON_RMII;
 		intf_val |= priv->rmii_rxc ? 0 : MTK_PERICFG_BIT_NIC_CFG_CON_CLK_V2;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
