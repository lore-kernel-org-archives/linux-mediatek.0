Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77D6C43602
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 10:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FS8ZuGbtx7XSHcIDnYb6SgVIskYUkywIHIvXuN1DJro=; b=mT7cX+wyjZxfutd+9WaRcfZXbg
	877iCLprudHiODY9oMk70Dy/k1tOgpieYBj9rWvFSjIre2OKHZ7OV42YHbzN27mPPfba/Zd+zq84X
	MMvxEaLBYUfBAMsNXunSTJ74s1X184zhmuR8x1bIsHLLjmbdbNwIjn8EBUyHqYZXMaQlBm+5raZQB
	iHoXPMNBVqLP2Z3PVdxdyeySdr+FeKCFauEtfjQCEMb2PhKjNB66fNaAJFzWJucrALnXHKyZ/lCAD
	OxvvgW+Uyyil5ixZnZlN0wD4HRVvi7um/U+0zf+mnQXQJviVhWUH0FkVgCybfqCR0/JzfmPXycd0S
	AzhIb0GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfERf-000000049Iy-40hY;
	Thu, 02 Jul 2026 10:14:59 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfERe-000000049HZ-0uqS
	for linux-mediatek@bombadil.infradead.org;
	Thu, 02 Jul 2026 10:14:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FS8ZuGbtx7XSHcIDnYb6SgVIskYUkywIHIvXuN1DJro=; b=rKu8BRpnX+Jum/B84c5nLwcJ0V
	ZCryof9jRPmWApzM2OcUK7RMQWERYRwtFZ5KRBAXfkn5hbYDLKXJ+cn+SENF7n66xJSfxyCmRDfeG
	HR0Bkdq7BQwoHycho0XWDzkQ/DL2ZPwCTR5BS9tbW0xCui3Idy3IDQ4/ktNF2xAFEmj4CJMzcVnH7
	1mdAld6/PgjttwGFsmldGqELlbDqrTeTbsgXzAKbIZC3wiIDIKtRnplcvzvNFMoEfXS8QIh5SI+it
	pKfaShu+Su2EjKQ/z3RAMbRfSqPy2L0q4+YkRGUMhgx7y20jfhnu4wXPoPLIfQzwqvOEXj0+AbsdV
	No0jdPxg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfERY-00000003f6r-1C6Z
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 10:14:55 +0000
X-UUID: d6e6227c75fe11f1afed4741b24580c9-20260702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FS8ZuGbtx7XSHcIDnYb6SgVIskYUkywIHIvXuN1DJro=;
	b=Pehz1GZu3q9r9AWXHN7r0gvU+F0yGqiPIyokJ4YTy1Ia7tLU3t2GnRdgjt34kb59Wo7ZP8LumPF356jSLfTn523iz9OyFpAc1b6kfPRm86/spD1ltdCBj2Ye5iW1dvzIqKR8uBcUVZBBrknwIStGRnfSbEuy9bHh+56VKAyodOc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:5ba5a6bd-9198-403b-981b-f1f6d59c13fb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:00bee881-6310-4e6b-a6b1-aca20d98ed8b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d6e6227c75fe11f1afed4741b24580c9-20260702
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 102439826; Thu, 02 Jul 2026 03:14:41 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
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
Subject: [PATCH v9 2/6] Bluetooth: btmtksdio: Remove redundant firmware filename override
Date: Thu, 2 Jul 2026 18:14:32 +0800
Message-ID: <20260702101437.1787800-3-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260702101437.1787800-1-chris.lu@mediatek.com>
References: <20260702101437.1787800-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_111452_773048_CF91077C 
X-CRM114-Status: UNSURE (   7.79  )
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

btmtksdio_setup() calls btmtk_fw_get_filename() to generate the correct
firmware filename based on chip ID, then immediately overwrites it with
snprintf() using a generic legacy format. This causes newer chips that
require chip-specific firmware paths (MT6639, MT7925, MT7928) to request
incorrect legacy filenames, leading to firmware load failures.

The USB driver (btmtkusb.c) correctly uses btmtk_fw_get_filename()
without overriding the result. Match that behavior by removing the
redundant snprintf() call.

Fixes: 7f935b21bee4 ("Bluetooth: btmtk: apply the common btmtk_fw_get_filename")
Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 5b0fab7b89b5..d5f3fd002f85 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1139,9 +1139,6 @@ static int btmtksdio_setup(struct hci_dev *hdev)
 		btmtk_fw_get_filename(fwname, sizeof(fwname), dev_id,
 				      fw_version, 0);
 
-		snprintf(fwname, sizeof(fwname),
-			 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
-			 dev_id & 0xffff, (fw_version & 0xff) + 1);
 		err = mt79xx_setup(hdev, fwname);
 		if (err < 0)
 			return err;
-- 
2.45.2


