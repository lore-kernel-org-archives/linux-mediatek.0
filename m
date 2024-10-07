Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466A5CFB440
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d999Apm6wgh7Wgg5ODcPtKfGfy7xE+a7t0wVdhVowAM=; b=hIbURY13yxjTXp6twy2j9qxgu9
	3E3L2w7VxtPa44mqr3b/cRU3ylMDXQfXEbTwqQpy6KFS3iqD1UfUyfN+uKmIWaCCItSd9hYsnIJfq
	oDGGEA44lUHYdncW79M+YFTOZuzlCwTXkINTJ2x/4ahpgC4ZT8MknMcPnrip3zpuaMo/DP2inF3ov
	EGKYq3nrmSZZIDvEsOj2xpA/P4uWd/88N5oAUI/DnZTnxpkwS6P2zronEjkSFWqB1G7AxVp3ZUjfj
	YLNmuy3hqp5RMhRXo04+kYMnIwfNwd10csWejxtxJc60GxzwcVGSqRbx74NBl+AXzt9LRzUMB6thU
	xHNcuEDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxiyh-00000001jSF-41f0;
	Mon, 07 Oct 2024 08:20:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxiKw-00000001cWx-1X9l
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Oct 2024 07:39:23 +0000
X-UUID: 428624d2847f11efb3adad29d29602c1-20241007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=d999Apm6wgh7Wgg5ODcPtKfGfy7xE+a7t0wVdhVowAM=;
	b=hEpaNMyj3jXvRIum0J8kWQ4mx6RzaLC/yFAfub/IAXE9Y1E2w3A8TIkqjiPndtMubDmlliTMc0KkJMIuTvebAYU/Cg769ywi1CTwW/sZnHfWtXle2XFb+yjmTbMCRhnqlRZJszqbG7rjFAJM3/fSUAUQZ7EK57q09d3c/baH6fs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:367aa148-eef5-440a-b950-1cec56786cb9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:7e2b6626-5902-4533-af4f-d0904aa89b3c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 428624d2847f11efb3adad29d29602c1-20241007
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <allan.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1183887729; Mon, 07 Oct 2024 00:39:18 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 7 Oct 2024 00:39:15 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 7 Oct 2024 15:39:15 +0800
From: Allan Wang <allan.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <mingyen.hsieh@mediatek.com>,
	<Sean.Wang@mediatek.com>, <Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, allan.wang <allan.wang@mediatek.com>,
	Hao Zhang <hao.zhang@mediatek.com>
Subject: [PATCH v2] wifi: mt76: introduce mt792x_config_mac_addr_list routine
Date: Mon, 7 Oct 2024 15:37:54 +0800
Message-ID: <20241007073752.18514-1-allan.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_003922_448395_498B6A10 
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

From: "allan.wang" <allan.wang@mediatek.com>

Add mt792x_config_mac_addr_list routine in order to set
the mac address list supported by the driver. Initialize
wiphy->addresses/n_addresses for mt792x driver

Signed-off-by: Hao Zhang <hao.zhang@mediatek.com>
Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
Signed-off-by: allan.wang <allan.wang@mediatek.com>
---
v2:
 - remove Change-Id tag
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7925/init.c  |  1 +
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  3 +++
 .../net/wireless/mediatek/mt76/mt792x_core.c  | 22 +++++++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index d1d64fa7d35d..cdcb002b3094 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -227,6 +227,7 @@ static void mt7921_init_work(struct work_struct *work)
 
 	mt76_set_stream_caps(&dev->mphy, true);
 	mt7921_set_stream_he_caps(&dev->phy);
+	mt792x_config_mac_addr_list(dev);
 
 	ret = mt76_register_device(&dev->mt76, true, mt76_rates,
 				   ARRAY_SIZE(mt76_rates));
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
index 039949b344b9..ddc654b9ea5e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
@@ -178,6 +178,7 @@ static void mt7925_init_work(struct work_struct *work)
 
 	mt76_set_stream_caps(&dev->mphy, true);
 	mt7925_set_stream_he_eht_caps(&dev->phy);
+	mt792x_config_mac_addr_list(dev);
 
 	ret = mt7925_init_mlo_caps(&dev->phy);
 	if (ret) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index ab12616ec2b8..10e1eaa52706 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -206,6 +206,8 @@ struct mt792x_dev {
 		struct mt76_phy mphy;
 	};
 
+	struct mac_address macaddr_list[8];
+
 	const struct mt76_bus_ops *bus_ops;
 	struct mt792x_phy phy;
 
@@ -414,6 +416,7 @@ int mt792x_mcu_fw_pmctrl(struct mt792x_dev *dev);
 void mt792x_mac_link_bss_remove(struct mt792x_dev *dev,
 				struct mt792x_bss_conf *mconf,
 				struct mt792x_link_sta *mlink);
+void mt792x_config_mac_addr_list(struct mt792x_dev *dev);
 
 static inline char *mt792x_ram_name(struct mt792x_dev *dev)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 042aa8d1b6e7..868cb97fa2ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -916,6 +916,28 @@ int mt792x_load_firmware(struct mt792x_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt792x_load_firmware);
 
+void mt792x_config_mac_addr_list(struct mt792x_dev *dev)
+{
+	struct ieee80211_hw *hw = mt76_hw(dev);
+	struct wiphy *wiphy = hw->wiphy;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(dev->macaddr_list); i++) {
+		u8 *addr = dev->macaddr_list[i].addr;
+
+		memcpy(addr, dev->mphy.macaddr, ETH_ALEN);
+
+		if (!i)
+			continue;
+
+		addr[0] |= BIT(1);
+		addr[0] ^= ((i - 1) << 2);
+	}
+	wiphy->addresses = dev->macaddr_list;
+	wiphy->n_addresses = ARRAY_SIZE(dev->macaddr_list);
+}
+EXPORT_SYMBOL_GPL(mt792x_config_mac_addr_list);
+
 MODULE_DESCRIPTION("MediaTek MT792x core driver");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
-- 
2.45.2


