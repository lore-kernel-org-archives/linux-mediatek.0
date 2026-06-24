Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7A3CDB470
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2026 07:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbPgY4vtSC645oYZ1jm7fI1rmlmtx++DIFnnc+cXY0k=; b=PwkdCnUICBrWNalVmWAerAG7tv
	upVHM99Pd5J3s2L2tfdg6fliHuozO9XiFNWAa+ntTl+ne57Is552rrFAflnyUoOvxdk6gTRMNeVDm
	b/9s8ADtElXG4wpcH63jqd1IEeffkisoD6Of49pTK/ghBWg+GaBuROKVMPut8Nh/s7rd88fnvgxZx
	HLQ21N2zWR/GEWUB5t0hNviNTae5QvYluZnG8iDhTl5G+LzzQ3j5/42ekzCCMKXxX1ACfAOIPrnO9
	NKm5PtpPQlp/1HO2XHk8JSK5WgZHnvcJnY2oBUEoKeoONcS+8Ev+I5dvd95Jlrw3UjhzK8n/bhT1W
	3xIoMH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIS5-00000007M8u-2M98;
	Wed, 24 Jun 2026 07:55:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIS3-00000007M7R-0b3o
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jun 2026 07:55:16 +0000
X-UUID: 05bf13e66fa211f1afed4741b24580c9-20260624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pbPgY4vtSC645oYZ1jm7fI1rmlmtx++DIFnnc+cXY0k=;
	b=IiFz4D75fmGqVSxoTtYtDyyn5zB9ufv8t2kbl+4XgJObhxfovbVMAGHlYYHpZvmy0crLBE/lcp3k65gZPiOhGV3VkknuIZf6Y/m/+0WLkdvBAUa7NfTcsvY/Sr9PGzf0F2y2rUehHQXDwzokw5bLOPrAOz4qPJjn403KbAAIP6Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:fa79b2aa-08c8-4403-b2ca-7cac5141af56,IP:0,U
	RL:0,TC:0,Content:0,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:d497b38,CLOUDID:c63fc9fc-4e5b-4880-a751-e09c9abb260d,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0,EDM:1,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 05bf13e66fa211f1afed4741b24580c9-20260624
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1088299973; Wed, 24 Jun 2026 00:55:09 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Jun 2026 15:55:07 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Jun 2026 15:55:07 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v5 2/3] Bluetooth: btmtk: Improve BT firmware logging
Date: Wed, 24 Jun 2026 15:55:03 +0800
Message-ID: <20260624075505.1318804-3-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260624075505.1318804-1-chris.lu@mediatek.com>
References: <20260624075505.1318804-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_005515_190896_E3B01B54 
X-CRM114-Status: GOOD (  11.35  )
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

log output with MT7922
[  212.878783] Bluetooth: hci1: Loading BT firmware: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
[  212.889614] Bluetooth: hci1: BT HW ver: 0x7922, SW ver: 0x008a, Build Time: 20260224103448
[  216.048877] Bluetooth: hci1: Device setup in 3096530 usecs
[  216.048890] Bluetooth: hci1: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
[  216.114179] Bluetooth: hci1: AOSP extensions version v1.00
[  216.114220] Bluetooth: hci1: AOSP quality report is supported
[  216.116782] Bluetooth: MGMT ver 1.23

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 21c08ee1cdbf..dc40820bfea0 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -147,6 +147,8 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 	u32 section_num, dl_size, section_offset;
 	u8 cmd[64];
 
+	bt_dev_info(hdev, "Loading BT firmware: %s", fwname);
+
 	err = request_firmware(&fw, fwname, &hdev->dev);
 	if (err < 0) {
 		bt_dev_err(hdev, "Failed to load firmware file (%d)", err);
@@ -159,8 +161,8 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 	globaldesc = (struct btmtk_global_desc *)(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE);
 	section_num = le32_to_cpu(globaldesc->section_num);
 
-	bt_dev_info(hdev, "HW/SW Version: 0x%04x%04x, Build Time: %s",
-		    le16_to_cpu(hdr->hwver), le16_to_cpu(hdr->swver), hdr->datetime);
+	bt_dev_info(hdev, "BT HW ver: 0x%04x, SW ver: 0x%04x, Build Time: %s",
+		    dev_id & 0xffff, le16_to_cpu(hdr->swver), hdr->datetime);
 
 	for (i = 0; i < section_num; i++) {
 		first_block = 1;
-- 
2.45.2


