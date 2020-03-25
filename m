Return-Path: <SRS0=43xy=5K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065A2C54FD0
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 12:34:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB9F22077D
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 12:34:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h3IaiL4K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB9F22077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=it8AK8iRDJ02kAQDhpfyTrLeDz+iFO3pCRhsGYeBlog=; b=h3IaiL4KJOXts71Jweg+wRiAy
	jM3sq2wbf1zaZV6+AvCblJ58FTgTgMB+MfwyYQyJmvIhQmT01jBGRRLjdNEFP0NIo3e92fLBiWv2c
	IBJJY32GMmDmHhfDZoYMoW34VWEfTOmTe5IQAmrs2l7wZ5are6xAHF+xl5ZpSwpZgEV1FO5FYj0eY
	SXnSdogoaK9nPbA4bNT3tv872dbeLpgOJE88Jnioav6BsUCHa8kS2EiRdr9Cf0Z4GWikP/2aWg29Z
	4jA1t4VMge8dYy08XozcXXAO0pQlttmYSx1oLHEZ9qEcaJvL+hf4aJ0BOKQaUZID8+4feg+gUwmG4
	SwZn7ZTIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH5EG-0008FZ-Tw; Wed, 25 Mar 2020 12:33:52 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH5CI-0006bZ-LL
 for linux-mediatek@lists.infradead.org; Wed, 25 Mar 2020 12:31:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4A3D31B;
 Wed, 25 Mar 2020 05:31:49 -0700 (PDT)
Received: from [192.168.1.123] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A8983F71F;
 Wed, 25 Mar 2020 05:31:47 -0700 (PDT)
Subject: Re: [PATCH v3 10/15] iommu/arm-smmu: Use accessor functions for iommu
 private data
To: Joerg Roedel <joro@8bytes.org>
References: <20200320091414.3941-1-joro@8bytes.org>
 <20200320091414.3941-11-joro@8bytes.org>
 <09ed4676-449e-c6eb-8c51-c15b326c206c@arm.com>
 <20200324100819.GA4038@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d69dad81-d025-96ef-863c-553b5ed2dd8e@arm.com>
Date: Wed, 25 Mar 2020 12:31:46 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324100819.GA4038@8bytes.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_053150_783989_AEF8D7CE 
X-CRM114-Status: GOOD (  16.40  )
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
Cc: Rob Clark <robdclark@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "guohanjun@huawei.com" <guohanjun@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Sudeep Holla <Sudeep.Holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-03-24 10:08 am, Joerg Roedel wrote:
> Hey Robin,
> 
> On Mon, Mar 23, 2020 at 04:02:33PM +0000, Robin Murphy wrote:
>> Yikes, this ends up pretty ugly, and I'd prefer not have this much
>> complexity hidden in macros that were intended just to be convenient
>> shorthand. Would you mind pulling in the patch below as a precursor?
> 
> Sure thing, but your mail-client seemed to have fiddled with the patch
> so that is is unusable to me. I tried to fix it up, but it still doesn't
> apply. Can you please re-send it to me either via git-send-email or just
> as a mime-attachement?

Oops, sorry - as you might imagine I'm not in my normal workflow :)

Let me rebase that onto something actually in your tree (rather than 
whatever detached HEAD this is checked out out on my laptop...) and try 
resending it properly.

>> Other than that, the rest of the series looks OK at a glance. We should also
>> move fwspec->ops to dev_iommu, as those are "IOMMU API" data rather than
>> "firmware" data, but let's consider that separately as this series is
>> already long enough.
> 
> Yes, moving ops out of fwspec is next on the list, and moving the
> iommu_group pointer into dev_iommu.

Cool, let me know if you need a hand with all the *_iommu_configure() 
stuff - I still have plans for overhauling that lot anyway, but not 
imminently, so it probably is worthwhile to do the straightforward 
housekeeping first.

Thanks,
Robin.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
