Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DF9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UtdQsmtFMEGn50TIDlTZO2G1JsKl7klPtOZfXWNCeKk=; b=gGWIm1fnzOQ2bU
	ItOvcgLNjRCw31SaNTakwMr4nUoO8aUp34OAxGs3yQ3aeHumEish8GlrMW5Q34k29LC5c7PlNj+om
	l0RERSLsCRsOWykIq75Yno/HN5shl36GCUytoMOIu4PUU2B0oPNL65VDG31uyb/h8e+Ed/ZSV7w11
	HqOaemeOm5BqNW0CeJcHUm/LBQ0LXxwkVToWDsQgn4eUzf2hCs2J7/Ing3Xi8vHk3iz7S9BqOp7XT
	LcYyGDtjInOFjy+a6FZPzOddm0D7VXi3L3sicFzQR4PyKZDvS6U+43egyKQXrrzw9GxLDcynJSeeC
	2b3Ri3y0w4K+grrHddtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7YEF-001PHj-K2; Wed, 12 Jan 2022 07:39:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7YEB-001PG6-CB
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 07:39:30 +0000
X-UUID: 4fed68922f074e028f0dca9117cee3ef-20220112
X-UUID: 4fed68922f074e028f0dca9117cee3ef-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1998983097; Wed, 12 Jan 2022 00:39:23 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 23:39:21 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Jan 2022 15:39:20 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 12 Jan 2022 15:39:19 +0800
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
Subject: [PATCH 1/7] Bluetooth: mt7921s: fix firmware coredump retrieve
Date: Wed, 12 Jan 2022 15:39:11 +0800
Message-ID: <bddfacd096b6fe927d08e48ad6993c17c9954028.1641972745.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_233927_445504_2E14490B 
X-CRM114-Status: GOOD (  12.37  )
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

According to the MCU firmware behavior, as the driver is aware of the
notification of the interrupt source FW_MAILBOX_INT that shows the MCU
completed delivered a core dump piece to the host, the driver must
acknowledge the MCU with the register PH2DSM0R bit PH2DSM0R_DRIVER_OWN
to notify the MCU to handle the next core dump piece.

Fixes: db57b625912a ("Bluetooth: btmtksdio: add support of processing firmware coredump and log")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 25fb9c79b1f4..784e65c3fddd 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -87,8 +87,12 @@ MODULE_DEVICE_TABLE(sdio, btmtksdio_table);
 #define RX_DONE_INT		BIT(1)
 #define TX_EMPTY		BIT(2)
 #define TX_FIFO_OVERFLOW	BIT(8)
+#define FW_MAILBOX_INT		BIT(15)
 #define RX_PKT_LEN		GENMASK(31, 16)
 
+#define MTK_REG_PH2DSM0R	0xc4
+#define PH2DSM0R_DRIVER_OWN	BIT(0)
+
 #define MTK_REG_CTDR		0x18
 
 #define MTK_REG_CRDR		0x1c
@@ -481,6 +485,12 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 		 */
 		sdio_writel(bdev->func, int_status, MTK_REG_CHISR, NULL);
 
+		if ((int_status & FW_MAILBOX_INT) &&
+		    bdev->data->chipid == 0x7921) {
+			sdio_writel(bdev->func, PH2DSM0R_DRIVER_OWN,
+				    MTK_REG_PH2DSM0R, 0);
+		}
+
 		if (int_status & FW_OWN_BACK_INT)
 			bt_dev_dbg(bdev->hdev, "Get fw own back");
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
