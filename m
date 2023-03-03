Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EBAC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 08:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oca0RaExTuCZD7ua585iW2kol2woNjATQIOqheZzsXU=; b=E8Uem8ZHBeLr9Niq3f+3Mj+1ff
	PHnmubCUQWH7zsO+zpjeiKHl30M+3lAmF4KZgvsSWUPPBjB4Ts/GV7536nd9Y2Rh8ZnSpLKj2ytfy
	eLhzWQhcFBGQf1bZ2koLlozQLrtVSh5aBN6bxhS+ToxNg4JwiW4JwTGwyPRwdUbj8XaS9R22dBa5z
	3pMLw4ysUQBkxRCwSyqCuznLQA5NXlKJP3AGGMEIhHD+ueR4f/zPXD6vNP4IsS0xY92cATpJIVMdg
	caPfKYsXi6JIZjlEIQ9xALYOztNjTr8+STKrpm9zEyXRYUZyld2SQ2JQTMskaFQOSCHbfTNa6jHmS
	juw/VQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0wq-005T3P-Am; Fri, 03 Mar 2023 08:39:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0ue-005Rp4-6a
	for linux-mediatek@lists.infradead.org; Fri, 03 Mar 2023 08:37:14 +0000
X-UUID: 95343ddeb99e11edbbe3f76fe852e059-20230303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Oca0RaExTuCZD7ua585iW2kol2woNjATQIOqheZzsXU=;
	b=gUUHAaPK5tqY9GqELwbvGGUa3ChFlMKSsPPgPNcUmD2yKuF7IQkY2SyauW3mhcH6ZmUAKjj0MMKEiAI6u3XthFcEmtX0cLYrSMUGlAvshaXSHsBjl8bnXOirVGTQZNl4WvN7F3/D0wyUGbqBNV/8mQb/aZM9cqNOkI9s/NauyQw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:2c0b5b41-d83d-4822-aa9b-55ea596c2dee,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:2b9ba9f4-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 95343ddeb99e11edbbe3f76fe852e059-20230303
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1452353926; Fri, 03 Mar 2023 01:37:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 3 Mar 2023 16:36:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 3 Mar 2023 16:36:31 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 6/7] wifi: mt76: mt7996: remove mt7996_mcu_set_pm()
Date: Fri, 3 Mar 2023 16:35:57 +0800
Message-ID: <20230303083558.3586-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230303083558.3586-1-shayne.chen@mediatek.com>
References: <20230303083558.3586-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_003712_313898_1CF9A149 
X-CRM114-Status: UNSURE (   9.52  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Currently using BSS_INFO_PS command will sometimes cause packet drop in
hw rx queue.
Temporarily remove this function until finding the cause.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  8 ------
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 26 -------------------
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  1 -
 3 files changed, 35 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 3e4da0350d96..f13f67b21d3e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -52,10 +52,6 @@ static int mt7996_start(struct ieee80211_hw *hw)
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
-	ieee80211_iterate_interfaces(dev->mt76.hw,
-				     IEEE80211_IFACE_ITER_RESUME_ALL,
-				     mt7996_mcu_set_pm, dev->mt76.hw);
-
 	ieee80211_queue_delayed_work(hw, &phy->mt76->mac_work,
 				     MT7996_WATCHDOG_TIME);
 
@@ -79,10 +75,6 @@ static void mt7996_stop(struct ieee80211_hw *hw)
 
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
-	ieee80211_iterate_interfaces(dev->mt76.hw,
-				     IEEE80211_IFACE_ITER_RESUME_ALL,
-				     mt7996_mcu_set_pm, dev->mt76.hw);
-
 	mutex_unlock(&dev->mt76.mutex);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index c11e92db5f07..1389d140a8c2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3577,32 +3577,6 @@ int mt7996_mcu_twt_agrt_update(struct mt7996_dev *dev,
 				 &req, sizeof(req), true);
 }
 
-void mt7996_mcu_set_pm(void *priv, u8 *mac, struct ieee80211_vif *vif)
-{
-#define EXIT_PM_STATE	0
-#define ENTER_PM_STATE	1
-	struct ieee80211_hw *hw = priv;
-	struct mt7996_dev *dev = mt7996_hw_dev(hw);
-	struct mt7996_phy *phy = mt7996_hw_phy(hw);
-	struct mt7996_vif *mvif = (struct mt7996_vif *)vif->drv_priv;
-	struct bss_power_save *ps;
-	struct sk_buff *skb;
-	struct tlv *tlv;
-	bool running = test_bit(MT76_STATE_RUNNING, &phy->mt76->state);
-
-	skb = __mt7996_mcu_alloc_bss_req(&dev->mt76, &mvif->mt76,
-					 MT7996_BSS_UPDATE_MAX_SIZE);
-	if (IS_ERR(skb))
-		return;
-
-	tlv = mt7996_mcu_add_uni_tlv(skb, UNI_BSS_INFO_PS, sizeof(*ps));
-	ps = (struct bss_power_save *)tlv;
-	ps->profile = running ? EXIT_PM_STATE : ENTER_PM_STATE;
-
-	mt76_mcu_skb_send_msg(&dev->mt76, skb,
-			      MCU_WMWA_UNI_CMD(BSS_INFO_UPDATE), true);
-}
-
 int mt7996_mcu_set_rts_thresh(struct mt7996_phy *phy, u32 val)
 {
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index ae1210b0a82c..f27f519bec0a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -432,7 +432,6 @@ int mt7996_mcu_set_pulse_th(struct mt7996_dev *dev,
 int mt7996_mcu_set_radar_th(struct mt7996_dev *dev, int index,
 			    const struct mt7996_dfs_pattern *pattern);
 int mt7996_mcu_set_radio_en(struct mt7996_phy *phy, bool enable);
-void mt7996_mcu_set_pm(void *priv, u8 *mac, struct ieee80211_vif *vif);
 int mt7996_mcu_set_rts_thresh(struct mt7996_phy *phy, u32 val);
 int mt7996_mcu_get_chan_mib_info(struct mt7996_phy *phy, bool chan_switch);
 int mt7996_mcu_rdd_cmd(struct mt7996_dev *dev, int cmd, u8 index,
-- 
2.39.2


