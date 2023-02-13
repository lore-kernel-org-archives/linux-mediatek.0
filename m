Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77377C636CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 21:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwcrMfNgF63gIrZ/GkmsQ7CjfsIvdJXRwyJlJfugE+g=; b=Zuh/asj90OpW3WYVlmJVdQrZIN
	5qKd2qGWZm+ahOi+qURfc52+kccO4qVHhu1AP4Tn82rB2XRO8SKMFnleAgI+d+fJsX7ldGrDdf8qu
	MsM09NANswcwtLJCqM0f1BIhqVfmeHIohrkh0xWIk5lq/OFa/x33/aERFUv5lL/C2kPzZrWbitdoe
	DHgcigeIWkixMqD88SSwsE9/Iv2fHkNjbQKfG7HR6aNzNE47oOOaU9bEc8poZAN/ejMCZniTWXUVE
	Xm4uFDS4lUNWh7l2dvE1vIukfO/UjFNU75kk5WpMyPRzmxK/sKlqroriCJCbn6CMOrLPzOcSmKJtB
	ivDpm7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRgVz-00GNp3-Na; Mon, 13 Feb 2023 21:37:35 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRgVW-00GNXf-2U; Mon, 13 Feb 2023 21:37:09 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pRgVU-0006hg-1Q;
	Mon, 13 Feb 2023 22:37:04 +0100
Date: Mon, 13 Feb 2023 21:35:29 +0000
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
Subject: [PATCH v6 06/12] net: ethernet: mtk_eth_soc: reset PCS state
Message-ID: <8e05777b11bfcbefb6aa7642fcc80a33177a3fe1.1676323692.git.daniel@makrotopia.org>
References: <cover.1676323692.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1676323692.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_133707_640369_4E763097 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Tested-by: Bjørn Mork <bjorn@mork.no>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 4 ++++
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 7014c02ba2d4..142def8629c8 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -548,6 +548,10 @@
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
index d7ffaaeaf9ab..d7e7352041a4 100644
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


