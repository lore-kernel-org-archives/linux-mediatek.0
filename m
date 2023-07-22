Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EB2C001B0
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jul 2023 20:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8h5c4IGD+evHjEyWc3afvfJr4JlNQsLu1G4KhXqLYo=; b=G1UeJasBG2FmwTNksZVhB1gW8i
	dbppgLsNDpwDlFjs2Ddw95shoHlLxhnlbpDWQbFHWBs3Dj9ZEHscpNVPMSEaCCtZlPm+iks/Y9R8x
	2xUej5z2ZSNKIWPvz6OK/FqvONGsehTsPCpWw9r1OJUFiSyPNL1U0EvmHVfDKqcUaWQKEDTO3bpHL
	LrtU1aRM5V8HNKT0YIZ4sORvkgsAd7fXbrM65xWHpAt80vfOzIF2a1zGk1Muv5w5XhxWsng9L6JG5
	25n0Sgp/lw2XZKGWWNw3PQAJyepk/QayHKTTjxzvL9pRznrENo2v4GqvUQQgJ90COzt8ipFYTi9BS
	QXdZoIZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNJI3-00HGPf-2q;
	Sat, 22 Jul 2023 20:33:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNJHo-00HGIs-2G;
	Sat, 22 Jul 2023 20:33:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=e8h5c4IGD+evHjEyWc3afvfJr4JlNQsLu1G4KhXqLYo=; b=CL7huplgKHPVa9AOVqEOky8oKJ
	ts7DYxjI5eOQw7sKrRkdv+oJUBNYDXyE1RD0Z3599iZTZLg3B4cGtVvGGISB6XKgQRy2pGlBmKzWM
	3TbYCtAsoeOm4Acymc80Xck1KrEmorFKZPhIi8e+tVqEPqOsjPrCl21clWDcFrGiW4I9R2s8RVzFM
	iJofxdwsLHQa4Am1/VNZhroqVV4IIPTTXu/+GuRNbhk8vjSPTcLdCJlV+PN2bgjDmnDzZCdnD3+zm
	nXm9aqvNW/6fCmas/2Emaf0tOzp1WNHZO4A7F2aNYGho3f4Bjhvr/lGvqcaYM6YzXpQ6J1vAK4Fk5
	cOWPBTmA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51372 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qNJHl-00066r-0I;
	Sat, 22 Jul 2023 21:33:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qNJHl-000kFm-3K; Sat, 22 Jul 2023 21:33:05 +0100
In-Reply-To: <ZLw8DoRskRXLQK37@shell.armlinux.org.uk>
References: <ZLw8DoRskRXLQK37@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	 =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	 Frank Wunderlich <frank-w@public-files.de>,
	 David Woodhouse <dwmw@amazon.co.uk>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Felix Fietkau <nbd@nbd.name>,
	Jakub Kicinski <kuba@kernel.org>,
	John Crispin <john@phrozen.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH net-next v2 4/4] net: phylink: explicitly invalidate
 link_state members in mac_config
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qNJHl-000kFm-3K@rmk-PC.armlinux.org.uk>
Date: Sat, 22 Jul 2023 21:33:05 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_133308_737135_2455EAD6 
X-CRM114-Status: UNSURE (   9.94  )
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

Explicitly invalidate the phylink_link_state structure members in
mac_config that do not contain reliable information for this function,
thereby preventing their future incorrect use.

Reviewed-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index df413fb15088..4f1c8bb199e9 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1066,17 +1066,24 @@ static void phylink_pcs_poll_start(struct phylink *pl)
 static void phylink_mac_config(struct phylink *pl,
 			       const struct phylink_link_state *state)
 {
+	struct phylink_link_state st = *state;
+
+	/* Stop drivers incorrectly using these */
+	linkmode_zero(st.lp_advertising);
+	st.speed = SPEED_UNKNOWN;
+	st.duplex = DUPLEX_UNKNOWN;
+	st.an_complete = false;
+	st.link = false;
+
 	phylink_dbg(pl,
-		    "%s: mode=%s/%s/%s/%s/%s adv=%*pb pause=%02x link=%u\n",
+		    "%s: mode=%s/%s/%s adv=%*pb pause=%02x\n",
 		    __func__, phylink_an_mode_str(pl->cur_link_an_mode),
-		    phy_modes(state->interface),
-		    phy_speed_to_str(state->speed),
-		    phy_duplex_to_str(state->duplex),
-		    phy_rate_matching_to_str(state->rate_matching),
-		    __ETHTOOL_LINK_MODE_MASK_NBITS, state->advertising,
-		    state->pause, state->link);
-
-	pl->mac_ops->mac_config(pl->config, pl->cur_link_an_mode, state);
+		    phy_modes(st.interface),
+		    phy_rate_matching_to_str(st.rate_matching),
+		    __ETHTOOL_LINK_MODE_MASK_NBITS, st.advertising,
+		    st.pause);
+
+	pl->mac_ops->mac_config(pl->config, pl->cur_link_an_mode, &st);
 }
 
 static void phylink_pcs_an_restart(struct phylink *pl)
-- 
2.30.2


