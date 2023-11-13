Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C45AC4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 07:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+1z+INgSpEVU5Co74aO5rGjZbWWz/zN2KZmmWyWREU=; b=Dubnv804rEeF75FK+owXNO55mx
	Ldz8DINUHMIAgyDxNEX1V0LH1y4d+Cug9hRRPsy+ebXMZwTNUlq9qTv30Sf8PriVFPPNi/w3/s4WH
	Ynkr9YlYJxpiYkIYg3UOHeZPrTsS0HpxN/SgDlPJrmeYak4jIluEUSf5daKHNGIvM8/F3VT3sWGVz
	TD838BeP/D0eELKTr/jm+98m6z9xOoozRlnwone3nicuXk2rR4H482BYzMVojcHH0mBJb/5hK2iTL
	UHmap5nMrhwBggKch4EcIeyjoqRqRblp6hehA5MaWcwHZ8K6NcTYJFramhkpuZ8qUvmBeMa9g0zig
	qazeMBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2R39-00DPvm-34;
	Mon, 13 Nov 2023 07:07:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2R34-00DPtd-1m
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Nov 2023 07:07:58 +0000
X-UUID: 5c170ee681f311ee9b7791016c24628a-20231113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Z+1z+INgSpEVU5Co74aO5rGjZbWWz/zN2KZmmWyWREU=;
	b=mG8TzTp6XsiPazY4UVjqklpESWc0I9tVjrqZXjVvQHpQk7Y+oyb5DpjHJ7L0Zmg40sfktUgYi2yOtFrcdi2QQngS54lXxYDkalRSAWdOlBJy1ai4R4pcn18HEXdUYDLEf4SWOvsNtxJMmdq+7npUnKBPCI+SXd/ZiRz7s9Jy4JU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:0871f402-f792-4183-8e7a-9541d3195e71,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:9f449572-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 5c170ee681f311ee9b7791016c24628a-20231113
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 659730978; Mon, 13 Nov 2023 00:07:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 13 Nov 2023 15:07:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 13 Nov 2023 15:07:35 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, StanleyYP Wang
	<StanleyYP.Wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 8/8] wifi: mt76: mt7996: add PCI IDs for mt7992
Date: Mon, 13 Nov 2023 15:06:19 +0800
Message-ID: <20231113070619.19964-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231113070619.19964-1-shayne.chen@mediatek.com>
References: <20231113070619.19964-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.044900-8.000000
X-TMASE-MatchedRID: x6uIgBUWMEwxFdXyW/P+XRWCVBr+Ay98mdrHMkUHHq//mpvOG+QCxPlY
	oV6p/cSxy6Vu04JxfRLZGGE6hr7LujlcyhHfhEXKPlrzaogdiJxPZ8WbDkfxU5soi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNZd/mwLf2BVUrc/mcXcLg2DTP0jAC4C89bUdrRJhMJpw342XdyXrs++UTG
	VAhB5EbQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.044900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DC0FF7A9E4AE2A53B0686656EBC82C2B16FCA1A6479720B36FBA445F16875C242000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_230754_613375_9F016129 
X-CRM114-Status: UNSURE (   9.94  )
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

From: StanleyYP Wang <StanleyYP.Wang@mediatek.com>

Add PCI device IDs to enable mt7992 chipsets support.

Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/pci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
index baa5fb97a121..a35939cbf3bf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
@@ -17,11 +17,13 @@ static u32 hif_idx;
 
 static const struct pci_device_id mt7996_pci_device_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7990) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7992) },
 	{ },
 };
 
 static const struct pci_device_id mt7996_hif_device_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7991) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x799a) },
 	{ },
 };
 
@@ -60,7 +62,9 @@ static void mt7996_put_hif2(struct mt7996_hif *hif)
 static struct mt7996_hif *mt7996_pci_init_hif2(struct pci_dev *pdev)
 {
 	hif_idx++;
-	if (!pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x7991, NULL))
+
+	if (!pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x7991, NULL) &&
+	    !pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x799a, NULL))
 		return NULL;
 
 	writel(hif_idx | MT_PCIE_RECOG_ID_SEM,
@@ -113,7 +117,7 @@ static int mt7996_pci_probe(struct pci_dev *pdev,
 
 	mt76_pci_disable_aspm(pdev);
 
-	if (id->device == 0x7991)
+	if (id->device == 0x7991 || id->device == 0x799a)
 		return mt7996_pci_hif2_probe(pdev);
 
 	dev = mt7996_mmio_probe(&pdev->dev, pcim_iomap_table(pdev)[0],
-- 
2.39.2


