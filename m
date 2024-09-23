Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A799ECF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 08:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zR2jZOmHoceMG6Tbb4ghEYfg8RYjnsIT6gWTP2zQppo=; b=1c3MlhoxzSmFbTcbHC6M7nTx6c
	k/d8HLkDmclxrQi9LUFiHLgxgebYQ0hM4OTBEnbffouKrWpnu+f24Ontn+BLtHtpYkHWFBRWyro9a
	ilJq2lRC6VygZ94wlMe2OMg/GJnNqBBkQHjQPV95j5194+QbC0Iy/QqGHaEKTiMk1g2kPPDNlWFBx
	TK0mDLdbePck3sI2Zjej6FmlRr5mgKrras+2BFmLMCcrphKduh+/2Qnlq/hiB6z4lyHT7gnWcbn1u
	bMAIUPTCVGS8NQWC8EdYs5JvZ3uczH9pYwmIH7QhNfeRyjW+h4ixxxFOnFt3lF11DmRQrboIolT+t
	8LGNqsmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sseix-0000000GioY-08Cp;
	Mon, 23 Sep 2024 08:47:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sseiu-0000000Gilb-3Hzv
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 08:47:14 +0000
X-UUID: 6c835e0a798811efba0aef63c0775dbf-20240923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zR2jZOmHoceMG6Tbb4ghEYfg8RYjnsIT6gWTP2zQppo=;
	b=DyeporG74Wb+DWJB49RQCJL0sRzX3OU4sTfa7PCPFO14azOarUXf73kOW9ulkH3LA3mM6oLzwHP/uU4IEKJCtVRDbijqskV5dvDynndzIAgBSb8m2rRS+SZJKYlAorpGnY/zGDXkpb3MfPjDmn2a4RaKhaIURHsKQhtUCiLFkJs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:b59458d2-4285-488f-b6af-a51f93d1eddd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:abd31a18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 6c835e0a798811efba0aef63c0775dbf-20240923
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1779372931; Mon, 23 Sep 2024 01:47:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Sep 2024 16:47:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Sep 2024 16:47:08 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3 4/4] Bluetooth: btusb: mediatek: change the conditions for ISO interface
Date: Mon, 23 Sep 2024 16:47:05 +0800
Message-ID: <20240923084705.14123-5-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240923084705.14123-1-chris.lu@mediatek.com>
References: <20240923084705.14123-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_014712_864710_2BBDD789 
X-CRM114-Status: GOOD (  11.87  )
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
 drivers/bluetooth/btusb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index a434aefe68f2..9affe4f81294 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2618,7 +2618,7 @@ static void btusb_mtk_release_iso_intf(struct hci_dev *hdev)
 {
 	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
 
-	if (btmtk_data->isopkt_intf) {
+	if (test_bit(BTMTK_ISOPKT_OVER_INTR, &btmtk_data->flags)) {
 		usb_kill_anchored_urbs(&btmtk_data->isopkt_anchor);
 		clear_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags);
 
@@ -2658,8 +2658,8 @@ static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
 	if (err < 0)
 		return err;
 
-	if (test_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags))
-		btusb_mtk_release_iso_intf(hdev);
+	/* Release MediaTek ISO data interface */
+	btusb_mtk_release_iso_intf(hdev);
 
 	btusb_stop_traffic(data);
 	usb_kill_anchored_urbs(&data->tx_anchor);
@@ -2704,22 +2704,22 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
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
 
 static int btusb_mtk_shutdown(struct hci_dev *hdev)
 {
-	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
 	int ret;
 
 	ret = btmtk_usb_shutdown(hdev);
 
-	if (test_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags))
-		btusb_mtk_release_iso_intf(hdev);
+	/* Release MediaTek iso interface after shutdown */
+	btusb_mtk_release_iso_intf(hdev);
 
 	return ret;
 }
-- 
2.18.0


