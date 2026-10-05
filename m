Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61D5CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 12:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9bT1DZuf4atgnFojYPgehgz0WmWJewuSRux9JSXf1TA=; b=UkyJby7Wc2nKB/SdwyBTyUsV2j
	LPGTTWR6WrQZu9IYD6dxgggOOP/XD/KKRs2DvoP5MNKmc5laQ8U5InMw7mdVZkaRFYB/QNcZeBUfE
	Bt13AJVydEm+SbbkC2cbzz8LBQ0u4/U4uqfkHXALksMZY73WDZrB1MoBoS2hDLmK3MKctqePj7Joz
	dPg4fPznl1Ok4hY+IJHC0xPyvzO37hk4etmH4VQLhIVO8hxbNHn3KLN/RDzpWbQnFMOTvLnZoOipw
	m9fbQpFxt8XANZQDMRrSxXIUlFUQBuuXXED8s5yEw1nqdmrrUTfOPIP+uAHudEvNU9o5yLYemANH5
	q1v1j6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhY6-0000000GNqN-0E0o;
	Mon, 05 Oct 2026 12:12:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhY2-0000000GNq2-34UZ
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 12:12:04 +0000
X-UUID: f7a9e244c0b511f1afed4741b24580c9-20261005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9bT1DZuf4atgnFojYPgehgz0WmWJewuSRux9JSXf1TA=;
	b=FflDUiC5bcyPawDlyg8q8EnGuN5vHYSjrRNv3e02jS0c6O9HsJgAeniWFU3qtTOTSdfW9yWEDmkd3/08we5iWa4qkIafVvkmpA79G7TUP2moAPFhAcg9fre7RDcgteXvMs/eEit09N4QGmL/iM9p72nfxxXxu7hFNMIJMSSOlHU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:25d204f8-3383-4a2f-bd48-60fa1894d81e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:291e20b,CLOUDID:165d5e56-66df-4ed9-ba9a-e32623d07625,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f7a9e244c0b511f1afed4741b24580c9-20261005
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 244838586; Mon, 05 Oct 2026 05:12:00 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Oct 2026 20:11:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 5 Oct 2026 20:11:57 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v2] Bluetooth: btmtk: Add MT7928 support
Date: Mon, 5 Oct 2026 20:11:56 +0800
Message-ID: <20261005121156.772369-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_051203_100838_D9D356D2 
X-CRM114-Status: GOOD (  24.20  )
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

Add support for MT7928 (internal device ID is MT7935) which requires
additional firmware (CBMCU firmware) loading before Bluetooth firmware.

CBMCU is a new component on MT7928 to handle common part shared across
the combo chip, providing a better user experience through improved
coordination between subsystems.

Implement two-phase CBMCU firmware download: Phase 1 loads section with
type 0x5 containing global descriptor, section maps and signature data;
Phase 2 loads remaining firmware sections. The firmware is rejected if it
has no Phase 1 section.

The CBMCU is shared with the Wi-Fi driver, which may download the same
firmware concurrently. While another download is in progress, wait for
it to finish before querying each section. If it completes, skip the
download instead of failing the probe.

After CBMCU firmware loads successfully, the driver continues to load
corresponding BT firmware based on device ID through fallthrough to
case 0x7922/0x7925.

The CBMCU firmware layout and section-map bounds are validated by
reusing btmtk_fw_validate_layout() and btmtk_fw_validate_section(),
the same helpers btmtk_setup_firmware_79xx() uses, instead of
duplicating the overflow checks.

Add the MT7928 (0x7935) case to btmtk_usb_subsys_reset(), which triggers
the subsystem reset by setting BIT(31) of MTK_BT_RESET_REG_CONNV3.

