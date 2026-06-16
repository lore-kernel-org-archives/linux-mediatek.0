Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A615CD98DA
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 03:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JnV2ohQqnTDfQx/MECVAP4nQB+pseiQxv1gG8Oyl/i0=; b=UfvAel2quq4LVWnJ1THM8wG4lV
	LP0UmloycG+6MLKs9rRBhFWesVV2iTpziIMc00roEue1TNEkg6iiKWMvmviT5k9QJL+o3K/4DOVfV
	o+1UWDx3tj8aaZ3rvZwX5QfA9Qzw5gEdwJOqSS0QqLHj+TGnURKtWePyb7bOEp6oVhzEejTy9E/lN
	q+VTUI9sGiGGI07WNfeftwqAlSwbEANR5SVh1ucp7x9QM4lsUp2s+qHpZXW5nju+Afpd2nZFcXUvM
	DYbpvp9kZ4XRtiSyl/A1nKb8uNjG2EMbSLNCZqv0cn/nO94IVJ2D5OcAv9+7mWMIthRGswewJACxs
	a4384lIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZK3f-0000000F8Mn-0x92;
	Tue, 16 Jun 2026 03:01:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZK3c-0000000F8MS-0iho
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 03:01:45 +0000
X-UUID: b070ee96692f11f1acbe4559397dec65-20260615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JnV2ohQqnTDfQx/MECVAP4nQB+pseiQxv1gG8Oyl/i0=;
	b=sLr1tqqBhIhFRdY80bQdQNTbqnN1f40I+E2abxNMSdCsEnO3u+KY0vOW4ssqDA8rDB0EdrQTf2SY3UJuDr/x4pgij3nkV9hkzeaXkFIY/EjJdwe3fhUTYtnCMu5Zws/5aTlmMUNh5b+hllKRPYeTIl56s4JFns8bAaAzLeGFIrw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:37a2911a-f384-4030-9d82-c2ab2724f0bc,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d497b38,CLOUDID:8d5bb6ed-45e6-4692-a476-3f71842ee83b,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50,
	EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b070ee96692f11f1acbe4559397dec65-20260615
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1465696620; Mon, 15 Jun 2026 20:01:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Jun 2026 11:01:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 16 Jun 2026 11:01:34 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1] Bluetooth: btmtk: Add MT7928 support
Date: Tue, 16 Jun 2026 11:01:32 +0800
Message-ID: <20260616030132.532184-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_200144_265546_85C93B67 
X-CRM114-Status: GOOD (  21.78  )
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

Add support for MT7928 (device ID 0x7935) which requires additional
firmware (CBMCU firmware) loading before Bluetooth firmware.

Implement two-phase CBMCU firmware download: Phase 1 loads
section with type 0x5 containing global descriptor,
section maps and signature data; Phase 2 loads remaining
firmware sections. Add retry mechanism for concurrent download
protection.

After CBMCU firmware loads successfully, the driver continues
to load corresponding BT firmware based on device ID through
fallthrough to case 0x7922/0x7925.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 342 +++++++++++++++++++++++++++++++++++++-
 drivers/bluetooth/btmtk.h |   3 +
 2 files changed, 344 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 02a96342e964..a68c67d1df4b 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -21,6 +21,7 @@
 #define MTK_FW_ROM_PATCH_SEC_MAP_SIZE	64
 #define MTK_SEC_MAP_COMMON_SIZE	12
 #define MTK_SEC_MAP_NEED_SEND_SIZE	52
+#define MTK_SEC_MAP_LENGTH_SIZE	4
 
 /* It is for mt79xx iso data transmission setting */
 #define MTK_ISO_THRESHOLD	264
@@ -120,6 +121,10 @@ void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
 		snprintf(buf, size,
 			 "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
 			 dev_id & 0xffff, dev_id & 0xffff, (fw_ver & 0xff) + 1);
