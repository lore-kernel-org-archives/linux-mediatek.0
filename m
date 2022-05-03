Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D71C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 07:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fR9HIrVyp6KxjEiQX83adVHqGIRKpwAQ8MSK3SJi7pg=; b=gZJBnJ1R4npSwE
	+glvAi16aYWfNjcC5kCseq0nUgrFsliECZjTW3kffWWeb0cBZ3F0EDUxm6YAqmyO98n3he7QkpmYR
	QOktSMyEwSP5+X4UebBA/K+j0NS43rOPs+fKYiFx8hkm+DHpsRi0R7LhfBuXZ4nNmiAdq1Ach5t/3
	M4b4DNRM4LLIDkgjIw4PPBu3HFZ7nAdcUIytI/u4bXmedF2hVioYocWhCikL/cDrWCyED4sB3Un7P
	pZjZ3kF0ZX8qN+d6F/a3cDrCwKVKASR2ZCcuXPUx1Xheizg9rPjQvsGl/01obo1KsLO59tXA5a+Sl
	U2iG8+NOvMpWIF0HWpjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlmoK-004C9V-Po; Tue, 03 May 2022 07:19:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlmno-004Bkz-QO; Tue, 03 May 2022 07:18:34 +0000
X-UUID: 4c36e92b978c4378834adc2e146fd45a-20220503
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:f1dd312d-85d6-4965-98e2-1ba7c7c724d9, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:2fd04ac7-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4c36e92b978c4378834adc2e146fd45a-20220503
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1320459339; Tue, 03 May 2022 00:18:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 May 2022 00:15:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 3 May 2022 15:15:53 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 May 2022 15:15:52 +0800
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
Subject: [PATCH v7 08/36] iommu/mediatek: Add mutex for data in the
 mtk_iommu_domain
Date: Tue, 3 May 2022 15:13:59 +0800
Message-ID: <20220503071427.2285-9-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220503071427.2285-1-yong.wu@mediatek.com>
References: <20220503071427.2285-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_001832_918046_C036E562 
X-CRM114-Status: GOOD (  17.46  )
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

Same with the previous patch, add a mutex for the "data" in the
mtk_iommu_domain. Just improve the safety for multi devices
enter attach_device at the same time. We don't get the real issue
for this.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/mtk_iommu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 3413cc98e57e..ecdce5d3e8cf 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -128,6 +128,8 @@ struct mtk_iommu_domain {
 
 	struct mtk_iommu_data		*data;
 	struct iommu_domain		domain;
+
+	struct mutex			mutex; /* Protect "data" in this structure */
 };
 
 static const struct iommu_ops mtk_iommu_ops;
@@ -434,6 +436,7 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
+	mutex_init(&dom->mutex);
 
 	return &dom->domain;
 }
@@ -455,14 +458,19 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	if (domid < 0)
 		return domid;
 
+	mutex_lock(&dom->mutex);
 	if (!dom->data) {
 		/* Data is in the frstdata in sharing pgtable case. */
 		frstdata = mtk_iommu_get_m4u_data();
 
-		if (mtk_iommu_domain_finalise(dom, frstdata, domid))
+		ret = mtk_iommu_domain_finalise(dom, frstdata, domid);
+		if (ret) {
+			mutex_unlock(&dom->mutex);
 			return -ENODEV;
+		}
 		dom->data = data;
 	}
+	mutex_unlock(&dom->mutex);
 
 	mutex_lock(&data->mutex);
 	if (!data->m4u_dom) { /* Initialize the M4U HW */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
