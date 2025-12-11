Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5596D41C31
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Dec 2025 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NDkXuxIY36/CsPMFsGbOXVis7R+vQmC24CWTXr3hcVw=; b=uBUdBbCflMxTkXQ4O+l0Ir47bK
	/vnG1T1IIXEoHWUUUDA1HVmEROD3iPAyzuvSKtIhAfnya+ZiVcAScJVKP9LfWzIrst1MIf15xyK2Q
	C2fdDizVkTVsoMzRbEAkDhJfJHknWBnzdUWhxxuXAXOlX9QSHIwgShIMri4NuxRxN8tgkacil7/Gv
	yeiYHx1XBCxe2e62XyMOiylczTC9PNGPaQEwORtTnQFxuZRcWVRLV/XOcHhgZJOyhJUs9ISFS4FLq
	HZz9YoUZDE1ho+ZU9NKOhixQWE4hZLMd+XfS86OhwS78+UfgT34JzrAEGKQX14WksX/IVQi41QlGN
	/JZlvs7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTg1Y-0000000GbNg-0pBF;
	Thu, 11 Dec 2025 12:44:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTg1W-0000000GbNI-31v2
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Dec 2025 12:43:59 +0000
X-UUID: 0c1be84cd68f11f0a52f393f94899d25-20251211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NDkXuxIY36/CsPMFsGbOXVis7R+vQmC24CWTXr3hcVw=;
	b=fD+FcIuI35Jcbk8gThEhvllAfwwt4JoGeVq9b/wq8iMYXkd6EQMoMJplsC4iBFprvNO11mXkfNHvAUMOTDm12OAHGAJZHGjk9fuBbDEu77ilrLphufkJ1CYaKqbmdjmqzMrWXjk/aMWQFdF1xbHt4uK1WRqrzdO6M9LS+Bjpl9M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:31312856-8b12-4fe9-97c5-dd2720c43ed4,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:d58d15aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0c1be84cd68f11f0a52f393f94899d25-20251211
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <leon.yen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 424644945; Thu, 11 Dec 2025 05:43:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 11 Dec 2025 20:43:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 11 Dec 2025 20:43:49 +0800
From: Leon Yen <leon.yen@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<mingyen.hsieh@mediatek.com>, <michael.lo@mediatek.com>,
	<allan.wang@mediatek.com>, <quan.zhou@mediatek.com>,
	<sarick.jiang@mediatek.com>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <leon.yen@mediatek.com>
Subject: [PATCH] wifi: mt76: mt792x: Fix a potential deadlock in high-load situations
Date: Thu, 11 Dec 2025 20:43:44 +0800
Message-ID: <20251211124344.4172470-1-leon.yen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_044358_788906_B65FB03F 
X-CRM114-Status: GOOD (  12.03  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A deadlock may occur between two works, ps_work and mac_work, if their work
functions run simultaneously as they attempt to cancel each other by
calling cancel_delayed_work_sync().

mt792x_mac_work() ->   ...  -> cancel_delayed_work_sync(&pm->ps_work);
mt792x_pm_power_save_work() -> cancel_delayed_work_sync(&mphy->mac_work);

In high-load situations, they are queued but may not have chance to be
executed until the CPUs are released. Once the CPUs are available, there
is a high possibility that the ps_work function and mac_work function will
be executed simultaneously, resulting in a deadlock.

This patch ensures that the ps_work function and mac_work function can run
exclusively by adding two flags to indicate their running status.The work
function will reschedule itself if the opposite is currently running.

Signed-off-by: Leon Yen <leon.yen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h        |  1 +
 drivers/net/wireless/mediatek/mt76/mt76_connac.h |  1 +
 drivers/net/wireless/mediatek/mt76/mt792x_mac.c  | 13 +++++++++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index d05e83ea1cac..0414a4898d80 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -892,6 +892,7 @@ struct mt76_phy {
 #endif
 
 	struct delayed_work mac_work;
+	atomic_t mac_work_running;
 	u8 mac_work_count;
 
 	struct {
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 813d61bffc2c..eefa0147f883 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -107,6 +107,7 @@ struct mt76_connac_pm {
 	struct mutex mutex;
 
 	struct delayed_work ps_work;
+	atomic_t ps_work_running;
 	unsigned long last_activity;
 	unsigned long idle_timeout;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
index 71dec93094eb..22345031e262 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
@@ -15,6 +15,10 @@ void mt792x_mac_work(struct work_struct *work)
 					       mac_work.work);
 	phy = mphy->priv;
 
+	if (atomic_read(&phy->dev->pm.ps_work_running))
+		goto out;
+	atomic_set(&mphy->mac_work_running, 1);
+
 	mt792x_mutex_acquire(phy->dev);
 
 	mt76_update_survey(mphy);
@@ -27,8 +31,10 @@ void mt792x_mac_work(struct work_struct *work)
 	mt792x_mutex_release(phy->dev);
 
 	mt76_tx_status_check(mphy->dev, false);
+out:
 	ieee80211_queue_delayed_work(phy->mt76->hw, &mphy->mac_work,
 				     MT792x_WATCHDOG_TIME);
+	atomic_set(&mphy->mac_work_running, 0);
 }
 EXPORT_SYMBOL_GPL(mt792x_mac_work);
 
@@ -356,6 +362,11 @@ void mt792x_pm_power_save_work(struct work_struct *work)
 	mphy = dev->phy.mt76;
 
 	delta = dev->pm.idle_timeout;
+
+	if (atomic_read(&mphy->mac_work_running))
+		goto out;
+	atomic_set(&dev->pm.ps_work_running, 1);
+
 	if (test_bit(MT76_HW_SCANNING, &mphy->state) ||
 	    test_bit(MT76_HW_SCHED_SCANNING, &mphy->state) ||
 	    dev->fw_assert)
@@ -376,9 +387,11 @@ void mt792x_pm_power_save_work(struct work_struct *work)
 
 	if (!mt792x_mcu_fw_pmctrl(dev)) {
 		cancel_delayed_work_sync(&mphy->mac_work);
+		atomic_set(&dev->pm.ps_work_running, 0);
 		return;
 	}
 out:
 	queue_delayed_work(dev->mt76.wq, &dev->pm.ps_work, delta);
+	atomic_set(&dev->pm.ps_work_running, 0);
 }
 EXPORT_SYMBOL_GPL(mt792x_pm_power_save_work);
-- 
2.45.2