+	else if (dev_id == 0x7935)
+		snprintf(buf, size,
+			 "mediatek/mt7928/BT_RAM_CODE_MT%04x_1_1_hdr.bin",
+			 dev_id & 0xffff);
 	else if (dev_id == 0x7961 && fw_flavor)
 		snprintf(buf, size,
 			 "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hdr.bin",
@@ -734,6 +739,7 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
 			status = BTMTK_WMT_ON_UNDONE;
 		break;
 	case BTMTK_WMT_PATCH_DWNLD:
+	case BTMTK_WMT_CBMCU_DWNLD:
 		if (wmt_evt->whdr.flag == 2)
 			status = BTMTK_WMT_PATCH_DONE;
 		else if (wmt_evt->whdr.flag == 1)
@@ -870,6 +876,329 @@ static u32 btmtk_usb_reset_done(struct hci_dev *hdev)
 	return val & MTK_BT_RST_DONE;
 }
 
+static int btmtk_cbmcu_patch_status(struct hci_dev *hdev,
+				    wmt_cmd_sync_func_t wmt_cmd_sync,
+				    u8 *patch_status)
+{
+	struct btmtk_hci_wmt_params wmt_params;
+	int status, err, retry = 20;
+
+	do {
+		wmt_params.op = BTMTK_WMT_CBMCU_DWNLD;
+		wmt_params.flag = 0xF0;
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
+	int status, err;
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
+	err = wmt_cmd_sync(hdev, &wmt_params);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to query CBMCU section (%d)", err);
+		return err;
+	}
+
+	/* Query should return UNDONE status for successful section query */
+	if (status != BTMTK_WMT_PATCH_UNDONE) {
+		bt_dev_err(hdev, "CBMCU section query status error (%d)", status);
+		return -EIO;
+	}
+
+	return 0;
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
+			wmt_params.flag = 1;
+		else if (dl_size == sent_len)
+			wmt_params.flag = 3;
+		else
+			wmt_params.flag = 2;
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
+	wmt_params.flag = 0xF1;
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
+				     wmt_cmd_sync_func_t wmt_cmd_sync)
+{
+	struct btmtk_patch_header *hdr;
+	struct btmtk_global_desc *globaldesc;
+	struct btmtk_section_map *sectionmap;
+	const struct firmware *fw;
+	const u8 *fw_ptr;
+	u8 *cert_buf = NULL;
+	u32 section_num, section_offset, dl_size, cert_len;
+	int i, err;
+
+	err = request_firmware(&fw, fwname, &hdev->dev);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to load CBMCU firmware file (%d)", err);
+		return err;
+	}
+
+	if (fw->size < MTK_FW_ROM_PATCH_HEADER_SIZE + MTK_FW_ROM_PATCH_GD_SIZE) {
+		bt_dev_err(hdev, "CBMCU firmware too small (%zu bytes)", fw->size);
+		err = -EINVAL;
+		goto err_release_fw;
+	}
+
+	fw_ptr = fw->data;
+	hdr = (struct btmtk_patch_header *)fw_ptr;
+	globaldesc = (struct btmtk_global_desc *)(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE);
+	section_num = le32_to_cpu(globaldesc->section_num);
+
+	if (fw->size < MTK_FW_ROM_PATCH_HEADER_SIZE + MTK_FW_ROM_PATCH_GD_SIZE +
+		       (size_t)MTK_FW_ROM_PATCH_SEC_MAP_SIZE * section_num) {
+		bt_dev_err(hdev, "CBMCU firmware truncated (section_num=%u)", section_num);
+		err = -EINVAL;
+		goto err_release_fw;
+	}
+
+	bt_dev_info(hdev, "CBMCU Version: 0x%04x%04x, Build Time: %s",
+		    le16_to_cpu(hdr->hwver), le16_to_cpu(hdr->swver), hdr->datetime);
+
+	/* Phase 1: Download section type 0x5 */
+	for (i = 0; i < section_num; i++) {
+		sectionmap = (struct btmtk_section_map *)
+			(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE +
+			 MTK_FW_ROM_PATCH_GD_SIZE +
+			 MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i);
+
+		/* Only process type 0x5 section in Phase 1 */
+		if ((le32_to_cpu(sectionmap->sectype) & 0xFFFF) != 0x5)
+			continue;
+
+		section_offset = le32_to_cpu(sectionmap->secoffset);
+		dl_size = le32_to_cpu(sectionmap->secsize);
+
+		if (dl_size == 0)
+			continue;
+
+		if (section_offset > fw->size ||
+		    dl_size > fw->size - section_offset) {
+			bt_dev_err(hdev, "CBMCU Phase 1 section out of bounds");
+			err = -EINVAL;
+			goto err_release_fw;
+		}
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
+		break;
+	}
+
+	/* Phase 2: Download other sections (type != 0x5) */
+	for (i = 0; i < section_num; i++) {
+		sectionmap = (struct btmtk_section_map *)
+			(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE +
+			 MTK_FW_ROM_PATCH_GD_SIZE +
+			 MTK_FW_ROM_PATCH_SEC_MAP_SIZE * i);
+
+		/* Skip type 0x5 section in Phase 2 */
+		if ((le32_to_cpu(sectionmap->sectype) & 0xFFFF) == 0x5)
+			continue;
+
+		section_offset = le32_to_cpu(sectionmap->secoffset);
+		dl_size = le32_to_cpu(sectionmap->bin_info_spec.dlsize);
+
+		if (dl_size == 0)
+			continue;
+
+		if (section_offset > fw->size ||
+		    dl_size > fw->size - section_offset) {
+			bt_dev_err(hdev, "CBMCU Phase 2 section %d out of bounds", i);
+			err = -EINVAL;
+			goto err_release_fw;
+		}
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
+	/* Wait for firmware activation */
+	usleep_range(100000, 120000);
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
+	err = btmtk_load_cbmcu_firmware(hdev, cbmcu_fwname, wmt_cmd_sync);
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
 	u32 val;
@@ -894,7 +1223,7 @@ int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id)
 		if (err < 0)
 			return err;
 		msleep(100);
