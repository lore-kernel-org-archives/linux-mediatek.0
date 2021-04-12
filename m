Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725B8C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:49:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D0D61025
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09D0D61025
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QO69MUbDrO07HQ9stFW6n7SE8kNCSzCF+YsR5KVSxrk=; b=UEtygwNNCQ1JAfMsakad/EpkZ
	WmpQ0Cc6mVBkwwv/Ezfv2K+XL5BVf9SmQDQ20TXnnQcbGY+9MisMzDYzJL5lVdwyK4otG5Ng8Q/s3
	hhHQpBtxfI7s+yaT/T+qSVtNNMtml2BRDM3to75uSnkt1S+5Nxecc52i3X1HHASZrEXnUdR9kxNWK
	+qwIxWiAGoirspYHEA9KsnGuPXmZmCrGXxbWyHob65pl96LiMazd7r6qbPsp88wJhD+9kqub00XQh
	B69DJbMWiEvTBhrOksoFbxEFcNJqnohj0vKd5OqMH2d1uvf2q8PC+6u6fzjRGG3lU3pF4YoMOj80s
	OKSs93nTw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqNt-005rG6-S4; Mon, 12 Apr 2021 06:49:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqNh-005rEL-IZ; Mon, 12 Apr 2021 06:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=/chMObX8gONG03lOQJqSX7Yj4mo1uyM5zVA0M1LSM/I=; b=AgR7JPBU5ymCg72oicIJTar9h8
 pFa49JTFy42HEdPFY2Avvhb0T+QVPp211ykFmXH8k2wBTGYQZDeNOw8zRIAknbJe3nkE0wbgejK3a
 aPJ/k4hXHcRACAkMmxRUk5hSfw3g5haAOqT/kmPOJq+jp4hKA+Ho/P4o10KUpgbmQ4mXiezbVL/7/
 olSuE04hUNviHunsqRlcGUy0rLJvTO4+9ybMKnwk3YqWGYWjxCocRBFNeI15QtKX1T52rH1F3Qs2c
 y2ri+sTG1O1Fw9RlKCDEcrmWyZDknCinzlE3TilxdjYVCKxrrucLA+j7l862W0NbNGHIBxQHR6+1a
 Al+wdevw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqNe-005uTg-I9; Mon, 12 Apr 2021 06:49:07 +0000
X-UUID: b08cc3cec3f94b0d8b92087d9c338ce3-20210411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/chMObX8gONG03lOQJqSX7Yj4mo1uyM5zVA0M1LSM/I=; 
 b=VLyhTl9Ns7d1eCt7+8UyTJTHmE3ksZb3SdQ1ly9b0TAuzU2UEnsiygwNi7O5xePmyweFl/3IBlgHXke2rNvFu7IPStfgDkfvuW98blNqbtWqwjM7X8rnz67RHtowaBNt58AAJFWl/jlrNsVDX4pzsziRKvPm+jUYobjHaQQvewE=;
X-UUID: b08cc3cec3f94b0d8b92087d9c338ce3-20210411
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 631913673; Sun, 11 Apr 2021 23:49:03 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 23:49:01 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 14:49:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 14:48:59 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy
 <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <chao.hao@mediatek.com>, Valdis Kletnieks <valdis.kletnieks@vt.edu>
Subject: [PATCH 2/2] iommu/mediatek-v1: Add error handle for mtk_iommu_probe
Date: Mon, 12 Apr 2021 14:48:43 +0800
Message-ID: <20210412064843.11614-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210412064843.11614-1-yong.wu@mediatek.com>
References: <20210412064843.11614-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_234906_623937_63E4B215 
X-CRM114-Status: GOOD (  13.05  )
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

In the original code, we lack the error handle. This patch adds them.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu_v1.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index bed0bb9d63fd..8ba9a2ec5509 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -620,12 +620,26 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 
 	ret = iommu_device_register(&data->iommu);
 	if (ret)
-		return ret;
+		goto out_sysfs_remove;
 
-	if (!iommu_present(&platform_bus_type))
-		bus_set_iommu(&platform_bus_type,  &mtk_iommu_ops);
+	if (!iommu_present(&platform_bus_type)) {
+		ret = bus_set_iommu(&platform_bus_type,  &mtk_iommu_ops);
+		if (ret)
+			goto out_dev_unreg;
+	}
 
-	return component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
+	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
+	if (ret)
+		goto out_bus_set_null;
+	return ret;
+
+out_bus_set_null:
+	bus_set_iommu(&platform_bus_type, NULL);
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
