Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E656CE8D5D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMiJYM6LFq/ZFiBJD1Iufm69acB1VIDo+EHB1kP4RNc=; b=EtQhpn4j4SbCNAy/FPHDY3CTCW
	M7ZI5YtG5NcN/4nM8d3BkwMib1XGPo3TXq5psBMJINolgHY5NyXLUjj3pOK3OSodkq90G+o1AdAuS
	K38oDNuf2lPCrk6IC9c/JAo1ARdDcJ0N8QPBagkVVvYThXrx6eJNP/zhRYmEl9pelVG45iorpDuoA
	QbXSkMzLwa2V0RaWP3+koPU+aTbv6gOZOEBVlyvnMEfEgHl5ebGtNgj/vWuEYhL5meabFARn+1ZIS
	jVhxrVkGpdnhOxJWI0pgRK6j3F9Vca8t1bwXnRZgXeDeLPH+Ch/dR8/B8CBN8T8+7O32rmnRtJqIJ
	QhfZKg/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srC1B-00000009iyT-3lmd;
	Thu, 19 Sep 2024 07:56:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srBuy-00000009hbd-0nVv
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Sep 2024 07:49:37 +0000
X-UUID: b4272302765b11efb3adad29d29602c1-20240919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mMiJYM6LFq/ZFiBJD1Iufm69acB1VIDo+EHB1kP4RNc=;
	b=sHLFICmKEhSwhcfvATQf8cqmIaeywIkdYNXTpDusUi6ym7xVSjv6YOQtLuC0AFnLTibXQpTuk1mmNfcBKlUpA4UUs+pcWxW3Nqw6xXaLk+O/Quqa+E8/GjGXBbLpfbtTiWUQveOvzMbsfsK/0ZqohS81JH/nKVxMbM9wfyRvcrQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:88fed5ff-e745-49bd-8bb0-f5de10452f3d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:89da6ed0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b4272302765b11efb3adad29d29602c1-20240919
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1182113219; Thu, 19 Sep 2024 00:49:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Sep 2024 15:49:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Sep 2024 15:49:28 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v2 4/4] Bluetooth: btusb: mediatek: change the conditions for ISO interface
Date: Thu, 19 Sep 2024 15:49:25 +0800
Message-ID: <20240919074925.22860-5-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240919074925.22860-1-chris.lu@mediatek.com>
References: <20240919074925.22860-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_004936_293579_71BC12BD 
X-CRM114-Status: GOOD (  11.35  )
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


