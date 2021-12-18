Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E7BC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 01:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8COC++VfkMuzpDxDynXKW3S6NTq9LrVShfGh+prxzgI=; b=xx/73fYGmZEXo0
	cVTRTUFDTtsfW7nNP73wLQGhRwvjh5CgIqDfISiG3wCYmOEet+0mMgha131+Le3NZpuG6AS7WqQib
	lD6Swl21C/cqMFMMfBn99g5Emyl1znSPJlb6NQ6TbhblMtRykYpxCEKDIVKdaAOKeSA+gI42NVb3X
	z/in1+sKSP2IrdK9EFCUtfPnWMQ3xybw8s2JHX7ZRbg2djPr21e5AzK7tmM6q8bccsZjgqT3SSfCD
	jCPuwJrXx1DicSzt7o+mgJ4dm5iyX3zUjoq7FkDGQAbd/t4VuKLSrH0i6cvXrPxLlqIUVG9ODnAHh
	zJHt8kjAih02flfBFbqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myODz-00Cnwj-AH; Sat, 18 Dec 2021 01:09:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myODv-00CnvX-Uu
 for linux-mediatek@lists.infradead.org; Sat, 18 Dec 2021 01:09:21 +0000
X-UUID: ab528ab049154610862e87776d78eba9-20211217
X-UUID: ab528ab049154610862e87776d78eba9-20211217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1135222059; Fri, 17 Dec 2021 18:09:11 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Dec 2021 17:09:09 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 18 Dec 2021 09:08:55 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 18 Dec 2021 09:08:54 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <Mark-YW.Chen@mediatek.com>, <sean.wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <michaelfsun@google.com>,
 <mcchou@chromium.org>, <shawnku@google.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Mark Chen <mark-yw.chen@mediatek.com>
Subject: [PATCH RESEND 1/3] Bluetooth: btmtksdio: add the support of wake on
 bluetooth
Date: Sat, 18 Dec 2021 09:08:51 +0800
Message-ID: <632534014b9b8a38e81dfb5749dcd75e2088adb1.1639787634.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_170920_048122_4C78DB4F 
X-CRM114-Status: GOOD (  13.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Mark Chen <mark-yw.chen@mediatek.com>

Add the support to enable wake on bluetooth

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btmtk.h     |  8 ++++++++
 drivers/bluetooth/btmtksdio.c | 31 ++++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 6e7b0c7567c0..2be1d2680ad8 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -68,6 +68,14 @@ struct btmtk_tci_sleep {
 	u8 time_compensation;
 } __packed;
 
+struct btmtk_wakeon {
+	u8 mode;
+	u8 gpo;
+	u8 active_high;
+	__le16 enable_delay;
+	__le16 wakeup_delay;
+} __packed;
+
 struct btmtk_hci_wmt_params {
 	u8 op;
 	u8 flag;
diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index b5ea8d3bffaa..771733ce362b 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -958,6 +958,30 @@ static int btmtksdio_send_frame(struct hci_dev *hdev, struct sk_buff *skb)
 	return 0;
 }
 
+static bool btmtk_sdio_wakeup(struct hci_dev *hdev)
+{
+	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
+	bool may_wakeup = device_may_wakeup(bdev->dev);
+	struct btmtk_wakeon bt_awake = {
+		.mode = 0x1,
+		.gpo = 0,
+		.active_high = 0x1,
+		.enable_delay = cpu_to_le16(0xc80),
+		.wakeup_delay = cpu_to_le16(0x20)
+	};
+	struct sk_buff *skb;
+
+	if (may_wakeup &&
+	    bdev->data->chipid == 0x7921) {
+		skb =  __hci_cmd_sync(hdev, 0xfc27, sizeof(bt_awake),
+				      &bt_awake, HCI_CMD_TIMEOUT);
+		if (IS_ERR(skb))
+			may_wakeup = false;
+	}
+
+	return may_wakeup;
+}
+
 static int btmtksdio_probe(struct sdio_func *func,
 			   const struct sdio_device_id *id)
 {
@@ -998,6 +1022,7 @@ static int btmtksdio_probe(struct sdio_func *func,
 	hdev->shutdown = btmtksdio_shutdown;
 	hdev->send     = btmtksdio_send_frame;
 	hdev->set_bdaddr = btmtk_set_bdaddr;
+	hdev->wakeup = btmtk_sdio_wakeup;
 
 	SET_HCIDEV_DEV(hdev, &func->dev);
 
@@ -1032,7 +1057,11 @@ static int btmtksdio_probe(struct sdio_func *func,
 	 */
 	pm_runtime_put_noidle(bdev->dev);
 
-	return 0;
+	err = device_init_wakeup(bdev->dev, true);
+	if (err)
+		bt_dev_err(hdev, "%s: failed to init_wakeup", __func__);
+
+	return err;
 }
 
 static void btmtksdio_remove(struct sdio_func *func)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
