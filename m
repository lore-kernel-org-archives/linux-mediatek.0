Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF90FCD98CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkgX4HMDo7kRNN7r03RSMvNWryWUuw2b/BlzG7F+3oY=; b=QyEyNymkg9yoCsHqe/a4bCnv2s
	Frm6PREJNEt0kkGrUftEZ7KFbC/7gzpv7W0lZn9sGrYF89G0LOT2dPNcHjQUeIVOLt5+qktVXCcUv
	GrmXjEqFqBO4+CWBQdiZN1PI9TVedItYST6tvQtiZ4Qkvt6KcCcho/uLZlHbbKIRAu2RjmZ2dFsaH
	f0TzZenyY3kNN0XqfB2JAHdOBnNTV4bGGey9sdmnVILtk6uXrFLVULau6SYV2tsPs1upKq/yTHNZ2
	mSLbkh3S7DMQwaaxmNZSYKiV9fpPdP8RpAIDj2fOyoATdR3DS2pllP/ICYxQZUqeEBu3P5O4IBGic
	kPAdzzMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwiB-0000000AVvY-0Qc3;
	Fri, 12 Jun 2026 07:53:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwi6-0000000AVpj-1MCu
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:53:51 +0000
X-UUID: d6cadd8a663311f1acbe4559397dec65-20260612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=zkgX4HMDo7kRNN7r03RSMvNWryWUuw2b/BlzG7F+3oY=;
	b=jsNdpgAFgrGyvNxpcXaNk17U52pv8VZacfA64HSue44vfDlCjMXQ6FF13UEDt7honSx3GvlNSb+Ty/IoNnhTbXng96zxIxf+lIt53cotzaALAevDwknG1sSOZwqOYVxUhW/IyN44voYPl+bgKJR4vuqv0oTqRo0UfD1jTSXx5xc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:8ee1d88c-2379-4e06-8a03-12f1e3280dd8,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:1e7ab230-7784-4a77-a538-47ed6151d81b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|136|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d6cadd8a663311f1acbe4559397dec65-20260612
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 653329712; Fri, 12 Jun 2026 00:53:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Jun 2026 15:53:43 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 12 Jun 2026 15:53:43 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <emery.hsin@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH 20/20] wifi: mt76: mt7925: add MT7928 PCIe support
Date: Fri, 12 Jun 2026 15:53:39 +0800
Message-ID: <20260612075339.2578327-5-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260612075339.2578327-1-jb.tsai@mediatek.com>
References: <20260612075339.2578327-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005350_387480_C2B44AB7 
X-CRM114-Status: UNSURE (   9.64  )
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

From: Emery Hsin <emery.hsin@mediatek.com>

Register MT7928 (0x7928, 0x7935) in the PCI device table and
declare MODULE_FIRMWARE for all four MT7928 firmware blobs.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 1ad5847d4a8c..1514494f6c7b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -22,6 +22,10 @@ static const struct pci_device_id mt7925_pci_device_table[] = {
 		.driver_data = (kernel_ulong_t)MT7927_FIRMWARE_WM },
 	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x0738),
 		.driver_data = (kernel_ulong_t)MT7927_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7928),
+		.driver_data = (kernel_ulong_t)MT7928_FIRMWARE_WM },
+	{ PCI_DEVICE(PCI_VENDOR_ID_MEDIATEK, 0x7935),
+		.driver_data = (kernel_ulong_t)MT7928_FIRMWARE_WM },
 	{ },
 };
 
@@ -663,6 +667,11 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 			 "MT7927 raw CHIPID=0x%04x, forcing chip=0x7927\n",
 			 mt76_chip(mdev));
 		mdev->rev = (0x7927 << 16) | (mdev->rev & 0xff);
+	} else if (is_mt7928_hw && mt76_chip(mdev) != 0x7928) {
+		dev_info(mdev->dev,
+			 "MT7928 raw CHIPID=0x%04x, forcing chip=0x7928\n",
+			 mt76_chip(mdev));
+		mdev->rev = (0x7928 << 16) | (mdev->rev & 0xff);
 	}
 
 	mt76_rmw_field(dev, MT_HW_EMI_CTL, MT_HW_EMI_CTL_SLPPROT_EN, 1);
@@ -913,6 +922,10 @@ MODULE_FIRMWARE(MT7925_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7925_ROM_PATCH);
 MODULE_FIRMWARE(MT7927_FIRMWARE_WM);
 MODULE_FIRMWARE(MT7927_ROM_PATCH);
+MODULE_FIRMWARE(MT7928_FIRMWARE_WM);
+MODULE_FIRMWARE(MT7928_ROM_PATCH);
+MODULE_FIRMWARE(MT7928_CB_ROM_PATCH);
+MODULE_FIRMWARE(MT7928_PHY_RAM);
 MODULE_AUTHOR("Deren Wu <deren.wu@mediatek.com>");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_DESCRIPTION("MediaTek MT7925E (PCIe) wireless driver");
-- 
2.45.2


