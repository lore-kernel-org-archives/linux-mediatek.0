Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F23C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 11:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuSTDGeofZhD3L2ID+12WcjJiSjw0EsOzM85qlyQ3e4=; b=j7eXacLN/x6LA8kkADPy9TF27F
	pl+tqrKKbjGeSI22sTIX0TIQq0aRg2/4ohXpG06x9Y4foWtqzNquqeVbi7c4MAUMLnxbsw90As3lG
	ctOuKEKBHEuCPPVGhQ7GedHg+ZSpx6X5vVPZsmnmakjE95GL/EBc35hRfG7LZRgFJvPMdL3eL3UB9
	XnLdTkm4PvOG1PC3Vmb3/jYTPzsYjTtZ9c0hxZBpnFBdaVYvSHxiaF5dVatVQLZ/1aU0HnXV8dMaR
	Q8pKyQftimKo2m2cR2doMFa50jJ2J0AxyoBpqw89ivKDm2BVvU+1v2nYnEqtAJi09tbpHX76IR/jr
	B3qPzA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtpD-0000000Gtla-2ooQ;
	Wed, 20 Mar 2024 11:09:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtp9-0000000GtgZ-2Wk0
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 11:09:37 +0000
X-UUID: 508c13dee6aa11ee9aa9374d6d45775a-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IuSTDGeofZhD3L2ID+12WcjJiSjw0EsOzM85qlyQ3e4=;
	b=N+NOqquqz+WVRGwysktPv/V8F0DEJ7cWkfdGn8+mAt0zOCaQHz1FEbzZgAV6RwnL11Yq8rTIbjaao9hyJz8gq6V/GGf/s3ixF+T+2OztgQ1L9L0kEr7MGghNaz/yGccYxjsWA7h+hfViu/47kEsmAu8+zSz6hJnWRSZ2Scr8SXk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:d6884cad-f8a4-43b4-bd60-7ea1c64df7b8,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:d305a090-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 508c13dee6aa11ee9aa9374d6d45775a-20240320
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1716778741; Wed, 20 Mar 2024 04:09:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 19:09:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 19:09:24 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 07/10] wifi: mt76: connac: enable critical packet mode support for mt7992
Date: Wed, 20 Mar 2024 19:09:15 +0800
Message-ID: <20240320110918.3488-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320110918.3488-1-shayne.chen@mediatek.com>
References: <20240320110918.3488-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_040935_793815_0B5BDB5E 
X-CRM114-Status: GOOD (  12.06  )
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

From: Howard Hsu <howard-yh.hsu@mediatek.com>

For mt7992 chipsets, critical packet mode should be properly configured
to let the HW SDO module correctly fill the AC queue in TX descriptors of
some higher priority packets such as ARP and ICMP.
Without this patch, HW queues may hang when running MU traffic.

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h    |  1 +
 drivers/net/wireless/mediatek/mt76/mt7996/main.c    |  8 ++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c     | 13 +++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h  |  1 +
 4 files changed, 23 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 608deb47dada..836cc4d5b1d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1220,6 +1220,7 @@ enum {
 	MCU_EXT_CMD_TXDPD_CAL = 0x60,
 	MCU_EXT_CMD_CAL_CACHE = 0x67,
 	MCU_EXT_CMD_RED_ENABLE = 0x68,
+	MCU_EXT_CMD_CP_SUPPORT = 0x75,
 	MCU_EXT_CMD_SET_RADAR_TH = 0x7c,
 	MCU_EXT_CMD_SET_RDD_PATTERN = 0x7d,
 	MCU_EXT_CMD_MWDS_SUPPORT = 0x80,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 995c265442df..338ff10b121d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -35,6 +35,14 @@ int mt7996_run(struct ieee80211_hw *hw)
 		ret = mt7996_mcu_set_hdr_trans(dev, true);
 		if (ret)
 			goto out;
+
+		if (is_mt7992(&dev->mt76)) {
+			u8 queue = mt76_connac_lmac_mapping(IEEE80211_AC_VI);
+
+			ret = mt7996_mcu_cp_support(dev, queue);
+			if (ret)
+				goto out;
+		}
 	}
 
 	mt7996_mac_enable_nf(dev, phy->mt76->band_idx);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index d5e35f6dd52e..ccae954a22f8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -4530,3 +4530,16 @@ int mt7996_mcu_set_txpower_sku(struct mt7996_phy *phy)
 	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
 				     MCU_WM_UNI_CMD(TXPOWER), true);
 }
+
+int mt7996_mcu_cp_support(struct mt7996_dev *dev, u8 mode)
+{
+	__le32 cp_mode;
+
+	if (mode < mt76_connac_lmac_mapping(IEEE80211_AC_BE) ||
+	    mode > mt76_connac_lmac_mapping(IEEE80211_AC_VO))
+		return -EINVAL;
+
+	cp_mode = cpu_to_le32(mode);
+	return mt76_mcu_send_msg(&dev->mt76, MCU_WA_EXT_CMD(CP_SUPPORT),
+				 &cp_mode, sizeof(cp_mode), true);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index c30d133d9a71..b9b0bb4c408b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -612,6 +612,7 @@ int mt7996_mcu_bcn_prot_enable(struct mt7996_dev *dev, struct ieee80211_vif *vif
 int mt7996_mcu_wtbl_update_hdr_trans(struct mt7996_dev *dev,
 				     struct ieee80211_vif *vif,
 				     struct ieee80211_sta *sta);
+int mt7996_mcu_cp_support(struct mt7996_dev *dev, u8 mode);
 #ifdef CONFIG_MAC80211_DEBUGFS
 void mt7996_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir);
-- 
2.39.2