MT7928 bring-up kernel log:
[ 6931.197167] usb 1-3: New USB device found, idVendor=0e8d, idProduct=7935, bcdDevice= 1.00
[ 6931.197212] usb 1-3: New USB device strings: Mfr=5, Product=6, SerialNumber=7
[ 6931.197237] usb 1-3: Product: Wireless_Device
[ 6931.197258] usb 1-3: Manufacturer: MediaTek Inc.
[ 6931.197279] usb 1-3: SerialNumber: 000000000
[ 6931.213478] Bluetooth: hci1: Loading CBMCU firmware: mediatek/mt7928/CBMCU_CODE_MT7935_1_1.bin
[ 6931.215214] Bluetooth: hci1: CBMCU HW ver: 0x7935, SW ver: 0x0000, Build Time: 20260601T161751+
[ 6931.623962] Bluetooth: hci1: CBMCU firmware download completed
[ 6931.643916] Bluetooth: hci1: Loading BT firmware: mediatek/mt7928/BT_RAM_CODE_MT7935_1_1_hdr.bin
[ 6931.650467] Bluetooth: hci1: BT HW ver: 0x7935, SW ver: 0x0000, Build Time: 20260527000816
[ 6935.039790] Bluetooth: hci1: Device setup in 3369644 usecs
[ 6935.039833] Bluetooth: hci1: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
[ 6935.160654] Bluetooth: hci1: AOSP extensions version v2.00
[ 6935.160710] Bluetooth: hci1: AOSP quality report is supported
[ 6935.162954] Bluetooth: MGMT ver 1.23

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Assisted-by: Claude:Sonnet-5
---
Changes in v2:
 - btmtk_query_cbmcu_section(): wait while another agent (e.g. the Wi-Fi driver)
   is downloading the CBMCU firmware, and skip the download if it completes
   instead of failing the probe with -EIO

 drivers/bluetooth/btmtk.c | 371 ++++++++++++++++++++++++++++++++++++++
 drivers/bluetooth/btmtk.h |   3 +
 2 files changed, 374 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 115a11fcb254..f5fb75ab0fbb 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -22,6 +22,12 @@
 #define MTK_FW_ROM_PATCH_SEC_MAP_SIZE	64
 #define MTK_SEC_MAP_COMMON_SIZE	12
 #define MTK_SEC_MAP_NEED_SEND_SIZE	52
+#define MTK_SEC_MAP_LENGTH_SIZE	4
+#define MTK_SEC_CBMCU_DESC	0x5
+
+/* CBMCU WMT command flags */
+#define BTMTK_CBMCU_FLAG_QUERY_STATUS	0xF0
+#define BTMTK_CBMCU_FLAG_ENABLE_PATCH	0xF1
 
 /* It is for mt79xx iso data transmission setting */
 #define MTK_ISO_THRESHOLD	264
@@ -182,6 +188,11 @@ void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
 		snprintf(buf, size,
 			 "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
 			 dev_id & 0xffff, dev_id & 0xffff, (fw_ver & 0xff) + 1);
+	/* MT7928 */
+	else if (dev_id == 0x7935)
+		snprintf(buf, size,
+			 "mediatek/mt7928/BT_RAM_CODE_MT%04x_1_1_hdr.bin",
+			 dev_id & 0xffff);
 	else if (dev_id == 0x7961 && fw_flavor)
 		snprintf(buf, size,
 			 "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hdr.bin",
@@ -809,6 +820,7 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 			status = BTMTK_WMT_ON_UNDONE;
 		break;
 	case BTMTK_WMT_PATCH_DWNLD:
+	case BTMTK_WMT_CBMCU_DWNLD:
 		if (wmt_evt->whdr.flag == 2)
 			status = BTMTK_WMT_PATCH_DONE;
 		else if (wmt_evt->whdr.flag == 1)
@@ -933,6 +945,346 @@ static u32 btmtk_usb_reset_done(struct hci_dev *hdev)
 	return val & MTK_BT_RST_DONE;
 }
 
