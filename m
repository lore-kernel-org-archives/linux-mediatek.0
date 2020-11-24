Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0018C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 09:25:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB302075A
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 09:25:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BH2G/YHA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MW/JNp9o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AB302075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+54edqthOZ/Chk3tr1tzyPTde7kufyqfT56mXR2JkCs=; b=BH2G/YHA+fYBJAC8e0xCulH/O
	4NeLjTNNcQgqd5cyRGVwKHeqVH/RIhtTN9cDKKMF7ZkGu2s8jxOJVzwc3Dab1AEhiSpavfZW7G1Kz
	8ap15NsllrGUjDjX3OGkiAC2/Dy1QG6Kemt2BPvCOuKYF93x8CU71uOUDxZY/jp1Rs1EhuNZc3CwN
	MNGw9Jz74U94jMb1gv9D5BwDnHQ4laJB1xdsw7drmUVCW4hBTNZzY0TbGlyFiUK1mvZkeTcamN4X7
	qlyYqtMPb6qLPEpjEII1EvGRxvMjSuYn9ViPt62ntlVJWBYAfMkiPs1/W7xs30+/tWCZUCy7+QrGL
	84O7GM53w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khUZK-0004SS-58; Tue, 24 Nov 2020 09:25:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khUZD-0004Qk-KD; Tue, 24 Nov 2020 09:24:57 +0000
X-UUID: 7065e78ff7fa4ea88189d139442de55e-20201124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wruLeV1VxmJT3h8u8aTdJS9aBT3lPk6fj9q+96T1tpA=; 
 b=MW/JNp9o0TEwri7Y7ZaZuubqQPaAUgXF2777Ep2zIgKq4V1ojy200tZSse7T+AwrAWfA/qGF1tr7IhGwFcB18Lvv+8fhjcxUsg1f4L0gzpe5a54sTDqBx/jKF6DcYZfsfROGSctyb18C61zOwbkffzL4sJbEYz26MWS1HbLPEWE=;
X-UUID: 7065e78ff7fa4ea88189d139442de55e-20201124
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1858062677; Tue, 24 Nov 2020 01:24:50 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Nov 2020 01:24:43 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 24 Nov 2020 17:24:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Nov 2020 17:24:43 +0800
Message-ID: <1606209884.26323.132.camel@mhfsdcap03>
Subject: Re: [PATCH] iommu: Improve the performance for direct_mapping
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>
Date: Tue, 24 Nov 2020 17:24:44 +0800
In-Reply-To: <20201123123258.GC10233@willie-the-truck>
References: <20201120090628.6566-1-yong.wu@mediatek.com>
 <20201123123258.GC10233@willie-the-truck>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: EBCB8F6C7AAB7CEFD384B30FE7D298E2FA4811C473B599035C7F59E811168DC42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_042456_416473_D0DD315C 
X-CRM114-Status: GOOD (  32.25  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com, Nicolas
 Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-23 at 12:32 +0000, Will Deacon wrote:
> On Fri, Nov 20, 2020 at 05:06:28PM +0800, Yong Wu wrote:
> > Currently direct_mapping always use the smallest pgsize which is SZ_4K
> > normally to mapping. This is unnecessary. we could gather the size, and
> > call iommu_map then, iommu_map could decide how to map better with the
> > just right pgsize.
> > 
> > From the original comment, we should take care overlap, otherwise,
> > iommu_map may return -EEXIST. In this overlap case, we should map the
> > previous region before overlap firstly. then map the left part.
> > 
> > Each a iommu device will call this direct_mapping when its iommu
> > initialize, This patch is effective to improve the boot/initialization
> > time especially while it only needs level 1 mapping.
> > 
> > Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/iommu/iommu.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > index df87c8e825f7..854a8fcb928d 100644
> > --- a/drivers/iommu/iommu.c
> > +++ b/drivers/iommu/iommu.c
> > @@ -737,6 +737,7 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
> >  	/* We need to consider overlapping regions for different devices */
> >  	list_for_each_entry(entry, &mappings, list) {
> >  		dma_addr_t start, end, addr;
> > +		size_t unmapped_sz = 0;
> 
> I think "unmapped" is the wrong word here, as this variable actually
> represents the amount we want to map! I suggest "map_size" instead.
> 
> >  		if (domain->ops->apply_resv_region)
> >  			domain->ops->apply_resv_region(dev, domain, entry);
> > @@ -752,10 +753,25 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
> >  			phys_addr_t phys_addr;
> >  
> >  			phys_addr = iommu_iova_to_phys(domain, addr);
> > -			if (phys_addr)
> > +			if (phys_addr == 0) {
> > +				unmapped_sz += pg_size; /* Gather the size. */
> >  				continue;
> > +			}
> >  
> > -			ret = iommu_map(domain, addr, addr, pg_size, entry->prot);
> > +			if (unmapped_sz) {
> > +				/* Map the region before the overlap. */
> > +				ret = iommu_map(domain, start, start,
> > +						unmapped_sz, entry->prot);
> > +				if (ret)
> > +					goto out;
> > +				start += unmapped_sz;
> 
> I think it's a bit confusing to update start like this. Can we call
> iommu_map(domain, addr - map_size, addr - map_size, map_size, entry->prot)
> instead?
> 
> > +				unmapped_sz = 0;
> > +			}
> > +			start += pg_size;
> > +		}
> > +		if (unmapped_sz) {
> > +			ret = iommu_map(domain, start, start, unmapped_sz,
> > +					entry->prot);
> 
> Can you avoid this hunk by changing your loop check to something like:
> 
> 	if (!phys_addr) {
> 		map_size += pg_size;
> 		if (addr + pg_size < end)
> 			continue;
> 	}

Thanks for your quick review. I have fixed and tested it. the patch is
simple. I copy it here. Is this readable for you now?


--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -737,6 +737,7 @@ static int
iommu_create_device_direct_mappings(struct iommu_group *group,
 	/* We need to consider overlapping regions for different devices */
 	list_for_each_entry(entry, &mappings, list) {
 		dma_addr_t start, end, addr;
+		size_t map_size = 0;
 
 		if (domain->ops->apply_resv_region)
 			domain->ops->apply_resv_region(dev, domain, entry);
@@ -752,12 +753,21 @@ static int
iommu_create_device_direct_mappings(struct iommu_group *group,
 			phys_addr_t phys_addr;
 
 			phys_addr = iommu_iova_to_phys(domain, addr);
-			if (phys_addr)
-				continue;
+			if (!phys_addr) {
+				map_size += pg_size;
+				if (addr + pg_size < end)
+					continue;
+				else
+					addr += pg_size; /*Point to End */
+			}
 
-			ret = iommu_map(domain, addr, addr, pg_size, entry->prot);
-			if (ret)
-				goto out;
+			if (map_size) {
+				ret = iommu_map(domain, addr - map_size, addr - map_size,
+						map_size, entry->prot);
+				if (ret)
+					goto out;
+				map_size = 0;
+			}
 		}

> 
> Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
