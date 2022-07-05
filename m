Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EA3C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 09:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FocghHSpG31FSN+93lmQ4D0g0ml1hV7sJysNbillTk8=; b=ezgMxPG4SJHkWHg7FHg174PRit
	vGhIt2UDcr/rtuuNXCSD6Eoio03TwxrV3nuyaH6cz5owYHnQcm0ZAijmvGpKuany7/xIYquDEMkZY
	XSyk7K9FK++cHrFVXuCXEeGpEGBZ2pR1anfmFPvFvu36uJHZqjGv56ClUpUJJzx0xKPg7h2BIYpOj
	e9w/QDRdQi8RCBt02wNF+B/uA9N53EM66EQrWpM7JlByTo9To8k2++yvmiHv1xD+Zdy6b/pvFFNnU
	4+n05hp7vMMOCUSkpepkL7LXPIEKcJnoKU6AiN6R6kZco1ieejC5aNCQcxGZfche1UxGDqD8WqyUp
	GZ1BVwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fBb-00GuvC-Eg; Tue, 05 Jul 2022 09:49:39 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fA9-00GtsS-RJ; Tue, 05 Jul 2022 09:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FocghHSpG31FSN+93lmQ4D0g0ml1hV7sJysNbillTk8=; b=D+8cLZuxmXO8DNfRHWMYLZNt+e
	pZcWIh5iDheekMwbfw1Y0zGQcq9fQLIVOUYE2zvcpLmVJQEOwtWvqspgNrsspknpXikORzaPQ/A6n
	oWi7hHZTLJX7r72egllwRPf2dEmJgR6pWOCCcevx6Y9oLxDeMc9F9AIxzjJiRyBUhJ1wf62fbIDWb
	HpNJBWZSFmd9Iyw0NqPG+IXvZ3mrIL3VSfs2leST/WYsECQfJS54WuFnk/MndMRmhWqvkwEx+oHb4
	sqxkzeaa3X3p2YSpkVtNTjKB3gufVWGDtjDwOmItIcNTQar3VnvDp7bF2fsC68/udndNYZGyOPvQm
	wEuNZCJA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60652 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1o8f9y-00013X-1l; Tue, 05 Jul 2022 10:47:58 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1o8f9x-0059aC-8S; Tue, 05 Jul 2022 10:47:57 +0100
In-Reply-To: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
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
Subject: [PATCH RFC net-next 3/5] net: phylink: split out interface to caps
 translation
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1o8f9x-0059aC-8S@rmk-PC.armlinux.org.uk>
Date: Tue, 05 Jul 2022 10:47:57 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_024809_954343_947F00CB 
X-CRM114-Status: GOOD (  12.83  )
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

Reviewed-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 48f0b9b39491..2069fc902e19 100644
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


