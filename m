Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7150C54EBE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 10:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7i9qbwSDlGkaEMAao/7IOBLlkWEf4kE9vsL/6dW7DOw=; b=FOOnTQ4wg0SPYLtZtMy67P77nC
	i73sOz0o29UcfSIJIJs358/UbFQasSqTnwqTNvl87NWsiGTCtkLky0RnYRzrlrECqyxofW96bMhsr
	IMWtPpA0tHo0rVIQz/MYeUx7TcS4ZxC38eOW3NKA0aa0nfiugT7K2kbLhpgXePcCoyscHXseLxBUS
	GM7Z76kSMuhXqP8PmaNtgGJgoYo4Q1l6Nb8n8PhN0bQFj9m7Ijqo54Sauo7fWIOT82hqrGCuZiP3X
	5R9rhA7MQjP2bPclJAO0eqd0XnOQ3saL1rZcsXBA3CfBzoYdYtkzsi1LITokG4M+6u6FeYDbV0tn1
	XyLOSing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI5Gg-000F8c-8k; Wed, 18 Jan 2023 10:02:06 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI5GS-000F3J-8U; Wed, 18 Jan 2023 10:01:53 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id CF3581671;
	Wed, 18 Jan 2023 11:01:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1674036106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7i9qbwSDlGkaEMAao/7IOBLlkWEf4kE9vsL/6dW7DOw=;
	b=sfpSS9Kjd9842sP40iyX+WvxgWIzof0diOjdpmoYAZE3RTcYKt2G38MkWRx4WLhkoRrVjX
	v/4fI/4AbkKptvvqLKhYqdYf9fC29BSzA89BeZWQLwEF3iYIXtFaSsn0aRvEeHUz/Vr67C
	CgefUeD6AcNz8oorpMrkwONDcoKdufbdmEbDonIsUeubP4W5+teBXU3A8Q1SzDKs9cIpvm
	TLplpA7l4ioD8wtn3Lz+RI3+7xCXSa3ednymkbTwHDjs37GP2fYgRKzpTkA1UbSrwLVzEo
	azg3IK2lO195nKysbe5d3R1dGqi+Rrnrkkt2qDss8UJKO9VFnpEB5I62KoZIqg==
From: Michael Walle <michael@walle.cc>
Date: Wed, 18 Jan 2023 11:01:37 +0100
Subject: [PATCH net-next v2 3/6] net: mdio: Add workaround for Micrel PHYs
 which are not C45 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230116-net-next-remove-probe-capabilities-v2-3-15513b05e1f4@walle.cc>
References:  <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
In-Reply-To:  <20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
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
 Andrew Lunn <andrew@lunn.ch>, Michael Walle <michael@walle.cc>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_020152_527581_D497E90B 
X-CRM114-Status: GOOD (  19.89  )
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

After scanning the bus for C22 devices, check if any Micrel PHYs have
been found.  They are known to do bad things if there are C45
transactions on the bus. Prevent the scanning of the bus using C45 if
such a PHY has been detected.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
v2:
 [mw] move variable declaration into the loop. Thanks, Jesse.
---
 drivers/net/phy/mdio_bus.c | 37 ++++++++++++++++++++++++++++++++++---
 include/linux/micrel_phy.h |  2 ++
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 667247f661c5..a664eeb1868d 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -19,6 +19,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/micrel_phy.h>
 #include <linux/mii.h>
 #include <linux/mm.h>
 #include <linux/module.h>
@@ -600,6 +601,32 @@ static int mdiobus_scan_bus_c45(struct mii_bus *bus)
 	return 0;
 }
 
+/* There are some C22 PHYs which do bad things when where is a C45
+ * transaction on the bus, like accepting a read themselves, and
+ * stomping over the true devices reply, to performing a write to
+ * themselves which was intended for another device. Now that C22
+ * devices have been found, see if any of them are bad for C45, and if we
+ * should skip the C45 scan.
+ */
+static bool mdiobus_prevent_c45_scan(struct mii_bus *bus)
+{
+	int i;
+
+	for (i = 0; i < PHY_MAX_ADDR; i++) {
+		struct phy_device *phydev;
+		u32 oui;
+
+		phydev = mdiobus_get_phy(bus, i);
+		if (!phydev)
+			continue;
+		oui = phydev->phy_id >> 10;
+
+		if (oui == MICREL_OUI)
+			return true;
+	}
+	return false;
+}
+
 /**
  * __mdiobus_register - bring up all the PHYs on a given bus and attach them to bus
  * @bus: target mii_bus
@@ -617,8 +644,9 @@ static int mdiobus_scan_bus_c45(struct mii_bus *bus)
 int __mdiobus_register(struct mii_bus *bus, struct module *owner)
 {
 	struct mdio_device *mdiodev;
-	int i, err;
 	struct gpio_desc *gpiod;
+	bool prevent_c45_scan;
+	int i, err;
 
 	if (!bus || !bus->name)
 		return -EINVAL;
@@ -691,8 +719,11 @@ int __mdiobus_register(struct mii_bus *bus, struct module *owner)
 			goto error;
 	}
 
-	if (bus->probe_capabilities == MDIOBUS_C45 ||
-	    bus->probe_capabilities == MDIOBUS_C22_C45) {
+	prevent_c45_scan = mdiobus_prevent_c45_scan(bus);
+
+	if (!prevent_c45_scan &&
+	    (bus->probe_capabilities == MDIOBUS_C45 ||
+	     bus->probe_capabilities == MDIOBUS_C22_C45)) {
 		err = mdiobus_scan_bus_c45(bus);
 		if (err)
 			goto error;
diff --git a/include/linux/micrel_phy.h b/include/linux/micrel_phy.h
index 1f7c33b2f5a3..771e050883db 100644
--- a/include/linux/micrel_phy.h
+++ b/include/linux/micrel_phy.h
@@ -8,6 +8,8 @@
 #ifndef _MICREL_PHY_H
 #define _MICREL_PHY_H
 
+#define MICREL_OUI		0x0885
+
 #define MICREL_PHY_ID_MASK	0x00fffff0
 
 #define PHY_ID_KSZ8873MLL	0x000e7237

-- 
2.30.2

