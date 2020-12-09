Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0FDC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:13:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBCEF23B7D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBCEF23B7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8HkPIAWTx1DBpzCFokeJhkXYAP0Vjbs1uqBbLJ7xCac=; b=ZJ4pPy9lJN2kdQzQ2zK/JjvH0
	z+h7Jho/wbJkVAzdcX9sknWRybJfXrsGD9+WOFKvyKhzb25q91dJjSkD3SFm2aWPF+JnDeYFN/YfF
	me7KtBgrtFUaYOiCY89siGnymJeAi+lnTwAPklcfs5GUWwCY5HHFoURRtHHW2Lhd+uXpyVpXp5A8g
	xGLlB8UsEM8cbngfpZ6AeWMKjQ5GHPNy0ISIoerqZcUJ5uPvc3VFapE0/AoGvu9EgwnBjNWAuJFoF
	tyWeODnLgt9DhdMWIMtgxkh9303LVqE8v8MBj5skzZAZ5pzKwtl4k0JmqXM7knY2TutZCCS6wwur1
	OdoWJMihw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmuZk-0006Od-9n; Wed, 09 Dec 2020 08:11:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmuZX-0006H9-4r; Wed, 09 Dec 2020 08:11:40 +0000
X-UUID: 5653a5aefdcc492e9f462e506bbc3c47-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wJ1EVGX6G/SUHEgHmxBXvnzz4IvBsvqb7qB6Sk39wMU=; 
 b=A9E0rRltb1F6lTku352b9ctjoXEJtOu00BEEIVWDw4N8Y0lwms3jGAKPo/psByXH9ky/wW+XVekgaNPcrb23rFuF832SfsSxJ8D28L66A9AJcqDaV9gz6CbReWrsbTMCH2SprffEMtTFWyxdOqBiSQQwZ462Y46THwg6+ftvVlM=;
X-UUID: 5653a5aefdcc492e9f462e506bbc3c47-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 122083447; Wed, 09 Dec 2020 00:11:33 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 00:03:43 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:03:38 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 16:03:41 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v5 15/27] iommu/mediatek: Add fail handle for sysfs_add and
 device_register
Date: Wed, 9 Dec 2020 16:00:50 +0800
Message-ID: <20201209080102.26626-16-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201209080102.26626-1-yong.wu@mediatek.com>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_031139_397075_954D3F5C 
X-CRM114-Status: GOOD (  13.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add fail handle for iommu_device_sysfs_add and iommu_device_register.

Fixes: b16c0170b53c ("iommu/mediatek: Make use of iommu_device_register interface")
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 39478cfbe0f1..09c8c58feb78 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -746,7 +746,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 
 	ret = iommu_device_register(&data->iommu);
 	if (ret)
-		return ret;
+		goto out_sysfs_remove;
 
 	spin_lock_init(&data->tlb_lock);
 	list_add_tail(&data->list, &m4ulist);
@@ -754,7 +754,16 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	if (!iommu_present(&platform_bus_type))
 		bus_set_iommu(&platform_bus_type, &mtk_iommu_ops);
 
-	return component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
+	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
+	if (ret)
+		goto out_dev_unreg;
+	return ret;
+
+out_dev_unreg:
+	iommu_device_unregister(&data->iommu);
+out_sysfs_remove:
+	iommu_device_sysfs_remove(&data->iommu);
+	return ret;
 }
 
 static int mtk_iommu_remove(struct platform_device *pdev)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
