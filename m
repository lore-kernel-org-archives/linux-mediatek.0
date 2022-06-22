Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB089C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 09:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhWgwV2WLDdOf7zMOJ472oC2qQPjHJk8pjjGIdds71w=; b=tkFCVm0YYRy9pfsquNXssC1FC2
	q17GTVgWAMrZIK6zgzDXH78xHtlNqgWsD0oReMa2eeMiqHEP4dTAloe1Dbpzs7bZCCI8qLJUgaXlB
	0nxyMY5dORRNesj4NELAiuuEq993fqNLXDP6uLgCaHE7VVZrHLhs+qaQjVoprMacb+qZCj6+wC+Aa
	3c/o9CtBqGahkFsQjbTrMCsDU7k12dTtNSxzmxNCJf8S6MT7dVzArEgoqR3XVBaXWBFrAGBWJHF3P
	pQvFfepZIv9P6UfCUxSD+/6dQ+MkOPwpty80gzWbckUgGb7Ve47l9nKXKKrGp0LzEwxhx9jrws5ei
	2PenfvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wUV-009ZBe-Ol; Wed, 22 Jun 2022 09:17:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wT1-009YXz-3e; Wed, 22 Jun 2022 09:16:08 +0000
X-UUID: 9bafa4cc595f4a849dd993847cabf257-20220622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:64b748bc-f3ba-4215-bda7-65e02aeed132,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:259e2a38-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 9bafa4cc595f4a849dd993847cabf257-20220622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 393276618; Wed, 22 Jun 2022 02:15:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 02:05:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 17:05:55 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 17:05:54 +0800
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
Subject: [PATCH net-next v3 06/10] net: ethernet: mtk-star-emac: add timing adjustment support
Date: Wed, 22 Jun 2022 17:05:41 +0800
Message-ID: <20220622090545.23612-7-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622090545.23612-1-biao.huang@mediatek.com>
References: <20220622090545.23612-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_021607_192568_308E4315 
X-CRM114-Status: GOOD (  15.64  )
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

Add simple clock inversion for timing adjustment in driver.
Add property "mediatek,txc-inverse" or "mediatek,rxc-inverse" to
device node when necessary.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Signed-off-by: Yinghua Pan <ot_yinghua.pan@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index b4d37728be69..d0fa45007bbd 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -130,6 +130,11 @@ static const char *const mtk_star_clk_names[] = { "core", "reg", "trans" };
 #define MTK_STAR_REG_INT_MASK			0x0054
 #define MTK_STAR_BIT_INT_MASK_FNRC		BIT(6)
 
+/* Delay-Macro Register */
+#define MTK_STAR_REG_TEST0			0x0058
+#define MTK_STAR_BIT_INV_RX_CLK			BIT(30)
+#define MTK_STAR_BIT_INV_TX_CLK			BIT(31)
+
 /* Misc. Config Register */
 #define MTK_STAR_REG_TEST1			0x005c
 #define MTK_STAR_BIT_TEST1_RST_HASH_MBIST	BIT(31)
@@ -267,6 +272,8 @@ struct mtk_star_priv {
 	int duplex;
 	int pause;
 	bool rmii_rxc;
+	bool rx_inv;
+	bool tx_inv;
 
 	const struct mtk_star_compat *compat_data;
 
@@ -1449,6 +1456,23 @@ static void mtk_star_clk_disable_unprepare(void *data)
 	clk_bulk_disable_unprepare(MTK_STAR_NCLKS, priv->clks);
 }
 
+static int mtk_star_set_timing(struct mtk_star_priv *priv)
+{
+	struct device *dev = mtk_star_get_dev(priv);
+	unsigned int delay_val = 0;
+
+	switch (priv->phy_intf) {
+	case PHY_INTERFACE_MODE_RMII:
+		delay_val |= FIELD_PREP(MTK_STAR_BIT_INV_RX_CLK, priv->rx_inv);
+		delay_val |= FIELD_PREP(MTK_STAR_BIT_INV_TX_CLK, priv->tx_inv);
+		break;
+	default:
+		dev_err(dev, "This interface not supported\n");
+		return -EINVAL;
+	}
+
+	return regmap_write(priv->regs, MTK_STAR_REG_TEST0, delay_val);
+}
 static int mtk_star_probe(struct platform_device *pdev)
 {
 	struct device_node *of_node;
@@ -1531,6 +1555,8 @@ static int mtk_star_probe(struct platform_device *pdev)
 	}
 
 	priv->rmii_rxc = of_property_read_bool(of_node, "mediatek,rmii-rxc");
+	priv->rx_inv = of_property_read_bool(of_node, "mediatek,rxc-inverse");
+	priv->tx_inv = of_property_read_bool(of_node, "mediatek,txc-inverse");
 
 	if (priv->compat_data->set_interface_mode) {
 		ret = priv->compat_data->set_interface_mode(ndev);
@@ -1540,6 +1566,12 @@ static int mtk_star_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = mtk_star_set_timing(priv);
+	if (ret) {
+		dev_err(dev, "Failed to set timing, err = %d\n", ret);
+		return -EINVAL;
+	}
+
 	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (ret) {
 		dev_err(dev, "unsupported DMA mask\n");
-- 
2.25.1


