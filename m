Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B9BC433E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:39:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D961E2080D
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:39:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T/8f0BhE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D961E2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Y/ati6U4LCXqqdym+GqXfY7W2KIdhrwZUs33FLbp7Y=; b=T/8f0BhEXYZFdeTCkRGxzaLNga
	MzwhpQiRiVoCTQAgrvN7teMOGaSvjq6bLY1kVeelYc5oUJ1odvuESqqL/QHgN/ERfEhLNWUSzivGZ
	gISKiHAiTFNVNmgMd+HqFl0bgzaSKc4X17hm9BHiDLetTkqlWDp9HE6X5TXQAPKpOnLk0lLqxpIx4
	3qejLl3uFYqMhcJe1Vgywfx6/TCLpFNM+FkCgLmjyKThjGWKKFFSzjJ5CMgRKuW13i1PHXUOX9JJT
	FOhF+8ILv1y3NDK+YKXeDbZK6eaMbMPUNcPRs/8osRr/GsF3KrnUaSOkgD/bm4ZCg+hVUeDAvmglY
	UeS1KcrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyZZE-0003k3-MK; Thu, 23 Jul 2020 11:39:16 +0000
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyZZC-0003Ax-DS
 for linux-mediatek@lists.infradead.org; Thu, 23 Jul 2020 11:39:15 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=20; SR=0;
 TI=SMTPD_---0U3a0ySa_1595504212; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0U3a0ySa_1595504212) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 23 Jul 2020 19:36:52 +0800
Date: Thu, 23 Jul 2020 19:36:52 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 2/2] iommu: Add gfp parameter to io_pgtable_ops->map()
Message-ID: <20200723113652.GA104096@VM20190228-100.tbsite.net>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
 <3093df4cb95497aaf713fca623ce4ecebb197c2e.1591930156.git.baolin.wang@linux.alibaba.com>
 <20200714082821.GC4516@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714082821.GC4516@willie-the-truck>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_073914_669022_E1558F3E 
X-CRM114-Status: GOOD (  14.52  )
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
Reply-To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: robh@kernel.org, linux-kernel@vger.kernel.org, tomeu.vizoso@collabora.com,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, joro@8bytes.org,
 iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, baolin.wang7@gmail.com, robdclark@gmail.com,
 agross@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, daniel@ffwll.ch, matthias.bgg@gmail.com,
 steven.price@arm.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 14, 2020 at 09:28:21AM +0100, Will Deacon wrote:
> On Fri, Jun 12, 2020 at 11:39:55AM +0800, Baolin Wang wrote:
> > Now the ARM page tables are always allocated by GFP_ATOMIC parameter,
> > but the iommu_ops->map() function has been added a gfp_t parameter by
> > commit 781ca2de89ba ("iommu: Add gfp parameter to iommu_ops::map"),
> > thus io_pgtable_ops->map() should use the gfp parameter passed from
> > iommu_ops->map() to allocate page pages, which can avoid wasting the
> > memory allocators atomic pools for some non-atomic contexts.
> > 
> > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
> >  drivers/iommu/arm-smmu-v3.c             |  2 +-
> >  drivers/iommu/arm-smmu.c                |  2 +-
> >  drivers/iommu/io-pgtable-arm-v7s.c      | 18 +++++++++---------
> >  drivers/iommu/io-pgtable-arm.c          | 18 +++++++++---------
> >  drivers/iommu/ipmmu-vmsa.c              |  2 +-
> >  drivers/iommu/msm_iommu.c               |  2 +-
> >  drivers/iommu/mtk_iommu.c               |  2 +-
> >  drivers/iommu/qcom_iommu.c              |  2 +-
> >  include/linux/io-pgtable.h              |  2 +-
> >  10 files changed, 26 insertions(+), 26 deletions(-)
> 
> I was a bit nervous about us passing GFP_KERNEL with a spinlock held, but
> it looks like you've checked all the callsites and it looks fine to me, so:
> 
> Acked-by: Will Deacon <will@kernel.org>
> 
> Joerg -- not sure what you want to do with this one, as it's likely to
> conflict (trivially) with unrelated driver changes.

Thanks Will. Joerg, could you apply this 2 patches if no objection from
your side? Thanks.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
