Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE2BC00140
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 07:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtU/N1xXU84dTElAOP3Pj64uOZma539jJ24DHSkGBcg=; b=1sgQKzwG6P1YjktV1XVmSQfZTf
	U5NLgVF/bSaYoJkcDQDjtUtnIq1xnk3Bwfmwbcw5Pv+PP0oKDv8cCiWofLxLJJdMwAjozNDu7Wiyi
	MzK7+fscHo1pGGSU2/1ZXdw9dxtRKOaMDgKB1U7qBnqr6F/7zSTgoOh4lfxLpQ1v8ulvyBAO5QbTw
	uexOsStkSQ0q38GoVIzcMwKFnukhgvFkD2uz0nHjVEI0NZwoFy0p/2cho6ghLrlcVO7jApzOd8ddn
	bfMSMI7oexu035GGVxIsZMlJdy81O8Edz2oJKxNFVMzbg9zbYPNi1Im83eJJJwkrviXqL8ZjQRu+/
	Mhc+G2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQkRJ-00B2iR-IU; Wed, 24 Aug 2022 07:04:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQkRG-00B2g4-Mb; Wed, 24 Aug 2022 07:04:36 +0000
X-UUID: 709a8ef8683d4fb1a23b08bdbaa50c3d-20220824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EtU/N1xXU84dTElAOP3Pj64uOZma539jJ24DHSkGBcg=;
	b=WskEeV8lp9HU0ulqyJL6fmAJDnx+xQgmdEy7m6YoABk5ZcTGwEtlJtZrQlZnihHcF9abIC/FGPqSm+R4LnJNFJEjbRw6LX2IBQPzl2Yi9DSFjWf3PX5rpgp//sXTvBLPd7te6yWniahngH2xy+hg2Bxg8wHL0ip77O6wDnnaQWI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:de78afbb-4fd9-42f4-a43e-e7da920718ae,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:3cdf72cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 709a8ef8683d4fb1a23b08bdbaa50c3d-20220824
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1884413560; Wed, 24 Aug 2022 00:04:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 24 Aug 2022 14:43:50 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 24 Aug 2022 14:43:47 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, <iommu@lists.linux.dev>,
	<iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Yong
 Wu <yong.wu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
	<xueqi.zhang@mediatek.com>, Guenter Roeck <groeck@chromium.org>, Dan
 Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v4 3/6] iommu/mediatek: Add error path for loop of mm_dts_parse
Date: Wed, 24 Aug 2022 14:43:03 +0800
Message-ID: <20220824064306.21495-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220824064306.21495-1-yong.wu@mediatek.com>
References: <20220824064306.21495-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_000434_749952_1B0EDB43 
X-CRM114-Status: GOOD (  18.70  )
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

The mtk_iommu_mm_dts_parse will parse the smi larbs nodes. if the i+1
larb is parsed fail, we should put_device for the 0..i larbs.

There are two places need to comment:
1) The larbid may be not linear mapping, we should loop whole
   the array in the error path.
2) I move this line position: "data->larb_imu[id].dev = &plarbdev->dev;"
   That means set data->larb_imu[id].dev before the error path.
   then we don't need "platform_device_put(plarbdev)" again while
   probe_defer case. All depend on "put_device" in the error path in error
   cases.

Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 42 ++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 9c5902207bef..f63d4210043d 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1053,8 +1053,10 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 		u32 id;
 
 		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
-		if (!larbnode)
-			return -EINVAL;
+		if (!larbnode) {
+			ret = -EINVAL;
+			goto err_larbdev_put;
+		}
 
 		if (!of_device_is_available(larbnode)) {
 			of_node_put(larbnode);
@@ -1067,14 +1069,16 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 
 		plarbdev = of_find_device_by_node(larbnode);
 		of_node_put(larbnode);
-		if (!plarbdev)
-			return -ENODEV;
+		if (!plarbdev) {
+			ret = -ENODEV;
+			goto err_larbdev_put;
+		}
+		data->larb_imu[id].dev = &plarbdev->dev;
 
 		if (!plarbdev->dev.driver) {
-			platform_device_put(plarbdev);
-			return -EPROBE_DEFER;
+			ret = -EPROBE_DEFER;
+			goto err_larbdev_put;
 		}
-		data->larb_imu[id].dev = &plarbdev->dev;
 
 		component_match_add(dev, match, component_compare_dev, &plarbdev->dev);
 		platform_device_put(plarbdev);
@@ -1082,8 +1086,10 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 
 	/* Get smi-(sub)-common dev from the last larb. */
 	smi_subcomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
-	if (!smi_subcomm_node)
-		return -EINVAL;
+	if (!smi_subcomm_node) {
+		ret = -EINVAL;
+		goto err_larbdev_put;
+	}
 
 	/*
 	 * It may have two level smi-common. the node is smi-sub-common if it
@@ -1097,8 +1103,10 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 
 	pcommdev = of_find_device_by_node(smicomm_node);
 	of_node_put(smicomm_node);
-	if (!pcommdev)
-		return -EINVAL;
+	if (!pcommdev) {
+		ret = -EINVAL;
+		goto err_larbdev_put;
+	}
 	data->smicomm_dev = &pcommdev->dev;
 
 	link = device_link_add(data->smicomm_dev, dev,
@@ -1106,9 +1114,19 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 	platform_device_put(pcommdev);
 	if (!link) {
 		dev_err(dev, "Unable to link %s.\n", dev_name(data->smicomm_dev));
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_larbdev_put;
 	}
 	return 0;
+
+err_larbdev_put:
+	/* id may be not linear mapping, loop whole the array */
+	for (i = 0; i < MTK_LARB_NR_MAX; i++) {
+		if (!data->larb_imu[i].dev)
+			continue;
+		put_device(data->larb_imu[i].dev);
+	}
+	return ret;
 }
 
 static int mtk_iommu_probe(struct platform_device *pdev)
-- 
2.18.0


