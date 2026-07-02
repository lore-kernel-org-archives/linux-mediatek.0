Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC04AC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 10:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvPzzYgdsI6hzQFntS+aNcNbUKBlE/jO+QBUpU/64ao=; b=n/vgKzBNUKAvRTDbX+yOlMTmsW
	o4bLc0uzmm44MHpo1N5BiVBqZzXZGwZVLWBINgu5I9x6j0Cock+HOa3bzu5XWCayjVfxSq7FXlBhZ
	7QUzTONTzgrnskLMMKRHFBof3tNhl2ReVvVz4srABubxL+Sm/HtN18eS25c6BrY11DhDdId/DmwMe
	ep7A+PDNrJ562CfXCwReaWDJmn6JNdeoneey1hIChkw/ooU+8lhJEA7oLM0/X/NVOOtDuf+bwoiNY
	jOIuEv/xIc6vu8UYD4896KlC1o6QOzYQjtaOjiECHx3JW3JdH3vJlunNMbTgVwdXNRGaMVJ6vTTu+
	Jvt7RyIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfERf-000000049IX-2XHA;
	Thu, 02 Jul 2026 10:14:59 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfERd-000000049HU-3wlE
	for linux-mediatek@bombadil.infradead.org;
	Thu, 02 Jul 2026 10:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uvPzzYgdsI6hzQFntS+aNcNbUKBlE/jO+QBUpU/64ao=; b=InHl19gPjNAWYalHkaVVHMKmEN
	QftMylXkoSEpLTmLcr8dqBZMpzfTd6mmK6/ZQrowdr5X3Vdf2b924AkaSa6VXO+bZmslEyzPSbKjK
	Y7Gd1afpHwNzm+w2bKw/xAY7swG7b4kxRspnykV84mYvP9cwRl2PEw0F9F8HyWmnZSNSJzPGOAuoU
	QTCxRYSfwcGy/DG1HWjC1etw3kjShVEiV3w2EIht+s8B6QJQ0c8+iA+84c7zqXT7FFfIZD/yX4auk
	dpSaF1S0+g+lxatqUtnDcGR0DztTkftCTtSfckGPpPO5wyH1jefz4N0ysuwNxyH6QsdkMP/ymquUW
	tMdwQslA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfERW-00000003f6p-3MdG
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 10:14:54 +0000
X-UUID: d70aaea875fe11f1acbe4559397dec65-20260702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uvPzzYgdsI6hzQFntS+aNcNbUKBlE/jO+QBUpU/64ao=;
	b=jC3CCi7v4uBs5z9NwmtotM2O3czAJ0svGLlO8X6v8q5Su55fdzLldJNmpzjdfU/TW3eYAI9kMN7oYNSuy86PqR+bzpual6uTc9rjJvd74lemhzl90jNPYwCjqHhivodp6tkdLXCpwteqr3xNf7Xxit7Hz7+nypLU6KbetGQg2HI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:30637fb2-4d24-4ec6-abcb-6f46ac7b086a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d497b38,CLOUDID:3187e6ee-6085-4bd7-b32c-8f3a894d1f02,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d70aaea875fe11f1acbe4559397dec65-20260702
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 121710598; Thu, 02 Jul 2026 03:14:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 2 Jul 2026 18:14:38 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 2 Jul 2026 18:14:38 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
	Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v9 3/6] Bluetooth: btmtksdio: Pass hardware dev_id to mt79xx_setup()
Date: Thu, 2 Jul 2026 18:14:33 +0800
Message-ID: <20260702101437.1787800-4-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260702101437.1787800-1-chris.lu@mediatek.com>
References: <20260702101437.1787800-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_111452_186573_BA5112A5 
X-CRM114-Status: GOOD (  12.31  )
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
index d5f3fd002f85..3e9f143e2bf5 100644
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
@@ -1139,7 +1139,7 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 		btmtk_fw_get_filename(fwname, sizeof(fwname), dev_id,
 				      fw_version, 0);
 
-		err = mt79xx_setup(hdev, fwname);
+		err = mt79xx_setup(hdev, fwname, dev_id);
 		if (err < 0)
 			return err;
 
-- 
2.45.2


