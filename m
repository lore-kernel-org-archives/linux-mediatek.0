Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54596C54EBD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cx4i5kq2axNbLApFo03m1fGOc9QlXWO4hFEwYrzipY=; b=Wpbnl7+DNy1IPar0Pc3dZP0owq
	lLW4yRpQZyjbAFKPujegMrd9C7F4Jzhl+RnFcRgWLiiLazwOL5uCpWw+enD8RZSrvjmnbx/pJaZWD
	b6F4FnkjzItj0S8YT6i2gpGUekES2dY3ZkU51JzBfFd8IpPU/IVCq6JK0mfUo82wbhhAEfwG9wT3q
	cIHDSru3gmqdUQ3BJekwHksmzx/qQawkiBhfU4agArr6a9/W4NT9HC2zv2Y/huzzd8oIU8spyHCxI
	s4tdrHLbh8DSQ4/M1oF7/PFLXjBo1eiCUehds2Z8KwHbHPvFzqm3G8ZrnJ4OPXENh6t1Dio06qnGF
	CVZbQM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvUC-002jwi-4Y; Mon, 09 Jan 2023 16:59:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEvU6-002jrH-7m
	for linux-mediatek@bombadil.infradead.org; Mon, 09 Jan 2023 16:58:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0cx4i5kq2axNbLApFo03m1fGOc9QlXWO4hFEwYrzipY=; b=KkcdocAOqFFJMLt/PwoVy5rGki
	nFkcwLmud9tCyEj1p464SzdA5TNMjDemlWMbVcxxvEcsOajpkQSmu+vyHG4IncDu8SDmXjf1TX8LP
	bAP8be6DQCWtCvMkm/P9ELnG3H8ONlGzmwxog3MAF07W0VaNmbKQ9yMAzzdeXPj7Pr11EZcDlHyBb
	StbfHo2y8XEIKEzhpzymHb3HCgwa8G71YSu/6OpeC/apPRoleSajY+61NMVGnAZWgl8j8SCM9zyHw
	d/Na2XRhBkWNSYxxj1bxOT4aNYf8pnYF49bUCEgdqnHehxDSser2cmxgDwl0nsR3uAuv2eQ9Rt1+O
	qrWL27Lg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEvTv-002mnK-1e
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Jan 2023 16:58:45 +0000
X-UUID: 9cf715a2b5ff426382b9b890d30de9a1-20230109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0cx4i5kq2axNbLApFo03m1fGOc9QlXWO4hFEwYrzipY=;
	b=XoL9gfuY+ap/Zp+ErPuuY+hMh+ytKRiQ+Z2P2uCNeCKsVKNpQ1fU7kAM3hogSvJnLigmFZ3INoSwoQ2Ox4X0Qt3kxzdfuIyEqToM0ZVvpNLq3+XW2VEsjokltQ+2Opx+bxwv6x1tRzpstXG7l4BmsyVFw72EHFMtdnD37vo4lo4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:fc7df906-dff6-4f14-b9fa-2c0e7f2bb946,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:30032154-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 9cf715a2b5ff426382b9b890d30de9a1-20230109
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 953561244; Mon, 09 Jan 2023 09:58:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 10 Jan 2023 00:58:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 10 Jan 2023 00:58:05 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 08/13] wifi: mt76: mt7996: add helpers for wtbl and interface limit
Date: Tue, 10 Jan 2023 00:57:26 +0800
Message-ID: <20230109165731.682-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230109165731.682-1-shayne.chen@mediatek.com>
References: <20230109165731.682-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_165843_911386_203F32B2 
X-CRM114-Status: GOOD (  12.68  )
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

Add helpers to get the maximum wtbl size and interface num based
on hw caps.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/init.c    |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c |  2 +-
 .../net/wireless/mediatek/mt76/mt7996/main.c    |  2 +-
 .../net/wireless/mediatek/mt76/mt7996/mt7996.h  | 17 +++++++++++++----
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 7a9692a66ed8..6bcf2649d8df 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -256,7 +256,7 @@ static void mt7996_mac_init(struct mt7996_dev *dev)
 
 	mt76_clear(dev, MT_MDP_DCR2, MT_MDP_DCR2_RX_TRANS_SHORT);
 
-	for (i = 0; i < MT7996_WTBL_SIZE; i++)
+	for (i = 0; i < mt7996_wtbl_size(dev); i++)
 		mt7996_mac_wtbl_update(dev, i,
 				       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index ce4242f90e9f..31e6c48985d3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1486,7 +1486,7 @@ static void mt7996_mac_add_txs(struct mt7996_dev *dev, void *data)
 	if (pid < MT_PACKET_ID_FIRST)
 		return;
 
-	if (wcidx >= MT7996_WTBL_SIZE)
+	if (wcidx >= mt7996_wtbl_size(dev))
 		return;
 
 	rcu_read_lock();
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 9ea2e1198477..58f9ea0125e5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -170,7 +170,7 @@ static int mt7996_add_interface(struct ieee80211_hw *hw,
 		phy->monitor_vif = vif;
 
 	mvif->mt76.idx = __ffs64(~dev->mt76.vif_mask);
-	if (mvif->mt76.idx >= (MT7996_MAX_INTERFACES << dev->dbdc_support)) {
+	if (mvif->mt76.idx >= mt7996_max_interface_num(dev)) {
 		ret = -ENOSPC;
 		goto out;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 00f3beda74cc..b919a7bc606b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -11,12 +11,11 @@
 #include "../mt76_connac.h"
 #include "regs.h"
 
-#define MT7996_MAX_INTERFACES		19
+#define MT7996_MAX_INTERFACES		19	/* per-band */
 #define MT7996_MAX_WMM_SETS		4
-#define MT7996_WTBL_SIZE		544
-#define MT7996_WTBL_RESERVED		(MT7996_WTBL_SIZE - 1)
+#define MT7996_WTBL_RESERVED		(mt7996_wtbl_size(dev) - 1)
 #define MT7996_WTBL_STA			(MT7996_WTBL_RESERVED - \
-					 MT7996_MAX_INTERFACES)
+					 mt7996_max_interface_num(dev))
 
 #define MT7996_WATCHDOG_TIME		(HZ / 10)
 #define MT7996_RESET_TIMEOUT		(30 * HZ)
@@ -447,6 +446,16 @@ int mt7996_mcu_fw_dbg_ctrl(struct mt7996_dev *dev, u32 module, u8 level);
 void mt7996_mcu_rx_event(struct mt7996_dev *dev, struct sk_buff *skb);
 void mt7996_mcu_exit(struct mt7996_dev *dev);
 
+static inline u8 mt7996_max_interface_num(struct mt7996_dev *dev)
+{
+	return MT7996_MAX_INTERFACES * (1 + dev->dbdc_support + dev->tbtc_support);
+}
+
+static inline u16 mt7996_wtbl_size(struct mt7996_dev *dev)
+{
+	return (dev->wtbl_size_group << 8) + 64;
+}
+
 void mt7996_dual_hif_set_irq_mask(struct mt7996_dev *dev, bool write_reg,
 				  u32 clear, u32 set);
 
-- 
2.25.1


