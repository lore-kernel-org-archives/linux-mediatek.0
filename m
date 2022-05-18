Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7C6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 14:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jeSJFeaehOoB7EeKxfLnJQzZA7c6ptg27HRnNbtRS6g=; b=Hg0wx53oSjCjgT
	Lb9h3iDIzlaakj7Lj2LHXwmL2OoJtZV9gJOaxoVJQfxoKWf00nQieKKSQ8tIwFm4wT4h/3NNN8Bl8
	hTF1LJ5N3t9xKQk//wmwO18TysKQ9NxJmev1ang2iknOebZrms8TppYXcFA4LK++IKq5E7Fmbjzft
	GDPWmfkgF/APW1AdxQnvGq0n62+zvRrpZYREVIJNmakXk4L042Akqce5cCiXuamGX8hfHpVxMF6F3
	Uclz+BlfmSPy4MNfnl+o/3gUQFHGhWIh/eQwKmTHwK7wsCbePA/1sGyJrA+4CGy62vhoOXtKWtl3/
	47QyuWdODCKMbxoBjPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrL8V-002f8X-UD; Wed, 18 May 2022 14:58:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrL57-002d11-Jn; Wed, 18 May 2022 14:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JQJfZSE9kledh/qBXxdYmqroe+XEFKxmmVfowX+wP4c=; b=MrZxYcYU+qewDWLhSICZfotgt5
 cvpwzKz6YyrUsQujcUw4PVKbanRrcQ8bqVvjL4AvKEK+X1W5Z3SxsHOAlKO1Y2eLnYDp9xxUA+P/4
 zpYYlCoD9ST0fenW5VtTXEtp7yvEVG5lnTeKPt0SlHVPz5CrgR88ZDBowwNB+ZN2Gop/mYzXNNO15
 GiIGvmAfy5F0embGoI3R2t7GdkMFNyhzXgsIBNA9MCAJiH8/AOZZ80okvTD9scZnOGslCN3U+SRFE
 ZLOnG0JWcWsZsC40hVKHcl97nv04sVsTkeH3T36tQsp/HCBoOZ2GMCXm+lc04EICqHFbEFzD4ABnr
 isuAIKPQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38628 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nrL53-0002Gb-UA; Wed, 18 May 2022 15:55:18 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nrL53-00AM5X-QI; Wed, 18 May 2022 15:55:17 +0100
In-Reply-To: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
References: <YoUIX+BN/ZbyXzTT@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Eric Dumazet <edumazet@google.com>
Subject: [PATCH net-next 10/12] net: mtk_eth_soc: move restoration of SYSCFG0
 to mac_finish()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nrL53-00AM5X-QI@rmk-PC.armlinux.org.uk>
Date: Wed, 18 May 2022 15:55:17 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_075521_733536_C03A360C 
X-CRM114-Status: GOOD (  14.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The SGMIISYS configuration is performed while ETHSYS_SYSCFG0 is in a
disabled state. In order to preserve this when we switch to phylink_pcs
we need to move the restoration of this register to the mac_finish()
callback.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 11 +++++++++--
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  1 +
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index d9947faa2cd3..6dca98de0067 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -400,8 +400,8 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		if (err)
 			goto init_err;
 
-		regmap_update_bits(eth->ethsys, ETHSYS_SYSCFG0,
-				   SYSCFG0_SGMII_MASK, val);
+		/* Save the syscfg0 value for mac_finish */
+		mac->syscfg0 = val;
 	} else if (phylink_autoneg_inband(mode)) {
 		dev_err(eth->dev,
 			"In-band mode not supported in non SGMII mode!\n");
@@ -425,8 +425,15 @@ static int mtk_mac_finish(struct phylink_config *config, unsigned int mode,
 {
 	struct mtk_mac *mac = container_of(config, struct mtk_mac,
 					   phylink_config);
+	struct mtk_eth *eth = mac->hw;
 	u32 mcr_cur, mcr_new;
 
+	/* Enable SGMII */
+	if (interface == PHY_INTERFACE_MODE_SGMII ||
+	    phy_interface_mode_is_8023z(interface))
+		regmap_update_bits(eth->ethsys, ETHSYS_SYSCFG0,
+				   SYSCFG0_SGMII_MASK, mac->syscfg0);
+
 	/* Setup gmac */
 	mcr_cur = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
 	mcr_new = mcr_cur;
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index fa3c085bf7ed..1ad5c26f01fb 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1001,6 +1001,7 @@ struct mtk_mac {
 	struct mtk_hw_stats		*hw_stats;
 	__be32				hwlro_ip[MTK_MAX_LRO_IP_CNT];
 	int				hwlro_ip_cnt;
+	unsigned int			syscfg0;
 };
 
 /* the struct describing the SoC. these are declared in the soc_xyz.c files */
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
