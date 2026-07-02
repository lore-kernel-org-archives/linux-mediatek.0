Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F57C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 07:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrLmXw2+grSg8BDLzNZP31Z2rCqGp6CpomTh+kmD5Sk=; b=YpyAV56EbVkfAKhaxAyuu2pqhI
	IixNzEwFroU1P+oKGXAw3EFYmwu9VH2zzrddcH/Md/lkNefBh0NJvGyPo6xkvJo40JCqB4m6ctkj1
	sYBKEB6ABEfuWlWjfTpbfKhq73ZZnsaozCbVjlo8P/OIgMtL8fNV/AXvpYauAVEiVvBluDdFOZnL0
	wmpgzONoVKB1U79Md/DRXU/mahFd1eu5Vki0JhvXX+A5T5EhETW8+qO5/bXEBm2a+2x9S27Vfoi2l
	2db8awghVlqbQtLs1K7kzQ2Nqegz3EApodrxeUZ2riTbZu6SH7xw5HG0wMNhSB3uKjfMW6cRATF3m
	61yJWK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBqq-00000003jo0-1nfa;
	Thu, 02 Jul 2026 07:28:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBqo-00000003jnV-3OhN
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 07:28:47 +0000
X-UUID: a8544a4075e711f1afed4741b24580c9-20260702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NrLmXw2+grSg8BDLzNZP31Z2rCqGp6CpomTh+kmD5Sk=;
	b=B9rPZ4DZu4QrkI08d+bdttR4jRaS08zbzRd40/9wx87Nd4LQQCS8RnQMrMlZBlQ6Fxgq8iWE2uM7eQX0yDJ5l7umh6TXq3bJNRgvEpFqF+LCKoH2g5p0vBmyrgzenKxy7UpOibpJ8FMFheCYrSxNRIwkNmhdHb4QQMP095Bd3D8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:2766b471-1f12-42b3-8848-eed86e196744,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d497b38,CLOUDID:2d40e781-6310-4e6b-a6b1-aca20d98ed8b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a8544a4075e711f1afed4741b24580c9-20260702
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 880649696; Thu, 02 Jul 2026 00:28:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
Subject: [PATCH v8 1/5] Bluetooth: btmtk: Add firmware size validation in btmtk_setup_firmware_79xx()
Date: Thu, 2 Jul 2026 15:28:36 +0800
Message-ID: <20260702072840.1712057-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260702072840.1712057-1-chris.lu@mediatek.com>
References: <20260702072840.1712057-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_002846_851921_335FA5DF 
X-CRM114-Status: GOOD (  11.98  )
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

Add firmware size validation to prevent out-of-bounds access when loading
truncated or malicious firmware files.

Add three levels of validation:
1. Minimum size check for header and global descriptor
2. Section map bounds check with integer overflow protection using
   check_mul_overflow() and check_add_overflow()
3. Section data bounds check before accessing each section

This matches the validation approach used in btmtk_load_cbmcu_firmware().

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Assisted-by: Claude:Sonnet-4.5
---
 drivers/bluetooth/btmtk.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 02a96342e964..3491060b3ae9 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -145,6 +145,7 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 	int err, dlen, i, status;
 	u8 flag, first_block, retry;
 	u32 section_num, dl_size, section_offset;
+	size_t expected_size;
 	u8 cmd[64];
 
 	err = request_firmware(&fw, fwname, &hdev->dev);
@@ -153,12 +154,40 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 		return err;
 	}
 
+	/* Validate minimum firmware size for header and global descriptor */
+	if (fw->size < MTK_FW_ROM_PATCH_HEADER_SIZE + MTK_FW_ROM_PATCH_GD_SIZE) {
+		bt_dev_err(hdev, "Firmware file too small: size=%zu, expected at least %u bytes",
+			   fw->size, MTK_FW_ROM_PATCH_HEADER_SIZE + MTK_FW_ROM_PATCH_GD_SIZE);
+		err = -EINVAL;
+		goto err_release_fw;
+	}
+
 	fw_ptr = fw->data;
 	fw_bin_ptr = fw_ptr;
 	hdr = (struct btmtk_patch_header *)fw_ptr;
 	globaldesc = (struct btmtk_global_desc *)(fw_ptr + MTK_FW_ROM_PATCH_HEADER_SIZE);
 	section_num = le32_to_cpu(globaldesc->section_num);
 
+	/* Check for potential integer overflow in size calculation */
+	if (check_mul_overflow((size_t)MTK_FW_ROM_PATCH_SEC_MAP_SIZE,
+			       (size_t)section_num, &expected_size) ||
+	    check_add_overflow(expected_size,
+			       (size_t)(MTK_FW_ROM_PATCH_HEADER_SIZE +
+					MTK_FW_ROM_PATCH_GD_SIZE),
+			       &expected_size)) {
+		bt_dev_err(hdev, "Firmware size calculation overflow (section_num=%u)",
+			   section_num);
+		err = -EINVAL;
+		goto err_release_fw;
+	}
+
+	if (fw->size < expected_size) {
+		bt_dev_err(hdev, "Firmware truncated: size=%zu, expected=%zu (section_num=%u)",
+			   fw->size, expected_size, section_num);
+		err = -EINVAL;
+		goto err_release_fw;
+	}
+
 	bt_dev_info(hdev, "HW/SW Version: 0x%04x%04x, Build Time: %s",
 		    le16_to_cpu(hdr->hwver), le16_to_cpu(hdr->swver), hdr->datetime);
 
@@ -171,6 +200,16 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 		section_offset = le32_to_cpu(sectionmap->secoffset);
 		dl_size = le32_to_cpu(sectionmap->bin_info_spec.dlsize);
 
+		/* Validate section boundaries to prevent out-of-bounds access */
+		if (dl_size > 0 &&
+		    (section_offset > fw->size ||
+		     dl_size > fw->size - section_offset)) {
+			bt_dev_err(hdev, "Section %d out of bounds: offset=%u, size=%u, fw_size=%zu",
+				   i, section_offset, dl_size, fw->size);
+			err = -EINVAL;
+			goto err_release_fw;
+		}
+
 		/* MT6639: only download sections where dlmode byte0 == 0x01,
 		 * matching the Windows driver behavior which skips WiFi/other
 		 * sections that would cause the chip to hang.
-- 
2.45.2


