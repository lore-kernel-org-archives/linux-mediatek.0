Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CB9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 16:02:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0648C60EE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 16:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0648C60EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BAlxTny122jC2UAMQiCppel/51wyi3lZ+C75Q5XKvUI=; b=j5syUQ30ITANCA
	zDUZ9XTjNh6DQx7Xx50oqvd0lEarfLZyji7pIa7zSZCovK6+CAN/ScyVuES4MX7ryMNGGf4CVDgw0
	z3T7kCJKLKR7/gkFSnY3wXrRdKbrGm+ICkIwzkcoHNmQcOocc8S0Wmm8TaiqD8jz6sd7Wi43FtmI6
	v4Z7AvyEvsq7lVqoEaSLKckF1LljI++pCCd4SK2wyC+FfwndlF9QCyy6oQl2gJIpdfu00AVgPDGmY
	R4zCaWQGSytVAF1FJmMYOWeVat7WDdJ6gnnwlpZFHBENc5hkwrm8alZSnRoFp88nu3XQzD+a0mCeP
	v0YvSlWtUk/30Pn2Oflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQAsY-006MKd-9r; Tue, 14 Sep 2021 16:01:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQArG-006Lj0-T3
 for linux-mediatek@lists.infradead.org; Tue, 14 Sep 2021 16:00:32 +0000
X-UUID: 1da987f4aae64df48251c274c83fcba9-20210914
X-UUID: 1da987f4aae64df48251c274c83fcba9-20210914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 868383208; Tue, 14 Sep 2021 09:00:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 08:50:25 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 14 Sep 2021 23:50:24 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/2] mt76: mt7921: robustify hardware initialization flow
Date: Tue, 14 Sep 2021 23:50:21 +0800
Message-ID: <b3d4a17bdbb819424a6493f14b9cd3d7a6bbc588.1631633959.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_090031_045164_0BDC251A 
X-CRM114-Status: GOOD (  16.91  )
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

From: Sean Wang <sean.wang@mediatek.com>

Robustify hardware initialization in the current driver probing flow
to get rid of the device is possibly lost after the machine boot due
to possible firmware abnormal state by trying to recover the failure
with more chances.

Tested-by: Leon Yen <Leon.Yen@mediatek.com>
Tested-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  | 53 ++++++++++++++-----
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |  1 +
 2 files changed, 41 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index 1f37e64b6038..d26166a612f0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -146,33 +146,60 @@ int mt7921_mac_init(struct mt7921_dev *dev)
 	return mt76_connac_mcu_set_rts_thresh(&dev->mt76, 0x92b, 0);
 }
 
-static int mt7921_init_hardware(struct mt7921_dev *dev)
+static int __mt7921_init_hardware(struct mt7921_dev *dev)
 {
-	int ret, idx;
-
-	ret = mt7921_dma_init(dev);
-	if (ret)
-		return ret;
-
-	set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
+	struct mt76_dev *mdev = &dev->mt76;
+	int ret;
 
 	/* force firmware operation mode into normal state,
 	 * which should be set before firmware download stage.
 	 */
 	mt76_wr(dev, MT_SWDEF_MODE, MT_SWDEF_NORMAL_MODE);
-
 	ret = mt7921_mcu_init(dev);
 	if (ret)
-		return ret;
+		goto out;
 
 	ret = mt7921_eeprom_init(dev);
-	if (ret < 0)
-		return ret;
+	if (ret)
+		goto out;
 
 	ret = mt7921_mcu_set_eeprom(dev);
+	if (ret)
+		goto out;
+
+	ret = mt7921_mac_init(dev);
+out:
+	if (ret && mdev->eeprom.data) {
+		devm_kfree(mdev->dev, mdev->eeprom.data);
+		mdev->eeprom.data = NULL;
+	}
+
+	return ret;
+}
+
+static int mt7921_init_hardware(struct mt7921_dev *dev)
+{
+	int ret, idx, i;
+
+	ret = mt7921_dma_init(dev);
 	if (ret)
 		return ret;
 
+	set_bit(MT76_STATE_INITIALIZED, &dev->mphy.state);
+
+	for (i = 0; i < MT7921_MCU_INIT_RETRY_COUNT; i++) {
+		ret = __mt7921_init_hardware(dev);
+		if (!ret)
+			break;
+
+		mt7921_wpdma_reset(dev, true);
+	}
+
+	if (i == MT7921_MCU_INIT_RETRY_COUNT) {
+		dev_err(dev->mt76.dev, "hardware init failed\n");
+		return ret;
+	}
+
 	/* Beacon and mgmt frames should occupy wcid 0 */
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT7921_WTBL_STA - 1);
 	if (idx)
@@ -183,7 +210,7 @@ static int mt7921_init_hardware(struct mt7921_dev *dev)
 	dev->mt76.global_wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	rcu_assign_pointer(dev->mt76.wcid[idx], &dev->mt76.global_wcid);
 
-	return mt7921_mac_init(dev);
+	return 0;
 }
 
 int mt7921_register_device(struct mt7921_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 6a47ba65b96e..cee7a2507224 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -29,6 +29,7 @@
 #define MT7921_RX_MCU_RING_SIZE		512
 
 #define MT7921_DRV_OWN_RETRY_COUNT	10
+#define MT7921_MCU_INIT_RETRY_COUNT	10
 
 #define MT7921_FIRMWARE_WM		"mediatek/WIFI_RAM_CODE_MT7961_1.bin"
 #define MT7921_ROM_PATCH		"mediatek/WIFI_MT7961_patch_mcu_1_2_hdr.bin"
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
