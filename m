Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32FEE7719A
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2IVKhhITELaXn/nWTY/Xejs1YbOB4PDUF+l+l+ii61E=; b=oBVuFzURK9FELZrjMvShdSGoPI
	wXCopyYeTeCTIDMefoyQg9KtopqiIWL0GJTgq6V04lOnuz9VFLhyXWQWxfDDz8or0GWLxFW4zyGRF
	Mn0BhdrUMOUGPKeIJd75gPJSj0GIqzJyDPSSBzQ/z6dn3Sk4O2x4Ug+H6o6TboicjMk94mCa+QyxP
	qqO3nBOPrOkJim13x+5O/Zm7Xw1XjWMT8F9VXCssQyDbCU/wBTdCS0kT9ZQAVQtM+tEkCz7WmzhfR
	r+InI8+XgCYRsY34yrmq0Na/0D/ZUkLBrIg8k8nMezw3JVN60tG2KJFGKah+U1FojxDq3Kh5YPljw
	Ow0JFIig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSrW-00000007ta1-1Zw3;
	Wed, 08 Jan 2025 10:00:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVShz-00000007rqd-2IRE
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 09:50:40 +0000
X-UUID: 008ec3accda611ef82ff63e91e7eb18c-20250108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2IVKhhITELaXn/nWTY/Xejs1YbOB4PDUF+l+l+ii61E=;
	b=R2VtLKjrt6FQ7YxcpzPCDKZSOtEy43P1OmNLVyje7q31FyHMIUJdmR1OIqzc1Z+bFdbYg23bBg/yB400H5B6wL4dxLdFANWaWlXl/KCWH1ZpJhxOm31bJP5IBDQkOw3WRWJTzK6kldrhKbfcEKuBRDk+jO16zpzfwFWJ9MGWkkQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:e60aab15-1afb-47cb-8384-5b720bc60fe7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:6113910e-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 008ec3accda611ef82ff63e91e7eb18c-20250108
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 719951195; Wed, 08 Jan 2025 02:50:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 8 Jan 2025 17:50:30 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 8 Jan 2025 17:50:30 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v2] Bluetooth: btmtk: Fix failed to send func ctrl for MediaTek devices.
Date: Wed, 8 Jan 2025 17:50:28 +0800
Message-ID: <20250108095028.2299510-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_015039_589600_FC8DF50C 
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

Use usb_autopm_get_interface() and usb_autopm_put_interface()
in btmtk_usb_shutdown(), it could send func ctrl after enabling
autosuspend.

Bluetooth: btmtk_usb_hci_wmt_sync() hci0: Execution of wmt command
           timed out
Bluetooth: btmtk_usb_shutdown() hci0: Failed to send wmt func ctrl
           (-110)

Fixes: 5c5e8c52e3ca ("Bluetooth: btmtk: move btusb_mtk_[setup, shutdown] to btmtk.c")

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
v2: Update commit message, add Fixes tag info
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


