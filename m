Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6614C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A516B207DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m6VpEyv6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bj/7+jOP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A516B207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WMDqJz61g0A9EZbp+OD4gzV61hOkr2Fu5pG7NLT76j8=; b=m6VpEyv6Sa3iO4k1WyX9jMRHv
	uZGrtdl+qJx1G5wTtpMIlnxZHbxOz/W2+6rSkqNyHSNPFltgSLrr/qoD3nYFLU0DagaCrUWl4DzjO
	VJOFPd0xihtGSGkQaPw5HWkAuYLGQ3g8x++0F1tVtK54ZWbduNqB6UsA/bprIEbzhXSEbIRJHUrkv
	kZf86tT3f2n9vGMVlzDxUhKCyl29rKyo7imXag+oyWqJOEfnMcOS9BA+wCPXkLqUKr8YRv0l+SRic
	lTCipD1AtN99tLh9An+TQRis8uuCsDURE9L/M6BiQloiV0a2MuwcSAHz5NW893Vc/ZR3rIfBOQAqc
	tSUM8c6BQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsZ-0006P6-7B; Fri, 03 Jul 2020 08:17:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGsM-0006At-5x
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:51 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3670920826;
 Fri,  3 Jul 2020 08:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764209;
 bh=fxijEvzRHz5bQaHcvkUcNOes0roKuYRxsT5sogrW3yc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bj/7+jOPWnPo4sXnk6DkbumDHT2HCfYIr0ssG+8XKIVr+0hOU7CF3ymjWJs3nKyzj
 zkLmPS6/RiR++9rGh5LFGusUdJZjix+QScBY/ttSTbyGod7VI/D3r/5VYTbxMFgInI
 iIHJb5jTaK0Hy4Iu3f0pxqBEsN2+fcjuguBITym4=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 16/22] mt76: mt7615: run mt7615_pm_wake in
 mt7615_mac_sta_{add, remove}
Date: Fri,  3 Jul 2020 10:15:55 +0200
Message-Id: <e95afc8730648c80d4f633165e71a8b6c242e537.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041650_325653_0A56D04D 
X-CRM114-Status: GOOD (  11.03  )
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

Run mt7615_pm_wake()/mt7615_pm_power_save_sched() directly in order to
wake the device from low power state in mt7615_mac_sta_{add,remove}
since they run holding mt76 mutex in common mt76 code

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 57d5e3aa9439..de4230b2d7bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -583,7 +583,7 @@ int mt7615_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt7615_dev *dev = container_of(mdev, struct mt7615_dev, mt76);
 	struct mt7615_sta *msta = (struct mt7615_sta *)sta->drv_priv;
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
-	int idx;
+	int idx, err;
 
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7615_WTBL_STA - 1);
 	if (idx < 0)
@@ -595,6 +595,10 @@ int mt7615_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	msta->wcid.idx = idx;
 	msta->wcid.ext_phy = mvif->band_idx;
 
+	err = mt7615_pm_wake(dev);
+	if (err)
+		return err;
+
 	if (vif->type == NL80211_IFTYPE_STATION && !sta->tdls) {
 		struct mt7615_phy *phy;
 
@@ -605,6 +609,8 @@ int mt7615_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 			       MT_WTBL_UPDATE_ADM_COUNT_CLEAR);
 	mt7615_mcu_sta_add(dev, vif, sta, true);
 
+	mt7615_pm_power_save_sched(dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mt7615_mac_sta_add);
@@ -616,6 +622,7 @@ void mt7615_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	struct mt7615_sta *msta = (struct mt7615_sta *)sta->drv_priv;
 
 	mt7615_free_pending_tx_skbs(dev, msta);
+	mt7615_pm_wake(dev);
 
 	mt7615_mcu_sta_add(dev, vif, sta, false);
 	mt7615_mac_wtbl_update(dev, msta->wcid.idx,
@@ -632,6 +639,8 @@ void mt7615_mac_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 	if (!list_empty(&msta->poll_list))
 		list_del_init(&msta->poll_list);
 	spin_unlock_bh(&dev->sta_poll_lock);
+
+	mt7615_pm_power_save_sched(dev);
 }
 EXPORT_SYMBOL_GPL(mt7615_mac_sta_remove);
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
