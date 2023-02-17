Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD161C636D6
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yiO7+GfNtc3Ebf3kPnUIZB9WtVAk3tp78yo3RlgMNrg=; b=Y/hJsdrVQhSJNa/GdTb5fCYlhL
	CMHKRwfBNqfhn7ZKPCRWD4AtfavfqIgoOUHtC50aE58Xc7JcG1xWo8eJMk+fYUCODv7lENLpkVz5i
	vjvW7ngDqPt1NAGvEUPqQPY84KzdJtuGPjtBwEKsEpUjpHuO17fyEOMSyYVwSIY1mCnky9t6vjioa
	yRGY/MR6J/M5zkg3uz5rTN8Gd7xdb2piBJcwFi8n5FuvcV2WpSjd86LVgRu2rH3kzzKTKtwjr/R62
	ZNv/fRxQhmXS4+gx19n1VOmjnN8QUusVvA3FwDjEqjSVsotJZCozzsyddmZJO9K7e3yFkS6ATr4Pj
	uFBw5o1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT4sE-00FKJd-2C; Fri, 17 Feb 2023 17:50:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT4sB-00FKJ1-2F
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 17:50:16 +0000
X-UUID: 85bfe32aaeeb11eda08d4d6090ec5a5c-20230217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=yiO7+GfNtc3Ebf3kPnUIZB9WtVAk3tp78yo3RlgMNrg=;
	b=meJNoi7KXctbdHulsuh5XmVDxhy++m9SsdOe2O9M1K+u2XRuiQHSjRJpQK657q8BIwm90BuZOUbuU+bPjpBdFgjJ52pAx759O4l85DX5oW2xTVDde8Dc4W2DO8OhkgiUqMtIjwNe/E5M4qDqDPFcw/XzLOMbo6tyBnunr5h92bg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:4145a2c8-2b62-4a77-bdfe-0c89d805fc40,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:885ddb2,CLOUDID:88aa58f3-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 85bfe32aaeeb11eda08d4d6090ec5a5c-20230217
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1122310318; Fri, 17 Feb 2023 10:50:10 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.194) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 18 Feb 2023 01:50:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Sat, 18 Feb 2023 01:50:07 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/2] wifi: mac80211: introduce ieee80211_refresh_tx_agg_session_timer()
Date: Sat, 18 Feb 2023 01:50:05 +0800
Message-ID: <7c3f72eac1c34921cd84a462e60d71e125862152.1676616450.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_095015_130657_074544B7 
X-CRM114-Status: GOOD (  10.90  )
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

This allows low level drivers to refresh the tx agg session timer, based on
querying stats from the firmware usually. Especially for some mt76 devices
support .net_fill_forward_path would bypass mac80211, which leads to tx BA
session timeout for certain clients.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 include/net/mac80211.h | 12 ++++++++++++
 net/mac80211/agg-tx.c  | 17 +++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 76a12bec71d5..920ea31620cd 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -5993,6 +5993,18 @@ void ieee80211_queue_delayed_work(struct ieee80211_hw *hw,
 				  struct delayed_work *dwork,
 				  unsigned long delay);
 
+/**
+ * ieee80211_refresh_tx_agg_session_timer - Refresh a tx agg session timer.
+ * @sta: the station for which to start a BA session
+ * @tid: the TID to BA on.
+ *
+ * This function allows low level driver to refresh tx agg session timer
+ * to maintain BA session, the session level will still be managed by the
+ * mac80211.
+ */
+void ieee80211_refresh_tx_agg_session_timer(struct ieee80211_sta *sta,
+					    u16 tid);
+
 /**
  * ieee80211_start_tx_ba_session - Start a tx Block Ack session.
  * @sta: the station for which to start a BA session
diff --git a/net/mac80211/agg-tx.c b/net/mac80211/agg-tx.c
index f9514bacbd4a..3b651e7f5a73 100644
--- a/net/mac80211/agg-tx.c
+++ b/net/mac80211/agg-tx.c
@@ -554,6 +554,23 @@ void ieee80211_tx_ba_session_handle_start(struct sta_info *sta, int tid)
 	ieee80211_send_addba_with_timeout(sta, tid_tx);
 }
 
+void ieee80211_refresh_tx_agg_session_timer(struct ieee80211_sta *pubsta,
+					    u16 tid)
+{
+	struct sta_info *sta = container_of(pubsta, struct sta_info, sta);
+	struct tid_ampdu_tx *tid_tx;
+
+	if (WARN_ON_ONCE(tid >= IEEE80211_NUM_TIDS))
+		return;
+
+	tid_tx = rcu_dereference(sta->ampdu_mlme.tid_tx[tid]);
+	if (!tid_tx)
+		return;
+
+	tid_tx->last_tx = jiffies;
+}
+EXPORT_SYMBOL(ieee80211_refresh_tx_agg_session_timer);
+
 /*
  * After accepting the AddBA Response we activated a timer,
  * resetting it after each frame that we send.
-- 
2.18.0


