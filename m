Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3E7C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 10:35:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3706464E2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 10:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3706464E2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=onGwOCUYR+fnkJLyCQLumP+3lX7OVs9YbW89bCHgdik=; b=qcumwH1Mgt1JAtY/DXZ7MgC2a
	eztlMg6g/g9uej7FUc+Qf/IlGg8coj6AWMwPf+ZkjOLh7juq4TIwJlikPrZoS3a0u3KmpTDUEGfcV
	Xnbmi4ppaVb/p4NDNDfnygS6DfCF+AzjG3kI2Ywnrh4Ju3I1k0vYRKJzDn8LJbD3Uhq9xKrlPSXLZ
	I4MYOjWV0xtHRf2EXq5Qo7afyH15njebgI5NpF2TQJHIPWda+l6PC25BcRJ2u9GPXzmkarHKzSXVy
	7w0MoiMkxEH+Qe45tc22P2Xw3hPpetnlk53e9uyYZI3k43LaoIHwIpjqNH9wjECfaSCkhnoTXganw
	4k0EAWHxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6t1T-0007yq-40; Tue, 02 Feb 2021 10:35:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6t1Q-0007xD-99
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 10:35:01 +0000
X-UUID: b8c2cc0169744475aad52ae2c70514a7-20210202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JbX74GwTp1yL/JhcJwwFo1yXWae9fF7/Bl6UJAUoUvE=; 
 b=KaVkpFE3H6ISb1N0qJu4UYlOAapl321+BR1HijR4Naxb7fccJC7hYDCVVW6EOwj6tITW3DvUna3javBfThTYyYhCinVOPhVAbQp1rsxOYXGDHKnb0Tzn1mE7aUaEGaE5sHc/e7+uaWL0bfKV84NkR5cWuP02GtuU6y8+g1Tcoy0=;
X-UUID: b8c2cc0169744475aad52ae2c70514a7-20210202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 694374973; Tue, 02 Feb 2021 02:26:39 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 02:26:25 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Feb 2021 18:26:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 2 Feb 2021 18:26:23 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>, <Sean.Wang@mediatek.com>
Subject: [PATCH v4 2/2] Bluetooth: btusb: Add protocol support for MediaTek
 MT7921U USB devices
Date: Tue, 2 Feb 2021 18:26:18 +0800
Message-ID: <20210202102618.27640-3-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210202102618.27640-1-mark-yw.chen@mediatek.com>
References: <20210202102618.27640-1-mark-yw.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8ACB497F9FA42BBBD4D7F390CAA9E83E9CE74DB40D7B1457D53ACF38D8A0FF6D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_053500_541844_6724C100 
X-CRM114-Status: GOOD (  19.09  )
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
Cc: robin.chiu@mediatek.com, Mark
 Chen <Mark-YW.Chen@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Eric.liang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "mark-yw.chen" <mark-yw.chen@mediatek.com>

There is mt7921 firmware download mechanism

1. Read Chip id from MT7921.

