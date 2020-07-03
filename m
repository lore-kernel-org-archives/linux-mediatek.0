Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553EDC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2797B207DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JLUKkrm9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lrm0ZRNB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2797B207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ie0sJoCNQ1KqY3XhLKNyAGYQlD8OS3yApTLqu6pUtm0=; b=JLUKkrm9UvSsFYI9MnvHUsOdf
	ztawB/hXkPuEIoPSOhVtsApWIQ7IYPbdEgI636Vys3EstQdHfksLYNPXQd3wCArNyfiUEpl7opgq9
	kQEtxZGKs+eGFQpkOSC573qo3FcEvg/WSHUAq7sCUd0B/JMUBkolHSf3GG84qSNeyEPMMJ8eKimUR
	WQw9w8n/jJZ4eO6PBlpWxK8Fg/iqq7ne7mMV+sgbijOVE668eaOY4yldrSWsjionJXVbwITfErJel
	ObID0L7+icwCAw1z8mH+0hbhX5/E7Ff6KJGOMy8b1S4oax1y9GTty+bdy9vn9E65AN34Tai63G8iV
	XO+0Vm7bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsc-0006Sx-VT; Fri, 03 Jul 2020 08:17:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGsT-0006IP-C7
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:58 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 647AC206A1;
 Fri,  3 Jul 2020 08:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764216;
 bh=pL/RJwV34kLhA82mkIjmWG0XdyPXBhhdwvUgPc2fKPM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lrm0ZRNBNJPwkB83puOQx04Z+ftbN6fXmO5/smLBvTXkbr/gWPbmL56oaFwCeRVBL
 g6h9o+4ZymMT2Y2KlnSuNpHdVYnpTbiUh7urW8rKrDH/C9v32p7kaZsX+G4A3vebtJ
 IBaEwcmNicWzSQEEZkGHL3gSaYvH4p5YsylOKFtM=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 20/22] mt76: mt7615: enable beacon hw filter for runtime-pm
Date: Fri,  3 Jul 2020 10:15:59 +0200
Message-Id: <69f1c9c97890f3cd8cbd21e5df1a79df1ab8ba07.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041657_655288_47365FEF 
X-CRM114-Status: GOOD (  12.97  )
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

In order to reduce number of received interrupts and power consumption,
enable hw beacon filter if runtime-pm is enabled

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 26 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/main.c  | 19 ++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  5 ++--
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  2 ++
 4 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index d7c2c08da3c7..bdd9b66ca47d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1929,8 +1929,31 @@ void mt7615_pm_power_save_work(struct work_struct *work)
 				   MT7615_PM_TIMEOUT);
 }
 
+static void
+mt7615_pm_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	struct mt7615_phy *phy = priv;
+	struct mt7615_dev *dev = phy->dev;
+	bool ext_phy = phy != &dev->phy;
+
+	if (mt7615_mcu_set_bss_pm(dev, vif, dev->pm.enable))
+		return;
+
+	if (dev->pm.enable) {
+		vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
+		mt76_set(dev, MT_WF_RFCR(ext_phy),
+			 MT_WF_RFCR_DROP_OTHER_BEACON);
+	} else {
+		vif->driver_flags &= ~IEEE80211_VIF_BEACON_FILTER;
+		mt76_clear(dev, MT_WF_RFCR(ext_phy),
+			   MT_WF_RFCR_DROP_OTHER_BEACON);
+	}
+}
+
 int mt7615_pm_set_enable(struct mt7615_dev *dev, bool enable)
 {
+	struct mt76_phy *mphy = dev->phy.mt76;
+
 	if (!mt7615_firmware_offload(dev) || !mt76_is_mmio(&dev->mt76))
 		return -EOPNOTSUPP;
 
@@ -1940,6 +1963,9 @@ int mt7615_pm_set_enable(struct mt7615_dev *dev, bool enable)
 		goto out;
 
 	dev->pm.enable = enable;
+	ieee80211_iterate_active_interfaces(mphy->hw,
+					    IEEE80211_IFACE_ITER_RESUME_ALL,
+					    mt7615_pm_interface_iter, mphy->priv);
 out:
 	mt7615_mutex_release(dev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 0ce76472df2c..b1cfae7c4b55 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -209,6 +209,18 @@ static int mt7615_add_interface(struct ieee80211_hw *hw,
 	}
 
 	ret = mt7615_mcu_add_dev_info(dev, vif, true);
+	if (ret)
+		goto out;
+
+	if (dev->pm.enable) {
+		ret = mt7615_mcu_set_bss_pm(dev, vif, true);
+		if (ret)
+			goto out;
+
+		vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
+		mt76_set(dev, MT_WF_RFCR(ext_phy),
+			 MT_WF_RFCR_DROP_OTHER_BEACON);
+	}
 out:
 	mt7615_mutex_release(dev);
 
@@ -234,6 +246,13 @@ static void mt7615_remove_interface(struct ieee80211_hw *hw,
 
 	mt7615_free_pending_tx_skbs(dev, msta);
 
+	if (dev->pm.enable) {
+		bool ext_phy = phy != &dev->phy;
+
+		mt7615_mcu_set_bss_pm(dev, vif, false);
+		mt76_clear(dev, MT_WF_RFCR(ext_phy),
+			   MT_WF_RFCR_DROP_OTHER_BEACON);
+	}
 	mt7615_mcu_add_dev_info(dev, vif, false);
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], NULL);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 195710a5da2a..4b576cc3c5c0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -3581,9 +3581,8 @@ int mt7615_mcu_set_hif_suspend(struct mt7615_dev *dev, bool suspend)
 }
 EXPORT_SYMBOL_GPL(mt7615_mcu_set_hif_suspend);
 
-static int
-mt7615_mcu_set_bss_pm(struct mt7615_dev *dev, struct ieee80211_vif *vif,
-		      bool enable)
+int mt7615_mcu_set_bss_pm(struct mt7615_dev *dev, struct ieee80211_vif *vif,
+			  bool enable)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index b80bf79e4849..46a2a38d0b1f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -640,6 +640,8 @@ int mt7615_driver_own(struct mt7615_dev *dev);
 int mt7615_init_debugfs(struct mt7615_dev *dev);
 int mt7615_mcu_wait_response(struct mt7615_dev *dev, int cmd, int seq);
 
+int mt7615_mcu_set_bss_pm(struct mt7615_dev *dev, struct ieee80211_vif *vif,
+			  bool enable);
 int mt7615_mcu_set_hif_suspend(struct mt7615_dev *dev, bool suspend);
 void mt7615_mcu_set_suspend_iter(void *priv, u8 *mac,
 				 struct ieee80211_vif *vif);
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
