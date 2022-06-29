Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BBBC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 12:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/gSxSOzHHBxlOqahtkOa3/YcUPccov7AoowZlalpRg=; b=RCuy127lzL/cPOaW9QVXe9pAye
	EP1tq9Ov7gBsX0QJgLXu58DNPjCvpqRxGFy8yqnCdkb5jpb/Y30x6BMC2WYDalDhwe9OngNxlnCwt
	f5AJQ0WnoGSkqOnz3zmpWcDEK+O0fo34eAm3niJeSWvVZhwArgiyQd1sge7fIf2IcYXcHRggUnSLN
	ExxgH5SOUhdkoXQ3V0wLcXXdGt+pQI/8wSjBLzU0qtDraCaChs4icc4t7HM7IJhYM77qPrIcotnTw
	P6vuWHE94Ot/3uos00X210Dx0zdezjE9+H3TTvrFYFAq3pBjTrd4KD6H8PbcOalqXNmEcgHpakeDs
	m/XvMhIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XCE-00BySk-7J; Wed, 29 Jun 2022 12:53:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XAU-00BxaI-Qc; Wed, 29 Jun 2022 12:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z/gSxSOzHHBxlOqahtkOa3/YcUPccov7AoowZlalpRg=; b=d3vrouUEHl9aodzh9XPhR/1BWO
	4VwtputgpgOrKrdOZI2s6QmKt21G/s81WhQNHWUeU4aQSUia6c+C+ybv2fewT/hiS6Yy3L6CwGY8e
	muPsOA2yF7gvp0Q7yBqS7YbcZSoQwwsfeZb/kFggHQt9bIfF7Y/hvwtBajiZa/zQhFAEpMk7uI93z
	3wOSSM/lyuffJI3GVM86aHFxG3kCO8xEULA9FXHcs9tiErCT1PoRc/3VStrvvXpyTdfv6wue25Ctb
	zGI27tko7sSwk+5cM4oD1cGUgQbqwsPrXvqkAm2krH3zMY6WZW6jAxyLwjW3/KMHe9q+ERAxM1/2f
	CyWhdxhw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35714 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1o6XAL-00036w-Pu; Wed, 29 Jun 2022 13:51:33 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1o6XAL-004pVp-36; Wed, 29 Jun 2022 13:51:33 +0100
In-Reply-To: <YrxKdVmBzeMsVjsH@shell.armlinux.org.uk>
References: <YrxKdVmBzeMsVjsH@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Alvin __ipraga" <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: [PATCH RFC net-next 3/6] net: phylink: split out interface to caps
 translation
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1o6XAL-004pVp-36@rmk-PC.armlinux.org.uk>
Date: Wed, 29 Jun 2022 13:51:33 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_055142_941242_67D695D9 
X-CRM114-Status: GOOD (  12.76  )
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

phylink_get_linkmodes() translates the interface mode into a set of
speed and duplex capabilities which are masked with the MAC modes
to then derive the link modes that are available.

Split out the initial transformation into a new function
phylink_interface_to_caps(), which will be useful when setting the
maximum fixed link speed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 1a7550f5fdf5..4645ac6e553d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -296,18 +296,7 @@ static void phylink_caps_to_linkmodes(unsigned long *linkmodes,
 	}
 }
 
-/**
- * phylink_get_linkmodes() - get acceptable link modes
- * @linkmodes: ethtool linkmode mask (must be already initialised)
- * @interface: phy interface mode defined by &typedef phy_interface_t
- * @mac_capabilities: bitmask of MAC capabilities
- *
- * Set all possible pause, speed and duplex linkmodes in @linkmodes that
- * are supported by the @interface mode and @mac_capabilities. @linkmodes
- * must have been initialised previously.
- */
-void phylink_get_linkmodes(unsigned long *linkmodes, phy_interface_t interface,
-			   unsigned long mac_capabilities)
+static unsigned long phylink_interface_to_caps(phy_interface_t interface)
 {
 	unsigned long caps = MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
 
@@ -381,6 +370,24 @@ void phylink_get_linkmodes(unsigned long *linkmodes, phy_interface_t interface,
 		break;
 	}
 
+	return caps;
+}
+
+/**
+ * phylink_get_linkmodes() - get acceptable link modes
+ * @linkmodes: ethtool linkmode mask (must be already initialised)
+ * @interface: phy interface mode defined by &typedef phy_interface_t
+ * @mac_capabilities: bitmask of MAC capabilities
+ *
+ * Set all possible pause, speed and duplex linkmodes in @linkmodes that
+ * are supported by the @interface mode and @mac_capabilities. @linkmodes
+ * must have been initialised previously.
+ */
+void phylink_get_linkmodes(unsigned long *linkmodes, phy_interface_t interface,
+			   unsigned long mac_capabilities)
+{
+	unsigned long caps = phylink_interface_to_caps(interface);
+
 	phylink_caps_to_linkmodes(linkmodes, caps & mac_capabilities);
 }
 EXPORT_SYMBOL_GPL(phylink_get_linkmodes);
-- 
2.30.2


