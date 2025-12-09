Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C98D1CDC6
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Dec 2025 12:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=biSx7WZ/dzqIzHa74Ww6F9siP+61NLhUlnmYjDzhZbE=; b=T2YrJye6fm3QiMhBcGdoLAShzr
	8v/WvFs2SLzIOh7BKUTAWCAg2drwPpZLg0IPPm469zrWeaXnr78MabNEKYjM5Kmc4QUTqqc4bRfmM
	tDHb24U4pEiis25/hkiu9jXyMe6JKStTHMxBHMlG1xFoKtyzk/oF6Ni+Jcf2/Hivhu0HWtE/QMe3O
	ZV8Bthmt48LTUhxtCu0BrlnWQVArZ681yJuuIhtfVBNZrM/oLSNXMIsBNRIkijq7ZFQj5KsXNOQzl
	TG1BuhDZGLX5SqRlLM2/Zzh51EIFaTTinM91DVzclsa8/nEAQBxr2rMh+3GVi56QvW2f/70BTCzy0
	CbpNJT6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwTr-0000000EE35-3tRv;
	Tue, 09 Dec 2025 12:06:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSwTp-0000000EE2J-1zbG
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Dec 2025 12:06:11 +0000
X-UUID: 6fcf1268d4f711f09f706fa2197c6ceb-20251209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=biSx7WZ/dzqIzHa74Ww6F9siP+61NLhUlnmYjDzhZbE=;
	b=DGAdVkpeTpPLxliFZwMmRsNKZF0YRw3Y6g52gkDVEZtxMhpKVMRcnceuZGvuE8N/mfhGSQ9jm6ovZ+qGAYnAPeCrhVI0bb709GhZWHMsSe9ayqqwbWSUbu28oL1tQRIYmcylJHdqw3jWJgBrUdQ9JVaGuIgIQ11VBCrVHcUhTN4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:a45f7cb6-edcc-4f8b-a6a5-7bf69542cd62,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:2c635328-e3a2-4f78-a442-8c73c4eb9e9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6fcf1268d4f711f09f706fa2197c6ceb-20251209
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1818588769; Tue, 09 Dec 2025 05:06:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 9 Dec 2025 20:06:02 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 9 Dec 2025 20:06:02 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1] Bluetooth: btmtk: Trigger reset on firmware download failure
Date: Tue, 9 Dec 2025 20:05:59 +0800
Message-ID: <20251209120559.2991698-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_040609_524690_71D77335 
X-CRM114-Status: GOOD (  10.26  )
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

Initiate reset flow if MT79xx series BT failed to download firmware when
doing setup.
If driver is not able to get event after reset in the first section of
btmtk_usb_setup, the protocol is deemed unuable and driver will return to
prevent from repeatedly executing resets.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index a8c520dc09e1..8b1443b9e9cf 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1333,7 +1333,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 						btmtk_usb_hci_wmt_sync);
 		if (err < 0) {
 			bt_dev_err(hdev, "Failed to set up firmware (%d)", err);
-			return err;
+			goto reset_fw;
 		}
 
 		/* It's Device EndPoint Reset Option Register */
@@ -1353,7 +1353,7 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 		err = btmtk_usb_hci_wmt_sync(hdev, &wmt_params);
 		if (err < 0) {
 			bt_dev_err(hdev, "Failed to send wmt func ctrl (%d)", err);
-			return err;
+			goto reset_fw;
 		}
 
 		hci_set_msft_opcode(hdev, 0xFD30);
@@ -1444,6 +1444,13 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 	}
 	kfree_skb(skb);
 
+reset_fw:
+	if (btmtk_data->reset_sync) {
+		bt_dev_err(hdev, "Mediatek do firmware reset");
+		btmtk_reset_sync(hdev);
+		return err;
+	}
+
 done:
 	rettime = ktime_get();
 	delta = ktime_sub(rettime, calltime);
-- 
2.45.2


