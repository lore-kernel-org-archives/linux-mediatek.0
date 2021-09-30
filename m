Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EF2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:50:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F7EF61527
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F7EF61527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0clDnwZox69I6xknthG/EbL5zV8s9BphMp45otw3L4=; b=cGgd4JDeRysRmc
	dlKAGlURZyxON2tUcWa/iTXIyxjM7mtTbzVrVIeHSZuTWADZJT8+tNCdIrtl6jc2M4tCPDyroeD7y
	qxHYPzQexl5Kvp3utuhQn0MO96g+UwpkgrVmdpoy8Ur0a/WHGBpYzSbSsr8gr2V53UxSdxX6GRIvD
	bd9bMDSfneKIOhaYsLeARlDj3IjhlaqrpTFHxYTJza234RUE7GQM64OF6S/+Ib3vw/jfOMhesDkEP
	oymI9G66PGBnbK4LPQB0TWAMXYQoP1L9ec868Z7hGAbRVrEKL3JUOvqA2OZHHKOmLsSu5dPcH3wer
	uMwJBWNgsJ79MWhgNn1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVqq2-00DELK-33; Thu, 30 Sep 2021 07:50:42 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVqpb-00DECJ-6b; Thu, 30 Sep 2021 07:50:17 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9C4892022E3;
 Thu, 30 Sep 2021 09:50:13 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 37C882017C0;
 Thu, 30 Sep 2021 09:50:13 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 7EBE7183AC89; Thu, 30 Sep 2021 15:50:10 +0800 (+08)
From: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To: davem@davemloft.net, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: allan.nielsen@microchip.com, joergen.andreasen@microchip.com,
 UNGLinuxDriver@microchip.com, vinicius.gomes@intel.com,
 michael.chan@broadcom.com, vishal@chelsio.com, saeedm@mellanox.com,
 jiri@mellanox.com, idosch@mellanox.com, alexandre.belloni@bootlin.com,
 kuba@kernel.org, xiaoliang.yang_1@nxp.com, po.liu@nxp.com,
 vladimir.oltean@nxp.com, leoyang.li@nxp.com, f.fainelli@gmail.com,
 andrew@lunn.ch, vivien.didelot@gmail.com, claudiu.manoil@nxp.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, horatiu.vultur@microchip.com
Subject: [PATCH v6 net-next 1/8] net: mscc: ocelot: serialize access to the
 MAC table
Date: Thu, 30 Sep 2021 15:59:41 +0800
Message-Id: <20210930075948.36981-2-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930075948.36981-1-xiaoliang.yang_1@nxp.com>
References: <20210930075948.36981-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_005015_542538_32800645 
X-CRM114-Status: GOOD (  21.27  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Vladimir Oltean <vladimir.oltean@nxp.com>

DSA would like to remove the rtnl_lock from its
SWITCHDEV_FDB_{ADD,DEL}_TO_DEVICE handlers, and the felix driver uses
the same MAC table functions as ocelot.

This means that the MAC table functions will no longer be implicitly
serialized with respect to each other by the rtnl_mutex, we need to add
a dedicated lock in ocelot for the non-atomic operations of selecting a
MAC table row, reading/writing what we want and polling for completion.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 drivers/net/ethernet/mscc/ocelot.c | 53 +++++++++++++++++++++++-------
 include/soc/mscc/ocelot.h          |  3 ++
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot.c b/drivers/net/ethernet/mscc/ocelot.c
index 559177e6ded4..61ac49751230 100644
--- a/drivers/net/ethernet/mscc/ocelot.c
+++ b/drivers/net/ethernet/mscc/ocelot.c
@@ -20,11 +20,13 @@ struct ocelot_mact_entry {
 	enum macaccess_entry_type type;
 };
 
+/* Must be called with &ocelot->mact_lock held */
 static inline u32 ocelot_mact_read_macaccess(struct ocelot *ocelot)
 {
 	return ocelot_read(ocelot, ANA_TABLES_MACACCESS);
 }
 
+/* Must be called with &ocelot->mact_lock held */
 static inline int ocelot_mact_wait_for_completion(struct ocelot *ocelot)
 {
 	u32 val;
@@ -36,6 +38,7 @@ static inline int ocelot_mact_wait_for_completion(struct ocelot *ocelot)
 		TABLE_UPDATE_SLEEP_US, TABLE_UPDATE_TIMEOUT_US);
 }
 
+/* Must be called with &ocelot->mact_lock held */
 static void ocelot_mact_select(struct ocelot *ocelot,
 			       const unsigned char mac[ETH_ALEN],
 			       unsigned int vid)
