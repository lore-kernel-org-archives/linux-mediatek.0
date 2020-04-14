Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C86F7C2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 15:28:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97880206A2
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 15:28:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y25zjQTo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97880206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Hofi79CJ6wq/2EGTiyPBvkaerdmotEaaC/I5igmWYA=; b=Y25zjQToCk2qKS
	MFpbFWRzGE3kD4Us1+r2hfQDlWCYQx5xI++RTw+dLIMcFXxU3k5euSaET4m/uKjymZUUWJcLHNdDm
	cwUZVIvV2UHwgwOvlpdksLeJ7PK20/iHrCEABeMJzicupWjTq3uVCyMPejLqwtEhaVPCw7ozNDh6E
	1DSAAUhRhxcEeyg+KqWjO72DfUOWop4WdbjZQ02rKhYr85Ykdw6Z4kCSSOeZ9btkgfczd+vtGhkwm
	UA+94Kt6omBqfuyjnQ/uOmO120Vn0IMMmVrDw9H6w4hWXJ1+MS+6rNqjWdBH9EIsE7DLTs7xud+EU
	mwP65Z/rGcQ2wK8zMyXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jONTl-0002st-D3; Tue, 14 Apr 2020 15:28:01 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jONTi-0002rb-EZ; Tue, 14 Apr 2020 15:28:00 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3493E2A4; Tue, 14 Apr 2020 17:27:54 +0200 (CEST)
Date: Tue, 14 Apr 2020 17:27:52 +0200
From: "joro@8bytes.org" <joro@8bytes.org>
To: "Derrick, Jonathan" <jonathan.derrick@intel.com>
Subject: Re: [RFC PATCH 11/34] iommu: Split off default domain allocation
 from group assignment
Message-ID: <20200414152752.GC14731@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
 <20200407183742.4344-12-joro@8bytes.org>
 <6a801ff9e6471bda7c6f510dfa2ba7e7c35cb559.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a801ff9e6471bda7c6f510dfa2ba7e7c35cb559.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_082758_639277_7CE31C12 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: "heiko@sntech.de" <heiko@sntech.de>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "will@kernel.org" <will@kernel.org>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "agross@kernel.org" <agross@kernel.org>, "jroedel@suse.de" <jroedel@suse.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "gerald.schaefer@de.ibm.com" <gerald.schaefer@de.ibm.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "kgene@kernel.org" <kgene@kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jonathan,

On Mon, Apr 13, 2020 at 10:10:50PM +0000, Derrick, Jonathan wrote:
> I had to add the following for initial VMD support. The new PCIe domain
> added on VMD endpoint probe didn't have the dev_iommu member set on the
> VMD subdevices, which I'm guessing is due to probe_iommu_group already
> having been run on the VMD endpoint's group prior to those subdevices
> being added.
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 8a5e1ac328dd..ac1e4fb9bf48 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1577,6 +1577,9 @@ static int iommu_bus_notifier(struct notifier_block *nb,
>         if (action == BUS_NOTIFY_ADD_DEVICE) {
>                 int ret;
>  
> +               if (!dev_iommu_get(dev))
> +                       return -ENOMEM;
> +
>                 ret = iommu_probe_device(dev);
>                 return (ret) ? NOTIFY_DONE : NOTIFY_OK;
>         } else if (action == BUS_NOTIFY_REMOVED_DEVICE) {

Right, thanks for catching this. The hotplug path does not allocate the
dev->iommu structure yet. I'll have to figure out if the above patch
adds it at the right place, but I'll fix it in the next version.

Thanks again,

	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
