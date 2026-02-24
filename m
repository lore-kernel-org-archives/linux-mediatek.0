Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDD8EFB806
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 06:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQv1yJimGlxvy4yGPgOsX/UNrk5wbgDTKKecRY0I1tE=; b=S8a34t5shkNDko0Z9KhZ/O7e+s
	ekW90Z8ZHWD6KPzaqnHrrySaXf6f9XcSJGglY0kls6N18brQpwdRWDhDpxY/7obZT0nxPYmVXZ6/K
	26Kuq/sSpxy95xJZa9gdm3CTcMj8TujHKFjmsl63wHKZ95vnc08/E/KgsGyrbsirW2A9hGs2ZN6XQ
	xtEsj+2r2KHS2HBVksUpizRbLBpvn6D+rt0ZWEbRs4PrmDcOqPTlSoxCDXiVAkyzt3Jzi8Ryl0glF
	XcaFX0hSTjYOza0qFUzEyNS5Q8SbADEftAK/I0pVkt19MCtFRFtMvNpfo4dZkeFx2pwb1vQJ9Orud
	czjaqNpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgv-00000001WB2-2Rio;
	Tue, 24 Feb 2026 06:14:41 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vulgs-00000001WAG-2QMO
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Feb 2026 06:14:40 +0000
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-679b072ed3aso2686295eaf.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 22:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771913677; x=1772518477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQv1yJimGlxvy4yGPgOsX/UNrk5wbgDTKKecRY0I1tE=;
        b=dcr8KnVMfHr7yUAHZHK1fILALfomOgnVCtHxCm99gAFFBTCo39yRflmHP5v0bvm3X8
         0P7h00vUZV476I1JKMnqt23cEG6X2G5ABHROxAlfWichHubha6Pas+s+LIN0vwJSOjzB
         FiYZjJOC+lPm53yVnL4GuqfS+lF60oJCq0d3ZholDXRdknvsNwPp23zk7eSVwTvo65zv
         2cSeXbdhjhcymRmEDI1rlXayfzRshcQ6qphSbfQHRmR3S+Qupk2RRydwr7pg9x2bj+1W
         tbz4hPWI/bWvEmjU6Ma1Y2V324ArqsY9TWiJkXmAQcBxyQMMiPo7yFfxEEZsnNeHox6y
         U5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWJzq6splfouUYrXIfWm6So2qD0cc0Aquh6Si33iPpUIw6qh1T96i3J//E8lf0EvsmnrQ62CwqvYoX4Cw98vQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz11r+NjFtL+b9ZjnfIv3vtOZmzAkq/K9FJ3kS0BrP95dIAlxc2
	Lxcs8tiU8x+GYWjSmTndMH6w3ilXLI4Q6+8JF7dkI9b0Rg8QjbluhfSt
X-Gm-Gg: AZuq6aLGorcSU56Y1ibL54uop37ynT5Hky2YALuBL7C8uJkqIxygH6msho/kgxmMYhD
	ZnsPy5OGRk4W8Dvs0Ec98OP5PTsicnJctT2nAZSMlOUiSpLne5dSEGOJIpz8oWM4Vd/kS/9wAQ1
	6PxcRVxaavPekrOsAvZNS9R5rmPn3/Y7shEK6yeR9QXB2jaszknrwHQe+Ce7ktiL1weObztk/HV
	0uBCgbE4KxBRoL8z0z3dUd+Lp/iMyM8g5djpTSJ0nSZ0ihEc5UiiubPyyIL0cvml9t9hkeVapwR
	bFVMFMs5SA92Nco+O8P2Qe5LBUHPNPcvB/v1WN4iSI3GWySljXgbX0qSaG5hrMVRdftbaOxlQb8
	iypdWyAnSQzMbxieJMQJ74seB4TKBMsPGkQFKHdxVSDvCiolylBNmwuEtayumFlmCnX1vhZZFB5
	JigYdei7MBj27MRLl69f5FICqJ+bTV+/L3fk697qZW/F/Q/krakN+/6/SkvLMWPtE=
X-Received: by 2002:a05:6820:4c04:b0:661:1d0c:a5af with SMTP id 006d021491bc7-679c461247dmr5953555eaf.69.1771913677584;
        Mon, 23 Feb 2026 22:14:37 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:8ac2:4fdd:a742:61b8])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679c56dbde9sm7895306eaf.11.2026.02.23.22.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:14:35 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 8/8] Bluetooth: btmtk: add MT7902 SDIO support
