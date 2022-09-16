Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FBFECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 14:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4LVjjoBtKIVD5H3vawJme1nq7gxmF4DCA9ujlSFbYU0=; b=33hci6QngDnlSURaXOSa9Zpl+9
	h7MG6ecOx6dE6CynTNDfMcICkhI/FmhDhRHGetpKVXJ6EyzNzK1FBZNM3YbFNDJayawrBBfVX3sVJ
	tFdxwNwsp3R+uK6jBxwuIv9b+vflp+Uq5UffSx6K9/wehGL2UwZPvMOVQu33iqQNWdj6J2YiEYRgb
	+1uyic6VnaeJ6zYCdvCbLigJnJpEkDIQ8EZTjGmAPsCyBalMP5XffsPmY0/nQ9z2HCCDyL76RLdhc
	RwkOaJiFxLrWT7IQksHi0egWhUrIPpRYxy9SmqI87cCmEUdWFjAl7Sg4urvUc6LzLwXFO8YlxGvhl
	b5or9m3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZCUv-00EGJb-Lj; Fri, 16 Sep 2022 14:39:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZCUs-00EGHd-S0
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 14:39:16 +0000
X-UUID: 03eee4a6e747497aa6769f4856269a6b-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4LVjjoBtKIVD5H3vawJme1nq7gxmF4DCA9ujlSFbYU0=;
	b=K+yy8oMIwAhhl/2fgQRxyebs7QACwu3OPDdgNyORbYL7vS8+q83qo07y2MAyrPlKZAMNgcqFuW9LvODNRc25sZby5VmMSx6uDKO5RGvf7fewiQGGcT6JyAECKVqrNkR4TIUx2Az+SEzmnhWCErX+1rnyCN2bsktH7GhCsb8Myvw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:402041a5-9df0-489d-ac9d-9e17c3b3e84b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:dd5deb5d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 03eee4a6e747497aa6769f4856269a6b-20220916
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1417107661; Fri, 16 Sep 2022 07:37:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 22:27:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Sep 2022 22:27:18 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH v2] wifi: mac80211: fix decapsulation offload flag for WDS interface
Date: Fri, 16 Sep 2022 22:27:07 +0800
Message-ID: <20220916142707.28478-1-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_073914_942459_6B05CE11 
X-CRM114-Status: UNSURE (   8.98  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rx decapsulation offload cannot be enabled on WDS interface since its
offload_flags is not configured. Its offload_flags shall be configured
by checking hardware information.

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
v2:
   - Configure offload_flags in ieee80211_check_fast_rx
   - Update commit message
---
 net/mac80211/rx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index a57811372027..0d8cfe34b088 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -4433,6 +4433,16 @@ void ieee80211_check_fast_rx(struct sta_info *sta)
 	if (!test_sta_flag(sta, WLAN_STA_AUTHORIZED))
 		goto clear;
 
+	if (ieee80211_hw_check(&local->hw, SUPPORTS_RX_DECAP_OFFLOAD)) {
+		sdata->vif.offload_flags |= IEEE80211_OFFLOAD_DECAP_ENABLED;
+
+		if (local->monitors &&
+		    !ieee80211_hw_check(&local->hw, SUPPORTS_CONC_MON_RX_DECAP))
+			sdata->vif.offload_flags &= ~IEEE80211_OFFLOAD_DECAP_ENABLED;
+	} else {
+		sdata->vif.offload_flags &= ~IEEE80211_OFFLOAD_DECAP_ENABLED;
+	}
+
 	rcu_read_lock();
 	key = rcu_dereference(sta->ptk[sta->ptk_idx]);
 	if (!key)
-- 
2.18.0


