Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01857C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 05:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VzOfO3E05BIRlgrV8gFIw5DH+mYr2BhAaby6tsyv0nw=; b=LL5qVAdqjzrF6c0WDlUL9kXJ3s
	Vu98RNXEM2/WhQJ9NHIkTr4ZWIfvKi75oU1VB+AuoQuEsC+pu9txXGMoaGoJSuYjU80d+DLgzURIv
	M/GJyUJCCff3bCesm2gd5yPZxlJkfkwZU8rRC948j9cSF/95xobTyVgEK+s0+HZMXTvWoPqVEoRRd
	njZecRyJQ+uXgaIsMxSiSefj3FBP67pTcVWY/uJOwmyaph9es+obWJzBPsdO8ggaJP3FaAs7PiZdL
	vfdRdtfICWwjIBqKPJMr5tDH1kwetkaQhT3jVAY8p7MdhGuKgn33181mnUzGTIB/grRkCr9xU4B/R
	ZjBK5FaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1iP4-000cTm-KE; Thu, 16 Jun 2022 05:50:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1iP1-000cSt-Cm; Thu, 16 Jun 2022 05:50:48 +0000
X-UUID: b6cd5339b0b84c66b5ea529a505b8e62-20220615
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:a494c39b-0ebb-4483-b6c9-64099f8566e1,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:bbd66ff6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b6cd5339b0b84c66b5ea529a505b8e62-20220615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 977573287; Wed, 15 Jun 2022 22:50:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Jun 2022 22:43:00 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 16 Jun 2022 13:42:58 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Jun 2022 13:42:57 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Will Deacon <will@kernel.org>
CC: <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Yong
 Wu" <yong.wu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>,
	<youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
	<xueqi.zhang@mediatek.com>, Guenter Roeck <groeck@chromium.org>, "Dan
 Carpenter" <dan.carpenter@oracle.com>
Subject: [PATCH v2 5/5] iommu/mediatek: Remove a unused "mapping" which is only for v1
Date: Thu, 16 Jun 2022 13:42:03 +0800
Message-ID: <20220616054203.11365-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220616054203.11365-1-yong.wu@mediatek.com>
References: <20220616054203.11365-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_225047_496510_8AA55135 
X-CRM114-Status: UNSURE (   9.63  )
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

Fixes: 9485a04a5bb9 ("iommu/mediatek: Separate mtk_iommu_data for v1 and v2")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 5e86fd48928a..e65e705d9fc1 100644
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


