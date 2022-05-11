Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B445C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 06:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SuIl6zKi5XyaAwa7qwcdLX2IIPWg739lqfwnXBEscA=; b=wdBnfxcLz0crBK
	3Z7fGkvodBOz4JUR46nzEYyCm3MvjLI+wD05u/Khq+EaWS15M3WdIS0/fU7X/vYG7zFl7Vlg/2iAm
	12dcqS+k2qs5z5m+y6+RPxukGTAoVX3vIAZXTyy32nog7BXLTVozyipatfckeHrjqvNYUrXrh9XrK
	fD5Y5EjPb67YHMxkzhP2Sg9b0oSmN8kg+/05rHdiZihcuIccXHedLP0icOlaXgccPWFGLjUwNODYa
	aOlAjetNpabFpvA58HAk/4A3ZH8iuvldHbBfOZ88HMtXLyNjki4Rwwz1MsgLLzld+NZGuEq4KY645
	eNW8fWdX0FFb8GFiU/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nogBu-005ZGj-Ot; Wed, 11 May 2022 06:51:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nogBX-005Z2a-Fd; Wed, 11 May 2022 06:51:00 +0000
X-UUID: a10fab26054b4291bffe93c212898e70-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:afb2c199-2e19-41b7-9fb3-e77b3ca7eaf2, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:a7f363b3-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a10fab26054b4291bffe93c212898e70-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1621048991; Tue, 10 May 2022 23:50:49 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 23:50:15 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 11 May 2022 14:50:12 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 May 2022 14:50:11 +0800
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
Subject: [PATCH 4/4] iommu/mediatek: Improve safety for mediatek,
 smi property in larb nodes
Date: Wed, 11 May 2022 14:49:20 +0800
Message-ID: <20220511064920.18455-5-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220511064920.18455-1-yong.wu@mediatek.com>
References: <20220511064920.18455-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_235059_541015_1E442EF8 
X-CRM114-Status: GOOD (  19.78  )
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

No functional change. Just improve safety from dts.

All the larbs that connect to one IOMMU must connect with the same
smi-common. This patch checks all the mediatek,smi property for each
larb, If their mediatek,smi are different, it will return fails.
Also avoid there is no available smi-larb nodes.

Suggested-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 49 ++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 1ba92751e9df..75b9ede45a1a 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1038,7 +1038,7 @@ static const struct component_master_ops mtk_iommu_com_ops = {
 static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **match,
 				  struct mtk_iommu_data *data)
 {
-	struct device_node *larbnode, *smicomm_node, *smi_subcomm_node;
+	struct device_node *larbnode, *frst_avail_smicomm_node = NULL;
 	struct platform_device *plarbdev;
 	struct device_link *link;
 	int i, larb_nr, ret;
@@ -1050,6 +1050,7 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 		return -EINVAL;
 
 	for (i = 0; i < larb_nr; i++) {
+		struct device_node *smicomm_node, *smi_subcomm_node;
 		u32 id;
 
 		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
@@ -1085,27 +1086,43 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 		}
 		data->larb_imu[id].dev = &plarbdev->dev;
 
+		/* Get smi-(sub)-common dev from the last larb. */
+		smi_subcomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
+		if (!smi_subcomm_node) {
+			ret = -EINVAL;
+			goto err_larbnode_put;
+		}
+
+		/*
+		 * It may have two level smi-common. the node is smi-sub-common if it
+		 * has a new mediatek,smi property. otherwise it is smi-commmon.
+		 */
+		smicomm_node = of_parse_phandle(smi_subcomm_node, "mediatek,smi", 0);
+		if (smicomm_node)
+			of_node_put(smi_subcomm_node);
+		else
+			smicomm_node = smi_subcomm_node;
+
+		if (!frst_avail_smicomm_node) {
+			frst_avail_smicomm_node = smicomm_node;
+		} else if (frst_avail_smicomm_node != smicomm_node) {
+			dev_err(dev, "mediatek,smi is not right @larb%d.", id);
+			of_node_put(smicomm_node);
+			ret = -EINVAL;
+			goto err_larbnode_put;
+		} else {
+			of_node_put(smicomm_node);
+		}
+
 		component_match_add_release(dev, match, component_release_of,
 					    component_compare_of, larbnode);
 	}
 
-	/* Get smi-(sub)-common dev from the last larb. */
-	smi_subcomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
-	if (!smi_subcomm_node)
+	if (!frst_avail_smicomm_node)
 		return -EINVAL;
 
-	/*
-	 * It may have two level smi-common. the node is smi-sub-common if it
-	 * has a new mediatek,smi property. otherwise it is smi-commmon.
-	 */
-	smicomm_node = of_parse_phandle(smi_subcomm_node, "mediatek,smi", 0);
-	if (smicomm_node)
-		of_node_put(smi_subcomm_node);
-	else
-		smicomm_node = smi_subcomm_node;
-
-	plarbdev = of_find_device_by_node(smicomm_node);
-	of_node_put(smicomm_node);
+	plarbdev = of_find_device_by_node(frst_avail_smicomm_node);
+	of_node_put(frst_avail_smicomm_node);
 	data->smicomm_dev = &plarbdev->dev;
 
 	link = device_link_add(data->smicomm_dev, dev,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
