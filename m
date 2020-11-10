Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C74C388F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 03:39:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD522206E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 03:39:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mNxhOCTb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD522206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t4XK5HqAY/mFHeMyK8Av3uHohSxMhMJjQf0/REkhOGU=; b=mNxhOCTbvOEVq8cFyM9apW+RaM
	m5DrtUuj1xV6SCc/1fliJM7Gev0EZ0w47T6LmiEjeyQIaeKyu/kHdlvw5Il1y1LextU5E9rF8zDEA
	zUjdyy7DvCkPGEyoOonhxfjT5uf8IeelvaRLJe71cs5a94JIWFWwa6KYVVAl9rrLJw+nEvAIIyQP7
	4LNY4wVdTzyke6iXTJwpq1U7U3PZ2m60asMW1x2GVNckxjgGVizNsTp5GwH44Jp0OrtN86HraIOVT
	n7eu9mqDRqif89PMyYX3f/j9/qAJRkalTGDindO0dfBEuQUhPGGfM+d/II/zWhw47lSfPV8ncwRQp
	xE5qAuAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcKUu-0000L6-Jt; Tue, 10 Nov 2020 03:39:08 +0000
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcKUo-0000Hv-0B; Tue, 10 Nov 2020 03:39:03 +0000
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0AA3cgXV3008619,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb03.realtek.com.tw[172.21.6.96])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0AA3cgXV3008619
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 10 Nov 2020 11:38:42 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.34) by
 RTEXMB03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Tue, 10 Nov 2020 11:38:42 +0800
Received: from localhost.localdomain (172.21.132.186) by
 RTEXMBS03.realtek.com.tw (172.21.6.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 10 Nov 2020 11:38:42 +0800
From: <max.chou@realtek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <matthias.bgg@gmail.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <alex_lu@realsil.com.cn>,
 <hildawu@realtek.com>, <kidman@realtek.com>
Subject: [PATCH] Bluetooth: btusb: btrtl: Add support for RTL8852A
Date: Tue, 10 Nov 2020 11:38:37 +0800
Message-ID: <20201110033837.19373-1-max.chou@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.21.132.186]
X-ClientProxiedBy: RTEXMB03.realtek.com.tw (172.21.6.96) To
 RTEXMBS03.realtek.com.tw (172.21.6.34)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_223902_247677_F011E985 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: max.chou@realtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Max Chou <max.chou@realtek.com>

Add the support for RTL8852A BT controller on USB interface.
The necessary firmware will be submitted to linux-firmware project.

The device info from /sys/kernel/debug/usb/devices as below.

T:  Bus=02 Lev=02 Prnt=02 Port=05 Cnt=01 Dev#= 10 Spd=12   MxCh= 0
D:  Ver= 1.00 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=0bda ProdID=c852 Rev= 0.00
S:  Manufacturer=Realtek
S:  Product=Bluetooth Radio
S:  SerialNumber=00e04c000001
C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=500mA
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms

Signed-off-by: Max Chou <max.chou@realtek.com>
---
 drivers/bluetooth/btrtl.c | 12 ++++++++++++
 drivers/bluetooth/btusb.c |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 0ac0f8874ef7..e47736a12f77 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -23,6 +23,7 @@
 #define RTL_ROM_LMP_8821A	0x8821
 #define RTL_ROM_LMP_8761A	0x8761
 #define RTL_ROM_LMP_8822B	0x8822
+#define RTL_ROM_LMP_8852A	0x8852
 #define RTL_CONFIG_MAGIC	0x8723ab55
 
 #define IC_MATCH_FL_LMPSUBV	(1 << 0)
@@ -143,6 +144,13 @@ static const struct id_table ic_id_table[] = {
 	  .has_rom_version = true,
 	  .fw_name  = "rtl_bt/rtl8822b_fw.bin",
 	  .cfg_name = "rtl_bt/rtl8822b_config" },
+
+	/* 8852A */
+	{ IC_INFO(RTL_ROM_LMP_8852A, 0xa, 0xb, HCI_USB),
+	  .config_needed = false,
+	  .has_rom_version = true,
+	  .fw_name  = "rtl_bt/rtl8852au_fw.bin",
+	  .cfg_name = "rtl_bt/rtl8852au_config" },
 	};
 
 static const struct id_table *btrtl_match_ic(u16 lmp_subver, u16 hci_rev,
@@ -250,6 +258,7 @@ static int rtlbt_parse_firmware(struct hci_dev *hdev,
 		{ RTL_ROM_LMP_8821A, 10 },	/* 8821C */
 		{ RTL_ROM_LMP_8822B, 13 },	/* 8822C */
 		{ RTL_ROM_LMP_8761A, 14 },	/* 8761B */
+		{ RTL_ROM_LMP_8852A, 18 },	/* 8852A */
 	};
 
 	min_size = sizeof(struct rtl_epatch_header) + sizeof(extension_sig) + 3;
@@ -679,6 +688,7 @@ int btrtl_download_firmware(struct hci_dev *hdev,
 	case RTL_ROM_LMP_8821A:
 	case RTL_ROM_LMP_8761A:
 	case RTL_ROM_LMP_8822B:
+	case RTL_ROM_LMP_8852A:
 		return btrtl_setup_rtl8723b(hdev, btrtl_dev);
 	default:
 		rtl_dev_info(hdev, "assuming no firmware upload needed");
@@ -854,3 +864,5 @@ MODULE_FIRMWARE("rtl_bt/rtl8821a_fw.bin");
 MODULE_FIRMWARE("rtl_bt/rtl8821a_config.bin");
 MODULE_FIRMWARE("rtl_bt/rtl8822b_fw.bin");
 MODULE_FIRMWARE("rtl_bt/rtl8822b_config.bin");
+MODULE_FIRMWARE("rtl_bt/rtl8852au_fw.bin");
+MODULE_FIRMWARE("rtl_bt/rtl8852au_config.bin");
diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 4a1f877616d6..1ff9e2840b89 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -386,6 +386,10 @@ static const struct usb_device_id blacklist_table[] = {
 	{ USB_DEVICE(0x0bda, 0xb00c), .driver_info = BTUSB_REALTEK |
 						     BTUSB_WIDEBAND_SPEECH },
 
+	/* Realtek 8852AE Bluetooth devices */
+	{ USB_DEVICE(0x0bda, 0xc852), .driver_info = BTUSB_REALTEK |
+						     BTUSB_WIDEBAND_SPEECH },
+
 	/* Realtek Bluetooth devices */
 	{ USB_VENDOR_AND_INTERFACE_INFO(0x0bda, 0xe0, 0x01, 0x01),
 	  .driver_info = BTUSB_REALTEK },
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
