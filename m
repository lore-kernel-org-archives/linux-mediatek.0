Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAAAC61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 02:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3Z9XstlmW3LgKWVrU6Kb51CuDUUWk7EEvQ9L8T83Bak=; b=VHqkMvL5AsD4EqkeHuyuBKMK4C
	DI0PFYs7K9TuvZ/c7Lf0H/gQb/fWMCCJrhO+Uddxr/kZcZt6+L6H1Lt26Ehql3z27L0yeT/wKMvVd
	ErM5S9o9lQAFRGRBPqXluPuPi2tHNI4TajJaF93da4IPcqpZT4vivbs6CwfOHj0jOPrHR7vdyeLKS
	RtvzVdSrXpL4Nw9q1Uf9fzvEIn5Sp1ErjxwsWJTbm05Xlfuki815wDI26Gy3/55UUcsSsy94Dm/r/
	Y6xzW63KUX7hJEAo4dsAzkDiyib8v4hWP11YE9LW+yHEFgjfrTAPZlYT5+JO245wSCdeKmpu7YEvq
	xPIdM5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUId1-006Kf6-Bk; Tue, 21 Feb 2023 02:43:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUIcy-006Kcw-G1
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 02:43:38 +0000
X-UUID: 83126e1ab19111eda08d4d6090ec5a5c-20230220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=3Z9XstlmW3LgKWVrU6Kb51CuDUUWk7EEvQ9L8T83Bak=;
	b=W2o94xpG5hb9LF4MHANx+wh9KpSKRz50lQtJIVPF5tRGD0PDc6xkqX+GuzL8ouJMEcajPuhxpYxIsGvo/sJBQaD8eTPdrXgsNlL630fXjVRmQU/ZiXyBB5+IJ+6XLWlJd+2YMMIEq+n7CVfRBBKyQl42hGDb1vh3Q8+fUvWqrQc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:179fa583-c221-4928-a3bb-4b1aa1f565a1,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:885ddb2,CLOUDID:07892d26-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 83126e1ab19111eda08d4d6090ec5a5c-20230220
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1258000137; Mon, 20 Feb 2023 19:43:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 21 Feb 2023 10:43:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 21 Feb 2023 10:43:22 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.Lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: rework init flow in mt7915_thermal_init()
Date: Tue, 21 Feb 2023 10:43:17 +0800
Message-ID: <20230221024317.3218-1-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_184337_357809_49F52FBF 
X-CRM114-Status: GOOD (  10.92  )
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

If kernel do not enable CONFIG_HWMON, it may cause thermal
initialization to be done with temperature value 0 and then can not
transmit. This commit fixes it by setting trigger/restore temperature
before checking CONFIG_HWMON.

Fixes: 7d12b38 ("wifi: mt76: mt7915: call mt7915_mcu_set_thermal_throttling() only after init_work")
Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 1ab768feccaa..c48dcb928649 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -202,6 +202,10 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 			phy->cdev = cdev;
 	}
 
+	/* initialize critical/maximum high temperature */
+	phy->throttle_temp[MT7915_CRIT_TEMP_IDX] = MT7915_CRIT_TEMP;
+	phy->throttle_temp[MT7915_MAX_TEMP_IDX] = MT7915_MAX_TEMP;
+
 	if (!IS_REACHABLE(CONFIG_HWMON))
 		return 0;
 
@@ -210,10 +214,6 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 	if (IS_ERR(hwmon))
 		return PTR_ERR(hwmon);
 
-	/* initialize critical/maximum high temperature */
-	phy->throttle_temp[MT7915_CRIT_TEMP_IDX] = MT7915_CRIT_TEMP;
-	phy->throttle_temp[MT7915_MAX_TEMP_IDX] = MT7915_MAX_TEMP;
-
 	return 0;
 }
 
-- 
2.18.0


