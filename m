Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78849E7718B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ns2wwu3L1qU4OwwNBwHYMN3+ScKST7Uw6JR3esYfznM=; b=GhbC0rCwO00c+QlRSPVWM9RhPf
	/8GI1bY4TVsTDgQhotCOPLZ1ldBHjv0vSyXyNKexQhtg6FKQxIOiiS2FNwkNoWHP6Q/HXpWmP770Y
	YuTar6quyPxb22U/XdceIi59PpF989WyFlVRmPSHOyQ/j8Pt5TIyc0bMLbSYviq4tRr5xCjcpvPU7
	euuJsIvXY7d4aaUbrH4Y/zI5FVRWfuK1vZ4q4HJ3tFIzpvRXrFMrPwJJhg0a8jnudnnQYyfpYRwfM
	DMRIxwcb1Cvw7hdRz7zuaTnwEjHfFMt2ctdG0nnfRdvBJKVAViDh//Xg4oZBpOKy4vxJal232wjwR
	acgzOdUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPeGm-00000009cPj-2KlV;
	Mon, 23 Dec 2024 08:58:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPeGk-00000009cP0-3Mns
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 08:58:31 +0000
X-UUID: 1104875ec10c11ef82ff63e91e7eb18c-20241223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Ns2wwu3L1qU4OwwNBwHYMN3+ScKST7Uw6JR3esYfznM=;
	b=hNeOlpLFk6o35o8s3vXRX/+fbVSPLT+AvB8YdXt7V70P5N+ab00V0FTDUAZahHz3fEy02F7PpuRwGqo3M2j6irMBjCenVqTaizMAyOk7nUjnMqLmd5vWdHm38LjpiLyN2Wep3SYKocDoShC1pIexhBnk0dRowxL4cv3asGoGcJU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:0cdf38a6-2d89-444a-b253-0c12dff97fa5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:77d9c036-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 1104875ec10c11ef82ff63e91e7eb18c-20241223
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 469749013; Mon, 23 Dec 2024 01:58:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Dec 2024 16:58:21 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Dec 2024 16:58:21 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1] Bluetooth: btmtk: Fix failed to send func ctrl for MediaTek devices.
Date: Mon, 23 Dec 2024 16:58:18 +0800
Message-ID: <20241223085818.722707-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_005830_880505_5C0389D4 
X-CRM114-Status: UNSURE (   9.04  )
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

Use usb_autopm_get_interface() and usb_autopm_put_interface()
in btmtk_usb_shutdown(), it could send func ctrl after enabling
autosuspend.

Bluetooth: btusb_mtk_hci_wmt_sync() hci0: Execution of wmt command
           timed out
Bluetooth: btusb_mtk_shutdown() hci0: Failed to send wmt func ctrl
           (-110)

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 7fd9d5ddce02..224eafc27dbe 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1472,10 +1472,15 @@ EXPORT_SYMBOL_GPL(btmtk_usb_setup);
 
 int btmtk_usb_shutdown(struct hci_dev *hdev)
 {
+	struct btmtk_data *data = hci_get_priv(hdev);
 	struct btmtk_hci_wmt_params wmt_params;
 	u8 param = 0;
 	int err;
 
+	err = usb_autopm_get_interface(data->intf);
+	if (err < 0)
+		return err;
+
 	/* Disable the device */
 	wmt_params.op = BTMTK_WMT_FUNC_CTRL;
 	wmt_params.flag = 0;
@@ -1486,9 +1491,11 @@ int btmtk_usb_shutdown(struct hci_dev *hdev)
 	err = btmtk_usb_hci_wmt_sync(hdev, &wmt_params);
 	if (err < 0) {
 		bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err);
+		usb_autopm_put_interface(data->intf);
 		return err;
 	}
 
+	usb_autopm_put_interface(data->intf);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(btmtk_usb_shutdown);
-- 
2.45.2


