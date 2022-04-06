Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A995EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D1j1tEDdp0GyzOFn1KqnJP4wbg9V7CBh53IPIyD7x/M=; b=AX+3moGk8YPCo/
	eJRvLG39b+pVpjGYdoRRNBqiwrC2SWM7+Xjd081iE/s3OFZAHT+SHzC2jzbz+DTgGayfrD8LKycnr
	uQGby1+VdHguWX+7YSLJOb+WwSY5+i1GOzpAMyT/1Q5j6/28nffunYA4cLXDGVEPADRgTOtgR3A73
	oi46c+06oeZqdMvqV7N8uTUUyQUB3JJ6LLC8XkD6LcUUEDpIetwcKv1aHuxTiJrrCNnc4TtiB/OzF
	bHAGjxS3KYopgfq84HT1rqPX7mKCxp7uhPO40Bbkb3Sd1SYNTNoHCKwrckbrycxLv9tjoxN8jIHuF
	Ggs1ggPM5Y3eJ0O5Kihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6nv-006ZPB-34; Wed, 06 Apr 2022 14:38:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6ku-006Xtp-Ea; Wed, 06 Apr 2022 14:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R926PzfjUYoA24VgpIYq2VzMgn3qO9GangkHxkFJif4=; b=WWvosuPOfDyD1qa4W377AX+7jI
 iDSQVSCozvzI4DiQEAqljJiE67qpAaXy7SkbzVlvZnD29lBlyrZpxejElg1Cx53QUs5b2E/JL0ngu
 gvckF1YQvm91sxAqWvfOSGpSE4mfAO2r3pGMQmgshBncMD357owCpQfqwCmL+vDnGyoovJyzTXIM3
 Q8eByHid7F9Jb7xib0RB8qoqxeCcg0RAXRDmg8ORYISNnL0nbh54Yi8FcA8zkATYpv6ZZevSawrrM
 HkauzIUWejBM1/r2dRNFpVkYHnGJPzX5PiwSBzxuIxjmehc7QUPWg7bS2TY3YCS+irrVzqUPhbWxG
 RRp0Kk9A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60674 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc6ko-0002vK-1t; Wed, 06 Apr 2022 15:35:25 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc6kn-004ik2-51; Wed, 06 Apr 2022 15:35:25 +0100
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
Subject: [PATCH RFC net-next 06/12] net: mtk_eth_soc: stop passing phylink
 state to sgmii setup
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc6kn-004ik2-51@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 15:35:25 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_073532_571693_AE1C3A2D 
X-CRM114-Status: GOOD (  12.28  )
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

Now that mtk_sgmii_setup_mode_force() only uses the interface mode
from the phylink state, pass just the interface mode into this
function.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 6fedfa8fceb1..7f29256b4b3c 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -387,7 +387,7 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
 		/* Setup SGMIISYS with the determined property */
 		if (state->interface != PHY_INTERFACE_MODE_SGMII)
 			err = mtk_sgmii_setup_mode_force(eth->sgmii, sid,
-							 state);
+							 state->interface);
 		else if (phylink_autoneg_inband(mode))
 			err = mtk_sgmii_setup_mode_an(eth->sgmii, sid);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 1912f84922c8..93f150bb09dd 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -1006,7 +1006,7 @@ int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *np,
 		   u32 ana_rgc3);
 int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id);
 int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
-			       const struct phylink_link_state *state);
+			       phy_interface_t interface);
 void mtk_sgmii_link_up(struct mtk_sgmii *ss, int id, int speed, int duplex);
 void mtk_sgmii_restart_an(struct mtk_eth *eth, int mac_id);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index a5ec61e13b85..b656c8b3ca35 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -64,7 +64,7 @@ int mtk_sgmii_setup_mode_an(struct mtk_sgmii *ss, int id)
  * fixed speed.
  */
 int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
-			       const struct phylink_link_state *state)
+			       phy_interface_t interface)
 {
 	unsigned int val;
 
@@ -73,7 +73,7 @@ int mtk_sgmii_setup_mode_force(struct mtk_sgmii *ss, int id,
 
 	regmap_read(ss->regmap[id], ss->ana_rgc3, &val);
 	val &= ~RG_PHY_SPEED_MASK;
-	if (state->interface == PHY_INTERFACE_MODE_2500BASEX)
+	if (interface == PHY_INTERFACE_MODE_2500BASEX)
 		val |= RG_PHY_SPEED_3_125G;
 	regmap_write(ss->regmap[id], ss->ana_rgc3, val);
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
