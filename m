Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBACC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 12:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ntL+5uaAV9DSRO6KwCdZOXUOQstLPvq7hVMkRfPMeA=; b=R0enoRrdZUMVqrLjxvapSkBcS3
	9056UiwnH77QDHCnfTVgyjj4QMpBC4i/7nvx8JKjjRLR/AJgheVOng3MTyiQgdnJrfitg8L9xfVWN
	7r42CzTTFY2CDDS2qWlbDTLxS0lFaunutzcHelkcb6xAlAAD4TkQ5IdddjDjWsWnTmLVXDYHP7jf2
	C9atb+usSQ06a8N7PSvwMKr9gx1V4ZeaTWsRrGe6UZEghUF5gnq3C00BAhgFS8T3WPaY8g5ylsds+
	WU4cdq05IPNukcNcqm9DcnQAu5D1Qoa3hIuSmQSuFE5pwwnHZ93DhU8IIccE0YMCnzKy58dDhzU+l
	EkHe9TRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKeD6-008202-1u;
	Tue, 02 Jan 2024 12:49:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKeD4-0081yw-2G
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jan 2024 12:49:32 +0000
X-UUID: 5ac6751ca96d11ee9a662f17bb45267e-20240102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3ntL+5uaAV9DSRO6KwCdZOXUOQstLPvq7hVMkRfPMeA=;
	b=XXEYOoS/ZjG/xZFVlcVJMsKMSJap/aoIwLyFQabUOkOyoCKhg3eKl9NmOohlvNDZtHOBA3kTlaUwDu2hKXbSv/3xql2bgRSMfHEBSLVvnjyyAEcFzlVRL41mXLvALMl57JVPqHtSe5M6F7OWXYtZOr5liGMXPe3E2KUDY3/xqSk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:680339b9-436c-4d08-a65d-d322192e37c3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:8e25b92e-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5ac6751ca96d11ee9a662f17bb45267e-20240102
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <hao.qin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1818757804; Tue, 02 Jan 2024 05:49:23 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 2 Jan 2024 20:48:46 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 2 Jan 2024 20:48:45 +0800
From: Hao Qin <hao.qin@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, Steve
 Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, hao.qin <hao.qin@mediatek.com>
Subject: [PATCH v2 2/2] Bluetooth: btusb: mediatek: add a recovery method for MT7922 and MT7925
Date: Tue, 2 Jan 2024 20:47:47 +0800
Message-ID: <20240102124747.21644-2-hao.qin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240102124747.21644-1-hao.qin@mediatek.com>
References: <20240102124747.21644-1-hao.qin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_044930_739444_0178947E 
X-CRM114-Status: GOOD (  12.30  )
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

From: "hao.qin" <hao.qin@mediatek.com>

For MT7922 and MT7925, add USB reset retry to recover from patch
download failure, and perform a reset before patch download to
avoid unexpected problems caused by unkonwn status of dongle.

Signed-off-by: hao.qin <hao.qin@mediatek.com>
---
 drivers/bluetooth/btusb.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index abefcd1a089d..26ad4864d06c 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3000,17 +3000,26 @@ static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 	u32 val;
 	int err;
 
-	if (dev_id == 0x7925) {
+	if (dev_id == 0x7922) {
+		btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		val |= 0x00002020;
+		btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
+		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x00010001);
+		btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
+		val |= BIT(0);
+		btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, val);
+		msleep(100);
+	} else if (dev_id == 0x7925) {
 		btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
-		val |= (1 << 5);
+		val |= BIT(5);
 		btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
 		btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
 		val &= 0xFFFF00FF;
-		val |= (1 << 13);
+		val |= BIT(13);
 		btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
 		btusb_mtk_uhw_reg_write(data, MTK_EP_RST_OPT, 0x00010001);
 		btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
-		val |= (1 << 0);
+		val |= BIT(0);
 		btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
 		btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
 		btusb_mtk_uhw_reg_read(data, MTK_UDMA_INT_STA_BT, &val);
@@ -3040,6 +3049,9 @@ static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 	if (err < 0)
 		bt_dev_err(hdev, "Reset timeout");
 
+	if (dev_id == 0x7922)
+		btusb_mtk_uhw_reg_write(data, MTK_UDMA_INT_STA_BT, 0x000000FF);
+
 	btusb_mtk_id_get(data, 0x70010200, &val);
 	if (!val)
 		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
@@ -3128,8 +3140,10 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 		fwname = FIRMWARE_MT7668;
 		break;
 	case 0x7922:
-	case 0x7961:
 	case 0x7925:
+		btusb_mtk_subsys_reset(hdev, dev_id);
+		fallthrough;
+	case 0x7961:
 		if (dev_id == 0x7925)
 			snprintf(fw_bin_name, sizeof(fw_bin_name),
 				 "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
@@ -3143,6 +3157,11 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 						btusb_mtk_hci_wmt_sync);
 		if (err < 0) {
 			bt_dev_err(hdev, "Failed to set up firmware (%d)", err);
+			if (dev_id == 0x7922 || dev_id == 0x7925) {
+				btusb_stop_traffic(data);
+				usb_kill_anchored_urbs(&data->tx_anchor);
+				usb_queue_reset_device(data->intf);
+			}
 			return err;
 		}
 
-- 
2.18.0


