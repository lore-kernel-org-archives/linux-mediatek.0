Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBD8C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:04:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9518423130
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:04:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G9M7v68d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="clCCTsKa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9518423130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XYRRlJi5zdZqvaJTkP7BAUMQA4sD6fInNwqiylSKdkQ=; b=G9M7v68dcXhSCoAbNPIB63PYnb
	YI/y80C97R62w8PSs7fV+aVA0xHAjkD/qvzMPVoxbYiJ/ZTyW5pXvIsUyi5V8zwInFEhU80EHgQde
	SoA7t3jlVgpD4l68EluGXT25RNG3tneHK5YUi3hHdnQ9VLJlIKKFvHiz1TCmndU9d3ODCTuo9Lx/R
	S6ytgviQg8wREnCrCktRkMFJeO9X0I49J5a9LrkopTLEb2QtEy7zOzI84IOpZLt+ghxfXt/j37Tid
	DOTS4vkyF/ZJRD6JtC07QYpaRT2Hp+gWIuu2lgZqnklPOYaJ5V92TtAvZVAaZRgZ9usN0k3YmgXyC
	FxLv4/8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpmu4-00031B-Vn; Mon, 29 Jun 2020 06:04:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpmu0-000300-WA; Mon, 29 Jun 2020 06:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=TaK3wdOPjxXoHAHmoiT5SXqiJsX89YDim1QtX3nCJ5w=; b=clCCTsKaOWqtz+5Jx8pYgLvPLg
 McrEAAiWtcszDqqM+t+7O7vshEQlVFSpgpqHhQcevrekR2fo8RKAGIohWaTJNaxRMUbaWournindu
 dje2r4AtOpdZ+UCNN1UwMAUDtSZ+yPbmfzAdtxrLxVCgNaMNshN63Y9fg6AYzGblTLjaKCbIXGbRP
 ZZSULLA4bmd8Sqbu+AuzozQDWi437myA6lNxF9r1PS5Hfv4MLuw/pTaANAM28+Iyv6l8TDK+SvG2F
 ze6T+jw57TRRgaC+v1sIgLmU5b5btzxKQpPejdAqxWcZGWzdtGpeZsZIaEgDiVLUUmDygrSXxMTMM
 DQAnfh4Q==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpmtv-0002Dn-Sd; Mon, 29 Jun 2020 06:04:23 +0000
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 05T63kQL2014575,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 05T63kQL2014575
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 29 Jun 2020 14:03:46 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 29 Jun 2020 14:03:46 +0800
Received: from localhost.localdomain (172.21.87.237) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 29 Jun 2020 14:03:46 +0800
From: <hildawu@realtek.com>
To: <marcel@holtmann.org>
Subject: [PATCH] Bluetooth: btusb: WBS support USB alternate setting 1
Date: Mon, 29 Jun 2020 14:03:38 +0800
Message-ID: <20200629060338.10705-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.21.87.237]
X-ClientProxiedBy: RTEXMB02.realtek.com.tw (172.21.6.95) To
 RTEXMB04.realtek.com.tw (172.21.6.97)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200629_070420_631591_974278FE 
X-CRM114-Status: GOOD (  13.44  )
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

For WBS support, btusb driver could be set to alternate setting 1.

Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
 drivers/bluetooth/btusb.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index c7cc8e594166..7942f9314fd7 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -453,6 +453,7 @@ static const struct dmi_system_id btusb_needs_reset_resume_table[] = {
 #define BTUSB_HW_RESET_ACTIVE	12
 #define BTUSB_TX_WAIT_VND_EVT	13
 #define BTUSB_WAKEUP_DISABLE	14
+#define BTUSB_WBS_ALT1		15
 
 struct btusb_data {
 	struct hci_dev       *hdev;
@@ -1666,14 +1667,18 @@ static void btusb_work(struct work_struct *work)
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
+			} else if (test_bit(BTUSB_WBS_ALT1, &data->flags)) {
+				if (btusb_find_altsetting(data, 1))
+					new_alts = 1;
+				else
+					bt_dev_err(hdev, "Device does not support ALT setting 1");
+			} else {
 				bt_dev_err(hdev, "Device does not support ALT setting 6");
+			}
 		}
 
 		if (btusb_switch_alt_setting(hdev, new_alts) < 0)
@@ -3965,6 +3970,7 @@ static int btusb_probe(struct usb_interface *intf,
 		 * (DEVICE_REMOTE_WAKEUP)
 		 */
 		set_bit(BTUSB_WAKEUP_DISABLE, &data->flags);
+		set_bit(BTUSB_WBS_ALT1, &data->flags);
 
 		err = usb_autopm_get_interface(intf);
 		if (err < 0)
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
