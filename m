Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704D5CCA479
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 03:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpZqzfReo/PvH/XGwWnVJAhJnqt6vEDGuYtrwaWhnow=; b=YUgKN/WpAAZyMahsa/qRQWPuQD
	wcR6L4U+uaaY63HsUZBC1EuIatuZQ8PoxZw05/ncW5YR7W5hjMv+RbESxVzyBHhF2u3wfB4uaOe4z
	K8jCn3a+mpw/HXTd0XFTEWyUtydxqB2pDM6XxHGoLnYEzrPhIw8lfZ3vE9kcwgKNh1QcDwJaeAav4
	6l0gCRP8yTvgalMWYWl18+uavG924r72NZN4xkDioPtgJ47ielZJrL74prniJwdCZPeYLh8mo4MV+
	Fv9g0F+Brv5FAbuHL6DYKZIbnCqCid2Jn2Z3bWo2Gb79w6HN5JmH1dgmg5Y84MI6LRTdNuVkcZddv
	gtbMSBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6OJT-009Eq6-Kz; Wed, 29 Jun 2022 03:24:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6OJH-009Elf-FM; Wed, 29 Jun 2022 03:24:13 +0000
X-UUID: ebd8d5e6d0c94e42b8367be0eb87a8db-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:27e352b9-f92c-41e2-bf54-87feaf5bf74c,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:64ed1ad6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ebd8d5e6d0c94e42b8367be0eb87a8db-20220628
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 289585416; Tue, 28 Jun 2022 20:19:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 29 Jun 2022 11:18:08 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 29 Jun 2022 11:18:06 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Fabien
 Parent" <fparent@baylibre.com>
CC: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
	<sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Biao Huang <biao.huang@mediatek.com>, Yinghua Pan
	<ot_yinghua.pan@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Subject: [PATCH net-next v5 10/10] net: ethernet: mtk-star-emac: enable half duplex hardware support
Date: Wed, 29 Jun 2022 11:17:43 +0800
Message-ID: <20220629031743.22115-11-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629031743.22115-1-biao.huang@mediatek.com>
References: <20220629031743.22115-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_202411_562356_654B17CF 
X-CRM114-Status: GOOD (  11.62  )
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

Current driver doesn't support half duplex correctly.
This patch enable half duplex capability in hardware.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Signed-off-by: Yinghua Pan <ot_yinghua.pan@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 30 ++++++++-----------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 87c6c9bc221d..21c3668194eb 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -883,32 +883,26 @@ static void mtk_star_phy_config(struct mtk_star_priv *priv)
 	val <<= MTK_STAR_OFF_PHY_CTRL1_FORCE_SPD;
 
 	val |= MTK_STAR_BIT_PHY_CTRL1_AN_EN;
-	val |= MTK_STAR_BIT_PHY_CTRL1_FORCE_FC_RX;
-	val |= MTK_STAR_BIT_PHY_CTRL1_FORCE_FC_TX;
-	/* Only full-duplex supported for now. */
-	val |= MTK_STAR_BIT_PHY_CTRL1_FORCE_DPX;
-
-	regmap_write(priv->regs, MTK_STAR_REG_PHY_CTRL1, val);
-
 	if (priv->pause) {
-		val = MTK_STAR_VAL_FC_CFG_SEND_PAUSE_TH_2K;
-		val <<= MTK_STAR_OFF_FC_CFG_SEND_PAUSE_TH;
-		val |= MTK_STAR_BIT_FC_CFG_UC_PAUSE_DIR;
+		val |= MTK_STAR_BIT_PHY_CTRL1_FORCE_FC_RX;
+		val |= MTK_STAR_BIT_PHY_CTRL1_FORCE_FC_TX;
+		val |= MTK_STAR_BIT_PHY_CTRL1_FORCE_DPX;
 	} else {
-		val = 0;
+		val &= ~MTK_STAR_BIT_PHY_CTRL1_FORCE_FC_RX;
+		val &= ~MTK_STAR_BIT_PHY_CTRL1_FORCE_FC_TX;
+		val &= ~MTK_STAR_BIT_PHY_CTRL1_FORCE_DPX;
 	}
+	regmap_write(priv->regs, MTK_STAR_REG_PHY_CTRL1, val);
 
+	val = MTK_STAR_VAL_FC_CFG_SEND_PAUSE_TH_2K;
+	val <<= MTK_STAR_OFF_FC_CFG_SEND_PAUSE_TH;
+	val |= MTK_STAR_BIT_FC_CFG_UC_PAUSE_DIR;
 	regmap_update_bits(priv->regs, MTK_STAR_REG_FC_CFG,
 			   MTK_STAR_MSK_FC_CFG_SEND_PAUSE_TH |
 			   MTK_STAR_BIT_FC_CFG_UC_PAUSE_DIR, val);
 
-	if (priv->pause) {
-		val = MTK_STAR_VAL_EXT_CFG_SND_PAUSE_RLS_1K;
-		val <<= MTK_STAR_OFF_EXT_CFG_SND_PAUSE_RLS;
-	} else {
-		val = 0;
-	}
-
+	val = MTK_STAR_VAL_EXT_CFG_SND_PAUSE_RLS_1K;
+	val <<= MTK_STAR_OFF_EXT_CFG_SND_PAUSE_RLS;
 	regmap_update_bits(priv->regs, MTK_STAR_REG_EXT_CFG,
 			   MTK_STAR_MSK_EXT_CFG_SND_PAUSE_RLS, val);
 }
-- 
2.25.1


