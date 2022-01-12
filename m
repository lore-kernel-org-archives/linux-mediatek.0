Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15DCC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+o6212dJYoYPboHkB6Kk6Fd5fL2R51ofzO0+vYIbI0=; b=KVZuorVjViVPA5
	ExVgWdB/cKOvPaXc0CcCVW8SAnioHe0ciMVrFmQPKwAzC9NXKMREgNLx0ylt2QaxMwUtRmEZZ7CwA
	o3vuPahKffsso3FCbElv2AggPa0FqvkJ8/b/CHvJdo22df5nJ7n2quYfr8aQn6HrmxvvpFYOPnAhB
	ORJtTKFu8AMuu8pG1NSEXeSXBIHnFTr4WJlcuoPvQW9kZ/bMaFAwgxp0iY/PvpdXNKnpc+bjz6mL1
	wtuX94P3fkejhIE4M97vMplmnRpi/QliP7QB/xEcA+fbaxYPBamKUaWsJQO0jC7lOl3tysjHVC56y
	sCiFxEold4tFUcHCEmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7YF8-001PX7-Hz; Wed, 12 Jan 2022 07:40:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7YF6-001PWO-0v
 for linux-mediatek@lists.infradead.org; Wed, 12 Jan 2022 07:40:25 +0000
X-UUID: 6a2d9db81ab447c3b39150c2fa23cf92-20220112
X-UUID: 6a2d9db81ab447c3b39150c2fa23cf92-20220112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 433298694; Wed, 12 Jan 2022 00:40:20 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 11 Jan 2022 23:39:29 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 12 Jan 2022 15:39:21 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 12 Jan 2022 15:39:21 +0800
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
Subject: [PATCH 2/7] Bluetooth: btmtksdio: refactor
 btmtksdio_runtime_[suspend|resume]()
Date: Wed, 12 Jan 2022 15:39:12 +0800
Message-ID: <b18877fc0136c336260e831614c463709d9cb261.1641972745.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <bddfacd096b6fe927d08e48ad6993c17c9954028.1641972745.git.objelf@gmail.com>
References: <bddfacd096b6fe927d08e48ad6993c17c9954028.1641972745.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_234024_105439_4B29592A 
X-CRM114-Status: GOOD (  17.14  )
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

Refactor btmtksdio_runtime_[suspend|resume]() to create the common
funcitons btmtksdio_[fw|drv]_pmctrl() shared with btmtksdio_[open|close]()
to avoid the redundant code as well.

This is also a prerequisite patch for the incoming patches.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 94 ++++++++++++++++++++---------------
 1 file changed, 53 insertions(+), 41 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 784e65c3fddd..8cbd49013d86 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -282,6 +282,54 @@ static u32 btmtksdio_drv_own_query(struct btmtksdio_dev *bdev)
 	return sdio_readl(bdev->func, MTK_REG_CHLPCR, NULL);
 }
 
+static int btmtksdio_fw_pmctrl(struct btmtksdio_dev *bdev)
+{
+	u32 status;
+	int err;
+
+	sdio_claim_host(bdev->func);
+
+	/* Return ownership to the device */
+	sdio_writel(bdev->func, C_FW_OWN_REQ_SET, MTK_REG_CHLPCR, &err);
+	if (err < 0)
+		goto out;
+
+	err = readx_poll_timeout(btmtksdio_drv_own_query, bdev, status,
+				 !(status & C_COM_DRV_OWN), 2000, 1000000);
+
+out:
+	sdio_release_host(bdev->func);
+
+	if (err < 0)
+		bt_dev_err(bdev->hdev, "Cannot return ownership to device");
+
+	return err;
+}
+
+static int btmtksdio_drv_pmctrl(struct btmtksdio_dev *bdev)
+{
+	u32 status;
+	int err;
+
+	sdio_claim_host(bdev->func);
+
+	/* Get ownership from the device */
+	sdio_writel(bdev->func, C_FW_OWN_REQ_CLR, MTK_REG_CHLPCR, &err);
+	if (err < 0)
+		goto out;
+
+	err = readx_poll_timeout(btmtksdio_drv_own_query, bdev, status,
+				 status & C_COM_DRV_OWN, 2000, 1000000);
+
+out:
+	sdio_release_host(bdev->func);
+
+	if (err < 0)
+		bt_dev_err(bdev->hdev, "Cannot get ownership from device");
+
+	return err;
+}
+
 static int btmtksdio_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
