Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED1AEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 11:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGSr0nArlfVl26hrcwMV/JaBpkbMJw8FXQVAi8Thplc=; b=kFq6KiDi5AVhu6JeBDNJCIwArE
	RhnLIJpnKsBNnF5ejolVIjx5FPmxYTBVYUm3cE5+yeUDjyLLQpA46wjECxuLx7J4aOacGttb+kTKw
	PhDIoNIbt+T3Jj4Q7eIST69cU1cGlUHATkon6tXHG55No7k3c2zHL8It2oSZIBA7Yus6SQYDyL6a4
	P1gBkIm6gtRwBLY4bSJzPwSKV/LoGr4Ndvzz/6wM4bcAHTbenxp/Kfrs+Or3oFpfOiUhk6ol4iK7h
	d52zGsr8e2A89IEXLq8suA4MyZ6Lu7qCi4XFnIWUTWsCmRR1mTzdECoRJUzai2nxnrYhg7k4elc2r
	YYOx7fAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoPG-00DwWi-1p;
	Fri, 21 Jul 2023 11:34:46 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMoP6-00DwSz-08;
	Fri, 21 Jul 2023 11:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bGSr0nArlfVl26hrcwMV/JaBpkbMJw8FXQVAi8Thplc=; b=t6B1EbJJ5x2fwKRiVxMPUs6VM9
	TAvxk9G6qsIqe+QO0eXZLsrB1K6htyjpKm9q4DOWYb71vPDVrtO0xokJ3WLRAXW7UYV8QHX+ltGVv
	VhwLUFn2Ut/zAoZXC6gW8jDnutM6MS9vUj0IKXHxLa50jTr2DQO0a6KnZ/md9o5zx6Ce/9f90p94y
	xtMJzV4Thhc9qo5qhPTXE55s4wHOe4IlQtquayRkvP2VEPttJcd5E8aFITdJ4YdDuXvE1tHH+CDcG
	lbTwjDqbs8YQ2UFPXTbhjRDTvVhMAD7Dz9yBua8obmKyG0Tc0yDK3hNOR+Dhd8xSOsOdAzj9o4Dif
	E6Gv99ug==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45364 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qMoP0-0003od-1F;
	Fri, 21 Jul 2023 12:34:30 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qMoP0-000hhX-BQ; Fri, 21 Jul 2023 12:34:30 +0100
In-Reply-To: <ZLptIKEb7qLY5LmS@shell.armlinux.org.uk>
References: <ZLptIKEb7qLY5LmS@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	 Ar__n__ __NAL <arinc.unal@arinc9.com>,
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
Subject: [PATCH net-next 4/4] net: phylink: explicitly invalidate link_state
 members in mac_config
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1qMoP0-000hhX-BQ@rmk-PC.armlinux.org.uk>
Date: Fri, 21 Jul 2023 12:34:30 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_043436_078405_D77CA815 
X-CRM114-Status: GOOD (  10.18  )
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


