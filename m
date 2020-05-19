Return-Path: <SRS0=0J5R=7B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC68DC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 13:28:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC44207D8
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2020 13:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WVRpxbbX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCC44207D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=B5+3rdDq5QL2DjRlNi7cjC3KipDXp66M7dNmjm4TFE0=; b=WVR
	pxbbX9wdCzXG+mBivFEWyTLMBw7JKyEla+8e2Qls/CcDM6ogjs/4h0pHpW6D2XHXkrbHAJc7LGj+5
	g/hRUyIFdc/pAWdaYGdw03r/BmuVyuXoRhq8srysDDqbHgbZId/dQxzVanuXCNMKoypFQauDKIFRc
	4f5cbaFOkgW/6eT83KMFE1Ptk+fTq+UmZwCs99IhRSanD9qfHS0mE8qJQ+FmKKJpSznc2u0ZfJhGV
	03dZHC0oHcViaQdeT42SM7pepMc8N7RfaIfJObhasN0CrXUaazUtQe9jvSpPTlA4oohgTTQWskul0
	VgrpJ7fpxGz1XgCz8qAZjyC9XhyY5Qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb2Ie-00088F-Se; Tue, 19 May 2020 13:28:52 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb2IU-0007wf-7Y; Tue, 19 May 2020 13:28:43 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 7785F386; Tue, 19 May 2020 15:28:33 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH] iommu: Don't call .probe_finalize() under group->mutex
Date: Tue, 19 May 2020 15:28:24 +0200
Message-Id: <20200519132824.15163-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_062842_433084_4430C0DE 
X-CRM114-Status: GOOD (  10.39  )
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
Cc: Joerg Roedel <jroedel@suse.de>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Joerg Roedel <jroedel@suse.de>

The .probe_finalize() call-back of some IOMMU drivers calls into
arm_iommu_attach_device(). This function will call back into the
IOMMU core code, where it tries to take group->mutex again, resulting
in a deadlock.

As there is no reason why .probe_finalize() needs to be called under
that mutex, move it after the lock has been released to fix the
deadlock.

Cc: Yong Wu <yong.wu@mediatek.com>
Reported-by: Yong Wu <yong.wu@mediatek.com>
Fixes: deac0b3bed26 ("iommu: Split off default domain allocation from group assignment")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 629d209b8e88..d5d9fcbc9714 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1683,17 +1683,8 @@ static void probe_alloc_default_domain(struct bus_type *bus,
 static int iommu_group_do_dma_attach(struct device *dev, void *data)
 {
 	struct iommu_domain *domain = data;
-	const struct iommu_ops *ops;
-	int ret;
-
-	ret = __iommu_attach_device(domain, dev);
-
-	ops = domain->ops;
-
-	if (ret == 0 && ops->probe_finalize)
-		ops->probe_finalize(dev);
 
-	return ret;
+	return __iommu_attach_device(domain, dev);
 }
 
 static int __iommu_group_dma_attach(struct iommu_group *group)
@@ -1702,6 +1693,21 @@ static int __iommu_group_dma_attach(struct iommu_group *group)
 					  iommu_group_do_dma_attach);
 }
 
+static int iommu_group_do_probe_finalize(struct device *dev, void *data)
+{
+	struct iommu_domain *domain = data;
+
+	if (domain->ops->probe_finalize)
+		domain->ops->probe_finalize(dev);
+
+	return 0;
+}
+
+static void __iommu_group_dma_finalize(struct iommu_group *group)
+{
+	__iommu_group_for_each_dev(group, group->default_domain,
+				   iommu_group_do_probe_finalize);
+}
 static int iommu_do_create_direct_mappings(struct device *dev, void *data)
 {
 	struct iommu_group *group = data;
@@ -1754,6 +1760,8 @@ int bus_iommu_probe(struct bus_type *bus)
 
 		if (ret)
 			break;
+
+		__iommu_group_dma_finalize(group);
 	}
 
 	return ret;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
