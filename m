Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39CBC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 22:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/+1/Xy/oMl85EwlznQPMBlg4SJKLxQKry9nxTTQZbw=; b=tjU+ttSMWc8/g8NpKYwq+GNCt9
	U/Cst6Uhbm8na0DDr8NxyuA5PtiyzslTZGTGPueSjXXhk3W7G9X+xn7o4CYZiED2ysWKaMkXBecCl
	NcA+vupDL5wRC/eJD1Xn/ak3Heo9zxG/jq1kObsF1me+kw30drcU/yGZFQVYJWKsp9lhWtXyKoLc5
	s6jVeLIHqef+3rH8BM/YqBCiuWgH0YY3ebTLrAgUXx2FoqFf4/Qihz5ZGrqRUZKJ4dypcDLKqYEj4
	2vK7Eh+y5lZBuwKIksbqEbvKNx/rs34mhQgqUYbzX3Q1qwxRp2Bhub+lWI56MENohmVMZj3q8AXNT
	wrYbhdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3mdU-007XGT-9K; Tue, 21 Jun 2022 22:46:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3mdR-007XF9-Js
	for linux-mediatek@lists.infradead.org; Tue, 21 Jun 2022 22:46:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655851567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f/+1/Xy/oMl85EwlznQPMBlg4SJKLxQKry9nxTTQZbw=;
	b=Xig8AL7bKmoYrVt3KaOD6ZubfTjvJ95Z/iKKaeu4FmsD6e4BRA0kk5O6toWz43616jEavp
	31pZ6D4Czl9IS0ucpR8VD7XG2jarpF94jm6yftW88mjROVNgZs8jKwdA+dYZhWQRvtMgDz
	MxgTgFzZdt1QuRURiLBcmwfgs0p1puA=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-ItnRz_hmPpu065qN-DSawA-1; Tue, 21 Jun 2022 18:46:06 -0400
X-MC-Unique: ItnRz_hmPpu065qN-DSawA-1
Received: by mail-il1-f197.google.com with SMTP id l4-20020a056e021c0400b002d92232d76dso2939635ilh.1
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jun 2022 15:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=f/+1/Xy/oMl85EwlznQPMBlg4SJKLxQKry9nxTTQZbw=;
        b=iNXk28lqMSp7NIrPDq0s6b9gzIjU55Tj/lxcVPNbsmyvY51fE+1Ul3FpJcU77qkABX
         YCVw4oNS5U9Rk99j87G6ZcgA7JDhBcV51XBuMVDWyTTSQ0dkhBF2A63TuKgSOAAC8zqZ
         FV95LoBsl/MayYT2A4UQgO1iNyPtGcE0WhKikYeuLheXRBJAyr/s58K9UGxKcSr/MgMk
         4NiaHZ8ATK6oqC1GRidXmBGL0epQvSSPvh8+40mjIi16eWQqjL6wxmfzkeZQ+Fo1vuN3
         T/3Me5CfP33Cv9202bd8JHcsqY4MwvoathVsXlXQpp8067tqwU7HDcIAPyTpMX8TI8Ey
         IiEg==
X-Gm-Message-State: AJIora8uVK/WzAHrlSM5PU2PslzxnN4d+ICodHhJFeTz08HXCfEMwG/r
	YOzJh/W84bLZPk/qafJbjt9pcEoWpdNtEmS+eQbWyiSWkdDlFuU3PbUr+B9y7wUFcjMV7aGAgU+
	FqnldVoyTVjnXDPc32Ay/OmRLKsdcuHIk
X-Received: by 2002:a6b:ba43:0:b0:669:a9b2:48fb with SMTP id k64-20020a6bba43000000b00669a9b248fbmr192979iof.125.1655851566152;
        Tue, 21 Jun 2022 15:46:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tCBBV2lQEfTtXWwkhfe9gHC1iihjOMaGFwTYEcz2D9BCipjXjT/6swp6lkrYHefJSlpm5AwA==
X-Received: by 2002:a6b:ba43:0:b0:669:a9b2:48fb with SMTP id k64-20020a6bba43000000b00669a9b248fbmr192927iof.125.1655851565803;
        Tue, 21 Jun 2022 15:46:05 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id m3-20020a056638224300b00339c015fd84sm2073679jas.59.2022.06.21.15.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 15:46:05 -0700 (PDT)
