Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71B4C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 10:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wk69iRTgUwmj56SHqEZr/0PffF5VD5u95/h9J28Ie3Y=; b=s3U5O1izP19ozfzjoE0LCGPw9k
	482Y3acZ+Lmf3JcOfrm6DGRbYXpDJV8fLMJg9ZKY6m/UMLSiNAASt5TwW7/VCDVEVB62dK4b8E4aZ
	cMF0l0Junjy/b7mH94i5wImRPhJfW2j4XyE2kFHfyws8SuZpSAUS9MxPVi5qoTg9dKYSAi0GLsWLa
	Fb7v+LoWvZwjiEd3X1C27s3FGxu2ynjDp419T17q90yY148V8EJHJpddP1Rzz54eKrRz8x9v4UPE6
	r1G6vSSAja2Igai3Bd2Frku9jjY3uW+de/fMo18IA00q8wcwT85IqVoFu9UVlsUt/26EpM4ZQ48y3
	7kfhz6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPJUy-0000000CqRH-3cAB;
	Thu, 04 Jul 2024 10:15:32 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPJUl-0000000CqMj-0RYi;
	Thu, 04 Jul 2024 10:15:20 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sPJUW-00000000816-0b7U;
	Thu, 04 Jul 2024 10:15:04 +0000
Date: Thu, 4 Jul 2024 11:14:55 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] net: ethernet: mtk_eth_soc: implement
 .{get,set}_pauseparam ethtool ops
Message-ID: <e3ece47323444631d6cb479f32af0dfd6d145be0.1720088047.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_031519_321468_8E6B4BE8 
X-CRM114-Status: GOOD (  11.22  )
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

Implement operations to get and set flow-control link parameters.
Both is done by simply calling phylink_ethtool_{get,set}_pauseparam().
Fix whitespace in mtk_ethtool_ops while at it.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 13d78d9b3197..fbf5f566fdc5 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4464,6 +4464,20 @@ static int mtk_set_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd)
 	return ret;
 }
 
+static void mtk_get_pauseparam(struct net_device *dev, struct ethtool_pauseparam *pause)
+{
+	struct mtk_mac *mac = netdev_priv(dev);
+
+	phylink_ethtool_get_pauseparam(mac->phylink, pause);
+}
+
+static int mtk_set_pauseparam(struct net_device *dev, struct ethtool_pauseparam *pause)
+{
+	struct mtk_mac *mac = netdev_priv(dev);
+
+	return phylink_ethtool_set_pauseparam(mac->phylink, pause);
+}
+
 static u16 mtk_select_queue(struct net_device *dev, struct sk_buff *skb,
 			    struct net_device *sb_dev)
 {
@@ -4492,8 +4506,10 @@ static const struct ethtool_ops mtk_ethtool_ops = {
 	.get_strings		= mtk_get_strings,
 	.get_sset_count		= mtk_get_sset_count,
 	.get_ethtool_stats	= mtk_get_ethtool_stats,
+	.get_pauseparam		= mtk_get_pauseparam,
+	.set_pauseparam		= mtk_set_pauseparam,
 	.get_rxnfc		= mtk_get_rxnfc,
-	.set_rxnfc              = mtk_set_rxnfc,
+	.set_rxnfc		= mtk_set_rxnfc,
 };
 
 static const struct net_device_ops mtk_netdev_ops = {
-- 
2.45.2

