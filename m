Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A23C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:59:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 207B561206
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 207B561206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y/XGlVgyNs7ARFLHk6T7cnx/ZqOb6aF2Tk9oSfbE+lU=; b=b/lk61Cms2pLrodZkoanGC1Keh
	7z11+uK9x6Xmw0wP5I7sSacXPg7JC/fsGi2dbxifoL2PzwTK4UvVaO/CVZS7D9geXEyvAGq/ew9lc
	7PTXMtPaXZ+IyXwnCrT5UNzUpWJe0Sqn6AjfZitl5O4U8J6rKjaLo1mPLNX+1QHX6HyUNcvIjNjVM
	uxKe6t+eVmc0PdA0nEPQWdU1gDRRXK1dg/yAclJ7PbLu5Z20TGn1NVGOMpB3KkiVNMZaKi1lZa8O7
	45t4/ZCmjrOcAjlTRBhKkrGFjRQW2Gunp6w7OpJR8/NQ80WaNimu1JV4/uQcLThy+rfgYA4MFLDuQ
	K0mxsd3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqXg-005tOO-1h; Mon, 12 Apr 2021 06:59:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqXD-005tM7-Qj; Mon, 12 Apr 2021 06:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=x8CZLxKLpzUVfJZ3e0BGuXAgCXWZx9XWmvJLm8yNleE=; b=EuxFCpzGBfLapZ62GepwGzICv3
 0CqL7icPrH/bwrF4ppqElOTIbLKaze+IWokNyNPPWg4U1/mw6R17/sZ8scyn7EPit4z3WCWe1AAxt
 cKYjorzoZjRzYqubcCcpzUmQzYaxhTJs1l8Pm941hut0P+ezBn1ZcVArVo5P2TfZKLzojlWWmzFxT
 aRw9ydCahwp8/gcP3BfSmmt/kxQDzHTCwr/9Si3IEDjM51bQbpHDUc3dXRasGyzqWxJjP7XRHmhdE
 74v7QMY8HgC8jJ0Ca48/LSZAG6SauZWxTl29NaAyWahO5W2L4kocSBSeFmdCb91XjeXAkgZ1vJ47Z
 8KDqa0PQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqXA-005upG-CE; Mon, 12 Apr 2021 06:58:57 +0000
X-UUID: df087132a50f46c7b27a2c71d5706221-20210411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=x8CZLxKLpzUVfJZ3e0BGuXAgCXWZx9XWmvJLm8yNleE=; 
 b=l7dStEjsoCbD/5lQBYvhGNww1WECndf1on55h8F5WdWONVjpAdmoZUUBtDE8uUqt1uEDNW/7lTbPg7aZvZdqj2rRCb7ZBiPAnGQbzQr09yJXPX5jAfTsSHltgFPMgh8YSk4OZYyUgYZUw4HMB7qlxRTa+nDZ1W6dUP+eVZKAcEI=;
X-UUID: df087132a50f46c7b27a2c71d5706221-20210411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1069356187; Sun, 11 Apr 2021 23:58:55 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 23:48:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 14:48:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 14:48:50 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy
 <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <chao.hao@mediatek.com>, Valdis Kletnieks <valdis.kletnieks@vt.edu>
Subject: [PATCH 1/2] iommu/mediatek-v1: Avoid build fail when build as module
Date: Mon, 12 Apr 2021 14:48:42 +0800
Message-ID: <20210412064843.11614-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_235856_446401_0220FCEA 
X-CRM114-Status: GOOD (  19.67  )
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

When this driver build as module, It build fail like:

ERROR: modpost: "of_phandle_iterator_args"
[drivers/iommu/mtk_iommu_v1.ko] undefined!

This patch remove this interface to avoid this build fail.

Reported-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
Currently below patch is only in linux-next-20210409. This fixes tag may be
not needed. we can add this if it is need.
Fixes: 8de000cf0265 ("iommu/mediatek-v1: Allow building as module")
---
 drivers/iommu/mtk_iommu_v1.c | 62 ++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index be1b20e3f20e..bed0bb9d63fd 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -424,23 +424,21 @@ static struct iommu_device *mtk_iommu_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct of_phandle_args iommu_spec;
-	struct of_phandle_iterator it;
 	struct mtk_iommu_data *data;
-	int err;
+	int err, idx = 0;
 
-	of_for_each_phandle(&it, err, dev->of_node, "iommus",
-			"#iommu-cells", -1) {
-		int count = of_phandle_iterator_args(&it, iommu_spec.args,
-					MAX_PHANDLE_ARGS);
-		iommu_spec.np = of_node_get(it.node);
-		iommu_spec.args_count = count;
+	while (!of_parse_phandle_with_args(dev->of_node, "iommus",
+					   "#iommu-cells",
+					   idx, &iommu_spec)) {
 
-		mtk_iommu_create_mapping(dev, &iommu_spec);
+		err = mtk_iommu_create_mapping(dev, &iommu_spec);
+		of_node_put(iommu_spec.np);
+		if (err)
+			return ERR_PTR(err);
 
 		/* dev->iommu_fwspec might have changed */
 		fwspec = dev_iommu_fwspec_get(dev);
-
-		of_node_put(iommu_spec.np);
+		idx++;
 	}
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
@@ -549,10 +547,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	struct resource			*res;
 	struct component_match		*match = NULL;
-	struct of_phandle_args		larb_spec;
-	struct of_phandle_iterator	it;
 	void				*protect;
-	int				larb_nr, ret, err;
+	int				larb_nr, ret, i;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -580,35 +576,33 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	if (IS_ERR(data->bclk))
 		return PTR_ERR(data->bclk);
 
-	larb_nr = 0;
-	of_for_each_phandle(&it, err, dev->of_node,
-			"mediatek,larbs", NULL, 0) {
+	larb_nr = of_count_phandle_with_args(dev->of_node,
+					     "mediatek,larbs", NULL);
+	if (larb_nr < 0)
+		return larb_nr;
+
+	for (i = 0; i < larb_nr; i++) {
+		struct device_node *larbnode;
 		struct platform_device *plarbdev;
-		int count = of_phandle_iterator_args(&it, larb_spec.args,
-					MAX_PHANDLE_ARGS);
 
-		if (count)
-			continue;
+		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
+		if (!larbnode)
+			return -EINVAL;
 
-		larb_spec.np = of_node_get(it.node);
-		if (!of_device_is_available(larb_spec.np))
+		if (!of_device_is_available(larbnode)) {
+			of_node_put(larbnode);
 			continue;
+		}
 
-		plarbdev = of_find_device_by_node(larb_spec.np);
+		plarbdev = of_find_device_by_node(larbnode);
 		if (!plarbdev) {
-			plarbdev = of_platform_device_create(
-						larb_spec.np, NULL,
-						platform_bus_type.dev_root);
-			if (!plarbdev) {
-				of_node_put(larb_spec.np);
-				return -EPROBE_DEFER;
-			}
+			of_node_put(larbnode);
+			return -EPROBE_DEFER;
 		}
+		data->larb_imu[i].dev = &plarbdev->dev;
 
-		data->larb_imu[larb_nr].dev = &plarbdev->dev;
 		component_match_add_release(dev, &match, release_of,
-					    compare_of, larb_spec.np);
-		larb_nr++;
+					    compare_of, larbnode);
 	}
 
 	platform_set_drvdata(pdev, data);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
