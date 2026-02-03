Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C72E8305A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Feb 2026 06:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llw5nIPmtNh9wxl3XcFeQkmLz9EI/2RnjokuZ1CWD6s=; b=GOZGhTXHCNhSU9wquYIQAfRkBc
	QWDcS1UHDuhLHo7Hw5/hSi4SRbqyh2mdnpBKtEEuNDqjfdJepxwffT/fwQxiU5PbRYefrtOEYI8kS
	Hm0tTj02TPkXxdow9m4gQ0TP3KXwfMRjZxTm4plZIJDXpwidtoSnB0LoQb2kh4yTDLC4NyvlibW27
	sVlzA1be2TXdRhx9sDAKFxhj0md5WRpC6ApA5+0vszhcy0l1Tj8TlrJmBkmFI2OEKUtfhVwPoL+A0
	59Lc0l9/Si5EsUaW+yHpjPNgD25n0WUKHeySeQ56cJc8WKuw/iWwFC7f6Zv6GnMeP9ru1rlJesnbW
	IwnVDXAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9qo-00000006BNK-0kAC;
	Tue, 03 Feb 2026 06:25:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9qk-00000006BKu-2lF2
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Feb 2026 06:25:24 +0000
X-UUID: 1a2a408200c911f1a16f0188aa809bee-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=llw5nIPmtNh9wxl3XcFeQkmLz9EI/2RnjokuZ1CWD6s=;
	b=FrCaN6kwZGOnMpt8pjs3IvC0XTUXpkW0AbQsEQW4O5HHS+4EEe6SoK10uUIfaHQgXfvRr2FOsZ5W1xLUNsK8ZKzUGarM12TW8CacuUH49TwtYkqy875ZAmbxfWvs9BrZEeDLlaC4Z++o9Dy3X8Y57FWdQZxEpO2h0ZtXhdQqg5c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:dd490209-b75e-4564-9458-dcb710e41fc5,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:50b63fe9-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1a2a408200c911f1a16f0188aa809bee-20260202
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1987637783; Mon, 02 Feb 2026 23:25:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Feb 2026 14:25:12 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Feb 2026 14:25:12 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1 3/3] Bluetooth: btmtk: Add reset mechanism if downloading firmware failed
Date: Tue, 3 Feb 2026 14:25:10 +0800
Message-ID: <20260203062510.848761-4-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260203062510.848761-1-chris.lu@mediatek.com>
References: <20260203062510.848761-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_222522_716383_D20E613B 
X-CRM114-Status: GOOD (  11.85  )
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

Add a new flag 'BTMTK_FIRMWARE_DL_RETRY'.
If an error occurs during mt79xx firmware download process, this flag
will be set and cleared after a reset. If the flag is already set and
firmware still cannot be loaded successfully after a reset, no further
reset attempts will be made. In other words, if there is a problem during
firmware download, only one reset will be attempted.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 6 ++++++
 drivers/bluetooth/btmtk.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 67db5a48c3e4..14e2f4100806 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1344,6 +1344,9 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 		err = btmtk_setup_firmware_79xx(hdev, fw_bin_name,
 						btmtk_usb_hci_wmt_sync);
 		if (err < 0) {
+			/* retry once if setup firmware error */
+			if (!test_and_set_bit(BTMTK_FIRMWARE_DL_RETRY, &btmtk_data->flags))
+				btmtk_reset_sync(hdev);
 			bt_dev_err(hdev, "Failed to set up firmware (%d)", err);
 			return err;
 		}
@@ -1371,6 +1374,9 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 		hci_set_msft_opcode(hdev, 0xFD30);
 		hci_set_aosp_capable(hdev);
 
+		/* Clear BTMTK_FIRMWARE_DL_RETRY if setup successfully */
+		test_and_clear_bit(BTMTK_FIRMWARE_DL_RETRY, &btmtk_data->flags);
+
 		/* Set up ISO interface after protocol enabled */
 		if (test_bit(BTMTK_ISOPKT_OVER_INTR, &btmtk_data->flags)) {
 			if (!btmtk_usb_isointf_init(hdev))
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 5df7c3296624..b9df2b8f0627 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -147,6 +147,7 @@ enum {
 	BTMTK_HW_RESET_ACTIVE,
 	BTMTK_ISOPKT_OVER_INTR,
 	BTMTK_ISOPKT_RUNNING,
+	BTMTK_FIRMWARE_DL_RETRY,
 };
 
 typedef int (*btmtk_reset_sync_func_t)(struct hci_dev *, void *);
-- 
2.45.2


