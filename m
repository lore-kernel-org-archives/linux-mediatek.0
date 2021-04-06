Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46C8C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:45:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F0D613A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51F0D613A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=94op6MTpum9P5Tf7F+GiHxxGVFHYmAlIg5tvozYPQos=; b=lINOYA8KVfg2oemyo968BONMFs
	G11QuMTiZWhY7MRmbjxSOSbcNAYiYjKUyYXpI8gvMKzS3U9ykaj1AOxTjYOWpyv2i5wLoZr95qFjK
	hNnlfoACT97JWcY6X9Ygm//oT5dNpo6Z1DEE4zGqeXhsQaK2ERV137TgN7XvwKT6ns1eehU+j1tOS
	W6eGM7ucIBJdEVh6vJwHb0aC73AokRF063koD8xtHmjtYqut/eqmT1vmTZjLixc68IYmekkxfuyLz
	5SkxNUm+aoCb6cpImLSchq6yz+z2KFdL6QRZPNaNO3uqafleuratTawemOaiG6QEYE9FSlyydjjYQ
	iuPx2A0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTceJ-001Mme-8P; Tue, 06 Apr 2021 03:45:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTceC-001MkK-PT
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 03:45:02 +0000
X-UUID: c88719b0560341eb9d66620fcc51c382-20210405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BAbdUBf+djMR6H99OYjbawr3SLNJdkQL+vBQ6Cs83Rw=; 
 b=cV/ojfsgRvZcsxfLuqDCTiv+CIRxwYAqURZE+t6xElNo4Kg9rjYoBEVPoYdKuFpX9ts4EbNbcv5Kz5VflpWmD8CIOK4oQgiLiiC8KdZj2MzWSYl0m7Z5GYdgYoLEg4Ro4AWBIQPeE/JHcOtZVVvWvxsgSHrEBHlUlTQZ/Io94SI=;
X-UUID: c88719b0560341eb9d66620fcc51c382-20210405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 294584839; Mon, 05 Apr 2021 20:44:43 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Apr 2021 20:34:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 11:34:40 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 6 Apr 2021 11:34:40 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/6] mt76: mt7921: fix inappropriate WoW setup with the
 missing ARP informaiton
Date: Tue, 6 Apr 2021 11:34:34 +0800
Message-ID: <4c5666ad0683e467f11ca4a4abb5be335be25696.1617679693.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_044501_265395_D63B7636 
X-CRM114-Status: GOOD (  13.15  )
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

Fix the Wake-on-WoWLAN failure should rely on ARP Information is being
updated in time to the firmware.

Fixes: ffa1bf97425b ("mt76: mt7921: introduce PM support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  3 ++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 44 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  3 ++
 3 files changed, 50 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 06a47cab494e..32b1cd0bca1f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -626,6 +626,9 @@ static void mt7921_bss_info_changed(struct ieee80211_hw *hw,
 	if (changed & BSS_CHANGED_ASSOC)
 		mt7921_bss_bcnft_apply(dev, vif, info->assoc);
 
+	if (changed & BSS_CHANGED_ARP_FILTER)
+		mt7921_mcu_update_arp_filter(hw, vif, info);
+
 	mt7921_mutex_release(dev);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 9283f9865ad5..353877f1c762 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1325,3 +1325,47 @@ mt7921_pm_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 		mt76_clear(dev, MT_WF_RFCR(0), MT_WF_RFCR_DROP_OTHER_BEACON);
 	}
 }
+
+int mt7921_mcu_update_arp_filter(struct ieee80211_hw *hw,
+				 struct ieee80211_vif *vif,
+				 struct ieee80211_bss_conf *info)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct mt7921_dev *dev = mt7921_hw_dev(hw);
+	struct sk_buff *skb;
+	int i, len = min_t(int, info->arp_addr_cnt,
+			   IEEE80211_BSS_ARP_ADDR_LIST_LEN);
+	struct {
+		struct {
+			u8 bss_idx;
+			u8 pad[3];
+		} __packed hdr;
+		struct mt76_connac_arpns_tlv arp;
+	} req_hdr = {
+		.hdr = {
+			.bss_idx = mvif->mt76.idx,
+		},
+		.arp = {
+			.tag = cpu_to_le16(UNI_OFFLOAD_OFFLOAD_ARP),
+			.len = cpu_to_le16(sizeof(struct mt76_connac_arpns_tlv)),
+			.ips_num = len,
+			.mode = 2,  /* update */
+			.option = 1,
+		},
+	};
+
+	skb = mt76_mcu_msg_alloc(&dev->mt76, NULL,
+				 sizeof(req_hdr) + len * sizeof(__be32));
+	if (!skb)
+		return -ENOMEM;
+
+	skb_put_data(skb, &req_hdr, sizeof(req_hdr));
+	for (i = 0; i < len; i++) {
+		u8 *addr = (u8 *)skb_put(skb, sizeof(__be32));
+
+		memcpy(addr, &info->arp_addr_list[i], sizeof(__be32));
+	}
+
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb, MCU_UNI_CMD_OFFLOAD,
+				     true);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 5cedefc41416..ebe51017dd55 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -348,4 +348,7 @@ int mt7921_mac_set_beacon_filter(struct mt7921_phy *phy,
 				 bool enable);
 void mt7921_pm_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif);
 void mt7921_coredump_work(struct work_struct *work);
+int mt7921_mcu_update_arp_filter(struct ieee80211_hw *hw,
+				 struct ieee80211_vif *vif,
+				 struct ieee80211_bss_conf *info);
 #endif
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
