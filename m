Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C7CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 09:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tg6lA49L55te5NVxbt7UwJoQ0/j9wtFj869nHNsrLFU=; b=L+S4XMpMWV2QuA
	XFZgvwV9zR9bXc84F3xgg7jcrpYCkzQ/3UvalAGiBitk0rzZj/OTdONiQ5X1CKQyyqZRtc0Xn+HZf
	4hCIZhhO6KDTCsKkL+wDUMQ9SJ5E+DRlvW2C9c+1jZHDaEKwmnRsTS2w5f7CWwuYHUCUF3/J3SjCT
	+hG6cF1zeYWGXCTymTISLgxIgWXjQVdxepMlkVQn7mnB4y5QT3kUGvAl70xbsj7R2Elc66lr7iVPm
	Z4z9B/hhK+hHp1rxmIuQM+2NiVZvVjuZp+kpGBksVjcxApBmYORI1mwlUoH6YWeK5hFNy6YhZoy4v
	6Yn68yNbUtVnFjSfknpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCHkT-006y8U-5y; Tue, 25 Jan 2022 09:04:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCHgR-006wVa-Dx; Tue, 25 Jan 2022 09:00:12 +0000
X-UUID: a6c376d5a1034040b2c1c22b1fec376f-20220125
X-UUID: a6c376d5a1034040b2c1c22b1fec376f-20220125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1564800663; Tue, 25 Jan 2022 01:59:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 00:57:52 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 25 Jan 2022 16:57:51 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 25 Jan 2022 16:57:49 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <xueqi.zhang@mediatek.com>, <yen-chang.chen@mediatek.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>,
 <mingyuan.ma@mediatek.com>, <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, 
 <chengci.xu@mediatek.com>
Subject: [PATCH v4 07/35] iommu/mediatek: Add mutex for data in the
 mtk_iommu_domain
Date: Tue, 25 Jan 2022 16:56:06 +0800
Message-ID: <20220125085634.17972-8-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220125085634.17972-1-yong.wu@mediatek.com>
References: <20220125085634.17972-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_010011_542921_735443C1 
X-CRM114-Status: GOOD (  17.77  )
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
---
 drivers/iommu/mtk_iommu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 095736bfb7b4..e6e4ee471867 100644
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
