Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD31CC3ABB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 11:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yh9Cv4MEik5r9AmsOV9eCf9ar3VkQAvVhfAiCwvPCIs=; b=XA2NEgar7sgXl6zTY9xodi5Qb2
	uEgdOZS4Uhdk9xsTMY4/nIQ+SbBPpDAswjXxC1NHBICW9Po2PTEVGnEoYqrMJ5i39iGldaMTsLqXy
	2Gd7y6BXSv0LYmCtgNqJ7+AwHIoy8WnaxUBZzZtNtI3e87vhhAM9aR9v99InMC3P4z2+FJ2edZsml
	4moQ4/oWL32pgS6v2IOzyCJiXqNBOcCxe/aPh3d6aMcFg/mpd/o6L4FFYFcm6ibwFam48VtCyFEPI
	EEsmuFqwgGA77MQ3+tVupbsW22G7HzJMAUQ/TCCW1i9NvG8M2TqTQhJqHwrALgk2YxRmaqdvWQDTB
	NPzIQJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqA5H-00000003tb8-1dtP;
	Mon, 16 Sep 2024 11:39:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqA5D-00000003tZC-2djz
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Sep 2024 11:39:56 +0000
X-UUID: 617fc128742011efb3adad29d29602c1-20240916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Yh9Cv4MEik5r9AmsOV9eCf9ar3VkQAvVhfAiCwvPCIs=;
	b=eupIRYzq3FsuCgx6znuJ36+9L2p8DaxlXZ647LB2rBbkIUuF7/Pkx6J1X3V1TlH8e1iZUHFlnwETYHJjdoItESvX6OLgW1NmBrTE/VwnNfKJMnfbYiDLIH7BBZsQdf58Qc6iPrjuSoplvxTMQkcvdpP4AbTqVu3kxT2gQG46Hk8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:b83f6ef1-2b98-4e3f-9ab5-d4d4ff939278,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:4f7c0ac0-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 617fc128742011efb3adad29d29602c1-20240916
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 219718913; Mon, 16 Sep 2024 04:39:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 16 Sep 2024 19:39:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 16 Sep 2024 19:39:46 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 3/4] Bluetooth: btusb: mediatek: add intf release flow in usb disconnect
Date: Mon, 16 Sep 2024 19:39:37 +0800
Message-ID: <20240916113938.30285-4-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240916113938.30285-1-chris.lu@mediatek.com>
References: <20240916113938.30285-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_043955_709336_669B20F8 
X-CRM114-Status: GOOD (  10.43  )
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

MediaTek claim an special usb intr interface for ISO data transmission.
The interface need to be released before unregistering hci device when
usb disconnect. Removing BT usb dongle without properly releasing the
interface may cause Kernel panic while unregister hci device.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btusb.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index dfc42bdc8aaf..37e67b451b34 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2614,9 +2614,9 @@ static void btusb_mtk_claim_iso_intf(struct btusb_data *data)
 	set_bit(BTMTK_ISOPKT_OVER_INTR, &btmtk_data->flags);
 }
 
-static void btusb_mtk_release_iso_intf(struct btusb_data *data)
+static int btusb_mtk_release_iso_intf(struct hci_dev *hdev)
 {
-	struct btmtk_data *btmtk_data = hci_get_priv(data->hdev);
+	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
 
 	if (btmtk_data->isopkt_intf) {
 		usb_kill_anchored_urbs(&btmtk_data->isopkt_anchor);
@@ -2630,6 +2630,8 @@ static void btusb_mtk_release_iso_intf(struct btusb_data *data)
 	}
 
 	clear_bit(BTMTK_ISOPKT_OVER_INTR, &btmtk_data->flags);
+
+	return 0;
 }
 
 static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
@@ -2649,7 +2651,7 @@ static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
 		return err;
 
 	if (test_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags))
-		btusb_mtk_release_iso_intf(data);
+		btusb_mtk_release_iso_intf(hdev);
 
 	btusb_stop_traffic(data);
 	usb_kill_anchored_urbs(&data->tx_anchor);
@@ -2703,14 +2705,13 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 
 static int btusb_mtk_shutdown(struct hci_dev *hdev)
 {
-	struct btusb_data *data = hci_get_drvdata(hdev);
 	struct btmtk_data *btmtk_data = hci_get_priv(hdev);
 	int ret;
 
 	ret = btmtk_usb_shutdown(hdev);
 
 	if (test_bit(BTMTK_ISOPKT_RUNNING, &btmtk_data->flags))
-		btusb_mtk_release_iso_intf(data);
+		btusb_mtk_release_iso_intf(hdev);
 
 	return ret;
 }
@@ -3824,6 +3825,7 @@ static int btusb_probe(struct usb_interface *intf,
 		data->recv_acl = btmtk_usb_recv_acl;
 		data->suspend = btmtk_usb_suspend;
 		data->resume = btmtk_usb_resume;
+		data->disconnect = btusb_mtk_release_iso_intf;
 	}
 
 	if (id->driver_info & BTUSB_SWAVE) {
-- 
2.18.0


