Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E341C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 10:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=spoHSH8BcQhjjhpDtcW3JjttdK+ChwzF4kMcSvqYtoU=; b=eBiAn6i+JA5f02Ygt3tbycAQfP
	gRJMg8GryLhmV3/b5kkavZbKclW4lbrOvvTLG691S6chjzgcGQtDGL7kD+zf2oOhDrO8xjlRvIPun
	7pYFiNvUoR5vG9NlRvSHm+R6WRfY7iK+M2LCKN6bg0kzd51MK9qpyF2dtCqu0/9j+iXMs10AnAt/H
	OM40x0pp/+CYAtssWx2zTQ8Zq4np+itWztKN1e2SRXY82MLp5DORmPuBPmsHX/jL1hpTneMythLgh
	D+vyXHqipjmWZjc9erRwQRwiWqhrqHKKfos1nNNUQch2Io54nsoubWuBeIYUBTbN7GAiQuO9o+hTL
	F+bGyYEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYkEc-0000000EkxT-1Qv6;
	Tue, 30 Jul 2024 10:37:38 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYkDx-0000000Eklk-1PNe;
	Tue, 30 Jul 2024 10:36:58 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sYkDp-000000000le-27fR;
	Tue, 30 Jul 2024 10:36:49 +0000
Date: Tue, 30 Jul 2024 11:36:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3] net: ethernet: mtk_eth_soc: drop clocks unused
 by Ethernet driver
Message-ID: <b5faaf69b5c6e3e155c64af03706c3c423c6a1c9.1722335682.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_033657_394721_0E528AEB 
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

Clocks for SerDes and PHY are going to be handled by standalone drivers
for each of those hardware components. Drop them from the Ethernet driver.

The clocks which are being removed for this patch are responsible for
the for the SerDes PCS and PHYs used for the 2nd and 3rd MAC which are
anyway not yet supported. Hence backwards compatibility is not an issue.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
The dt-bindings part has been taken care of already in commit
cc349b0771dc dt-bindings: net: mediatek: remove wrongly added clocks and SerDes

Changes since v2:
Target net-next tree and drop Fixes: tag.

Changes since v1:
Improve commit message and explain why backward compatibility is not an issue,
as requested by Andrew Lunn. Patch content remains unchanged.

 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index eb1708b43aa3e..0d5225f1d3eef 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -724,12 +724,8 @@ enum mtk_clks_map {
 	MTK_CLK_ETHWARP_WOCPU2,
 	MTK_CLK_ETHWARP_WOCPU1,
 	MTK_CLK_ETHWARP_WOCPU0,
-	MTK_CLK_TOP_USXGMII_SBUS_0_SEL,
-	MTK_CLK_TOP_USXGMII_SBUS_1_SEL,
 	MTK_CLK_TOP_SGM_0_SEL,
 	MTK_CLK_TOP_SGM_1_SEL,
-	MTK_CLK_TOP_XFI_PHY_0_XTAL_SEL,
-	MTK_CLK_TOP_XFI_PHY_1_XTAL_SEL,
 	MTK_CLK_TOP_ETH_GMII_SEL,
 	MTK_CLK_TOP_ETH_REFCK_50M_SEL,
 	MTK_CLK_TOP_ETH_SYS_200M_SEL,
@@ -800,19 +796,9 @@ enum mtk_clks_map {
 				 BIT_ULL(MTK_CLK_GP3) | BIT_ULL(MTK_CLK_XGP1) | \
 				 BIT_ULL(MTK_CLK_XGP2) | BIT_ULL(MTK_CLK_XGP3) | \
 				 BIT_ULL(MTK_CLK_CRYPTO) | \
-				 BIT_ULL(MTK_CLK_SGMII_TX_250M) | \
-				 BIT_ULL(MTK_CLK_SGMII_RX_250M) | \
-				 BIT_ULL(MTK_CLK_SGMII2_TX_250M) | \
-				 BIT_ULL(MTK_CLK_SGMII2_RX_250M) | \
 				 BIT_ULL(MTK_CLK_ETHWARP_WOCPU2) | \
 				 BIT_ULL(MTK_CLK_ETHWARP_WOCPU1) | \
 				 BIT_ULL(MTK_CLK_ETHWARP_WOCPU0) | \
-				 BIT_ULL(MTK_CLK_TOP_USXGMII_SBUS_0_SEL) | \
-				 BIT_ULL(MTK_CLK_TOP_USXGMII_SBUS_1_SEL) | \
-				 BIT_ULL(MTK_CLK_TOP_SGM_0_SEL) | \
-				 BIT_ULL(MTK_CLK_TOP_SGM_1_SEL) | \
-				 BIT_ULL(MTK_CLK_TOP_XFI_PHY_0_XTAL_SEL) | \
-				 BIT_ULL(MTK_CLK_TOP_XFI_PHY_1_XTAL_SEL) | \
 				 BIT_ULL(MTK_CLK_TOP_ETH_GMII_SEL) | \
 				 BIT_ULL(MTK_CLK_TOP_ETH_REFCK_50M_SEL) | \
 				 BIT_ULL(MTK_CLK_TOP_ETH_SYS_200M_SEL) | \
-- 
2.45.2


