Return-Path: <SRS0=UFSY=QB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B3DC433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Nov 2021 15:03:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C82BC61075
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Nov 2021 15:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C82BC61075
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g+Fjwv2L7L8gpJPpZ6MpswcFcpwooZKp4ztxixGWF00=; b=q431qut6zHGQ9S
	OyJ2DTXOxx8/rPzc3gQ4v/hRtByu4zaFdnAFS2ZTFatS/scm/rN3vzdWRfqpolT+ovWLUFYJXvyW+
	rkHyn7ZQ+I4RpmVlpl3aFHziWETnxZTbjoRalHEi5vddM445+/wiQsRJsxQ1/SPbdYsbsB+1Vd6Yk
	odjZ1jmLSi8TaWnsHNY1pJNzlv54QUVlJQ7Kq9nc9d0XvWUqtQT9OUvvX5aPq0JP5w7nLmyRT6LmE
	Hx2vWoAarNAShUPj7BRClWKnrtYBvUjq59G1g2pf1tDYvq/DceIlqtb/zYDP6IIIMjCyczSFz9Mvu
	Z4LGSjpKHUekUeCk8mIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmH2I-00Dmca-RC; Sun, 14 Nov 2021 15:03:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmH2D-00Dmbo-6t
 for linux-mediatek@lists.infradead.org; Sun, 14 Nov 2021 15:03:12 +0000
X-UUID: 6d5f22beb0dd4abdb2e175559a214e57-20211114
X-UUID: 6d5f22beb0dd4abdb2e175559a214e57-20211114
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1748421287; Sun, 14 Nov 2021 08:03:00 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Nov 2021 07:02:59 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 14 Nov 2021 23:02:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 14 Nov 2021 23:02:45 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2] mt76: testmode: add support to set MAC
Date: Sun, 14 Nov 2021 22:59:09 +0800
Message-ID: <20211114145909.24817-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211114_070309_285647_1BC1F5AC 
X-CRM114-Status: GOOD (  14.56  )
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

Add support to set SA/DA/BSSID in testmode.
During mass production stage, some test scripts or test equipments need
to set fixed addresses to detect or parse if a test is passed.
Also, MAC setting is necessary for some tx/rx tests with rx filter,
to make sure rx site only receives expected packets.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
v2: use memcpy() for MAC due to potential alignment problem
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  2 ++
 drivers/net/wireless/mediatek/mt76/testmode.c | 36 +++++++++++++++++--
 drivers/net/wireless/mediatek/mt76/testmode.h |  4 +++
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e2da720..e7ced94 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -599,6 +599,8 @@ struct mt76_testmode_data {
 	u8 tx_power[4];
 	u8 tx_power_control;
 
+	u8 addr[3][ETH_ALEN];
+
 	u32 tx_pending;
 	u32 tx_queued;
 	u16 tx_queued_limit;
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.c b/drivers/net/wireless/mediatek/mt76/testmode.c
index 66afc2b..1a01ad7 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/testmode.c
@@ -126,9 +126,9 @@ int mt76_testmode_alloc_skb(struct mt76_phy *phy, u32 len)
 
 	hdr = __skb_put_zero(head, head_len);
 	hdr->frame_control = cpu_to_le16(fc);
-	memcpy(hdr->addr1, phy->macaddr, sizeof(phy->macaddr));
-	memcpy(hdr->addr2, phy->macaddr, sizeof(phy->macaddr));
-	memcpy(hdr->addr3, phy->macaddr, sizeof(phy->macaddr));
+	memcpy(hdr->addr1, td->addr[0], ETH_ALEN);
+	memcpy(hdr->addr2, td->addr[1], ETH_ALEN);
+	memcpy(hdr->addr3, td->addr[2], ETH_ALEN);
 	skb_set_queue_mapping(head, IEEE80211_AC_BE);
 
 	info = IEEE80211_SKB_CB(head);
@@ -318,6 +318,10 @@ mt76_testmode_init_defaults(struct mt76_phy *phy)
 	td->tx_count = 1;
 	td->tx_rate_mode = MT76_TM_TX_MODE_OFDM;
 	td->tx_rate_nss = 1;
+
+	memcpy(td->addr[0], phy->macaddr, ETH_ALEN);
+	memcpy(td->addr[1], phy->macaddr, ETH_ALEN);
+	memcpy(td->addr[2], phy->macaddr, ETH_ALEN);
 }
 
 static int
@@ -493,6 +497,20 @@ int mt76_testmode_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		}
 	}
 
+	if (tb[MT76_TM_ATTR_MAC_ADDRS]) {
+		struct nlattr *cur;
+		int idx = 0;
+		int rem;
+
+		nla_for_each_nested(cur, tb[MT76_TM_ATTR_MAC_ADDRS], rem) {
+			if (nla_len(cur) != ETH_ALEN || idx >= 3)
+				goto out;
+
+			memcpy(td->addr[idx], nla_data(cur), ETH_ALEN);
+			idx++;
+		}
+	}
+
 	if (dev->test_ops->set_params) {
 		err = dev->test_ops->set_params(phy, tb, state);
 		if (err)
@@ -635,6 +653,18 @@ int mt76_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *msg,
 		nla_nest_end(msg, a);
 	}
 
+	if (mt76_testmode_param_present(td, MT76_TM_ATTR_MAC_ADDRS)) {
+		a = nla_nest_start(msg, MT76_TM_ATTR_MAC_ADDRS);
+		if (!a)
+			goto out;
+
+		for (i = 0; i < 3; i++)
+			if (nla_put(msg, i, ETH_ALEN, td->addr[i]))
+				goto out;
+
+		nla_nest_end(msg, a);
+	}
+
 	err = 0;
 
 out:
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index d1f9c03..5e2792d 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -45,6 +45,8 @@
  * @MT76_TM_ATTR_TX_TIME: packet transmission time, in unit of us (u32)
  *
  * @MT76_TM_ATTR_DRV_DATA: driver specific netlink attrs (nested)
+ *
+ * @MT76_TM_ATTR_MAC_ADDRS: array of nested MAC addresses (nested)
  */
 enum mt76_testmode_attr {
 	MT76_TM_ATTR_UNSPEC,
@@ -81,6 +83,8 @@ enum mt76_testmode_attr {
 
 	MT76_TM_ATTR_DRV_DATA,
 
+	MT76_TM_ATTR_MAC_ADDRS,
+
 	/* keep last */
 	NUM_MT76_TM_ATTRS,
 	MT76_TM_ATTR_MAX = NUM_MT76_TM_ATTRS - 1,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
