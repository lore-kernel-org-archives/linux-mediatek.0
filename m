Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E46CC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 03:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L926ZhafewJStmjMylo4c48rggKUDrBSQaRHkO641RU=; b=wUdbJoJWyfgo9F7jKA1CvgbMIN
	E77XhOf/rr0NORQXuWxJnZRZuTKdbGLzhJv5xLfliwmEzq521ZMR9t4CUzLIPV1bEvDsdRJS45Nma
	3c9DnS1hZwT7XmSttTT9tdPZmbBjyv0ShGaHkixSyBdkfKX5IqQ10GhpjG/v4jEFnfAcC78XcUl7w
	xIPbvXYUp/8FUhffN+R5Dvj442ZOCLrDDEOYBIwSaLGtloXpmQlv7a19flNh5l4gudTL6i8X1iPo3
	LLRxXhyhi+VVuw2/yhNiI9BzDtq1hNUAcvLWNysTLU7VA2D43XyVcVZTtP0PNIpd09AF5rDihBLC1
	ZBt3aHqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5IIY-00B7bm-HF; Wed, 14 Dec 2022 03:19:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5IIV-00B7bC-RN
	for linux-mediatek@lists.infradead.org; Wed, 14 Dec 2022 03:19:09 +0000
X-UUID: 7eff1774ccaf48de8b0a200a600b0812-20221213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=L926ZhafewJStmjMylo4c48rggKUDrBSQaRHkO641RU=;
	b=pM6q273zWrUYuPZO7YlMECalFnP5XU3/n06Lf69pNXd8jDwqyVagA9qNhjRkwsEEjcwCoAz2ciUHXymq2ddlu0TIOFN61thoO3OfB2rzlEzqAaZ2vcdav6fZPU0zYjxOuZemSwMykDZAqmZJcXfam2UVGI1ZIZEaHoGHhvHskfE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:d44c2166-eaa2-4ab4-b5b2-88a21e1200a9,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:6ddd3725-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7eff1774ccaf48de8b0a200a600b0812-20221213
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 513203660; Tue, 13 Dec 2022 20:19:00 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Dec 2022 10:28:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 14 Dec 2022 10:28:21 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH v3 3/4] wifi: mt76: mt7915: rework mt7915_thermal_temp_store()
Date: Wed, 14 Dec 2022 10:28:08 +0800
Message-ID: <20221214022809.32087-4-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221214022809.32087-1-howard-yh.hsu@mediatek.com>
References: <20221214022809.32087-1-howard-yh.hsu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_191907_909343_CC88E450 
X-CRM114-Status: GOOD (  11.98  )
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

Call mt7915_mcu_set_thermal_protect() through
mt7915_thermal_temp_store() to update firmware trigger/restore temp
directly.

Fixes: 02ee68b95d81 ("mt76: mt7915: add control knobs for thermal throttling")
Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/init.c   | 18 ++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7915/mt7915.h |  3 +++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index be435ae56bbf..0ab9e1320fac 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -83,9 +83,23 @@ static ssize_t mt7915_thermal_temp_store(struct device *dev,
 
 	mutex_lock(&phy->dev->mt76.mutex);
 	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), 60, 130);
+
+	if ((i - 1 == MT7915_CRIT_TEMP_IDX &&
+	     val > phy->throttle_temp[MT7915_MAX_TEMP_IDX]) ||
+	    (i - 1 == MT7915_MAX_TEMP_IDX &&
+	     val < phy->throttle_temp[MT7915_CRIT_TEMP_IDX])) {
+		dev_err(phy->dev->mt76.dev,
+			"temp1_max shall be greater than temp1_crit.");
+		return -EINVAL;
+	}
+
 	phy->throttle_temp[i - 1] = val;
 	mutex_unlock(&phy->dev->mt76.mutex);
 
+	ret = mt7915_mcu_set_thermal_protect(phy);
+	if (ret)
+		return ret;
+
 	return count;
 }
 
@@ -195,8 +209,8 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 		return PTR_ERR(hwmon);
 
 	/* initialize critical/maximum high temperature */
-	phy->throttle_temp[0] = 110;
-	phy->throttle_temp[1] = 120;
+	phy->throttle_temp[MT7915_CRIT_TEMP_IDX] = 110;
+	phy->throttle_temp[MT7915_MAX_TEMP_IDX] = 120;
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 855779f86bde..e58650bbbd14 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -70,6 +70,9 @@
 
 #define MT7915_WED_RX_TOKEN_SIZE	12288
 
+#define MT7915_CRIT_TEMP_IDX		0
+#define MT7915_MAX_TEMP_IDX		1
+
 struct mt7915_vif;
 struct mt7915_sta;
 struct mt7915_dfs_pulse;
-- 
2.18.0


