Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1A6C3ABA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 11:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMiJYM6LFq/ZFiBJD1Iufm69acB1VIDo+EHB1kP4RNc=; b=4HarcvZbRXVUSEADAC2tJ8AaS1
	xl4WeiiJpWAoAL3Ha2er9U/Vv2dv6kgoESeC/5dVbNB1IYTVxw0ol+7Zz3EXb+GyKwpqhzAYFje3X
	3ZpSzvZ3LuHg7ddAhf88DxNb2KxPgmjid3AnzLVa4ZJtiN8Rr4vXxbYpgF2JUs1ZqZ5Fc011qu8oi
	C4UDd5exUZaLk5uLsR8GyoJfL1ffPH2R1jv0j8zkFr4caiaG0tFukjPJ4mK6d6y3bmsLsGTxr+It6
	cNkVD5oku5O4axLR30RRJ/XmL7bMujnxqThZhDjQyROHr4HmINfVBvSHO+bvKkY6P0WuyAFF6tY31
	y/Faptxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqA5I-00000003tbZ-3G51;
	Mon, 16 Sep 2024 11:40:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqA5F-00000003tZx-38Mo
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Sep 2024 11:39:59 +0000
X-UUID: 62bf8b36742011efba0aef63c0775dbf-20240916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mMiJYM6LFq/ZFiBJD1Iufm69acB1VIDo+EHB1kP4RNc=;
	b=fOngjGnOUsBuIufVe6B0m74YmuBpLKk3QN4ekvyRqbogYu46KnYyf+AEnyOBH84QwKm3dYyv2G/Y1F8nac0x9dEG+p9tuFgqlmHiniASVLSqrNJwVpnUFR0qPJK+76KVTyg1/zqN80flEQYN66LLGmqN5SaJjx0yoa31jom+iIA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5dbcfdcc-b29e-42d6-961f-a10783b08fb3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:2dfb48d0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 62bf8b36742011efba0aef63c0775dbf-20240916
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 457420878; Mon, 16 Sep 2024 04:39:51 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Sep 2024 19:39:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Sep 2024 19:39:48 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 4/4] Bluetooth: btusb: mediatek: change the conditions for claiming/releasing ISO interface
Date: Mon, 16 Sep 2024 19:39:38 +0800
Message-ID: <20240916113938.30285-5-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240916113938.30285-1-chris.lu@mediatek.com>
References: <20240916113938.30285-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.668000-8.000000
X-TMASE-MatchedRID: aM1oCRdK49E2O4fZmCqoe23NvezwBrVmE3WdmkffyCC3EJ0R73/5jflY
	oV6p/cSx9F2Dje0CNO+dVuHdb+ygh9K5cuk2o4lJHPYwOJi6PLmIrmqDVyayv508uG+NqO3Co8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqt0CdDYrTXLqIMJtkJNOtGJIWxUC5CS9IFS9EINvro5kMKXn
	EXZqXET4/8W8segS5MJlpUnvncPNbcEPmmKIRS/MzfH8jqka8mwZBgUyJVEbl6Fw8/PpTMRaVvm
	iAyeA2kc5MSfkiJFI5QBJtcKcOYfpRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.668000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6F126FB2D99B7808B65B5C4FE17DE34AF7F1F6AB5A7BA4D2BAFC97249BC52DC52000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_043957_810281_47E1D68C 
X-CRM114-Status: GOOD (  10.52  )
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

Change conditions for Bluetooth driver claiming and releasing usb
ISO interface for MediaTek ISO data transmission.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btusb.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 37e67b451b34..bb28a9b2dc11 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2618,7 +2618,7 @@ static int btusb_mtk_release_iso_intf(struct hci_dev *hdev)
 {
 	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
 
-	if (btmtk_data->isopkt_intf) {
+	if (test_bit(BTMTK_ISOPKT_OVER_INTR, &btmtk_data->flags)) {
 		usb_kill_anchored_urbs(&btmtk_data->isopkt_anchor);
 		clear_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags);
 
@@ -2650,7 +2650,7 @@ static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
 	if (err < 0)
 		return err;
 
-	if (test_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags))
+	if (test_bit(BTMTK_ISOPKT_OVER_INTR, &btmtk_data->flags))
 		btusb_mtk_release_iso_intf(hdev);
 
 	btusb_stop_traffic(data);
@@ -2696,9 +2696,10 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	btmtk_data->reset_sync = btusb_mtk_reset;
 
 	/* Claim ISO data interface and endpoint */
-	btmtk_data->isopkt_intf = usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM);
-	if (btmtk_data->isopkt_intf)
+	if (!test_bit(BTMTK_ISOPKT_OVER_INTR, &btmtk_data->flags)) {
+		btmtk_data->isopkt_intf = usb_ifnum_to_if(data->udev, MTK_ISO_IFNUM);
 		btusb_mtk_claim_iso_intf(data);
+	}
 
 	return btmtk_usb_setup(hdev);
 }
@@ -2710,7 +2711,7 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
 
 	ret = btmtk_usb_shutdown(hdev);
 
-	if (test_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags))
+	if (test_bit(BTMTK_ISOPKT_OVER_INTR, &btmtk_data->flags))
 		btusb_mtk_release_iso_intf(hdev);
 
 	return ret;
-- 
2.18.0


