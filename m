Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E0DC3DA6F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 13:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPmB1n5QNIuXDNjJF72xI9J2ZXvWS0mKO15Bsf/m+b0=; b=wjLAqcOw8DaNQi2fgSLgGBH8GC
	aY6fQCVXInhgvdV0z3LBlEfBL4IwwyA/lZDHqtwiH6CCboCmNLgDce7icw8LHsU8bN3FStHYQDcn8
	fnflZ/tF5BGpVHFzM/7TBx+ZcO05KQpIGIa+Jzts3MfEoLMLDYoXUQGqWzwowNbkBf4tK8HVL3BlN
	LFBoXG20CNu5Rbd3lmLCGc0wAc3i9onFoC1e4qcAMgtpcyH+WkTHmbnojJEJ8TG3Llz7H76S0aV/q
	acFrEkXaSspwh6zCDuG9mmYbXUkShRyGHaZXQGTtSlnSoX0a+xqkCEh+oM4a0JGK8IT/nGPjP2RCn
	dD+ETfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZA9r-0037fX-1q;
	Thu, 24 Aug 2023 13:13:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZA9o-0037eS-03;
	Thu, 24 Aug 2023 13:13:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3A246111A;
	Thu, 24 Aug 2023 13:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4844C433C7;
	Thu, 24 Aug 2023 13:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692882830;
	bh=KvEcWLiBBY8f1K358gTSNgZA4gcGcXcp2kJ+4ITugEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmGMcjNJfWSNDKvI2a0KTa/PxceHJqg2tDiD2vLcTKGqwPi/W9EcJojYMHvBBjInr
	 DwfYbO/vPp52rfqXKkU8yjYrWNccE+KRJWJj62Fi/66XGHbNDJsMdACNlpnFTFQYVo
	 k53U/tOUZpStkS7K60Jh5h182Fs5cx/HaCOEzZ7g=
Date: Thu, 24 Aug 2023 15:13:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Joerg Roedel <joro@8bytes.org>, stable@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [PATCH 5.10] iommu/mediatek: remove redundant comparison
Message-ID: <2023082441-sulfide-abstain-fffa@gregkh>
References: <20230824130954.29688-1-adiupina@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824130954.29688-1-adiupina@astralinux.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_061352_098532_9228BEBC 
X-CRM114-Status: GOOD (  19.68  )
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

On Thu, Aug 24, 2023 at 04:09:54PM +0300, Alexandra Diupina wrote:
> iommu_device_register always returns 0 in 4.11-5.12, so
> we need to remove redundant comparison with 0
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: b16c0170b53c ("iommu/mediatek: Make use of iommu_device_register interface")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
>  drivers/iommu/mtk_iommu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 051815c9d2bb..208c47218b75 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -748,9 +748,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  	iommu_device_set_ops(&data->iommu, &mtk_iommu_ops);
>  	iommu_device_set_fwnode(&data->iommu, &pdev->dev.of_node->fwnode);
>  
> -	ret = iommu_device_register(&data->iommu);
> -	if (ret)
> -		return ret;
> +	iommu_device_register(&data->iommu);
>  
>  	spin_lock_init(&data->tlb_lock);
>  	list_add_tail(&data->list, &m4ulist);
> -- 
> 2.30.2
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