2. Download firmware by endpoint 0, it's the same mechanism with
mt7663/mt7668.
   (it's medaitek specific header format for downloading firmware.)

3. Enabling Bluetooth function.

The information in /sys/kernel/debug/usb/devices about the MT7921U
Bluetooth device is listed as the below.

  T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 40 Spd=480  MxCh= 0
  D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
  P:  Vendor=0e8d ProdID=7961 Rev= 1.00
  S:  Manufacturer=MediaTek Inc.
  S:  Product=Wireless_Device
  S:  SerialNumber=000000000
  C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
  A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
  I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
  E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
  E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
  E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
  I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
  E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
  E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
  I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
  E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
  E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
  I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
  E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
  E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
  I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
  E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
  E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
  I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
  E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
  E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
  I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
  E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
  E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
  I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
  E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
  E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
  I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
  E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
  E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
  I:  If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
  E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
  E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us

Signed-off-by: Mark Chen <Mark-YW.Chen@mediatek.com>
---
 drivers/bluetooth/btusb.c | 200 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 200 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 2ba8dd6d3d2d..4d51ecd19bd3 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3127,6 +3127,12 @@ static int btusb_shutdown_intel_new(struct hci_dev *hdev)
 #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
 
 #define HCI_WMT_MAX_EVENT_SIZE		64
+/* It is for mt79xx download rom patch*/
+#define MTK_FW_ROM_PATCH_HEADER_SIZE	32
+#define MTK_FW_ROM_PATCH_GD_SIZE	64
+#define MTK_FW_ROM_PATCH_SEC_MAP_SIZE	64
+#define MTK_SEC_MAP_COMMON_SIZE	12
+#define MTK_SEC_MAP_NEED_SEND_SIZE	52
 
 enum {
 	BTMTK_WMT_PATCH_DWNLD = 0x1,
@@ -3183,6 +3189,40 @@ struct btmtk_hci_wmt_params {
 	u32 *status;
 };
 
+struct btmtk_patch_header {
+	u8 datetime[16];
+	u8 platform[4];
+	__le16 hwver;
+	__le16 swver;
+	__le32 magicnum;
+} __packed;
+
+struct btmtk_global_desc {
+	__le32 patch_ver;
+	__le32 sub_sys;
+	__le32 feature_opt;
+	__le32 section_num;
+} __packed;
+
+struct btmtk_section_map {
+	__le32 sectype;
+	__le32 secoffset;
+	__le32 secsize;
+	union {
+		__le32 u4SecSpec[13];
+		struct {
+			__le32 dlAddr;
+			__le32 dlsize;
+			__le32 seckeyidx;
+			__le32 alignlen;
+			__le32 sectype;
+			__le32 dlmodecrctype;
+			__le32 crc;
+			__le32 reserved[6];
+		} bin_info_spec;
+	};
+} __packed;
+
 static void btusb_mtk_wmt_recv(struct urb *urb)
 {
 	struct hci_dev *hdev = urb->context;
@@ -3406,6 +3446,14 @@ static int btusb_mtk_hci_wmt_sync(struct hci_dev *hdev,
 		else
 			status = BTMTK_WMT_ON_UNDONE;
 		break;
+	case BTMTK_WMT_PATCH_DWNLD:
+		if (wmt_evt->whdr.flag == 2)
+			status = BTMTK_WMT_PATCH_DONE;
+		else if (wmt_evt->whdr.flag == 1)
+			status = BTMTK_WMT_PATCH_PROGRESS;
+		else
+			status = BTMTK_WMT_PATCH_UNDONE;
+		break;
 	}
 
 	if (wmt_params->status)
@@ -3418,6 +3466,122 @@ static int btusb_mtk_hci_wmt_sync(struct hci_dev *hdev,
 	return err;
 }
 
+static int btusb_mtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname)
+{
+	struct btmtk_hci_wmt_params wmt_params;
+	struct btmtk_patch_header *patchhdr = NULL;
+	struct btmtk_global_desc *globaldesc = NULL;
+	struct btmtk_section_map *sectionmap;
+	const struct firmware *fw;
+	const u8 *fw_ptr;
+	const u8 *fw_bin_ptr;
+	size_t fw_size;
+	int err, dlen, i, status;
+	u8 flag, first_block, retry;
+	u32 section_num, dl_size, section_offset;
+	u8 cmd[64];
+
+	err = request_firmware(&fw, fwname, &hdev->dev);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to load firmware file (%d)", err);
+		return err;
+	}
+
+	fw_ptr = fw->data;
+	fw_bin_ptr = fw_ptr;
+	fw_size = fw->size;
+	patchhdr = (struct btmtk_patch_header *)fw_ptr;
+	globaldesc = (struct btmtk_global_desc *)(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE);
+	section_num = globaldesc->section_num;
+
+	for (i = 0; i < section_num; i++) {
+		first_block = 1;
+		fw_ptr = fw_bin_ptr;
+		sectionmap = (struct btmtk_section_map *)(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE +
+			      MTK_FW_ROM_PATCH_GD_SIZE + MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i);
+
+		section_offset = sectionmap->secoffset;
+		dl_size = sectionmap->bin_info_spec.dlsize;
+
+		if (dl_size > 0) {
+			retry = 20;
+			while (retry > 0) {
+				cmd[0] = 0; /* 0 means legacy dl mode. */
+				memcpy(cmd + 1,
+				       fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE +
+				       MTK_FW_ROM_PATCH_GD_SIZE + MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i +
+				       MTK_SEC_MAP_COMMON_SIZE,
+				       MTK_SEC_MAP_NEED_SEND_SIZE + 1);
+
+				wmt_params.op = BTMTK_WMT_PATCH_DWNLD;
+				wmt_params.status = &status;
+				wmt_params.flag = 0;
+				wmt_params.dlen = MTK_SEC_MAP_NEED_SEND_SIZE + 1;
+				wmt_params.data = &cmd;
+
+				err = btusb_mtk_hci_wmt_sync(hdev, &wmt_params);
+				if (err < 0) {
+					bt_dev_err(hdev, "Failed to send wmt patch dwnld (%d)",
+						   err);
+					goto err_release_fw;
+				}
+
+				if (status == BTMTK_WMT_PATCH_UNDONE) {
+					break;
+				} else if (status == BTMTK_WMT_PATCH_PROGRESS) {
+					msleep(100);
+					retry--;
+				} else if (status == BTMTK_WMT_PATCH_DONE) {
+					goto next_section;
+				} else {
+					bt_dev_err(hdev, "Failed wmt patch dwnld status (%d)",
+						   status);
+					goto err_release_fw;
+				}
+			}
+
+			fw_ptr += section_offset;
+			wmt_params.op = BTMTK_WMT_PATCH_DWNLD;
+			wmt_params.status = NULL;
+
+			while (dl_size > 0) {
+				dlen = min_t(int, 250, dl_size);
+				if (first_block == 1) {
+					flag = 1;
+					first_block = 0;
+				} else if (dl_size - dlen <= 0) {
+					flag = 3;
+				} else {
+					flag = 2;
+				}
+
+				wmt_params.flag = flag;
+				wmt_params.dlen = dlen;
+				wmt_params.data = fw_ptr;
+
+				err = btusb_mtk_hci_wmt_sync(hdev, &wmt_params);
+				if (err < 0) {
+					bt_dev_err(hdev, "Failed to send wmt patch dwnld (%d)",
+						   err);
+					goto err_release_fw;
+				}
+
+				dl_size -= dlen;
+				fw_ptr += dlen;
+			}
+		}
+next_section:
+		continue;
+	}
+	/* Wait a few moments for firmware activation done */
+	usleep_range(100000, 120000);
+
+err_release_fw:
+	release_firmware(fw);
+
+	return err;
+}
+
 static int btusb_mtk_setup_firmware(struct hci_dev *hdev, const char *fwname)
 {
 	struct btmtk_hci_wmt_params wmt_params;
@@ -3572,6 +3736,8 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	const char *fwname;
 	int err, status;
 	u32 dev_id;
+	char fw_bin_name[64];
+	u32 fw_version;
 	u8 param;
 
 	calltime = ktime_get();
@@ -3582,6 +3748,19 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 		return err;
 	}
 
+	if (!dev_id) {
+		err = btusb_mtk_id_get(data, 0x70010200, &dev_id);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to get device id (%d)", err);
+			return err;
+		}
+		err = btusb_mtk_id_get(data, 0x80021004, &fw_version);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to get fw version (%d)", err);
+			return err;
+		}
+	}
+
 	switch (dev_id) {
 	case 0x7663:
 		fwname = FIRMWARE_MT7663;
@@ -3589,6 +3768,26 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	case 0x7668:
 		fwname = FIRMWARE_MT7668;
 		break;
+	case 0x7961:
+		snprintf(fw_bin_name, sizeof(fw_bin_name),
+			"mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
+			 dev_id & 0xffff, (fw_version & 0xff) + 1);
+		err = btusb_mtk_setup_firmware_79xx(hdev, fw_bin_name);
+
+		/* Enable Bluetooth protocol */
+		param = 1;
+		wmt_params.op = BTMTK_WMT_FUNC_CTRL;
+		wmt_params.flag = 0;
+		wmt_params.dlen = sizeof(param);
+		wmt_params.data = &param;
+		wmt_params.status = NULL;
+
+		err = btusb_mtk_hci_wmt_sync(hdev, &wmt_params);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err);
+			return err;
+		}
+		goto done;
 	default:
 		bt_dev_err(hdev, "Unsupported support hardware variant (%08x)",
 			   dev_id);
@@ -3666,6 +3865,7 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	}
 	kfree_skb(skb);
 
+done:
 	rettime = ktime_get();
 	delta = ktime_sub(rettime, calltime);
 	duration = (unsigned long long)ktime_to_ns(delta) >> 10;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
