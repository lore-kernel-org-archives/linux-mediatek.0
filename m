Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E6A2E77197
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 15:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xzWHY7CCln9l/THG/P2Qq643Grj7kUnbBQsLpWiTZM=; b=JBJYaO2z0r19/upvWMu6/6wbKl
	vCKNv0sSTcJEDYmG2XclAc9iYzvdY0UKa+tt7ormMXkHF1+3aV53KDnQdSQQOHuIpTNeVsBBFp9zN
	BHLielYhxWM05mcbC27a908TCbS4hUX+Z5agtmO4EXd1+EscCNNy+fxjcbR6P5eoZVMNzFr81vZ1L
	jPBPaG/cPlBZq/LNAepCc8XszDYQAkFdH0gbOrahLykfA3dsD1DkodfpjhafmQfMCIyyeLq+8Ydym
	/VW5XLk0ZYxFIYD3b4EoW+roINLsZIkvbH+wC9OdrrHuc3Dq4M9Q6FoPfLMqWyf93LpIHkhUCp7Kd
	EhZ056qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuNY-0000000CSVx-4Az3;
	Thu, 09 Jan 2025 15:23:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuGq-0000000CQft-1nfX;
	Thu, 09 Jan 2025 15:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5xzWHY7CCln9l/THG/P2Qq643Grj7kUnbBQsLpWiTZM=; b=lja7CoXJcshFjyTvCXDsLzzcv4
	EPHfppnHRakqRMypQzy/m0zVfZCnzfnNkKmQ/e68bvk0Kxa1SoasnjS4CaHCMcdGyQYppWVPjT8Wf
	FcjA9oXj9EDjz24tAVvmoYTvLHR+RmbT+LCSgmhSu2Hv6p1bxRYtdYaDCpW17T/odhTfP6ySsC2C6
	fcW+/eQEa1yTPxHpeldlwk7yRNHzIc+6cHpqQv2Ex1Zm2R3Bynafgb1nZvjn7R8W2xLS+6WKbvd6v
	1Ti5xcKXPX8PhcV+lg0GXoZLN8tDozIN6DvoAZqneokrVBFj2GhNaDPZS20BKxdK1NBHT0BiQx+nX
	KOxIIxsQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47886 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tVuGO-0002EH-0g;
	Thu, 09 Jan 2025 15:16:00 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tVuG1-000BXo-S7; Thu, 09 Jan 2025 15:15:37 +0000
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
Subject: [PATCH net-next 5/5] net: phylink: provide fixed state for 1000base-X
 and 2500base-X
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tVuG1-000BXo-S7@rmk-PC.armlinux.org.uk>
Date: Thu, 09 Jan 2025 15:15:37 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_071628_464756_6D98D3B3 
X-CRM114-Status: GOOD (  11.95  )
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

When decoding clause 22 state, if in-band is disabled and using either
1000base-X or 2500base-X, rather than reporting link-down, we know the
speed, and we only support full duplex. Pause modes taken from XPCS.

This fixes a problem reported by Eric Woudstra.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 5174c22e2091..0ae96d1376b4 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -3882,27 +3882,36 @@ void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
 	if (!state->link)
 		return;
 
-	/* If in-band is disabled, then the advertisement data is not
-	 * meaningful.
-	 */
-	if (neg_mode != PHYLINK_PCS_NEG_INBAND_ENABLED)
-		return;
-
 	switch (state->interface) {
 	case PHY_INTERFACE_MODE_1000BASEX:
-		phylink_decode_c37_word(state, lpa, SPEED_1000);
+		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
+			phylink_decode_c37_word(state, lpa, SPEED_1000);
+		} else {
+			state->speed = SPEED_1000;
+			state->duplex = DUPLEX_FULL;
+			state->pause |= MLO_PAUSE_TX | MLO_PAUSE_RX;
+		}
 		break;
 
 	case PHY_INTERFACE_MODE_2500BASEX:
-		phylink_decode_c37_word(state, lpa, SPEED_2500);
+		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
+			phylink_decode_c37_word(state, lpa, SPEED_2500);
+		} else {
+			state->speed = SPEED_2500;
+			state->duplex = DUPLEX_FULL;
+			state->pause |= MLO_PAUSE_TX | MLO_PAUSE_RX;
+		}
 		break;
 
 	case PHY_INTERFACE_MODE_SGMII:
 	case PHY_INTERFACE_MODE_QSGMII:
-		phylink_decode_sgmii_word(state, lpa);
+		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
+			phylink_decode_sgmii_word(state, lpa);
 		break;
+
 	case PHY_INTERFACE_MODE_QUSGMII:
-		phylink_decode_usgmii_word(state, lpa);
+		if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
+			phylink_decode_usgmii_word(state, lpa);
 		break;
 
 	default:
-- 
2.30.2


