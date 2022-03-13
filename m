Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F38EC433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Mar 2022 12:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/bwzSpq62BUVrisDCysK9rZn+KNbUZxzExMCHM3fYI=; b=5ENEIBibRj8qEe
	+FbZnELhT7tkfRNPmQhBqFoAwumZQEvnDD8je6ZRY4RkxkxI6QmojPqk5rt2sp6pHr+5QXcBI+yh6
	XnLYjoDgVFYczqFHjbhAdqxokdi77HN6OHtDT1hHvDpI+pZawSD4ZUDtihHtmvrBW8EJofepaK5Wa
	/JqWBCrulDPsFAkO3G22+N+X07bqsLs6edA3GYoo51uZ0WU65qN3IDY7DQStYVaWrPIZyoDIi0XNw
	BFw5d1BmQkpYKiKO3T2KnKw2eOZ8G5ATVL/6pqReSrWdIZsF2nHuQjaSW58IggG/z13QsZoRofhHG
	1GjoVGXVMJVw3wVhbGug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTNfC-002mGg-GL; Sun, 13 Mar 2022 12:49:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTNf7-002mDZ-Ha
 for linux-mediatek@lists.infradead.org; Sun, 13 Mar 2022 12:49:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1513A610E7;
 Sun, 13 Mar 2022 12:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DEBC340E8;
 Sun, 13 Mar 2022 12:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647175768;
 bh=7adOgiLt2r66OQbWnreCRQ/NSVnIjZDWQcWzyT/CjsI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U+M8TbcYfMkT2rA95e6Wz+B7zf7wUO+/1w4bpiJC/fd6ZWnl1Y68nTihu769xHRjf
 7aSeH5ewKsCQhUU3LVaZ0i5OKvxbwFVz8cFsnv8sIFRza6D+qWnFt4ZJf4BvdIxjnO
 UbsK7yusV5GZ4vP41pw7xaudKTk0VtekdLbYeNc1cn4Ys/xgJW28nONDKiLYo+dd2u
 jRCrzocnFbib+iRPwXx8F5zwSe2UzvFuR/yKIDylp1CCqFQW2veDwZrXJ/LkRrHxxT
 Ye0VcAEz+FMIpfG+maKgqOZENL2ktY6eCT4qfhL5dbRI4BMjmZDllZGQPBToxx+LtO
 96fzlvj6UsHlg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, deren.wu@mediatek.com,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 4/9] mt76: mt7921: disable runtime pm for usb
Date: Sun, 13 Mar 2022 13:48:54 +0100
Message-Id: <779e54963d964faad416065a715c52e4d5d0f396.1647175554.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647175554.git.lorenzo@kernel.org>
References: <cover.1647175554.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220313_054929_657574_C38178C4 
X-CRM114-Status: GOOD (  10.26  )
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
