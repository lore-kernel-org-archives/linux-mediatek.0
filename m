Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A660C46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 06:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i65n54Pntj3LMiHk0kDTcKGqGuncnAshkJdAZpuEpWA=; b=Gup7+b4w/HoK2HIwmanCPu49g7
	zjITiYjhko/mHJ9+T3o3IWmqs+ykARwrkISTRHMCpWbVUxj4adhuQuFErnm2lB7b2Pn5ZQLDLLcel
	lm2w3PAD6S08Q8eH0u67eB+iw2NUHtXaWMkYvIW3E6CNdIfEeCqekk60CHgEwh90nNReDH0WQBAlc
	8V02uQZSsIUIrbX10V+yQ3Wa5nGeewjz/4rr/KytHcm0dN4ALib/J30VXqVmFjLVDdW1mtl81Y32o
	Ysp+kXofQ13sqX6LOPj2i35vCu4+4s05PAHsaGrxY3i4X2v/PKlUKSC5pq7HmorQx4H5yuexwwwv2
	4U49I/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFUJP-009ozG-5o; Wed, 11 Jan 2023 06:10:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFUJM-009oyw-Oi; Wed, 11 Jan 2023 06:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i65n54Pntj3LMiHk0kDTcKGqGuncnAshkJdAZpuEpWA=; b=WBvlVSUf4g1tAJjUM1N8Xli1XS
	apOD/BU1YPLNF2XGEwLht4vNJCMSS18sRZgOw7JFjo1ZbnweF8LEtqED2YWKxXMiIq4a3C2cEpwcc
	zdypf260g8eWPeIJ1+imF7w1Inz5rbY05bdxMGW3N63CIRDmYuWJws+aQ7R9eyeOip240EPBI/e/l
	PXAE5GOz/pc/DczakpidmPeKsaoSvPngL9vv3DTAbD/xCLNTse1vlLZTWTyfhrZZ3bP3rTlWzXwe1
	I7+Anozn/iktT+RLsaGv8OmM1lxs7JeYkDX+RIm0ZufjoVKnqFaumm8i+51zJB502b54Z2tuXbdiF
	XA32/QZg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFUJ8-003YIR-0M;
	Wed, 11 Jan 2023 06:09:58 +0000
X-UUID: 8d07b44c917611eda08d4d6090ec5a5c-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=i65n54Pntj3LMiHk0kDTcKGqGuncnAshkJdAZpuEpWA=;
	b=nvfoG21pOh2CcD9c3C/hTaCva/8FDgfUp43AjNHK3Va/SdJ7arP2NqyWh60WOeP3QW2yVJ69MgSySQhkydajWuLElIOiPd9tjL0EqgTE8eEZxX/ltVTphgE1TiTIvJPcrivZBqqQ43ugnsgNBJgpNs2GpQHP5f2yrW6NcWgcjlg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:8665217e-a1a4-4ce2-87db-bf2da17d95af,IP:0,U
	RL:0,TC:0,Content:9,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:54
X-CID-INFO: VERSION:1.1.17,REQID:8665217e-a1a4-4ce2-87db-bf2da17d95af,IP:0,URL
	:0,TC:0,Content:9,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:54
X-CID-META: VersionHash:543e81c,CLOUDID:266beb8b-8530-4eff-9f77-222cf6e2895b,B
	ulkID:230111140913KY6GPHWI,BulkQuantity:2,Recheck:0,SF:28|17|19|48|102,TC:
	nil,Content:4,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: 8d07b44c917611eda08d4d6090ec5a5c-20230110
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yf.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 167238183; Tue, 10 Jan 2023 23:09:47 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 11 Jan 2023 14:09:11 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 14:09:10 +0800
From: <yf.wang@mediatek.com>
To: <robin.murphy@arm.com>
CC: <Libo.Kang@mediatek.com>, <Ning.Li@mediatek.com>, <iommu@lists.linux.dev>,
	<jianjiao.zeng@mediatek.com>, <joro@8bytes.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
	<will@kernel.org>, <wsd_upstream@mediatek.com>, <yf.wang@mediatek.com>,
	<yong.wu@mediatek.com>