Date: Tue, 24 Feb 2026 00:13:25 -0600
Message-ID: <20260224061325.20189-8-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224061325.20189-1-sean.wang@kernel.org>
References: <20260224061325.20189-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_221438_620636_D7959EDA 
X-CRM114-Status: GOOD (  14.92  )
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

Add MT7902 Bluetooth SDIO support by introducing chip data and
registering the device ID.

Runtime PM is not yet supported by the driver, but normal operation
is unaffected.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: no changes
---
 drivers/bluetooth/btmtksdio.c | 42 ++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index e986e5af51ae..042064464d34 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -42,24 +42,35 @@ struct btmtksdio_data {
 	const char *fwname;
 	u16 chipid;
 	bool lp_mbox_supported;
+	bool pm_runtime_supported;
 };
 
 static const struct btmtksdio_data mt7663_data = {
 	.fwname = FIRMWARE_MT7663,
 	.chipid = 0x7663,
 	.lp_mbox_supported = false,
+	.pm_runtime_supported = true,
 };
 
 static const struct btmtksdio_data mt7668_data = {
 	.fwname = FIRMWARE_MT7668,
 	.chipid = 0x7668,
 	.lp_mbox_supported = false,
+	.pm_runtime_supported = true,
 };
 
 static const struct btmtksdio_data mt7921_data = {
 	.fwname = FIRMWARE_MT7961,
 	.chipid = 0x7921,
 	.lp_mbox_supported = true,
+	.pm_runtime_supported = true,
+};
+
+static const struct btmtksdio_data mt7902_data = {
+	.fwname = FIRMWARE_MT7902,
+	.chipid = 0x7902,
+	.lp_mbox_supported = false,
+	.pm_runtime_supported = false,
 };
 
 static const struct sdio_device_id btmtksdio_table[] = {
@@ -69,6 +80,8 @@ static const struct sdio_device_id btmtksdio_table[] = {
 	 .driver_data = (kernel_ulong_t)&mt7668_data },
 	{SDIO_DEVICE(SDIO_VENDOR_ID_MEDIATEK, SDIO_DEVICE_ID_MEDIATEK_MT7961),
 	 .driver_data = (kernel_ulong_t)&mt7921_data },
+	{SDIO_DEVICE(SDIO_VENDOR_ID_MEDIATEK, SDIO_DEVICE_ID_MEDIATEK_MT7902),
+	.driver_data = (kernel_ulong_t)&mt7902_data },
 	{ }	/* Terminating entry */
 };
 MODULE_DEVICE_TABLE(sdio, btmtksdio_table);
@@ -1090,6 +1103,7 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 	set_bit(BTMTKSDIO_HW_TX_READY, &bdev->tx_state);
 
 	switch (bdev->data->chipid) {
+	case 0x7902:
 	case 0x7921:
 		if (test_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state)) {
 			err = btmtksdio_mtk_reg_read(hdev, MT7921_DLSTATUS,
@@ -1167,22 +1181,24 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 	delta = ktime_sub(rettime, calltime);
 	duration = (unsigned long long)ktime_to_ns(delta) >> 10;
 
-	pm_runtime_set_autosuspend_delay(bdev->dev,
-					 MTKBTSDIO_AUTOSUSPEND_DELAY);
-	pm_runtime_use_autosuspend(bdev->dev);
+	if (bdev->data->pm_runtime_supported) {
+		pm_runtime_set_autosuspend_delay(bdev->dev,
+						 MTKBTSDIO_AUTOSUSPEND_DELAY);
+		pm_runtime_use_autosuspend(bdev->dev);
 
-	err = pm_runtime_set_active(bdev->dev);
-	if (err < 0)
-		return err;
+		err = pm_runtime_set_active(bdev->dev);
+		if (err < 0)
+			return err;
 
-	/* Default forbid runtime auto suspend, that can be allowed by
-	 * enable_autosuspend flag or the PM runtime entry under sysfs.
-	 */
-	pm_runtime_forbid(bdev->dev);
-	pm_runtime_enable(bdev->dev);
+		/* Default forbid runtime auto suspend, that can be allowed by
+		 * enable_autosuspend flag or the PM runtime entry under sysfs.
+		 */
+		pm_runtime_forbid(bdev->dev);
+		pm_runtime_enable(bdev->dev);
 
-	if (enable_autosuspend)
-		pm_runtime_allow(bdev->dev);
+		if (enable_autosuspend)
+			pm_runtime_allow(bdev->dev);
+	}
 
 	bt_dev_info(hdev, "Device setup in %llu usecs", duration);
 
-- 
2.43.0


