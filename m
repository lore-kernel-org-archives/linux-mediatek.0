Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2230EC54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykfQZOm+BASL1GRgngyr2+aX6xmiGeCmWuvPVEfYj38=; b=47SmrrWE3zPuS+eH9W6NEbDuB2
	c1D4dMSEdYmQdAJ9SnS766FlAg0HwOfzwIdSk50+byr9qnkoain83hz4E1WNCwwZxeCgv2XvtmvXX
	e/ZdH1DBBZQBmyWU9M6J4Y6znLxw/QjyQbnX5NhvQCcuvxktYGakd/eNHXEkj4hbhxcG1Thw2uMfj
	5pl9IEUaeu0V7nIdBiYzJ+NZsEMGx9tK0Sk/pEP7GTrUsKKruBij+uX9isagNXMGNUaP7b8MQYigw
	1KLA4Sjui16qJ49l3gBZrYAE0O78IfxNrXuaeI0cuo4c9sNME2dXI+2tBelaIkOfH05l56n4O8IH+
	unUei6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHP57-00ADwR-Gw; Mon, 16 Jan 2023 12:59:21 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHP1Y-00ACS6-0w; Mon, 16 Jan 2023 12:55:41 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id ACA07166C;
	Mon, 16 Jan 2023 13:55:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673873735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ykfQZOm+BASL1GRgngyr2+aX6xmiGeCmWuvPVEfYj38=;
	b=aA2u2Wx7ZKyQuxkNpuPYxgfMS5B+GnVIDNIN0zt/QCu4YlEArWbIuUj1GPucDXwmCAEf+Y
	LW64GMhF9PVSps9IXsahMzdwBBcHskaGdAVgCZTKTscquNL2binpZ0yUk4+SLET4biR23t
	9b2HL1qR6ZJkbDFjYIBmYsN4XKzBdPpldXAvm7QEE+Dv6Efv50hndXE0bMdf0heUf5AQKn
	QBqi1c6Lw709w3D78JQrXFIogAKBWkK/z4e+tRzY2OJmbh1VhZFidD3TWO21LWYEpAf9BC
	VI6DXXHhh1ej+LTrxSCDkupqF3eaOEpaT5m2s8PUTzkOCeD34Acd0db3+oRK9g==
From: Michael Walle <michael@walle.cc>
Date: Mon, 16 Jan 2023 13:55:13 +0100
Subject: [PATCH net-next 1/6] net: mdio: Move mdiobus_scan() within file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230116-net-next-remove-probe-capabilities-v1-1-5aa29738a023@walle.cc>
References:  <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
In-Reply-To:  <20230116-net-next-remove-probe-capabilities-v1-0-5aa29738a023@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 Andrew Lunn <andrew@lunn.ch>, Michael Walle <michael@walle.cc>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_045540_316141_43F91BB1 
X-CRM114-Status: GOOD (  17.39  )
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

From: Andrew Lunn <andrew@lunn.ch>

No functional change, just place it earlier in preparation for some
refactoring.

While at it, correct the comment format and one typo.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/phy/mdio_bus.c | 101 ++++++++++++++++++++++-----------------------
 1 file changed, 50 insertions(+), 51 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 902e1c88ef58..61c33c6098a1 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -506,6 +506,56 @@ static int mdiobus_create_device(struct mii_bus *bus,
 	return ret;
 }
 
+/**
+ * mdiobus_scan - scan a bus for MDIO devices.
+ * @bus: mii_bus to scan
+ * @addr: address on bus to scan
+ *
+ * This function scans the MDIO bus, looking for devices which can be
+ * identified using a vendor/product ID in registers 2 and 3. Not all
+ * MDIO devices have such registers, but PHY devices typically
+ * do. Hence this function assumes anything found is a PHY, or can be
+ * treated as a PHY. Other MDIO devices, such as switches, will
+ * probably not be found during the scan.
+ */
+struct phy_device *mdiobus_scan(struct mii_bus *bus, int addr)
+{
+	struct phy_device *phydev = ERR_PTR(-ENODEV);
+	int err;
+
+	switch (bus->probe_capabilities) {
+	case MDIOBUS_NO_CAP:
+	case MDIOBUS_C22:
+		phydev = get_phy_device(bus, addr, false);
+		break;
+	case MDIOBUS_C45:
+		phydev = get_phy_device(bus, addr, true);
+		break;
+	case MDIOBUS_C22_C45:
+		phydev = get_phy_device(bus, addr, false);
+		if (IS_ERR(phydev))
+			phydev = get_phy_device(bus, addr, true);
+		break;
+	}
+
+	if (IS_ERR(phydev))
+		return phydev;
+
+	/* For DT, see if the auto-probed phy has a corresponding child
+	 * in the bus node, and set the of_node pointer in this case.
+	 */
+	of_mdiobus_link_mdiodev(bus, &phydev->mdio);
+
+	err = phy_device_register(phydev);
+	if (err) {
+		phy_device_free(phydev);
+		return ERR_PTR(-ENODEV);
+	}
+
+	return phydev;
+}
+EXPORT_SYMBOL(mdiobus_scan);
+
 /**
  * __mdiobus_register - bring up all the PHYs on a given bus and attach them to bus
  * @bus: target mii_bus
@@ -679,57 +729,6 @@ void mdiobus_free(struct mii_bus *bus)
 }
 EXPORT_SYMBOL(mdiobus_free);
 
-/**
- * mdiobus_scan - scan a bus for MDIO devices.
- * @bus: mii_bus to scan
- * @addr: address on bus to scan
- *
- * This function scans the MDIO bus, looking for devices which can be
- * identified using a vendor/product ID in registers 2 and 3. Not all
- * MDIO devices have such registers, but PHY devices typically
- * do. Hence this function assumes anything found is a PHY, or can be
- * treated as a PHY. Other MDIO devices, such as switches, will
- * probably not be found during the scan.
- */
-struct phy_device *mdiobus_scan(struct mii_bus *bus, int addr)
-{
-	struct phy_device *phydev = ERR_PTR(-ENODEV);
-	int err;
-
-	switch (bus->probe_capabilities) {
-	case MDIOBUS_NO_CAP:
-	case MDIOBUS_C22:
-		phydev = get_phy_device(bus, addr, false);
-		break;
-	case MDIOBUS_C45:
-		phydev = get_phy_device(bus, addr, true);
-		break;
-	case MDIOBUS_C22_C45:
-		phydev = get_phy_device(bus, addr, false);
-		if (IS_ERR(phydev))
-			phydev = get_phy_device(bus, addr, true);
-		break;
-	}
-
-	if (IS_ERR(phydev))
-		return phydev;
-
-	/*
-	 * For DT, see if the auto-probed phy has a correspoding child
-	 * in the bus node, and set the of_node pointer in this case.
-	 */
-	of_mdiobus_link_mdiodev(bus, &phydev->mdio);
-
-	err = phy_device_register(phydev);
-	if (err) {
-		phy_device_free(phydev);
-		return ERR_PTR(-ENODEV);
-	}
-
-	return phydev;
-}
-EXPORT_SYMBOL(mdiobus_scan);
-
 static void mdiobus_stats_acct(struct mdio_bus_stats *stats, bool op, int ret)
 {
 	preempt_disable();

-- 
2.30.2

