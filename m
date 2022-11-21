Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F805C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 19:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZDtrqJqyAAB4TBCUonI2IN7i3sDJI2wzUGUaxKd9Kkc=; b=omblxIL6USCbFEcECSxkBnXT+d
	AKuxrFV/KyNx411e2VaEJL44oQ3Czjy6t1z20U0uG5Dl6w+Xz9YZpJ4pCQbJZtgsDX56JzmXQT/aO
	qkzddi1ZDbCZrlmimPuflaj5yUcNowx+dKx5ak+Qem9SUTtXDgXmYCX0gaBl736X5No8SXGlHYmap
	9vWj5Q7PwE3BO0Ynu8geRpk2Vm4bJZCBNiux65iPCxN3MlLsBI8kgCB0tyGeeVT2ICmXT7u+uWbU+
	8Y4RLPc87XIXijfKU+D3HoI3qYZnxLGMVCnKVb2mBLKYnBxVDYeQ2UYq7C2RbAEn7ApM2RZR3aA4C
	FFBdbJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxCVa-00HGBX-AP; Mon, 21 Nov 2022 19:31:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxCVX-00HG9B-5H
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 19:31:08 +0000
X-UUID: aab8e41361c447b1ae4564dc8fb85f76-20221121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ZDtrqJqyAAB4TBCUonI2IN7i3sDJI2wzUGUaxKd9Kkc=;
	b=Cuu5Zz75NlI13PIAXDb4GDJvjiT9lwJUoJpZ5p2N+10D+uFkBj9hXXwVhUKFpvcxI4YQccuKZucq2NpywxNDrIQOGjAOLcnVsWM59QaSuv9ysbFrGuXLNv4MXGBsl9IUmVFClZq1Lsjd3tOizM4JMDC9xNxFfGLgwl6sXRkE4rI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:5bfc8450-385b-4ef9-9c3b-f7538e521998,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:0b69d2db-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: aab8e41361c447b1ae4564dc8fb85f76-20221121
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2043345460; Mon, 21 Nov 2022 12:30:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 22 Nov 2022 03:20:54 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 22 Nov 2022 03:20:54 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <luiz.dentz@gmail.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
	<jenhao.yang@mediatek.com>, <posh.sun@mediatek.com>,
	<ted.huang@mediatek.com>, <Stella.Chang@mediatek.com>,
	<Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>, <jsiuda@google.com>,
	<frankgor@google.com>, <abhishekpandit@google.com>, <michaelfsun@google.com>,
	<abhishekpandit@chromium.org>, <mcchou@chromium.org>, <shawnku@google.com>,
	<linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/3] Bluetooth: btusb: mediatek: use readx_poll_timeout instead of open coding
Date: Tue, 22 Nov 2022 03:20:51 +0800
Message-ID: <caf41c6a33b1ceeb36ec7261b0cc894082352c46.1669057170.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_113107_235811_DB1B22A7 
X-CRM114-Status: GOOD (  15.30  )
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

Use readx_poll_timeout instead of open coding to poll the hardware reset
status until it is done.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
The patch is built and tested on the top of the patches
[v6,1/3] Bluetooth: Add support for hci devcoredump
[v6,2/3] Bluetooth: btusb: Add btusb devcoredump support
[v6,3/3] Bluetooth: btintel: Add Intel devcoredump support
which are contributed from Manish Mandlik

v2: use 20ms as the unit to poll according to the requirement of
    readx_poll_timeout

v3: refine btusb_mtk_reset_done and drop the necessary error check
    in btusb_mtk_cmd_timeout
---
 drivers/bluetooth/btusb.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 8d076efdf6a8..791bd3f620fc 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2321,8 +2321,6 @@ static int btusb_send_frame_intel(struct hci_dev *hdev, struct sk_buff *skb)
 #define MTK_EP_RST_OPT		0x74011890
 #define MTK_EP_RST_IN_OUT_OPT	0x00010001
 #define MTK_BT_RST_DONE		0x00000100
-#define MTK_BT_RESET_WAIT_MS	100
-#define MTK_BT_RESET_NUM_TRIES	10
 
 static void btusb_mtk_wmt_recv(struct urb *urb)
 {
@@ -2679,6 +2677,16 @@ static int btusb_mtk_id_get(struct btusb_data *data, u32 reg, u32 *id)
 	return btusb_mtk_reg_read(data, reg, id);
 }
 
+static u32 btusb_mtk_reset_done(struct hci_dev *hdev)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	u32 val = 0;
+
+	btusb_mtk_uhw_reg_read(data, MTK_BT_MISC, &val);
+
+	return val & MTK_BT_RST_DONE;
+}
+
 static int btusb_mtk_setup(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
@@ -2868,7 +2876,7 @@ static void btusb_mtk_cmd_timeout(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	u32 val;
-	int err, retry = 0;
+	int err;
 
 	/* It's MediaTek specific bluetooth reset mechanism via USB */
 	if (test_and_set_bit(BTUSB_HW_RESET_ACTIVE, &data->flags)) {
@@ -2899,18 +2907,10 @@ static void btusb_mtk_cmd_timeout(struct hci_dev *hdev)
 	btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, 0);
 	btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
 
-	/* Poll the register until reset is completed */
-	do {
-		btusb_mtk_uhw_reg_read(data, MTK_BT_MISC, &val);
-		if (val & MTK_BT_RST_DONE) {
-			bt_dev_dbg(hdev, "Bluetooth Reset Successfully");
-			break;
-		}
-
-		bt_dev_dbg(hdev, "Polling Bluetooth Reset CR");
-		retry++;
-		msleep(MTK_BT_RESET_WAIT_MS);
-	} while (retry < MTK_BT_RESET_NUM_TRIES);
+	err = readx_poll_timeout(btusb_mtk_reset_done, hdev, val,
+				 val & MTK_BT_RST_DONE, 20000, 1000000);
+	if (err < 0)
+		bt_dev_err(hdev, "Reset timeout");
 
 	btusb_mtk_id_get(data, 0x70010200, &val);
 	if (!val)
-- 
2.25.1


