Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EB3C87FC5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 06:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T886H/dnZdUeqCXioJKPFF7Rj/tJtdjMOt5YLUblaQc=; b=qQUt3tpPe2YOFR7cQmzzs40QdM
	pXkaoBycXdw1bJ/t48YnhqQJkD8RhUca8SzeT/QBXGe5wajYTfNyYj2ykdRO4wmnNvwwLV7pKVIFQ
	2VXN8dKqXMiqCg/8ty5pQ+dB/B7HGN8T+VLe8hVfgJXzdAru3WECAHFQorupmBDTuDFlftTrEu6BB
	gYORUaNw0MUEY1lTWX8yXhVX1Zsl9YMwKLH/nvZ6MH/+HHMjG1NX+SjIdNjPc+SEL1yCVQvRlJAJK
	uLOXjTcsb05AzCKJfW/wx+ZFsoKl9b0A/tuqlUVFlsLiSUomQe74POsUYaZbnUWMz1NQdbPnx5v6c
	T98zt0cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udkQG-0000000GQx1-0KEq;
	Mon, 21 Jul 2025 06:54:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udkNc-0000000GQdy-4BXm
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Jul 2025 06:52:10 +0000
X-UUID: 368adfa865ff11f09f706fa2197c6ceb-20250720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=T886H/dnZdUeqCXioJKPFF7Rj/tJtdjMOt5YLUblaQc=;
	b=hEFs2fH8FomEC3A8rqgqsOiMs5oRWSaZFgUWItNNzoTuuGjD9f/ZEIw3QkejrnsXi1rcg2EhdKEvgesR8EjqCY8p91Wix0ZEEoLzvkhGwotdVNFYE+dwbM73a9FNpcmP3Hmgq/nMIswpbnQshyR42oo8++KxlfFlOPODvtfnmmM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:adec1b16-fb59-4a54-9107-e1aa0ebc3ae4,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:a6a53a73-f565-4a89-86be-304708e7ad47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 368adfa865ff11f09f706fa2197c6ceb-20250720
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1897143141; Sun, 20 Jul 2025 23:52:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Jul 2025 14:52:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Jul 2025 14:52:01 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: report "link_id" to upper layer when receiving unexpected frame
Date: Mon, 21 Jul 2025 14:51:59 +0800
Message-ID: <20250721065159.1740992-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_235209_048154_D105BD4F 
X-CRM114-Status: GOOD (  11.60  )
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

