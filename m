Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42FFC369D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Apr 2025 01:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHg++wVwu7rAWNcnfLB+Cxv53wQgr8/KD3uyGZpAuJI=; b=Qji4Hucy4BMQRLEGfYYnBrLZ/L
	a6vVRk2lMp5wDutllOGwJizrSriMDvjZ6GKlz3ry3OaQHKoMhyTBHQ9KGHSEgs0ARIfSyiC7Be9UD
	BK5EY7CQiolbYYZIt6blbs0in8l3M1X4IHiH2NCinttgeRB7kAd6RZguDebdFBe7mLKz0c3BooDwQ
	6hmxH3PFFhJjXFppgnqPoLhlFuUrWn+JEkg2jOUFXhMBX3iomF7l9u2Zm7vjDoPr0/RVkbLUrdR+G
	93Tjx+f1nG50SypcgE4EPRyo2AA6ieB15slDRoHyge25eborqybc9Mz4E3HZGjnB7ZdcHS9KSUS41
	l7XHuwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u72Ky-00000005VbT-2TBh;
	Tue, 22 Apr 2025 01:22:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u72Kv-00000005Va8-1xqr
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Apr 2025 01:22:10 +0000
X-UUID: 334e40101f1811f0a2405d5ef59ce188-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LHg++wVwu7rAWNcnfLB+Cxv53wQgr8/KD3uyGZpAuJI=;
	b=pIH6BJOIXNHV/g20gxu3KbmF5vNBL0r8vaO1Xp3QpzQyrWu3EcT3b7FlPuWjYnFhBmVvG2VNtOzFT8qdmAgMDvsWgm2t7BF4rgrRDrOcZTzFPglAWsfqewBsla30aExdYntqmf0ByMjZT1CnTqmmGClGR08M1NayXnnMiBTHVxE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:3097bf23-f834-4d3c-af5f-3aec38b78c2e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:5b5b58a6-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 334e40101f1811f0a2405d5ef59ce188-20250421
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1289200925; Mon, 21 Apr 2025 18:22:04 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 22 Apr 2025 09:22:02 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 22 Apr 2025 09:22:02 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>,
	Will Lee <will-cy.lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, Steve Lee
	<steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v2 2/2] Bluetooth: btmtksdio: Do close if SDIO card removed without close
Date: Tue, 22 Apr 2025 09:21:56 +0800
Message-ID: <20250422012156.586600-3-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250422012156.586600-1-chris.lu@mediatek.com>
References: <20250422012156.586600-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_182209_505925_116ADA30 
X-CRM114-Status: GOOD (  11.33  )
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

To prevent Bluetooth SDIO card from be physically removed suddenly,
driver needs to ensure btmtksdio_close is called before
btmtksdio_remove to disable interrupts and txrx workqueue.

Fixes: c4233afb9a ("Bluetooth: btmtksdio: Prevent enabling interrupts after IRQ handler removal")
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 3c66e3ee9834..c16a3518b8ff 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1447,11 +1447,15 @@ static void btmtksdio_remove(struct sdio_func *func)
 	if (!bdev)
 		return;
 
+	hdev = bdev->hdev;
+
+	/* Make sure to call btmtksdio_close before removing sdio card */
+	if (test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
+		btmtksdio_close(hdev);
+
 	/* Be consistent the state in btmtksdio_probe */
 	pm_runtime_get_noresume(bdev->dev);
 
-	hdev = bdev->hdev;
-
 	sdio_set_drvdata(func, NULL);
 	hci_unregister_dev(hdev);
 	hci_free_dev(hdev);
-- 
2.45.2


