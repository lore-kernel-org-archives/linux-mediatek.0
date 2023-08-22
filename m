Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC2DEE4996
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlnjPm6dPkb+57n/9UfCDDBuOfZ7cdVqIfZwO0EBp2A=; b=Y6e9jwasZkqfwggQmWNM8TwHUb
	ePzAwDU0w15zxzJ11O66oxeucG5VVjz8CoxGBUwTv3/nh6zD1WKwMGLNSLA6tAgUdEUa8QWHrWKcJ
	eaXQp9ydVrDCF6miw1PKLATZioqO0TiUGjFnqUMxHUufoZXU11jsne1r3guT+8j4OjzQKxwa2cUyp
	0RR1jZTiwfvCo3nky5bXZMNf6AyQIK2OJQJ86NGdG9LI+hKqDB47yWiVplydkhpRfVTdn1rsVAXZJ
	H1sa7aZpyv7ixkxAxRD9PypyLlk2xFevE4wgtY6DGfBvr9tb9NuR9b5m5nVdlfCoNMkoIe1donJ6a
	WpdKc6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUIN-00GUhC-2x;
	Tue, 22 Aug 2023 16:31:55 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYUID-00GUdb-0d;
	Tue, 22 Aug 2023 16:31:46 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qYUI0-0000GQ-18;
	Tue, 22 Aug 2023 16:31:32 +0000
Date: Tue, 22 Aug 2023 17:31:24 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 1/4] net: ethernet: mtk_eth_soc: fix register
 definitions for MT7988
Message-ID: <1c8da012e2ca80939906d85f314138c552139f0f.1692721443.git.daniel@makrotopia.org>
References: <cover.1692721443.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1692721443.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_093145_231867_8EEE3238 
X-CRM114-Status: UNSURE (   9.76  )
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

More register macros need to be adjusted for the 3rd GMAC on MT7988.
Account for added bit in SYSCFG0_SGMII_MASK.

Fixes: 445eb6448ed3 ("net: ethernet: mtk_eth_soc: add basic support for MT7988 SoC")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 4a2470fbad2cf..8d2d35b322351 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -133,10 +133,12 @@
 #define MTK_GDMA_XGDM_SEL	BIT(31)
 
 /* Unicast Filter MAC Address Register - Low */
-#define MTK_GDMA_MAC_ADRL(x)	(0x508 + (x * 0x1000))
+#define MTK_GDMA_MAC_ADRL(x)	({ typeof(x) _x = (x); (_x == MTK_GMAC3_ID) ?	\
+				   0x548 : 0x508 + (_x * 0x1000); })
 
 /* Unicast Filter MAC Address Register - High */
-#define MTK_GDMA_MAC_ADRH(x)	(0x50C + (x * 0x1000))
+#define MTK_GDMA_MAC_ADRH(x)	({ typeof(x) _x = (x); (_x == MTK_GMAC3_ID) ?	\
+				   0x54C : 0x50C + (_x * 0x1000); })
 
 /* FE global misc reg*/
 #define MTK_FE_GLO_MISC         0x124
@@ -503,7 +505,7 @@
 #define ETHSYS_SYSCFG0		0x14
 #define SYSCFG0_GE_MASK		0x3
 #define SYSCFG0_GE_MODE(x, y)	(x << (12 + (y * 2)))
-#define SYSCFG0_SGMII_MASK     GENMASK(9, 8)
+#define SYSCFG0_SGMII_MASK     GENMASK(9, 7)
 #define SYSCFG0_SGMII_GMAC1    ((2 << 8) & SYSCFG0_SGMII_MASK)
 #define SYSCFG0_SGMII_GMAC2    ((3 << 8) & SYSCFG0_SGMII_MASK)
 #define SYSCFG0_SGMII_GMAC1_V2 BIT(9)
-- 
2.41.0

