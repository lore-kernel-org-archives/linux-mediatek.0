Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DBCC63798
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 15:41:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D89F1204FD
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 15:41:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AwDExmBb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D89F1204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UOaSQcO12RazsXgr9WT0bmT8JKHBfvcota3KQqYm2L0=; b=AwDExmBbcrvKYgHVBZTjRno6s
	78kTZoA/E7qjZXSDqaNV4hPE6OAMI58y+qkSnMx9Yw/YdKmOkFFZ2o0KyvegXWdNiGujtkHP4FoYN
	JvMwqHsFl48V5TZpnsWpk2MPx7/N+V/VOAAmmvC476iG5w6LsBCrn964g+tfnEe5z2jCxZVyz49+k
	uuVeAbKu691nZhJAoz9s5RbGFqejS/M5UX9KgjeFOinj+gCXfGZDlIJA8+pkgtDH+lG5aXVv7HVZM
	KbJex+VsSzY30yEueZcmC6KSDqksIwH99s7In8kVsGgdPmn8TR5s7IcWZKSazTA4mEcaLLdGsU1od
	vJeuXpv/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiJOq-00061Y-5i; Thu, 26 Nov 2020 15:41:36 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiJOm-00060t-9b; Thu, 26 Nov 2020 15:41:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7700A31B;
 Thu, 26 Nov 2020 07:41:31 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27CC43F71F;
 Thu, 26 Nov 2020 07:41:26 -0800 (PST)
Subject: Re: [PATCH v4 07/24] iommu/io-pgtable-arm-v7s: Use ias to check the
 valid iova in unmap
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will@kernel.org>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-8-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <bf339a42-57af-6de2-aa04-816ebf205574@arm.com>
Date: Thu, 26 Nov 2020 15:41:25 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201111123838.15682-8-yong.wu@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_104132_469607_DABE5062 
X-CRM114-Status: GOOD (  19.66  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-11 12:38, Yong Wu wrote:
> Use the ias for the valid iova checking in arm_v7s_unmap. This is a
> preparing patch for supporting iova 34bit for MediaTek.

I can't help thinking of weird ways to generate better code here, but 
being consistent with what we already have on the map path is probably 
more valuable for now.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/io-pgtable-arm-v7s.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index a688f22cbe3b..e880745ab1e8 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -717,7 +717,7 @@ static size_t arm_v7s_unmap(struct io_pgtable_ops *ops, unsigned long iova,
>   {
>   	struct arm_v7s_io_pgtable *data = io_pgtable_ops_to_data(ops);
>   
> -	if (WARN_ON(upper_32_bits(iova)))
> +	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias)))
>   		return 0;
>   
>   	return __arm_v7s_unmap(data, gather, iova, size, 1, data->pgd);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
