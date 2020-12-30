Return-Path: <SRS0=HztP=GC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB46C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Dec 2020 06:55:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAFB12071E
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Dec 2020 06:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAFB12071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I/X0A93vTB925My25C50qDEkIGyoLWnB1Tsfnh51lYM=; b=IqHVj5eOw5y8HG/6E8cyZak+qN
	zVpahRCriRPXnIydQrnliihbXfhDD1Oy3prZ8eYp+cudNCczOOv5BA5CofRQcmyOZBP5cKu0sBv8E
	vwjxfpqYzUHeLxbWPaUgMB/e0zPz4wQ/YalaTtB3Q0tb8Yh/5+p7+BGKdXaitkzzoJWXdTswI049C
	I5HYM3tuQiL/XkAKIsXhuwJkKxuBymGpYJJwp816bBcWGsW7zysg2sEluSqBgc3GqB5bgCnakedDM
	kfG5rWAgCORVuV2PuRilx7ZRJVeUnnCsR02E0LagQ8ORS0oJWF5r2otemWP39GIL5tM3ff7ViFGJ9
	PmBSlROw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuVOM-0003HO-Ah; Wed, 30 Dec 2020 06:55:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuVOJ-0003H6-Ma; Wed, 30 Dec 2020 06:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=2aWFQ/gO1IGeyB53i3gyqh4gczsHAGQyjp8/ZvGBz2s=; b=lU7DkCCVIoZ73k0OoqK0tAxviy
 LRk0B+tM+xJapKjEl5ezfdGAToU9hZrsq7FC6nS5VgDkMjayR03Bv6jKxznf17dU4kBkqV+t+QUqh
 MPCguX/YAzqxgbvNrYIN2ehxkGHYiQkN60+e4DPEAzKIjzTZTyNwvDX6ivRaE3UyctP15cahHVyMi
 gBvFU1RqyK56SLL/+xNH0ofvLt6aYDbsc2/GW2Jpjn3fIUS0TCBKCqgAL9htl032xlzALZW72RnZa
 XGOLDdMqzJdVkV+F0DBD9F9vFR2Oan4FUza5uRNswsYCt8yrBEzhZyhfn//AKYIA8aYAy1Lzp0ULd
 b7UGzBLA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1kuVOG-000ts2-NL; Wed, 30 Dec 2020 06:55:25 +0000
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0BU6sjcE7019892,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs03.realtek.com.tw[172.21.6.96])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0BU6sjcE7019892
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 30 Dec 2020 14:54:45 +0800
Received: from localhost.localdomain (172.21.132.186) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 30 Dec 2020 14:54:45 +0800
From: <max.chou@realtek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <luiz.dentz@gmail.com>, 
 <matthias.bgg@gmail.com>
Subject: [PATCH] Bluetooth: btusb: Add a Kconfig option to disable USB wakeup
 by default
