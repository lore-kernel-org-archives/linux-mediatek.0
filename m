Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2752C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 06:55:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ABB9207D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 06:55:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uVTrchL7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ptpOJFQJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ABB9207D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0eHyN6rbSnluA7Nw75SJM3xm3CaO3L0rSyMeQT5Rfw=; b=uVTrchL7m+PlXx
	wI4/GRYPs0dT+AD0hyZztDxjX0Vun4xCaXp53alLD7EAwBw50EJhuur3pLH7xwzTdo+0fnTHW76Y4
	Getx/rbRDnAAzzs4MDmUKIH8GZmEMydKVdDbQPiX0W2Y7FdrfBAbPGQA22N2YFEXIaTdso/kBxHbq
	yqaaAFzZRIq2lBTEJpR0D6JFgi2pAcvvyTfnLNj/coA7ekSwKE5yqHIjKhhTnOC+vQOBMUCT/C/YX
	0I3VYLTE7ofY/ih0A+mooOFHG4GR4ECL1BFniOnuU+sT4uQi7oOm6WN7a7UIkvvCQUv5JUkBnWL5P
	lClm4dv9PCCN0HtYkqgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaZge-0004pr-9X; Mon, 18 May 2020 06:55:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaZga-0004pF-Ol
 for linux-mediatek@lists.infradead.org; Mon, 18 May 2020 06:55:42 +0000
X-UUID: dcc079fdc6d143b6982f9aa4130ba5f6-20200517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BE27p8cgAXdiOJaTc4rLjiLgh00VCcwZpGfoS4OOzsM=; 
 b=ptpOJFQJPFBPL0cXkOqi5XQq0/yJTcAYzd6Xd1kQWwUg4VdHh2mnbGPt0mbD9ULSgjuY9RuCQsxe6WDM+RcppeVDqP5klDWQdDGAiu8iiqef6Im9IPnivLimwGbVBzh1ZnPdTsfZL3fSYtLAJ1PlFQquB/C2sLu1OEw+FwOZ+Sc=;
X-UUID: dcc079fdc6d143b6982f9aa4130ba5f6-20200517
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 847130598; Sun, 17 May 2020 22:55:16 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 17 May 2020 23:52:52 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 18 May 2020 14:52:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 18 May 2020 14:52:46 +0800
Message-ID: <1589784680.15083.19.camel@mhfsdcap03>
Subject: Re: [PATCH v2 23/33] iommu/mediatek-v1 Convert to
 probe/release_device() call-backs
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>
Date: Mon, 18 May 2020 14:51:20 +0800
In-Reply-To: <20200515100718.GS18353@8bytes.org>
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200414131542.25608-24-joro@8bytes.org>
 <1589528699.26119.9.camel@mhfsdcap03> <20200515100718.GS18353@8bytes.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 645326C83BAFED16ABAF80B4AAC8D7BA842597586DFE9CAF78B92A85A256ADAF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_235540_814932_50CA4522 
X-CRM114-Status: GOOD (  22.59  )
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
Cc: Joerg Roedel <jroedel@suse.de>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-05-15 at 12:07 +0200, Joerg Roedel wrote:
> Hi,
> 
> On Fri, May 15, 2020 at 03:44:59PM +0800, Yong Wu wrote:
> > On Tue, 2020-04-14 at 15:15 +0200, Joerg Roedel wrote:
> > > -	return iommu_device_link(&data->iommu, dev);
> > > +	err = arm_iommu_attach_device(dev, mtk_mapping);
> > > +	if (err)
> > > +		dev_err(dev, "Can't create IOMMU mapping - DMA-OPS will not work\n");
> > 
> > 
> > Hi Joerg,
> > 
> >      Thanks very much for this patch.
> > 
> >      This arm_iommu_attach_device is called just as we expected.
> > 
> >      But it will fail in this callstack as the group->mutex was tried to
> > be re-locked...
> > 
> > [<c0938e8c>] (iommu_attach_device) from [<c0317590>]
> > (__arm_iommu_attach_device+0x34/0x90)
> > [<c0317590>] (__arm_iommu_attach_device) from [<c03175f8>]
> > (arm_iommu_attach_device+0xc/0x20)
> > [<c03175f8>] (arm_iommu_attach_device) from [<c09432cc>]
> > (mtk_iommu_probe_finalize+0x34/0x50)
> > [<c09432cc>] (mtk_iommu_probe_finalize) from [<c093a8ac>]
> > (bus_iommu_probe+0x2a8/0x2c4)
> > [<c093a8ac>] (bus_iommu_probe) from [<c093a950>] (bus_set_iommu
> > +0x88/0xd4)
> > [<c093a950>] (bus_set_iommu) from [<c0943c74>] (mtk_iommu_probe
> > +0x2f8/0x364)
> 
> Thanks for the report, is
> 
> 	https://lore.kernel.org/lkml/1589530123-30240-1-git-send-email-yong.wu@mediatek.com/
> 
> The fix for this issue or is something else required?

No. That patch only adjust the internal flow to satisfy the latest
framework, it's not for fixing this mutex issue. 

Here I only reported this issue.

below is my local patch. split "dma_attach" to attach_device and
probe_finalize. About attach_device, Use the existed
__iommu_attach_group instead. Then rename from the "dma_attach" to
"probe_finalize" to do the probe_finalize job. And move it outside of
the mutex_unlock.

I'm not sure if it is right. and of course I will test if you have any
other solution. Thanks.


--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1665,26 +1665,20 @@ static void probe_alloc_default_domain(struct
bus_type *bus,
 
 }
 
-static int iommu_group_do_dma_attach(struct device *dev, void *data)
+static int iommu_group_do_probe_finalize(struct device *dev, void
*data)
 {
 	struct iommu_domain *domain = data;
-	const struct iommu_ops *ops;
-	int ret;
-
-	ret = __iommu_attach_device(domain, dev);
-
-	ops = domain->ops;
+	const struct iommu_ops *ops = domain->ops;
 
-	if (ret == 0 && ops->probe_finalize)
+	if (ops->probe_finalize)
 		ops->probe_finalize(dev);
-
-	return ret;
+	return 0;
 }
 
-static int __iommu_group_dma_attach(struct iommu_group *group)
+static int iommu_group_probe_finalize(struct iommu_group *group)
 {
 	return __iommu_group_for_each_dev(group, group->default_domain,
-					  iommu_group_do_dma_attach);
+					  iommu_group_do_probe_finalize);
 }
 
 static int iommu_do_create_direct_mappings(struct device *dev, void
*data)
@@ -1731,12 +1725,14 @@ int bus_iommu_probe(struct bus_type *bus)
 
 		iommu_group_create_direct_mappings(group);
 
-		ret = __iommu_group_dma_attach(group);
+		ret = __iommu_attach_group(group->default_domain, group);
 
 		mutex_unlock(&group->mutex);
 
 		if (ret)
 			break;
+
+		iommu_group_probe_finalize(group);
 	}
 
 	return ret;
-- 

> 
> 
> Thanks,
> 
> 	Joerg
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
