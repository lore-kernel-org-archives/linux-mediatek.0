Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5023BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1DNoN9u2xL1p3Rey0z0c/jUxcmE45IoAt/8v1fAo6g=; b=AgwTzjRO2tSiMJ
	srkpoCqDBu0tsI19TsK26E4xEF7qsWbfDhCM3A01HRdf8m/tTbb/5YK+M/b5HEAscLuc7ungu1t+8
	W/KlJ3ax/AmCaqyWRUBURmi6zSOrqXkuINEXb0as/2OeQbAdvz62qpoK9r6m4Ar7tJoKhsz5EAtbg
	KiM3NMd/ELsjqVRcEAUrdsg89ILJhmnOtjU2FXHrncbfCVFXFLdGSrZq2dSlaMa+EoeeexiqLYIC5
	6YdGW+97U6sIUMZCqqWv1lH6toG3GOMV5lCtLbO+SyqiErk2KDejnoX+kiCTD7qn2St1/Jy4l91EC
	TU7zM8hknxeCMRAUv5rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6qY-006agF-Qq; Wed, 06 Apr 2022 14:41:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6lE-006Y3c-QR; Wed, 06 Apr 2022 14:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mJ/2y9TIn3Crwly17sB8UaPx0ccqqplirtTuhQuWO04=; b=CKe9js/NrB3cJqZ/HEiE98KS4v
 WlzXBjWszeWnpmsBsaFBbtqkBpefUK60kjI9/ih2ny9iM/4tFALSLCzObo7gsbgduak1lEZ4yhPUu
 awQj0cR3Qy/SubeyI1c3L8joOTXdxAWGvvx1XRbkj+RZksK3bjyrmNH4XOOaSkSGoXW8OYFblG+Mg
 aMi48ubTul3xD6g+igAxRaJw9epJ1HO7FxsJ5XopRBeiFu5dcuAxHrTVQoZunFqDDhYmjWJYIWkJr
 J09WeC07GagZQ3vu0zTePOgl2wkgT4f57ACS+A0fPAvFmz2i1A+nMwL05F/4GhuWwjWvTIqPO8cG1
 WDYID/xA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60682 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc6l8-0002wS-FJ; Wed, 06 Apr 2022 15:35:46 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc6l7-004ikW-JI; Wed, 06 Apr 2022 15:35:45 +0100
In-Reply-To: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
References: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next 10/12] net: mtk_eth_soc: move restoration of
 SYSCFG0 to mac_finish()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc6l7-004ikW-JI@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 15:35:45 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_073552_915234_63D0A9E7 
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
index 2ede1ccc538b..0db2341f399f 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -397,8 +397,8 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		if (err)
 			goto init_err;
 
-		regmap_update_bits(eth->ethsys, ETHSYS_SYSCFG0,
-				   SYSCFG0_SGMII_MASK, val);
+		/* Save the syscfg0 value for mac_finish */
+		mac->syscfg0 = val;
 	} else if (phylink_autoneg_inband(mode)) {
 		dev_err(eth->dev,
 			"In-band mode not supported in non SGMII mode!\n");
@@ -422,8 +422,15 @@ static int mtk_mac_finish(struct phylink_config *config, unsigned int mode,
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
index 4be779109cff..96f90e9fb9dd 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -991,6 +991,7 @@ struct mtk_mac {
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
