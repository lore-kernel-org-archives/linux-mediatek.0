Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE847C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 06:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ImFd3X4irUftg9HvR/QZIp3ZAVj6CbtM32/YvahXxfc=; b=wXQN396oeWaslF
	xD0coNaPlem/FuBHjTRKTmNUT83Xa6QubPzCoXgxANrnRGUs1lzeR+ylgTa3T2UYRcfaMdVGXVn+w
	8fPNCJywTjoD2vcY/tzNDU1kUrb41MZ6quyn2C2jOAseYkJzHVgFXYYR57GU+VsSGpH7g6CqO+GXU
	o7KDrH2OOtZ0I2WoqqMYs2B6hgve93SDjW0coQpgYDIXcRjiYghOu7tBPX9SYEukGT7fUfrExOx7l
	cm9lV87EV2d8p05sKKL2W4CzAi+7wqkYmhDqh6oGAZLWzuzIc2x+Zxrh5FAVeBhE9EBDhvqvbimrX
	sDbRd1VIvlqj0X3N+Eyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nogAl-005YWt-MI; Wed, 11 May 2022 06:50:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nogAY-005YNp-Av; Wed, 11 May 2022 06:49:59 +0000
X-UUID: a534585b98394057bff6e1941d3a00ee-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:de9afdf7-f307-446c-9121-e1362a0902cc, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:6f8e0fe6-38f2-431d-8de7-bf8fac490b0a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a534585b98394057bff6e1941d3a00ee-20220510
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2134494677; Tue, 10 May 2022 23:49:56 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 23:49:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 May 2022 14:49:52 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 May 2022 14:49:51 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Yong Wu" <yong.wu@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
 <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, Guenter Roeck <groeck@chromium.org>, "Dan
 Carpenter" <dan.carpenter@oracle.com>
Subject: [PATCH 2/4] iommu/mediatek: Add error path for loop of mm_dts_parse
Date: Wed, 11 May 2022 14:49:18 +0800
Message-ID: <20220511064920.18455-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220511064920.18455-1-yong.wu@mediatek.com>
References: <20220511064920.18455-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_234958_431594_BBD6BB28 
X-CRM114-Status: GOOD (  14.00  )
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

The mtk_iommu_mm_dts_parse will parse the smi larbs nodes. if the i+1
larb is parsed fail(return -EINVAL), we should of_node_put for the 0..i
larbs.

Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0f6ec4a4d9d4..523bf59264e1 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1065,12 +1065,12 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 
 		plarbdev = of_find_device_by_node(larbnode);
 		if (!plarbdev) {
-			of_node_put(larbnode);
-			return -ENODEV;
+			ret = -ENODEV;
+			goto err_larbnode_put;
 		}
 		if (!plarbdev->dev.driver) {
-			of_node_put(larbnode);
-			return -EPROBE_DEFER;
+			ret = -EPROBE_DEFER;
+			goto err_larbnode_put;
 		}
 		data->larb_imu[id].dev = &plarbdev->dev;
 
@@ -1101,9 +1101,20 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 			       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
 	if (!link) {
 		dev_err(dev, "Unable to link %s.\n", dev_name(data->smicomm_dev));
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_larbnode_put;
 	}
 	return 0;
+
+err_larbnode_put:
+	while (i--) {
+		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
+		if (larbnode && of_device_is_available(larbnode)) {
+			of_node_put(larbnode);
+			of_node_put(larbnode);
+		}
+	}
+	return ret;
 }
 
 static int mtk_iommu_probe(struct platform_device *pdev)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
