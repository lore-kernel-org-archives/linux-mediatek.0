Return-Path: <SRS0=Kof6=5Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CFC3C2D0EA
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 15:00:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E6D0206C0
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 15:00:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DwByE+eE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E6D0206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIOdKRTbwKokZxBViAwq2xToQJYk2BrDUPZgVEGBpUs=; b=DwByE+eE1agdd0
	4AK8Ju6wRN/wNdy3uozFjyxZk7KKzIw7CkShXTm+9Gch9zWyqBUy8ZIXxKM4nP6uo/Uyq+mAJGuKF
	ocQHw+DKp+8tnPAgGsl498CvNgm0pRvelKamfHAmH7bvckgcPxPuY7ZUtC8qks/k2a20JNfZ83RHA
	TIp7YezbmcuIOLolJjgp01QvCs1NFO28DPsiBbCnckMj8t0XtgkOqjq/2ttW5zyZnwlJJ0JcGfqfI
	zh7CzLRL8AS/kP4Xl2+9cA7OLOSULgyAwhbcclPBmyRn3SmctIxf0beVyk7Nelj7VMafSmpBExUpU
	ZDHwxm79EvGiilrnI7nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMCBr-0005y2-WC; Wed, 08 Apr 2020 15:00:32 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMCBe-0004nr-N2; Wed, 08 Apr 2020 15:00:22 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 7190D387; Wed,  8 Apr 2020 17:00:16 +0200 (CEST)
Date: Wed, 8 Apr 2020 17:00:15 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFC PATCH 31/34] iommu/exynos: Create iommu_device in struct
 exynos_iommu_owner
Message-ID: <20200408150014.GM3103@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
 <CGME20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82@eucas1p2.samsung.com>
 <20200407183742.4344-32-joro@8bytes.org>
 <449e7f16-e719-9617-ec92-63b82c0bc33f@samsung.com>
 <f59b0bb3-8c08-9cc9-bb1a-e69b7b226f60@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f59b0bb3-8c08-9cc9-bb1a-e69b7b226f60@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_080020_014371_E80C1FD7 
X-CRM114-Status: GOOD (  10.12  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Marek,

On Wed, Apr 08, 2020 at 04:23:05PM +0200, Marek Szyprowski wrote:
> I need a place to initialize properly all the structures for the given 
> master (IOMMU client device, the one which performs DMA operations).

That could be in the probe_device() call-back, no?

> I tried to move all the initialization from xlate() to device_probe(), 
> but such approach doesn't work.

device_probe() is exynos_sysmmu_probe(), then yes, this is called before
any of the xlate() calls are made.

Would it work to keep the iommu_device structures in the sysmmus and
also create them for the owners? This isn't really a nice solution but
should work the the IOMMU driver until there is a better way to fix
this.

Regards,

	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
