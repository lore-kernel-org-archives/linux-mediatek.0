Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A086AC83F10
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 06:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZwLdjQefQo1At6zvBs0er76UIjXwLjInmb0bAZpyx4=; b=CVkYnbI8c39c2tECQtXoK/2OTa
	+Bfj7lC5R+3i3BBSSdLL5wmuWVHmhzVTwQBUEuM2bQisWAKFjWlZSN/MwcPzLBeQ5oMiKJEKxnAZ3
	jow+5QXS3HHAJiXdVrE2k40CzYHgifN0tuaGcvZ7bD9U3+gtdMYJjsr029tXLy0i6KJydOoOk6tqw
	YAgq7i51sSsenaPg+F2fI2V3bYVan815k3sP0+zdWvLmvzYkfY43cWJL4tRfY9SJ3fJU1Rlgg4XV1
	Xa0zrIw49WvO4sLraiIbRy7wsydNRV98CsmfDfo7gKUJLQ0S34vMUWXKYvUVOxBVONUgy+heDxY8l
	gLgLm0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbb5w-00EkZf-1f;
	Thu, 31 Aug 2023 06:23:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbb5u-00EkZ7-0G
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Aug 2023 06:23:55 +0000
X-UUID: f36ff31447c611ee912e1518a6540028-20230830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uZwLdjQefQo1At6zvBs0er76UIjXwLjInmb0bAZpyx4=;
	b=KWw4diVhx1E6v6L4xsg/13gXuQcXd94S08ZYfcn7vY+RTsHNJOphPbkNdtzlbLs7/C9F1urQ51IQNIRYNvS0Q5Z3v7T/eozBIz+cX4mt2iDgfWgdKWqYfJTxtfhdVOzlBb2WX8K+xvNAQ240l23O8eDpqFohvcw2MiZcMjk6QPg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:96ab4b21-21cd-41ce-a362-1ce961d675d9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:0ad78a4,CLOUDID:cb7a7ac2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f36ff31447c611ee912e1518a6540028-20230830
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1721145199; Wed, 30 Aug 2023 23:23:50 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 31 Aug 2023 14:23:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 31 Aug 2023 14:23:14 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 5/9] wifi: mt76: get rid of false alamrs of tx emission issues
Date: Thu, 31 Aug 2023 14:22:17 +0800
Message-ID: <20230831062221.20027-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230831062221.20027-1-shayne.chen@mediatek.com>
References: <20230831062221.20027-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_232354_122473_19F7BD56 
X-CRM114-Status: GOOD (  12.19  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

When the set_chan_info command is set with CH_SWITCH_NORMAL reason,
even if the action is UNI_CHANNEL_RX_PATH, it'll still generate some
unexpected tones, which might confuse DFS CAC tests that there are some
tone leakages. To get rid of these kinds of false alarms, always bypass
DPD calibration when IEEE80211_CONF_IDLE is set.

Reviewed-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 6 +++---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index f18dc777edcb..94a091dd155e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2742,10 +2742,10 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 	if (mt76_connac_spe_idx(phy->mt76->antenna_mask))
 		req.tx_path_num = fls(phy->mt76->antenna_mask);
 
-	if (cmd == MCU_EXT_CMD(SET_RX_PATH) ||
-	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
+	if (dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
 		req.switch_reason = CH_SWITCH_NORMAL;
-	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
+	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL ||
+		 phy->mt76->hw->conf.flags & IEEE80211_CONF_IDLE)
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
 	else if (!cfg80211_reg_can_beacon(phy->mt76->hw->wiphy, chandef,
 					  NL80211_IFTYPE_AP))
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 4de0c4a97fc4..ebd0a9a6310e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -3182,10 +3182,10 @@ int mt7996_mcu_set_chan_info(struct mt7996_phy *phy, u16 tag)
 		.channel_band = ch_band[chandef->chan->band],
 	};
 
-	if (tag == UNI_CHANNEL_RX_PATH ||
-	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
+	if (dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
 		req.switch_reason = CH_SWITCH_NORMAL;
-	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
+	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL ||
+		 phy->mt76->hw->conf.flags & IEEE80211_CONF_IDLE)
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
 	else if (!cfg80211_reg_can_beacon(phy->mt76->hw->wiphy, chandef,
 					  NL80211_IFTYPE_AP))
-- 
2.39.2