+static int btmtk_cbmcu_patch_status(struct hci_dev *hdev,
+				    wmt_cmd_sync_func_t wmt_cmd_sync,
+				    u8 *patch_status)
+{
+	struct btmtk_hci_wmt_params wmt_params;
+	int status = BTMTK_WMT_INVALID, err, retry = 20;
+
+	do {
+		wmt_params.op = BTMTK_WMT_CBMCU_DWNLD;
+		wmt_params.flag = BTMTK_CBMCU_FLAG_QUERY_STATUS;
+		wmt_params.dlen = 0;
+		wmt_params.data = NULL;
+		wmt_params.status = &status;
+
+		err = wmt_cmd_sync(hdev, &wmt_params);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to query CBMCU patch status (%d)", err);
+			return err;
+		}
+
+		*patch_status = (u8)status;
+
+		if (*patch_status == BTMTK_WMT_PATCH_PROGRESS) {
+			msleep(100);
+			retry--;
+		} else {
+			break;
+		}
+	} while (retry > 0);
+
+	if (*patch_status == BTMTK_WMT_PATCH_PROGRESS) {
+		bt_dev_err(hdev, "CBMCU patch status query timeout");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int btmtk_query_cbmcu_section(struct hci_dev *hdev,
+				     wmt_cmd_sync_func_t wmt_cmd_sync,
+				     u8 cbmcu_type,
+				     const u8 *section_map,
+				     u32 cert_len)
+{
+	struct btmtk_hci_wmt_params wmt_params;
+	u8 cmd[64];
+	int status = BTMTK_WMT_INVALID, err, retry = 20;
+
+	cmd[0] = 0;
+	cmd[1] = cbmcu_type;
+
+	if (cbmcu_type == 0)
+		put_unaligned_le32(cert_len, &cmd[2]);
+	else
+		memcpy(&cmd[2], section_map, MTK_SEC_MAP_NEED_SEND_SIZE);
+
+	wmt_params.op = BTMTK_WMT_CBMCU_DWNLD;
+	wmt_params.flag = 0;
+	wmt_params.dlen = cbmcu_type ?
+		MTK_SEC_MAP_NEED_SEND_SIZE + 2 :
+		MTK_SEC_MAP_LENGTH_SIZE + 2;
+	wmt_params.data = cmd;
+	wmt_params.status = &status;
+
+	/* The CBMCU is shared with the Wi-Fi driver, which may be downloading
+	 * the firmware at the same time. Wait for it to finish; if it has
+	 * completed, tell the caller there is nothing left to download.
+	 */
+	while (retry--) {
+		err = wmt_cmd_sync(hdev, &wmt_params);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to query CBMCU section (%d)", err);
+			return err;
+		}
+
+		switch (status) {
+		case BTMTK_WMT_PATCH_UNDONE:
+			return 0;
+		case BTMTK_WMT_PATCH_PROGRESS:
+			msleep(100);
+			break;
+		case BTMTK_WMT_PATCH_DONE:
+			return -EALREADY;
+		default:
+			bt_dev_err(hdev, "CBMCU section query status error (%d)",
+				   status);
+			return -EIO;
+		}
+	}
+
+	bt_dev_err(hdev, "CBMCU section query timeout");
+	return -ETIMEDOUT;
+}
+
+static int btmtk_download_cbmcu_section(struct hci_dev *hdev,
+					wmt_cmd_sync_func_t wmt_cmd_sync,
+					const u8 *fw_data,
+					u32 dl_size)
+{
+	struct btmtk_hci_wmt_params wmt_params;
+	u32 sent_len, total_size = dl_size;
+	int err;
+
+	wmt_params.op = BTMTK_WMT_CBMCU_DWNLD;
+	wmt_params.status = NULL;
+
+	while (dl_size > 0) {
+		sent_len = min_t(u32, 250, dl_size);
+
+		if (dl_size == total_size)
+			wmt_params.flag = BTMTK_WMT_PKT_START;
+		else if (dl_size == sent_len)
+			wmt_params.flag = BTMTK_WMT_PKT_END;
+		else
+			wmt_params.flag = BTMTK_WMT_PKT_CONTINUE;
+
+		wmt_params.dlen = sent_len;
+		wmt_params.data = fw_data;
+
+		err = wmt_cmd_sync(hdev, &wmt_params);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to send CBMCU section data (%d)", err);
+			return err;
+		}
+
+		dl_size -= sent_len;
+		fw_data += sent_len;
+	}
+
+	return 0;
+}
+
+static int btmtk_enable_cbmcu_patch(struct hci_dev *hdev,
+				    wmt_cmd_sync_func_t wmt_cmd_sync)
+{
+	struct btmtk_hci_wmt_params wmt_params;
+	int err;
+
+	wmt_params.op = BTMTK_WMT_CBMCU_DWNLD;
+	wmt_params.flag = BTMTK_CBMCU_FLAG_ENABLE_PATCH;
+	wmt_params.dlen = 0;
+	wmt_params.data = NULL;
+	wmt_params.status = NULL;
+
+	err = wmt_cmd_sync(hdev, &wmt_params);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to enable CBMCU patch (%d)", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int btmtk_load_cbmcu_firmware(struct hci_dev *hdev,
+				     const char *fwname,
+				     wmt_cmd_sync_func_t wmt_cmd_sync,
+				     u32 dev_id)
+{
+	struct btmtk_patch_header *hdr;
+	struct btmtk_section_map *sectionmap;
+	const struct firmware *fw;
+	const u8 *fw_ptr;
+	u8 *cert_buf = NULL;
+	u32 section_num, section_offset, dl_size, cert_len;
+	bool phase1_done = false;
+	int i, err;
+
+	err = request_firmware(&fw, fwname, &hdev->dev);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to load CBMCU firmware file %s (%d)",
+			   fwname, err);
+		return err;
+	}
+
+	err = btmtk_fw_validate_layout(hdev, fw, &section_num);
+	if (err < 0)
+		goto err_release_fw;
+
+	fw_ptr = fw->data;
+	hdr = (struct btmtk_patch_header *)fw_ptr;
+
+	bt_dev_info(hdev, "CBMCU HW ver: 0x%04x, SW ver: 0x%04x, Build Time: %.16s",
+		    dev_id & 0xffff, le16_to_cpu(hdr->swver), hdr->datetime);
+
+	/* Phase 1: Download section type MTK_SEC_CBMCU_DESC */
+	for (i = 0; i < section_num; i++) {
+		sectionmap = (struct btmtk_section_map *)
+			(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE +
+			 MTK_FW_ROM_PATCH_GD_SIZE +
+			 MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i);
+
+		/* Only process MTK_SEC_CBMCU_DESC section in Phase 1 */
+		if ((le32_to_cpu(sectionmap->sectype) & 0xFFFF) != MTK_SEC_CBMCU_DESC)
+			continue;
+
+		section_offset = le32_to_cpu(sectionmap->secoffset);
+		dl_size = le32_to_cpu(sectionmap->secsize);
+
+		if (dl_size == 0)
+			continue;
+
+		err = btmtk_fw_validate_section(hdev, fw, i,
+						section_offset, dl_size);
+		if (err < 0)
+			goto err_release_fw;
+
+		cert_len = MTK_FW_ROM_PATCH_GD_SIZE +
+			   MTK_FW_ROM_PATCH_SEC_MAP_SIZE * section_num +
+			   dl_size;
+
+		/* Query cbmcu section */
+		err = btmtk_query_cbmcu_section(hdev, wmt_cmd_sync, 0, NULL,
+						cert_len);
+		if (err < 0)
+			goto err_release_fw;
+
+		cert_buf = kmalloc(cert_len, GFP_KERNEL);
+		if (!cert_buf) {
+			err = -ENOMEM;
+			goto err_release_fw;
+		}
+
+		/* Copy Global Descriptor + All Section Maps */
+		memcpy(cert_buf,
+		       fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE,
+		       MTK_FW_ROM_PATCH_GD_SIZE + MTK_FW_ROM_PATCH_SEC_MAP_SIZE * section_num);
+
+		/* Copy Phase 1 section data */
+		memcpy(cert_buf + MTK_FW_ROM_PATCH_GD_SIZE +
+		       MTK_FW_ROM_PATCH_SEC_MAP_SIZE * section_num,
+		       fw_ptr + section_offset,
+		       dl_size);
+
+		/* Download Phase 1 section */
+		err = btmtk_download_cbmcu_section(hdev, wmt_cmd_sync,
+						   cert_buf, cert_len);
+		kfree(cert_buf);
+		cert_buf = NULL;
+
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to download CBMCU Phase 1 section (%d)", err);
+			goto err_release_fw;
+		}
+
+		phase1_done = true;
+		break;
+	}
+
+	if (!phase1_done) {
+		bt_dev_err(hdev, "CBMCU firmware has no Phase 1 section");
+		err = -EINVAL;
+		goto err_release_fw;
+	}
+
+	/* Phase 2: Download other sections (type != MTK_SEC_CBMCU_DESC) */
+	for (i = 0; i < section_num; i++) {
+		sectionmap = (struct btmtk_section_map *)
+			(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE +
+			 MTK_FW_ROM_PATCH_GD_SIZE +
+			 MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i);
+
+		/* Skip MTK_SEC_CBMCU_DESC section in Phase 2 */
+		if ((le32_to_cpu(sectionmap->sectype) & 0xFFFF) == MTK_SEC_CBMCU_DESC)
+			continue;
+
+		section_offset = le32_to_cpu(sectionmap->secoffset);
+		dl_size = le32_to_cpu(sectionmap->bin_info_spec.dlsize);
+
+		if (dl_size == 0)
+			continue;
+
+		err = btmtk_fw_validate_section(hdev, fw, i,
+						section_offset, dl_size);
+		if (err < 0)
+			goto err_release_fw;
+
+		/* Query cbmcu section */
+		err = btmtk_query_cbmcu_section(hdev, wmt_cmd_sync, 1,
+						(u8 *)&sectionmap->bin_info_spec,
+						0);
+		if (err < 0)
+			goto err_release_fw;
+
+		/* Download section data */
+		err = btmtk_download_cbmcu_section(hdev, wmt_cmd_sync,
+						   fw_ptr + section_offset,
+						   dl_size);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to download CBMCU section %d (%d)", i, err);
+			goto err_release_fw;
+		}
+	}
+
+	bt_dev_info(hdev, "CBMCU firmware download completed");
+
+err_release_fw:
+	release_firmware(fw);
+	return err;
+}
+
+static int btmtk_setup_cbmcu_firmware(struct hci_dev *hdev,
+				      wmt_cmd_sync_func_t wmt_cmd_sync,
+				      u32 dev_id)
+{
+	char cbmcu_fwname[64];
+	u8 patch_status;
+	int err;
+
+	err = btmtk_cbmcu_patch_status(hdev, wmt_cmd_sync, &patch_status);
+	if (err < 0)
+		return err;
+
+	bt_dev_dbg(hdev, "CBMCU patch status: 0x%02x", patch_status);
+
+	if (patch_status != BTMTK_WMT_PATCH_UNDONE)
+		return 0;
+
+	snprintf(cbmcu_fwname, sizeof(cbmcu_fwname),
+		 "mediatek/mt7928/CBMCU_CODE_MT%04x_1_1.bin",
+		 dev_id & 0xffff);
+
+	bt_dev_info(hdev, "Loading CBMCU firmware: %s", cbmcu_fwname);
+
+	err = btmtk_load_cbmcu_firmware(hdev, cbmcu_fwname, wmt_cmd_sync, dev_id);
+	if (err == -EALREADY) {
+		bt_dev_info(hdev, "CBMCU firmware downloaded by another driver");
+		return 0;
+	}
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to download CBMCU firmware (%d)", err);
+		return err;
+	}
+
+	err = btmtk_enable_cbmcu_patch(hdev, wmt_cmd_sync);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
 int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 {
 	int reset_err = 0;
@@ -997,6 +1349,14 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 		if (err)
 			return err;
 		msleep(100);
+	} else if (dev_id == 0x7935) {
+		err = btmtk_usb_uhw_reg_read(hdev, MTK_BT_RESET_REG_CONNV3, &val);
+		if (err)
+			return err;
+		val |= BIT(31);
+		err = btmtk_usb_uhw_reg_write(hdev, MTK_BT_RESET_REG_CONNV3, val);
+		if (err < 0)
+			return err;
 	} else {
 		/* It's Device EndPoint Reset Option Register */
 		bt_dev_dbg(hdev, "Initiating reset mechanism via uhw");
@@ -1455,6 +1815,15 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 	case 0x7668:
 		fwname = FIRMWARE_MT7668;
 		break;
+	case 0x7935:
+		/* Requires CBMCU firmware before BT firmware */
+		err = btmtk_setup_cbmcu_firmware(hdev, btmtk_usb_hci_wmt_sync,
+						 dev_id);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to set up CBMCU firmware (%d)", err);
+			return err;
+		}
+		fallthrough;
 	case 0x7922:
 	case 0x7925:
 	case 0x7961:
