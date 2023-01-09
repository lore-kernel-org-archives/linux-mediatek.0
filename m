Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521C7C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 15:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKZX4lcj+SRBIVWCBH17m7wfPVkw0M5gZtlyN0DyHu8=; b=U75kEKDxzIxyxaLqCpZR2iSmb/
	cKliyRvDMb2B0/doYuGymOr1581wNglsqGhDwCaAwmljqYowRy0wK5OmCk2M5CdR4dIAh9xWj6r+K
	O/xkj236wNt6ALY61IIQfuQF1H1lFeVwM/ZJFrcpxwXYgZbn9mZahKugbVUg0Bb2/45Xmv0eT8sK/
	4rkEfbFciXJRQ2LnM/Jw11eGP+DWNTiVtCWo2694IHp1zPsNa77QW+RXGNM/zla6xzoG6g4UtR7Z3
	E7cJgi1/z3QwRkb1E2vmOgY28Yy+BiA9FdBzVZOzRWGJLQ190OXIMh0dVdO7SI6ULDxMNDwAcmKI3
	peqQAirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEuCe-002JL2-UR; Mon, 09 Jan 2023 15:36:49 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEu74-002FyK-IG; Mon, 09 Jan 2023 15:31:08 +0000
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4327319AC;
	Mon,  9 Jan 2023 16:30:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673278258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZKZX4lcj+SRBIVWCBH17m7wfPVkw0M5gZtlyN0DyHu8=;
	b=fCSsUcMXDlZzixTku/Y+ymZofQlKNafLyq8JmlrNVkLWLAFDn3XTwVw51vWElJJug1k+ZF
	ogtfq1axpzXT0hqcrnwCHvgMMPNP6WaRhHDKAifUTLBQ9/xzr0f3e9ZG7OIot1HTsrmSgF
	E5JPalqR23Z7h5hF6Y8X91w8h5uzm0ilszAFTB8nCKi7399/rjeup3ijl+Ln9olwa8mlLz
	G8eav1lUQCAxySB/z8ynkAfTL1UOMuJwT0g37B+DPElKUBlcNAwinuITOjgZ5iTqKJBH5O
	yYTauzwB5otYjzxH9nQbr9EYkoIuNFAC7oQyhruz9v/Fha75yrSS1p/xWID3jA==
From: Michael Walle <michael@walle.cc>
Date: Mon, 09 Jan 2023 16:30:50 +0100
Subject: [PATCH net-next v3 10/11] net: mdio: add
 mdiobus_c45_read/write_nested helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221227-v6-2-rc1-c45-seperation-v3-10-ade1deb438da@walle.cc>
References: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v3-0-ade1deb438da@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Walle <michael@walle.cc>, Vladimir Oltean <vladimir.oltean@nxp.com>
X-Mailer: b4 0.11.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_073106_837702_2F9133EC 
X-CRM114-Status: GOOD (  11.67  )
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

Some DSA devices pass through PHY access to the MDIO bus the switch is
on. Add C45 versions of the current C22 helpers for nested accesses to
MDIO busses, so that C22 and C45 can be separated in these DSA
drivers.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
v2:
 - [al] new patch
---
 drivers/net/phy/mdio_bus.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mdio.h       |  4 ++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 522cbe6a0b23..902e1c88ef58 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -1008,6 +1008,33 @@ int mdiobus_c45_read(struct mii_bus *bus, int addr, int devad, u32 regnum)
 }
 EXPORT_SYMBOL(mdiobus_c45_read);
 
+/**
+ * mdiobus_c45_read_nested - Nested version of the mdiobus_c45_read function
+ * @bus: the mii_bus struct
+ * @addr: the phy address
+ * @devad: device address to read
+ * @regnum: register number to read
+ *
+ * In case of nested MDIO bus access avoid lockdep false positives by
+ * using mutex_lock_nested().
+ *
+ * NOTE: MUST NOT be called from interrupt context,
+ * because the bus read/write functions may wait for an interrupt
+ * to conclude the operation.
+ */
+int mdiobus_c45_read_nested(struct mii_bus *bus, int addr, int devad,
+			    u32 regnum)
+{
+	int retval;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	retval = __mdiobus_c45_read(bus, addr, devad, regnum);
+	mutex_unlock(&bus->mdio_lock);
+
+	return retval;
+}
+EXPORT_SYMBOL(mdiobus_c45_read_nested);
+
 /**
  * mdiobus_write_nested - Nested version of the mdiobus_write function
  * @bus: the mii_bus struct
@@ -1082,6 +1109,34 @@ int mdiobus_c45_write(struct mii_bus *bus, int addr, int devad, u32 regnum,
 }
 EXPORT_SYMBOL(mdiobus_c45_write);
 
+/**
+ * mdiobus_c45_write_nested - Nested version of the mdiobus_c45_write function
+ * @bus: the mii_bus struct
+ * @addr: the phy address
+ * @devad: device address to read
+ * @regnum: register number to write
+ * @val: value to write to @regnum
+ *
+ * In case of nested MDIO bus access avoid lockdep false positives by
+ * using mutex_lock_nested().
+ *
+ * NOTE: MUST NOT be called from interrupt context,
+ * because the bus read/write functions may wait for an interrupt
+ * to conclude the operation.
+ */
+int mdiobus_c45_write_nested(struct mii_bus *bus, int addr, int devad,
+			     u32 regnum, u16 val)
+{
+	int err;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+	err = __mdiobus_c45_write(bus, addr, devad, regnum, val);
+	mutex_unlock(&bus->mdio_lock);
+
+	return err;
+}
+EXPORT_SYMBOL(mdiobus_c45_write_nested);
+
 /**
  * mdiobus_modify - Convenience function for modifying a given mdio device
  *	register
diff --git a/include/linux/mdio.h b/include/linux/mdio.h
index 97b49765e8b5..220f3ca8702d 100644
--- a/include/linux/mdio.h
+++ b/include/linux/mdio.h
@@ -425,10 +425,14 @@ int mdiobus_modify_changed(struct mii_bus *bus, int addr, u32 regnum,
 			   u16 mask, u16 set);
 int __mdiobus_c45_read(struct mii_bus *bus, int addr, int devad, u32 regnum);
 int mdiobus_c45_read(struct mii_bus *bus, int addr, int devad, u32 regnum);
+int mdiobus_c45_read_nested(struct mii_bus *bus, int addr, int devad,
+			     u32 regnum);
 int __mdiobus_c45_write(struct mii_bus *bus, int addr,  int devad, u32 regnum,
 			u16 val);
 int mdiobus_c45_write(struct mii_bus *bus, int addr,  int devad, u32 regnum,
 		      u16 val);
+int mdiobus_c45_write_nested(struct mii_bus *bus, int addr,  int devad,
+			     u32 regnum, u16 val);
 int mdiobus_c45_modify(struct mii_bus *bus, int addr, int devad, u32 regnum,
 		       u16 mask, u16 set);
 

-- 
2.30.2

