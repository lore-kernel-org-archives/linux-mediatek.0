Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7650C44501
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 07:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkFUJifpybKz0LfV4Z4vncqravLYtZw0TyRRPfXkG9E=; b=4mg5N6WVQuQrPADqi3G0XlopI0
	4dARl4qFF+8IzRArxRPzG+jYDabS/pyUKrtvCmyiXz2Pn6szsKNx9C4MHte/DYbaOhj4RvyP6ySTa
	dt+2PG2p6FnfYgvJ4OeMcKChUZYZwbiRLMXOvQksQ+x0KZLfd/B7TyexzfkUm8pryIDapKGjBjNjc
	M8aSRTts3a65ftfth6xqRVoqv4DhNA1QHl6W84cdzMNKPeYQe8w51Gi7ahVxbDdL76OcYj4n51dt7
	/hQ2Gkw4fhw7muOFiNSpdAeoHM4XN8f2RbPXRiGTLhmQZvrgPdlvdIbbvFDOxhip1SUKBNe937iCt
	J8hU+J3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBqw-00000003jtI-07U2;
	Thu, 02 Jul 2026 07:28:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBqt-00000003jpk-1Q8x
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 07:28:52 +0000
X-UUID: a86aa70475e711f1acbe4559397dec65-20260702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=bkFUJifpybKz0LfV4Z4vncqravLYtZw0TyRRPfXkG9E=;
	b=l8yGpp3jWWYXtDuuzgk13pIU92i8xlcSb+nkgk1i1HbZ7Ndoeck4IO+9ksYbSs9ASVOwZSSxKnYRaw7uVMPs8uvcNr+McZkaBn2Luzi3kLtL8RUIaeeB/WYtPtP2gFT7USCx8cZGc5H6lz9vUhBRhjqxC881TEVArl7ob2yMZ70=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:bfb69ffc-6115-43f4-90cb-eced1d209f22,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d497b38,CLOUDID:8109e5ee-6085-4bd7-b32c-8f3a894d1f02,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a86aa70475e711f1acbe4559397dec65-20260702
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1388739694; Thu, 02 Jul 2026 00:28:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
Subject: [PATCH v8 2/5] Bluetooth: btmtksdio: Pass hardware dev_id to mt79xx_setup()
Date: Thu, 2 Jul 2026 15:28:37 +0800
Message-ID: <20260702072840.1712057-3-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260702072840.1712057-1-chris.lu@mediatek.com>
References: <20260702072840.1712057-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_002851_407600_D04082EF 
X-CRM114-Status: GOOD (  13.58  )
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

Pass the device ID read from hardware register (0x70010200) to
mt79xx_setup() instead of hardcoded 0, ensuring SDIO devices display
the correct chip ID in firmware logs.

This matches the USB driver behavior which reads from the same hardware
register. The hardware register is the authoritative source for chip
identification, superior to using the static chipid from device table.

Fixes: 28b7c5a6db74 ("Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support")
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Assisted-by: Claude:Sonnet-4.5
---
 drivers/bluetooth/btmtksdio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 5b0fab7b89b5..c90b3fa8ba5a 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -876,14 +876,14 @@ static int mt76xx_setup(struct hci_dev *hdev, const char *fwname)
 	return 0;
 }
 
-static int mt79xx_setup(struct hci_dev *hdev, const char *fwname)
+static int mt79xx_setup(struct hci_dev *hdev, const char *fwname, u32 dev_id)
 {
 	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
 	struct btmtk_hci_wmt_params wmt_params;
 	u8 param = 0x1;
 	int err;
 
-	err = btmtk_setup_firmware_79xx(hdev, fwname, mtk_hci_wmt_sync, 0);
+	err = btmtk_setup_firmware_79xx(hdev, fwname, mtk_hci_wmt_sync, dev_id);
 	if (err < 0) {
 		bt_dev_err(hdev, "Failed to setup 79xx firmware (%d)", err);
 		return err;
@@ -1142,7 +1142,7 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 		snprintf(fwname, sizeof(fwname),
 			 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
 			 dev_id & 0xffff, (fw_version & 0xff) + 1);
-		err = mt79xx_setup(hdev, fwname);
+		err = mt79xx_setup(hdev, fwname, dev_id);
 		if (err < 0)
 			return err;
 
-- 
2.45.2


