Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371C7C43217
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 18:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rqSZTPHTzjvgQiKEtydX5Kmlo97LMyPbAHh98dxziY=; b=EAVrRKPS6gjfFPxTY+gOZjySVv
	l4YkAIFOczqkzcVjn9YrkwSRaiDnE7nhkycX3cfkmpSHNruDrspvbTzetXjhMay4ZqcnPlhc071R+
	MO9UIzpV9qZ72LgLVBeO2BF5i8UsfjCjxih4J2xqVSJM58W5jK2ytdRpP4jLQ6IPvgVgeo566Miht
	3YxL4cUq0Z/DJj4DabogpuAlLGuc63+/3dAER26yB6AVTlKZBe+v4/luEry4LugfYXZy5qDnVyAEL
	4YcRqpj5Ozk3kwicqXpDhKMwVFXRF54GPQ1SqVlZBi0JoMl+g6jSA8IDGy2rnEc94C660nqfX+COW
	wTyaYmlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7JM-00HLv9-NZ; Mon, 07 Nov 2022 18:57:32 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7HQ-00HKoe-3D; Mon, 07 Nov 2022 18:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/rqSZTPHTzjvgQiKEtydX5Kmlo97LMyPbAHh98dxziY=; b=QiNJ9y0CU7S6HdL+LIYEMgWcTJ
	9JXq+skySFZKj3nCqLYdcXlmbpMTWN/f/v1DfSDA3vEvK2QyTTaJ7j5K3f1BZQLo6LyOLqRq+g2cJ
	0m3pX8BBmsN/ccKmiS3Yp3Qd8O2kbfP7ANA0v6vnxJNir1PVjS6qf23bS4o6aSaZpo04=;
Received: from p200300daa72ee1007849d74f78949f6c.dip0.t-ipconnect.de ([2003:da:a72e:e100:7849:d74f:7894:9f6c] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1os7HC-000LCc-Ol; Mon, 07 Nov 2022 19:55:18 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] net: ethernet: mediatek: ppe: assign per-port queues for offloaded traffic
Date: Mon,  7 Nov 2022 19:54:44 +0100
Message-Id: <20221107185452.90711-6-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107185452.90711-1-nbd@nbd.name>
References: <20221107185452.90711-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_105532_156436_A39E287E 
X-CRM114-Status: GOOD (  13.77  )
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

Keeps traffic sent to the switch within link speed limits

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_ppe.c        | 18 ++++++++++++++++++
 drivers/net/ethernet/mediatek/mtk_ppe.h        |  4 ++++
 .../net/ethernet/mediatek/mtk_ppe_offload.c    | 12 +++++++++---
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
index 3ee2bf53f9e5..96ad0a9b79b4 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
@@ -399,6 +399,24 @@ int mtk_foe_entry_set_wdma(struct mtk_eth *eth, struct mtk_foe_entry *entry,
 	return 0;
 }
 
+int mtk_foe_entry_set_queue(struct mtk_eth *eth, struct mtk_foe_entry *entry,
+			    unsigned int queue)
+{
+	u32 *ib2 = mtk_foe_entry_ib2(eth, entry);
+
+	if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
+		*ib2 &= ~MTK_FOE_IB2_QID_V2;
+		*ib2 |= FIELD_PREP(MTK_FOE_IB2_QID_V2, queue);
+		*ib2 |= MTK_FOE_IB2_PSE_QOS_V2;
+	} else {
+		*ib2 &= ~MTK_FOE_IB2_QID;
+		*ib2 |= FIELD_PREP(MTK_FOE_IB2_QID, queue);
+		*ib2 |= MTK_FOE_IB2_PSE_QOS;
+	}
+
+	return 0;
+}
+
 static bool
 mtk_flow_entry_match(struct mtk_eth *eth, struct mtk_flow_entry *entry,
 		     struct mtk_foe_entry *data)
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.h b/drivers/net/ethernet/mediatek/mtk_ppe.h
index 0b7a67a958e4..be635864bb96 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe.h
+++ b/drivers/net/ethernet/mediatek/mtk_ppe.h
@@ -68,7 +68,9 @@ enum {
 #define MTK_FOE_IB2_DSCP		GENMASK(31, 24)
 
 /* CONFIG_MEDIATEK_NETSYS_V2 */
+#define MTK_FOE_IB2_QID_V2			GENMASK(6, 0)
 #define MTK_FOE_IB2_PORT_MG_V2		BIT(7)
+#define MTK_FOE_IB2_PSE_QOS_V2		BIT(8)
 #define MTK_FOE_IB2_DEST_PORT_V2	GENMASK(12, 9)
 #define MTK_FOE_IB2_MULTICAST_V2	BIT(13)
 #define MTK_FOE_IB2_WDMA_WINFO_V2	BIT(19)
@@ -350,6 +352,8 @@ int mtk_foe_entry_set_pppoe(struct mtk_eth *eth, struct mtk_foe_entry *entry,
 			    int sid);
 int mtk_foe_entry_set_wdma(struct mtk_eth *eth, struct mtk_foe_entry *entry,
 			   int wdma_idx, int txq, int bss, int wcid);
+int mtk_foe_entry_set_queue(struct mtk_eth *eth, struct mtk_foe_entry *entry,
+			    unsigned int queue);
 int mtk_foe_entry_commit(struct mtk_ppe *ppe, struct mtk_flow_entry *entry);
 void mtk_foe_entry_clear(struct mtk_ppe *ppe, struct mtk_flow_entry *entry);
 int mtk_foe_entry_idle_time(struct mtk_ppe *ppe, struct mtk_flow_entry *entry);
diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 28bbd1df3e30..81afd5ee3fbf 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -188,7 +188,7 @@ mtk_flow_set_output_device(struct mtk_eth *eth, struct mtk_foe_entry *foe,
 			   int *wed_index)
 {
 	struct mtk_wdma_info info = {};
-	int pse_port, dsa_port;
+	int pse_port, dsa_port, queue;
 
 	if (mtk_flow_get_wdma_info(dev, dest_mac, &info) == 0) {
 		mtk_foe_entry_set_wdma(eth, foe, info.wdma_idx, info.queue,
@@ -212,8 +212,6 @@ mtk_flow_set_output_device(struct mtk_eth *eth, struct mtk_foe_entry *foe,
 	}
 
 	dsa_port = mtk_flow_get_dsa_port(&dev);
-	if (dsa_port >= 0)
-		mtk_foe_entry_set_dsa(eth, foe, dsa_port);
 
 	if (dev == eth->netdev[0])
 		pse_port = 1;
@@ -222,6 +220,14 @@ mtk_flow_set_output_device(struct mtk_eth *eth, struct mtk_foe_entry *foe,
 	else
 		return -EOPNOTSUPP;
 
+	if (dsa_port >= 0) {
+		mtk_foe_entry_set_dsa(eth, foe, dsa_port);
+		queue = 3 + dsa_port;
+	} else {
+		queue = pse_port - 1;
+	}
+	mtk_foe_entry_set_queue(eth, foe, queue);
+
 out:
 	mtk_foe_entry_set_pse_port(eth, foe, pse_port);
 
-- 
2.38.1


