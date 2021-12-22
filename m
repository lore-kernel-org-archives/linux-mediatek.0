Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891EBC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 03:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jS3yo2qh+355F7vKCjIXBM1a5cQ+U7bCHZMyxsH+QLU=; b=CfSsJtsill22rD
	TZ9uu+itZwQtgVRIj46jJ3+UZtgQ8VAuHUtmM76kq3JZxGiH07WbsyCOPTljUK5B/9hxbZqRkwJPy
	fKSC+cN2uxmzhV3vwxfj16zKZohYmF1X6EvbWJKV8/psgkvMZLGgL85UEnfq8P0AfA2TLrldeXUwW
	HpVkWBcnP3uIVW9oex1oKIIX5DO0BrjWMcq/hyzDem1HyI0W3u7Ez1sSlIRB3uOXIvQZqFBUAFl4z
	rygaozHM3yAFxToux1PVY7z/vuSv+vF7v5QAC301Eco18fFir9lfT8rTG6RVpo203zN57riCES/0I
	S0QBtqLV5wjIZQJlgsAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzs2x-00943H-4n; Wed, 22 Dec 2021 03:12:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzs2s-00941E-2q
 for linux-mediatek@lists.infradead.org; Wed, 22 Dec 2021 03:12:04 +0000
X-UUID: ab760620ce404933ac6233b49a4ca079-20211221
X-UUID: ab760620ce404933ac6233b49a4ca079-20211221
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 443586022; Tue, 21 Dec 2021 20:11:59 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Dec 2021 19:11:57 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 22 Dec 2021 11:11:49 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 22 Dec 2021 11:11:49 +0800
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
Subject: [PATCH v2 1/3] Bluetooth: mt7921s: Support wake on bluetooth
Date: Wed, 22 Dec 2021 11:11:45 +0800
Message-ID: <ef0603f2553d09fb84043704e4726d0ab98aa63b.1640141813.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_191202_157687_1D092C31 
X-CRM114-Status: GOOD (  17.75  )
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

Enable wake on bluetooth on mt7921s that can be supported since the
firmware with version 20211129211059 was added, and the patch would
not cause any harm even when the old firmware is applied.

The patch was tested by setting up an HID or HOGP profile to connect a
Bluetooth keyboard and mouse, then putting the system to suspend, then
trying to wake up the system by moving the Bluetooth keyboard or mouse,
and then checking if the system can wake up and be brought back to
the normal state.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
---
v2: refine the git message
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