@@ -1667,3 +2036,5 @@ MODULE_FIRMWARE(FIRMWARE_MT7961);
 MODULE_FIRMWARE(FIRMWARE_MT7920);
 MODULE_FIRMWARE(FIRMWARE_MT7925);
 MODULE_FIRMWARE(FIRMWARE_MT7927);
+MODULE_FIRMWARE(FIRMWARE_MT7928);
+MODULE_FIRMWARE(FIRMWARE_MT7928_CBMCU);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index e8ad281a93a0..58643ec39667 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -10,6 +10,8 @@
 #define FIRMWARE_MT7920		"mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin"
 #define FIRMWARE_MT7925		"mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin"
 #define FIRMWARE_MT7927		"mediatek/mt7927/BT_RAM_CODE_MT6639_2_1_hdr.bin"
+#define FIRMWARE_MT7928		"mediatek/mt7928/BT_RAM_CODE_MT7935_1_1_hdr.bin"
+#define FIRMWARE_MT7928_CBMCU	"mediatek/mt7928/CBMCU_CODE_MT7935_1_1.bin"
 
 #define HCI_EV_WMT 0xe4
 #define HCI_WMT_MAX_EVENT_SIZE		64
@@ -55,6 +57,7 @@ enum {
 	BTMTK_WMT_RST = 0x7,
 	BTMTK_WMT_REGISTER = 0x8,
 	BTMTK_WMT_SEMAPHORE = 0x17,
+	BTMTK_WMT_CBMCU_DWNLD = 0x58,
 };
 
 enum {
-- 
2.45.2


