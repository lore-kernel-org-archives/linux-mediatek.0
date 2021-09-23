Return-Path: <SRS0=soVQ=ON=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06D4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 12:25:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B330961248
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Sep 2021 12:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B330961248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zg/FxwC19r578GziHmtHZK0CSWosx7UHqP/gszjRJ8s=; b=WYoMTgrVvdIeF1
	BhT21n5LfxaXE4VyiPmCuO+uAY51rkJy0n13ht2B6Q2RKFsWG6upNTREZLXa/2rUvUmIzvak82LVG
	oJZPcfOWmLG2i5bnjjpU756WJmAmx6eu+IrELY1Ot3DvHuvKGuLqHBKEh5zJs0lOH11I1vnKgU9Uf
	6+MHLCoU9fXy4cdFpHxgccFYns0s4y+2+KttGzQMYYXcYCr6JFBC7y53mgbByGgD9LnbWHHowk4/Y
	W3KV+JRvTCpdKrnJ09Adjo22xUuCKjrOVhcvz7PDNLxX8vC/x7Bi58Fi4hbwW6CmuqF6LC0QC4WsL
	ArgE1iaK23zvagc0YEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTNn5-00BMPh-SF; Thu, 23 Sep 2021 12:25:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTNa6-00BFq5-Bi; Thu, 23 Sep 2021 12:12:03 +0000
X-UUID: e62a58bd23be44bcbeb0c43322618cfa-20210923
X-UUID: e62a58bd23be44bcbeb0c43322618cfa-20210923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1002814134; Thu, 23 Sep 2021 05:12:00 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 05:01:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 20:01:57 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Sep 2021 20:01:56 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <chao.hao@mediatek.com>, <yen-chang.chen@mediatek.com>
Subject: [PATCH v3 18/33] iommu/mediatek: Adjust device link when it is
 sub-common
Date: Thu, 23 Sep 2021 19:58:25 +0800
Message-ID: <20210923115840.17813-19-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210923115840.17813-1-yong.wu@mediatek.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_051202_445309_6C8760CE 
X-CRM114-Status: GOOD (  14.54  )
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

For MM IOMMU, We always add device link between smi-common and IOMMU HW.
In mt8195, we add smi-sub-common. Thus, if the node is sub-common, we still
need find again to get smi-common, then do device link.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2ebbb3412cb9..faea4a0d922f 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -786,9 +786,9 @@ static int mtk_iommu_mm_dts_parse(struct device *dev,
 				  struct component_match **match,
 				  struct mtk_iommu_data *data)
 {
+	struct device_node *larbnode, *smicomm_node, *smi_subcomm_node;
 	struct platform_device	*plarbdev;
 	struct device_link	*link;
-	struct device_node *larbnode, *smicomm_node;
 	int i, larb_nr, ret;
 
 	larb_nr = of_count_phandle_with_args(dev->of_node, "mediatek,larbs", NULL);
@@ -822,11 +822,21 @@ static int mtk_iommu_mm_dts_parse(struct device *dev,
 					    compare_of, larbnode);
 	}
 
-	/* Get smi-common dev from the last larb. */
-	smicomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
-	if (!smicomm_node)
+	/* Get smi-(sub)-common dev from the last larb. */
+	smi_subcomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
+	if (!smi_subcomm_node)
 		return -EINVAL;
 
+	/*
+	 * It may have two level smi-common. the node is smi-sub-common if it
+	 * has a new mediatek,smi property. otherwise it is smi-commmon.
+	 */
+	smicomm_node = of_parse_phandle(smi_subcomm_node, "mediatek,smi", 0);
+	if (smicomm_node)
+		of_node_put(smi_subcomm_node);
+	else
+		smicomm_node = smi_subcomm_node;
+
 	plarbdev = of_find_device_by_node(smicomm_node);
 	of_node_put(smicomm_node);
 	data->smicomm_dev = &plarbdev->dev;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
