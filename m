Return-Path: <SRS0=UdZw=6B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34289C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 01:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07D8120780
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2020 01:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UydmrDRN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07D8120780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XIUApDYiaPHoaFLzwBMXCA6SOZnps4zYQKumGtlXFeo=; b=UydmrDRNQi8SB0
	OSzjpiFXELzET76s4Lti0wtXZPdpfVKGlmvumWO5UounbtWF7Y6uLp4sCA+70ZQbBYJxNcxJEDmTH
	/cewN051Rn0p8UZVE62w1daUx/Z8hz/Bg82br3iPJxzUFSqqEZv9640/fk5ISR4206OKR+Lbg+vNc
	vIvlcNsmUgOBuazNrQdYcl1DRaPx8px8lYQlnfdhw4SRKvTWXn9yu3Dh5bsFX1NWTTXjX2U7voMeD
	hb5QGu4+ljAewAcJJer5+Uunx+CDYaw8hxAu8zQmWlWsnCiXBHcMXYLrBNCzOHhYgNz6nTccg/pv6
	x2AnuHyDBzFHoXEstQ0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPFaY-0002cy-8U; Fri, 17 Apr 2020 01:14:38 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPFaU-0002bQ-3R; Fri, 17 Apr 2020 01:14:36 +0000
IronPort-SDR: +Y/7tyBOk0v3raFHhcX/9NiCYfLP6Q+cNQvPLHqlnDxMuDE70xkP0ZXZeLoIJmys5R1aIXEPNX
 6NAqdn/dmQ3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 18:14:32 -0700
IronPort-SDR: sZlVw/7cjCHq0F1EFVv0TW8FklMi9s4vHlLYLRHCGjn12jklAHdg6QlmB19PsSs7PeDXqv0gk5
 UINIzZVqpibg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,393,1580803200"; d="scan'208";a="272262073"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by orsmga002.jf.intel.com with ESMTP; 16 Apr 2020 18:14:32 -0700
Received: from orsmsx101.amr.corp.intel.com ([169.254.8.204]) by
 ORSMSX103.amr.corp.intel.com ([169.254.5.143]) with mapi id 14.03.0439.000;
 Thu, 16 Apr 2020 18:14:32 -0700
From: "Derrick, Jonathan" <jonathan.derrick@intel.com>
To: "joro@8bytes.org" <joro@8bytes.org>, "drake@endlessm.com"
 <drake@endlessm.com>
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Thread-Topic: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Thread-Index: AQHWEmDrg4k1XREwpUada/q2n6OD7qh8+KGAgAADDAA=
Date: Fri, 17 Apr 2020 01:14:30 +0000
Message-ID: <aafed865c0254934986528b3ce9c4d34ff2fccad.camel@intel.com>
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200417010335.31739-1-drake@endlessm.com>
In-Reply-To: <20200417010335.31739-1-drake@endlessm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.0.232]
Content-ID: <B8851D46B4E5F2468CD8AA858DAC2199@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_181434_154853_8C2B8D9F 
X-CRM114-Status: GOOD (  14.53  )
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
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "will@kernel.org" <will@kernel.org>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "kgene@kernel.org" <kgene@kernel.org>, "agross@kernel.org" <agross@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "gerald.schaefer@de.ibm.com" <gerald.schaefer@de.ibm.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Daniel,

On Fri, 2020-04-17 at 09:03 +0800, Daniel Drake wrote:
> Hi Joerg,
> 
> > Hi,
> > 
> > here is the second version of this patch-set. The first version with
> > some more introductory text can be found here:
> > 
> > 	https://lore.kernel.org/lkml/20200407183742.4344-1-joro@8bytes.org/
> 
> Thanks for the continued improvements in this area!
> 
> I may have spotted a problem with setups like VMD.
> 
> The core PCI bus is set up during early boot.
> Then, for the PCI bus, we reach iommu_bus_init() -> bus_iommu_probe().
> In there, we call probe_iommu_group() -> dev_iommu_get() for each PCI
> device, which allocates dev->iommu in each case. So far so good.
> 
> The problem is that this is the last time that we'll call dev_iommu_get().
> If any PCI bus devices get added after this point, they do not get passed
> to dev_iommu_get().
> 
> So when the vmd module gets loaded later, and creates more PCI devices,
> we end up in iommu_bus_notifier() -> iommu_probe_device()
> -> __iommu_probe_device() which does:
> 
> 	dev->iommu->iommu_dev = iommu_dev;
> 
> dev->iommu-> is a NULL dereference because dev_iommu_get() was never
> called for this new device.
> 
> Daniel
> 

I should have CCed you on this, but it should temporarily resolve that
issue:
https://lists.linuxfoundation.org/pipermail/iommu/2020-April/043253.html

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
