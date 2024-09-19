Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8206CE8D5F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 07:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yh9Cv4MEik5r9AmsOV9eCf9ar3VkQAvVhfAiCwvPCIs=; b=cAHetapaGi3uXc03e7ffrugvLR
	8pg1PV6hGdX6eK1G33mV7/zdrpCmdM7Vxv7M8DD2DBE+8zfxCOINQJ0Xg9qPjwSOczAesmqLWMmqJ
	hSSZIxFsByrTQ/HKS0ye0UIneU+GU2kJkTq66wzKGFHbFgEqq8OUwZuHOtO8LLKJtLj7rrVdNOI/L
	GklJyb1bmGecSB9fX1RrmoRVFndgbShkoX0kODoe1K0DpcrRpuyxh+gFYfz+p1rArdOf8ae03/xbO
	CcLuBsuQfg68qBbxjMO1QbdXuIi0fiMlxF2mYOzzslH1wVJFd6SM7cZEoHCVSulmDUaPd+zN6P61c
	3TwvNPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srC1C-00000009iyq-1Hr1;
	Thu, 19 Sep 2024 07:56:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srBuy-00000009hdB-45Nc
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Sep 2024 07:49:38 +0000
X-UUID: b48c2770765b11efba0aef63c0775dbf-20240919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Yh9Cv4MEik5r9AmsOV9eCf9ar3VkQAvVhfAiCwvPCIs=;
	b=IQLypdZt+5LslALjiCJGdFDdE/lexnybSqUBMk6Yd1y7el6Lqy6Yz67WzheBh0WTNISPCZeRzznxa1Gm9/tSqQ2pn8MKHhwDIABb9IVrfWEy8ojJrvoaq45RYkgwKWKCY5836DkkA8kYP+jrn3E3tj8n8lyW9n6Ce4pHKy7fIfY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:5f2ee440-b3f4-4ffd-a652-a45d0eedcec4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:9adb3a9e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: b48c2770765b11efba0aef63c0775dbf-20240919
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1664018298; Thu, 19 Sep 2024 00:49:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH v2 3/4] Bluetooth: btusb: mediatek: add intf release flow when usb disconnect
Date: Thu, 19 Sep 2024 15:49:24 +0800
Message-ID: <20240919074925.22860-4-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240919074925.22860-1-chris.lu@mediatek.com>
References: <20240919074925.22860-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.103300-8.000000
X-TMASE-MatchedRID: wjD3WG0lTZLI4MewwWCjuRWCVBr+Ay98Kx5ICGp/WtFYjwH7MZdcVNi9
	OlIVE9udxiqnR+5LS88BtjkcfRMmqRLekAZjy1WtdOc7KAdVCk6e4TzN1NEjX8EqvmtqSkiMMJd
	KxR82Ss51HcTlxHHDKN/9Dl+7GxSalNn1XnREFDvhG1IOMb7PsH0tCKdnhB589yM15V5aWpj6C0
	ePs7A07UngwKs5OejnzCIIqkPMUYdZMchMK1Kj71AMKlO/nqIbTT/NQiV71j5mHYOkBL8C8scef
	mYW/oKjnXbAYVhiMWNV/9crlvi2xqaNltbdg3HRdmtRsRmKkASJZPT2ZDPuzPD2QfzMDLjhIh26
	TkmSN3fAvpLE+mvX8g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.103300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 0479B9372CCDBC9528C05E4EF7758888979D75D569BA59E22FD7B98D8D8176792000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_004937_039639_9C1939AB 
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


