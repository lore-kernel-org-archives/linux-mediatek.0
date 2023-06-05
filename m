Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9724C7EE24
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 14:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZlBYc9HlxnkPVGelypQwTEkzoXzoH+AZxG0iU2J8Zc=; b=BY0JAxUlOQNmpedMJBOfjptH43
	QH8/ypbu4Q+d8mqnsAJ+jnpToEliuDoAIfNciqvYPEk/SSDKAZlcNAKe9hSb86lTghZV97X6sCw9g
	itjJjIZmDnJ2g3lm67xOaOzBzydnKDrYMRvb/uMrH0MGbShgYPIziXfCSr5fK/StSPMGprEbyYhGg
	c2YcPMG4srLbfmBWCUJ37GCoGz9FuPHqhY7WJdGLri6D5dgGv962izR7Td4BL9hGHu7PkJrlup5UY
	p4QQ+8CPx/27Bkh5TI5KWTvqHgATV2q7uvutK4EfgU6JRstC8eZTsIb990roOT+KQlwiKKCB/VMm7
	odwkiBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6AlB-00Fhrs-2R;
	Mon, 05 Jun 2023 14:00:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Al8-00Fhr6-1n
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 14:00:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8ABDD75;
	Mon,  5 Jun 2023 07:01:16 -0700 (PDT)
Received: from [10.57.85.135] (unknown [10.57.85.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEB083F663;
	Mon,  5 Jun 2023 07:00:28 -0700 (PDT)
Message-ID: <01dee34c-5663-22f4-0d88-90f87b1fe879@arm.com>
Date: Mon, 5 Jun 2023 15:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v5 10/17] iommu: Do iommu_group_create_direct_mappings()
 before attach
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>,
 =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, linux-mediatek@lists.infradead.org
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Tom Rix <trix@redhat.com>, Will Deacon <will@kernel.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, Heiko Stuebner <heiko@sntech.de>,
 Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
References: <0-v5-1b99ae392328+44574-iommu_err_unwind_jgg@nvidia.com>
 <10-v5-1b99ae392328+44574-iommu_err_unwind_jgg@nvidia.com>
 <20230605070959.moupivvi7wr4nibu@rcn-XPS-13-9305>
 <ZH3nXbVFR6JfUKpV@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <ZH3nXbVFR6JfUKpV@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_070034_638860_66A3938C 
X-CRM114-Status: GOOD (  12.80  )
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

On 2023-06-05 14:47, Jason Gunthorpe wrote:
> On Mon, Jun 05, 2023 at 09:09:59AM +0200, Ricardo Cañuelo wrote:
>> [   16.267594] Call trace:
>> [   16.267597]  mtk_iommu_flush_iotlb_all+0x18/0x70
>> [   16.267603]  iommu_create_device_direct_mappings.part.0+0x13c/0x21c
>> [   16.267608]  iommu_setup_default_domain+0x27c/0x430
>> [   16.267611]  iommu_probe_device+0x7c/0x144
>> [   16.267615]  of_iommu_configure+0x114/0x200
>> [   16.267619]  of_dma_configure_id+0x1e0/0x3b4
> 
> This is definitely some problem in the mtk driver.. But I can't guess
> what is wrong:
> 
> static void mtk_iommu_flush_iotlb_all(struct iommu_domain *domain)
> {
> 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
> 
> 	if (dom->bank)
> 		mtk_iommu_tlb_flush_all(dom->bank->parent_data);
> }
> 
> We know domain != NULL since the caller checked (and de-ref'd)
> it.
> 
> dom->bank should either be NULL (if pre-finalize) or a devm tracked
> pointer.
> 
> parent_data is always valid if bank is valid.
> 
> So I'm at a loss.. Can you debug a bit more and find out where mtk is
> crashing?

The log says it's next-20230530 - the fix you're seeing there from 
commit b3fc95709c54 landed 2 days later :)

Robin.

