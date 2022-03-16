Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E15C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 10:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y0RQMsLOjKYH9ag3s4wzcHbI5gh8QPgW6mh1O2r1tG8=; b=CchlL61VnduOJI
	NB931+CzPdDuaBfn4u+VjPT3CshZ3asbI/Oh/bwklNkVuHaaJqUUv/BkO4DubFobNjSjcup/0i0iy
	wxHQr/7+3OiVqhJpbhIi2WoP0IGDpFivFLiYcFuAGRYChpetCRF5BSnN/dMYpq4XyTbE+m+kM/w18
	2kjNR0Qfqa5XY75KwdK1YW1poBZqi4QM/1JolDO5aWN9worUJPzTC2ihfgllsgspLYjzH7ybk2fSl
	DKbX6gaumNEbo7IknqOgnC5s+nmPD07o9GR4IcqEbsT1Q59jtISgX0jDmDw+fOxPtHEstjpaxocY0
	S9AtV209/wo4Qq9ySC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUQSO-00CQUl-SH; Wed, 16 Mar 2022 10:00:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUQSL-00CQSx-T0
 for linux-mediatek@lists.infradead.org; Wed, 16 Mar 2022 10:00:39 +0000
X-UUID: ae45b7bb7a714f1b8d467d14db6709d5-20220316
X-UUID: ae45b7bb7a714f1b8d467d14db6709d5-20220316
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 903291872; Wed, 16 Mar 2022 03:00:32 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 02:52:00 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Mar 2022 17:51:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Mar 2022 17:51:58 +0800
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
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: fix monitor rx FCS error in DFS channel
Date: Wed, 16 Mar 2022 17:51:52 +0800
Message-ID: <7243650f3d51b1919bd4fd0017ff8b0186149e54.1647421054.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_030037_984652_EF943CC1 
X-CRM114-Status: UNSURE (   9.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Deren Wu <deren.wu@mediatek.com>

When setup monitor mode in DFS channel, mt76 send CH_SWITCH_DFS to
fw for channel config. This would cause rx performance bad while
monitoring frames. Settings CH_SWITCH_NORMAL in monitor mode would
get the same performance as normal channels.

Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 390add3144c2..97e2a85cb728 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -2151,7 +2151,8 @@ int mt7615_mcu_set_chan_info(struct mt7615_phy *phy, int cmd)
 		.center_chan2 = ieee80211_frequency_to_channel(freq2),
 	};
 
-	if (cmd == MCU_EXT_CMD(SET_RX_PATH))
+	if (cmd == MCU_EXT_CMD(SET_RX_PATH) ||
+	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
 		req.switch_reason = CH_SWITCH_NORMAL;
 	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 10dc4bf5adec..c56d48342aaf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2833,7 +2833,8 @@ int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd)
 	}
 #endif
 
-	if (cmd == MCU_EXT_CMD(SET_RX_PATH))
+	if (cmd == MCU_EXT_CMD(SET_RX_PATH) ||
+	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
 		req.switch_reason = CH_SWITCH_NORMAL;
 	else if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 5ef8b24f0ab3..da2be050ed7c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -863,7 +863,8 @@ int mt7921_mcu_set_chan_info(struct mt7921_phy *phy, int cmd)
 	else
 		req.channel_band = chandef->chan->band;
 
-	if (cmd == MCU_EXT_CMD(SET_RX_PATH))
+	if (cmd == MCU_EXT_CMD(SET_RX_PATH) ||
+	    dev->mt76.hw->conf.flags & IEEE80211_CONF_MONITOR)
 		req.switch_reason = CH_SWITCH_NORMAL;
 	else if (dev->mt76.hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