@@ -541,7 +589,7 @@ static void btmtksdio_interrupt(struct sdio_func *func)
 static int btmtksdio_open(struct hci_dev *hdev)
 {
 	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
-	u32 status, val;
+	u32 val;
 	int err;
 
 	sdio_claim_host(bdev->func);
@@ -552,18 +600,10 @@ static int btmtksdio_open(struct hci_dev *hdev)
 
 	set_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
 
-	/* Get ownership from the device */
-	sdio_writel(bdev->func, C_FW_OWN_REQ_CLR, MTK_REG_CHLPCR, &err);
+	err = btmtksdio_drv_pmctrl(bdev);
 	if (err < 0)
 		goto err_disable_func;
 
-	err = readx_poll_timeout(btmtksdio_drv_own_query, bdev, status,
-				 status & C_COM_DRV_OWN, 2000, 1000000);
-	if (err < 0) {
-		bt_dev_err(bdev->hdev, "Cannot get ownership from device");
-		goto err_disable_func;
-	}
-
 	/* Disable interrupt & mask out all interrupt sources */
 	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, &err);
 	if (err < 0)
@@ -633,8 +673,6 @@ static int btmtksdio_open(struct hci_dev *hdev)
 static int btmtksdio_close(struct hci_dev *hdev)
 {
 	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
-	u32 status;
-	int err;
 
 	sdio_claim_host(bdev->func);
 
@@ -645,13 +683,7 @@ static int btmtksdio_close(struct hci_dev *hdev)
 
 	cancel_work_sync(&bdev->txrx_work);
 
-	/* Return ownership to the device */
-	sdio_writel(bdev->func, C_FW_OWN_REQ_SET, MTK_REG_CHLPCR, NULL);
-
-	err = readx_poll_timeout(btmtksdio_drv_own_query, bdev, status,
-				 !(status & C_COM_DRV_OWN), 2000, 1000000);
-	if (err < 0)
-		bt_dev_err(bdev->hdev, "Cannot return ownership to device");
+	btmtksdio_fw_pmctrl(bdev);
 
 	clear_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state);
 	sdio_disable_func(bdev->func);
@@ -1162,7 +1194,6 @@ static int btmtksdio_runtime_suspend(struct device *dev)
 {
 	struct sdio_func *func = dev_to_sdio_func(dev);
 	struct btmtksdio_dev *bdev;
-	u32 status;
 	int err;
 
 	bdev = sdio_get_drvdata(func);
@@ -1174,19 +1205,10 @@ static int btmtksdio_runtime_suspend(struct device *dev)
 
 	sdio_set_host_pm_flags(func, MMC_PM_KEEP_POWER);
 
-	sdio_claim_host(bdev->func);
-
-	sdio_writel(bdev->func, C_FW_OWN_REQ_SET, MTK_REG_CHLPCR, &err);
-	if (err < 0)
-		goto out;
+	err = btmtksdio_fw_pmctrl(bdev);
 
-	err = readx_poll_timeout(btmtksdio_drv_own_query, bdev, status,
-				 !(status & C_COM_DRV_OWN), 2000, 1000000);
-out:
 	bt_dev_info(bdev->hdev, "status (%d) return ownership to device", err);
 
-	sdio_release_host(bdev->func);
-
 	return err;
 }
 
@@ -1194,7 +1216,6 @@ static int btmtksdio_runtime_resume(struct device *dev)
 {
 	struct sdio_func *func = dev_to_sdio_func(dev);
 	struct btmtksdio_dev *bdev;
-	u32 status;
 	int err;
 
 	bdev = sdio_get_drvdata(func);
@@ -1204,19 +1225,10 @@ static int btmtksdio_runtime_resume(struct device *dev)
 	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
 		return 0;
 
-	sdio_claim_host(bdev->func);
-
-	sdio_writel(bdev->func, C_FW_OWN_REQ_CLR, MTK_REG_CHLPCR, &err);
-	if (err < 0)
-		goto out;
+	err = btmtksdio_drv_pmctrl(bdev);
 
-	err = readx_poll_timeout(btmtksdio_drv_own_query, bdev, status,
-				 status & C_COM_DRV_OWN, 2000, 1000000);
-out:
 	bt_dev_info(bdev->hdev, "status (%d) get ownership from device", err);
 
-	sdio_release_host(bdev->func);
-
 	return err;
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
