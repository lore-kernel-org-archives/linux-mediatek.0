Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA8FEE4996
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 06:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WAwUWzM1cjRLS+FevRNlp0lT/8CwFldDCw6F4Oqu2vc=; b=DCQMPKOg4qeELD8iLWKoZiBJB1
	EonfcQKMNjFNdqrsPWCTd3y+6gtY5iJezdBzWXVWnM28yBx+rWWjs8p1A6827JJKEEpX39NE80/qD
	ctk6p4b2YAC+NsgsvvJ2ytaeIr/2PWhWRR2CtDUbHse6TFPpWe/OHxnZCw4fNnuchlkClPrz3lri1
	0/z80YTJw5I1cHNEE242Rs5rCx1B17fTLz6v8TnY/6F8pQgmSH4u/oRyLtK3j5f+yFDedtdMTVgaz
	P7r6EefXovXbFJiUUQhc7pqQ3riLBlzPueBJRs5xTzUviUYo+hDg9oQ7D2q1ca8vaRgMgU2tqJ4cb
	OrY3rnEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYKvC-00FEl3-2G;
	Tue, 22 Aug 2023 06:31:22 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYKv8-00FEk3-0g;
	Tue, 22 Aug 2023 06:31:20 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RVKDV0gzNzVkJs;
	Tue, 22 Aug 2023 14:28:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 14:30:55 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux-wireless@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Felix Fietkau <nbd@nbd.name>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne
 Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Kalle
 Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH net-next] wifi: mt76: Use PTR_ERR_OR_ZERO() to simplify code
Date: Tue, 22 Aug 2023 14:30:36 +0800
Message-ID: <20230822063036.3990380-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_233118_772647_C230927F 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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

Return PTR_ERR_OR_ZERO() instead of return 0 or PTR_ERR() to
simplify code.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/init.c | 5 +----
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 5 +----
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c  | 5 +----
 drivers/net/wireless/mediatek/mt76/mt7921/init.c | 5 +----
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 18a50ccff106..f7722f67db57 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -58,10 +58,7 @@ int mt7615_thermal_init(struct mt7615_dev *dev)
 			      wiphy_name(wiphy));
 	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, dev,
 						       mt7615_hwmon_groups);
-	if (IS_ERR(hwmon))
-		return PTR_ERR(hwmon);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(hwmon);
 }
 EXPORT_SYMBOL_GPL(mt7615_thermal_init);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 35fdf4f98d80..c45f87b14b8c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -213,10 +213,7 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
 
 	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, phy,
 						       mt7915_hwmon_groups);
-	if (IS_ERR(hwmon))
-		return PTR_ERR(hwmon);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(hwmon);
 }
 
 static void mt7915_led_set_config(struct led_classdev *led_cdev,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index 37348b208736..06e3d9db996c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -1219,10 +1219,7 @@ static int mt798x_wmac_init(struct mt7915_dev *dev)
 		return PTR_ERR(dev->sku);
 
 	dev->rstc = devm_reset_control_get(pdev, "consys");
-	if (IS_ERR(dev->rstc))
-		return PTR_ERR(dev->rstc);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(dev->rstc);
 }
 
 static int mt798x_wmac_probe(struct platform_device *pdev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index ff63f37f67d9..534c7bee5ef1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -55,10 +55,7 @@ static int mt7921_thermal_init(struct mt792x_phy *phy)
 
 	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, phy,
 						       mt7921_hwmon_groups);
-	if (IS_ERR(hwmon))
-		return PTR_ERR(hwmon);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(hwmon);
 }
 
 static void
-- 
2.34.1


