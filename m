Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A3ECC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWK8sKKLFR+68SMkB5FGReiHrYFC6ByuHPtr0wPhHIU=; b=1i/jSCjpSYWxBcvolK3fOKtNWp
	VZSGLK44QqddyGvtUHXOIBEYUxnWzcnDhTfydeGRtc8WmCRWEXyprWVZ0FJFeNnHbCxpW1KthOgjN
	2i37Vp71HPTO333G7vKIFOm5ll8XdRN7ZWQdJuL7ysxQq/PAh5FPWImeeOFG4R+W3bJZM1akSuP8B
	Zce7X0t/JQo+4jILB27SNVdMzFHYaFHnUqwigr0nSNrnvLxI0ZZX5VZTHkViGWNHyQurssfGwfJ1Z
	bCX1LP0i4nJ/uvtI1SH1hE45Xp9gRcj0bVZ8ZbWakXI/3ZXBu2/4B01Be8kcPWlfIrj6PpRc66TsI
	258cmT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XBB-00Bxt7-3z; Wed, 29 Jun 2022 12:52:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XAQ-00BxXz-0c; Wed, 29 Jun 2022 12:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KWK8sKKLFR+68SMkB5FGReiHrYFC6ByuHPtr0wPhHIU=; b=tN6QLzrLD0PGySaj1xXFrRUHrE
	S5luWpg906s9a6dxoMT6V/eTdga40ErgDq+GWMpJq1u7ZXDimDavWTEp15UDL0rVkSlIfjUYP4Tnw
	1o5qYRq4n6QXy9XAxCS1GLv5TcC1M2EI1yTG5bEFlGscZh/klMHDCBFcw5DybKc9sfwPBtSJbCDkL
	xT/dpF0jpSASeA7D5Yj+DF3pKXVAZi7h4AlJ8+pFG/N0h1ASIwSdMuogin6MNip+XnJsXH+3nagd0
	e+L2/FUyN/GkZeMseoUKJJDZZWR0Dk+7nwGHqdnc1srM2rajZjYWmRxfm9uepg7pqGYbwCrOwLp8b
	DphyPHGw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35712 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1o6XAG-00036d-LJ; Wed, 29 Jun 2022 13:51:28 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1o6XAF-004pVi-Ue; Wed, 29 Jun 2022 13:51:27 +0100
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
Subject: [PATCH RFC net-next 2/6] net: dsa: mv88e6xxx: report the default
 interface mode for the port
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1o6XAF-004pVi-Ue@rmk-PC.armlinux.org.uk>
Date: Wed, 29 Jun 2022 13:51:27 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_055138_101823_0ED016A9 
X-CRM114-Status: GOOD (  12.60  )
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

Report the maximum speed interface mode for the port, or if we don't
have that information, the hardware configured interface mode for
the port.

This allows phylink to know which interface mode CPU and DSA ports
are operating, which will be necessary when we want to select the
maximum speed for the port (required for such ports without a PHY or
fixed-link specified in firmware.)

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/dsa/mv88e6xxx/chip.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index f98be98551ef..1c6b4b00d58d 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -823,6 +823,7 @@ static void mv88e6xxx_get_caps(struct dsa_switch *ds, int port,
 			       phy_interface_t *default_interface)
 {
 	struct mv88e6xxx_chip *chip = ds->priv;
+	u8 cmode = chip->ports[port].cmode;
 
 	chip->info->ops->phylink_get_caps(chip, port, config);
 
@@ -830,6 +831,14 @@ static void mv88e6xxx_get_caps(struct dsa_switch *ds, int port,
 	if (mv88e6xxx_phy_is_internal(ds, port))
 		__set_bit(PHY_INTERFACE_MODE_GMII,
 			  config->supported_interfaces);
+
+	if (chip->info->ops->port_max_speed_mode)
+		*default_interface = chip->info->ops->port_max_speed_mode(port);
+	else if (cmode < ARRAY_SIZE(mv88e6xxx_phy_interface_modes) &&
+		 mv88e6xxx_phy_interface_modes[cmode])
+		*default_interface = mv88e6xxx_phy_interface_modes[cmode];
+	else if (cmode == MV88E6XXX_PORT_STS_CMODE_RGMII)
+		*default_interface = PHY_INTERFACE_MODE_RGMII;
 }
 
 static void mv88e6xxx_mac_config(struct dsa_switch *ds, int port,
-- 
2.30.2


