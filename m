Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A80EC54E76
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 19:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxALKXR/4199556/SGFmFAobEu49Mu5OR1CFFnnu+qs=; b=nhO/FecwvzAf1GLMQOf6FSKpG4
	nYeaSSBDrgUUdEOnbYp2JQhetsgBf8fXycV8M9oXmhsRirIGs300PPl5sCMcyTSQhYH6QrcZPZAW6
	X4EQJwgO/Liu2GW6+Fh4L5hrMbBfUS+tk6sBX7lfB4Zeux4ZAukPukalLJVfWo2z7+YJAxyKcBt0K
	UHuhBH+/PTXiiKIHr5d6jCCEJpQfvLZTpDKiWkmA1lN6P1anBYUbhewOXYG7BWBK9cLq/1COz4jhT
	qgC08t/LnN5mP+uuceFlxNCoOBsEVJ/BxpqHrditYeDzEpTtmhPL5gdwyaLeOyA0kz0loAL7aKO9W
	A5/b8vCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHrDy-00FXCR-1k; Tue, 17 Jan 2023 19:02:22 +0000
Received: from mailout-taastrup.gigahost.dk ([46.183.139.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHrD6-00FWmB-0f; Tue, 17 Jan 2023 19:01:30 +0000
Received: from mailout.gigahost.dk (mailout.gigahost.dk [89.186.169.112])
	by mailout-taastrup.gigahost.dk (Postfix) with ESMTP id AED9518837C0;
	Tue, 17 Jan 2023 18:59:15 +0000 (UTC)
Received: from smtp.gigahost.dk (smtp.gigahost.dk [89.186.169.109])
	by mailout.gigahost.dk (Postfix) with ESMTP id 9A02E250007B;
	Tue, 17 Jan 2023 18:59:15 +0000 (UTC)
Received: by smtp.gigahost.dk (Postfix, from userid 1000)
	id 8A4D091201E3; Tue, 17 Jan 2023 18:59:15 +0000 (UTC)
X-Screener-Id: 413d8c6ce5bf6eab4824d0abaab02863e8e3f662
Received: from fujitsu.vestervang (2-104-116-184-cable.dk.customer.tdc.net [2.104.116.184])
	by smtp.gigahost.dk (Postfix) with ESMTPSA id D277991201E4;
	Tue, 17 Jan 2023 18:59:14 +0000 (UTC)
From: "Hans J. Schultz" <netdev@kapio-technology.com>
To: davem@davemloft.net,
	kuba@kernel.org
Cc: netdev@vger.kernel.org,
	"Hans J. Schultz" <netdev@kapio-technology.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com (maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER),
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER),
	bridge@lists.linux-foundation.org (moderated list:ETHERNET BRIDGE)
Subject: [RFC PATCH net-next 5/5] net: dsa: mv88e6xxx: implementation of dynamic ATU entries
Date: Tue, 17 Jan 2023 19:57:14 +0100
Message-Id: <20230117185714.3058453-6-netdev@kapio-technology.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117185714.3058453-1-netdev@kapio-technology.com>
References: <20230117185714.3058453-1-netdev@kapio-technology.com>
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_110128_392219_3F85CF3C 
X-CRM114-Status: GOOD (  23.16  )
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

For 802.1X or MAB security authed hosts we want to have these hosts authed
by adding dynamic FDB entries, so that if an authed host goes silent for
a time period it's FDB entry will be removed and it must reauth when
wanting to communicate again.
In the mv88e6xxx offloaded case, we can use the HoldAt1 feature, that
gives an age out interrupt when the FDB entry is about to age out, so
that userspace can be notified of the entry being deleted with the help
of an SWITCHDEV_FDB_DEL_TO_BRIDGE event.
When adding a dynamic entry the bridge must be informed that the driver
takes care of the ageing be sending an SWITCHDEV_FDB_OFFLOADED event,
telling the bridge that this added FDB entry will be handled by the
driver.
With this implementation, trace events for age out interrupts are also
added.

note: A special case arises with the age out interrupt, as the entry
state/spid (source port id) value read from the registers will be zero.
Thus we need to extract the source port from the port vector instead.

Signed-off-by: Hans J. Schultz <netdev@kapio-technology.com>
---
 drivers/net/dsa/mv88e6xxx/chip.c        | 18 ++++++--
 drivers/net/dsa/mv88e6xxx/global1_atu.c | 21 +++++++++
 drivers/net/dsa/mv88e6xxx/port.c        |  6 ++-
 drivers/net/dsa/mv88e6xxx/switchdev.c   | 61 +++++++++++++++++++++++++
 drivers/net/dsa/mv88e6xxx/switchdev.h   |  5 ++
 drivers/net/dsa/mv88e6xxx/trace.h       |  5 ++
 6 files changed, 110 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index a9c84b92a10e..e5d64622a629 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -42,6 +42,7 @@
 #include "ptp.h"
 #include "serdes.h"
 #include "smi.h"
+#include "switchdev.h"
 
 static void assert_reg_lock(struct mv88e6xxx_chip *chip)
 {
@@ -2726,18 +2727,25 @@ static int mv88e6xxx_port_fdb_add(struct dsa_switch *ds, int port,
 				  const unsigned char *addr, u16 vid,
 				  u16 fdb_flags, struct dsa_db db)
 {
+	bool is_dynamic = !!(fdb_flags & DSA_FDB_FLAG_DYNAMIC);
 	struct mv88e6xxx_chip *chip = ds->priv;
+	u8 state;
 	int err;
 
-	/* Ignore entries with flags set */
-	if (fdb_flags)
-		return 0;
+	state = MV88E6XXX_G1_ATU_DATA_STATE_UC_STATIC;
+	if (is_dynamic)
+		state = MV88E6XXX_G1_ATU_DATA_STATE_UC_AGE_7_NEWEST;
+	else
+		if (fdb_flags)
+			return 0;
 
 	mv88e6xxx_reg_lock(chip);
-	err = mv88e6xxx_port_db_load_purge(chip, port, addr, vid,
-					   MV88E6XXX_G1_ATU_DATA_STATE_UC_STATIC);
+	err = mv88e6xxx_port_db_load_purge(chip, port, addr, vid, state);
 	mv88e6xxx_reg_unlock(chip);
 
+	if (is_dynamic && !err)
+		mv88e6xxx_set_fdb_offloaded(ds, port, addr, vid);
+
 	return err;
 }
 
diff --git a/drivers/net/dsa/mv88e6xxx/global1_atu.c b/drivers/net/dsa/mv88e6xxx/global1_atu.c
index ce3b3690c3c0..c95f8cffba41 100644
--- a/drivers/net/dsa/mv88e6xxx/global1_atu.c
+++ b/drivers/net/dsa/mv88e6xxx/global1_atu.c
@@ -432,6 +432,27 @@ static irqreturn_t mv88e6xxx_g1_atu_prob_irq_thread_fn(int irq, void *dev_id)
 
 	spid = entry.state;
 
+	if (val & MV88E6XXX_G1_ATU_OP_AGE_OUT_VIOLATION) {
+		unsigned long port = 0;
+		unsigned long portvec = entry.portvec;
+
+		port = find_first_bit(&portvec, MV88E6XXX_MAX_PVT_PORTS);
+		if (port >= MV88E6XXX_MAX_PVT_PORTS) {
+			dev_err(chip->dev,
+				"ATU err: mac: %pM. Port not in portvec: %x\n",
+				entry.mac, entry.portvec);
+			goto out;
+		}
+
+		spid = port;
+		trace_mv88e6xxx_atu_age_out_violation(chip->dev, spid,
+						      entry.portvec, entry.mac,
+						      fid);
+
+		err = mv88e6xxx_handle_age_out_violation(chip, spid,
+							 &entry, fid);
+	}
+
 	if (val & MV88E6XXX_G1_ATU_OP_MEMBER_VIOLATION) {
 		trace_mv88e6xxx_atu_member_violation(chip->dev, spid,
 						     entry.portvec, entry.mac,
diff --git a/drivers/net/dsa/mv88e6xxx/port.c b/drivers/net/dsa/mv88e6xxx/port.c
index f79cf716c541..5225971b9a33 100644
--- a/drivers/net/dsa/mv88e6xxx/port.c
+++ b/drivers/net/dsa/mv88e6xxx/port.c
@@ -1255,7 +1255,11 @@ int mv88e6xxx_port_set_lock(struct mv88e6xxx_chip *chip, int port,
 
 	reg &= ~MV88E6XXX_PORT_ASSOC_VECTOR_LOCKED_PORT;
 	if (locked)
-		reg |= MV88E6XXX_PORT_ASSOC_VECTOR_LOCKED_PORT;
+		reg |= MV88E6XXX_PORT_ASSOC_VECTOR_LOCKED_PORT |
+			MV88E6XXX_PORT_ASSOC_VECTOR_REFRESH_LOCKED |
+			MV88E6XXX_PORT_ASSOC_VECTOR_IGNORE_WRONG |
+			MV88E6XXX_PORT_ASSOC_VECTOR_INT_AGE_OUT |
+			MV88E6XXX_PORT_ASSOC_VECTOR_HOLD_AT_1;
 
 	return mv88e6xxx_port_write(chip, port, MV88E6XXX_PORT_ASSOC_VECTOR, reg);
 }
diff --git a/drivers/net/dsa/mv88e6xxx/switchdev.c b/drivers/net/dsa/mv88e6xxx/switchdev.c
index 4c346a884fb2..76f7f8cc1835 100644
--- a/drivers/net/dsa/mv88e6xxx/switchdev.c
+++ b/drivers/net/dsa/mv88e6xxx/switchdev.c
@@ -12,6 +12,25 @@
 #include "global1.h"
 #include "switchdev.h"
 
+void mv88e6xxx_set_fdb_offloaded(struct dsa_switch *ds, int port,
+				 const unsigned char *addr, u16 vid)
+{
+	struct switchdev_notifier_fdb_info info = {
+		.addr = addr,
+		.vid = vid,
+		.offloaded = true,
+	};
+	struct net_device *brport;
+	struct dsa_port *dp;
+
+	dp = dsa_to_port(ds, port);
+	brport = dsa_port_to_bridge_port(dp);
+
+	if (brport)
+		call_switchdev_notifiers(SWITCHDEV_FDB_OFFLOADED,
+					 brport, &info.info, NULL);
+}
+
 struct mv88e6xxx_fid_search_ctx {
 	u16 fid_search;
 	u16 vid_found;
@@ -81,3 +100,45 @@ int mv88e6xxx_handle_miss_violation(struct mv88e6xxx_chip *chip, int port,
 
 	return err;
 }
+
+int mv88e6xxx_handle_age_out_violation(struct mv88e6xxx_chip *chip, int port,
+				       struct mv88e6xxx_atu_entry *entry,
+				       u16 fid)
+{
+	struct switchdev_notifier_fdb_info info = {
+		.addr = entry->mac,
+	};
+	struct net_device *brport;
+	struct dsa_port *dp;
+	u16 vid;
+	int err;
+
+	err = mv88e6xxx_find_vid(chip, fid, &vid);
+	if (err)
+		return err;
+
+	info.vid = vid;
+	entry->portvec &= ~BIT(port);
+	entry->state = MV88E6XXX_G1_ATU_DATA_STATE_UC_UNUSED;
+	entry->trunk = false;
+
+	mv88e6xxx_reg_lock(chip);
+	err = mv88e6xxx_g1_atu_loadpurge(chip, fid, entry);
+	mv88e6xxx_reg_unlock(chip);
+	if (err)
+		return err;
+
+	dp = dsa_to_port(chip->ds, port);
+
+	rtnl_lock();
+	brport = dsa_port_to_bridge_port(dp);
+	if (!brport) {
+		rtnl_unlock();
+		return -ENODEV;
+	}
+	err = call_switchdev_notifiers(SWITCHDEV_FDB_DEL_TO_BRIDGE,
+				       brport, &info.info, NULL);
+	rtnl_unlock();
+
+	return err;
+}
diff --git a/drivers/net/dsa/mv88e6xxx/switchdev.h b/drivers/net/dsa/mv88e6xxx/switchdev.h
index 62214f9d62b0..5af6ac6a490a 100644
--- a/drivers/net/dsa/mv88e6xxx/switchdev.h
+++ b/drivers/net/dsa/mv88e6xxx/switchdev.h
@@ -12,8 +12,13 @@
 
 #include "chip.h"
 
+void mv88e6xxx_set_fdb_offloaded(struct dsa_switch *ds, int port,
+				 const unsigned char *addr, u16 vid);
 int mv88e6xxx_handle_miss_violation(struct mv88e6xxx_chip *chip, int port,
 				    struct mv88e6xxx_atu_entry *entry,
 				    u16 fid);
+int mv88e6xxx_handle_age_out_violation(struct mv88e6xxx_chip *chip, int port,
+				       struct mv88e6xxx_atu_entry *entry,
+				       u16 fid);
 
 #endif /* _MV88E6XXX_SWITCHDEV_H_ */
diff --git a/drivers/net/dsa/mv88e6xxx/trace.h b/drivers/net/dsa/mv88e6xxx/trace.h
index f59ca04768e7..c6b32abf68a5 100644
--- a/drivers/net/dsa/mv88e6xxx/trace.h
+++ b/drivers/net/dsa/mv88e6xxx/trace.h
@@ -40,6 +40,11 @@ DECLARE_EVENT_CLASS(mv88e6xxx_atu_violation,
 		  __entry->addr, __entry->fid)
 );
 
+DEFINE_EVENT(mv88e6xxx_atu_violation, mv88e6xxx_atu_age_out_violation,
+	     TP_PROTO(const struct device *dev, int spid, u16 portvec,
+		      const unsigned char *addr, u16 fid),
+	     TP_ARGS(dev, spid, portvec, addr, fid));
+
 DEFINE_EVENT(mv88e6xxx_atu_violation, mv88e6xxx_atu_member_violation,
 	     TP_PROTO(const struct device *dev, int spid, u16 portvec,
 		      const unsigned char *addr, u16 fid),
-- 
2.34.1