Date: Tue, 21 Jun 2022 16:46:02 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
 <sven@svenpeter.dev>, <robin.murphy@arm.com>, <robdclark@gmail.com>,
 <baolu.lu@linux.intel.com>, <matthias.bgg@gmail.com>,
 <orsonzhai@gmail.com>, <baolin.wang7@gmail.com>, <zhang.lyra@gmail.com>,
 <jean-philippe@linaro.org>, <jgg@nvidia.com>, <kevin.tian@intel.com>,
 <suravee.suthikulpanit@amd.com>, <alyssa@rosenzweig.io>,
 <dwmw2@infradead.org>, <yong.wu@mediatek.com>, <mjrosato@linux.ibm.com>,
 <gerald.schaefer@linux.ibm.com>, <thierry.reding@gmail.com>,
 <vdumpa@nvidia.com>, <jonathanh@nvidia.com>, <cohuck@redhat.com>,
 <thunder.leizhen@huawei.com>, <tglx@linutronix.de>,
 <christophe.jaillet@wanadoo.fr>, <john.garry@huawei.com>,
 <chenxiang66@hisilicon.com>, <saiprakash.ranjan@codeaurora.org>,
 <isaacm@codeaurora.org>, <yangyingliang@huawei.com>,
 <jordan@cosmicpenguin.net>, <iommu@lists.linux-foundation.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-s390@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <virtualization@lists.linux-foundation.org>, <kvm@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] vfio/iommu_type1: Prefer to reuse domains vs
 match enforced cache coherency
Message-ID: <20220621164602.4079bf43.alex.williamson@redhat.com>
In-Reply-To: <20220616000304.23890-3-nicolinc@nvidia.com>
References: <20220616000304.23890-1-nicolinc@nvidia.com>
	<20220616000304.23890-3-nicolinc@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_154613_755983_E083297F 
X-CRM114-Status: GOOD (  28.10  )
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

On Wed, 15 Jun 2022 17:03:01 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> The KVM mechanism for controlling wbinvd is based on OR of the coherency
> property of all devices attached to a guest, no matter those devices are
> attached to a single domain or multiple domains.
> 
> So, there is no value in trying to push a device that could do enforced
> cache coherency to a dedicated domain vs re-using an existing domain
> which is non-coherent since KVM won't be able to take advantage of it.
> This just wastes domain memory.
> 
> Simplify this code and eliminate the test. This removes the only logic
> that needed to have a dummy domain attached prior to searching for a
> matching domain and simplifies the next patches.
> 
> It's unclear whether we want to further optimize the Intel driver to
> update the domain coherency after a device is detached from it, at
> least not before KVM can be verified to handle such dynamics in related
> emulation paths (wbinvd, vcpu load, write_cr0, ept, etc.). In reality
> we don't see an usage requiring such optimization as the only device
> which imposes such non-coherency is Intel GPU which even doesn't
> support hotplug/hot remove.

The 2nd paragraph above is quite misleading in this respect.  I think
it would be more accurate to explain that the benefit to using separate
domains was that devices attached to domains supporting enforced cache
coherency always mapped with the attributes necessary to provide that
feature, therefore if a non-enforced domain was dropped, the associated
group removal would re-trigger an evaluation by KVM.  We can then go on
to discuss that in practice the only known cases of such mixed domains
included an Intel IGD device behind an IOMMU lacking snoop control,
where such devices do not support hotplug, therefore this scenario lacks
testing and is not considered sufficiently relevant to support.  Thanks,

Alex

> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index c13b9290e357..f4e3b423a453 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -2285,9 +2285,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  	 * testing if they're on the same bus_type.
>  	 */
>  	list_for_each_entry(d, &iommu->domain_list, next) {
> -		if (d->domain->ops == domain->domain->ops &&
> -		    d->enforce_cache_coherency ==
> -			    domain->enforce_cache_coherency) {
> +		if (d->domain->ops == domain->domain->ops) {
>  			iommu_detach_group(domain->domain, group->iommu_group);
>  			if (!iommu_attach_group(d->domain,
>  						group->iommu_group)) {


