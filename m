Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1237C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 11:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mom7o/f9QfUEhRpnN5BeXOTWeMZoW2pjLw7nSw4jpwQ=; b=hFT61buZOqY6WjOPf8b/SuGwcQ
	IAxIYtDLJstBPmXpo5RJfR8S8pZkpv3UbWSZVcgQqEen3g/fKWB5MKZv91p73hXz1cbYHfC4E8vWI
	e1wvhQlKAMP3qpUC03JGGfE8ieUQ7Ph9E+LI02eFdQtjt0Zi8VRQXTMejojWq6Mme7SD4aeqe6885
	agCpeixsGKa1VBdk6sy+lajU8jAqn6+7cIOfzb31wwETVLp8CesvCGUp6SYJxC+IADueRejc3b3zc
	xDg1u6Xp3tyvbIL3fNner8l3pdSCvK1FpLNI9X74Y7N3q76uQDuGOrBRXE+ABr7bqZmD7pf9l44Qj
	iiHEgTjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hiJ-001yDj-Dg; Fri, 24 Jun 2022 11:43:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hhV-001xrb-NQ; Fri, 24 Jun 2022 11:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Mom7o/f9QfUEhRpnN5BeXOTWeMZoW2pjLw7nSw4jpwQ=; b=UucE+5dYeih24j57SgmFer6I0I
	ODbuduJirJQA5WHv1SrzcjDqr/oAL/uGgw1bG7txre9fUYQDzijH5j2rNj8pszFDd3bDz08gAGtP3
	FRE79NyQPAvKpVQ18fDk9h24YFtLt6AkBOK3lGob3NZRKBmD0ShJxnSU65uKkZSNbQX6dphgXTaMT
	zAd++MjvT0r3SDUJPlZMaWvrn4wj/AwL+dI3R7eofG7ITBVGd0IUlphoCuKCFh33xJFkvrawcXevt
	VTg8vloluuZ3i/6K8dvzwcyA6HJKwRMptH6TXqFuVZCyPbums3NCIJT7Uc1TPBvqJJ1L+QPQ0AqgH
	VPvXseRQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:41614 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1o4hhN-0005sJ-2Z; Fri, 24 Jun 2022 12:42:05 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1o4hhM-004Aoy-Df; Fri, 24 Jun 2022 12:42:04 +0100
In-Reply-To: <YrWi5oBFn7vR15BH@shell.armlinux.org.uk>
References: <YrWi5oBFn7vR15BH@shell.armlinux.org.uk>
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
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH RFC net-next 3/4] net: phylink: add
 phylink_set_max_fixed_link()
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1o4hhM-004Aoy-Df@rmk-PC.armlinux.org.uk>
Date: Fri, 24 Jun 2022 12:42:04 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_044213_830428_68BDED23 
X-CRM114-Status: GOOD (  20.54  )
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

Add a function for DSA to use to configure phylink, in the absence of
any other configuration, to a fixed link operating at the maximum
supported link speed.

This is needed so we can support phylink usage on CPU and DSA ports.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 83 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 +
 2 files changed, 85 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e20cdab824db..bd9f09cfc281 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1317,6 +1317,89 @@ void phylink_destroy(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
 
+static struct {
+	unsigned long fd_mask;
+	unsigned long hd_mask;
+	int speed;
+} phylink_caps_speeds[] = {
+	{ MAC_400000FD, 0,          SPEED_400000 },
+	{ MAC_200000FD, 0,          SPEED_200000 },
+	{ MAC_100000FD, 0,          SPEED_100000 },
+	{ MAC_56000FD,  0,          SPEED_56000  },
+	{ MAC_50000FD,  0,          SPEED_50000  },
+	{ MAC_40000FD,  0,          SPEED_40000  },
+	{ MAC_25000FD,  0,          SPEED_40000  },
+	{ MAC_20000FD,  0,          SPEED_20000  },
+	{ MAC_10000FD,  0,          SPEED_10000  },
+	{ MAC_5000FD,   0,          SPEED_5000   },
+	{ MAC_2500FD,   0,          SPEED_2500   },
+	{ MAC_1000FD,   MAC_1000HD, SPEED_1000   },
+	{ MAC_100FD,    MAC_100HD,  SPEED_100    },
+	{ MAC_10FD,     MAC_10HD,   SPEED_10     },
+};
+
+/**
+ * phylink_set_max_fixed_link() - set a fixed link configuration for phylink
+ * @pl: a pointer to a &struct phylink returned from phylink_create()
+ *
+ * Set a maximum speed fixed-link configuration for the chosen interface
+ * mode and MAC capabilities for the phylink instance. Only valid for use
+ * immediately after creation. Must not be used at any other time.
+ *
+ * The user must have initialised mac_capabilities and set a valid interface.
+ */
+int phylink_set_max_fixed_link(struct phylink *pl)
+{
+	unsigned long caps;
+	int speed, duplex;
+	int i;
+
+	/* If we are not in PHY mode, or have a PHY, or have a SFP bus,
+	 * then we must not default to a fixed link.
+	 */
+	if (pl->cfg_link_an_mode != MLO_AN_PHY || pl->phydev || pl->sfp_bus)
+		return -EBUSY;
+
+	/* Get the speed/duplex capabilities and reduce according to the
+	 * interface mode.
+	 */
+	caps = pl->config->mac_capabilities;
+	caps &= ~(MAC_SYM_PAUSE | MAC_ASYM_PAUSE);
+	caps &= phylink_interface_to_caps(pl->link_config.interface);
+
+	/* If there are no capabilities, then we are not using this default. */
+	if (!caps)
+		return -EINVAL;
+
+	/* Decode to fastest speed and duplex */
+	duplex = DUPLEX_UNKNOWN;
+	speed = SPEED_UNKNOWN;
+	for (i = 0; i < ARRAY_SIZE(phylink_caps_speeds); i++) {
+		if (caps & phylink_caps_speeds[i].fd_mask) {
+			duplex = DUPLEX_FULL;
+			speed = phylink_caps_speeds[i].speed;
+			break;
+		} else if (caps & phylink_caps_speeds[i].hd_mask) {
+			duplex = DUPLEX_HALF;
+			speed = phylink_caps_speeds[i].speed;
+			break;
+		}
+	}
+
+	/* If we didn't find anything, bail. */
+	if (speed == SPEED_UNKNOWN)
+		return -EINVAL;
+
+	pl->link_config.speed = speed;
+	pl->link_config.duplex = duplex;
+	pl->link_config.link = 1;
+	pl->cfg_link_an_mode = MLO_AN_FIXED;
+	pl->cur_link_an_mode = MLO_AN_FIXED;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(phylink_set_max_fixed_link);
+
 static void phylink_phy_change(struct phy_device *phydev, bool up)
 {
 	struct phylink *pl = phydev->phylink;
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 6d06896fc20d..145fec38ad90 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -529,6 +529,8 @@ struct phylink *phylink_create(struct phylink_config *, struct fwnode_handle *,
 			       const struct phylink_mac_ops *mac_ops);
 void phylink_destroy(struct phylink *);
 
+int phylink_set_max_fixed_link(struct phylink *pl);
+
 int phylink_connect_phy(struct phylink *, struct phy_device *);
 int phylink_of_phy_connect(struct phylink *, struct device_node *, u32 flags);
 int phylink_fwnode_phy_connect(struct phylink *pl,
-- 
2.30.2


