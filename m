Return-Path: <SRS0=2GrF=5Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F39C2BA2B
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 14:31:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCD932078E
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Apr 2020 14:31:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WuWhA40u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCD932078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jK+eo3v6pu784MvhxTBX7zoOL7IkP/Wvx5oCXnZ4Gs=; b=WuWhA40uDqz4oG
	cIOEfiMCLN9+MNUvuGyEtp4ZBqpxrONYTG3i79nQ9DVGMHuCTiFBHf4opXWmNT8z/8YnOuqKV+iKm
	PugAA5uw79K2hU3JcQs+95tDtK+MKUg5n2NxGmBT1MTgNzBNaFZCNOpz12POJYYRRFn7K+h7tws70
	4xdHO52Oy0w1hJukrXbsFxyV2fAWs4ChQ5+e3iEd7FKqSDhMq2kowBZLlEdLec34TIcE1YUQAZhaC
	0atTVHYOGGyJbRStU2kBX2Avy4gPi/i6uikmh9SHexemb6e8G2kZd3aFewPGkmgG73s1IqlqxRB+B
	JyNKX2R6M+8gmuPKrgHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMYD1-00087O-Vy; Thu, 09 Apr 2020 14:31:11 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMYCy-00086S-Vu; Thu, 09 Apr 2020 14:31:10 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 40578391; Thu,  9 Apr 2020 16:31:01 +0200 (CEST)
Date: Thu, 9 Apr 2020 16:30:59 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] iommu/exynos: Get rid of 'struct exynos_iommu_owner'
 exynos_iommu_owner
Message-ID: <20200409143059.GP3103@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
 <CGME20200407184501eucas1p25407bc96e4345df406cf6ba061ae6a82@eucas1p2.samsung.com>
 <20200407183742.4344-32-joro@8bytes.org>
 <449e7f16-e719-9617-ec92-63b82c0bc33f@samsung.com>
 <f59b0bb3-8c08-9cc9-bb1a-e69b7b226f60@samsung.com>
 <20200409114620.GA16298@8bytes.org>
 <40af831b-d00c-0cf9-0a06-e60c048a9ab8@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40af831b-d00c-0cf9-0a06-e60c048a9ab8@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_073109_179010_4E58A081 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 09, 2020 at 03:58:00PM +0200, Marek Szyprowski wrote:
> The main problem after your conversion is the fact that ->probe_device() 
> is called very early, before any other platform device (thus IOMMU 
> controller) is is probed. It doesn't handle EPROBE_DEFER too.

I don't quite understand why probe_device() is called too early, as it
is called at the same time add_device() was called before. But anyway,
I have seen a similar problem on OMAP. If the SYSMMU for a master is not
probed yet when probe_device() is called, it can just return -ENODEV and
in your driver you just call but_iommu_probe() when a new SYSMMU got
initialized to re-probe uninitialized masters on the bus. This patch-set
contains a change to export bus_iommu_probe() for exactly that reason.

What do you think?

Regards,

	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
