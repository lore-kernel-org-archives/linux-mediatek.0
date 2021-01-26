Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195C5C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 22:23:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB4320665
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 22:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DB4320665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u7Z/CKD2lAwAzS/lmZe5gxt1Kh1mZlwhjeCnR9d3GS4=; b=dcnKgGWZ+mFA5XRFjBpnhNSQv
	LLbvf0PyXNOQStHy7M06o7gZkiKhGHyOmiKMrPI05fFLSV1rxfYZdY3a1/igrpWMcY93tdiw+34za
	pa4A76+bge45KJ30jPFcfdMcSCaj68SdtrYEtsyOb460N+GbKS5jBWQ3nWJe4WdN1V4tmQ/Bqo63F
	lqFG9ohLlbjKyKSVkM7vk9ZVL2d3VPGZ/l8cZoDLgOcMqkZ3i8OphlwPo/xX6ppLJ8MauAbDhdBWh
	GtSffQIdlQpA72yISMQr57iW63hwNUxWcvF9NKs23+F48miN1NIkL+1Y5TmhcBDxW3gLTNWfERNSs
	VPGLWfxiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4Wk2-0004Mj-4x; Tue, 26 Jan 2021 22:23:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Wjx-0004Lu-VX; Tue, 26 Jan 2021 22:23:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D75302065D;
 Tue, 26 Jan 2021 22:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611699792;
 bh=fdRIENxKcgc5beyovt2puqoCoi+rEtNpR+KyZhmJt9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=achoEHu8k4uN8E83dNG429NPT1uvW4BKjuDha0qFlXbMfhUNqyWIOkGFmn5FIYQjx
 AAQs2T+cmT/3KagO8qWzYc02+OPzJ8Y0qoV6PONAnxAgS75ryj9A2u9zfPw9P6NK8M
 cHG5i9P/T7hfT5C7tU+Gu5rsDwAD1jYs0hcLmgrgWzCKcc2j5HXL5Tr/whN3VyMMdQ
 bx4w3RT7i0ULUk3PrLkCR1ZpN3A9ZiqNQD7ru816XaXg4IngNyw1pIqGVHsHxZ/upn
 BHC4hf5TqThjyZuxdwR0BPmGGFv4S+W11JMY00+TYtCZw7qigBK4Q9XevrSXLk7/eK
 peDrVc1pqOHww==
Date: Tue, 26 Jan 2021 22:23:06 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v6 07/33] iommu: Avoid reallocate default domain for a
 group
Message-ID: <20210126222305.GB30460@willie-the-truck>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210111111914.22211-8-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111111914.22211-8-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_172314_102763_949B5513 
X-CRM114-Status: GOOD (  17.54  )
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
 chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 07:18:48PM +0800, Yong Wu wrote:
> If group->default_domain exists, avoid reallocate it.
> 
> In some iommu drivers, there may be several devices share a group. Avoid
> realloc the default domain for this case.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 3d099a31ddca..f4b87e6abe80 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -266,7 +266,8 @@ int iommu_probe_device(struct device *dev)
>  	 * support default domains, so the return value is not yet
>  	 * checked.
>  	 */
> -	iommu_alloc_default_domain(group, dev);
> +	if (!group->default_domain)
> +		iommu_alloc_default_domain(group, dev);

I don't really get what this achieves, since iommu_alloc_default_domain()
looks like this:

static int iommu_alloc_default_domain(struct iommu_group *group,
				      struct device *dev)
{
	unsigned int type;

	if (group->default_domain)
		return 0;

	...

in which case, it should be fine?

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
