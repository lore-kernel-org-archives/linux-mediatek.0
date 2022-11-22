Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA501C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 08:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRqJV4snK0oVY8Rx/LUSDCitvG7/SqoZGC7x9qPmPhM=; b=rewHRIBRszR+ktdX5ZEceG+OKk
	STsZkGlFy04XM6SildjJVa6k61p+HX/H/s3XJsrxxAUyj+XAg5D9TSdHsVC4y/rLqA3iDY3b0+2Q+
	G81Gr+nXlfNKW02/J/Y2ZR5jbG+ZJxl/ASRFobSgqWiSVHaGHRvFuhAvkLPCzfO2D8wmuE7Dg2R33
	WcqU7tbBBWf7wcPaNKVw247Wu10tDlOG+0VXFFTliaGE/N3jNaU+vDYVqVDxBgdfHIFkIb04SHj5H
	ry7ghINhfLjI5+qYET5icAPErpDNBXNRNlo2kMYSlrsOTFQpwdSF28RGLyUxEOLtrMr5wPoMsX+fc
	n9nuZrBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxP1J-006beS-Pe; Tue, 22 Nov 2022 08:52:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxP1C-006baF-Ks
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 08:52:40 +0000
X-UUID: 1892e16fafdf4274acf99c1f489355b7-20221122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pRqJV4snK0oVY8Rx/LUSDCitvG7/SqoZGC7x9qPmPhM=;
	b=oUPh4rnwZFfQxViFqCUTuhoHSpPsmrxrSIQF8bHDS8RYPa92t2DpU7A04IqXcQh/A84wdY9A425sDBKzq97b0OcgDCLuaAXHc5siFlMs8da+xClGW6jEQl1vVfwd7umUCNn8TPBz/7lSkzx/+gBBBQEWGjm3viJibinQXhUY9e0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:58dd0e3b-9f5b-4126-89bb-7145544477a3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:62cd327,CLOUDID:89e4e5db-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1892e16fafdf4274acf99c1f489355b7-20221122
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 529947642; Tue, 22 Nov 2022 01:52:25 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 22 Nov 2022 16:51:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 22 Nov 2022 16:51:59 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 8/9] wifi: mt76: mt7996: add module support
Date: Tue, 22 Nov 2022 16:45:53 +0800
Message-ID: <20221122084554.9494-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221122084554.9494-1-shayne.chen@mediatek.com>
References: <20221122084554.9494-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_005238_705978_DC8DC8EC 
X-CRM114-Status: GOOD (  12.37  )
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

(Split the big patch into smaller intermediate patches by functionality
for easier review. Refer to the cover letter for more info.)

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/Kconfig  | 12 ++++++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/Makefile |  6 ++++++
 2 files changed, 18 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7996/Makefile

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
new file mode 100644
index 000000000000..5c5fc569e6d5
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: ISC
+config MT7996E
+	tristate "MediaTek MT7996 (PCIe) support"
+	select MT76_CONNAC_LIB
+	depends on MAC80211
+	depends on PCI
+	help
+	  This adds support for MT7996-based wireless PCIe devices,
+	  which support concurrent tri-band operation at 6GHz, 5GHz,
+	  and 2.4GHz IEEE 802.11be 4x4:4SS 4096-QAM, 320MHz channels.
+
+	  To compile this driver as a module, choose M here.
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/Makefile b/drivers/net/wireless/mediatek/mt76/mt7996/Makefile
new file mode 100644
index 000000000000..bcb9a3c53149
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: ISC
+
+obj-$(CONFIG_MT7996E) += mt7996e.o
+
+mt7996e-y := pci.o init.o dma.o eeprom.o main.o mcu.o mac.o \
+	     debugfs.o mmio.o
-- 
2.25.1


