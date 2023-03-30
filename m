Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ADEC761A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H1PiqDahVMuQBWSb8tvhlNIh1R4yNy8SiAjmiSdiPc8=; b=XjJpSuRrkOipGFIJzMeIe3EnCH
	tKXji5PHhOJMMiEAjMQdJoMXw7auZRPsqSBlAgl8HGzcGKHkKX4WN3uanX89/pwEC9R1yUo6l2f/R
	HbDi/zSrnT+vPzZKLnllkNpqZr7tnNN8bF+1a+89gwGMpONClmdYFfKMplVdmZ7Nuw9ZfG3nm6ZnT
	S/YVuRQdx3f6W12bDefUPhdBsl8jJhZ4qNMnNLaRR8HW3L8498mpYtFCCBf5kVTa33gYaNrCLSyBy
	Fquhr+wD6cRGvyWfenB/RTHG6cSWCULrrfKd0WGhOEq10tu77w6YiyZb4knXh/OXj7VVxYTCajog+
	M8jhjpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phu7l-004Esc-15;
	Thu, 30 Mar 2023 15:23:37 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phu7f-004EpL-20;
	Thu, 30 Mar 2023 15:23:36 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1phu7e-0006kn-1H;
	Thu, 30 Mar 2023 17:23:30 +0200
Date: Thu, 30 Mar 2023 16:23:26 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
	=?utf-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Shih <Sam.Shih@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: [PATCH net-next 13/15] net: dsa: mt7530: add support for 10G link
 modes for CPU port
Message-ID: <89ef48606fdbe896705a57a65a85c22cae01936e.1680180959.git.daniel@makrotopia.org>
References: <cover.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680180959.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_082331_654967_8D16AF69 
X-CRM114-Status: GOOD (  12.10  )
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

The built-in switch of the MT7988 SoC is internally connected using
a stateless 10G link. Add support for 10G interface modes to silence
a warning otherwise occurring when the switch driver is setup.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3a4682e71e746..ac666da2d10dc 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2618,6 +2618,9 @@ mt7531_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
 	case PHY_INTERFACE_MODE_1000BASEX:
 	case PHY_INTERFACE_MODE_2500BASEX:
 		/* handled in SGMII PCS driver */
+	case PHY_INTERFACE_MODE_USXGMII:
+	case PHY_INTERFACE_MODE_10GKR:
+		/* internal stateless 10G link */
 		return 0;
 	default:
 		return -EINVAL;
@@ -2741,7 +2744,9 @@ static void mt753x_phylink_mac_link_up(struct dsa_switch *ds, int port,
 	 * variants.
 	 */
 	if (interface == PHY_INTERFACE_MODE_TRGMII ||
-	    (phy_interface_mode_is_8023z(interface))) {
+	    interface == PHY_INTERFACE_MODE_USXGMII ||
+	    interface == PHY_INTERFACE_MODE_10GKR ||
+	    phy_interface_mode_is_8023z(interface)) {
 		speed = SPEED_1000;
 		duplex = DUPLEX_FULL;
 	}
-- 
2.39.2


