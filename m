Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7698C54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 09:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=900vz5qr65ndkLF0SOk5KwGKEz4Cus5BCuRbNd9HW7I=; b=U1ygsmQ40CKdszzSoGWwa0+Thm
	2owo9yjU9kL5PaXDkfjgq/t1QK/DlTrlCwbfrtDK7LUakCOMwACZhcOGTIEbk4FCM0bRkQsvpY3x9
	Yqlp6XqgvbwAtzBvZmztRpMtWJTBmtjIINIqcDbFU2/bU7z/zxAetKmvGCOb7EhzZQkOL1Wdha9Vl
	ZtIYeIaF1RKzMTwf+67gNCo6Pv3BKxfiFntV12bqg3IIn4q3ClrUSUo9BeOQa67/vqFGcpNA3MfeC
	E652Xvnd0qG6L4cNOM2LUWf3bP1hrgs5v55VO4EVJZ4Mtk/wf2ys3ZBgsNXdA1BCPNQX98iO4/Z4a
	1eU8p5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaD26-00Ajdm-QX; Mon, 19 Sep 2022 09:25:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaD1f-00AjRH-7S; Mon, 19 Sep 2022 09:25:16 +0000
X-UUID: 7161faa308134aeda59b01361b92727b-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=900vz5qr65ndkLF0SOk5KwGKEz4Cus5BCuRbNd9HW7I=;
	b=qN6TRa7HmbB7Xvkjc5gYvUMe/PkF04BS0+bGYQ302Qjv02vHMb8ZN3YiSExf2OnJ5Ok/CZeDwZBp/gEOXoHBvNlzMcIgO+57IU5DKddQT3+GCoR4BZpX/jueDfmZiqTDfQgWSJXZDMWEVS1IbmMRAJmhQg3spn5re1yD7yNq2NA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:65dd8b2d-df28-484e-b1fc-9642718f3839,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:d6cc225e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7161faa308134aeda59b01361b92727b-20220919
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1277091229; Mon, 19 Sep 2022 02:25:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Sep 2022 17:24:37 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 19 Sep 2022 17:24:36 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, <iommu@lists.linux.dev>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>,
	<chengci.xu@mediatek.com>, <youlin.pei@mediatek.com>,
	<anan.sun@mediatek.com>, <xueqi.zhang@mediatek.com>, Guenter Roeck
	<groeck@chromium.org>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v5 3/6] iommu/mediatek: Add error path for loop of mm_dts_parse
Date: Mon, 19 Sep 2022 17:24:02 +0800
Message-ID: <20220919092405.8256-4-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220919092405.8256-1-yong.wu@mediatek.com>
References: <20220919092405.8256-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_022515_302783_CD97EEC2 
X-CRM114-Status: GOOD (  15.78  )
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
   before "if (!plarbdev->dev.driver)", That means set
   data->larb_imu[id].dev before the error path. then we don't need
   "platform_device_put(plarbdev)" again in probe_defer case. All depend
   on "put_device" of the error path in error cases.

Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 83b279432406..97b721006a47 100644
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
@@ -1109,6 +1113,15 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 		return -EINVAL;
 	}
 	return 0;
+
+err_larbdev_put:
+	/* id may be not linear mapping, loop whole the array */
+	for (i = MTK_LARB_NR_MAX - 1; i >= 0; i++) {
+		if (!data->larb_imu[i].dev)
+			continue;
+		put_device(data->larb_imu[i].dev);
+	}
+	return ret;
 }
 
 static int mtk_iommu_probe(struct platform_device *pdev)
-- 
2.18.0


