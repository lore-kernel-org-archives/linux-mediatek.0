Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FE7EB64DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 22:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4yrhuypULG2OCnly9KsqFwdywOUBkTDpjc5m2LAnCvU=; b=DgcDEE+zPOURgHj6eLkl0C1ab1
	iMiAqOk2I/tTLGJT12e5yOzh03Ml3KjaPmzDDk00Eo1xKsauu/yFz1U7l+I6m2ED0lLI41tRw5Rll
	lnj6GwSZ50/TCCxz8IPIFm/JreGd+Jbif8KWMDhNoD0H8CWYuyE4TD+fUAMcUBNM5AEIeiJVORq9M
	nf6186tULbwP1QmXdlqPZp+cVpC5A+cRGWb/ejOnknyhfsJESHuLR2M6IpzuLw3zOjuE2SDo/XpqA
	RG4FHKawAtsVnbHpKSolYR4dcSChR8MdnFSiO3w12OCZm/ROksP4kXUBEP37pZ2DmdoYYuhTNwal8
	pD/3xQ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEe44-00GxES-3C;
	Wed, 28 Jun 2023 22:55:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEe42-00GxDv-0N
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 22:55:07 +0000
X-UUID: d04934fa160611ee83ed1395ce914268-20230628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=4yrhuypULG2OCnly9KsqFwdywOUBkTDpjc5m2LAnCvU=;
	b=dPIERtCiLdJ78/Kz+xAp2oFARC+ReIK0lrnRWvK72y2JkpmQVlXq/dAEKTuqIm68S9G8CaG+oYieCaeLTXrsUHWIoYMcreQg8IUprOEhDJl5fEGDojtmR4vqZgv0AyecPgMfXcPkzYDjt1yDa/XUbJW8M8YPrfGbhcM88M48k7w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.27,REQID:aec0a5c6-2d18-443e-a495-c3b1b31ce311,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.27,REQID:aec0a5c6-2d18-443e-a495-c3b1b31ce311,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:01c9525,CLOUDID:17a7a50d-c22b-45ab-8a43-3004e9216b56,B
	ulkID:230629065501KD1OL7R2,BulkQuantity:1,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_ULN,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,
	TF_CID_SPAM_ASC,TF_CID_SPAM_FAS
X-UUID: d04934fa160611ee83ed1395ce914268-20230628
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <sean.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 231621023; Wed, 28 Jun 2023 15:55:01 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 29 Jun 2023 06:54:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 29 Jun 2023 06:54:59 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <luiz.dentz@gmail.com>
CC: <sean.wang@mediatek.com>, <chris.lu@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
	<km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>,
	<ch.yeh@mediatek.com>, <jenhao.yang@mediatek.com>,
	<Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
	<steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
	<abhishekpandit@google.com>, <michaelfsun@google.com>, <mmandlik@google.com>,
	<abhishekpandit@chromium.org>, <mcchou@chromium.org>, <shawnku@google.com>,
	<linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v8 1/3] Bluetooth: btusb: mediatek: readx_poll_timeout replaces open coding
Date: Thu, 29 Jun 2023 06:54:55 +0800
Message-ID: <80efe66b16d933e3457bd38b1a60a5d51d4dee9e.1687991820.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_155506_171664_AF41628A 
X-CRM114-Status: GOOD (  13.73  )
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
v2: use 20ms as the unit to poll according to the requirement of
    readx_poll_timeout
v3: refine btusb_mtk_reset_done and drop the necessary error check
    in btusb_mtk_cmd_timeout
v4, v5, v6 and v7: rebase onto the latest codebase
v8: fixed GitLint failure
---
 drivers/bluetooth/btusb.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index cb58691b63ca..4c38d1c0f059 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2657,8 +2657,6 @@ static int btusb_recv_event_realtek(struct hci_dev *hdev, struct sk_buff *skb)
 #define MTK_EP_RST_OPT		0x74011890
 #define MTK_EP_RST_IN_OUT_OPT	0x00010001
 #define MTK_BT_RST_DONE		0x00000100
-#define MTK_BT_RESET_WAIT_MS	100
-#define MTK_BT_RESET_NUM_TRIES	10
 #define MTK_BT_RESET_REG_CONNV3	0x70028610
 #define MTK_BT_READ_DEV_ID	0x70010200
 
@@ -3032,6 +3030,16 @@ static int btusb_mtk_id_get(struct btusb_data *data, u32 reg, u32 *id)
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
@@ -3232,7 +3240,7 @@ static void btusb_mtk_cmd_timeout(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 	u32 val;
-	int err, retry = 0;
+	int err;
 	struct btmediatek_data *mediatek;
 
 	/* It's MediaTek specific bluetooth reset mechanism via USB */
@@ -3284,18 +3292,10 @@ static void btusb_mtk_cmd_timeout(struct hci_dev *hdev)
 		btusb_mtk_uhw_reg_read(data, MTK_BT_SUBSYS_RST, &val);
 	}
 
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


