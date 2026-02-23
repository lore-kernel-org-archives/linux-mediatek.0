Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CC2E98DF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 07:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pUKoLkg3FdnL3mKOxcRqz3TLH9uvKR/C6S+tscgyo7w=; b=u+RgZIQvbnc/sekGRqLqL+Ofp/
	LVE4VIQsPfjioR2zH7wxNBrZ+7j/hWaOKUZYNSuLWllUPGG8GDzvf19qDEI6dTQ+/AR/vZvVHxVuc
	RbySt33PK9Wf0pItMWsBYcBtsssNH57FIco9fqV313hibYMRQfSPAr8V4OSrILBWRyFrA+XQ4vuFc
	nRe7vXSrE+9oxgipNarp2vUPDxvMrXcBcr3SgF4IqUZBX/o9R0+P/Lj5RGyDTaEQ05Ttnj+f85nc1
	sOLphbN5FUEUGG//UNAUmH/5ohywk9RTKdJOuHGEyyCe3+Oe3PbBkkMWsk5PWzwEC9qmbujRdsY3Q
	fRVnhwGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQX9-0000000HOEc-2oOS;
	Mon, 23 Feb 2026 07:39:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuQX5-0000000HOBw-2cJR
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 07:39:08 +0000
X-UUID: b8ba0da6108a11f1ad39f32c34db0b1c-20260223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pUKoLkg3FdnL3mKOxcRqz3TLH9uvKR/C6S+tscgyo7w=;
	b=NjQSoMn+CSxtrUrjUHIb0d8IosOq7pQwcBlZB34/1LP2AE48pFTTAH/TqMHfrQcnXBtJNC4XNfB6BXPN/q2NhNyniAqkgIkzVqz8vokPHwUAL/5sCOL4YlFgD0dgSun6tyQT1lM4w7SsG197XqgNbL9iYtTkIRE1SMOHMi08lxE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:ee8a811c-1381-4428-ba22-b0fa5b226854,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:29e8e2e9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8ba0da6108a11f1ad39f32c34db0b1c-20260223
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 527751872; Mon, 23 Feb 2026 00:39:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 23 Feb 2026 15:38:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 23 Feb 2026 15:38:59 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>
Subject: [PATCH 3/5] wifi: mt76: mt7921: refactor regulatory notifier flow
Date: Mon, 23 Feb 2026 15:38:52 +0800
Message-ID: <20260223073854.2464232-3-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260223073854.2464232-1-jb.tsai@mediatek.com>
References: <20260223073854.2464232-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_233907_662636_D01629E5 
X-CRM114-Status: GOOD (  13.21  )
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

Rename mt7921_regd_update() to mt7921_mcu_regd_update() to centralize
regd updates with error handling.

Signed-off-by: JB Tsai <jb.tsai@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/regd.c  | 45 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7921/regd.h  |  3 +-
 3 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index a173a61f2b49..3fdf55c056a6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -545,7 +545,7 @@ static int mt7921_pci_resume(struct device *device)
 	if (err < 0)
 		goto failed;
 
-	mt7921_regd_update(dev);
+	mt7921_mcu_regd_update(dev, mdev->alpha2, dev->country_ie_env);
 	err = mt7921_mcu_radio_led_ctrl(dev, EXT_CMD_RADIO_ON_LED);
 failed:
 	pm->suspended = false;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
index 70440ab8ba82..f795ee2eb446 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
@@ -72,18 +72,43 @@ mt7921_regd_channel_update(struct wiphy *wiphy, struct mt792x_dev *dev)
 	}
 }
 
-void mt7921_regd_update(struct mt792x_dev *dev)
+int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
+			   enum environment_cap country_ie_env)
 {
 	struct mt76_dev *mdev = &dev->mt76;
 	struct ieee80211_hw *hw = mdev->hw;
 	struct wiphy *wiphy = hw->wiphy;
+	int ret = 0;
+
+	dev->regd_in_progress = true;
+
+	mt792x_mutex_acquire(dev);
+	if (!dev->regd_change)
+		goto err;
+
+	ret = mt7921_mcu_set_clc(dev, alpha2, country_ie_env);
+	if (ret < 0)
+		goto err;
 
-	mt7921_mcu_set_clc(dev, mdev->alpha2, dev->country_ie_env);
 	mt7921_regd_channel_update(wiphy, dev);
-	mt76_connac_mcu_set_channel_domain(hw->priv);
-	mt7921_set_tx_sar_pwr(hw, NULL);
+
+	ret = mt76_connac_mcu_set_channel_domain(hw->priv);
+	if (ret < 0)
+		goto err;
+
+	ret = mt7921_set_tx_sar_pwr(hw, NULL);
+	if (ret < 0)
+		goto err;
+
+err:
+	mt792x_mutex_release(dev);
+	dev->regd_change = false;
+	dev->regd_in_progress = false;
+	wake_up(&dev->wait);
+
+	return ret;
 }
-EXPORT_SYMBOL_GPL(mt7921_regd_update);
+EXPORT_SYMBOL_GPL(mt7921_mcu_regd_update);
 
 void mt7921_regd_notifier(struct wiphy *wiphy,
 			  struct regulatory_request *request)
@@ -106,12 +131,6 @@ void mt7921_regd_notifier(struct wiphy *wiphy,
 	if (pm->suspended)
 		return;
 
-	dev->regd_in_progress = true;
-
-	mt792x_mutex_acquire(dev);
-	mt7921_regd_update(dev);
-	mt792x_mutex_release(dev);
-
-	dev->regd_in_progress = false;
-	wake_up(&dev->wait);
+	mt7921_mcu_regd_update(dev, request->alpha2,
+			       request->country_ie_env);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
index 74bc2fdd532c..da5bd4450312 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
@@ -6,7 +6,8 @@
 
 #include "mt7921.h"
 
-void mt7921_regd_update(struct mt792x_dev *dev);
+int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
+			   enum environment_cap country_ie_env);
 void mt7921_regd_notifier(struct wiphy *wiphy,
 			  struct regulatory_request *request);
 bool mt7921_regd_clc_supported(struct mt792x_dev *dev);
-- 
2.45.2


