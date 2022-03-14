Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927B2C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 15:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/bwzSpq62BUVrisDCysK9rZn+KNbUZxzExMCHM3fYI=; b=3lP7aaxa1Hzuu0
	z1YjpUkl5geuFBO8uj0SX+45IwIdu5yqCTCB6kFhpCOAlcD7SpYuz7bg9W1QPfKY1QuPAjf97kP5t
	AkJVNHeaUijdARthMA5KQX+cDa6fRobj1BhZqw73r9qMzRcQLOaSQsvAWK5keQIECjbgEs8rY5rly
	ZaDBWY5t1Iu3dEvPk7cBP4FBRmRI3BEYP8u03CGpLBDS3j3M/Y4jfvvrmesNHGbeEG8vLXOC1Zvg0
	cqN2D/dn8aMAeUXCeGruO68cluluWvnM94cttXrlLs0a/xRKP1MeiKFruHRD/DXmD9iaHFODdlsq3
	MM7hfVdUMuaE1NRnh3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTmLj-005mKT-BD; Mon, 14 Mar 2022 15:11:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTmLf-005mHE-1A
 for linux-mediatek@lists.infradead.org; Mon, 14 Mar 2022 15:11:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AF75FB80E4E;
 Mon, 14 Mar 2022 15:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011FFC340EC;
 Mon, 14 Mar 2022 15:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647270660;
 bh=7adOgiLt2r66OQbWnreCRQ/NSVnIjZDWQcWzyT/CjsI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a0qAPwQpAIOtXfR2FwdY0TWgTA/TsPATsLx+GwF6VIeu/HFvke9Tyw8DGTHjx7kdB
 A6wSK9aUKJ9p2PFWVlyxnGyAd6XRefj8kDeSvxy+Oa4c6+65o0RR9wm8xDhOB5OqOW
 98X33/xu87GCgK9WNtHSDnEZ2PGssKNCAxRDqKVi5z2AUwoT7Pmo3CSIjI2PapKRmC
 hPHlNlh/2yTbepoElpvLvdf/zMMsIgyD1pWaw/dw9v0VBTkAasN5+aSvL85LAxbbv6
 4yQCS33/TgY2J8C+bDfPgCv67uly1Gv8SyT44evzZrDZXBopQ91TpzFoiNZDgQG7nw
 c4NTVzSA/vMiQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v5 4/9] mt76: mt7921: disable runtime pm for usb
Date: Mon, 14 Mar 2022 16:10:26 +0100
Message-Id: <6c640dbe40924f03484164d5c3d272fe114dd6d3.1647270525.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647270525.git.lorenzo@kernel.org>
References: <cover.1647270525.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_081103_266074_C9F2E422 
X-CRM114-Status: GOOD (  10.17  )
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

Runtime-pm is not currently supported by usb driver

Tested-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c |  6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7921/init.c    | 10 ++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
index 32004b55a360..bce76417f95d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -267,6 +267,9 @@ mt7921_pm_set(void *data, u64 val)
 	struct mt7921_dev *dev = data;
 	struct mt76_connac_pm *pm = &dev->pm;
 
+	if (mt76_is_usb(&dev->mt76))
+		return -EOPNOTSUPP;
+
 	mutex_lock(&dev->mt76.mutex);
 
 	if (val == pm->enable_user)
@@ -311,6 +314,9 @@ mt7921_deep_sleep_set(void *data, u64 val)
 	bool monitor = !!(dev->mphy.hw->conf.flags & IEEE80211_CONF_MONITOR);
 	bool enable = !!val;
 
+	if (mt76_is_usb(&dev->mt76))
+		return -EOPNOTSUPP;
+
 	mt7921_mutex_acquire(dev);
 	if (pm->ds_enable_user == enable)
 		goto out;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index fa6af85bba7b..54f51e7b48a0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -226,10 +226,12 @@ int mt7921_register_device(struct mt7921_dev *dev)
 	dev->pm.idle_timeout = MT7921_PM_TIMEOUT;
 	dev->pm.stats.last_wake_event = jiffies;
 	dev->pm.stats.last_doze_event = jiffies;
-	dev->pm.enable_user = true;
-	dev->pm.enable = true;
-	dev->pm.ds_enable_user = true;
-	dev->pm.ds_enable = true;
+	if (!mt76_is_usb(&dev->mt76)) {
+		dev->pm.enable_user = true;
+		dev->pm.enable = true;
+		dev->pm.ds_enable_user = true;
+		dev->pm.ds_enable = true;
+	}
 
 	if (mt76_is_sdio(&dev->mt76))
 		hw->extra_tx_headroom += MT_SDIO_TXD_SIZE + MT_SDIO_HDR_SIZE;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
