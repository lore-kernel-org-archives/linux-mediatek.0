Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AD6C4363D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 15:58:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8090920663
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 15:58:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RkMmiNjC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qIeYfWWh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8090920663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iJ82mTq1LFyPyOfdttagjwVnSWlICudioc3ZHNDcU14=; b=RkMmiNjC02oC3OAAzfLFJGVIH
	0bjKFumghIo9KrN7OvE5BXwKB2sw7tsKpr9XTuECH7SkyMiOdFWTOQEybwaiKetBXhfXqab4Tt57/
	onYfaOEwonhWwSKl+R0Qv7ggMc857S/LIweqKf1YOP0mb4Go2C3VRme6oYbgx7U3qxZO2Y1mhgExg
	VE1ycpah15ADtcS6NXcLnP/tIGiMqcE+M8ncxpTzPh1pZLyok4a9BltxkYLSHJNzun9ttFsEf/zcF
	kem2jCb/uYyr/CxQnlsNLZtx/f2RsVp5GIb1Aul/XCu2mJ/gHFOBw/UbSUpckQnOOnL46JzmC8oFR
	x638iUXqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPSsN-0003sh-Lf; Mon, 05 Oct 2020 15:58:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPSsJ-0003rM-Mb
 for linux-mediatek@lists.infradead.org; Mon, 05 Oct 2020 15:58:09 +0000
X-UUID: 4749f7a94379468dbd297ce607d906c3-20201005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=778ghGkMZz72jTLXw73LJtRp6+PZ+82zSbj3perVHWo=; 
 b=qIeYfWWhGE+N3tZUMMudrSlYcsu4L11jq0fGVksKJJ8leSpBP0nBDZB2a5CSEWV/GnXPlmd+6Bqtgdleg+pzcW4bG6Bi60yY1Vh5I29vEfivEkj9Kzw0+jhg8eJivmClkr4VJopjAGcbCa4pcCjU2vHP1YhpS3ExhWfd70H9tHU=;
X-UUID: 4749f7a94379468dbd297ce607d906c3-20201005
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1496966682; Mon, 05 Oct 2020 07:57:59 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Oct 2020 08:57:57 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Oct 2020 23:57:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Oct 2020 23:57:55 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/2] mt76: mt7915: rename mt7915_mcu_get_rate_info to
 mt7915_mcu_get_tx_rate
Date: Mon, 5 Oct 2020 23:57:53 +0800
Message-ID: <01543bd6f88eb9420d327a06b5f066c6721c5c2a.1601913208.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <b381936001c1d62e520283b83d5492bdcdd5cf4f.1601913208.git.ryder.lee@mediatek.com>
References: <b381936001c1d62e520283b83d5492bdcdd5cf4f.1601913208.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_115807_938245_DCD8A17A 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: linux-mediatek@lists.infradead.org, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Avoid confusion with rx rate query function.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
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
index f42a54cd8d45..016311639c24 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -422,8 +422,8 @@ mt7915_mcu_rx_radar_detected(struct mt7915_dev *dev, struct sk_buff *skb)
 }
 
 static void
-mt7915_mcu_tx_rate_cal(struct mt76_phy *mphy, struct mt7915_mcu_ra_info *ra,
-		       struct rate_info *rate, u16 r)
+mt7915_mcu_tx_rate_parse(struct mt76_phy *mphy, struct mt7915_mcu_ra_info *ra,
+			 struct rate_info *rate, u16 r)
 {
 	struct ieee80211_supported_band *sband;
 	u16 ru_idx = le16_to_cpu(ra->ru_idx);
@@ -535,11 +535,11 @@ mt7915_mcu_tx_rate_report(struct mt7915_dev *dev, struct sk_buff *skb)
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
@@ -3316,7 +3316,7 @@ int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index)
 				   sizeof(req), true);
 }
 
-int mt7915_mcu_get_rate_info(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx)
+int mt7915_mcu_get_tx_rate(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx)
 {
 	struct {
 		__le32 cmd;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 292075d3f0da..81c0440fd0a5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -319,7 +319,7 @@ int mt7915_mcu_set_pulse_th(struct mt7915_dev *dev,
 			    const struct mt7915_dfs_pulse *pulse);
 int mt7915_mcu_set_radar_th(struct mt7915_dev *dev, int index,
 			    const struct mt7915_dfs_pattern *pattern);
-int mt7915_mcu_get_rate_info(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx);
+int mt7915_mcu_get_tx_rate(struct mt7915_dev *dev, u32 cmd, u16 wlan_idx);
 int mt7915_mcu_get_temperature(struct mt7915_dev *dev, int index);
 int mt7915_mcu_rdd_cmd(struct mt7915_dev *dev, enum mt7915_rdd_cmd cmd,
 		       u8 index, u8 rx_sel, u8 val);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