Subject: RE: [PATCH] iommu/iova: Fix alloc iova overflows issue
Date: Wed, 11 Jan 2023 13:57:49 +0800
Message-ID: <20230111055749.11519-1-yf.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <99695d77-e54f-3270-ee9a-9b3cbb3296e5@arm.com>
References: <99695d77-e54f-3270-ee9a-9b3cbb3296e5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_060955_097008_3B9A78D4 
X-CRM114-Status: GOOD (  31.53  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2023-01-09 at 11:47 +0000, Robin Murphy wrote:
> On 2023-01-09 08:34, yf.wang@mediatek.com wrote:
> > From: Yunfei Wang <yf.wang@mediatek.com>
> > 
> > In __alloc_and_insert_iova_range, there is an issue that retry_pfn
> > overflows. The value of iovad->anchor.pfn_hi is ~0UL, then when
> > iovad->cached_node is iovad->anchor, curr_iova->pfn_hi + 1 will
> > overflow. As a result, if the retry logic is executed, low_pfn is
> > updated to 0, and then new_pfn < low_pfn returns false to make the
> > allocation successful.
> > 
> > This issue occurs in the following two situations:
> > 1. The first iova size exceeds the domain size. When initializing
> > iova domain, iovad->cached_node is assigned as iovad->anchor. For
> > example, the iova domain size is 10M, start_pfn is 0x1_F000_0000,
> > and the iova size allocated for the first time is 11M. The
> > following is the log information, new->pfn_lo is smaller than
> > iovad->cached_node.
> > 
> > Example log:
> > [  223.798112][T1705487] sh:
> > [name:iova&]__alloc_and_insert_iova_range
> > start_pfn:0x1f0000,retry_pfn:0x0,size:0xb00,limit_pfn:0x1f0a00
> > [  223.799590][T1705487] sh:
> > [name:iova&]__alloc_and_insert_iova_range
> > success start_pfn:0x1f0000,new->pfn_lo:0x1efe00,new-
> > >pfn_hi:0x1f08ff
> > 
> > 2. The node with the largest iova->pfn_lo value in the iova domain
> > is deleted, iovad->cached_node will be updated to iovad->anchor,
> > and then the alloc iova size exceeds the maximum iova size that can
> > be allocated in the domain.
> > 
> > Adding judgment that retry_pfn must be greater than iovad-
> > >start_pfn
> > can fix this issue.
> 
> Hmm, indeed that's a sneaky little bug - thanks for the thorough 
> analysis - but couldn't we avoid the overflow entirely? I don't have
> the 
> complete logic paged in, but superficially it seems like:
> 
> 	retry_pfn = curr_iova->pfn_hi;
> 	...
> 		retry_pfn <= limit_pfn
> 	...
> 		low_pfn = retry_pfn + 1;
> 
> should still work, shouldn't it?
> 
> Thanks,
> Robin.
> 

Hi Robin,
Thanks for your suggestion, your solution is more perfect,
PATCH v2 version will modify it.

Thanks,
Yunfei.

> > Signed-off-by: jianjiao zeng <jianjiao.zeng@mediatek.com>
> > Signed-off-by: Yunfei Wang <yf.wang@mediatek.com>
> > ---
> >   drivers/iommu/iova.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> > index a44ad92fc5eb..0073206c2a95 100644
> > --- a/drivers/iommu/iova.c
> > +++ b/drivers/iommu/iova.c
> > @@ -209,7 +209,8 @@ static int __alloc_and_insert_iova_range(struct
> > iova_domain *iovad,
> >   	} while (curr && new_pfn <= curr_iova->pfn_hi && new_pfn >=
> > low_pfn);
> >   
> >   	if (high_pfn < size || new_pfn < low_pfn) {
> > -		if (low_pfn == iovad->start_pfn && retry_pfn <
> > limit_pfn) {
> > +		if (low_pfn == iovad->start_pfn &&
> > +		    retry_pfn >= iovad->start_pfn && retry_pfn <
> > limit_pfn) {
> >   			high_pfn = limit_pfn;
> >   			low_pfn = retry_pfn;
> >   			curr = iova_find_limit(iovad, limit_pfn);

