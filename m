Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80179D1AD42
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dw7E25Ax5aPaEi8VvFtVDhiaph6LmLWdS1o3OukH4H8=; b=B5ldJUQyC/MOeg7HvAfHr7SZKa
	qhFLUeRvJ9vzrTa7d/mEi4J6kz4ogutcdmNkNs7uB8jmdAa2bRv44OdvicfaTwIZQpj/Ir4i/lq+P
	Hf1m1PulKSfirWixzkxSreKDsaXcicnlajohVawTV3yL72IaWsBdsLBN1w9tbhJ7vZEnsubh7LQKI
	9QrfzBVs5dK33jEHvEvraJrBABgYJ0ZF0u7w4LQK/nDhlirFkewJxCPpWrLoE40pmh1IrRVjsQCFU
	2fuQFpQfuOUuv1+0j8O87xKCeyt2NvLacwX/Xss6N9FRoqUpvxIwCCfnXJBn+QHg8pBeaz0cHIACh
	aoI4k4Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t116y-0000000BOsP-24AV;
	Wed, 16 Oct 2024 10:18:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t10z7-0000000BNT5-3R1B
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 10:10:31 +0000
X-UUID: dc119d1a8ba611ef9048ed6ed365623b-20241016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dw7E25Ax5aPaEi8VvFtVDhiaph6LmLWdS1o3OukH4H8=;
	b=saoruRIzVdNVWNKqmGKzeF08LKmCthKm1cfEldBaDfBnQ3gCgd/5M6B/l1e5ixWTbCA9LAapBUOex0A09y5sx0Rp+wpGkIiDhkotyID+gNIEZq2x7utReqlB2JQLbkqPGOYKstjRAJGChc5RyBx2+kk01CJF+dklic0lLK9v47Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:bbc2edba-72ca-40c3-ad2a-7e7e38657fdf,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:1302e106-3d5c-41f6-8d90-a8be388b5b5b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:5,IP:nil,UR
	L:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dc119d1a8ba611ef9048ed6ed365623b-20241016
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <allan.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1407276128; Wed, 16 Oct 2024 03:10:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Oct 2024 18:10:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 16 Oct 2024 18:10:20 +0800
From: Allan Wang <allan.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <mingyen.hsieh@mediatek.com>,
	<Sean.Wang@mediatek.com>, <Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Michael.Lo@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Allan Wang <allan.wang@mediatek.com>,
	Hao Zhang <hao.zhang@mediatek.com>
Subject: [PATCH v3] wifi: mt76: introduce mt792x_config_mac_addr_list routine
Date: Wed, 16 Oct 2024 18:10:17 +0800
Message-ID: <20241016101017.19598-1-allan.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.161600-8.000000
X-TMASE-MatchedRID: mSPDr4jZDFE9S3IiQd+eNULhYg/sa1gs+Vb3woyMZbtUjspoiX02F8+c
	wCLpvDnE01CjbbHk5lBso/8Nu7eWqFIMRaTXK1BMA9lly13c/gFflOpBqBHTtzUsHjosUACSWfD
	0boMRR4Mdp4Txl116a82cSlJJpVq0mHQ8ODC8xrYMH4SsGvRsA+rRJDUyDHkIwsR7A2gTdJmv1j
	/2L7xP1lD3U31Zcw/LTBBYZttKmvw6khM4kbcJpRlckvO1m+JcfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtgUicvJ4MChnqDCGTL5wntxilhxfL6BTVKN0vs4WWTMmmiOBdzYSoWmY7eqLvyw0k
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.161600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A35463E1A97DF16B4076621888CB5B8AA9E0F58099AC491B4A80AEEA2B8E074F2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_031029_906150_7F456D31 
X-CRM114-Status: GOOD (  13.33  )
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

Add mt792x_config_mac_addr_list routine in order to set
the mac address list supported by the driver. Initialize
wiphy->addresses/n_addresses for mt792x driver

Signed-off-by: Hao Zhang <hao.zhang@mediatek.com>
Signed-off-by: Leon Yen <Leon.Yen@mediatek.com>
Signed-off-by: Allan Wang <allan.wang@mediatek.com>
---
v2:
 - Remove Change-Id tag

v3:
 - Update commit message after fixing gitconfig username format
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


