Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE026C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 12:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIhFn78LcUCgsrVrNcFAERW+GWx7gO9OZl4IQGexLgo=; b=dCETFfuQEukpDD
	MYrwXKVPVYlGcxLvBzmRSp2jNG2MsKOHke8G14fjwJIHC+ySSFjkCxxw1ZfkTtrLZfXQhyG3VGgqm
	H9R/VtYixRdnKVLS+8D3qntuFBZe7Er/DMfG0hBe6DxuDYL+jsYJHWGdK9T0NFdcSAcNlXTXpyci7
	nLit2EdMfjXDSsh9WcwvpDz7J65Cb4spmDnYNwsUrn1xhWeg+B99Xp8kalNmtBa7zh3q9bo5vHO3b
	UguCwqPeJvM0crp5NGRkzL7KushFqMaug8ttLkXTGknXxU9m5UQu6t2+ORyBP2lj1j8ODPiITmCrK
	18THNBltWUhJyBhC5H+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4KVk-008Sih-0r;
	Sat, 18 Nov 2023 12:33:20 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4KVe-008SdH-3A;
	Sat, 18 Nov 2023 12:33:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28A98E0009;
	Sat, 18 Nov 2023 12:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1700310793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EIhFn78LcUCgsrVrNcFAERW+GWx7gO9OZl4IQGexLgo=;
	b=N/JVrIRDeCvEFtu/gWZJRnePW+fMp0pDdOQCeSKAzCmxXiRW09IGAYZ+9ykKbvn5CUybnZ
	hKUZxAJ5otc6OQpOa5kfH9AmxtsYh82vnWOvXVN6nelPu/LThotwP0D0f1NxPsZ1HjB65L
	DGuaY+vfYiVc11cKR+d3Xwu8XvE4UsU3Dum3K9vxsbRuQIrMY8h+OcJBkdIgbY1eeKYny7
	Mfr6YkKmXIzkT3riiKZWVAdU6BB22iXNS2nT79q/jg6jxaVdgT7AofTYAiPvvpS10xwTIf
	4uHRlplfymB2E9jtLmFxwsx0j8N39IItm73ZjyQ88YktiKaYL04awQ+AXMsDRA==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next 04/15] net: dsa: mt7530: improve comments regarding port 5 and 6
Date: Sat, 18 Nov 2023 15:31:54 +0300
Message-Id: <20231118123205.266819-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118123205.266819-1-arinc.unal@arinc9.com>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_043315_312865_C42D0611 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There's no logic to numerically order the CPU ports. State the port number
and its capability of being used as a CPU port instead.

Remove the irrelevant PHY muxing information from
mt7530_mac_port_get_caps(). Explain the supported MII modes instead.

Remove the out of place PHY muxing information from
mt753x_phylink_mac_config(). The function is for MT7530, MT7531, and the
switch on the MT7988 SoC but there's no PHY muxing on MT7531 or the switch
on the MT7988 SoC.

These comments were gradually introduced with the commits below.
ca366d6c889b ("net: dsa: mt7530: Convert to PHYLINK API")
38f790a80560 ("net: dsa: mt7530: Add support for port 5")
88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a new
hardware")
c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/mt7530.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 45c9698ad9dd..8623742b35ee 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2520,12 +2520,16 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
 				     struct phylink_config *config)
 {
 	switch (port) {
-	case 0 ... 4: /* Internal phy */
+	/* Internal PHY */
+	case 0 ... 4:
 		__set_bit(PHY_INTERFACE_MODE_GMII,
 			  config->supported_interfaces);
 		break;
 
-	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
+	/* Port 5 which can be used as a CPU port supports rgmii with delays,
+	 * mii, and gmii.
+	 */
+	case 5:
 		phy_interface_set_rgmii(config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_MII,
 			  config->supported_interfaces);
@@ -2533,7 +2537,8 @@ static void mt7530_mac_port_get_caps(struct dsa_switch *ds, int port,
 			  config->supported_interfaces);
 		break;
 
-	case 6: /* 1st cpu port */
+	/* Port 6 which can be used as a CPU port supports rgmii and trgmii. */
+	case 6:
 		__set_bit(PHY_INTERFACE_MODE_RGMII,
 			  config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_TRGMII,
@@ -2548,19 +2553,24 @@ static void mt7531_mac_port_get_caps(struct dsa_switch *ds, int port,
 	struct mt7530_priv *priv = ds->priv;
 
 	switch (port) {
-	case 0 ... 4: /* Internal phy */
+	/* Internal PHY */
+	case 0 ... 4:
 		__set_bit(PHY_INTERFACE_MODE_GMII,
 			  config->supported_interfaces);
 		break;
 
-	case 5: /* 2nd cpu port supports either rgmii or sgmii/8023z */
+	/* Port 5 which can be used as a CPU port supports rgmii with delays on
+	 * MT7531BE, sgmii/802.3z on MT7531AE.
+	 */
+	case 5:
 		if (!priv->p5_sgmii) {
 			phy_interface_set_rgmii(config->supported_interfaces);
 			break;
 		}
 		fallthrough;
 
-	case 6: /* 1st cpu port supports sgmii/8023z only */
+	/* Port 6 which can be used as a CPU port supports sgmii/802.3z. */
+	case 6:
 		__set_bit(PHY_INTERFACE_MODE_SGMII,
 			  config->supported_interfaces);
 		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
@@ -2579,11 +2589,13 @@ static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
 	phy_interface_zero(config->supported_interfaces);
 
 	switch (port) {
-	case 0 ... 4: /* Internal phy */
+	/* Internal PHY */
+	case 0 ... 4:
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
 		break;
 
+	/* Port 6 which can be used as a CPU port is an internal 10G port. */
 	case 6:
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  config->supported_interfaces);
@@ -2747,12 +2759,12 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 	u32 mcr_cur, mcr_new;
 
 	switch (port) {
-	case 0 ... 4: /* Internal phy */
+	case 0 ... 4:
 		if (state->interface != PHY_INTERFACE_MODE_GMII &&
 		    state->interface != PHY_INTERFACE_MODE_INTERNAL)
 			goto unsupported;
 		break;
-	case 5: /* 2nd cpu port with phy of port 0 or 4 / external phy */
+	case 5:
 		if (priv->p5_interface == state->interface)
 			break;
 
@@ -2762,7 +2774,7 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 		if (priv->p5_intf_sel != P5_DISABLED)
 			priv->p5_interface = state->interface;
 		break;
-	case 6: /* 1st cpu port */
+	case 6:
 		if (priv->p6_interface == state->interface)
 			break;
 
-- 
2.40.1


