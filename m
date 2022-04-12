Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEF1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 22:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GdhfAt48F7LFezxgkm1oEh1YW8QYKymw0t1aICXtitY=; b=hn7lvZaU7KXaSd
	u4kmRg5yV8hnTZfwmrQMABbpbL+cH767fNEZd2ix3oXGjvaWb/O0jD/QdgSumvBIbqA/5epuOyVMb
	wFEYVJmgLUF1lU+T+JPhvLBgG4gcZeh45UraVI2NQCRPuVMgT1tbL/TLsU64lSnMlfd4fWMUfrSqL
	hzOn5CS3nPXb9vczPy5iTkk3/dvSs0tYWrHJdytDUOleqhhvqKf2JW52bcXQS2WmKReEM6MErk6eF
	UeGVhs41IRbIOszlwN/h2gDz7k8R7p2JdFR7fCI8IV2dTT17u6u+cUF1w81s5sj0MqgVWM/AAqqjg
	nvcFTxQLnEBio+LiSIiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neOz7-00FyDT-7d; Tue, 12 Apr 2022 22:27:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neOz2-00FyD1-LI
 for linux-mediatek@lists.infradead.org; Tue, 12 Apr 2022 22:27:39 +0000
X-UUID: 32c59296612c4099b0e0d42a370029a5-20220412
X-UUID: 32c59296612c4099b0e0d42a370029a5-20220412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 486865203; Tue, 12 Apr 2022 15:27:29 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 15:27:28 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 13 Apr 2022 06:27:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 13 Apr 2022 06:27:26 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Ryder
 Lee <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: remove SCS feature
Date: Wed, 13 Apr 2022 06:27:24 +0800
Message-ID: <aa178b016b404139700618aca64222a8cec0ca8d.1649802160.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_152736_738742_46DABEE7 
X-CRM114-Status: GOOD (  10.49  )
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

SCS is obsoleted and no longer used, so remove it.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h |  1 -
 drivers/net/wireless/mediatek/mt76/mt7915/main.c |  8 --------
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  | 16 ----------------
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.h  | 10 ----------
 .../net/wireless/mediatek/mt76/mt7915/mt7915.h   |  1 -
 5 files changed, 36 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index c3c93338d56a..561fb0368708 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -974,7 +974,6 @@ enum {
 	MCU_EXT_CMD_SET_RDD_PATTERN = 0x7d,
 	MCU_EXT_CMD_MWDS_SUPPORT = 0x80,
 	MCU_EXT_CMD_SET_SER_TRIGGER = 0x81,
-	MCU_EXT_CMD_SCS_CTRL = 0x82,
 	MCU_EXT_CMD_TWT_AGRT_UPDATE = 0x94,
 	MCU_EXT_CMD_FW_DBG_CTRL = 0x95,
 	MCU_EXT_CMD_OFFCH_SCAN_CTRL = 0x9a,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 9b8defb15b4e..5177b19f9154 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -42,10 +42,6 @@ static int mt7915_start(struct ieee80211_hw *hw)
 		if (ret)
 			goto out;
 
-		ret = mt7915_mcu_set_scs(dev, 0, true);
-		if (ret)
-			goto out;
-
 		mt7915_mac_enable_nf(dev, 0);
 	}
 
@@ -58,10 +54,6 @@ static int mt7915_start(struct ieee80211_hw *hw)
 		if (ret)
 			goto out;
 
-		ret = mt7915_mcu_set_scs(dev, 1, true);
-		if (ret)
-			goto out;
-
 		mt7915_mac_enable_nf(dev, 1);
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 736c9c342baa..4bceba87fd8c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2589,22 +2589,6 @@ int mt7915_mcu_set_mac(struct mt7915_dev *dev, int band,
 				 &req_mac, sizeof(req_mac), true);
 }
 
-int mt7915_mcu_set_scs(struct mt7915_dev *dev, u8 band, bool enable)
-{
-	struct {
-		__le32 cmd;
-		u8 band;
-		u8 enable;
-	} __packed req = {
-		.cmd = cpu_to_le32(SCS_ENABLE),
-		.band = band,
-		.enable = enable + 1,
-	};
-
-	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD(SCS_CTRL), &req,
-				 sizeof(req), false);
-}
-
 int mt7915_mcu_update_edca(struct mt7915_dev *dev, void *param)
 {
 	struct mt7915_mcu_tx *req = (struct mt7915_mcu_tx *)param;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 960072a44222..064d33e33738 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -304,16 +304,6 @@ enum mcu_mmps_mode {
 	MCU_MMPS_DISABLE,
 };
 
-enum {
-	SCS_SEND_DATA,
-	SCS_SET_MANUAL_PD_TH,
-	SCS_CONFIG,
-	SCS_ENABLE,
-	SCS_SHOW_INFO,
-	SCS_GET_GLO_ADDR,
-	SCS_GET_GLO_ADDR_EVENT,
-};
-
 struct bss_info_bmc_rate {
 	__le16 tag;
 	__le16 len;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index ca129e5e380e..419ff08176b4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -486,7 +486,6 @@ int mt7915_mcu_set_mac(struct mt7915_dev *dev, int band, bool enable,
 		       bool hdr_trans);
 int mt7915_mcu_set_test_param(struct mt7915_dev *dev, u8 param, bool test_mode,
 			      u8 en);
-int mt7915_mcu_set_scs(struct mt7915_dev *dev, u8 band, bool enable);
 int mt7915_mcu_set_ser(struct mt7915_dev *dev, u8 action, u8 set, u8 band);
 int mt7915_mcu_set_sku_en(struct mt7915_phy *phy, bool enable);
 int mt7915_mcu_set_txpower_sku(struct mt7915_phy *phy);
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
