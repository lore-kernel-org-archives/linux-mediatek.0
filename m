Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E483EC43457
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 17:08:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B2EA21D7D
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 17:08:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ph417M0e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pDNR7rFD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B2EA21D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OC0HGxNAyXsIOQo4a+rYxIvaaIn5/RQ7fdZCXhor75c=; b=Ph417M0efQNvHQie6dCYJ83q5
	E8z7VQqUbXXGzO2YrT1gK2c/k9SH2aUU/vo1RtrCFmcx6p+KiPOMZMxXXRdF3rJFsWuz6dS6qnMEQ
	4ftL+9HnxmvPnxVPNAalB7QUDQihT5Nn/Rd5N3wRHttcgD5vg2o+sViAx6P5WBWLOlYDaDz3Op/oS
	bpuPTFKCevWQCUwXgT+s8W6Z2tZKCgCz0nOmZ4PMQx/W7FVZLBIDgnIbmpeZQXFjS669GesDvaxcI
	nnZ88KtvEmlOkMwGDtDL9aibdtQuQybdoEYHYL7ACjwhCH3u4pNbYyeRYdFLf1tF6st29XdxVw4vr
	gMBKVWrNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQZOc-0007cE-NG; Thu, 08 Oct 2020 17:08:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQZOZ-0007ad-7M
 for linux-mediatek@lists.infradead.org; Thu, 08 Oct 2020 17:08:00 +0000
X-UUID: f4452f1bda5642e2a5bc393bba1eace0-20201008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vB60bkKivbIghJ/O1u+Kwt4O/FxKdZHQa4QAp7QJNLE=; 
 b=pDNR7rFD08SH81tiLpOS0qHWi68IobGDm9auib+2t86+vPC7DfkPfxbW+Gh/VUbiKE7B5TfRTgbHFin3VQP3dIJSUD4Sw9bYfRzCvazQBgDJOLUd2bOtlMeutKc0x7Nz9ZOShk8Hd9/a91M3lQxtMewASv+jvpJeLF7PhH10P3c=;
X-UUID: f4452f1bda5642e2a5bc393bba1eace0-20201008
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1349382616; Thu, 08 Oct 2020 09:07:42 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Oct 2020 09:57:39 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Oct 2020 00:57:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 9 Oct 2020 00:57:37 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 2/2] mt76: mt7915: rename mt7915_mcu_get_rate_info to
 mt7915_mcu_get_tx_rate
Date: Fri, 9 Oct 2020 00:57:36 +0800
Message-ID: <6c4f3c9146c3a6b5657780961a5cf78413c017a1.1602175329.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <e1beae5f3177c82fa73635a8a96fa95be609149e.1602175329.git.ryder.lee@mediatek.com>
References: <e1beae5f3177c82fa73635a8a96fa95be609149e.1602175329.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_130759_707234_F5022D5D 
X-CRM114-Status: GOOD (  11.42  )
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
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Avoid confusion with rx rate query function.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
change since v2 -rebase on top of https://patchwork.kernel.org/patch/11808961/
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c    |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c    | 10 +++++-----
 drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index a7118df7b93f..521d0c2f6c25 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1422,7 +1422,7 @@ mt7915_mac_sta_stats_work(struct mt7915_phy *phy)
 		spin_unlock_bh(&dev->sta_poll_lock);
 
 		/* use MT_TX_FREE_RATE to report Tx rate for further devices */
-		mt7915_mcu_get_rate_info(dev, RATE_CTRL_RU_INFO, msta->wcid.idx);
+		mt7915_mcu_get_tx_rate(dev, RATE_CTRL_RU_INFO, msta->wcid.idx);
 
 		spin_lock_bh(&dev->sta_poll_lock);
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index dde053a76261..ce2357550015 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -352,8 +352,8 @@ mt7915_mcu_rx_radar_detected(struct mt7915_dev *dev, struct sk_buff *skb)
 }
 
 static void
-mt7915_mcu_tx_rate_cal(struct mt76_phy *mphy, struct mt7915_mcu_ra_info *ra,
-		       struct rate_info *rate, u16 r)
+mt7915_mcu_tx_rate_parse(struct mt76_phy *mphy, struct mt7915_mcu_ra_info *ra,
+			 struct rate_info *rate, u16 r)
 {
 	struct ieee80211_supported_band *sband;
 	u16 ru_idx = le16_to_cpu(ra->ru_idx);
@@ -465,11 +465,11 @@ mt7915_mcu_tx_rate_report(struct mt7915_dev *dev, struct sk_buff *skb)
 		mphy = dev->mt76.phy2;
 
 	/* current rate */
-	mt7915_mcu_tx_rate_cal(mphy, ra, &rate, curr);
+	mt7915_mcu_tx_rate_parse(mphy, ra, &rate, curr);
 	stats->tx_rate = rate;
 
 	/* probing rate */
-	mt7915_mcu_tx_rate_cal(mphy, ra, &prob_rate, probe);
+	mt7915_mcu_tx_rate_parse(mphy, ra, &prob_rate, probe);
 	stats->prob_rate = prob_rate;
 
 	if (attempts) {
@@ -3260,7 +3260,7 @@ int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index)
 				 sizeof(req), true);
 }
 
-int mt7915_mcu_get_rate_info(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx)
+int mt7915_mcu_get_tx_rate(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx)
 {
 	struct {
 		__le32 cmd;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 0ea3965c28f5..89cabda64f41 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -319,8 +319,8 @@ int mt7915_mcu_set_pulse_th(struct mt7915_dev *dev,
 			    const struct mt7915_dfs_pulse *pulse);
 int mt7915_mcu_set_radar_th(struct mt7915_dev *dev, int index,
 			    const struct mt7915_dfs_pattern *pattern);
-int mt7915_mcu_get_rate_info(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx);
 int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index);
+int mt7915_mcu_get_tx_rate(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx);
 int mt7915_mcu_get_rx_rate(struct mt7915_phy *phy, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, struct rate_info *rate);
 int mt7915_mcu_rdd_cmd(struct mt7915_dev *dev, enum mt7915_rdd_cmd cmd,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
