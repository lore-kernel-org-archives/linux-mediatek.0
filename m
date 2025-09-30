Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4086CAC5B9
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Sep 2025 05:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NvsO9T4H7Ag6wzXS0PXVlhDNJ8GuyE8WgvH3PAzr4T4=; b=rCm4e75nZPR4axr7vBvshi2d0Z
	OnBNEpPq1NGPyoE8ElzRTJkTZkrVb7cgk6gm26VglJYpeDwGX9D4HTNFEPjTnCPMEelGtt9oatKNK
	dQ094XuqLBi6EJkWwfYCJR5TmvAzHQWxuaa6PcBMqk9MU3DAfj62RAXeTvLlL0NsVqfLUlQmmItPo
	gTxy1Y0wDOAUw1FijI5XBgpJHCJwR/YfItABjIFS4BsqhzwUYAAFjsoCSgpx6CCCDl2U9C6hPM3FS
	Fee2D8Cdpg5/KKyaOXjdunx1VdkWwUQPn/qabJeWEbX13muzc3mWgHRNLTIFINzX4QTuizw6khZSZ
	+bz2xFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3T5W-00000004GNH-0kLL;
	Tue, 30 Sep 2025 05:39:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3T5U-00000004GMM-0afL
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Sep 2025 05:39:45 +0000
X-UUID: dacfe4f89dbf11f09f706fa2197c6ceb-20250929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NvsO9T4H7Ag6wzXS0PXVlhDNJ8GuyE8WgvH3PAzr4T4=;
	b=YbPtVfvofccXGAxs8qE8tQHwvFAV3XTceaSBMwE0DfLJm0FATs70lmA2QEECsVhHwzaCgaPLdfUFOnaZWX630CtMgLRxHz9Vte26qYNNynGQBxXYdsxAvcl7VCW9fIcllHmaj26t9CSUFVf7Ov+vZqol0bvcd2tHYfi24Wu8Kpk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:95b6eef6-965d-4057-b1f5-f7ab7ba4b5dd,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:700b146d-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
	0,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dacfe4f89dbf11f09f706fa2197c6ceb-20250929
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 743139868; Mon, 29 Sep 2025 22:39:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 30 Sep 2025 13:39:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 30 Sep 2025 13:39:34 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1] Bluetooth: btmtksdio: Add pmctrl handling for BT closed state during reset
Date: Tue, 30 Sep 2025 13:39:33 +0800
Message-ID: <20250930053933.1685847-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_223944_190694_86241F0D 
X-CRM114-Status: GOOD (  10.19  )
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

This patch adds logic to handle power management control when the
Bluetooth function is closed during the SDIO reset sequence.

Specifically, if BT is closed before reset, the driver enables the
SDIO function and sets driver pmctrl. After reset, if BT remains
closed, the driver sets firmware pmctrl and disables the SDIO function.

These changes ensure proper power management and device state consistency
across the reset flow.

Fixes: 8fafe702253d ("Bluetooth: mt7921s: support bluetooth reset mechanism")
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 50abefba6d04..62db31bd6592 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1270,6 +1270,12 @@ static void btmtksdio_reset(struct hci_dev *hdev)
 
 	sdio_claim_host(bdev->func);
 
+	/* set drv_pmctrl if BT is closed before doing reset */
+	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state)) {
+		sdio_enable_func(bdev->func);
+		btmtksdio_drv_pmctrl(bdev);
+	}
+
 	sdio_writel(bdev->func, C_INT_EN_CLR, MTK_REG_CHLPCR, NULL);
 	skb_queue_purge(&bdev->txq);
 	cancel_work_sync(&bdev->txrx_work);
@@ -1285,6 +1291,12 @@ static void btmtksdio_reset(struct hci_dev *hdev)
 		goto err;
 	}
 
+	/* set fw_pmctrl back if BT is closed after doing reset */
+	if (!test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state)) {
+		btmtksdio_fw_pmctrl(bdev);
+		sdio_disable_func(bdev->func);
+	}
+
 	clear_bit(BTMTKSDIO_PATCH_ENABLED, &bdev->tx_state);
 err:
 	sdio_release_host(bdev->func);
-- 
2.45.2


