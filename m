Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55D2C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 12:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BuK7s7sV/d/zocOp9WyQc4jOUhufFxVHx+kxKOinkOM=; b=fGf0LkghktIDVa9kiFpwy7+6PS
	yQbZRs9Hz3S1P8fd+aXDy3aIqtnf8dW+Pg9sMyKUySIFiqVx8payvQdNKfBRiwT+up+8A9OmJqoq1
	S8jbUDr5nPsvvEiU92N887Oc9WFl6YQFmbfkPd7kGsYEcTDm5BBR1KIvfbCiSKOasI7BppZEpFqT3
	crwmy8t5cf0ZO53Bn6Nf2cj3ze9ZGJ5CBUfkwr1VQP+gvHYACMUjuUTGJ81PsoXL0nJQSGAbz/XU0
	qHrsb4NOt11TuQIsySSB8umOxWQn8AMmhtOVsalR3RxDPtExkaCyxabuLsQcy+Nbd/zR1He1wMfnh
	mLvRkfNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKeCw-0081y1-1p;
	Tue, 02 Jan 2024 12:49:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKeCt-0081v5-1y
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jan 2024 12:49:21 +0000
X-UUID: 511386e0a96d11eeafd70d0b34820190-20240102
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=BuK7s7sV/d/zocOp9WyQc4jOUhufFxVHx+kxKOinkOM=;
	b=Zxvd2YOakbMLVXW22ta99OLR0U+DOPShbO4uv1QTsvfqXsbArgWI2ItF6jr6tjQwxftTPtElyS95QvVkfFNvpCDdBp9raCTwvGsT+fGNQzBQIewGb8HwaA9nazUt/5TLxCSUqWAeNkdD8++TBUQqSihGNTYMJ6BlRdJ2ClANiPc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:c959865f-61f3-456d-bbb0-bc30a46039e6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:f4c5ce8d-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 511386e0a96d11eeafd70d0b34820190-20240102
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <hao.qin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 611839152; Tue, 02 Jan 2024 05:49:07 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 2 Jan 2024 20:48:40 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 2 Jan 2024 20:48:39 +0800
From: Hao Qin <hao.qin@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, Steve
 Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, hao.qin <hao.qin@mediatek.com>
Subject: [PATCH v2 1/2] Bluetooth: btusb: mediatek: refactor btusb_mtk_reset function
Date: Tue, 2 Jan 2024 20:47:46 +0800
Message-ID: <20240102124747.21644-1-hao.qin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_044919_656396_EEA4EB5E 
X-CRM114-Status: GOOD (  11.12  )
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

Extract function btusb_mtk_subsys_reset from btusb_mtk_reset
for future handling of resetting bluetooth controller without
USB reset.

Signed-off-by: hao.qin <hao.qin@mediatek.com>

---
V1 -> V2: refactor btusb_mtk_reset function

Link:
  https://lore.kernel.org/all/20231215063714.7684-1-hao.qin@mediatek.com/
---
 drivers/bluetooth/btusb.c | 45 +++++++++++++++++++++++----------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 0926e4451802..abefcd1a089d 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2994,28 +2994,13 @@ static u32 btusb_mtk_reset_done(struct hci_dev *hdev)
 	return val & MTK_BT_RST_DONE;
 }
 
-static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
+static int btusb_mtk_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
-	struct btmediatek_data *mediatek;
 	u32 val;
 	int err;
 
-	/* It's MediaTek specific bluetooth reset mechanism via USB */
-	if (test_and_set_bit(BTUSB_HW_RESET_ACTIVE, &data->flags)) {
-		bt_dev_err(hdev, "last reset failed? Not resetting again");
-		return -EBUSY;
-	}
-
-	err = usb_autopm_get_interface(data->intf);
-	if (err < 0)
-		return err;
-
-	btusb_stop_traffic(data);
-	usb_kill_anchored_urbs(&data->tx_anchor);
-	mediatek = hci_get_priv(hdev);
-
-	if (mediatek->dev_id == 0x7925) {
+	if (dev_id == 0x7925) {
 		btusb_mtk_uhw_reg_read(data, MTK_BT_RESET_REG_CONNV3, &val);
 		val |= (1 << 5);
 		btusb_mtk_uhw_reg_write(data, MTK_BT_RESET_REG_CONNV3, val);
@@ -3059,8 +3044,32 @@ static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
 	if (!val)
 		bt_dev_err(hdev, "Can't get device id, subsys reset fail.");
 
-	usb_queue_reset_device(data->intf);
+	return err;
+}
 
+static int btusb_mtk_reset(struct hci_dev *hdev, void *rst_data)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	struct btmediatek_data *mediatek;
+	int err;
+
+	/* It's MediaTek specific bluetooth reset mechanism via USB */
+	if (test_and_set_bit(BTUSB_HW_RESET_ACTIVE, &data->flags)) {
+		bt_dev_err(hdev, "last reset failed? Not resetting again");
+		return -EBUSY;
+	}
+
+	err = usb_autopm_get_interface(data->intf);
+	if (err < 0)
+		return err;
+
+	btusb_stop_traffic(data);
+	usb_kill_anchored_urbs(&data->tx_anchor);
+	mediatek = hci_get_priv(hdev);
+
+	err = btusb_mtk_subsys_reset(hdev, mediatek->dev_id);
+
+	usb_queue_reset_device(data->intf);
 	clear_bit(BTUSB_HW_RESET_ACTIVE, &data->flags);
 
 	return err;
-- 
2.18.0


