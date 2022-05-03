Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608A4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFn/HMq7u2Gao5Wp1j0djz7o8WTkIMm3rv/euNz1DFM=; b=Zx4RSDlsOBjWEd
	gYPWxRpjZkRxw/zZZsYdMEhT8u5TQDe2v1v4afS6tHq+N+mFodHFyqUMVE8LUTQA5myZL9dYFG9Fr
	N8zLse+IaeF989/T9GYBvzbMYgTGS/If7TZdlS8SshgOTGcokROnzVGksqUpj6163GHxH/olbN2e+
	GrLdfjdb30peyLTNQ+e2+1IDGA7sbsJrjJzJIFLFfu8n6gfAYtoFJ/LeZMg0LFrlp+cxJ7lXsATsS
	BL/O8ock9IRUZTl6wgHqMZIRHSSIzPmvG/xhZcRcJsZ9L4HSvxQ2x/XZpRTGZzpXwIB7UpM+BuX+8
	Dx9Jw8YMrywtdZhWF2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlnHN-004QeR-CF; Tue, 03 May 2022 07:49:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlmyE-004HVf-54; Tue, 03 May 2022 07:29:19 +0000
X-UUID: ec581ccf0b91402f807c365997d2226c-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:87e5390f-7c47-4917-a401-2173d444002c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:4b1a832f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ec581ccf0b91402f807c365997d2226c-20220503
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1046950413; Tue, 03 May 2022 00:29:14 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 00:19:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 3 May 2022 15:19:10 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 May 2022 15:19:09 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, <yen-chang.chen@mediatek.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
 <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, 
 <chengci.xu@mediatek.com>
Subject: [PATCH v7 33/36] iommu/mediatek: Initialise/Remove for multi bank dev
Date: Tue, 3 May 2022 15:14:24 +0800
Message-ID: <20220503071427.2285-34-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220503071427.2285-1-yong.wu@mediatek.com>
References: <20220503071427.2285-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_002918_258723_ADD19104 
X-CRM114-Status: GOOD (  18.72  )
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

The registers for each bank of the IOMMU base are in order, delta is
0x1000. Initialise the base for each bank.

For all the previous SoC, we only have bank0. thus use "do {} while()"
to allow bank0 always go.

When removing the device, Not always all the banks are initialised, it
depend on if there is masters for that bank.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 44 ++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 5f3e88c44514..400dea33aea1 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -113,6 +113,7 @@
 #define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) & 0x1f)
 
 #define MTK_PROTECT_PA_ALIGN			256
+#define MTK_IOMMU_BANK_SZ			0x1000
 
 #define PERICFG_IOMMU_1				0x714
 
@@ -1112,7 +1113,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	struct component_match  *match = NULL;
 	struct regmap		*infracfg;
 	void                    *protect;
-	int                     ret, banks_num;
+	int                     ret, banks_num, i = 0;
 	u32			val;
 	char                    *p;
 	struct mtk_iommu_bank_data *bank;
@@ -1153,27 +1154,36 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		data->enable_4GB = !!(val & F_DDR_4GB_SUPPORT_EN);
 	}
 
+	banks_num = data->plat_data->banks_num;
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (resource_size(res) < banks_num * MTK_IOMMU_BANK_SZ) {
+		dev_err(dev, "banknr %d. res %pR is not enough.\n", banks_num, res);
+		return -EINVAL;
+	}
 	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 	ioaddr = res->start;
 
-	banks_num = data->plat_data->banks_num;
 	data->bank = devm_kmalloc(dev, banks_num * sizeof(*data->bank), GFP_KERNEL);
 	if (!data->bank)
 		return -ENOMEM;
 
-	bank = &data->bank[0];
-	bank->id = 0;
-	bank->base = base;
-	bank->m4u_dom = NULL;
-	bank->irq = platform_get_irq(pdev, 0);
-	if (bank->irq < 0)
-		return bank->irq;
-	bank->parent_dev = dev;
-	bank->parent_data = data;
-	spin_lock_init(&bank->tlb_lock);
+	do {
+		if (!data->plat_data->banks_enable[i])
+			continue;
+		bank = &data->bank[i];
+		bank->id = i;
+		bank->base = base + i * MTK_IOMMU_BANK_SZ;
+		bank->m4u_dom = NULL;
+
+		bank->irq = platform_get_irq(pdev, i);
+		if (bank->irq < 0)
+			return bank->irq;
+		bank->parent_dev = dev;
+		bank->parent_data = data;
+		spin_lock_init(&bank->tlb_lock);
+	} while (++i < banks_num);
 
 	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_BCLK)) {
 		data->bclk = devm_clk_get(dev, "bclk");
@@ -1261,7 +1271,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 static int mtk_iommu_remove(struct platform_device *pdev)
 {
 	struct mtk_iommu_data *data = platform_get_drvdata(pdev);
-	struct mtk_iommu_bank_data *bank = &data->bank[0];
+	struct mtk_iommu_bank_data *bank;
+	int i;
 
 	iommu_device_sysfs_remove(&data->iommu);
 	iommu_device_unregister(&data->iommu);
@@ -1278,7 +1289,12 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 #endif
 	}
 	pm_runtime_disable(&pdev->dev);
-	devm_free_irq(&pdev->dev, bank->irq, bank);
+	for (i = 0; i < data->plat_data->banks_num; i++) {
+		bank = &data->bank[i];
+		if (!bank->m4u_dom)
+			continue;
+		devm_free_irq(&pdev->dev, bank->irq, bank);
+	}
 	return 0;
 }
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