Date: Wed, 30 Dec 2020 14:54:41 +0800
Message-ID: <20201230065441.1179-1-max.chou@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.21.132.186]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS03.realtek.com.tw (172.21.6.96)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_065525_768164_E2240C76 
X-CRM114-Status: GOOD (  18.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: max.chou@realtek.com, kidman@realtek.com, hildawu@realtek.com,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 alex_lu@realsil.com.cn, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Max Chou <max.chou@realtek.com>

For the original commit of 9e45524a011107a73bc2cdde8370c61e82e93a4d,
wakeup is always disabled for Realtek Bluetooth devices.
However, there's the capability for Realtek Bluetooth devices to
apply USB wakeup. Otherwise, there's the better power consumption
without USB wakeup during suspending.
In this commit, divide the original commit into two parts.
1. Redefine the feature that Realtek devices should be enabled wakeup on
auto-suspend as BTUSB_WAKEUP_AUTOSUSPEND.
2. Add a Kconfig option to switch disable_wakeup for Bluetooth
USB devices by default as CONFIG_BT_HCIBTUSB_DISABLEWAKEUP.

Signed-off-by: Max Chou <max.chou@realtek.com>
---
 drivers/bluetooth/Kconfig | 11 +++++++++++
 drivers/bluetooth/btusb.c | 41 ++++++++++++++++++++++++++-------------
 2 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 4e73a531b377..7af10897a248 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -41,6 +41,17 @@ config BT_HCIBTUSB_AUTOSUSPEND
 	  This can be overridden by passing btusb.enable_autosuspend=[y|n]
 	  on the kernel commandline.
 
+config BT_HCIBTUSB_DISABLEWAKEUP
+	bool "Disable USB wakeup for Bluetooth USB devices by default"
+	depends on BT_HCIBTUSB
+	default n
+	help
+	  Say Y here to disable USB wakeup for Bluetooth USB devices by
+	  default.
+
+	  This can be overridden by passing btusb.disable_wakeup=[y|n]
+	  on the kernel commandline.
+
 config BT_HCIBTUSB_BCM
 	bool "Broadcom protocol support"
 	depends on BT_HCIBTUSB
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b630a1d54c02..5f55111849b5 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -30,6 +30,7 @@
 static bool disable_scofix;
 static bool force_scofix;
 static bool enable_autosuspend = IS_ENABLED(CONFIG_BT_HCIBTUSB_AUTOSUSPEND);
+static bool disable_wakeup = IS_ENABLED(CONFIG_BT_HCIBTUSB_DISABLEWAKEUP);
 
 static bool reset = true;
 
@@ -505,7 +506,7 @@ static const struct dmi_system_id btusb_needs_reset_resume_table[] = {
 #define BTUSB_OOB_WAKE_ENABLED	11
 #define BTUSB_HW_RESET_ACTIVE	12
 #define BTUSB_TX_WAIT_VND_EVT	13
-#define BTUSB_WAKEUP_DISABLE	14
+#define BTUSB_WAKEUP_AUTOSUSPEND	14
 
 struct btusb_data {
 	struct hci_dev       *hdev;
@@ -1330,7 +1331,7 @@ static int btusb_open(struct hci_dev *hdev)
 	 * For Realtek chips, global suspend without
 	 * SET_FEATURE (DEVICE_REMOTE_WAKEUP) can save more power in device.
 	 */
-	if (test_bit(BTUSB_WAKEUP_DISABLE, &data->flags))
+	if (disable_wakeup)
 		device_wakeup_disable(&data->udev->dev);
 
 	if (test_and_set_bit(BTUSB_INTR_RUNNING, &data->flags))
@@ -1399,7 +1400,7 @@ static int btusb_close(struct hci_dev *hdev)
 	data->intf->needs_remote_wakeup = 0;
 
 	/* Enable remote wake up for auto-suspend */
-	if (test_bit(BTUSB_WAKEUP_DISABLE, &data->flags))
+	if (test_bit(BTUSB_WAKEUP_AUTOSUSPEND, &data->flags))
 		data->intf->needs_remote_wakeup = 1;
 
 	usb_autopm_put_interface(data->intf);
@@ -4257,7 +4258,7 @@ static bool btusb_prevent_wake(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 
-	if (test_bit(BTUSB_WAKEUP_DISABLE, &data->flags))
+	if (disable_wakeup)
 		return true;
 
 	return !device_may_wakeup(&data->udev->dev);
@@ -4557,11 +4558,8 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->shutdown = btrtl_shutdown_realtek;
 		hdev->cmd_timeout = btusb_rtl_cmd_timeout;
 
-		/* Realtek devices lose their updated firmware over global
-		 * suspend that means host doesn't send SET_FEATURE
-		 * (DEVICE_REMOTE_WAKEUP)
-		 */
-		set_bit(BTUSB_WAKEUP_DISABLE, &data->flags);
+		/* Realtek devices need to set USB remote wakeup on auto-suspend */
+		set_bit(BTUSB_WAKEUP_AUTOSUSPEND, &data->flags);
 	}
 
 	if (!reset)
@@ -4731,17 +4729,29 @@ static int btusb_suspend(struct usb_interface *intf, pm_message_t message)
 		enable_irq(data->oob_wake_irq);
 	}
 
-	/* For global suspend, Realtek devices lose the loaded fw
-	 * in them. But for autosuspend, firmware should remain.
+	/* For suspend(S3), Realtek devices lose the loaded fw
+	 * if USB wakeup is disabled.
+	 * It can meet better power consumption.
+	 * Otherwise, the fw is alive if USB wakeup is enabled.
+	 * It's able to wake Host up by the paired devices.
+	 * Note that disable_wakeup should be false,
+	 * and device_may_wakeup() should return true.
+	 *
+	 * For autosuspend, firmware should remain.
 	 * Actually, it depends on whether the usb host sends
 	 * set feature (enable wakeup) or not.
 	 */
-	if (test_bit(BTUSB_WAKEUP_DISABLE, &data->flags)) {
+	if (test_bit(BTUSB_WAKEUP_AUTOSUSPEND, &data->flags)) {
 		if (PMSG_IS_AUTO(message) &&
 		    device_can_wakeup(&data->udev->dev))
 			data->udev->do_remote_wakeup = 1;
-		else if (!PMSG_IS_AUTO(message))
-			data->udev->reset_resume = 1;
+		else if (!PMSG_IS_AUTO(message)) {
+			if (disable_wakeup ||
+			    !device_may_wakeup(&data->udev->dev)) {
+				data->udev->do_remote_wakeup = 0;
+				data->udev->reset_resume = 1;
+			}
+		}
 	}
 
 	return 0;
@@ -4865,6 +4875,9 @@ MODULE_PARM_DESC(force_scofix, "Force fixup of wrong SCO buffers size");
 module_param(enable_autosuspend, bool, 0644);
 MODULE_PARM_DESC(enable_autosuspend, "Enable USB autosuspend by default");
 
+module_param(disable_wakeup, bool, 0644);
+MODULE_PARM_DESC(disable_wakeup, "Disable USB wakeup by default");
+
 module_param(reset, bool, 0644);
 MODULE_PARM_DESC(reset, "Send HCI reset command on initialization");
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
