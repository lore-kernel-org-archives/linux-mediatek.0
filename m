Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8150FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:43:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 447BC61050
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 447BC61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iaBXN/YUH6gVgvpaFfCKGdUuafqiqwntVavkPF24tqU=; b=k3y7SLh3hswCZf
	Gpw5GxG02s1xTrj+YrvP2wPyV57Lv9+x2EDz6aFbF2gWvx9EUbgk5u4DCUBg6GYrhQJH/dWST08kG
	gbfvMS4SQ5Z6l+LKQjVXj+6No24v+RtiR6S6k9bXj6AGFERkJPmTu/sWgP5/bjiGPb/XoopnvdKoZ
	1azG37Got9jk2bvS9gcHcVuW2G8txwrlgDa+QwlsL8j3GcpBzxt0Nn8SdhBYNyH8RDL2qVLykVe06
	vORkDE+sm9Y/DDCFe11RixFrJ24IH/xkPDX8qs8p+dc8YopsN7IigaPbvLkuWsBp79BP4bHmOGYsi
	oDafVI/OSqtO7WeKbUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThk1-00DvaZ-AC; Fri, 24 Sep 2021 09:43:37 +0000
Received: from inva020.nxp.com ([92.121.34.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThjE-00DvGj-6b; Fri, 24 Sep 2021 09:42:49 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EBE5C1A3059;
 Fri, 24 Sep 2021 11:42:46 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 54D1D1A3049;
 Fri, 24 Sep 2021 11:42:46 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 750ED183AC8B; Fri, 24 Sep 2021 17:42:43 +0800 (+08)
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
Subject: [PATCH v5 net-next 3/9] net: mscc: ocelot: add MAC table stream learn
 and lookup operations
Date: Fri, 24 Sep 2021 17:52:20 +0800
Message-Id: <20210924095226.38079-4-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210924095226.38079-1-xiaoliang.yang_1@nxp.com>
References: <20210924095226.38079-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_024248_551205_D7475AD8 
X-CRM114-Status: GOOD (  11.37  )
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

ocelot_mact_learn_streamdata() can be used in VSC9959 to overwrite an
FDB entry with stream data. The stream data includes SFID and SSID which
can be used for PSFP and FRER set.

ocelot_mact_lookup() can be used to check if the given {DMAC, VID} FDB
entry is exist, and also can retrieve the DEST_IDX and entry type for
the FDB entry.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 drivers/net/ethernet/mscc/ocelot.c | 50 ++++++++++++++++++++++++++++++
 include/soc/mscc/ocelot.h          |  5 +++
 2 files changed, 55 insertions(+)

diff --git a/drivers/net/ethernet/mscc/ocelot.c b/drivers/net/ethernet/mscc/ocelot.c
index 35006b0fb963..dc65247b91be 100644
--- a/drivers/net/ethernet/mscc/ocelot.c
+++ b/drivers/net/ethernet/mscc/ocelot.c
@@ -114,6 +114,56 @@ int ocelot_mact_forget(struct ocelot *ocelot,
 }
 EXPORT_SYMBOL(ocelot_mact_forget);
 
+int ocelot_mact_lookup(struct ocelot *ocelot, int *dst_idx,
+		       struct ocelot_mact_entry *entry)
+{
+	int val;
+
+	mutex_lock(&ocelot->mact_lock);
+
+	ocelot_mact_select(ocelot, entry->mac, entry->vid);
+
+	/* Issue a read command with MACACCESS_VALID=1. */
+	ocelot_write(ocelot, ANA_TABLES_MACACCESS_VALID |
+		     ANA_TABLES_MACACCESS_MAC_TABLE_CMD(MACACCESS_CMD_READ),
+		     ANA_TABLES_MACACCESS);
+
+	if (ocelot_mact_wait_for_completion(ocelot)) {
+		mutex_unlock(&ocelot->mact_lock);
+		return -ETIMEDOUT;
+	}
+
+	/* Read back the entry flags */
+	val = ocelot_read(ocelot, ANA_TABLES_MACACCESS);
+
+	mutex_unlock(&ocelot->mact_lock);
+
+	if (!(val & ANA_TABLES_MACACCESS_VALID))
+		return -ENOENT;
+
+	*dst_idx = ANA_TABLES_MACACCESS_DEST_IDX_X(val);
+	entry->type = ANA_TABLES_MACACCESS_ENTRYTYPE_X(val);
+
+	return 0;
+}
+EXPORT_SYMBOL(ocelot_mact_lookup);
+
+int ocelot_mact_learn_streamdata(struct ocelot *ocelot, int dst_idx,
+				 struct ocelot_mact_entry *entry, u32 data)
+{
+	int ret;
+
+	mutex_lock(&ocelot->mact_lock);
+	ocelot_write(ocelot, data, ANA_TABLES_STREAMDATA);
+	mutex_unlock(&ocelot->mact_lock);
+
+	ret = ocelot_mact_learn(ocelot, dst_idx, entry->mac, entry->vid,
+				entry->type);
+
+	return ret;
+}
+EXPORT_SYMBOL(ocelot_mact_learn_streamdata);
+
 static void ocelot_mact_init(struct ocelot *ocelot)
 {
 	/* Configure the learning mode entries attributes:
diff --git a/include/soc/mscc/ocelot.h b/include/soc/mscc/ocelot.h
index e6773f4d09ce..455293652257 100644
--- a/include/soc/mscc/ocelot.h
+++ b/include/soc/mscc/ocelot.h
@@ -926,6 +926,11 @@ void ocelot_phylink_mac_link_up(struct ocelot *ocelot, int port,
 				bool tx_pause, bool rx_pause,
 				unsigned long quirks);
 
+int ocelot_mact_lookup(struct ocelot *ocelot, int *dst_idx,
+		       struct ocelot_mact_entry *entry);
+int ocelot_mact_learn_streamdata(struct ocelot *ocelot, int dst_idx,
+				 struct ocelot_mact_entry *entry, u32 data);
+
 #if IS_ENABLED(CONFIG_BRIDGE_MRP)
 int ocelot_mrp_add(struct ocelot *ocelot, int port,
 		   const struct switchdev_obj_mrp *mrp);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
