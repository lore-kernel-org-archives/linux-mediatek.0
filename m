Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33E0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 09:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjGqKdJyJ6ZhUI23yFvd83aoTc0RqYIMh2uVczlhzu4=; b=RSb7nkYQoK1uOloVfZhSyQWMNN
	u2YbJpnmD92NSrsSj9S4LYidOcteCk8+uS1oc7/npG7AkwSyLzf6ftlTrfkjwOnHGfQ6j8VF2Ug9A
	KUI7MGtFzoQ+fTfRX8+uUfuutz2ZT6nQz3y0Vwu3cr4DJdEjJAA10jeGx2Gwu1px2eCfJl5mIsmeQ
	EKLe5/QlpD6W/O641Q4+1xp3OntF13uuzsnZ6WTDGvHV8UUYx14Oh11hNipFDnuXbI5MMBboDVI65
	04BC7RlGAPhM6NoKVW0GWCOkUmfgVrxYNTrWAoKqntD8fuS3fc0FMQmM4ov7r+TfmbX4Y1df1ib0I
	tYIU+J/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wUZ-009ZDa-W2; Wed, 22 Jun 2022 09:17:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3wSy-009YXz-Sq; Wed, 22 Jun 2022 09:16:07 +0000
X-UUID: 2878d103c51e45cca686903489d038de-20220622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:27faf505-6943-4f45-b76f-e8cda585373f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:f017be2d-1756-4fa3-be7f-474a6e4be921,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 2878d103c51e45cca686903489d038de-20220622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 210704022; Wed, 22 Jun 2022 02:15:58 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 02:06:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 17:06:00 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 17:05:59 +0800
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
Subject: [PATCH net-next v3 10/10] net: ethernet: mtk-star-emac: enable half duplex hardware support
Date: Wed, 22 Jun 2022 17:05:45 +0800
Message-ID: <20220622090545.23612-11-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622090545.23612-1-biao.huang@mediatek.com>
References: <20220622090545.23612-1-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_021604_984148_39FA90F3 
X-CRM114-Status: GOOD (  10.70  )
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

Current driver don't support 100/10M duplex half function.
This patch enable half duplex capability in hardware.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Signed-off-by: Yinghua Pan <ot_yinghua.pan@mediatek.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 30 ++++++++-----------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 87e5bc9c343a..67e85705b770 100644
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


