Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5483DC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:43:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2984061050
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2984061050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0eewm3OmVuptpV/ZvxMKpHa+nE6tFI4i9I9ohEa+RM=; b=zbjX247Z/3Vbs5
	Y21vEmhydZULt3X6o7rqo2nnBqVR5AO0MAcdqBDZZ14/lrKnbya7WBCIXJ4d+1LpkevepvCEylq8a
	PkItpM0YOUL612YpXsgzQUHIn8gwj5c8blygaDWMvoMkuP2EtRdOK5n8SaLVqpp8GtzsRjI/NSxj2
	BfIF3I/PxiO6sTH3UtI5ApvKqZDxyCZj9i4eiQlGjmYQCcIx7yEGGVpf6BRS01VuwVe1zZ+DIWIsu
	p7ueleewH83DMQQEDJ2Mh6tM14A/x7FOizb07F2n9cVZPJip6tJOcumN7Auoywj0VgC2k5UD7HGsl
	J7vqOmEpoG6VvC9VmhBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThjk-00DvSd-Mn; Fri, 24 Sep 2021 09:43:20 +0000
Received: from inva020.nxp.com ([92.121.34.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThjC-00DvG8-Gn; Fri, 24 Sep 2021 09:42:48 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4D9981A3060;
 Fri, 24 Sep 2021 11:42:44 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DF0801A3058;
 Fri, 24 Sep 2021 11:42:43 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 EC8A0183AD0B; Fri, 24 Sep 2021 17:42:40 +0800 (+08)
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
Subject: [PATCH v5 net-next 2/9] net: mscc: ocelot: export struct
 ocelot_mact_entry
Date: Fri, 24 Sep 2021 17:52:19 +0800
Message-Id: <20210924095226.38079-3-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210924095226.38079-1-xiaoliang.yang_1@nxp.com>
References: <20210924095226.38079-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_024246_866353_3F21109E 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

Felix DSA needs to use this struct to export MAC table write and lookup
operations as well, for its stream identification functions, so export
them in preparation of that.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 drivers/net/ethernet/mscc/ocelot.c |  6 ------
 drivers/net/ethernet/mscc/ocelot.h | 13 -------------
 include/soc/mscc/ocelot.h          | 19 +++++++++++++++++++
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot.c b/drivers/net/ethernet/mscc/ocelot.c
index 9f481cf19931..35006b0fb963 100644
--- a/drivers/net/ethernet/mscc/ocelot.c
+++ b/drivers/net/ethernet/mscc/ocelot.c
@@ -14,12 +14,6 @@
 #define TABLE_UPDATE_SLEEP_US 10
 #define TABLE_UPDATE_TIMEOUT_US 100000
 
-struct ocelot_mact_entry {
-	u8 mac[ETH_ALEN];
-	u16 vid;
-	enum macaccess_entry_type type;
-};
-
 /* Must be called with &ocelot->mact_lock held */
 static inline u32 ocelot_mact_read_macaccess(struct ocelot *ocelot)
 {
diff --git a/drivers/net/ethernet/mscc/ocelot.h b/drivers/net/ethernet/mscc/ocelot.h
index 1952d6a1b98a..a77050b13d18 100644
--- a/drivers/net/ethernet/mscc/ocelot.h
+++ b/drivers/net/ethernet/mscc/ocelot.h
@@ -54,19 +54,6 @@ struct ocelot_dump_ctx {
 	int idx;
 };
 
-/* MAC table entry types.
- * ENTRYTYPE_NORMAL is subject to aging.
- * ENTRYTYPE_LOCKED is not subject to aging.
- * ENTRYTYPE_MACv4 is not subject to aging. For IPv4 multicast.
- * ENTRYTYPE_MACv6 is not subject to aging. For IPv6 multicast.
- */
-enum macaccess_entry_type {
-	ENTRYTYPE_NORMAL = 0,
-	ENTRYTYPE_LOCKED,
-	ENTRYTYPE_MACv4,
-	ENTRYTYPE_MACv6,
-};
-
 /* A (PGID) port mask structure, encoding the 2^ocelot->num_phys_ports
  * possibilities of egress port masks for L2 multicast traffic.
  * For a switch with 9 user ports, there are 512 possible port masks, but the
diff --git a/include/soc/mscc/ocelot.h b/include/soc/mscc/ocelot.h
index 682cd058096c..e6773f4d09ce 100644
--- a/include/soc/mscc/ocelot.h
+++ b/include/soc/mscc/ocelot.h
@@ -701,6 +701,25 @@ struct ocelot_skb_cb {
 	u8 ts_id;
 };
 
+/* MAC table entry types.
+ * ENTRYTYPE_NORMAL is subject to aging.
+ * ENTRYTYPE_LOCKED is not subject to aging.
+ * ENTRYTYPE_MACv4 is not subject to aging. For IPv4 multicast.
+ * ENTRYTYPE_MACv6 is not subject to aging. For IPv6 multicast.
+ */
+enum macaccess_entry_type {
+	ENTRYTYPE_NORMAL = 0,
+	ENTRYTYPE_LOCKED,
+	ENTRYTYPE_MACv4,
+	ENTRYTYPE_MACv6,
+};
+
+struct ocelot_mact_entry {
+	u8 mac[ETH_ALEN];
+	u16 vid;
+	enum macaccess_entry_type type;
+};
+
 #define OCELOT_SKB_CB(skb) \
 	((struct ocelot_skb_cb *)((skb)->cb))
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
