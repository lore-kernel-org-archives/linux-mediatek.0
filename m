Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A7BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 18:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aFPnvEV43rUIy2HIo0oLdW9Z/mVg4JwwCUh/UU7wlis=; b=gHRP/3HzkjMCR7
	QPOioomu7mht8wjFR8/nqy3ji5YKLtMds34YQF9kMPrWDe8MFsqDD0mzMUbc3lsiZ6XeXKjenafyP
	4Sg11+nML7rpfbJooAtcYo+kPT8fV5G3q3z+hAgH1ILRegDiBh8pbiXWhTyKZHg7ZgbJSmWwUzBGp
	XQ4v5hd/AOfWWdHC+/X6SmjbnNyxbZ2W0DF533y+6zGunlNO+EIIPSVoGs7fiBTevyzll8tJTFN32
	dl4fypijN0h6fBC82CQ3zNmsOTWFPmVAyiRl5gyPWYsVjIcoVSl8pTtbSJaDp9sgqCEYKzQF5LEKT
	gNUnGFcV4xCcoDMWpvkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msTwc-009gEt-7I; Wed, 01 Dec 2021 18:03:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msTwX-009gB8-2l
 for linux-mediatek@lists.infradead.org; Wed, 01 Dec 2021 18:02:59 +0000
X-UUID: 0b93acf3deae46f7bed57d1e7ae9bb1a-20211201
X-UUID: 0b93acf3deae46f7bed57d1e7ae9bb1a-20211201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1829318098; Wed, 01 Dec 2021 11:02:53 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Dec 2021 10:02:52 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 2 Dec 2021 02:02:49 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Dec 2021 02:02:49 +0800
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
 <linux-kernel@vger.kernel.org>, Mark-yw Chen <mark-yw.chen@mediatek.com>
Subject: [PATCH v2 1/2] Bluetooth: Bluetooth: btmtksdio: handle runtime pm
 only when sdio_func is available
Date: Thu, 2 Dec 2021 02:02:46 +0800
Message-ID: <73960845c299e2cd22c11b84014ff6ba4758e9bb.1638381385.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_100257_168988_F7D982CE 
X-CRM114-Status: GOOD (  12.89  )
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

From: Sean Wang <sean.wang@mediatek.com>

Runtime pm ops is not aware the sdio_func status that is probably
being disabled by btmtksdio_close. Thus, we are only able to access the
sdio_func for the runtime pm operations only when the sdio_func is
available.

Fixes: 7f3c563c575e7 ("Bluetooth: btmtksdio: Add runtime PM support to SDIO based Bluetooth")
Co-developed-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
Signed-off-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: not check HCI_RUNNING from a driver, use an internal flag instead
---
 drivers/bluetooth/btmtksdio.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index d9cf0c492e29..fc6317e519e9 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -99,6 +99,7 @@ MODULE_DEVICE_TABLE(sdio, btmtksdio_table);
 
 #define BTMTKSDIO_TX_WAIT_VND_EVT	1
 #define BTMTKSDIO_HW_TX_READY		2
+#define BTMTKSDIO_FUNC_ENABLED		3
 
 struct mtkbtsdio_hdr {
 	__le16	len;
@@ -539,6 +540,8 @@ static int btmtksdio_open(struct hci_dev *hdev)
 	if (err < 0)
 		goto err_release_host;
 
+	set_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
+
 	/* Get ownership from the device */
 	sdio_writel(bdev->func, C_FW_OWN_REQ_CLR, MTK_REG_CHLPCR, &err);
 	if (err < 0)
@@ -640,6 +643,7 @@ static int btmtksdio_close(struct hci_dev *hdev)
 	if (err < 0)
 		bt_dev_err(bdev->hdev, "Cannot return ownership to device");
 
+	clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
 	sdio_disable_func(bdev->func);
 
 	sdio_release_host(bdev->func);
@@ -1058,6 +1062,9 @@ static int btmtksdio_runtime_suspend(struct device *dev)
 	if (!bdev)
 		return 0;
 
+	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
+		return 0;
+
 	sdio_claim_host(bdev->func);
 
 	sdio_writel(bdev->func, C_FW_OWN_REQ_SET, MTK_REG_CHLPCR, &err);
@@ -1085,6 +1092,9 @@ static int btmtksdio_runtime_resume(struct device *dev)
 	if (!bdev)
 		return 0;
 
+	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
+		return 0;
+
 	sdio_claim_host(bdev->func);
 
 	sdio_writel(bdev->func, C_FW_OWN_REQ_CLR, MTK_REG_CHLPCR, &err);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
