Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C62C47089
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 05:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CGEMjSYch1/HK0DQ9Nfh/Rz9YDEeejvih+yf/PFCdg=; b=RR9RE4+zH/JVTG0rhMS4gSTBYF
	tzLhOR0kXDJiUq9RKfO8BMXlJr4D+EeXEtuuNTVzOydzNHOkPtko1SqChIsJpRKGz8svNYrsk26gc
	wqA1O5dZLcLqiYMsro8x2U1LAf7NMD9dSjKhC6JmTa7hd7EgWPh2sg65/p/dxlMgmK5AysM4GDZjO
	sNj0PKrI1TywNTF7kyFjedIqLI1QbN6g7LyKxOaln4r+mpmG6izNoiUjSSKkpcgs4vO5WwkMTmFHr
	VkyHEhD8zLB7IVsrnq0RaBlqb/0oS0pYh4V1quuoNeHfZL+/dtcu0XYTUg3Hhoh+PdwVpQAVL4iEL
	EfRw76CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2mwm-00BeS8-W1; Wed, 07 Dec 2022 05:26:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2mwi-00Be8f-IL
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 05:26:19 +0000
X-UUID: 8058636a6981481d9f24f7c6a332fca9-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0CGEMjSYch1/HK0DQ9Nfh/Rz9YDEeejvih+yf/PFCdg=;
	b=tJgE2b/KoCQMuuBtbokZVBjtoF3fyXgffmDS1Qhr8pY1bNRs2CDD73gXQ+8kSdJ81cC/I+laG9JnkC13n8J3PnyAdramjQ/B67mAcc3mMfJFbmbQcFaFa/bNubWK3UcZ/lLT5R4DOTY+W0y67KWPJ5LBusbowuPW01PgyJeRtro=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:04090d8f-cfbd-4fdd-b8d8-022a42c17a2e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:f280c516-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8058636a6981481d9f24f7c6a332fca9-20221206
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 89445672; Tue, 06 Dec 2022 22:26:09 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 7 Dec 2022 13:25:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 7 Dec 2022 13:25:36 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH v2 2/3] wifi: mt76: mt7915: call mt7915_mcu_set_thermal_throttling() only after init_work
Date: Wed, 7 Dec 2022 13:24:59 +0800
Message-ID: <20221207052500.10855-3-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221207052500.10855-1-howard-yh.hsu@mediatek.com>
References: <20221207052500.10855-1-howard-yh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_212616_637279_DFADC988 
X-CRM114-Status: GOOD (  10.91  )
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

Enable thermal management by default shall not be executed during mcu
init. This causes thermal configuration being reset to the firmware
default settings.

Fixes: 0063b86c9120 ("mt76: mt7915e: Enable thermal management by default")
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 3 +--
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 5 +++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index abeecf15f1c8..8f4561eed5db 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -204,8 +204,7 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 	phy->throttle_temp[0] = 110;
 	phy->throttle_temp[1] = 120;
 
-	return mt7915_mcu_set_thermal_throttling(phy,
-						 MT7915_THERMAL_THROTTLE_MAX);
+	return 0;
 }
 
 static void mt7915_led_set_config(struct led_classdev *led_cdev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 0511d6a505b0..fc87216e40b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -57,6 +57,11 @@ int mt7915_run(struct ieee80211_hw *hw)
 		mt7915_mac_enable_nf(dev, phy->mt76->band_idx);
 	}
 
+	ret = mt7915_mcu_set_thermal_throttling(phy, MT7915_THERMAL_THROTTLE_MAX);
+
+	if (ret)
+		goto out;
+
 	ret = mt76_connac_mcu_set_rts_thresh(&dev->mt76, 0x92b,
 					     phy->mt76->band_idx);
 	if (ret)
-- 
2.18.0


