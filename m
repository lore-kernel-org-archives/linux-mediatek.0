Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5849CCA481
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 09:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sqao+PxLdpXHlkRVrC4henkX+4z2QTOtS5VZ6VC+6eo=; b=bqUKN9PpXk7Y0puHoYHYBml+cd
	14UO3K/mNOIXiSCFxl7/rWEjdokeXbzjotx/CkNY+SrviPSwz8vSpjhkgJ/ENgiHjgV7NhHPb1jAg
	Ci3wtAnG/I5PFvgILOQz2n2y/mSSEMjF+gRtud9b69AxzkfZNCIZdZQn6Uxd657tvN954A/D9gr4l
	I/2sApjCxKUF+a+cUHUyGbx0hWUbIJ4d2/aQe1D+jmMRWzAIqgHIsZmmXKUIQpJLM0BPe8r8isHXA
	rZ0WGMeV5IAgoP2ILvrB+pctNVCrRYwb+2YC6gx+IvJICUpP5ihRQ1pAQq9g/jCwmbVWDEgHVLcgZ
	HLqkWJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wNm-009Vvn-GO; Wed, 22 Jun 2022 09:10:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wJq-009THT-Ry; Wed, 22 Jun 2022 09:06:40 +0000
X-UUID: c2cde8b810994d3498f54c5b9614d333-20220622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:54f40d68-0834-4213-b0de-728c2352e2cf,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:2f4a35ea-f7af-4e69-92ee-0fd74a0c286c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: c2cde8b810994d3498f54c5b9614d333-20220622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1455160218; Wed, 22 Jun 2022 02:06:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 02:05:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 17:05:58 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 17:05:57 +0800
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
Subject: [PATCH net-next v3 08/10] net: ethernet: mtk-star-emac: add support for MII interface
Date: Wed, 22 Jun 2022 17:05:43 +0800
Message-ID: <20220622090545.23612-9-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622090545.23612-1-biao.huang@mediatek.com>
References: <20220622090545.23612-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_020638_970030_07E384DF 
X-CRM114-Status: GOOD (  15.47  )
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

Add support for MII interface.
If user wants to use MII, assign "MII" to "phy-mode" property in dts.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Signed-off-by: Yinghua Pan <ot_yinghua.pan@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index d0fa45007bbd..8625887ea4f3 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -192,6 +192,7 @@ static const char *const mtk_star_clk_names[] = { "core", "reg", "trans" };
 #define MTK_PERICFG_REG_NIC_CFG1_CON		0x03c8
 #define MTK_PERICFG_REG_NIC_CFG_CON_V2		0x0c10
 #define MTK_PERICFG_REG_NIC_CFG_CON_CFG_INTF	GENMASK(3, 0)
+#define MTK_PERICFG_BIT_NIC_CFG_CON_MII		0
 #define MTK_PERICFG_BIT_NIC_CFG_CON_RMII	1
 #define MTK_PERICFG_BIT_NIC_CFG_CON_CLK		BIT(0)
 #define MTK_PERICFG_BIT_NIC_CFG_CON_CLK_V2	BIT(8)
@@ -1462,6 +1463,7 @@ static int mtk_star_set_timing(struct mtk_star_priv *priv)
 	unsigned int delay_val = 0;
 
 	switch (priv->phy_intf) {
+	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_RMII:
 		delay_val |= FIELD_PREP(MTK_STAR_BIT_INV_RX_CLK, priv->rx_inv);
 		delay_val |= FIELD_PREP(MTK_STAR_BIT_INV_TX_CLK, priv->tx_inv);
@@ -1542,7 +1544,8 @@ static int mtk_star_probe(struct platform_device *pdev)
 	ret = of_get_phy_mode(of_node, &priv->phy_intf);
 	if (ret) {
 		return ret;
-	} else if (priv->phy_intf != PHY_INTERFACE_MODE_RMII) {
+	} else if (priv->phy_intf != PHY_INTERFACE_MODE_RMII &&
+		   priv->phy_intf != PHY_INTERFACE_MODE_MII) {
 		dev_err(dev, "unsupported phy mode: %s\n",
 			phy_modes(priv->phy_intf));
 		return -EINVAL;
@@ -1611,6 +1614,10 @@ static int mt8516_set_interface_mode(struct net_device *ndev)
 	unsigned int intf_val, ret, rmii_rxc;
 
 	switch (priv->phy_intf) {
+	case PHY_INTERFACE_MODE_MII:
+		intf_val = MTK_PERICFG_BIT_NIC_CFG_CON_MII;
+		rmii_rxc = 0;
+		break;
 	case PHY_INTERFACE_MODE_RMII:
 		intf_val = MTK_PERICFG_BIT_NIC_CFG_CON_RMII;
 		rmii_rxc = priv->rmii_rxc ? 0 : MTK_PERICFG_BIT_NIC_CFG_CON_CLK;
@@ -1640,6 +1647,9 @@ static int mt8365_set_interface_mode(struct net_device *ndev)
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


