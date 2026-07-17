Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416D5C44517
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 07:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YW2gaS6U69dZP9vYCKx/O31HNC1xM/JJZ9WUC1PiPt0=; b=VXe6sliVvZF0+Kg9XlRdDDn62k
	IJCqZ9zccf2g1GW0GqRBgWhDVQa126PStd9QkbcJUeFUFHsPiwVyli+ayITrfjPwygQummWDhZ3yj
	hnbYTT7Vx4zwliqxz2KUfD7gTUEvoFyaaIMI9MYszoTISjN/2CtyB19iFrpkAMH8otJgHyShjAMqx
	IBFEkf226CnIwYz7pvehW7ieOOa8Fl2FvS9YkLnyvczBiDwr7kcjb9sYuh86e6pgtl+RWG+5kG4p1
	YBV81l4b354uxfNzvr48wEE3EuOhPc9cpirhCxvw7q3f2OiHlrHhTvqCrz16jNHEqa1tr1VhEzTH8
	dwwMGYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdDO-00000001UTk-0cBW;
	Fri, 17 Jul 2026 07:42:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdDK-00000001UQw-3Sxe
	for linux-mediatek@bombadil.infradead.org;
	Fri, 17 Jul 2026 07:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YW2gaS6U69dZP9vYCKx/O31HNC1xM/JJZ9WUC1PiPt0=; b=G/4VQAkh2HKGVgSYgAUwvRY6uf
	MBJfMPJ8wg9+rdq47DwCfQd6sgPOmYf8GlDRLYOJ55jigK1khzDE/Kg6Y70Bhnd6rt8uetll+JlCv
	jz5h29LjvpF6fANRmQH//jGFvJoxOPtImxBPxt7qluUS5WKTasHeOnBlDGBFBuiv+f8TEPk1UW6Is
	yp4F01vc1I0X9xWvvPTL7FJzEW4FpCP+zcTOU3p/OtN4iLAbTz9BUdk3nEDV2Z0wkjvlazIqPL7aI
	o/Ie333tFvyCsTqC3zhnzJzowL4bmHKmyvNYYjUZaWkDIY/zuz9ypPZSM/88E7/JX11O2BRadl2yK
	cUd4GRFA==;
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdDF-0000000Ecrq-2BJK
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 07:42:29 +0000
X-UUID: 0536bc3081b311f1acbe4559397dec65-20260717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=YW2gaS6U69dZP9vYCKx/O31HNC1xM/JJZ9WUC1PiPt0=;
	b=WatC+6RglOy/j/Z5O3pqhTMhCLculhY8xbckffPS3Vb4l9qIsyZzIke6ju3oVtLUzCccTkFE79gjBbJNsu4g0/FmO7Tnyu5JfjAe8BkNmTPjNy4kDXmseZgyhUG1vgwv+PPYPtUFZfO/3udM0z0+hxqMnM4nmg/GQ3ajv1u/UY8=;
X-CID-CACHE: Type:Local,Time:202607170021-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.18,REQID:d8fa7ffe-f5e9-42fd-aec7-c82ae22ef18f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:8a735a6,CLOUDID:4928f450-9df4-4a32-98eb-0af8dcdad6c0,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0536bc3081b311f1acbe4559397dec65-20260717
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 252731366; Fri, 17 Jul 2026 00:42:11 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Jul 2026 15:42:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 17 Jul 2026 15:42:08 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, Paul Menzel
	<pmenzel@molgen.mpg.de>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v15 3/7] Bluetooth: btmtksdio: Pass hardware dev_id to mt79xx_setup()
Date: Fri, 17 Jul 2026 15:42:02 +0800
Message-ID: <20260717074207.2869999-4-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260717074207.2869999-1-chris.lu@mediatek.com>
References: <20260717074207.2869999-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_084226_052608_817FA06F 
X-CRM114-Status: GOOD (  11.80  )
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

mt79xx_setup() hardcodes dev_id=0 when calling btmtk_setup_firmware_79xx(),
causing SDIO devices to log incorrect chip ID "BT HW ver: 0x0000" instead
of the actual hardware version read from register 0x70010200.

Pass the hardware dev_id to mt79xx_setup() and forward it to
btmtk_setup_firmware_79xx() to match USB driver behavior and display
correct chip identification.

Fixes: 28b7c5a6db74 ("Bluetooth: btmtk: Add MT6639 (MT7927) Bluetooth support")
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 42cb0bbb720f..1fdc24545e41 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -912,14 +912,14 @@ static int mt76xx_setup(struct hci_dev *hdev, const char *fwname)
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
@@ -1178,7 +1178,7 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 		snprintf(fwname, sizeof(fwname),
 			 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
 			 dev_id & 0xffff, (fw_version & 0xff) + 1);
-		err = mt79xx_setup(hdev, fwname);
+		err = mt79xx_setup(hdev, fwname, dev_id);
 		if (err < 0)
 			return err;
 
-- 
2.45.2


