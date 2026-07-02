Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646A9C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 07:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/cTAXxiF3k07rNmAgKvsKAUCLozevrZSLPZeWFNbt0=; b=yM8Ra5FCHfi2fN9U60d9y+U9op
	7PmcE3/rMOTKAikfYkdg0YHmlAH0pNrgdPL6GQ66KaVpmnBHbmRW4c8x81BiHDFiOrFtDn1MjpvYU
	SJD7eOXt3deTla8dpCAeDwxrkSrDByzUnAPphhgn5kIb1z4uwUVgIbKsYz5psxve+c4sOLhPbjusW
	F9XgC3rLMNbs+TfJFoIVCAVB+0huMi/8smDLDgNur/ENZ54Jw156dsyGvywcbJfpSQnWKYKv0Uzki
	HGE5zOD+3U36z3wDne4b9CIS6xfqdMl4HfQZWOzFx1HyJ63jKgwzjFQ13jhYkQXggCxTk9uvcfyJ/
	tYVxAO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBqt-00000003jqU-25ol;
	Thu, 02 Jul 2026 07:28:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBqr-00000003joV-1g12
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 07:28:50 +0000
X-UUID: a8f72aa875e711f1acbe4559397dec65-20260702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=f/cTAXxiF3k07rNmAgKvsKAUCLozevrZSLPZeWFNbt0=;
	b=Lo4a6kQfPGLLpentHbezrwoniNORnPXwr1GIRbPojtpid7qw9TOd0jQ5n/7ERRM/chPqBcQDy6szWg3EPx/gx3eXsCCgAR8FE/8bcG5WZTD/VrDiiDg5r1C6NFXH8L7yMzUngVT7cbkWw6DwUGxf1MAmfdCrhMfqGFeLUKgE6ls=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:588103c7-6ec8-46d6-9e34-81f80e8f315e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:3d40e781-6310-4e6b-a6b1-aca20d98ed8b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a8f72aa875e711f1acbe4559397dec65-20260702
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1736518893; Thu, 02 Jul 2026 00:28:45 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 2 Jul 2026 15:28:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 2 Jul 2026 15:28:42 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
	Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v8 4/5] Bluetooth: btmtk: Improve BT firmware logging
Date: Thu, 2 Jul 2026 15:28:39 +0800
Message-ID: <20260702072840.1712057-5-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260702072840.1712057-1-chris.lu@mediatek.com>
References: <20260702072840.1712057-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_002849_443733_31A15FEE 
X-CRM114-Status: GOOD (  11.67  )
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

Improve firmware loading log messages to provide more useful information:

- Add firmware filename before loading to help identify which file
  is being loaded
- Display chip ID (dev_id) as HW version instead of firmware's hwver
  field, which provides more meaningful hardware identification
- Use %.16s format specifier for hdr->datetime field to prevent
  potential buffer over-read, as the field is a 16-byte array that
  may not be null-terminated

log output with MT7922
[  212.878783] Bluetooth: hci1: Loading BT firmware: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
[  212.889614] Bluetooth: hci1: BT HW ver: 0x7922, SW ver: 0x008a, Build Time: 20260224103448
[  216.048877] Bluetooth: hci1: Device setup in 3096530 usecs
[  216.048890] Bluetooth: hci1: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
[  216.114179] Bluetooth: hci1: AOSP extensions version v1.00
[  216.114220] Bluetooth: hci1: AOSP quality report is supported
[  216.116782] Bluetooth: MGMT ver 1.23

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Assisted-by: Claude:Sonnet-4.5
---
 drivers/bluetooth/btmtk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 3fe6b4fdc438..75519765bb49 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -148,6 +148,8 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 	size_t expected_size;
 	u8 cmd[64];
 
+	bt_dev_info(hdev, "Loading BT firmware: %s", fwname);
+
 	err = request_firmware(&fw, fwname, &hdev->dev);
 	if (err < 0) {
 		bt_dev_err(hdev, "Failed to load firmware file (%d)", err);
@@ -188,8 +190,8 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 		goto err_release_fw;
 	}
 
-	bt_dev_info(hdev, "HW/SW Version: 0x%04x%04x, Build Time: %s",
-		    le16_to_cpu(hdr->hwver), le16_to_cpu(hdr->swver), hdr->datetime);
+	bt_dev_info(hdev, "BT HW ver: 0x%04x, SW ver: 0x%04x, Build Time: %.16s",
+		    dev_id & 0xffff, le16_to_cpu(hdr->swver), hdr->datetime);
 
 	for (i = 0; i < section_num; i++) {
 		first_block = 1;
-- 
2.45.2


