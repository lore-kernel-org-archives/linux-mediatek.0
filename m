Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157EEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 01:42:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D09616128C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 01:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D09616128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hnIW6pN0AvSce+aS+OylYzAJRt+5Lqo/2F7bonhnDi4=; b=vXPbxzj8f3VSO7
	21FO+Wd2RKdwWOqxeLLS/eBce7LkZvK8NuzORwgrNtkFPGuWhd5XZBH3V1VA6LjUzmxhs0MeGuihm
	ADXlWzD/RFNcod2JqeBzGzLxf/c2HqdXltZgGbZ7KPTKPcJL1Bq5TYHnFSeKWHsUwJ7gYwKJ1ogha
	9g3YKHt8SA8kqJO1TXC8ypBPI1LFCfkducMNU0LI4k3B8lTeVJK5+By2rMHAu/tK1hhBxe2pHJa/K
	HIfnoDrgTFcQciCIa80CMZGKBUno0bNWyMiUUwaNmB5gukYGgGdsgsiZMIAwIY46v0gweoHtn1Lrt
	+yzqRENy5HGkKhVfeApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVOc1-009bNf-Oc; Wed, 29 Sep 2021 01:42:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVObD-009b4r-0Q; Wed, 29 Sep 2021 01:41:32 +0000
X-UUID: 5fca041a3faa4eb5bb99ffa58b11e553-20210928
X-UUID: 5fca041a3faa4eb5bb99ffa58b11e553-20210928
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 622363535; Tue, 28 Sep 2021 18:41:26 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Sep 2021 18:37:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 29 Sep 2021 09:37:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Sep 2021 09:37:46 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Matthias Kaehlcke
 <mka@chromium.org>, <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>,
 <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Tiffany Lin <tiffany.lin@mediatek.com>, "Dafna
 Hirschfeld" <dafna.hirschfeld@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v8 02/12] iommu/mediatek-v1: Free the existed fwspec if the
 master dev already has
Date: Wed, 29 Sep 2021 09:37:09 +0800
Message-ID: <20210929013719.25120-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210929013719.25120-1-yong.wu@mediatek.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_184131_067441_3F92B93E 
X-CRM114-Status: GOOD (  17.19  )
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

When the iommu master device enters of_iommu_xlate, the ops may be
NULL(iommu dev is defered), then it will initialize the fwspec here:

[<c0c9c5bc>] (dev_iommu_fwspec_set) from [<c06bda80>]
(iommu_fwspec_init+0xbc/0xd4)
[<c06bd9c4>] (iommu_fwspec_init) from [<c06c0db4>]
(of_iommu_xlate+0x7c/0x12c)
[<c06c0d38>] (of_iommu_xlate) from [<c06c10e8>]
(of_iommu_configure+0x144/0x1e8)

BUT the mtk_iommu_v1.c only supports arm32, the probing flow still is a bit
weird. We always expect create the fwspec internally. otherwise it will
enter here and return fail.

static int mtk_iommu_create_mapping(struct device *dev,
				    struct of_phandle_args *args)
{
        ...
	if (!fwspec) {
	        ....
	} else if (dev_iommu_fwspec_get(dev)->ops != &mtk_iommu_ops) {
                >>>>>>>>>>Enter here. return fail.<<<<<<<<<<<<
		return -EINVAL;
	}
	...
}

Thus, Free the existed fwspec if the master device already has fwspec.

This issue is reported at:
https://lore.kernel.org/linux-mediatek/trinity-7d9ebdc9-4849-4d93-bfb5-429dcb4ee449-1626253158870@3c-app-gmx-bs01/

Reported-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu_v1.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index be22fcf988ce..1467ba1e4417 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -425,6 +425,15 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 	struct mtk_iommu_data *data;
 	int err, idx = 0;
 
+	/*
+	 * In the deferred case, free the existed fwspec.
+	 * Always initialize the fwspec internally.
+	 */
+	if (fwspec) {
+		iommu_fwspec_free(dev);
+		fwspec = dev_iommu_fwspec_get(dev);
+	}
+
 	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
 					   "#iommu-cells",
 					   idx, &iommu_spec)) {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
