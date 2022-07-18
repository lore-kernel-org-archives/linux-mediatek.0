Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB50EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 21:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZliU2iHveoCoXfz1pwo8Crk7FC3xFgpmHZ/hsxl7u6U=; b=3xTuRwFRwnPBtlebsIgh8kPItc
	9OJW6LPqInPgYGyvB4Bzwpa5TV+Rm2AtLinbXyXZMg/Ct5OT4RtVWgDmOsPgsFjjI1AdEHZMTNICq
	FtgbfekpMdaaif3AqXxUdPlcO+20BdkTkqv695swecnpinTDA51so/FKlPC81YQv7nvuP8BfXvnyq
	bt7QwxMt8bzwOuowtAo9lFANHuhoUvsD1xhimCpn0cx7pZ491ZyRrKhWK0Hcg6YDThIUcjwGmXk5Q
	cMI/3cxhkeEl8Sm6iXJpyGGu2kC36ODd4ip6uU+YTNydP/d/5GXBYjJBy4zUguOE+MYA2mdvM5m/S
	Mucc0nOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDYVJ-001eRQ-SG; Mon, 18 Jul 2022 21:42:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDYVG-001ePz-Do
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 21:42:11 +0000
X-UUID: d0af38499ff34db9930649a62452ed57-20220718
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:30244cbb-bd7e-4d56-90fa-fd99b86b86de,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:8b0bd1d7-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d0af38499ff34db9930649a62452ed57-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 15087099; Mon, 18 Jul 2022 14:42:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 19 Jul 2022 04:51:30 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 19 Jul 2022 04:51:30 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<jenhao.yang@mediatek.com>, <robin.chiu@mediatek.com>,
	<Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <kuabhs@google.com>, <druth@google.com>,
	<abhishekpandit@google.com>, <shawnku@google.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/4] mt76: mt7921e: fix race issue between reset and suspend/resume
Date: Tue, 19 Jul 2022 04:51:23 +0800
Message-ID: <a1437e413116364ac9f3b777c7922ca0728ddc0d.1658176701.git.sean.wang@kernel.org>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_144210_495266_4AFE03DD 
X-CRM114-Status: GOOD (  15.87  )
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

From: Sean Wang <sean.wang@mediatek.com>

It is unexpected that the reset work is running simultaneously with
the suspend or resume context and it is possible that reset work is still
running even after mt7921 is suspended if we don't fix the race issue.

Thus, the suspend procedure should be waiting until the reset is completed
at the beginning and ignore the subsequent the reset requests.

In case there is an error that happens during either suspend or resume
handler, we will schedule a reset task to recover the error before
returning the error code to ensure we can immediately fix the error there.

Fixes: 0c1ce9884607 ("mt76: mt7921: add wifi reset support")
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c |  5 +++++
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 13 +++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 47f0aa81ab02..6bd9fc9228a2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -780,6 +780,7 @@ void mt7921_mac_reset_work(struct work_struct *work)
 void mt7921_reset(struct mt76_dev *mdev)
 {
 	struct mt7921_dev *dev = container_of(mdev, struct mt7921_dev, mt76);
+	struct mt76_connac_pm *pm = &dev->pm;
 
 	if (!dev->hw_init_done)
 		return;
@@ -787,8 +788,12 @@ void mt7921_reset(struct mt76_dev *mdev)
 	if (dev->hw_full_reset)
 		return;
 
+	if (pm->suspended)
+		return;
+
 	queue_work(dev->mt76.wq, &dev->reset_work);
 }
+EXPORT_SYMBOL_GPL(mt7921_reset);
 
 void mt7921_mac_update_mib_stats(struct mt7921_phy *phy)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 9d1ba838e54f..07573ea55389 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -363,6 +363,7 @@ static int mt7921_pci_suspend(struct device *device)
 	int i, err;
 
 	pm->suspended = true;
+	cancel_work_sync(&dev->reset_work);
 	cancel_delayed_work_sync(&pm->ps_work);
 	cancel_work_sync(&pm->wake_work);
 
@@ -424,6 +425,9 @@ static int mt7921_pci_suspend(struct device *device)
 restore_suspend:
 	pm->suspended = false;
 
+	if (err < 0)
+		mt7921_reset(&dev->mt76);
+
 	return err;
 }
 
@@ -437,7 +441,7 @@ static int mt7921_pci_resume(struct device *device)
 
 	err = mt7921_mcu_drv_pmctrl(dev);
 	if (err < 0)
-		return err;
+		goto failed;
 
 	mt7921_wpdma_reinit_cond(dev);
 
@@ -467,11 +471,12 @@ static int mt7921_pci_resume(struct device *device)
 		mt76_connac_mcu_set_deep_sleep(&dev->mt76, false);
 
 	err = mt76_connac_mcu_set_hif_suspend(mdev, false);
-	if (err)
-		return err;
-
+failed:
 	pm->suspended = false;
 
+	if (err < 0)
+		mt7921_reset(&dev->mt76);
+
 	return err;
 }
 
-- 
2.25.1


