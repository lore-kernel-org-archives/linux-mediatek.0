Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B64C47082
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 17:01:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BC27601FA
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 17:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BC27601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b5Icelwjcov5ycNjMrbEJHI5p1kf3Q6VlkhFLjw7en4=; b=cBbjIhgpTy+PIj
	8VuWvdYBm8zU9lhrRPmMI0x8NwwfqEYkVzxkxbhhUjUQrzkEi+nk7kxKMpMrq5m/6V7x8zdB1alKp
	MrCCvBbXJP0kLIhT952ew0rIWYY9p5dQQDREzGslorTVomtDtjUjAe4YvS12rSLYQQI1BDC9OkB+t
	mTHD+a2FtDoQtxKFJPvExvzojTyu4JPQ40Mn1d15wWU6qtx/vS50eGEgXOJ2sTL8ruvsZUD0MM3Qd
	yI0QOQ8WI/tYIynPICGZBuXcA27FsDRGEIW+TlCWzN1KSn/YhComL2plDZwMaB6ByMIY36HGZXpWh
	FuYRG1uAfk66ud6UJMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnlIE-00Cv0A-8Y; Mon, 31 May 2021 17:01:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnlIB-00CuzZ-Gq
 for linux-mediatek@lists.infradead.org; Mon, 31 May 2021 17:01:33 +0000
X-UUID: 9038f91077bc45b2a2f6f8cd918ab3b8-20210531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EwpM8H/IPflCkPycDbF0tzYtKSC8bkjd2oWLhJX5LJs=; 
 b=LCm9Djrbkq7hUZNDNlgHK81/itHgx/3kJ+JLrL6BUFQp3BuX/0FeMT+EJ/fSvF3cz74vo5IrodHYKu7FYEqWqq3ptrs1S04J6VgQfi8grujgafvP46l4M6X5X1HWa6oJQIU0vFe6Y7n2ZD8PL8y7kMh470AE7cb9TP48QxQDNGU=;
X-UUID: 9038f91077bc45b2a2f6f8cd918ab3b8-20210531
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 461698853; Mon, 31 May 2021 10:01:27 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 10:01:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 01:01:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Jun 2021 01:01:24 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 <jemele@google.com>, <yenlinlai@google.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH v2] mt76: mt7921: enable random mac address during sched_scan
Date: Tue, 1 Jun 2021 01:01:22 +0800
Message-ID: <28147493241281fa1d272a93428fe470118a5f81.1622480119.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_100131_595716_72D43440 
X-CRM114-Status: GOOD (  11.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Deren Wu <deren.wu@mediatek.com>

Enable src address randomization during scheduled scanning

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
change since v2: update contributor info
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   | 14 ++++++++------
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h   |  4 +++-
 drivers/net/wireless/mediatek/mt76/mt7921/init.c   |  3 ++-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 73359defa176..b155e7b8d89d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1515,14 +1515,16 @@ int mt76_connac_mcu_sched_scan_req(struct mt76_phy *phy,
 	req->version = 1;
 	req->seq_num = mvif->scan_seq_num | ext_phy << 7;
 
-	if (is_mt7663(phy->dev) &&
-	    (sreq->flags & NL80211_SCAN_FLAG_RANDOM_ADDR)) {
-		get_random_mask_addr(req->mt7663.random_mac, sreq->mac_addr,
-				     sreq->mac_addr_mask);
+	if (sreq->flags & NL80211_SCAN_FLAG_RANDOM_ADDR) {
+		u8 *addr = is_mt7663(phy->dev) ? req->mt7663.random_mac
+					       : req->mt7921.random_mac;
+
 		req->scan_func = 1;
-	} else if (is_mt7921(phy->dev)) {
-		req->mt7921.bss_idx = mvif->idx;
+		get_random_mask_addr(addr, sreq->mac_addr,
+				     sreq->mac_addr_mask);
 	}
+	if (is_mt7921(phy->dev))
+		req->mt7921.bss_idx = mvif->idx;
 
 	req->ssids_num = sreq->n_ssids;
 	for (i = 0; i < req->ssids_num; i++) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index d64b8058b744..3076417ead5f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -779,7 +779,9 @@ struct mt76_connac_sched_scan_req {
 		} mt7663;
 		struct {
 			u8 bss_idx;
-			u8 pad2[63];
+			u8 pad2[19];
+			u8 random_mac[ETH_ALEN];
+			u8 pad3[38];
 		} mt7921;
 	};
 } __packed;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 59da29032645..19ce9ca72542 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -76,7 +76,8 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	wiphy->flags |= WIPHY_FLAG_HAS_CHANNEL_SWITCH;
 	wiphy->reg_notifier = mt7921_regd_notifier;
 
-	wiphy->features |= NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
+	wiphy->features |= NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR |
+			   NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
 	wiphy_ext_feature_set(wiphy, NL80211_EXT_FEATURE_SET_SCAN_DWELL);
 
 	ieee80211_hw_set(hw, SINGLE_SCAN_ON_ALL_BANDS);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
