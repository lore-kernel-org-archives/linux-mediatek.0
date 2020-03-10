Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8027CC3F2C6
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 09:13:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 426AF20674
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 09:13:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qd7F9hSU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 426AF20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mgooK5lvG1jC/D6yAyJoY/BBKT+OEAUwOuMwQ6PiDqc=; b=Qd7F9hSUSX1iIExpfhRmti51R0
	K1Mh1mM6JTSXLVV+dFZ1M2bBnxoIuiPI1gSdcbZZcPnRoEF7Hy6tjEygbAyOf9jQCC0ve7LsnRwjN
	cjGe+mLrrFuUcnv7x0lwgb0v2I7avk2wVgeitklcq2TykxY+xYHYPJK929L5BJzALsN4I30Uo+UUJ
	xJO8U01xCjYG38VCBuGoRsQYlbvwB4OUsjGvRmbct8POyGZErLzfFT/JpFCaDkeD+6kpFlb+jIom4
	+owegCpfjjBN2RwYT+OUTSgWDjfivOfaXPLex/IQqxhORSX6l6/Fya/NAHmVgl7rcg2ji0BiidPw4
	1hwnjj3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBawX-0006Pc-24; Tue, 10 Mar 2020 09:12:53 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBawN-0006F2-8A
 for linux-mediatek@lists.infradead.org; Tue, 10 Mar 2020 09:12:46 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 24ECE396; Tue, 10 Mar 2020 10:12:32 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 02/15] ACPI/IORT: Remove direct access of dev->iommu_fwspec
Date: Tue, 10 Mar 2020 10:12:16 +0100
Message-Id: <20200310091229.29830-3-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310091229.29830-1-joro@8bytes.org>
References: <20200310091229.29830-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_021243_473318_E1893454 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Hanjun Guo <guohanjun@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Joerg Roedel <jroedel@suse.de>

Use the accessor functions instead of directly dereferencing
dev->iommu_fwspec.

Tested-by: Hanjun Guo <guohanjun@huawei.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/acpi/arm64/iort.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index ed3d2d1a7ae9..7d04424189df 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1015,6 +1015,7 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 		return ops;
 
 	if (dev_is_pci(dev)) {
+		struct iommu_fwspec *fwspec;
 		struct pci_bus *bus = to_pci_dev(dev)->bus;
 		struct iort_pci_alias_info info = { .dev = dev };
 
@@ -1027,8 +1028,9 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 		err = pci_for_each_dma_alias(to_pci_dev(dev),
 					     iort_pci_iommu_init, &info);
 
-		if (!err && iort_pci_rc_supports_ats(node))
-			dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
+		fwspec = dev_iommu_fwspec_get(dev);
+		if (fwspec && iort_pci_rc_supports_ats(node))
+			fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
 	} else {
 		int i = 0;
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
