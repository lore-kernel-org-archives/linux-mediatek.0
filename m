Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35296C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 02:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9875D61075
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 02:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9875D61075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g/6N8Ej9YgCgu3ER+OaL3J4ka6A+JA/DxptfgzkWTSg=; b=IL86ex7+38gHj3
	1zsuVLKzAQbtBqn9Os9Pu5RSAaxH7QYtWhfkq/ve+ZkrhIGuJduidHKIVTMVtu9vjBfbxyyTGgDnd
	kchrIv3IO00OAtubjs+vNdJGmt/nsxNr2gDEiMwfB88zrhYYC5ciBIINgOlmSYgbW+mJO2HwA5VYW
	KNFjEfdh53UqMbSHMmDoVeGuWpGHo2UrMJCACwji3uGve07QZrcu8xxC5aof84Wd5gVPvYlyjhdY/
	3uIX22W6oD59XubrKTo4C9+FlFUdW87rr32UNOL6OGU+bJVrZS538SFFqmoMljCUro6843yPa3opr
	oKYdN5b4h73daV7SJoMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDH61-002FNu-3G; Tue, 10 Aug 2021 02:02:25 +0000
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mDH5n-002FMU-6c; Tue, 10 Aug 2021 02:02:13 +0000
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 17A21qE52028562,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 17A21qE52028562
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Aug 2021 10:01:52 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 10 Aug 2021 10:01:52 +0800
Received: from localhost (172.21.132.185) by RTEXMBS03.realtek.com.tw
 (172.21.6.96) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 10 Aug
 2021 10:01:51 +0800
From: <max.chou@realtek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <luiz.dentz@gmail.com>, 
 <matthias.bgg@gmail.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: <alex_lu@realsil.com.cn>, <hildawu@realtek.com>, <kidman@realtek.com>,
 <apusaka@chromium.org>, <abhishekpandit@chromium.org>,
 <josephsih@chromium.org>, <max.chou@realtek.com>
Subject: [PATCH v2] Bluetooth: btusb: Remove WAKEUP_DISABLE and add
 WAKEUP_AUTOSUSPEND for Realtek devices
Date: Tue, 10 Aug 2021 10:01:47 +0800
Message-ID: <20210810020147.14276-1-max.chou@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.21.132.185]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS03.realtek.com.tw (172.21.6.96)
X-KSE-ServerInfo: RTEXMBS03.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/10/2021 01:36:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzgvOSCkVaTIIDEwOjE4OjAw?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 08/10/2021 01:47:48
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 165484 [Aug 10 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: max.chou@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 454 454 39c6e442fd417993330528e7f9d13ac1bf7fdf8c
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 realtek.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/10/2021 01:51:00
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_190211_427060_C44F8765 
X-CRM114-Status: GOOD (  16.45  )
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

From: Max Chou <max.chou@realtek.com>

For the commit of 9e45524a011107a73bc2cdde8370c61e82e93a4d, wakeup is
always disabled for Realtek devices. However, there's the capability
for Realtek devices to apply USB wake-up.

In this commit, remove WAKEUP_DISABLE feature for Realtek devices.
If users would switch wake-up, they should access
"/sys/bus/usb/.../power/wakeup"

In this commit, it also adds the feature as WAKEUP_AUTOSUSPEND
for Realtek devices because it should set do_remote_wakeup on autosuspend.

Signed-off-by: Max Chou <max.chou@realtek.com>
Tested-by: Hilda Wu <hildawu@realtek.com>
Reviewed-by: Archie Pusaka <apusaka@chromium.org>
Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
Changes in v2:
-fix the compiling error due to the incorrect patch file submited
---
 drivers/bluetooth/btusb.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 1876a960b3dc..92919f379331 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -537,7 +537,7 @@ static const struct dmi_system_id btusb_needs_reset_resume_table[] = {
 #define BTUSB_OOB_WAKE_ENABLED	11
 #define BTUSB_HW_RESET_ACTIVE	12
 #define BTUSB_TX_WAIT_VND_EVT	13
-#define BTUSB_WAKEUP_DISABLE	14
+#define BTUSB_WAKEUP_AUTOSUSPEND	14
 
 struct btusb_data {
 	struct hci_dev       *hdev;
@@ -1358,13 +1358,6 @@ static int btusb_open(struct hci_dev *hdev)
 
 	data->intf->needs_remote_wakeup = 1;
 
-	/* Disable device remote wakeup when host is suspended
-	 * For Realtek chips, global suspend without
-	 * SET_FEATURE (DEVICE_REMOTE_WAKEUP) can save more power in device.
-	 */
-	if (test_bit(BTUSB_WAKEUP_DISABLE, &data->flags))
-		device_wakeup_disable(&data->udev->dev);
-
 	if (test_and_set_bit(BTUSB_INTR_RUNNING, &data->flags))
 		goto done;
 
@@ -1431,7 +1424,7 @@ static int btusb_close(struct hci_dev *hdev)
 	data->intf->needs_remote_wakeup = 0;
 
 	/* Enable remote wake up for auto-suspend */
-	if (test_bit(BTUSB_WAKEUP_DISABLE, &data->flags))
+	if (test_bit(BTUSB_WAKEUP_AUTOSUSPEND, &data->flags))
 		data->intf->needs_remote_wakeup = 1;
 
 	usb_autopm_put_interface(data->intf);
@@ -4452,9 +4445,6 @@ static bool btusb_prevent_wake(struct hci_dev *hdev)
 {
 	struct btusb_data *data = hci_get_drvdata(hdev);
 
-	if (test_bit(BTUSB_WAKEUP_DISABLE, &data->flags))
-		return true;
-
 	return !device_may_wakeup(&data->udev->dev);
 }
 
@@ -4752,11 +4742,8 @@ static int btusb_probe(struct usb_interface *intf,
 		hdev->shutdown = btrtl_shutdown_realtek;
 		hdev->cmd_timeout = btusb_rtl_cmd_timeout;
 
-		/* Realtek devices lose their updated firmware over global
-		 * suspend that means host doesn't send SET_FEATURE
-		 * (DEVICE_REMOTE_WAKEUP)
-		 */
-		set_bit(BTUSB_WAKEUP_DISABLE, &data->flags);
+		/* Realtek devices need to set remote wakeup on auto-suspend */
+		set_bit(BTUSB_WAKEUP_AUTOSUSPEND, &data->flags);
 	}
 
 	if (!reset)
@@ -4931,12 +4918,15 @@ static int btusb_suspend(struct usb_interface *intf, pm_message_t message)
 	 * Actually, it depends on whether the usb host sends
 	 * set feature (enable wakeup) or not.
 	 */
-	if (test_bit(BTUSB_WAKEUP_DISABLE, &data->flags)) {
+	if (test_bit(BTUSB_WAKEUP_AUTOSUSPEND, &data->flags)) {
 		if (PMSG_IS_AUTO(message) &&
 		    device_can_wakeup(&data->udev->dev))
 			data->udev->do_remote_wakeup = 1;
-		else if (!PMSG_IS_AUTO(message))
+		else if (!PMSG_IS_AUTO(message) &&
+			 !device_may_wakeup(&data->udev->dev)) {
+			data->udev->do_remote_wakeup = 0;
 			data->udev->reset_resume = 1;
+		}
 	}
 
 	return 0;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
