Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E3CC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 02:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjgWf+nNweGdAjzb9i9IUL2kpUv96rq6qUQ5X2JeHOA=; b=arVX47cK57mHDzXfnc5vuDwUOM
	NyYxeCw1AtRK/QiHxpN3ooahfqBA4FRoS+HRcQjg0hA2LYVgwEdlQUtHRRxsuGES8kNNjB1OqxUHC
	s7OPxAaLLaq/EOF2KqY9b00fPYkqI5pVbXE6wH5l4YRnXwpqLhHeu8y9V4gpQsjRq4o5nyEPJ5EhL
	OPhXo5IvC/cX7GQ9HraTuTeiZcrIZjejXZp6eYYcbp49vZawC2K+Ro4EoAishJ3afCC//5ROp8uA8
	9IOp5yZHDOhaIJP0rzmq9U77iYIAnTOw9vLxLHoOUjH/O2JrVmUOXOEQxgt9y4Jk61+rpX4+Wdl5i
	6+MiM5cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Hz0-00B1CC-C9; Wed, 14 Dec 2022 02:58:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Hyx-00B18u-NU
	for linux-mediatek@lists.infradead.org; Wed, 14 Dec 2022 02:58:57 +0000
X-UUID: 0027a3449ff24df6a5eb41ae3fd71fb8-20221213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gjgWf+nNweGdAjzb9i9IUL2kpUv96rq6qUQ5X2JeHOA=;
	b=clUUy7FpfF8rZYcMgwpxdWNB72omvPVQmgPCyXf1rAHEQZA/LQxsva7o57so2iLniK6yFMFwjaDdACvxaUI2jjIQw4uO0IDzYGKcckunAHA6RTgkpOhIgH5liHkum6Sd/Tx8WY5zDpvqi/bT/OWJ3VjFkKPFlfmkpQ2hh4Tobdw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:33e4c7bb-48b6-40df-9300-74abe03b1317,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:f1203725-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0027a3449ff24df6a5eb41ae3fd71fb8-20221213
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 846948867; Tue, 13 Dec 2022 19:58:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Dec 2022 10:28:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 14 Dec 2022 10:28:14 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH v3 1/4] wifi: mt76: mt7915: call mt7915_mcu_set_thermal_throttling() only after init_work
Date: Wed, 14 Dec 2022 10:28:06 +0800
Message-ID: <20221214022809.32087-2-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221214022809.32087-1-howard-yh.hsu@mediatek.com>
References: <20221214022809.32087-1-howard-yh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_185855_801170_B1887A71 
X-CRM114-Status: GOOD (  10.63  )
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
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 3 +--
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 6 ++++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 571c94835942..11407e18e56a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -201,8 +201,7 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 	phy->throttle_temp[0] = 110;
 	phy->throttle_temp[1] = 120;
 
-	return mt7915_mcu_set_thermal_throttling(phy,
-						 MT7915_THERMAL_THROTTLE_MAX);
+	return 0;
 }
 
 static void mt7915_led_set_config(struct led_classdev *led_cdev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 0511d6a505b0..98af032eba09 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -57,6 +57,12 @@ int mt7915_run(struct ieee80211_hw *hw)
 		mt7915_mac_enable_nf(dev, phy->mt76->band_idx);
 	}
 
+	ret = mt7915_mcu_set_thermal_throttling(phy,
+						MT7915_THERMAL_THROTTLE_MAX);
+
+	if (ret)
+		goto out;
+
 	ret = mt76_connac_mcu_set_rts_thresh(&dev->mt76, 0x92b,
 					     phy->mt76->band_idx);
 	if (ret)
-- 
2.18.0


