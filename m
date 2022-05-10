Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955BFC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 09:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pvfdlQplMy049QOvpMaozbDr4QMwd2UZhhH76nQY/Fw=; b=XcF4eeQjkuzmAy
	F4k4obKfU7vXYOgk94w/cgUUS1oFandbdt3da7UhH64yv1+b9wooHgrYA6rI+jPW+N42TGE+UaVhm
	X6MEaWyvgBbLHyHH8VAPukgYhH0JPcFY6NHVGJbYyp1+byUgaQMXMnh+hXNz4dOAQe3jx/A9aN0YP
	J2wzstbZaQxH6iG6M+SCUjS7JwgbTVYj3/vW84iPW2eO4RAMoxm8U8wfZyD865VB1cKBg0NW0BwTe
	YtBqsz6MdDeo1wstvCau7U9Lu6effyDik6S3s6LG8MYdkz2by1oHa4ctofchM/er06uYEBpmuDgvU
	FUxMr9S7cCydkZbZuKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noMdn-0011Xd-Iq; Tue, 10 May 2022 09:58:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noMdF-0011Df-RM
 for linux-mediatek@lists.infradead.org; Tue, 10 May 2022 09:58:19 +0000
X-UUID: 6d560351313e4c9ab3dbc13f697efe3a-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:7d4d5ebd-4ac8-4b34-9637-c8a44484844c, OB:0,
 LO
 B:0,IP:0,URL:38,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:18
X-CID-META: VersionHash:faefae9, CLOUDID:107fe516-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6d560351313e4c9ab3dbc13f697efe3a-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 965398331; Tue, 10 May 2022 02:58:09 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 02:51:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 17:51:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 10 May 2022 17:51:34 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, "Ming
 Yen Hsieh" <mingyen.hsieh@mediatek.com>
Subject: [PATCH] mt76: mt7921: add ipv6 NS offload support
Date: Tue, 10 May 2022 17:51:06 +0800
Message-ID: <fcc11cde6d1303984e1b6184a4b67caa56576a5e.1652172509.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_025817_958445_E6E02B06 
X-CRM114-Status: GOOD (  18.66  )
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

Add ipv6 NS offload for WoWLAN state.

Tested in this way:
1. Put device-A into WoW state.
2. ping6 from device-B to device-A.
3. In sniffer, see Neighbour advertisement from device-A.

Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  4 ++
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 26 +++++++
 .../net/wireless/mediatek/mt76/mt7921/main.c  | 67 ++++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 44 ++++++++++++
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  8 +++
 5 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index f9e1255bd9c7..4a8675634f80 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -264,6 +264,10 @@ int mt7921_register_device(struct mt7921_dev *dev)
 	INIT_DELAYED_WORK(&dev->mphy.mac_work, mt7921_mac_work);
 	INIT_DELAYED_WORK(&dev->phy.scan_work, mt7921_scan_work);
 	INIT_DELAYED_WORK(&dev->coredump.work, mt7921_coredump_work);
+#if IS_ENABLED(CONFIG_IPV6)
+	INIT_WORK(&dev->ipv6_ns_work, mt7921_set_ipv6_ns_work);
+	skb_queue_head_init(&dev->ipv6_ns_list);
+#endif
 	skb_queue_head_init(&dev->phy.scan_event_list);
 	skb_queue_head_init(&dev->coredump.msg_list);
 	INIT_LIST_HEAD(&dev->sta_poll_list);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index e67c3d17d36c..a630ddbf19e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -1726,3 +1726,29 @@ bool mt7921_usb_sdio_tx_status_data(struct mt76_dev *mdev, u8 *update)
 	return false;
 }
 EXPORT_SYMBOL_GPL(mt7921_usb_sdio_tx_status_data);
+
+#if IS_ENABLED(CONFIG_IPV6)
+void mt7921_set_ipv6_ns_work(struct work_struct *work)
+{
+	struct mt7921_dev *dev = container_of(work, struct mt7921_dev,
+						ipv6_ns_work);
+	struct sk_buff *skb;
+	int ret = 0;
+
+	do {
+		skb = skb_dequeue(&dev->ipv6_ns_list);
+
+		if (!skb)
+			break;
+
+		mt7921_mutex_acquire(dev);
+		ret = mt76_mcu_skb_send_msg(&dev->mt76, skb,
+					    MCU_UNI_CMD(OFFLOAD), true);
+		mt7921_mutex_release(dev);
+
+	} while (!ret);
+
+	if (ret)
+		skb_queue_purge(&dev->ipv6_ns_list);
+}
+#endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index e3db08e3a79f..6aeb72ae7d10 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -5,6 +5,7 @@
 #include <linux/platform_device.h>
 #include <linux/pci.h>
 #include <linux/module.h>
+#include <net/ipv6.h>
 #include "mt7921.h"
 #include "mcu.h"
 
@@ -1332,7 +1333,7 @@ static int mt7921_suspend(struct ieee80211_hw *hw,
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
-					    mt76_connac_mcu_set_suspend_iter,
+					    mt7921_mcu_set_suspend_iter,
 					    &dev->mphy);
 
 	mt7921_mutex_release(dev);
@@ -1407,6 +1408,67 @@ static void mt7921_sta_set_decap_offload(struct ieee80211_hw *hw,
 					     MCU_UNI_CMD(STA_REC_UPDATE));
 }
 
