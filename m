Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E5BC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 01:31:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEE7A64E46
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 01:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEE7A64E46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BP49kEOSMvy1uHKU83hjFHmpNSq/JP3lQjKd/PXt5qU=; b=hGJwXXOKmOy9cDecs0ryweda6
	KIIi6benHHj+XavlLYkyejBcSwpC2hhF3gE5IFWQ7J4vjF/N5zdW2jvgSc1m2RpMttZw+OujqJ6hG
	f0Soe3HBx6MC71i6DYaod1H3AcdWv00uPnrXg56X5MIY7tBtqRTmci8H5IMEYPjG162P66cvJdIoa
	TAGCx+oc52kHkjTN97Zyw8WFCdOQ8bAvRWt3rn+kNIlZPC1FyS44jfP7k/t+92xkZO/hhnEy6uLfn
	ltAPo8aPS8ETkoAdDRwOWhPoHlhFpSd8HFu7vQc6xxGUz4fbLwqC/YU78F4hhqN3+yqp1iu8vUXBb
	HW7ButvUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6kX4-00027z-U5; Tue, 02 Feb 2021 01:31:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6kX1-00027L-5u
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 01:31:05 +0000
X-UUID: 0f5fe3cf4d964484ba0fa957138cdc54-20210201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=J3x52rLYllyw6VRGlPTtdTLgRiZI9s1w8kgapGIcpuo=; 
 b=b2t9H/HD7MO/64tenkUKzflw/fYrhq6naszlpBRPwLHbySkw4sGKW71GiLwn6YH0hnUi/y4+LhYe+iF2cpfp918y6G1LVvwVUF0Kl7zfEJFocU0KCzgel0gbTIn+7ZBUTkMb/HLiH/UW4gd9jTZl3/zbPMlQSNalDPx6gB94Y+Y=;
X-UUID: 0f5fe3cf4d964484ba0fa957138cdc54-20210201
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1036612661; Mon, 01 Feb 2021 17:30:59 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 17:30:58 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 2 Feb 2021 09:30:50 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Feb 2021 09:30:49 +0800
Message-ID: <1612229449.2524.2.camel@mhfsdcap03>
Subject: Re: [PATCH] iommu: Properly pass gfp_t in _iommu_map() to avoid
 atomic sleeping
From: Yong Wu <yong.wu@mediatek.com>
To: Douglas Anderson <dianders@chromium.org>
Date: Tue, 2 Feb 2021 09:30:49 +0800
In-Reply-To: <20210201170611.1.I64a7b62579287d668d7c89e105dcedf45d641063@changeid>
References: <20210201170611.1.I64a7b62579287d668d7c89e105dcedf45d641063@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D4D6B793B12B73E0D43EA4A0C2B613719A984C7639A6230D7A507072D26ECEAC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_203103_443154_C0D2EFA0 
X-CRM114-Status: GOOD (  18.56  )
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
Cc: Will Deacon <will@kernel.org>, joro@8bytes.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-02-01 at 17:06 -0800, Douglas Anderson wrote:
> Sleeping while atomic = bad.  Let's fix an obvious typo to try to avoid it.
> 
> The warning that was seen (on a downstream kernel with the problematic
> patch backported):
> 
>  BUG: sleeping function called from invalid context at mm/page_alloc.c:4726
>  in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 9, name: ksoftirqd/0
>  CPU: 0 PID: 9 Comm: ksoftirqd/0 Not tainted 5.4.93-12508-gc10c93e28e39 #1
>  Call trace:
>   dump_backtrace+0x0/0x154
>   show_stack+0x20/0x2c
>   dump_stack+0xa0/0xfc
>   ___might_sleep+0x11c/0x12c
>   __might_sleep+0x50/0x84
>   __alloc_pages_nodemask+0xf8/0x2bc
>   __arm_lpae_alloc_pages+0x48/0x1b4
>   __arm_lpae_map+0x124/0x274
>   __arm_lpae_map+0x1cc/0x274
>   arm_lpae_map+0x140/0x170
>   arm_smmu_map+0x78/0xbc
>   __iommu_map+0xd4/0x210
>   _iommu_map+0x4c/0x84
>   iommu_map_atomic+0x44/0x58
>   __iommu_dma_map+0x8c/0xc4
>   iommu_dma_map_page+0xac/0xf0
> 
> Fixes: d8c1df02ac7f ("iommu: Move iotlb_sync_map out from __iommu_map")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

oh. This is my fault. Thanks for the fix.

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

> ---
> I haven't done any serious testing on this.  I saw a report of the
> warning and the fix seemed obvious so I'm shooting it out.
> 
>  drivers/iommu/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 3d099a31ddca..2b06b01850d5 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2441,7 +2441,7 @@ static int _iommu_map(struct iommu_domain *domain, unsigned long iova,
>  	const struct iommu_ops *ops = domain->ops;
>  	int ret;
>  
> -	ret = __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
> +	ret = __iommu_map(domain, iova, paddr, size, prot, gfp);
>  	if (ret == 0 && ops->iotlb_sync_map)
>  		ops->iotlb_sync_map(domain, iova, size);
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
