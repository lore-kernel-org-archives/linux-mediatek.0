Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C64C369A6
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Apr 2025 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XYDXQmYMM1V6OMW8HHQUaP1GeieP5ZalW9lwYFoSIs=; b=PpGqDX9n58m8+hXlkuOzHjjaY3
	BMJnN+SzG/xT89oVj+KEmOCF6f+mNTYJ5EzZXIIbphFih9qxTZ+t5+0gVaDxzU+3QMfr7mfBhzF6f
	ufjSYHzYbcD+K7k+3tCNv92oKVYlZSYt17HHpOvZriHx0kywjaXh6udMRMG5/WL+SM5VJb9xwVZRY
	ubXHGoGwPVSjAlcmZGkiIYjppbAtCbZDMAZ+B2JwhZzk4p9/4mdGjRMdBEw/UdPwqxV1YD6/Gn0S0
	gPA3aRpj5olvd8XiXmVNrThnVYNcehzWj7pfl8mPKPS1Kwit/1c2Af5P+IGvecdl+t3ZXgZ4qWQs4
	/xPHIuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WgV-00000007WJH-2k3L;
	Wed, 09 Apr 2025 14:45:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W6g-00000007Ofc-2TSb
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Apr 2025 14:08:48 +0000
X-UUID: 22edc748154c11f0a1e849db4cc18d44-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/XYDXQmYMM1V6OMW8HHQUaP1GeieP5ZalW9lwYFoSIs=;
	b=PpB+Thpwh6pPc1QWtFp0LzXWh4ijIkHwGWPnJVgfqSvWoeJSGBQC5LQIEx0ZxgFeyV9W1A+wKS3CIQMtUPOgTHTPFMTFMlAovSmjJ8tJXZRcw3ddPMsID98wOW7WGeZkWh2a+yuik2X3GgP3NOMPKyoGJU1kLNTybKpY9G0iT0g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:df354734-0e5d-4313-a426-02bc849ce9a9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:ef1f688d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 22edc748154c11f0a1e849db4cc18d44-20250409
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1134076120; Wed, 09 Apr 2025 07:08:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 9 Apr 2025 22:08:37 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 9 Apr 2025 22:08:37 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76-next v3 10/10] wifi: mt76: mt7996: add PCI device id for mt7990
Date: Wed, 9 Apr 2025 22:07:50 +0800
Message-ID: <20250409140750.724437-11-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409140750.724437-1-shayne.chen@mediatek.com>
References: <20250409140750.724437-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_070846_657617_15C414C6 
X-CRM114-Status: GOOD (  11.17  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Add PCI device IDs to enable support for mt7990 chipsets.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/pci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
index 05248339a17b..19e99bc1c6c4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
@@ -18,12 +18,14 @@ static u32 hif_idx;
 static const struct pci_device_id mt7996_pci_device_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, MT7996_DEVICE_ID) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, MT7992_DEVICE_ID) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, MT7990_DEVICE_ID) },
 	{ },
 };
 
 static const struct pci_device_id mt7996_hif_device_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, MT7996_DEVICE_ID_2) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, MT7992_DEVICE_ID_2) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, MT7990_DEVICE_ID_2) },
 	{ },
 };
 
@@ -64,7 +66,8 @@ static struct mt7996_hif *mt7996_pci_init_hif2(struct pci_dev *pdev)
 	hif_idx++;
 
 	if (!pci_get_device(PCI_VENDOR_ID_MEDIATEK, MT7996_DEVICE_ID_2, NULL) &&
-	    !pci_get_device(PCI_VENDOR_ID_MEDIATEK, MT7992_DEVICE_ID_2, NULL))
+	    !pci_get_device(PCI_VENDOR_ID_MEDIATEK, MT7992_DEVICE_ID_2, NULL) &&
+	    !pci_get_device(PCI_VENDOR_ID_MEDIATEK, MT7990_DEVICE_ID_2, NULL))
 		return NULL;
 
 	writel(hif_idx | MT_PCIE_RECOG_ID_SEM,
@@ -122,7 +125,8 @@ static int mt7996_pci_probe(struct pci_dev *pdev,
 	mt76_pci_disable_aspm(pdev);
 
 	if (id->device == MT7996_DEVICE_ID_2 ||
-	    id->device == MT7992_DEVICE_ID_2)
+	    id->device == MT7992_DEVICE_ID_2 ||
+	    id->device == MT7990_DEVICE_ID_2)
 		return mt7996_pci_hif2_probe(pdev);
 
 	dev = mt7996_mmio_probe(&pdev->dev, pcim_iomap_table(pdev)[0],
-- 
2.39.2


