Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C41C54EBC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 15:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGlMvwVE0XBFSe9hGJvTgj13A12QmBDoi6rAazqMrhA=; b=zdx6zqGv6JhaxFqIsCNpUer6fw
	BCbK8E/2rSq+rT7KKMtjLoaCaymQI2EjDTc79apDUIq3Q4r4MUuPzxytFJ6Zwn3Z1aMC5DJN7CsR9
	DU/r6oMXJdecHZ7tqgmk4RK2W1Rdb0dw2pK4Q8UeBnhlYBMq7K4IW2CE8473NXuncoVOCWd939fOc
	s2nciDVs4KybpPjj1b0JVvtlRkTzKdgcMaFQvbeq5qsNMpVDIp8pwdDgljHM0LnvpaTihT9snJJgH
	DQ8BaH8fTb2oQQpqII7L+9mGz3V7ctqVBpc8XVSh9CPp8EbFOnFFek8uU4TTTFKLjP35cEV5vr2E0
	2oH2XWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFzJb-00FYjn-Rz; Thu, 12 Jan 2023 15:16:27 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFzIg-00FYMY-Kb; Thu, 12 Jan 2023 15:15:32 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 699BC15D5;
	Thu, 12 Jan 2023 16:15:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673536524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGlMvwVE0XBFSe9hGJvTgj13A12QmBDoi6rAazqMrhA=;
	b=ZscdTe8D24J1musI5j2G7C9p7+ZQ5A+f8En3gxFovHFbVirPpUojaZkfg333kVIDkDF3u1
	JkLizYnIr5ACFDZnrUbxG7bosetMyVxoGTk4vVHb3dlVYWpyrNR3Gv8VlK90gXxJzafZ6J
	xAmzBjKWMTol8QKlyKKhzrU2+AzcReoW6O5Lkwhj8E3BH6xgVrvjvKNoB3/nprPu4gTFIA
	YStEnuS/eof5Rt7PsXK7P80//8ogCCMooFjZwakakV+TeFA6h3WcMwkRo12ls99PGFIO4e
	d0VputPdm1yE5Q/e/hkRFikGmt7mi5GgxQNdqBEw9dFiWC7f9diy0rkmOmtt7A==
From: Michael Walle <michael@walle.cc>
Date: Thu, 12 Jan 2023 16:15:08 +0100
Subject:  [PATCH net-next 02/10] net: mdio: i2c: Separate C22 and C45 transactions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230112-net-next-c45-seperation-part-2-v1-2-5eeaae931526@walle.cc>
References:  <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
In-Reply-To:  <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Li Yang <leoyang.li@nxp.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linuxppc-dev@lists.ozlabs.org, Andrew Lunn <andrew@lunn.ch>,
 Michael Walle <michael@walle.cc>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_071530_892978_DE26E582 
X-CRM114-Status: GOOD (  15.91  )
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

The MDIO over I2C bus driver can perform both C22 and C45 transfers.
Create separate functions for each and register the C45 versions using
the new API calls.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/mdio/mdio-i2c.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/net/mdio/mdio-i2c.c b/drivers/net/mdio/mdio-i2c.c
index bf8bf5e20faf..9577a1842997 100644
--- a/drivers/net/mdio/mdio-i2c.c
+++ b/drivers/net/mdio/mdio-i2c.c
@@ -30,7 +30,8 @@ static unsigned int i2c_mii_phy_addr(int phy_id)
 	return phy_id + 0x40;
 }
 
-static int i2c_mii_read_default(struct mii_bus *bus, int phy_id, int reg)
+static int i2c_mii_read_default_c45(struct mii_bus *bus, int phy_id, int devad,
+				    int reg)
 {
 	struct i2c_adapter *i2c = bus->priv;
 	struct i2c_msg msgs[2];
@@ -41,8 +42,8 @@ static int i2c_mii_read_default(struct mii_bus *bus, int phy_id, int reg)
 		return 0xffff;
 
 	p = addr;
-	if (reg & MII_ADDR_C45) {
-		*p++ = 0x20 | ((reg >> 16) & 31);
+	if (devad >= 0) {
+		*p++ = 0x20 | devad;
 		*p++ = reg >> 8;
 	}
 	*p++ = reg;
@@ -64,8 +65,8 @@ static int i2c_mii_read_default(struct mii_bus *bus, int phy_id, int reg)
 	return data[0] << 8 | data[1];
 }
 
-static int i2c_mii_write_default(struct mii_bus *bus, int phy_id, int reg,
-				 u16 val)
+static int i2c_mii_write_default_c45(struct mii_bus *bus, int phy_id,
+				     int devad, int reg, u16 val)
 {
 	struct i2c_adapter *i2c = bus->priv;
 	struct i2c_msg msg;
@@ -76,8 +77,8 @@ static int i2c_mii_write_default(struct mii_bus *bus, int phy_id, int reg,
 		return 0;
 
 	p = data;
-	if (reg & MII_ADDR_C45) {
-		*p++ = (reg >> 16) & 31;
+	if (devad >= 0) {
+		*p++ = devad;
 		*p++ = reg >> 8;
 	}
 	*p++ = reg;
@@ -94,6 +95,17 @@ static int i2c_mii_write_default(struct mii_bus *bus, int phy_id, int reg,
 	return ret < 0 ? ret : 0;
 }
 
+static int i2c_mii_read_default_c22(struct mii_bus *bus, int phy_id, int reg)
+{
+	return i2c_mii_read_default_c45(bus, phy_id, -1, reg);
+}
+
+static int i2c_mii_write_default_c22(struct mii_bus *bus, int phy_id, int reg,
+				     u16 val)
+{
+	return i2c_mii_write_default_c45(bus, phy_id, -1, reg, val);
+}
+
 /* RollBall SFPs do not access internal PHY via I2C address 0x56, but
  * instead via address 0x51, when SFP page is set to 0x03 and password to
  * 0xffffffff.
@@ -403,8 +415,10 @@ struct mii_bus *mdio_i2c_alloc(struct device *parent, struct i2c_adapter *i2c,
 		mii->write = i2c_mii_write_rollball;
 		break;
 	default:
-		mii->read = i2c_mii_read_default;
-		mii->write = i2c_mii_write_default;
+		mii->read = i2c_mii_read_default_c22;
+		mii->write = i2c_mii_write_default_c22;
+		mii->read_c45 = i2c_mii_read_default_c45;
+		mii->write_c45 = i2c_mii_write_default_c45;
 		break;
 	}
 

-- 
2.30.2

