Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 11:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5iTdVZukBPbJZ6uQDv8b4eQPLTAORFDa97MQJBKtepA=; b=w39e3A0htZvG4S
	AMKzSTTl8TQxZDiv7hZT06qR7acxW4strJ0Dww5X2ahbv9sb1+eN0PKt2ggcgzgZMp1dW4zZC5r4L
	aw60L7Uf53fFlFA4rV0j/tXJ/yV55ZTPtF7UgcRpGtB7l2so0UqyuiawWBuFZnKEQa0FaEM3Opo6p
	6K2oLrhMXGH9UWzNxzIhhXQYWxe5T65eJu7RHyH2JbXpH8tsw+N7kmvkvwV6h+xJ3l0FJyJD2/6Ux
	idi6oZjYC7Wq3SDGnHYZzSxOWVNoLGk07T0XC/MwXsxEG+773ZSDOWojY+M366ctXnUn5+IFboev5
	jRR3a3Q/wTxh00rvMmMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMq5v-00Dxsh-NX; Wed, 23 Feb 2022 11:46:07 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMpvC-00DtrN-Vl; Wed, 23 Feb 2022 11:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jdJjA+qisvEvVI/fYUTerhPkNAK7MCVTlHdItUfeV+4=; b=p/BK2ygTwUFtXN2Jp/Fh8HcNwi
 yUzgYFL+T78OS+oInyiePPCGxrjQ9FvgFLgAq4/PomCvxWbC2YvoNIUegtmfv4DmOUYaxpTEU2waY
 9SBCQtXggLG4qKu2laeR+C5fn589MsnWu6H2I2SqpV9qduxxCgy2eg8pvRP5RrwwSGS0NT0PHfpKa
 sF3kquKoBOw1kD9isklpuTdF2IpLalmovQtw5As5vbbsOa7sV/mTxdpZrk0orSxyA97Zd+Q3JykKw
 lcxOazXUKirQ+Trpip+ZK5dsO8nvT6zzNH2tCqqZQ6cwdO0LVA0KUJ1qvh4TDkq0QR6DScF/kxBMZ
 SdnMmlEw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57392 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nMpv8-0002ks-Uc; Wed, 23 Feb 2022 11:34:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nMpv8-00AJpI-B7; Wed, 23 Feb 2022 11:34:58 +0000
In-Reply-To: <YhYbpNsFROcSe4z+@shell.armlinux.org.uk>
References: <YhYbpNsFROcSe4z+@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next v2 09/10] net: dsa: mt7530: move autoneg handling
 to PCS validation
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nMpv8-00AJpI-B7@rmk-PC.armlinux.org.uk>
Date: Wed, 23 Feb 2022 11:34:58 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_033503_097411_E34C97AB 
X-CRM114-Status: GOOD (  13.83  )
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

Move the autoneg bit handling to the PCS validation, which allows us to
get rid of mt753x_phylink_validate() and rely on the default
phylink_generic_validate() implementation for the MAC side.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mt7530.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index e8c2f26cd5f0..951381008713 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2895,25 +2895,16 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 	priv->info->mac_port_get_caps(ds, port, config);
 }
 
-static void
-mt753x_phylink_validate(struct dsa_switch *ds, int port,
-			unsigned long *supported,
-			struct phylink_link_state *state)
+static int mt753x_pcs_validate(struct phylink_pcs *pcs,
+			       unsigned long *supported,
+			       const struct phylink_link_state *state)
 {
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(mask) = { 0, };
-	u32 caps;
-
-	caps = dsa_to_port(ds, port)->pl_config.mac_capabilities;
-
-	phylink_set_port_modes(mask);
-	phylink_get_linkmodes(mask, state->interface, caps);
+	/* Autonegotiation is not supported in TRGMII nor 802.3z modes */
+	if (state->interface == PHY_INTERFACE_MODE_TRGMII ||
+	    phy_interface_mode_is_8023z(state->interface))
+		phylink_clear(supported, Autoneg);
 
-	if (state->interface != PHY_INTERFACE_MODE_TRGMII &&
-	    !phy_interface_mode_is_8023z(state->interface))
-		phylink_set(mask, Autoneg);
-
-	linkmode_and(supported, supported, mask);
-	linkmode_and(state->advertising, state->advertising, mask);
+	return 0;
 }
 
 static void mt7530_pcs_get_state(struct phylink_pcs *pcs,
@@ -3015,12 +3006,14 @@ static void mt7530_pcs_an_restart(struct phylink_pcs *pcs)
 }
 
 static const struct phylink_pcs_ops mt7530_pcs_ops = {
+	.pcs_validate = mt753x_pcs_validate,
 	.pcs_get_state = mt7530_pcs_get_state,
 	.pcs_config = mt753x_pcs_config,
 	.pcs_an_restart = mt7530_pcs_an_restart,
 };
 
 static const struct phylink_pcs_ops mt7531_pcs_ops = {
+	.pcs_validate = mt753x_pcs_validate,
 	.pcs_get_state = mt7531_pcs_get_state,
 	.pcs_config = mt753x_pcs_config,
 	.pcs_an_restart = mt7531_pcs_an_restart,
@@ -3112,7 +3105,6 @@ static const struct dsa_switch_ops mt7530_switch_ops = {
 	.port_mirror_add	= mt753x_port_mirror_add,
 	.port_mirror_del	= mt753x_port_mirror_del,
 	.phylink_get_caps	= mt753x_phylink_get_caps,
-	.phylink_validate	= mt753x_phylink_validate,
 	.phylink_mac_select_pcs	= mt753x_phylink_mac_select_pcs,
 	.phylink_mac_config	= mt753x_phylink_mac_config,
 	.phylink_mac_link_down	= mt753x_phylink_mac_link_down,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
