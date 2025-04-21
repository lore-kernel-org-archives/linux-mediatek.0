Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88F2C369D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 07:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNLj/lN7HRdU9b8T6OoRgK6K9Hit6qc0dyL5GhQNar8=; b=2Q3ZuvXl3jKKPpLssUZY1Su/X7
	9buZKixyhwHWaY7zIP/8v4761JKoDeAOLi5qztISKisHV4plu393MMR6RQ81Vf89zmaqGiVDDhoq0
	YGWrItklY7qwNNYApygGUOlFJuVCb6CjehP9Wt7u3+ZEtevfTEte3poby64UhF0qszrHlJSr0YLNs
	BARtRdoph/yx8eZYa4pmUhsTwo1QyFRoZ9x/W/CjdWHhwb5wX2ZAxqpzAWnx7AyzDY19XNnTmkF2T
	ZE5z7isxhg74737TL7NS5tR44NB7TdBI/x2E3ngkaBI7BLEIlizJvfsU2g9llHEeyEfG33xCzD3KJ
	eRUEPWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lca-00000003nbQ-3aXS;
	Mon, 21 Apr 2025 07:31:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6lan-00000003nJ8-38Lf
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Apr 2025 07:29:26 +0000
X-UUID: 57bc51bc1e8211f0b1a74d0c5e11a509-20250421
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kNLj/lN7HRdU9b8T6OoRgK6K9Hit6qc0dyL5GhQNar8=;
	b=pP9lVF5MbrGQ1hrLILBE41O1aXPEZDIrKH9O7DdWkN12BTEkqO2I15m/7AgLPmui4J0ezyPNxnBp2HZPNoQfguLPqfb9rd4aeRhZPVclQJuJHHapQLlfjxZtqWQrtnWMxKLviqrc1p0cHlFeZZEM4pfXHHxAWJyViBJn7Rcy99c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:dcfd5f89-e601-48ca-b8ec-8528d0de6c34,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:7339d0c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 57bc51bc1e8211f0b1a74d0c5e11a509-20250421
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 739867520; Mon, 21 Apr 2025 00:29:21 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 21 Apr 2025 15:29:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 21 Apr 2025 15:29:18 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Jiande Lu <jiande.lu@mediatek.com>,
	Will Lee <will-cy.lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>, Steve Lee
	<steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1 1/2] Bluetooth: btmtksdio: Check function enabled before doing close
Date: Mon, 21 Apr 2025 15:29:13 +0800
Message-ID: <20250421072914.466092-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421072914.466092-1-chris.lu@mediatek.com>
References: <20250421072914.466092-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_002925_793848_6FF82738 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

Check BTMTKSDIO_FUNC_ENABLED flag before doing close to prevent
btmtksdio_close been called twice.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 566c136e83bf..3c66e3ee9834 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -723,6 +723,10 @@ static int btmtksdio_close(struct hci_dev *hdev)
 {
 	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
 
+	/* Skip btmtksdio_close if BTMTKSDIO_FUNC_ENABLED isn't set */
+	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
+		return 0;
+
 	sdio_claim_host(bdev->func);
 
 	/* Disable interrupt */
-- 
2.45.2


