Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AE2C4708C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 01:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2q+cYyA+eU3efar4YrIT4KglvWnkd7xCksdSU/9600Y=; b=JuMRsphnVxvS8PfHtJwIoto+wu
	gvZIoC4rJu60eAEPcvnVTP3oZobe2m+Eqeaxn71Ch6gvM+KAxIHHRI05z03scuILYuNaUYZtWKEP0
	EWF1j2uJQzhKvo0b2EZ5ZGATrFkSlAE+AylKb8IkMuiNRvSiH5Y9JH9oQFAPBpG8zu9EGyxZQEhQp
	nvDlLzDZPbsc9QFAwHgxGQexJSUaguUEBl7HHyJh+xhAy2CEcIWoRFbwqJ6r+cia4UsGmHSAQBmke
	XhjlcKcgbbsLG2yEkJSWi4M6QDAiI7YVdny9t2mWlpQWKLXcocqauJSWqS9nwMkDHmXz8/GywZo3P
	9FenC13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2MoS-00Eo0L-UN; Tue, 06 Dec 2022 01:32:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2MoP-00Enyc-QP
	for linux-mediatek@lists.infradead.org; Tue, 06 Dec 2022 01:31:59 +0000
X-UUID: 4f498a222a094d8e83c19473da2cf5a6-20221205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2q+cYyA+eU3efar4YrIT4KglvWnkd7xCksdSU/9600Y=;
	b=bUAxt1mZeEq+b1kq14gsAjTcoALWQUw0OCs/hPscIWZGMq1TM7DSPAfiTyc7VrXdlfqztXvzL3bQvmryRw3hE3GsFde7wgFGQq3HZsLaZ5mHYbls8HPxWk+sCnneRdyh1W5/juyzAUAxYsAqitQ7loJH31BKMgTmzTb4jjbvzYg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:24cd9b25-69e8-4f6c-b1f5-0511ede1f4e8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:5e46bad1-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4f498a222a094d8e83c19473da2cf5a6-20221205
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 693649718; Mon, 05 Dec 2022 18:31:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Dec 2022 09:31:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Dec 2022 09:31:18 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu
	<howard-yh.hsu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH 1/3] wifi: mt76: mt7915: rework mt7915_thermal_set_cur_throttle_state()
Date: Tue, 6 Dec 2022 09:29:49 +0800
Message-ID: <20221206012951.10719-2-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221206012951.10719-1-howard-yh.hsu@mediatek.com>
References: <20221206012951.10719-1-howard-yh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_173158_044440_EAFAB1C3 
X-CRM114-Status: GOOD (  13.40  )
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

This patch includes 3 changes:
1. The maximum throttle state can be set to 100 to fix the problem that maximum tx
cyle can only be set to 99.
2. Throttle state do not need to be different from the previous state.
This will make it is impossible for users to just change the
trigger/restore temp but not the throttle state.
3. Add dev_err so that it is easier to see invalid setting while looking at dmesg.

Fixes: 9fee8f3736eb ("mt76: mt7915e: Fix degraded performance after temporary overheat")
Co-developed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c   | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index c810c31fbd6e..abeecf15f1c8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -131,14 +131,17 @@ mt7915_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
 	u8 throttling = MT7915_THERMAL_THROTTLE_MAX - state;
 	int ret;
 
-	if (state > MT7915_CDEV_THROTTLE_MAX)
+	if (state > MT7915_THERMAL_THROTTLE_MAX) {
+		dev_err(phy->dev->mt76.dev,
+			"please specify a valid throttling state\n");
 		return -EINVAL;
+	}
 
-	if (phy->throttle_temp[0] > phy->throttle_temp[1])
-		return 0;
-
-	if (state == phy->cdev_state)
-		return 0;
+	if (phy->throttle_temp[0] > phy->throttle_temp[1]) {
+		dev_err(phy->dev->mt76.dev,
+			"temp1_crit shall not be greater than temp1_max\n");
+		return -EINVAL;
+	}
 
 	/*
 	 * cooling_device convention: 0 = no cooling, more = more cooling
@@ -164,7 +167,7 @@ static void mt7915_unregister_thermal(struct mt7915_phy *phy)
 	struct wiphy *wiphy = phy->mt76->hw->wiphy;
 
 	if (!phy->cdev)
-	    return;
+		return;
 
 	sysfs_remove_link(&wiphy->dev.kobj, "cooling_device");
 	thermal_cooling_device_unregister(phy->cdev);
@@ -1101,7 +1104,6 @@ static void mt7915_stop_hardware(struct mt7915_dev *dev)
 		mt7986_wmac_disable(dev);
 }
 
-
 int mt7915_register_device(struct mt7915_dev *dev)
 {
 	struct ieee80211_hw *hw = mt76_hw(dev);
-- 
2.18.0