The upper layer may require the "link_id" to properly handle
unexpected frames. For instance, if hostap, operating as an
AP MLD, receives a data frame from a non-associated STA,
it must send deauthentication to the link on which the STA is
operating.

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
Reviewed-by: Money Wang <money.wang@mediatek.com>
---
 include/net/cfg80211.h | 10 ++++++----
 net/mac80211/rx.c      | 10 +++++-----
 net/wireless/nl80211.c | 22 ++++++++++++----------
 net/wireless/trace.h   | 17 ++++++++++-------
 4 files changed, 33 insertions(+), 26 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 44a1055a81ba..406626ff6cc8 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -9048,6 +9048,7 @@ void cfg80211_pmksa_candidate_notify(struct net_device *dev, int index,
 /**
  * cfg80211_rx_spurious_frame - inform userspace about a spurious frame
  * @dev: The device the frame matched to
+ * @link_id: the link the frame was received on, -1 if not applicable or unknown
  * @addr: the transmitter address
  * @gfp: context flags
  *
@@ -9057,13 +9058,14 @@ void cfg80211_pmksa_candidate_notify(struct net_device *dev, int index,
  * Return: %true if the frame was passed to userspace (or this failed
  * for a reason other than not having a subscription.)
  */
-bool cfg80211_rx_spurious_frame(struct net_device *dev,
-				const u8 *addr, gfp_t gfp);
+bool cfg80211_rx_spurious_frame(struct net_device *dev, const u8 *addr,
+				int link_id, gfp_t gfp);
 
 /**
  * cfg80211_rx_unexpected_4addr_frame - inform about unexpected WDS frame
  * @dev: The device the frame matched to
  * @addr: the transmitter address
+ * @link_id: the link the frame was received on, -1 if not applicable or unknown
  * @gfp: context flags
  *
  * This function is used in AP mode (only!) to inform userspace that
@@ -9073,8 +9075,8 @@ bool cfg80211_rx_spurious_frame(struct net_device *dev,
  * Return: %true if the frame was passed to userspace (or this failed
  * for a reason other than not having a subscription.)
  */
-bool cfg80211_rx_unexpected_4addr_frame(struct net_device *dev,
-					const u8 *addr, gfp_t gfp);
+bool cfg80211_rx_unexpected_4addr_frame(struct net_device *dev, const u8 *addr,
+					int link_id, gfp_t gfp);
 
 /**
  * cfg80211_probe_status - notify userspace about probe status
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 2ac8ccb838ff..1e2b6336f443 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -1532,9 +1532,8 @@ ieee80211_rx_h_check(struct ieee80211_rx_data *rx)
 		}
 
 		if (rx->sdata->vif.type == NL80211_IFTYPE_AP &&
-		    cfg80211_rx_spurious_frame(rx->sdata->dev,
-					       hdr->addr2,
-					       GFP_ATOMIC))
+		    cfg80211_rx_spurious_frame(rx->sdata->dev, hdr->addr2,
+					       rx->link_id, GFP_ATOMIC))
 			return RX_DROP_U_SPURIOUS;
 
 		return RX_DROP;
@@ -1872,7 +1871,7 @@ ieee80211_rx_h_sta_process(struct ieee80211_rx_data *rx)
 			if (!test_and_set_sta_flag(sta, WLAN_STA_4ADDR_EVENT))
 				cfg80211_rx_unexpected_4addr_frame(
 					rx->sdata->dev, sta->sta.addr,
-					GFP_ATOMIC);
+					rx->link_id, GFP_ATOMIC);
 			return RX_DROP_U_UNEXPECTED_4ADDR_FRAME;
 		}
 		/*
@@ -3191,7 +3190,8 @@ ieee80211_rx_h_data(struct ieee80211_rx_data *rx)
 		if (rx->sta &&
 		    !test_and_set_sta_flag(rx->sta, WLAN_STA_4ADDR_EVENT))
 			cfg80211_rx_unexpected_4addr_frame(
-				rx->sdata->dev, rx->sta->sta.addr, GFP_ATOMIC);
+				rx->sdata->dev, rx->sta->sta.addr, rx->link_id,
+				GFP_ATOMIC);
 		return RX_DROP;
 	}
 
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 1c808b08b747..b4bf44768dc8 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -19755,7 +19755,7 @@ void cfg80211_conn_failed(struct net_device *dev, const u8 *mac_addr,
 EXPORT_SYMBOL(cfg80211_conn_failed);
 
 static bool __nl80211_unexpected_frame(struct net_device *dev, u8 cmd,
-				       const u8 *addr, gfp_t gfp)
+				       const u8 *addr, int link_id, gfp_t gfp)
 {
 	struct wireless_dev *wdev = dev->ieee80211_ptr;
 	struct cfg80211_registered_device *rdev = wiphy_to_rdev(wdev->wiphy);
@@ -19778,7 +19778,9 @@ static bool __nl80211_unexpected_frame(struct net_device *dev, u8 cmd,
 
 	if (nla_put_u32(msg, NL80211_ATTR_WIPHY, rdev->wiphy_idx) ||
 	    nla_put_u32(msg, NL80211_ATTR_IFINDEX, dev->ifindex) ||
-	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, addr))
+	    nla_put(msg, NL80211_ATTR_MAC, ETH_ALEN, addr) ||
+	    (link_id >= 0 &&
+	     nla_put_u8(msg, NL80211_ATTR_MLO_LINK_ID, link_id)))
 		goto nla_put_failure;
 
 	genlmsg_end(msg, hdr);
@@ -19790,13 +19792,13 @@ static bool __nl80211_unexpected_frame(struct net_device *dev, u8 cmd,
 	return true;
 }
 
-bool cfg80211_rx_spurious_frame(struct net_device *dev,
-				const u8 *addr, gfp_t gfp)
+bool cfg80211_rx_spurious_frame(struct net_device *dev, const u8 *addr,
+				int link_id, gfp_t gfp)
 {
 	struct wireless_dev *wdev = dev->ieee80211_ptr;
 	bool ret;
 
-	trace_cfg80211_rx_spurious_frame(dev, addr);
+	trace_cfg80211_rx_spurious_frame(dev, addr, link_id);
 
 	if (WARN_ON(wdev->iftype != NL80211_IFTYPE_AP &&
 		    wdev->iftype != NL80211_IFTYPE_P2P_GO)) {
@@ -19804,19 +19806,19 @@ bool cfg80211_rx_spurious_frame(struct net_device *dev,
 		return false;
 	}
 	ret = __nl80211_unexpected_frame(dev, NL80211_CMD_UNEXPECTED_FRAME,
-					 addr, gfp);
+					 addr, link_id, gfp);
 	trace_cfg80211_return_bool(ret);
 	return ret;
 }
 EXPORT_SYMBOL(cfg80211_rx_spurious_frame);
 
-bool cfg80211_rx_unexpected_4addr_frame(struct net_device *dev,
-					const u8 *addr, gfp_t gfp)
+bool cfg80211_rx_unexpected_4addr_frame(struct net_device *dev, const u8 *addr,
+					int link_id, gfp_t gfp)
 {
 	struct wireless_dev *wdev = dev->ieee80211_ptr;
 	bool ret;
 
-	trace_cfg80211_rx_unexpected_4addr_frame(dev, addr);
+	trace_cfg80211_rx_unexpected_4addr_frame(dev, addr, link_id);
 
 	if (WARN_ON(wdev->iftype != NL80211_IFTYPE_AP &&
 		    wdev->iftype != NL80211_IFTYPE_P2P_GO &&
@@ -19826,7 +19828,7 @@ bool cfg80211_rx_unexpected_4addr_frame(struct net_device *dev,
 	}
 	ret = __nl80211_unexpected_frame(dev,
 					 NL80211_CMD_UNEXPECTED_4ADDR_FRAME,
-					 addr, gfp);
+					 addr, link_id, gfp);
 	trace_cfg80211_return_bool(ret);
 	return ret;
 }
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index a07d88d61bec..34c584a215e5 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -3570,27 +3570,30 @@ TRACE_EVENT(cfg80211_cac_event,
 );
 
 DECLARE_EVENT_CLASS(cfg80211_rx_evt,
-	TP_PROTO(struct net_device *netdev, const u8 *addr),
-	TP_ARGS(netdev, addr),
+	TP_PROTO(struct net_device *netdev, const u8 *addr, int link_id),
+	TP_ARGS(netdev, addr, link_id),
 	TP_STRUCT__entry(
 		NETDEV_ENTRY
 		MAC_ENTRY(addr)
+		__field(int, link_id)
 	),
 	TP_fast_assign(
 		NETDEV_ASSIGN;
 		MAC_ASSIGN(addr, addr);
+		__entry->link_id = link_id;
 	),
-	TP_printk(NETDEV_PR_FMT ", %pM", NETDEV_PR_ARG, __entry->addr)
+	TP_printk(NETDEV_PR_FMT ", %pM, link_id:%d", NETDEV_PR_ARG,
+		  __entry->addr, __entry->link_id)
 );
 
 DEFINE_EVENT(cfg80211_rx_evt, cfg80211_rx_spurious_frame,
-	TP_PROTO(struct net_device *netdev, const u8 *addr),
-	TP_ARGS(netdev, addr)
+	TP_PROTO(struct net_device *netdev, const u8 *addr, int link_id),
+	TP_ARGS(netdev, addr, link_id)
 );
 
 DEFINE_EVENT(cfg80211_rx_evt, cfg80211_rx_unexpected_4addr_frame,
-	TP_PROTO(struct net_device *netdev, const u8 *addr),
-	TP_ARGS(netdev, addr)
+	TP_PROTO(struct net_device *netdev, const u8 *addr, int link_id),
+	TP_ARGS(netdev, addr, link_id)
 );
 
 TRACE_EVENT(cfg80211_ibss_joined,
-- 
2.25.1


