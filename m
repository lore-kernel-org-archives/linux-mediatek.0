Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6B0C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 13:11:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0A30206BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 13:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QGvshOAi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ePF+8Cr+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0A30206BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w1EiDbB0/U3Chu31naSH9UotCEr54oJ0Pmt39mtvrAM=; b=QGvshOAiUsWuMQCOF+295o+5Cf
	q9Xj6ZSOiOEFWkkfKCPHdwkeVXKsBZO3CfhCtBajdLfVJLplNswps67uMvPRTxcHyQlOWUShzqGy0
	5pVenE/0hQGHGkPnC256ddHSenk5wl/RnxMOd6+2Re4qAy0bndSGLGPh1bpw5XUDB53gFvLPDSQ4w
	7a9iGjZWn1zmDpl+FJquSJYLHX4qfEnabjdEFJhuDC9ZYmOWtydckBk9RfeX1SpNZIeqvp6xisXam
	qUwHHGF9TdH8wSHZ91x16viimOZwU243HnSBBfWgoZjhaCyXPccma2G105jSyLxj0VHhM4ueZnGl8
	/Ymt1//Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqG2T-0001dN-IZ; Tue, 30 Jun 2020 13:11:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqG2Q-0001d2-4o; Tue, 30 Jun 2020 13:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=jTBibtHkltaqNAWlHzgNxM8/MHLn4koGJ0YxXX+vzVk=; b=ePF+8Cr+Gmssno4tl+JGeYWCGW
 A7oImyFekRXy7BrDvUH2bn/Bw+dwD5RDhiXsDu93fQBF0ObPOLGsSydikjkLkSQwzSPbpEuhD4kjz
 hlApJlqwyPVpVPU/dKC1A6HTcM2NG1XofLoLp/l4KvbU+7gRsjCVJWEYcXmjvOalfvfNpD3EDF90Q
 V3invqTXMhUAzR4I6vt89LV9tFZNmdX2KPBVYCgYW9Ox8RUk/+yT1K3nhMx5+H5Utk3Z39hKI9Y3A
 RNcOjDkGG9N84xY5R5z2G7KF8TTt9ny96IHmLz8nfRkk4JXc+Vz32fOhCojHmjCxoI3txGx0msHxJ
 vLOm+MgA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqG1s-0006QV-Q9; Tue, 30 Jun 2020 13:10:59 +0000
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 05UD9m3N2022713,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 05UD9m3N2022713
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 30 Jun 2020 21:09:48 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 30 Jun 2020 21:09:48 +0800
Received: from localhost.localdomain (172.21.87.237) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 30 Jun 2020 21:09:47 +0800
From: <hildawu@realtek.com>
To: <marcel@holtmann.org>
Subject: [PATCH v2] Bluetooth: btusb: USB alternate setting 1 for WBS
Date: Tue, 30 Jun 2020 21:09:40 +0800
Message-ID: <20200630130940.14339-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.21.87.237]
X-ClientProxiedBy: RTEXMB03.realtek.com.tw (172.21.6.96) To
 RTEXMB04.realtek.com.tw (172.21.6.97)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_141031_824954_CF211B46 
X-CRM114-Status: GOOD (  15.74  )
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
Cc: max.chou@realtek.com, johan.hedberg@gmail.com, kidman@realtek.com,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 alex_lu@realsil.com.cn, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Hilda Wu <hildawu@realtek.com>

RTL8822CE supports transparent WBS to apply USB alternate setting 1.
Add a flag to the device match data to apply alternate setting 1 which
meet the transfer speed for WBS support.

Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
Changes in v2:
- More descriptive commit log and short description.
- Use BTUSB_USE_ALT1_FOR_WBS replace BTUSB_WBS_ALT1 for descriptive name.
- Move alternate setting 1 check into the btusb_probe() function and adjust position of data->isoc for alternate setting check.
---
---
 drivers/bluetooth/btusb.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index c7cc8e594166..e4a12c58501e 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -453,6 +453,7 @@ static const struct dmi_system_id btusb_needs_reset_resume_table[] = {
 #define BTUSB_HW_RESET_ACTIVE	12
 #define BTUSB_TX_WAIT_VND_EVT	13
 #define BTUSB_WAKEUP_DISABLE	14
+#define BTUSB_USE_ALT1_FOR_WBS	15
 
 struct btusb_data {
 	struct hci_dev       *hdev;
@@ -1666,14 +1667,15 @@ static void btusb_work(struct work_struct *work)
 				new_alts = data->sco_num;
 			}
 		} else if (data->air_mode == HCI_NOTIFY_ENABLE_SCO_TRANSP) {
-
-			data->usb_alt6_packet_flow = true;
-
 			/* Check if Alt 6 is supported for Transparent audio */
-			if (btusb_find_altsetting(data, 6))
+			if (btusb_find_altsetting(data, 6)) {
+				data->usb_alt6_packet_flow = true;
 				new_alts = 6;
-			else
+			} else if (test_bit(BTUSB_USE_ALT1_FOR_WBS, &data->flags)) {
+				new_alts = 1;
+			} else {
 				bt_dev_err(hdev, "Device does not support ALT setting 6");
+			}
 		}
 
 		if (btusb_switch_alt_setting(hdev, new_alts) < 0)
@@ -3954,6 +3956,15 @@ static int btusb_probe(struct usb_interface *intf,
 		btusb_check_needs_reset_resume(intf);
 	}
 
+	if (id->driver_info & BTUSB_AMP) {
+		/* AMP controllers do not support SCO packets */
+		data->isoc = NULL;
+	} else {
+		/* Interface orders are hardcoded in the specification */
+		data->isoc = usb_ifnum_to_if(data->udev, ifnum_base + 1);
+		data->isoc_ifnum = ifnum_base + 1;
+	}
+
 	if (IS_ENABLED(CONFIG_BT_HCIBTUSB_RTL) &&
 	    (id->driver_info & BTUSB_REALTEK)) {
 		hdev->setup = btrtl_setup_realtek;
@@ -3965,21 +3976,16 @@ static int btusb_probe(struct usb_interface *intf,
 		 * (DEVICE_REMOTE_WAKEUP)
 		 */
 		set_bit(BTUSB_WAKEUP_DISABLE, &data->flags);
+		if (btusb_find_altsetting(data, 1))
+			set_bit(BTUSB_USE_ALT1_FOR_WBS, &data->flags);
+		else
+			bt_dev_err(hdev, "Device does not support ALT setting 1");
 
 		err = usb_autopm_get_interface(intf);
 		if (err < 0)
 			goto out_free_dev;
 	}
 
-	if (id->driver_info & BTUSB_AMP) {
-		/* AMP controllers do not support SCO packets */
-		data->isoc = NULL;
-	} else {
-		/* Interface orders are hardcoded in the specification */
-		data->isoc = usb_ifnum_to_if(data->udev, ifnum_base + 1);
-		data->isoc_ifnum = ifnum_base + 1;
-	}
-
 	if (!reset)
 		set_bit(HCI_QUIRK_RESET_ON_CLOSE, &hdev->quirks);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
