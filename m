Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AA0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 07:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FB6FIBXAyIZGKG2CVquJyGe1q2ATV4oKw9g1N/ZlGAM=; b=KMBW23EY4NEU2r
	AF/JE4Jr2dOjearjjs56GBd3K40XqU1i5Jv96zD0mWwFDoYVgxfKH8ZWgB3eQR4apLGoVwroKghM1
	6zZC6ntLeOufGXkZ7bl6LXroBmf2Z3P7OZ+mKIeUc4LrAZs0vcvTTVjEFrcv9aClWSs6H8Ng9oucv
	XlJF3ta3NxvZVqxf7ZL+B7tqNRy3Op/AVY5m3qphGGBmgA/MrSA4dv39zz+MySO1FrHtMtq2lK8mz
	GT6TkJiHGWFTc50LEXsSS8buYjzhNVgVcy/y81Sg2+SDsE94H7zvjc6LG+dhDkcmL+n7h47zGsl+v
	MSxGFuLADPk4XPlhPhmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlmrj-004EC6-OI; Tue, 03 May 2022 07:22:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlmns-004Bkz-N4; Tue, 03 May 2022 07:18:38 +0000
X-UUID: 6c18df99357f4636ab80a7a7747098e3-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:80316cdb-d293-4c72-8672-ecec12ba02bd, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:2cd04ac7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 6c18df99357f4636ab80a7a7747098e3-20220503
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1322377511; Tue, 03 May 2022 00:18:29 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 00:15:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 15:15:35 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 May 2022 15:15:34 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
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
Subject: [PATCH v7 06/36] iommu/mediatek: Remove clk_disable in
 mtk_iommu_remove
Date: Tue, 3 May 2022 15:13:57 +0800
Message-ID: <20220503071427.2285-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220503071427.2285-1-yong.wu@mediatek.com>
References: <20220503071427.2285-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_001836_798051_45C3044E 
X-CRM114-Status: GOOD (  12.44  )
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

After the commit b34ea31fe013 ("iommu/mediatek: Always enable the clk on
resume"), the iommu clock is controlled by the runtime callback.
thus remove the clk control in the mtk_iommu_remove.

Otherwise, it will warning like:

echo 14018000.iommu > /sys/bus/platform/drivers/mtk-iommu/unbind

[   51.413044] ------------[ cut here ]------------
[   51.413648] vpp0_smi_iommu already disabled
[   51.414233] WARNING: CPU: 2 PID: 157 at */v5.15-rc1/kernel/mediatek/
                          drivers/clk/clk.c:952 clk_core_disable+0xb0/0xb8
[   51.417174] Hardware name: MT8195V/C(ENG) (DT)
[   51.418635] pc : clk_core_disable+0xb0/0xb8
[   51.419177] lr : clk_core_disable+0xb0/0xb8
...
[   51.429375] Call trace:
[   51.429694]  clk_core_disable+0xb0/0xb8
[   51.430193]  clk_core_disable_lock+0x24/0x40
[   51.430745]  clk_disable+0x20/0x30
[   51.431189]  mtk_iommu_remove+0x58/0x118
[   51.431705]  platform_remove+0x28/0x60
[   51.432197]  device_release_driver_internal+0x110/0x1f0
[   51.432873]  device_driver_detach+0x18/0x28
[   51.433418]  unbind_store+0xd4/0x108
[   51.433886]  drv_attr_store+0x24/0x38
[   51.434363]  sysfs_kf_write+0x40/0x58
[   51.434843]  kernfs_fop_write_iter+0x164/0x1e0

Fixes: b34ea31fe013 ("iommu/mediatek: Always enable the clk on resume")
Reported-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e4b4ebbcb73f..81b8db450eac 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -957,7 +957,6 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 
 	list_del(&data->list);
 
-	clk_disable_unprepare(data->bclk);
 	device_link_remove(data->smicomm_dev, &pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	devm_free_irq(&pdev->dev, data->irq, data);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
