Return-Path: <SRS0=0J5R=7B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB96CC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 07:59:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 766142075F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 07:59:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iwS+ydWm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MEp/XMgl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 766142075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5sNMOAaFhrX9q14xE6+DNobcbuJMbTAjNloDvaErp2o=; b=iwS+ydWmjRIaJG
	4BhVUXrOrwjK0Z9POIas9mg79iDn0iVM6kTzy2Xa4G7InCbsXLTvIsva4sfPfktEIetpS14tmsMFn
	A2rRRRzNrkkgwKlr0lgguKE4LKVB0cjcpI7Zu0jtC2vgyY3MNFlgL83cXwbjzT8yM8Rg6iQHgTkHJ
	jHTZNUCTFH4hod4Qe41rkvfbuSgV2qfS7ULhE2ZFMOH5y2sw+wGadl6fLf/SI8+nCFrmNkLse/ja7
	k2AkVPI3WqV3aSxXKL7eCAWOc4iI/Wkqn0TFtCuMC4UVNIyTaJUvc089i845tM1UQ/utErBH82fQE
	k3dLnWGWZSBwKjY+9Hwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaxA3-00086M-7o; Tue, 19 May 2020 07:59:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaxA0-000854-AH; Tue, 19 May 2020 07:59:37 +0000
X-UUID: c1f166ca11534f9ca3f5ee181e3ac823-20200518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=w56DMjDW1t+pDgMar7ZfMyyYyD5Y5aJwVP9f2+U7Tvo=; 
 b=MEp/XMglaALKsIoR4lbn83uU3/HuXt85jXLY912EdZmZpetgtZmwteERT4RtoGzpt/5W5n4tpVrFdtRk14rsAe9iH6h0oiQjV6HwBVUGaKS54NcGd9OISXs+SytrmXZr1RUPP5t8cL6Q2KtZgwwlujimzyZLsVsYZRsTZfytdSo=;
X-UUID: c1f166ca11534f9ca3f5ee181e3ac823-20200518
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 755189428; Mon, 18 May 2020 23:59:38 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 00:59:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 15:59:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 May 2020 15:59:24 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] iommu/mediatek-v1: Fix a build warning for a unused variable
 'data'
Date: Tue, 19 May 2020 15:57:44 +0800
Message-ID: <1589875064-662-1-git-send-email-yong.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_005936_359064_62D567C4 
X-CRM114-Status: GOOD (  10.23  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com, srv_heupstream@mediatek.com,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch fixes a build warning:
drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_release_device':
>> drivers/iommu/mtk_iommu_v1.c:467:25: warning: variable 'data' set but
>> not used [-Wunused-but-set-variable]
467 |  struct mtk_iommu_data *data;
|                         ^~~~

It's reported at:
https://lore.kernel.org/linux-iommu/202005191458.gY38V8bU%25lkp@intel.com/T/#u

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu_v1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index f353b07..c9d79cf 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -469,12 +469,10 @@ static void mtk_iommu_probe_finalize(struct device *dev)
 static void mtk_iommu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct mtk_iommu_data *data;
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return;
 
-	data = dev_iommu_priv_get(dev);
 	iommu_fwspec_free(dev);
 }
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
