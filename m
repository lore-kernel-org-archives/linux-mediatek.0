Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0387C369AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 07:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVirZaX7mqDjLeR4gMWjacsh/SmBHOzvxK+omyEcQhA=; b=w6ZIILDXlzYsxjtg9jwWEKFoeO
	TpJ18v5T2mwJQjrRGIVB14jKFmlkT8ZYMv9G8q/q8X3FErV12GPLa6NQsSjx+vu7JXa2OAZ0FNs7O
	6nLeApFO98bhyv9xmCwPulEuNAJd6DIyhOcl4oTsfAxkXi07yf67zuNfVJdHgo3cydXpAq9YdQbYk
	/zLg/miX/WMr7hSaLiCbO+hfiqXFgpDSEjWc2B6wjzDPphy7HCXFI2xDRSK3Yyg+gwwfDLoRyzPCB
	G39e8zYKV6H+4qh9nN8tGj+lOvLWHeJGSkfrA43Taws4LrDrLFJWgKt7DMQqXBrEIQfkITLe+nRNj
	WoMTxcIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lpX-00000003p8L-3SjL;
	Mon, 21 Apr 2025 07:44:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lpW-00000003p7n-0yNu
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 07:44:39 +0000
X-UUID: 588f75b01e8211f0b1a74d0c5e11a509-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MVirZaX7mqDjLeR4gMWjacsh/SmBHOzvxK+omyEcQhA=;
	b=Yxms9N0oPngqv0fZExw8/nmeYtcNkPhUEVR8TXPzXwbG5lFF2NHc9Jx2hpReiJFhj2k2Sojgj+oK9U+BRYUxt16cuXUTZLnJMBqh/JYGPIs+MoPpoPAhFk2XAKz+5eEk9H2J5ej0gJa+MTe1OLr2OZHAOdxg4L76uSyDv0/eq/A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:16b1f686-c147-4ac1-948b-51f213e9fbe5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:6d05d98d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 588f75b01e8211f0b1a74d0c5e11a509-20250421
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1802200245; Mon, 21 Apr 2025 00:29:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 15:29:20 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 15:29:20 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>,
	Will Lee <will-cy.lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, Steve Lee
	<steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1 2/2] Bluetooth: btmtksdio: Do close if SDIO card removed without close
Date: Mon, 21 Apr 2025 15:29:14 +0800
Message-ID: <20250421072914.466092-3-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421072914.466092-1-chris.lu@mediatek.com>
References: <20250421072914.466092-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_004438_285647_6F63B57C 
X-CRM114-Status: GOOD (  10.39  )
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

To prevent Bluetooth SDIO card from being physically removed suddenly,
driver needs to ensure btmtksdio_close is called before btmtksdio_remove
to disable interrupts and txrx workqueue.

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


