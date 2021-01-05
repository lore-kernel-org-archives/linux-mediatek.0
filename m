Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B951CC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 11:31:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C61E229EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 11:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C61E229EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M1GG6Rpq9j5o4/VxLhJs00S9YeHH/bg+VN7hodEpoyk=; b=HWnssbuHHkipx67ol3Vhbxsuz
	uZJbtJ0Py0Cilex0Z7vI7dp6HcvPdJm8fAMPffPXhW3McsSDqmqSV1A/WSQoYJ1egmv72huIYuqo7
	/CXD3+Z1YVOtjD05EusZtfe9Zgl36G4cABuxiSY0o/vel52UP2kmvQsw9l6R3rHz1qLLTlWw7c8he
	uRF09ETe7M8ETahsljIXyAIAUuoCVafU6pja5/X/+DigGljaTQD5BCFb1a9yayifmh24Z7i7eQBdq
	HAKzlADJQo98AsZuiLB2A1VpR5Q7grzlFkVaeR+p2ct8kPSrtA8U9Y3XGkaXJFJRUWwMgpr8hdnDA
	NdCrZTnEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwkYk-0006Ds-8B; Tue, 05 Jan 2021 11:31:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwkYh-0006CF-6B
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 11:31:28 +0000
X-UUID: e32609f1a3934a3dbded329d7eb1cfe3-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HBdnml31c5lHCY6dLT7oMfRWxuOA6EdbctfceS2o9yQ=; 
 b=rVoDk6o/QDi1azOLw4kcq5RWWVK9VpWF9hZuAKXTbZRfnClEcIOlLMopVUWuze81YH3/BcYnVNQn5MErMzQu3NnNP+BoI1iBAswbCOaxct/0HXB0OTnEL+yfg2UV3XznGtOcaIAjlFtZ0FAnNcXdsfwrREzym1PKaa3+kJ4btt4=;
X-UUID: e32609f1a3934a3dbded329d7eb1cfe3-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 108613138; Tue, 05 Jan 2021 03:31:18 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 03:31:01 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 19:30:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 5 Jan 2021 19:30:59 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 4/4] mt76: mt7615: mt7915: disable txpower sku when testmode
 enabled
Date: Tue, 5 Jan 2021 19:30:45 +0800
Message-ID: <20210105113045.17815-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210105113045.17815-1-shayne.chen@mediatek.com>
References: <20210105113045.17815-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_063127_472940_760C4235 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When testmode can be enabled, the start() callback would already be
called, causing that txpower sku feature isn't really disabled after
testmode is enabled. This patch fix the issue.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c     | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/testmode.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7915/main.c     | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/testmode.c | 2 ++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 3fc48aaa3b36..18e6c5aac786 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -321,7 +321,7 @@ int mt7615_set_channel(struct mt7615_phy *phy)
 	mt7615_mac_set_timing(phy);
 	ret = mt7615_dfs_init_radar_detector(phy);
 	mt7615_mac_cca_stats_reset(phy);
-	mt7615_mcu_set_sku_en(phy, !mt76_testmode_enabled(phy->mt76));
+	mt7615_mcu_set_sku_en(phy, true);
 
 	mt7615_mac_reset_counters(dev);
 	phy->noise = 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
index b82915445d0d..6c602b086a49 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/testmode.c
@@ -138,6 +138,8 @@ mt7615_tm_init(struct mt7615_phy *phy)
 	if (!test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
 		return;
 
+	mt7615_mcu_set_sku_en(phy, phy->mt76->test.state == MT76_TM_STATE_OFF);
+
 	mutex_unlock(&dev->mt76.mutex);
 	mt7615_set_channel(phy);
 	mt7615_ops.configure_filter(phy->mt76->hw, 0, &total_flags, 0);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 3e0458fee937..d8f7e8b7bbb1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -44,7 +44,7 @@ static int mt7915_start(struct ieee80211_hw *hw)
 		mt7915_mac_enable_nf(dev, 1);
 	}
 
-	mt7915_mcu_set_sku_en(phy, !mt76_testmode_enabled(phy->mt76));
+	mt7915_mcu_set_sku_en(phy, true);
 	mt7915_mcu_set_chan_info(phy, MCU_EXT_CMD_SET_RX_PATH);
 
 	set_bit(MT76_STATE_RUNNING, &phy->mt76->state);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 68b170308c4a..da9ec7930cef 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -402,6 +402,8 @@ mt7915_tm_init(struct mt7915_phy *phy, bool en)
 	if (!test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
 		return;
 
+	mt7915_mcu_set_sku_en(phy, !en);
+
 	mt7915_tm_mode_ctrl(dev, en);
 	mt7915_tm_reg_backup_restore(phy);
 	mt7915_tm_set_trx(phy, TM_MAC_TXRX, !en);
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
