Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77988C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 07:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dFa+GEtZ7pyxmBIVv/eim1quIMe+jl+v64VD0RMPscw=; b=4G8g33r/2Llp3b
	h5vvdkNit+q5St7EB6KHQ4tiz0Cyv0AKscFAHi+dN+/NNPkfCt6WEztz9+9PDRQAG4IFGkqbVcJJq
	fPwN0fXE7IaSBc2m9vC5mSDD1dOz8iUb4DmWSuEgLW2b2VfhqEeoJf4Q7a/tRhLUENWGffCUErmlD
	NYj44A+HkYcGsm2uU7Ix3kVABybtWkWavoWaz/laj3m8ZMFRkK8ihp/95k0q5e327yeIzLQFeCdVk
	147Ww1Cj/9TWOXcpo0Bu8GqK3hpDOOQwWr42KcND9N2rbP3YjybWlMCnOAjIy03jdbnQkOuAEV5u6
	quITgqJ3kyb5eHtIH2xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmVdn-00ELI4-PI; Thu, 05 May 2022 07:11:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmVdc-00ELG9-Ne
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 07:11:02 +0000
X-UUID: d4e7448fc1414f3b9d4a2451910e76f4-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8e445bab-829f-4a0a-8313-0eaf94e74659, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:3b72a6b2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d4e7448fc1414f3b9d4a2451910e76f4-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1472802039; Thu, 05 May 2022 00:10:56 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 00:08:44 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 15:08:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 5 May 2022 15:08:43 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 3/3] mt76: mt7915: move MT_INT_MASK_CSR to init.c
Date: Thu, 5 May 2022 15:08:36 +0800
Message-ID: <7bfbc431f07401f73f51566ce347fca01cbaa98b.1651722608.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <40f31a4550ff357468798a5950a62ceec396cbeb.1651722608.git.ryder.lee@mediatek.com>
References: <40f31a4550ff357468798a5950a62ceec396cbeb.1651722608.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_001100_839154_827C625F 
X-CRM114-Status: GOOD (  10.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To avoid redundant MT_INT_MASK_CSR settings.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 1 +
 drivers/net/wireless/mediatek/mt76/mt7915/mmio.c | 2 --
 drivers/net/wireless/mediatek/mt76/mt7915/pci.c  | 2 --
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c  | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index aa93aeab5634..db6904448063 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -649,6 +649,7 @@ mt7915_init_hardware(struct mt7915_dev *dev, struct mt7915_phy *phy2)
 {
 	int ret, idx;
 
+	mt76_wr(dev, MT_INT_MASK_CSR, 0);
 	mt76_wr(dev, MT_INT_SOURCE_CSR, ~0);
 
 	INIT_WORK(&dev->init_work, mt7915_init_work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 229d40826c9b..3c55d4cebbf2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -668,8 +668,6 @@ struct mt7915_dev *mt7915_mmio_probe(struct device *pdev,
 
 	tasklet_setup(&dev->irq_tasklet, mt7915_irq_tasklet);
 
-	mt76_wr(dev, MT_INT_MASK_CSR, 0);
-
 	return dev;
 
 error:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index 6f819c41a4c4..a9d4b3fced53 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -138,8 +138,6 @@ static int mt7915_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto free_irq_vector;
 
-	mt76_wr(dev, MT_INT_MASK_CSR, 0);
-
 	/* master switch of PCIe tnterrupt enable */
 	mt76_wr(dev, MT_PCIE_MAC_INT_ENABLE, 0xff);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index 04e62d569599..b91f5485f97a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -1168,7 +1168,6 @@ static int mt7986_wmac_probe(struct platform_device *pdev)
 		goto free_irq;
 
 	mt7915_wfsys_reset(dev);
-	mt76_wr(dev, MT_INT_MASK_CSR, 0);
 
 	ret = mt7915_register_device(dev);
 	if (ret)
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
