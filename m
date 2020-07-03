Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2B5C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF5DD207FF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BADJj184";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gW+0/2PS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF5DD207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HsinCmcCl6xQNu4i1w3Oz7ansmlqOA8MDpqbGJVn4Hs=; b=BADJj184FuF0QCd9G+yEmABrb
	wZpj2CUrSB6KLW/2y0cKNwLD/sriFupTeaMva95YvZdrqTvYHICE58OSM5vjTJFGy5npPdexTm5F2
	cRUTUtnT77Ko9F+ONbewkMglMrszzGFMUw4nRnTxRp4OoDhNrQgy8thXbBtuBYRyI3UZ7h7AFDv8X
	z/PAPM+SQgGzg2OqDB03Ls5HtHw/orgeyFmppydQFyJmJ0V6ZN6uvrT5F4WvyZAQkgf52Gem4FjHs
	I8NzgQJbMTdViDPaHgmInwoVk7U82zT3A2WSocGV9JMEUuqtfZP2XsZkh689DEp3ZoOw0szGj0GBa
	aUsgs5HhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsI-00067X-3o; Fri, 03 Jul 2020 08:16:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGs7-0005xb-Qd
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:37 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8A1B206A1;
 Fri,  3 Jul 2020 08:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764195;
 bh=NwFHdarlsNaJlUi/KIKifaoAqMuSWtyiUxMzZHRiKjo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gW+0/2PSvQbR20djFS+kbKIHM7VJxzJhU+wDvo+SdTsy/esJhRkhraN+2QfCbwXnE
 5T4NGom4ARQipgBJmUv8oisYKgQb7a85uzUWTVuAb02eOFlBI++48GCfXxf/MhnCSy
 Mr9yOPZBHBr9LKmG/GVzxjHXDyMBkmS9eu7q3F1k=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 08/22] mt76: mt7615: wake device in mt7615_update_channel
 before access regmap
Date: Fri,  3 Jul 2020 10:15:47 +0200
Message-Id: <818fc3c210f149cb44dcd608f4ac2582398dcfee.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041636_049414_9F51A84F 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, sean.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce mt7615_update_survey utility routine in order to compute
survey stats without waking up the device since it runs holding mt76 lock.
Run mt7615_pm_wake directly in mt7615_update_channel since it can run
with mt76.mutex held if called by mac80211

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c |  4 +--
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 30 +++++++++++++++++--
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 6aa3efa8f55e..f340af40f8f4 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -560,8 +560,7 @@ mt76_channel_state(struct mt76_phy *phy, struct ieee80211_channel *c)
 	return &msband->chan[idx];
 }
 
-static void
-mt76_update_survey_active_time(struct mt76_phy *phy, ktime_t time)
+void mt76_update_survey_active_time(struct mt76_phy *phy, ktime_t time)
 {
 	struct mt76_channel_state *state = phy->chan_state;
 
@@ -569,6 +568,7 @@ mt76_update_survey_active_time(struct mt76_phy *phy, ktime_t time)
 						  phy->survey_time));
 	phy->survey_time = time;
 }
+EXPORT_SYMBOL_GPL(mt76_update_survey_active_time);
 
 void mt76_update_survey(struct mt76_dev *dev)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 265ee55d22f1..c6e44283bd5f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -893,6 +893,7 @@ void mt76_release_buffered_frames(struct ieee80211_hw *hw,
 bool mt76_has_tx_pending(struct mt76_phy *phy);
 void mt76_set_channel(struct mt76_phy *phy);
 void mt76_update_survey(struct mt76_dev *dev);
+void mt76_update_survey_active_time(struct mt76_phy *phy, ktime_t time);
 int mt76_get_survey(struct ieee80211_hw *hw, int idx,
 		    struct survey_info *survey);
 void mt76_set_stream_caps(struct mt76_phy *phy, bool vht);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 2411fa66efa3..f62e7de81bd5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1747,9 +1747,9 @@ mt7615_phy_update_channel(struct mt76_phy *mphy, int idx)
 	state->noise = -(phy->noise >> 4);
 }
 
-void mt7615_update_channel(struct mt76_dev *mdev)
+static void __mt7615_update_channel(struct mt7615_dev *dev)
 {
-	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
+	struct mt76_dev *mdev = &dev->mt76;
 
 	mt7615_phy_update_channel(&mdev->phy, 0);
 	if (mdev->phy2)
@@ -1758,8 +1758,32 @@ void mt7615_update_channel(struct mt76_dev *mdev)
 	/* reset obss airtime */
 	mt76_set(dev, MT_WF_RMAC_MIB_TIME0, MT_WF_RMAC_MIB_RXTIME_CLR);
 }
+
+void mt7615_update_channel(struct mt76_dev *mdev)
+{
+	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
+
+	if (mt7615_pm_wake(dev))
+		return;
+
+	__mt7615_update_channel(dev);
+	mt7615_pm_power_save_sched(dev);
+}
 EXPORT_SYMBOL_GPL(mt7615_update_channel);
 
+static void mt7615_update_survey(struct mt7615_dev *dev)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	ktime_t cur_time;
+
+	__mt7615_update_channel(dev);
+	cur_time = ktime_get_boottime();
+
+	mt76_update_survey_active_time(&mdev->phy, cur_time);
+	if (mdev->phy2)
+		mt76_update_survey_active_time(mdev->phy2, cur_time);
+}
+
 static void
 mt7615_mac_update_mib_stats(struct mt7615_phy *phy)
 {
@@ -1888,7 +1912,7 @@ void mt7615_mac_work(struct work_struct *work)
 
 	mt7615_mutex_acquire(phy->dev);
 
-	mt76_update_survey(mdev);
+	mt7615_update_survey(phy->dev);
 	if (++phy->mac_work_count == 5) {
 		phy->mac_work_count = 0;
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
