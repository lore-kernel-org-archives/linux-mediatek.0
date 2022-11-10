Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B9EC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 21:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+eftt8l6Bnn209SyArb1oaE+v3tXc1RSpc0VaS+BPM=; b=MGk4OR5oaqWmylwGIcIgUfj0Zq
	O3yev/L8E8mw/irR1bTsHOzHyF6KC74TqnH+cr48fz4ikCOzgj1GddVNNX6NRmFgx3zQtLtASbI6k
	y6UckPVGIczJXq3lKVhWCPJnbMlGB3L2gIhk5DDKe5ifvMdCnPMssKAd6iduFlbqazU1msi8clZoY
	3o0bGtrZmJJIvUB6h3QZUG9iOyxEHIVILKV/9Jh+s/11SNlDZnqeMfrRQ3D5/hR1i94DlsA97WjPa
	TF27lr0jt1IxB4RlpFWKaj4G2zx1kzIJxs54Y+Q/mFBPPW6imbBtW5OD+1u5nqLnYB3N9saMtKO0C
	qmUJ1lMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otF0b-00ARbi-Iy; Thu, 10 Nov 2022 21:22:49 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otF0G-00ARUY-4l; Thu, 10 Nov 2022 21:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=H+eftt8l6Bnn209SyArb1oaE+v3tXc1RSpc0VaS+BPM=; b=Vg+Gz68dE57MbwQ0dhLtvumyDd
	ebGhYqxGEYqPJc9VPH7VcB8yrCP9698BO09vSHRoFSQXakILrWTh1AhPptBbTOIAU8d6LVBRx8xXo
	WTF4SCk+QYjm+fSO/JB8zeqaXySy3qn4/fiXJoifG4z1COT5Z2Tw7M135I9pesKZomm0=;
Received: from p200300daa72ee10c199752172ce6dd7a.dip0.t-ipconnect.de ([2003:da:a72e:e10c:1997:5217:2ce6:dd7a] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1otF05-0011Om-4w; Thu, 10 Nov 2022 22:22:17 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 3/4] net: ethernet: mtk_eth_soc: add support for configuring vlan rx offload
Date: Thu, 10 Nov 2022 22:22:10 +0100
Message-Id: <20221110212212.96825-4-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221110212212.96825-1-nbd@nbd.name>
References: <20221110212212.96825-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_132228_197545_C5D50DEB 
X-CRM114-Status: GOOD (  15.07  )
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

Keep the vlan rx offload feature in sync across all netdevs belonging to the
device, since the feature is global and can't be turned off per MAC

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 25 ++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 891dd6937f89..a118c715b09b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2724,15 +2724,30 @@ static netdev_features_t mtk_fix_features(struct net_device *dev,
 
 static int mtk_set_features(struct net_device *dev, netdev_features_t features)
 {
-	int err = 0;
+	struct mtk_mac *mac = netdev_priv(dev);
+	struct mtk_eth *eth = mac->hw;
+	netdev_features_t diff = dev->features ^ features;
+	int i;
 
-	if (!((dev->features ^ features) & NETIF_F_LRO))
+	if ((diff & NETIF_F_LRO) && !(features & NETIF_F_LRO))
+		mtk_hwlro_netdev_disable(dev);
+
+	/* Set RX VLAN offloading */
+	if (!(diff & NETIF_F_HW_VLAN_CTAG_RX))
 		return 0;
 
-	if (!(features & NETIF_F_LRO))
-		mtk_hwlro_netdev_disable(dev);
+	mtk_w32(eth, !!(features & NETIF_F_HW_VLAN_CTAG_RX),
+		MTK_CDMP_EG_CTRL);
 
-	return err;
+	/* sync features with other MAC */
+	for (i = 0; i < MTK_MAC_COUNT; i++) {
+		if (!eth->netdev[i] || eth->netdev[i] == dev)
+			continue;
+		eth->netdev[i]->features &= ~NETIF_F_HW_VLAN_CTAG_RX;
+		eth->netdev[i]->features |= features & NETIF_F_HW_VLAN_CTAG_RX;
+	}
+
+	return 0;
 }
 
 /* wait for DMA to finish whatever it is doing before we start using it again */
-- 
2.38.1


