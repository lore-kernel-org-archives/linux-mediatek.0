Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D485C7EE24
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 05:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jW2QzKdWyriO8SRFnigos0KPZxwCwcXsEMTvj9Md6oI=; b=IFWRSpl8u58aSsik2DjXrF8WTh
	m2TFbhEbg1sCteVXDN0adD5g0OSXOyh4v/rdG4OFpRvSjcNlKDDfzeMBltYFTCH5MGo0GmjN8TEVQ
	zwZl49ivuU02wHnLsm6Fifge1fpKoc3pU7nCYzTpizsYYm2gQtTgUNjMd476fxFNBOjRCtnWKmavS
	DMCbqkVIYQm2UgmN9ZJDwa/OQUJZ4xyGAAaftYSVpbGih70wFt9LtDUQU4wZjMAuZNQ+obUz7B8uD
	zLwczPWTZKdnmDGf+pNhlksdbfWrev64HWgvU+pMZtJ9bZ3aLYyivZqS6wSNhpqudQKdb+9fFu2Gi
	QJ3hiA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6PKE-000GTu-0i;
	Tue, 06 Jun 2023 05:33:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6PK8-000GSf-06
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 05:33:42 +0000
Received: from [IPV6:2a0c:5a83:9203:ad00:6f2e:82dd:9a04:a2e5] (unknown [IPv6:2a0c:5a83:9203:ad00:6f2e:82dd:9a04:a2e5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: rcn)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 964B666003B1;
	Tue,  6 Jun 2023 06:33:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686029614;
	bh=jW2QzKdWyriO8SRFnigos0KPZxwCwcXsEMTvj9Md6oI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZRbuJWBWca2FwsExoZmlnThqAcRp/hU91IPhB2QDUuHdsyh7E6zMjKG82D19xYuKh
	 pH3zfzJEJFawm6vvVh5NOf/oC0NFFdHgpyOTeeXjt/u4+uhzxhnYNkAdhm7r4bC0gW
	 HC2dAgEdbcETm3LJqwrAiaAIcys4TKkhBc78dky9RtemIzANITTVeC6NaXHCmVmoev
	 HoOehKq6SwJJUxTCXMCREatoNJaYh3NrxAhV+eqgKACRE3Qq9j734RUB9bfFrk94fJ
	 diHB5L5+mDgyUKzC/vYkNZxExG5t6NqFTKdHxf67wcc2IXgrVdBPXIl/k4lRLXShyo
	 YHzEQeQ5qh0Hg==
Message-ID: <6561c295-f98b-8930-9368-1a225acdca16@collabora.com>
Date: Tue, 6 Jun 2023 07:33:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 10/17] iommu: Do iommu_group_create_direct_mappings()
 before attach
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@nvidia.com>,
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
 <ZH3nXbVFR6JfUKpV@nvidia.com> <01dee34c-5663-22f4-0d88-90f87b1fe879@arm.com>
From: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
In-Reply-To: <01dee34c-5663-22f4-0d88-90f87b1fe879@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_223340_271259_316E3332 
X-CRM114-Status: UNSURE (   7.23  )
X-CRM114-Notice: Please train this message.
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

Hi all,

On 5/6/23 16:00, Robin Murphy wrote:
> The log says it's next-20230530 - the fix you're seeing there from commit b3fc95709c54 landed 2 days later :)

Thanks for checking that out Robin, KernelCI still hasn't run
that build but I tested it manually and the issue is not there
anymore.

#regzbot fix: b3fc95709c54

Cheers,
Ricardo

