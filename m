Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C08FEC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 21:14:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71E0360E93
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 21:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71E0360E93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OIS1+wtHzbZwO5KfY09lFw1dHSo7lPujfWLM19we6nU=; b=v8aQT5JDVztUcw
	1afaKl3h8mGX9coTzXksZ2WSROPJ9If59Q1vqtYojYVJv0ekYeN5WSpIDbuf+gXGrxAQa6sxiXnYL
	UyBSPJ7fSob7h7vqdq9QM1Z064TIWYwVl1KfxJCE6jtRAZVotHliQ8tN9UAYxmtCgGkZDMt81p5jK
	AvL9gZyr6q4ThazH1Zj4pfvGIgjz47PROepHCRNY0DyTXnPP5cXi2WyYrkUBkPNUtbcmIiWj4HOP6
	5u7VfQ6aznuyQjC9yIRNamZNMnpJlbtMT49lff7yd0N9W74qz990Sh22kCI01C2C5ZXfMtjpI43cX
	y3A/LYZ2TAn3FdXAxcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDCb3-0020mV-9i; Mon, 09 Aug 2021 21:14:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDCax-0020lm-6z
 for linux-mediatek@lists.infradead.org; Mon, 09 Aug 2021 21:14:08 +0000
X-UUID: 4b57805a8a8143edb2c58472af9584d9-20210809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ibvbcZ5w28LBZJRKKfZX5Em/VpIlyTIn075jyIdJAxQ=; 
 b=ll7/ysXlRuqxjWAGJOCVAC7GQMWVsKwc8bSXYAw+C3GC//vlC1Gze6I0KxbT8IcaKZUO7b8quAc5K2KEWIgDZC7ZVoy7oBE9ULJai/ela0Zy7ACz/VDIV5VFKLz/QXI0fO+VjuTr/CBF6mJUZV3d3YTEv4cPo2oMkKJaQtbn07Y=;
X-UUID: 4b57805a8a8143edb2c58472af9584d9-20210809
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1985646800; Mon, 09 Aug 2021 14:13:47 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 14:13:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 05:13:44 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 10 Aug 2021 05:13:44 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mt76: fix determining multicast frame in sta mode
Date: Tue, 10 Aug 2021 05:13:43 +0800
Message-ID: <fbc5d3da47b6a5e99ae255560279268f580e7b22.1628543190.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_141404_716321_0879DE2A 
X-CRM114-Status: GOOD (  13.97  )
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

From: Sean Wang <sean.wang@mediatek.com>

We should use hdr->addr3 as the destination address to determine the frame
is multicast frame or not when the device is running in sta mode.

We can simply use ieee80211_get_DA for ap mode and sta mode both cases.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Tested-by: Joshua Emele <jemele@chromium.org>
Tested-by: YN Chen <YN.Chen@mediatek.com>
---
v1: patch is generated on the top of mt76 with the additional patches
    [1/2] mt76: mt7915: send EAPOL frames at lowest rate
    [2/2] mt76: mt7921: send EAPOL frames at lowest rate
    [v2] mt76: add support for setting mcast rate
---
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index 3972c56136a2..be5f68485337 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -965,7 +965,7 @@ mt7603_mac_write_txwi(struct mt7603_dev *dev, __le32 *txwi,
 	val = FIELD_PREP(MT_TXD2_FRAME_TYPE, frame_type) |
 	      FIELD_PREP(MT_TXD2_SUB_TYPE, frame_subtype) |
 	      FIELD_PREP(MT_TXD2_MULTICAST,
-			 is_multicast_ether_addr(hdr->addr1));
+			 is_multicast_ether_addr(ieee80211_get_DA(hdr)));
 	txwi[2] = cpu_to_le32(val);
 
 	if (!(info->flags & IEEE80211_TX_CTL_AMPDU))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 5455231f5188..756b7c283a57 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -617,7 +617,7 @@ int mt7615_mac_write_txwi(struct mt7615_dev *dev, __le32 *txwi,
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_tx_rate *rate = &info->control.rates[0];
 	bool ext_phy = info->hw_queue & MT_TX_HW_QUEUE_EXT_PHY;
-	bool multicast = is_multicast_ether_addr(hdr->addr1);
+	bool multicast = is_multicast_ether_addr(ieee80211_get_DA(hdr));
 	struct ieee80211_vif *vif = info->control.vif;
 	bool is_mmio = mt76_is_mmio(&dev->mt76);
 	u32 val, sz_txd = is_mmio ? MT_TXD_SIZE : MT_USB_TXD_SIZE;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 975e81e09a70..8b9dd77968fa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -918,7 +918,7 @@ mt7915_mac_write_txwi_80211(struct mt7915_dev *dev, __le32 *txwi,
 	u8 fc_type, fc_stype;
 	u32 val;
 
-	*mcast = is_multicast_ether_addr(hdr->addr1);
+	*mcast = is_multicast_ether_addr(ieee80211_get_DA(hdr));
 
 	if (ieee80211_is_action(fc) &&
 	    mgmt->u.action.category == WLAN_CATEGORY_BACK &&
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 7c95189cf8cf..755a8777e47e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -663,7 +663,7 @@ mt7921_mac_write_txwi_80211(struct mt7921_dev *dev, __le32 *txwi,
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)skb->data;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
-	bool multicast = is_multicast_ether_addr(hdr->addr1);
+	bool multicast = is_multicast_ether_addr(ieee80211_get_DA(hdr));
 	u8 tid = skb->priority & IEEE80211_QOS_CTL_TID_MASK;
 	__le16 fc = hdr->frame_control;
 	u8 fc_type, fc_stype;
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
