Return-Path: <SRS0=e3uk=FV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11956C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 02:26:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A72DC2371F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Dec 2020 02:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A72DC2371F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+1PT1nEpgeCQaKoWFfKXGncnsZXocI5BrD3VustYnyI=; b=QyMdtUikCokANh+NDVKUOS16R
	rZzcnuTplyWlx4EcZ1kNP1lRwITBlAxstFPwunrOAptT+Pzxq8nvtJl6Z+lxLFRjJhnDcTdpRLnU9
	f6RTf6Du9p0VkXH7851pnPYA7439HIt69xwLLO+I+ypnp77MVI6gq0uasi7NbBJfDK4xfS1h7zwaN
	QCkAFHY8S5g4Qvy4+HYytWjRp37xDDoMTHzu/JZhVWpmTNB4MSZcEgxRHrWftpH5bnsDZtQawtmYe
	v0V7jRD7pLXnl5/I/J25XjIK1u872t3A/vdVVUbDkhLIasHIlEVRnx+QKGstSR+Hk8cWkyoslTzog
	sSwTg6ffA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpizc-0002E6-Ej; Thu, 17 Dec 2020 02:26:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpizY-0002DF-K8; Thu, 17 Dec 2020 02:26:10 +0000
X-UUID: c30094a2b5034eaaacdaf931901f8d08-20201216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cZkhfVbBy8ld8Co+Td0lutxPr2qax5e+8H5edX0I4Es=; 
 b=S5a/E9Sk262fUlpl4jWNxK94BAjz664cJCG0HUUB1v2v25iDGDSFH/8uu1Gi9Tyj2Xu5RqvzesFBWYBH1a6ArvjIjljorRyDmS9RFcuiLJ64m0VOZTC5zLTuj9c5iOgv4DiJfaV0E0y5uvDKIneqOugHQgLudjmA04GUtiIKaNo=;
X-UUID: c30094a2b5034eaaacdaf931901f8d08-20201216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 543088270; Wed, 16 Dec 2020 18:26:06 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 18:26:05 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 17 Dec 2020 10:26:01 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Dec 2020 10:26:01 +0800
Message-ID: <1608171961.26323.210.camel@mhfsdcap03>
Subject: Re: [PATCH v3 4/7] iommu: Switch gather->end to unsigned long long
From: Yong Wu <yong.wu@mediatek.com>
To: Robin Murphy <robin.murphy@arm.com>
Date: Thu, 17 Dec 2020 10:26:01 +0800
In-Reply-To: <16a9565e-5b01-e1c2-0f4a-d06db7f3b093@arm.com>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-5-yong.wu@mediatek.com>
 <16a9565e-5b01-e1c2-0f4a-d06db7f3b093@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: AB5FD0512F263D6A017B73D1545892F0A3880C0205E3ADED95904F3CF6FAB3A82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_212608_829470_3C539740 
X-CRM114-Status: GOOD (  23.78  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, kernel-team@android.com,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-16 at 12:10 +0000, Robin Murphy wrote:
> On 2020-12-16 10:36, Yong Wu wrote:
> > Currently gather->end is "unsigned long" which may be overflow in
> > arch32 in the corner case: 0xfff00000 + 0x100000(iova + size).
> > Although it doesn't affect the size(end - start), it affects the checking
> > "gather->end < end"
> 
> This won't help the same situation at the top of a 64-bit address space, 
> though, and now that we have TTBR1 support for AArch64 format that is 
> definitely a thing. Better to just encode the end address as the actual 
> end address, i.e. iova + size - 1. We don't lose anything other than the 
> ability to encode zero-sized invalidations that don't make sense anyway.

Thanks for the suggestion. "iova + size - 1" is better. Also I will
change the "size" to "gather->end - gather->start + 1" in the iotlb_sync
of arm-smmu-v3.c and mtk_iommu.c.

> 
> Robin.
> 
> > Fixes: a7d20dc19d9e ("iommu: Introduce struct iommu_iotlb_gather for batching TLB flushes")
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >   include/linux/iommu.h | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > index 794d4085edd3..6e907a95d981 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -178,7 +178,7 @@ enum iommu_dev_features {
> >    */
> >   struct iommu_iotlb_gather {
> >   	unsigned long		start;
> > -	unsigned long		end;
> > +	unsigned long long	end;
> >   	size_t			pgsize;
> >   };
> >   
> > @@ -537,7 +537,8 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
> >   					       struct iommu_iotlb_gather *gather,
> >   					       unsigned long iova, size_t size)
> >   {
> > -	unsigned long start = iova, end = start + size;
> > +	unsigned long start = iova;
> > +	unsigned long long end = start + size;
> >   
> >   	/*
> >   	 * If the new page is disjoint from the current range or is mapped at
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
