Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBFEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 03:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=am8EpADdx3b2xdKbneNDV0VGzOtcBUgbmBrlfg06KO0=; b=H2twZPDS8UprWKwcPvK6gKYTW6
	Yp9y5/RKVoV6e5S/XNLi0rxSsZOoC3jARKTgvpjQwqRO8m2IU6MygVmu0Gz/xP5kUY5JvhndYQxQH
	iFM+JmZJff74iXGtYZ9ua2vEHcMX9nLbB2SBUCGmjypG8oxmJNEJoIBD0vCXs85MtCa2RbH2vPmbW
	F5ez2hh8k4kMxHzlKXVeDeWmMKsbDc7aoFqcNGhR4IDpYeJp6TCjajQyhoF4F/mkmJDRRBMU7E0nB
	Azy/PhN80mQA+UGKHzaB4rSX/WhvAdzO+SmAYwn0NQixey3dJ6XNkByiisHzAleRTF4T8io7/hu42
	OFV4HB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6OOy-009Gc8-5K; Wed, 29 Jun 2022 03:30:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6OOj-009GXZ-DZ; Wed, 29 Jun 2022 03:29:50 +0000
X-UUID: aa6c814d2ed4463fa24d8eeae82c4eac-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:7f1db628-9902-499b-ba9e-acfde070da24,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:87442a2,CLOUDID:96021bd6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: aa6c814d2ed4463fa24d8eeae82c4eac-20220628
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 644817990; Tue, 28 Jun 2022 20:22:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 29 Jun 2022 10:51:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 29 Jun 2022 10:51:13 +0800
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
Subject: [PATCH net-next v4 01/10] net: ethernet: mtk-star-emac: store bit_clk_div in compat structure
Date: Wed, 29 Jun 2022 10:51:00 +0800
Message-ID: <20220629025109.21933-2-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629025109.21933-1-biao.huang@mediatek.com>
References: <20220629025109.21933-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_202949_527618_9F998F03 
X-CRM114-Status: GOOD (  16.69  )
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

Not all the SoC are using the same clock divider. Move the divider into
a compat structure specific to the SoCs.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 23 +++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 95839fd84dab..9c54043f7866 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
@@ -231,6 +232,10 @@ struct mtk_star_ring {
 	unsigned int tail;
 };
 
+struct mtk_star_compat {
+	unsigned char bit_clk_div;
+};
+
 struct mtk_star_priv {
 	struct net_device *ndev;
 
@@ -256,6 +261,8 @@ struct mtk_star_priv {
 	int duplex;
 	int pause;
 
+	const struct mtk_star_compat *compat_data;
+
 	/* Protects against concurrent descriptor access. */
 	spinlock_t lock;
 
@@ -898,7 +905,7 @@ static void mtk_star_init_config(struct mtk_star_priv *priv)
 	regmap_write(priv->regs, MTK_STAR_REG_SYS_CONF, val);
 	regmap_update_bits(priv->regs, MTK_STAR_REG_MAC_CLK_CONF,
 			   MTK_STAR_MSK_MAC_CLK_CONF,
-			   MTK_STAR_BIT_CLK_DIV_10);
+			   priv->compat_data->bit_clk_div);
 }
 
 static void mtk_star_set_mode_rmii(struct mtk_star_priv *priv)
@@ -1460,6 +1467,7 @@ static int mtk_star_probe(struct platform_device *pdev)
 
 	priv = netdev_priv(ndev);
 	priv->ndev = ndev;
+	priv->compat_data = of_device_get_match_data(&pdev->dev);
 	SET_NETDEV_DEV(ndev, dev);
 	platform_set_drvdata(pdev, ndev);
 
@@ -1556,10 +1564,17 @@ static int mtk_star_probe(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_OF
+static const struct mtk_star_compat mtk_star_mt8516_compat = {
+	.bit_clk_div = MTK_STAR_BIT_CLK_DIV_10,
+};
+
 static const struct of_device_id mtk_star_of_match[] = {
-	{ .compatible = "mediatek,mt8516-eth", },
-	{ .compatible = "mediatek,mt8518-eth", },
-	{ .compatible = "mediatek,mt8175-eth", },
+	{ .compatible = "mediatek,mt8516-eth",
+	  .data = &mtk_star_mt8516_compat },
+	{ .compatible = "mediatek,mt8518-eth",
+	  .data = &mtk_star_mt8516_compat },
+	{ .compatible = "mediatek,mt8175-eth",
+	  .data = &mtk_star_mt8516_compat },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_star_of_match);
-- 
2.25.1


