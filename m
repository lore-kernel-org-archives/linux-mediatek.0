Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F30E77197
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 15:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EZ6gCF9Xs1wyIlL4qZQGrdpwvHi9FsSNpKv+lE6EdZ4=; b=Ww5xNwXje+TuRw1ex80yhLU3LA
	BOxMq+D4ayVpwfT7S+AnT4X5Q6EGBwF72JMirPyrs7zpevT9ozY7I4bipPgsvGIOLCvVIOHp0O6Hp
	hYz4PV60cBSBdYHo2M5lML+N6uXEsWVkSJXTIPXEnV3QT7E1SJvp1XZEOBKSHLjCTdl8mtgwG0HwG
	qSW50t8IqFOpK2HWh3JM3CeYBtCHvUsTPyD/ilMMog2ErSA7P6xqFfwlCj8foc+qBe0u8JQD+e/2X
	c9enm1Wteun5l2WYMLUWJsoHC2paOWkS5x5zz7f/rwoO8uxOomKC6r/pL9HO7rAqMUj0t3usUQTPd
	hPVfwgiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuMM-0000000CS7z-3jfJ;
	Thu, 09 Jan 2025 15:22:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuGm-0000000CQfI-0jTu;
	Thu, 09 Jan 2025 15:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EZ6gCF9Xs1wyIlL4qZQGrdpwvHi9FsSNpKv+lE6EdZ4=; b=qfnUm3qeth9MD0rOWovR0a540h
	uL7+pPROrsHAt8D8OHaDu2UAXt3l2ueM8ZaZ7M9gayl80lPcqnV3NtcXKSF7YZiuKpHB2Xth7k3JN
	AGPgDdPLr8+5zn/MEt/MD7ZyU4mZfJHOUoMvY22E0QOOgghYcBBPjFP5DegHf/JEk3vBhSXXRzfve
	1Ak6Oz08uRrAX2N2mm8n3aTQTwbxOq1Xf5S2QD022Yn8t9ykMUciKNmxwLGwIBobMxWkZ16+VlcwU
	6G/e7PULxzwACC7Ht2taIDI5ojAmVmvPAOl1KX24pqid/CUgDItw+GQQOlhQvmTOd7OcOToyDzZUU
	1Y/6W0kw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47882 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVuGG-0002Dw-2c;
	Thu, 09 Jan 2025 15:15:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVuFw-000BXi-OZ; Thu, 09 Jan 2025 15:15:32 +0000
In-Reply-To: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
References: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexander Couzens <lynxis@fe80.eu>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Ar__n__ __NAL" <arinc.unal@arinc9.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Golle <daniel@makrotopia.org>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	kernel-team@meta.com,
	Lars Povlsen <lars.povlsen@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	netdev@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Sean Anderson <sean.anderson@seco.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <olteanv@gmail.com>,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH net-next 4/5] net: phylink: use neg_mode in
 phylink_mii_c22_pcs_decode_state()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVuFw-000BXi-OZ@rmk-PC.armlinux.org.uk>
Date: Thu, 09 Jan 2025 15:15:32 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_071624_213307_AD6FD59E 
X-CRM114-Status: GOOD (  12.52  )
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

Rather than using the state of the Autoneg bit, which is unreliable
with the new PCS neg mode support, use the passed neg_mode to decide
whether to decode the link partner advertisement data.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 99737bb6d1c7..5174c22e2091 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3877,11 +3877,15 @@ void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
 {
 	state->link = !!(bmsr & BMSR_LSTATUS);
 	state->an_complete = !!(bmsr & BMSR_ANEGCOMPLETE);
-	/* If there is no link or autonegotiation is disabled, the LP advertisement
-	 * data is not meaningful, so don't go any further.
+
+	/* If the link is down, the advertisement data is undefined. */
+	if (!state->link)
+		return;
+
+	/* If in-band is disabled, then the advertisement data is not
+	 * meaningful.
 	 */
-	if (!state->link || !linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
-					       state->advertising))
+	if (neg_mode != PHYLINK_PCS_NEG_INBAND_ENABLED)
 		return;
 
 	switch (state->interface) {
-- 
2.30.2


