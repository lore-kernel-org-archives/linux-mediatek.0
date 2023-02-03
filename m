Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC54C636CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 07:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXy5FXuuubRPoECY2VDgm4FrS9+BDZj/2jy1HxAGUzE=; b=igLQAdXoslX+7VsMPVN5zfJEF/
	hyq2Xrn6qDog2naTvlFg5DxcFHEYP4camaMx9JNfx5mAZAWJxS5Pz7bZr2/3kdlsT7wmfwVKDpht4
	rQTQHp7O25K/UBBOCWKhoVsHPwHkfIO0b11z4cZ55biWuptc5wP+45+cVYmqW65YzXPCX1cVoGcXj
	xVe+MGPa7WC01DIHGYZtVsxTrbVpWEeH3J92qvV/zRxxksW/6rNWqcrFwpzLTcMA0kkktCH39HbAt
	CVuvg+EWRqzGQjj4RERjHLQdAXMB+3qSS0ujDIoDcTHnR1R3VMm/CClS/RNMIM2u0EnvvvduFl/vN
	Zzd8K8PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNq6N-000fQO-79; Fri, 03 Feb 2023 07:03:15 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNq6J-000fNq-SZ; Fri, 03 Feb 2023 07:03:13 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pNq6I-0000pB-1A;
	Fri, 03 Feb 2023 08:03:10 +0100
Date: Fri, 3 Feb 2023 07:01:28 +0000
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
Subject: [PATCH 3/9] net: ethernet: mtk_eth_soc: reset PCS state
Message-ID: <5f07845b710e8464cd9509387f1fcdc6baeb5cb9.1675407169.git.daniel@makrotopia.org>
References: <cover.1675407169.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675407169.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_230311_970103_EA47091E 
X-CRM114-Status: GOOD (  10.19  )
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

Reset PCS state when changing interface mode.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 4 ++++
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 724815ae18a0..d39717582a85 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -546,6 +546,10 @@
 #define SGMII_SEND_AN_ERROR_EN		BIT(11)
 #define SGMII_IF_MODE_MASK		GENMASK(5, 1)
 
+/* Register to reset SGMII design */
+#define SGMII_RESERVED_0	0x34
+#define SGMII_SW_RESET		BIT(0)
+
 /* Register to set SGMII speed, ANA RG_ Control Signals III*/
 #define SGMSYS_ANA_RG_CS3	0x2028
 #define RG_PHY_SPEED_MASK	(BIT(2) | BIT(3))
diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index 0fe403db23c9..f3cf66a23e72 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -88,6 +88,10 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
 		regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_PWR_STATE_CTRL,
 				   SGMII_PHYA_PWD, SGMII_PHYA_PWD);
 
+		/* Reset SGMII PCS state */
+		regmap_update_bits(mpcs->regmap, SGMII_RESERVED_0,
+				   SGMII_SW_RESET, SGMII_SW_RESET);
+
 		if (mpcs->flags & MTK_SGMII_FLAG_PN_SWAP)
 			regmap_update_bits(mpcs->regmap, SGMSYS_QPHY_WRAP_CTRL,
 					   SGMII_PN_SWAP_MASK,
-- 
2.39.1


