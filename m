Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F7EC6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 23:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SitFztFHL7cuvst79spCHgqtrFJ8x6qYvVGwj95cDPM=; b=10xPHTKpkq0R3kKNiQ4CpPSrEJ
	KN9PIt6JKauW8r2sXznmQHLbxv8gZ8M3SBVUyhx7+GJqUrRkxXZWm80lU5vLxjod79ybL21aR7joD
	zz3YFK7XBaI/FYXlKeXaHbBRYP8BgTbmwLNB1AB8ZBAu8VOJWpdDvpQf1XtLluBvgZxaI+4dIwgMy
	faoOhpqCi++0olXJ6Zng54+cGx4eWc20SlCpat0fEhKVDC0Qmb22UFmO+EsC8Ll4ChMpmta4fp+Pk
	8QZcsLIKocGwFZpzrE6eJPN2Qz4XcJ5jIAHjrm4vKzwNVieGh/SJ/BSCHiGtG39hFj80YLxbnTav/
	p+c0Rufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXsXz-00FKUn-Js; Mon, 12 Sep 2022 23:08:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXsXw-00FKPi-Tn
	for linux-mediatek@lists.infradead.org; Mon, 12 Sep 2022 23:08:58 +0000
X-UUID: 94f1fb219814423d8f4572c14986c1bc-20220912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SitFztFHL7cuvst79spCHgqtrFJ8x6qYvVGwj95cDPM=;
	b=NPJTUQUs7TDPFHZW/+RL6t7QXyUhnY2o3z4Jc//uh7PI/8mBOPoMlFRcfHnmfv6D5K+tdyGwE6z4HjfQdOhyqczJTlMYRulTQq5wh/Wy9JSHfSA6pmL0KFTuiomse4ZgSwxOUyW+zUphQjVcrUp32VK3G0rtwadzCkQtIE0s+Yw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:177c6ce7-315a-49f5-9c06-4ba5feb18917,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:08e32bec-2856-4fce-b125-09d4c7ebe045,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 94f1fb219814423d8f4572c14986c1bc-20220912
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1696785433; Mon, 12 Sep 2022 16:08:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 13 Sep 2022 06:18:15 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 13 Sep 2022 06:18:15 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <luiz.dentz@gmail.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
	<YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
	<posh.sun@mediatek.com>, <ted.huang@mediatek.com>,
	<Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
	<steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
	<abhishekpandit@google.com>, <michaelfsun@google.com>,
	<abhishekpandit@chromium.org>, <mcchou@chromium.org>, <shawnku@google.com>,
	<linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/4] Bluetooth: btusb: mediatek: use readx_poll_timeout instead of open coding
Date: Tue, 13 Sep 2022 06:18:10 +0800
Message-ID: <43b68b1f48c20b1dfcd7e6663c3dcb38e4e0648c.1663020936.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_160856_997313_E78351E7 
X-CRM114-Status: GOOD (  13.68  )
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
 drivers/bluetooth/btusb.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index c3daba17de7f..4dc9cae3e937 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2318,8 +2318,6 @@ static int btusb_send_frame_intel(struct hci_dev *hdev, struct sk_buff *skb)
 #define MTK_EP_RST_OPT		0x74011890
 #define MTK_EP_RST_IN_OUT_OPT	0x00010001
 #define MTK_BT_RST_DONE		0x00000100
-#define MTK_BT_RESET_WAIT_MS	100
-#define MTK_BT_RESET_NUM_TRIES	10
 
 static void btusb_mtk_wmt_recv(struct urb *urb)
 {
@@ -2690,6 +2688,16 @@ static int btusb_mtk_id_get(struct btusb_data *data, u32 reg, u32 *id)
 	return btusb_mtk_reg_read(data, reg, id);
 }
 
+static u32 btusb_mtk_reset_done(struct hci_dev *hdev)
+{
+	struct btusb_data *data = hci_get_drvdata(hdev);
+	u32 val = 0;
+
+	btusb_mtk_uhw_reg_read(data, MTK_BT_MISC, &val);
+
+	return val;
+}
+
 static int btusb_mtk_setup(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
@@ -2879,7 +2887,7 @@ static void btusb_mtk_cmd_timeout(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	u32 val;
-	int err, retry = 0;
+	int err;
 
 	/* It's MediaTek specific bluetooth reset mechanism via USB */
 	if (test_and_set_bit(BTUSB_HW_RESET_ACTIVE, &data->flags)) {
@@ -2910,18 +2918,14 @@ static void btusb_mtk_cmd_timeout(struct hci_dev *hdev)
 	btusb_mtk_uhw_reg_write(data, MTK_BT_SUBSYS_RST, 0);
 	btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
 
-	/* Poll the register until reset is completed */
-	do {
-		btusb_mtk_uhw_reg_read(data, MTK_BT_MISC, &val);
-		if (val & MTK_BT_RST_DONE) {
-			bt_dev_dbg(hdev, "Bluetooth Reset Successfully");
-			break;
-		}
+	err = readx_poll_timeout(btusb_mtk_reset_done, hdev, val,
+				 val & MTK_BT_RST_DONE,
+				 100000, 1000000);
+	if (err < 0)
+		bt_dev_err(hdev, "Reset timeout");
 
-		bt_dev_dbg(hdev, "Polling Bluetooth Reset CR");
-		retry++;
-		msleep(MTK_BT_RESET_WAIT_MS);
-	} while (retry < MTK_BT_RESET_NUM_TRIES);
+	if (val & MTK_BT_RST_DONE)
+		bt_dev_dbg(hdev, "Bluetooth Reset Successfully");
 
 	btusb_mtk_id_get(data, 0x70010200, &val);
 	if (!val)
-- 
2.25.1