+#if IS_ENABLED(CONFIG_IPV6)
+static void mt7921_ipv6_addr_change(struct ieee80211_hw *hw,
+				    struct ieee80211_vif *vif,
+				    struct inet6_dev *idev)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct mt7921_dev *dev = mvif->phy->dev;
+	struct inet6_ifaddr *ifa;
+	struct in6_addr ns_addrs[IEEE80211_BSS_ARP_ADDR_LIST_LEN];
+	struct sk_buff *skb;
+	u8 i, idx = 0;
+
+	struct {
+		struct {
+			u8 bss_idx;
+			u8 pad[3];
+		} __packed hdr;
+		struct mt76_connac_arpns_tlv arpns;
+	} req_hdr = {
+		.hdr = {
+			.bss_idx = mvif->mt76.idx,
+		},
+		.arpns = {
+			.tag = cpu_to_le16(UNI_OFFLOAD_OFFLOAD_ND),
+			.mode = 2,  /* update */
+			.option = 1, /* update only */
+		},
+	};
+
+	read_lock_bh(&idev->lock);
+	list_for_each_entry(ifa, &idev->addr_list, if_list) {
+		if (ifa->flags & IFA_F_TENTATIVE)
+			continue;
+		ns_addrs[idx] = ifa->addr;
+		if (++idx >= IEEE80211_BSS_ARP_ADDR_LIST_LEN)
+			break;
+	}
+	read_unlock_bh(&idev->lock);
+
+	if (!idx)
+		return;
+
+	skb = mt76_mcu_msg_alloc(&dev->mt76, NULL, sizeof(req_hdr) +
+		idx * sizeof(struct in6_addr));
+	if (!skb)
+		return;
+
+	req_hdr.arpns.ips_num = idx;
+	req_hdr.arpns.len = cpu_to_le16(sizeof(struct mt76_connac_arpns_tlv)
+					+ idx * sizeof(struct in6_addr));
+	skb_put_data(skb, &req_hdr, sizeof(req_hdr));
+
+	for (i = 0; i < idx; i++)
+		skb_put_data(skb, &ns_addrs[i].in6_u, sizeof(struct in6_addr));
+
+	skb_queue_tail(&dev->ipv6_ns_list, skb);
+
+	ieee80211_queue_work(dev->mt76.hw, &dev->ipv6_ns_work);
+}
+#endif
+
 static int mt7921_set_sar_specs(struct ieee80211_hw *hw,
 				const struct cfg80211_sar_specs *sar)
 {
@@ -1452,6 +1514,9 @@ const struct ieee80211_ops mt7921_ops = {
 	.sta_pre_rcu_remove = mt76_sta_pre_rcu_remove,
 	.set_key = mt7921_set_key,
 	.sta_set_decap_offload = mt7921_sta_set_decap_offload,
+#if IS_ENABLED(CONFIG_IPV6)
+	.ipv6_addr_change = mt7921_ipv6_addr_change,
+#endif /* CONFIG_IPV6 */
 	.ampdu_action = mt7921_ampdu_action,
 	.set_rts_threshold = mt7921_set_rts_threshold,
 	.wake_tx_queue = mt76_wake_tx_queue,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 1ecbbe4fa498..ee3c2c09cd27 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -224,6 +224,50 @@ int mt7921_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 }
 EXPORT_SYMBOL_GPL(mt7921_mcu_fill_message);
 
+#ifdef CONFIG_PM
+
+static int
+mt7921_mcu_set_ipv6_ns_filter(struct mt76_dev *dev,
+			      struct ieee80211_vif *vif, bool suspend)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct {
+		struct {
+			u8 bss_idx;
+			u8 pad[3];
+		} __packed hdr;
+		struct mt76_connac_arpns_tlv arpns;
+	} req = {
+		.hdr = {
+			.bss_idx = mvif->mt76.idx,
+		},
+		.arpns = {
+			.tag = cpu_to_le16(UNI_OFFLOAD_OFFLOAD_ND),
+			.len =
+			      cpu_to_le16(sizeof(struct mt76_connac_arpns_tlv)),
+			.mode = suspend,
+		},
+	};
+
+	return mt76_mcu_send_msg(dev, MCU_UNI_CMD_OFFLOAD, &req, sizeof(req),
+				 true);
+}
+
+void mt7921_mcu_set_suspend_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	if (IS_ENABLED(CONFIG_IPV6)) {
+		struct mt76_phy *phy = priv;
+
+		mt7921_mcu_set_ipv6_ns_filter(phy->dev, vif,
+					      !test_bit(MT76_STATE_RUNNING,
+					      &phy->state));
+	}
+
+	mt76_connac_mcu_set_suspend_iter(priv, mac, vif);
+}
+
+#endif /* CONFIG_PM */
+
 static void
 mt7921_mcu_scan_event(struct mt7921_dev *dev, struct sk_buff *skb)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index adbdb2e22934..5ca584bb2fc6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -211,6 +211,10 @@ struct mt7921_dev {
 	struct mt76_connac_pm pm;
 	struct mt76_connac_coredump coredump;
 	const struct mt7921_hif_ops *hif_ops;
+
+	struct work_struct ipv6_ns_work;
+	/* IPv6 addresses for WoWLAN */
+	struct sk_buff_head ipv6_ns_list;
 };
 
 enum {
@@ -449,6 +453,10 @@ int mt7921s_mcu_drv_pmctrl(struct mt7921_dev *dev);
 int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev);
 void mt7921_mac_add_txs(struct mt7921_dev *dev, void *data);
 void mt7921_set_runtime_pm(struct mt7921_dev *dev);
+void mt7921_mcu_set_suspend_iter(void *priv, u8 *mac,
+				 struct ieee80211_vif *vif);
+void mt7921_set_ipv6_ns_work(struct work_struct *work);
+
 int mt7921_mcu_set_sniffer(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 			   bool enable);
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
