Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04978C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 21:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1D6xOAGofCxFBuw2SfOBBlGNnmyLVhTaE4ln6n9nnY=; b=WkaCTxk9sOBTFrTwswMcH+9l2D
	2tTv1rFKyscy6cmS9BY5DwUhRP/h+aYelnrhVJMcNKKpQ4EnAGhCYynpwQdjfh1+AZcU+cADl4Gu8
	fJd7Q9D/JvXzTg9H8lkd1Og1BuHeKQPUogGu+Mn0pB6gLfHDIjiII5X5zYEqn9aqRxJKxY9NDu7+H
	aVCxIESmiUuFTBgk1qka2oa8V8hOyD/Nmkew7i5pkeJ7lcNPoSyuseuAxsYsSko1F7ak+6l0jrjGx
	/U/HdMojryvryqL2Ob9a+ge6u1m/Wgp+DPRiBePA28waJgzIKsur3emUstXxoatEwIA/DeRJMvIdM
	aBVgzDGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDYM3-001Ykp-Ui; Mon, 18 Jul 2022 21:32:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDYM1-001YkG-3E
	for linux-mediatek@lists.infradead.org; Mon, 18 Jul 2022 21:32:38 +0000
X-UUID: eaf2d9dbbdde4768b17ce195e05f78f9-20220718
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e1b75934-7008-4f52-bc2a-e8ddd65d3831,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:4f6c4e33-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: eaf2d9dbbdde4768b17ce195e05f78f9-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1716071624; Mon, 18 Jul 2022 14:32:35 -0700
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
Subject: [PATCH 3/4] mt76: mt7921u: fix race issue between reset and suspend/resume
Date: Tue, 19 Jul 2022 04:51:25 +0800
Message-ID: <0d63c7d511269fe6f0c7c09fe922417ed594d3b3.1658176701.git.sean.wang@kernel.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a1437e413116364ac9f3b777c7922ca0728ddc0d.1658176701.git.sean.wang@kernel.org>
References: <a1437e413116364ac9f3b777c7922ca0728ddc0d.1658176701.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_143237_162528_D8155F12 
X-CRM114-Status: GOOD (  16.27  )
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

Fixes: df3e4143ba8a ("mt76: mt7921u: add suspend/resume support")
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/usb.c   | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index dd3b8884e162..124d62c0dfa4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -300,11 +300,15 @@ static void mt7921u_disconnect(struct usb_interface *usb_intf)
 static int mt7921u_suspend(struct usb_interface *intf, pm_message_t state)
 {
 	struct mt7921_dev *dev = usb_get_intfdata(intf);
+	struct mt76_connac_pm *pm = &dev->pm;
 	int err;
 
+	pm->suspended = true;
+	cancel_work_sync(&dev->reset_work);
+
 	err = mt76_connac_mcu_set_hif_suspend(&dev->mt76, true);
 	if (err)
-		return err;
+		goto failed;
 
 	mt76u_stop_rx(&dev->mt76);
 	mt76u_stop_tx(&dev->mt76);
@@ -312,11 +316,20 @@ static int mt7921u_suspend(struct usb_interface *intf, pm_message_t state)
 	set_bit(MT76_STATE_SUSPEND, &dev->mphy.state);
 
 	return 0;
+
+failed:
+	pm->suspended = false;
+
+	if (err < 0)
+		mt7921_reset(&dev->mt76);
+
+	return err;
 }
 
 static int mt7921u_resume(struct usb_interface *intf)
 {
 	struct mt7921_dev *dev = usb_get_intfdata(intf);
+	struct mt76_connac_pm *pm = &dev->pm;
 	bool reinit = true;
 	int err, i;
 
@@ -338,16 +351,23 @@ static int mt7921u_resume(struct usb_interface *intf)
 	if (reinit || mt7921_dma_need_reinit(dev)) {
 		err = mt7921u_dma_init(dev, true);
 		if (err)
-			return err;
+			goto failed;
 	}
 
 	clear_bit(MT76_STATE_SUSPEND, &dev->mphy.state);
 
 	err = mt76u_resume_rx(&dev->mt76);
 	if (err < 0)
-		return err;
+		goto failed;
+
+	err = mt76_connac_mcu_set_hif_suspend(&dev->mt76, false);
+failed:
+	pm->suspended = false;
+
+	if (err < 0)
+		mt7921_reset(&dev->mt76);
 
-	return mt76_connac_mcu_set_hif_suspend(&dev->mt76, false);
+	return err;
 }
 #endif /* CONFIG_PM */
 
-- 
2.25.1


