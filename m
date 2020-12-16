Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAF5C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 12:10:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E18923109
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 12:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E18923109
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z3P6xM3QhnFm27c4CtkEejGKxVMPHj5fDflzE36uxNA=; b=FcW0Oz6iEghCY8x158mNbzOfK
	m2G8a8fcXVLX+jkZ61Sm7nrJgkSQmigIK3IPlfmP4FxMkStkVMgV5Nki1ne0Hl3Mj0asPf4GgBbg3
	qqrsJxdpK/CvWUDaBhUQ7b20DWDv8lg0ZXX27AqQAKYg6vktRlbB2lzUIBsFji/2oxRSjw/h9gLIu
	Ku0eNu0nXOdVlMk4qhkBcl8azfMwXSJxCpuzZIdM3Q+BmmkNGaNlaL7u0hUaiRIhvnegSi6YEqv5y
	bYcRm4SjU98Ceb7I5+a68osu9wqSse9kfSJM4YoJ2k1WrN4TTr5xB3QOE33TpztvozzqDuGgUch+6
	qIQqefa0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpVdd-0000yl-0t; Wed, 16 Dec 2020 12:10:37 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpVdY-0000xG-GZ; Wed, 16 Dec 2020 12:10:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A86551FB;
 Wed, 16 Dec 2020 04:10:26 -0800 (PST)
Received: from [10.57.34.90] (unknown [10.57.34.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09D3C3F66E;
 Wed, 16 Dec 2020 04:10:23 -0800 (PST)
Subject: Re: [PATCH v3 4/7] iommu: Switch gather->end to unsigned long long
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-5-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <16a9565e-5b01-e1c2-0f4a-d06db7f3b093@arm.com>
Date: Wed, 16 Dec 2020 12:10:22 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201216103607.23050-5-yong.wu@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_071032_644761_758F4DF9 
X-CRM114-Status: GOOD (  20.73  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-16 10:36, Yong Wu wrote:
> Currently gather->end is "unsigned long" which may be overflow in
> arch32 in the corner case: 0xfff00000 + 0x100000(iova + size).
> Although it doesn't affect the size(end - start), it affects the checking
> "gather->end < end"

This won't help the same situation at the top of a 64-bit address space, 
though, and now that we have TTBR1 support for AArch64 format that is 
definitely a thing. Better to just encode the end address as the actual 
end address, i.e. iova + size - 1. We don't lose anything other than the 
ability to encode zero-sized invalidations that don't make sense anyway.

Robin.

> Fixes: a7d20dc19d9e ("iommu: Introduce struct iommu_iotlb_gather for batching TLB flushes")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   include/linux/iommu.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 794d4085edd3..6e907a95d981 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -178,7 +178,7 @@ enum iommu_dev_features {
>    */
>   struct iommu_iotlb_gather {
>   	unsigned long		start;
> -	unsigned long		end;
> +	unsigned long long	end;
>   	size_t			pgsize;
>   };
>   
> @@ -537,7 +537,8 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
>   					       struct iommu_iotlb_gather *gather,
>   					       unsigned long iova, size_t size)
>   {
> -	unsigned long start = iova, end = start + size;
> +	unsigned long start = iova;
> +	unsigned long long end = start + size;
>   
>   	/*
>   	 * If the new page is disjoint from the current range or is mapped at
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
