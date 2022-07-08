Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D47C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 13:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jupuYZTvP7Zk25QvDnKiUXBxZmh0QIrphuOJN6KPJw0=; b=YA3b2DcRZ9uy9M0a8ACtxhCxZN
	X9fgtdkxGHiWmBtm140Pk0WcH6GRanKS0WwWPQ+ZQjGFF+qbGZNL4KJQQYMMrvmzlOnUqQvV5ZyAQ
	IrUSKHz4fcmUHROstEdNHqJGiBlFJnXjsTuixNkOY29KDxSRB33aX69eJOZa8jnS6IZEIEKgPketU
	8KGL9ZiKlxi3Ba+tqj5cU8DwiZvdOxRuOQ2hN7M90LQvk0vku3uhk7eaBWlRe7Dv/sXWMc5YOBHTG
	Y9kKG0oxgrxEcvKbneG/PgH6HNoNVb6jsFE1+VvA3w7giY5c7oPf2n+4dPzJXSvcfoLpbCO+MuMtT
	HJdNY4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9oDw-003y90-H2; Fri, 08 Jul 2022 13:40:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9oDr-003y6b-Vt; Fri, 08 Jul 2022 13:40:46 +0000
X-UUID: 8a3c7eec2c1c408091e72cb670f487a7-20220708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f2edfda4-3bac-4cfc-8769-f60fa88a63b0,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:9e14ec86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 8a3c7eec2c1c408091e72cb670f487a7-20220708
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1049084303; Fri, 08 Jul 2022 06:40:38 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 21:20:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 8 Jul 2022 21:20:00 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <yj.chiang@mediatek.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Hans
 de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Zhen
 Lei <thunder.leizhen@huawei.com>, Andrew Morton <akpm@linux-foundation.org>,
	Jacob Keller <jacob.e.keller@intel.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] lib: devres: use numa aware allocation
Date: Fri, 8 Jul 2022 21:19:47 +0800
Message-ID: <20220708131952.14500-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_064044_046954_FB98A6B9 
X-CRM114-Status: GOOD (  11.14  )
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

Allocate device resource from local node memory
when the numa locality of the device is specified.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 lib/devres.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/lib/devres.c b/lib/devres.c
index 14664bbb4875..55eb07e80cbb 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -29,7 +29,8 @@ static void __iomem *__devm_ioremap(struct device *dev, resource_size_t offset,
 {
 	void __iomem **ptr, *addr = NULL;
 
-	ptr = devres_alloc(devm_ioremap_release, sizeof(*ptr), GFP_KERNEL);
+	ptr = devres_alloc_node(devm_ioremap_release, sizeof(*ptr), GFP_KERNEL,
+				dev_to_node(dev));
 	if (!ptr)
 		return NULL;
 
@@ -292,7 +293,8 @@ void __iomem *devm_ioport_map(struct device *dev, unsigned long port,
 {
 	void __iomem **ptr, *addr;
 
-	ptr = devres_alloc(devm_ioport_map_release, sizeof(*ptr), GFP_KERNEL);
+	ptr = devres_alloc_node(devm_ioport_map_release, sizeof(*ptr), GFP_KERNEL,
+				dev_to_node(dev));
 	if (!ptr)
 		return NULL;
 
@@ -366,7 +368,8 @@ void __iomem * const *pcim_iomap_table(struct pci_dev *pdev)
 	if (dr)
 		return dr->table;
 
-	new_dr = devres_alloc(pcim_iomap_release, sizeof(*new_dr), GFP_KERNEL);
+	new_dr = devres_alloc_node(pcim_iomap_release, sizeof(*new_dr), GFP_KERNEL,
+				   dev_to_node(&pdev->dev));
 	if (!new_dr)
 		return NULL;
 	dr = devres_get(&pdev->dev, new_dr, NULL, NULL);
@@ -548,7 +551,8 @@ int devm_arch_phys_wc_add(struct device *dev, unsigned long base, unsigned long
 	int *mtrr;
 	int ret;
 
-	mtrr = devres_alloc(devm_arch_phys_ac_add_release, sizeof(*mtrr), GFP_KERNEL);
+	mtrr = devres_alloc_node(devm_arch_phys_ac_add_release, sizeof(*mtrr), GFP_KERNEL,
+				 dev_to_node(dev));
 	if (!mtrr)
 		return -ENOMEM;
 
@@ -593,7 +597,8 @@ int devm_arch_io_reserve_memtype_wc(struct device *dev, resource_size_t start,
 	struct arch_io_reserve_memtype_wc_devres *dr;
 	int ret;
 
-	dr = devres_alloc(devm_arch_io_free_memtype_wc_release, sizeof(*dr), GFP_KERNEL);
+	dr = devres_alloc_node(devm_arch_io_free_memtype_wc_release, sizeof(*dr), GFP_KERNEL,
+			       dev_to_node(dev));
 	if (!dr)
 		return -ENOMEM;
 
-- 
2.32.0


