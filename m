Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66879C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB4A207FF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GU5eDINK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1lxRLZc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DB4A207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=80tZ4xcbTekJh9GhSRrtBmztgpnP1ZsH5eGG2wahcgw=; b=GU5eDINKLsFmKBnNUkAGiwjd2
	fZadEtAh7n/cgcQmr0qa54pH7YlsmtnQsC6UWd6sujfjvX6RAoL/GNWo3LtZDg/uaW7+tKOOHGV4J
	XGumr6VqDZcYzdjv+gxnk0CRhRWgowpIWE4UPlVospZVnNlB3tpG3fp+p1qFLcuFqj4fMQbtKDLZ6
	EIh3V3AnHhXZah8D2ilx178z0QA8Rdt3VcLbueJ6XUevWIawtoT2BEghLGp1IXcSN17F/nswY0fCy
	IQIlBkNU9HdGQzO90NrICbAMIW4ccno+0D6lpPfLoO+Q+wy6ayk9j13GwFA0DokGCSHx8DqBLrPVe
	v800QQLGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsK-00069Y-GE; Fri, 03 Jul 2020 08:16:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGsB-00060h-Dj
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:40 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75808207DA;
 Fri,  3 Jul 2020 08:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764198;
 bh=Fm9tOeu5GWojK5JnL0gGHEVoqiwCaWtUgZ5slvkwdxk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L1lxRLZclXhD1E+SbYgUD74L/+A8bIU3B8vItqwE0vSUVbrsI+HOYN2boaB2gvLY8
 c877Um1jQlcUFi/d99AB8ududUW7SNcP2QiCKamjfKXwfaL0RZ5ay235qmeD2IEQPs
 8F83/Kvx+VMPtZ+u5ZoFxFbKQ1aXt37rfMT9X92U=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 10/22] mt76: mt7615: wake device before performing freq scan
Date: Fri,  3 Jul 2020 10:15:49 +0200
Message-Id: <5a2efad230b8fe371fa03a1c07ea948bb3475b6d.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041639_596815_5E86BBF6 
X-CRM114-Status: GOOD (  10.32  )
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

Set device in full power before performing hw scan or hw scheduled scan

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 34 ++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index d1ddd5b15955..eb56cd7cb429 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -915,17 +915,26 @@ static int
 mt7615_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	       struct ieee80211_scan_request *req)
 {
+	struct mt7615_dev *dev = mt7615_hw_dev(hw);
 	struct mt76_phy *mphy = hw->priv;
+	int err;
 
-	return mt7615_mcu_hw_scan(mphy->priv, vif, req);
+	mt7615_mutex_acquire(dev);
+	err = mt7615_mcu_hw_scan(mphy->priv, vif, req);
+	mt7615_mutex_release(dev);
+
+	return err;
 }
 
 static void
 mt7615_cancel_hw_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 {
+	struct mt7615_dev *dev = mt7615_hw_dev(hw);
 	struct mt76_phy *mphy = hw->priv;
 
+	mt7615_mutex_acquire(dev);
 	mt7615_mcu_cancel_hw_scan(mphy->priv, vif);
+	mt7615_mutex_release(dev);
 }
 
 static int
@@ -933,22 +942,35 @@ mt7615_start_sched_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			struct cfg80211_sched_scan_request *req,
 			struct ieee80211_scan_ies *ies)
 {
+	struct mt7615_dev *dev = mt7615_hw_dev(hw);
 	struct mt76_phy *mphy = hw->priv;
 	int err;
 
+	mt7615_mutex_acquire(dev);
+
 	err = mt7615_mcu_sched_scan_req(mphy->priv, vif, req);
 	if (err < 0)
-		return err;
+		goto out;
 
-	return mt7615_mcu_sched_scan_enable(mphy->priv, vif, true);
+	err = mt7615_mcu_sched_scan_enable(mphy->priv, vif, true);
+out:
+	mt7615_mutex_release(dev);
+
+	return err;
 }
 
 static int
 mt7615_stop_sched_scan(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 {
+	struct mt7615_dev *dev = mt7615_hw_dev(hw);
 	struct mt76_phy *mphy = hw->priv;
+	int err;
+
+	mt7615_mutex_acquire(dev);
+	err = mt7615_mcu_sched_scan_enable(mphy->priv, vif, false);
+	mt7615_mutex_release(dev);
 
-	return mt7615_mcu_sched_scan_enable(mphy->priv, vif, false);
+	return err;
 }
 
 static int mt7615_remain_on_channel(struct ieee80211_hw *hw,
@@ -1074,7 +1096,11 @@ static void mt7615_set_rekey_data(struct ieee80211_hw *hw,
 				  struct ieee80211_vif *vif,
 				  struct cfg80211_gtk_rekey_data *data)
 {
+	struct mt7615_dev *dev = mt7615_hw_dev(hw);
+
+	mt7615_mutex_acquire(dev);
 	mt7615_mcu_update_gtk_rekey(hw, vif, data);
+	mt7615_mutex_release(dev);
 }
 #endif /* CONFIG_PM */
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
