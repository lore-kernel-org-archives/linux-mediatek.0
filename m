Return-Path: <SRS0=fxQu=2M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A102C2D0C8
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 20:22:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50306206CB
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 20:22:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rtNtlrBK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i2+Bb54o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50306206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sa2KoaktLMJRCn1AboL71mmcrnwTJBeCBA23qsDbBf4=; b=rtNtlrBKhOFX4V
	oKsoQco+V14YHQM5uTcZ4BvG3VKe2Ua0v4wB9JtSG1lcTm89fq4Nj+xjmDAuA5eGVz5aTIkdrQ+9Q
	DXty2vSYkLw3OxkckWm10hydJMlSxytPrcorApfbazsRVkEQ+ju8pEesYac4Wsgp58cb30LK9iiPt
	BdKtp/kgjazaNb4ByARmySdI7hHZd00aMlJQW/8hW/TOynxvIU5Ma+E1qubYl+OyDu3VFUawD8gHV
	w7y7Y7Pf1k++4Xuakmc3F2fm4a2pH9Y5UyRsxVpxIL1wUzfUCnpS6MI6p1vWhS9Drzm3XtnBGbtqc
	AzipDH6X/giTzIVDWfSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ij7jm-0007ed-Sr; Sun, 22 Dec 2019 20:22:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ij7jk-0007dx-7c
 for linux-mediatek@lists.infradead.org; Sun, 22 Dec 2019 20:22:01 +0000
X-UUID: 2f71e34209074ecca7f577dd2ef1e752-20191222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=snNLFpI6iD8KtzouGrFPprybGRM2xQ+mm0t3hSBGidE=; 
 b=i2+Bb54ojTGwYYLziYsEEQ7jKyUOoN5k1KZU2T8nMysfls3UjEDX3n5xjtwWqPR2+61FmJEjWd4N/dMjwlbEzijmo7kEyZb2Oqkghz1bb6BbvG6qn20hxiBr7w3PLbMJGM68qWsB/jlOF2M+GpCeEnotIY8MohTA2we8qFbLZic=;
X-UUID: 2f71e34209074ecca7f577dd2ef1e752-20191222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 700626819; Sun, 22 Dec 2019 12:21:57 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 22 Dec 2019 12:12:17 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 23 Dec 2019 04:11:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 23 Dec 2019 04:10:50 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 1/2] mt76: mt7615: rework set_channel function
Date: Mon, 23 Dec 2019 04:11:38 +0800
Message-ID: <9a37e1340cc8c546587d7cf99d6c4d92e12e1a7d.1577044827.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 61A9F353F740679A2FA70EC917627447E2E9DB04B5870975D8AE200DC81804D42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_122200_282456_61F6F0E8 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

No need to send both MCU_EXT_CMD_SET_RX_PATH and MCU_EXT_CMD_CHANNEL_SWITCH
together to MCU.

Split them out by passing the proper command in the corresponding flow.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
Changes since v1:
- add MCU_EXT_CMD_SET_RX_PATH to avoid creating a regression
---
 .../net/wireless/mediatek/mt76/mt7615/main.c   |  5 ++++-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c    | 18 ++++--------------
 .../net/wireless/mediatek/mt76/mt7615/mt7615.h |  2 +-
 3 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 4ffa920d4f4d..90c4e785a1a3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -11,6 +11,7 @@
 #include <linux/pci.h>
 #include <linux/module.h>
 #include "mt7615.h"
+#include "mcu.h"
 
 static bool mt7615_dev_running(struct mt7615_dev *dev)
 {
@@ -47,6 +48,8 @@ static int mt7615_start(struct ieee80211_hw *hw)
 		mt7615_mcu_set_mac_enable(dev, 1, true);
 	}
 
+	mt7615_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
+
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
 
 	if (running)
@@ -224,7 +227,7 @@ static int mt7615_set_channel(struct mt7615_phy *phy)
 	phy->dfs_state = -1;
 	mt76_set_channel(phy->mt76);
 
-	ret = mt7615_mcu_set_channel(phy);
+	ret = mt7615_mcu_set_chan_info(phy, MCU_EXT_CMD_CHANNEL_SWITCH);
 	if (ret)
 		goto out;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index fc091278d9e5..ffd09c8670d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1364,12 +1364,11 @@ int mt7615_mcu_rdd_send_pattern(struct mt7615_dev *dev)
 				   &req, sizeof(req), false);
 }
 
-int mt7615_mcu_set_channel(struct mt7615_phy *phy)
+int mt7615_mcu_set_chan_info(struct mt7615_phy *phy, int cmd)
 {
 	struct mt7615_dev *dev = phy->dev;
 	struct cfg80211_chan_def *chandef = &phy->mt76->chandef;
 	int freq1 = chandef->center_freq1, freq2 = chandef->center_freq2;
-	u8 n_chains = hweight8(phy->mt76->antenna_mask);
 	struct {
 		u8 control_chan;
 		u8 center_chan;
@@ -1391,11 +1390,10 @@ int mt7615_mcu_set_channel(struct mt7615_phy *phy)
 	} req = {
 		.control_chan = chandef->chan->hw_value,
 		.center_chan = ieee80211_frequency_to_channel(freq1),
-		.tx_streams = n_chains,
-		.rx_streams_mask = n_chains,
+		.tx_streams = hweight8(phy->mt76->antenna_mask),
+		.rx_streams_mask = phy->chainmask,
 		.center_chan2 = ieee80211_frequency_to_channel(freq2),
 	};
-	int ret;
 
 	if (dev->mt76.hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
@@ -1434,15 +1432,7 @@ int mt7615_mcu_set_channel(struct mt7615_phy *phy)
 	}
 	memset(req.txpower_sku, 0x3f, 49);
 
-	ret = __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_CHANNEL_SWITCH,
-				  &req, sizeof(req), true);
-	if (ret)
-		return ret;
-
-	req.rx_streams_mask = phy->chainmask;
-
-	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_SET_RX_PATH,
-				   &req, sizeof(req), true);
+	return __mt76_mcu_send_msg(&dev->mt76, cmd, &req, sizeof(req), true);
 }
 
 int mt7615_mcu_set_ht_cap(struct mt7615_dev *dev, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 48810eda1cd6..fb461e761d59 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -251,7 +251,7 @@ int mt7615_mcu_set_sta_rec(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, bool en);
 int mt7615_mcu_set_bcn(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		       int en);
-int mt7615_mcu_set_channel(struct mt7615_phy *phy);
+int mt7615_mcu_set_chan_info(struct mt7615_phy *phy, int cmd);
 int mt7615_mcu_set_wmm(struct mt7615_dev *dev, u8 queue,
 		       const struct ieee80211_tx_queue_params *params);
 int mt7615_mcu_set_tx_ba(struct mt7615_dev *dev,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