-	} else if (dev_id == 0x7925 || dev_id == 0x6639) {
+	} else if (dev_id == 0x7925 || dev_id == 0x6639 || dev_id == 0x7935) {
 		err = btmtk_usb_uhw_reg_read(hdev, MTK_BT_RESET_REG_CONNV3, &val);
 		if (err < 0)
 			return err;
@@ -1379,6 +1708,15 @@ int btmtk_usb_setup(struct hci_dev *hdev)
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
 		/*
@@ -1596,3 +1934,5 @@ MODULE_FIRMWARE(FIRMWARE_MT7922);
 MODULE_FIRMWARE(FIRMWARE_MT7961);
 MODULE_FIRMWARE(FIRMWARE_MT7925);
 MODULE_FIRMWARE(FIRMWARE_MT7927);
+MODULE_FIRMWARE(FIRMWARE_MT7928);
+MODULE_FIRMWARE(FIRMWARE_MT7928_CBMCU);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index c83c24897c95..6d3bf6b74a1d 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -9,6 +9,8 @@
 #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
 #define FIRMWARE_MT7925		"mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin"
 #define FIRMWARE_MT7927		"mediatek/mt7927/BT_RAM_CODE_MT6639_2_1_hdr.bin"
+#define FIRMWARE_MT7928		"mediatek/mt7928/BT_RAM_CODE_MT7935_1_1_hdr.bin"
+#define FIRMWARE_MT7928_CBMCU	"mediatek/mt7928/CBMCU_CODE_MT7935_1_1.bin"
 
 #define HCI_EV_WMT 0xe4
 #define HCI_WMT_MAX_EVENT_SIZE		64
@@ -54,6 +56,7 @@ enum {
 	BTMTK_WMT_RST = 0x7,
 	BTMTK_WMT_REGISTER = 0x8,
 	BTMTK_WMT_SEMAPHORE = 0x17,
+	BTMTK_WMT_CBMCU_DWNLD = 0x58,
 };
 
 enum {
-- 
2.45.2


