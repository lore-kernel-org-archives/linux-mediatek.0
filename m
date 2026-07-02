Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C8FC43327
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 10:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/cTAXxiF3k07rNmAgKvsKAUCLozevrZSLPZeWFNbt0=; b=SSzRSAr3agFuxqzmkZPMr66pBg
	EbsqiXNfzIfvNZ9LZPUPhRpFukDSQLY6I4mfBou9ZE+B0ku0WrbUNpG41gxS1U2gcCVKlVUfKcdE5
	sFnCAlpmWfkhwtHMWzCQK/FgJ16lIlFGnfdrFRxPUOf8wdiGkagDaYVV3lU9ET5VJfSeRCCMZcUFy
	911OBq42tz6OHIrwq6aDoEm4bFClsLLjhMyiJzPzgX7WdE32il//aqUGnPg/8g7SygLJyDE3zjiC2
	p76havHOj7PwnhwCmZ6+9nHnEiz6zzy903hgf2Swdc3wPqt3W0BU6PUEiqPDFZrc/4RjCi5i+O6ip
	9Mgrq7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfERf-000000049Ii-2yBz;
	Thu, 02 Jul 2026 10:14:59 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfERe-000000049Ha-0zf0
	for linux-mediatek@bombadil.infradead.org;
	Thu, 02 Jul 2026 10:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=f/cTAXxiF3k07rNmAgKvsKAUCLozevrZSLPZeWFNbt0=; b=WuKZnu4kfZ9enxb4dG7t5NQSgU
	SZ7cOaOjnYJ3NOaroteU/NvF6gsXOqeg+ft9Qc0t9FjKRWSSXPZfJSwRn3XDEWT1ptqvOt6n4XQUz
	3NFS0FSBIGyjqCXmXDxS8xIJViGQiCKE/1YtnFX5qaWAMQkLWoBPrkCFExCdI0DX7CejtEssyMePs
	6dPLeBD2qzVnRqMu7B4DvjSm+hNSurNjT0lwmHmTYbbuEvoIBdfqoYE95jD+X3kwW2QFqvmZauIYl
	Hy4IDcMqk2jtn4kfJTeSpHbqAgllC8pS/nVb35gaaznciAl4di7Jf+F2OllqHFKq8SukHSfsofutW
	z4s4QPRw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfERW-00000003f6t-3PuP
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 10:14:55 +0000
X-UUID: d73065e475fe11f1acbe4559397dec65-20260702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=f/cTAXxiF3k07rNmAgKvsKAUCLozevrZSLPZeWFNbt0=;
	b=BcZ+vbKsOVvMp7wCA/j09SMHa+0qdswIBchUtOO0Yhs/SAe4y5Ecl2atYZ7oD3AxS1+sjxpIeGs7UBVOGQ2dovPALkIk6jfhVzPdRJNR74Xh2zW9omF5herJ2JGm7TRzxbuG0VKZb7QDsByaRiIc3lO6pr4orwpvUirRooRm4Oc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:f4c8f826-990d-4dde-b6f8-34a3d2a5203c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:2f87e6ee-6085-4bd7-b32c-8f3a894d1f02,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d73065e475fe11f1acbe4559397dec65-20260702
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1518266691; Thu, 02 Jul 2026 03:14:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 2 Jul 2026 18:14:39 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 2 Jul 2026 18:14:39 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
	Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v9 5/6] Bluetooth: btmtk: Improve BT firmware logging
Date: Thu, 2 Jul 2026 18:14:35 +0800
Message-ID: <20260702101437.1787800-6-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260702101437.1787800-1-chris.lu@mediatek.com>
References: <20260702101437.1787800-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_111452_247258_1873F832 
X-CRM114-Status: GOOD (  11.52  )
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


