Return-Path: <SRS0=Bv85=4U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B494C3F2C6
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 19:16:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09A5B2073B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 19:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="btMooeHZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsP98JqY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09A5B2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrS2u51oVNpprp2o/txNqI2PQXEH1I54uxaCuNmRGxA=; b=btMooeHZvxnPAK
	eEGdP/v50jiS4xcWGOUUIcxccSlr/m9apq/BodcsWkqV2BSG//XrSOdS2MeJ0Z0rhklZb028xOTg7
	eM6L1YM2OfDY7GRD3q9jbpIBxnH+R05xaz+AvwwJERA7dd2uTxVTzNgXK+E2IF5GEV9N92iVvqnrW
	XyyRcjLN1Q8XJQfmbOVyM6jzACvnZ+A8DhWgVOsCyOboFvXJnjHxAxIoAPXA3lmHinaR46HOhog9h
	ZthFX/r4hXaC3oE1W8r1Rw2jLLGnPCONzToxt8RMlKj18He1d5dwLsj4qoopX1pJwNeLSy5YX9rHl
	mlmwsEE+4Zg9f6i/H/CA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9D1v-0004wq-Ib; Tue, 03 Mar 2020 19:16:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9D1s-0004wU-RS
 for linux-mediatek@lists.infradead.org; Tue, 03 Mar 2020 19:16:34 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 141212073B;
 Tue,  3 Mar 2020 19:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583262991;
 bh=rRMdJDhihpbw492Akq7IhrH8YLKWl8VjOzCCbOZqZac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DsP98JqYh3FZtjF1CgaIUF1AvB9sYez3Kr5jeTN/D4eI6y+Y2osl0oCTFHFAcXdE3
 E2uj9eZLuK/81D2DscuklPOQ5jC12DWI+V9I2qOViOeoGxqyFsUDmSREGzym4rN9s8
 CieEbNz093Xkw5rG5vlq33olUAgybJvqxCT02uRI=
Date: Tue, 3 Mar 2020 19:16:25 +0000
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 00/14] iommu: Move iommu_fwspec out of 'struct device'
Message-ID: <20200303191624.GC27329@willie-the-truck>
References: <20200228150820.15340-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228150820.15340-1-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_111632_949089_F13A2BCF 
X-CRM114-Status: GOOD (  13.53  )
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
Cc: Rob Clark <robdclark@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Joerg,

On Fri, Feb 28, 2020 at 04:08:06PM +0100, Joerg Roedel wrote:
> here is a patch-set to rename iommu_param to dev_iommu and
> establish it as a struct for generic per-device iommu-data.
> Also move the iommu_fwspec pointer from struct device into
> dev_iommu to have less iommu-related pointers in struct
> device.
> 
> The bigger part of this patch-set moves the iommu_priv
> pointer from struct iommu_fwspec to dev_iommu, making is
> usable for iommu-drivers which do not use fwspecs.
> 
> The changes for that were mostly straightforward, except for
> the arm-smmu (_not_ arm-smmu-v3) and the qcom iommu driver.
> Unfortunatly I don't have the hardware for those, so any
> testing of these drivers is greatly appreciated.

I haven't had a chance to review this properly yet, but I did take it
for a spin on my Seattle board with MMU-400 (arm-smmu) and it seems to
work the same as before, so:

Tested-by: Will Deacon <will@kernel.org> # arm-smmu

I'll try to review the patches soon.

Cheers,

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
