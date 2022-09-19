Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A272ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 09:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYeUrDWmysoKnpRMd2tQy/Csgjdj3CcyZZOmwVF2Qmg=; b=H1ZMDvkI7/EzwTtV6fJ3/RQg04
	B32Zw1QEYGuHlMozIv4yH9B3q0w/pezihl9DMnF0GrmNGv01h9rKhTJBiXY3/cZZgYzIeCNo+4ovR
	13hBAmINNFRq964iYYCZRCyDfs12fuWJJa6VnOqdZHk9OKCHlWx4I6dVfJgpeivmNcd6PVlnGzi7K
	pqxsR6fTef5e0ik9BjoieKt6ICZbygt41SUtGo5Mqj95+LxNGS5QGHIBq4OuQoTYgJ1QZnGGrOYTC
	VenphUc/IZGqikoW4l3NoinOudN+qF7bOdKpcwJX70yUe0QtZ02o1N/DKSWnpwczufO+0KBgfSh3y
	NXt81f+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaD2o-00AkAv-KY; Mon, 19 Sep 2022 09:26:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaD2k-00Ak60-BD; Mon, 19 Sep 2022 09:26:24 +0000
X-UUID: f1ddb330b7a6418682d7aa13629aeca8-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=tYeUrDWmysoKnpRMd2tQy/Csgjdj3CcyZZOmwVF2Qmg=;
	b=bVBRQVzlsdAr2dWp6i5DxhuQFl/Ux/gkSgTV8whCbw3c8QQy+KeCLtey/MEEj53te7MOoH6T8uk2mvyIUYkWUrm3sIQF5d16NUBB8tM5n04R75hNSxXMT8rqrB831Ypx6Tq0O6SQ2IpQHS6AU7q3k3Ptpoh6JqR1DrDppT/241M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:39a7595f-150a-460c-9dde-da12492d891f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:fbd7225e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f1ddb330b7a6418682d7aa13629aeca8-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1399471292; Mon, 19 Sep 2022 02:26:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Sep 2022 17:24:56 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 19 Sep 2022 17:24:55 +0800
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
Subject: [PATCH v5 6/6] iommu/mediatek: Remove unused "mapping" member from mtk_iommu_data
Date: Mon, 19 Sep 2022 17:24:05 +0800
Message-ID: <20220919092405.8256-7-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220919092405.8256-1-yong.wu@mediatek.com>
References: <20220919092405.8256-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_022622_836566_AB1CD1F3 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

Just remove a unused variable that only is for mtk_iommu_v1.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/iommu/mtk_iommu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index f92b8c0bb373..eb3ace99beff 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -221,10 +221,7 @@ struct mtk_iommu_data {
 	struct device			*smicomm_dev;
 
 	struct mtk_iommu_bank_data	*bank;
-
-	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
 	struct regmap			*pericfg;
-
 	struct mutex			mutex; /* Protect m4u_group/m4u_dom above */
 
 	/*
-- 
2.18.0