@@ -67,6 +70,7 @@ int ocelot_mact_learn(struct ocelot *ocelot, int port,
 		ANA_TABLES_MACACCESS_ENTRYTYPE(type) |
 		ANA_TABLES_MACACCESS_MAC_TABLE_CMD(MACACCESS_CMD_LEARN);
 	unsigned int mc_ports;
+	int err;
 
 	/* Set MAC_CPU_COPY if the CPU port is used by a multicast entry */
 	if (type == ENTRYTYPE_MACv4)
@@ -79,18 +83,28 @@ int ocelot_mact_learn(struct ocelot *ocelot, int port,
 	if (mc_ports & BIT(ocelot->num_phys_ports))
 		cmd |= ANA_TABLES_MACACCESS_MAC_CPU_COPY;
 
+	mutex_lock(&ocelot->mact_lock);
+
 	ocelot_mact_select(ocelot, mac, vid);
 
 	/* Issue a write command */
 	ocelot_write(ocelot, cmd, ANA_TABLES_MACACCESS);
 
-	return ocelot_mact_wait_for_completion(ocelot);
+	err = ocelot_mact_wait_for_completion(ocelot);
+
+	mutex_unlock(&ocelot->mact_lock);
+
+	return err;
 }
 EXPORT_SYMBOL(ocelot_mact_learn);
 
 int ocelot_mact_forget(struct ocelot *ocelot,
 		       const unsigned char mac[ETH_ALEN], unsigned int vid)
 {
+	int err;
+
+	mutex_lock(&ocelot->mact_lock);
+
 	ocelot_mact_select(ocelot, mac, vid);
 
 	/* Issue a forget command */
@@ -98,7 +112,11 @@ int ocelot_mact_forget(struct ocelot *ocelot,
 		     ANA_TABLES_MACACCESS_MAC_TABLE_CMD(MACACCESS_CMD_FORGET),
 		     ANA_TABLES_MACACCESS);
 
-	return ocelot_mact_wait_for_completion(ocelot);
+	err = ocelot_mact_wait_for_completion(ocelot);
+
+	mutex_unlock(&ocelot->mact_lock);
+
+	return err;
 }
 EXPORT_SYMBOL(ocelot_mact_forget);
 
@@ -114,7 +132,9 @@ static void ocelot_mact_init(struct ocelot *ocelot)
 		   | ANA_AGENCTRL_LEARN_IGNORE_VLAN,
 		   ANA_AGENCTRL);
 
-	/* Clear the MAC table */
+	/* Clear the MAC table. We are not concurrent with anyone, so
+	 * holding &ocelot->mact_lock is pointless.
+	 */
 	ocelot_write(ocelot, MACACCESS_CMD_INIT, ANA_TABLES_MACACCESS);
 }
 
@@ -1018,6 +1038,7 @@ int ocelot_port_fdb_do_dump(const unsigned char *addr, u16 vid,
 }
 EXPORT_SYMBOL(ocelot_port_fdb_do_dump);
 
+/* Must be called with &ocelot->mact_lock held */
 static int ocelot_mact_read(struct ocelot *ocelot, int port, int row, int col,
 			    struct ocelot_mact_entry *entry)
 {
@@ -1068,33 +1089,40 @@ static int ocelot_mact_read(struct ocelot *ocelot, int port, int row, int col,
 int ocelot_fdb_dump(struct ocelot *ocelot, int port,
 		    dsa_fdb_dump_cb_t *cb, void *data)
 {
+	int err = 0;
 	int i, j;
 
+	/* We could take the lock just around ocelot_mact_read, but doing so
+	 * thousands of times in a row seems rather pointless and inefficient.
+	 */
+	mutex_lock(&ocelot->mact_lock);
+
 	/* Loop through all the mac tables entries. */
 	for (i = 0; i < ocelot->num_mact_rows; i++) {
 		for (j = 0; j < 4; j++) {
 			struct ocelot_mact_entry entry;
 			bool is_static;
-			int ret;
 
-			ret = ocelot_mact_read(ocelot, port, i, j, &entry);
+			err = ocelot_mact_read(ocelot, port, i, j, &entry);
 			/* If the entry is invalid (wrong port, invalid...),
 			 * skip it.
 			 */
-			if (ret == -EINVAL)
+			if (err == -EINVAL)
 				continue;
-			else if (ret)
-				return ret;
+			else if (err)
+				break;
 
 			is_static = (entry.type == ENTRYTYPE_LOCKED);
 
-			ret = cb(entry.mac, entry.vid, is_static, data);
-			if (ret)
-				return ret;
+			err = cb(entry.mac, entry.vid, is_static, data);
+			if (err)
+				break;
 		}
 	}
 
-	return 0;
+	mutex_unlock(&ocelot->mact_lock);
+
+	return err;
 }
 EXPORT_SYMBOL(ocelot_fdb_dump);
 
@@ -2080,6 +2108,7 @@ int ocelot_init(struct ocelot *ocelot)
 
 	mutex_init(&ocelot->stats_lock);
 	mutex_init(&ocelot->ptp_lock);
+	mutex_init(&ocelot->mact_lock);
 	spin_lock_init(&ocelot->ptp_clock_lock);
 	snprintf(queue_name, sizeof(queue_name), "%s-stats",
 		 dev_name(ocelot->dev));
diff --git a/include/soc/mscc/ocelot.h b/include/soc/mscc/ocelot.h
index 06706a9fd5b1..682cd058096c 100644
--- a/include/soc/mscc/ocelot.h
+++ b/include/soc/mscc/ocelot.h
@@ -674,6 +674,9 @@ struct ocelot {
 	struct delayed_work		stats_work;
 	struct workqueue_struct		*stats_queue;
 
+	/* Lock for serializing access to the MAC table */
+	struct mutex			mact_lock;
+
 	struct workqueue_struct		*owq;
 
 	u8				ptp:1;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
