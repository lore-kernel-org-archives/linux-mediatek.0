Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3BBC433E6
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 08:28:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE54021897
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 08:28:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yfNdwQH7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cca/sw3/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE54021897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+5JANijyeRY0Obtnb27FqvSdp/v39Qt28FLFJuED8NM=; b=yfNdwQH79szDplH3KIhTj5wcC
	MTWG9vbPilXYIO/Ofqlf9CBSyF98CzTpKxE8fw/ivqaSvdrTvt697GalcA+U+GuhngibP8fE2SMq8
	w2iOB7xhvsENSFJnrMXedG3T5DbK7tCup9A2PkZiPcaH3h+6ZCMjGNZyQ8HkbNRyVekq+j1Uu1Eeg
	tK/UwH3kj/Ce0BmvCJAQkGBxKRC65pSPa9L7cY6khgxNKjxN3mKhOwx3rqzJpBiKk8wyusm/kWDTl
	/Kr7v8UJrMKL0qXiPJwuf6M3KNdW/KmegDtTwRuHFeCF7aqWvDIJrgec+Zl2EuhuLy0ABhLT0CJde
	4H2kcJ8lA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvGIi-0004Ak-MF; Tue, 14 Jul 2020 08:28:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvGIe-00047k-0u; Tue, 14 Jul 2020 08:28:28 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A18121897;
 Tue, 14 Jul 2020 08:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594715307;
 bh=pIHiPnXl29m/SBs4JyChDxAqMplo09HuFsHg6sAYMJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cca/sw3/jyus9ULYMXo0h2TBjV/Q+OEaM3QXhOQQN9gh0rzZoCsr+lXDNe1Y8FtjC
 zH6wIyiBUzvZMiMF+TML3mUUcwPbiqsXG5lRUNj51n2NEC/bHHPxfZLPDLXc90vJzT
 9YqF/zOe/+XKPeP1v7ljoCLfGG/EMIGPkjW39ynI=
Date: Tue, 14 Jul 2020 09:28:21 +0100
From: Will Deacon <will@kernel.org>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 2/2] iommu: Add gfp parameter to io_pgtable_ops->map()
Message-ID: <20200714082821.GC4516@willie-the-truck>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
 <3093df4cb95497aaf713fca623ce4ecebb197c2e.1591930156.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3093df4cb95497aaf713fca623ce4ecebb197c2e.1591930156.git.baolin.wang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_042828_134306_F368E9DE 
X-CRM114-Status: GOOD (  13.17  )
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

On Fri, Jun 12, 2020 at 11:39:55AM +0800, Baolin Wang wrote:
> Now the ARM page tables are always allocated by GFP_ATOMIC parameter,
> but the iommu_ops->map() function has been added a gfp_t parameter by
> commit 781ca2de89ba ("iommu: Add gfp parameter to iommu_ops::map"),
> thus io_pgtable_ops->map() should use the gfp parameter passed from
> iommu_ops->map() to allocate page pages, which can avoid wasting the
> memory allocators atomic pools for some non-atomic contexts.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
>  drivers/iommu/arm-smmu-v3.c             |  2 +-
>  drivers/iommu/arm-smmu.c                |  2 +-
>  drivers/iommu/io-pgtable-arm-v7s.c      | 18 +++++++++---------
>  drivers/iommu/io-pgtable-arm.c          | 18 +++++++++---------
>  drivers/iommu/ipmmu-vmsa.c              |  2 +-
>  drivers/iommu/msm_iommu.c               |  2 +-
>  drivers/iommu/mtk_iommu.c               |  2 +-
>  drivers/iommu/qcom_iommu.c              |  2 +-
>  include/linux/io-pgtable.h              |  2 +-
>  10 files changed, 26 insertions(+), 26 deletions(-)

I was a bit nervous about us passing GFP_KERNEL with a spinlock held, but
it looks like you've checked all the callsites and it looks fine to me, so:

Acked-by: Will Deacon <will@kernel.org>

Joerg -- not sure what you want to do with this one, as it's likely to
conflict (trivially) with unrelated driver changes.

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
