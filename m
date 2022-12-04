Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD926C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Dec 2022 12:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jGg2+hGIcQCb/sj1Z29SPvy2f0izgZFm1n5di77ZbE=; b=SvZMh4IfD1XWl7oB4AFrIH8Kki
	u+Lf2QgK9MgeY73hil1Pul+hmYceMuY8AGiscyG6g5CIPEUZ9MJUZvxNK02Jyh3EReq6EOLi4LdlZ
	iLu7ro4s7VACu/xRLJL5BdskruEsloi9YBD6BpYOaOHOkmjoxiK/v6kWJ9VraT0HNxPDC+z64ibc5
	kuDmJkEcz4yTmB761l8/VKvP52rZv3uv+9feQK+hCL5FJg+HBZIsNaQepEdiznk1ZyT5o5VoL8ZHq
	Hj4wPSN9KFuqw2/Lm8KUmxDeDIDX5mgRb1VDkzpcxZ0SJt+moCxb/Tr4hgLH7ixhSOLQCwr9KaOzu
	NZbBFWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1oBH-007hRB-5i; Sun, 04 Dec 2022 12:33:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1oB1-007hMX-GJ; Sun, 04 Dec 2022 12:33:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D82660E87;
	Sun,  4 Dec 2022 12:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E67FC433D6;
	Sun,  4 Dec 2022 12:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670157176;
	bh=iQ+pz5jxkUQV3CQlFhNyB/esFfXV4PiszQqeGxj1DHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtdtNu9OpHfq9fmUT8vSQ/4j3F8FCbpsUfleSd8jgScmW0L3IhW+/CgAfXGAmlQQj
	 NI3783c/zSBwPyVXkfum5N5f+5YpPfZe8unYzVxx0lMAV00xJMgPHLfphaEw4ghJ0T
	 rpAUlGlJwtDmvmpaswutbd56utsIDzJCch8ksxpFUi/ppTPRNRo9opImNQERh91vRb
	 CG0GLGBCge/9b9A+1/fELSbmSz0ovHoIFTJgONxIKlg8XbzFkmlzQ7fTTcrVZjk8zP
	 UhrAtskiR8Gu1CGZpS555coRgnEfX66qLf1PQB2n1iZXJBWH4DcusRYO4d2BkniM34
	 eZQ4bbPXkO6xw==
Date: Sun, 4 Dec 2022 14:32:44 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Yuan Can <yuancan@huawei.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	matthias.bgg@gmail.com, sujuan.chen@mediatek.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: ethernet: mtk_wed: Fix missing of_node_put() in
 mtk_wed_wo_hardware_init()
Message-ID: <Y4yTbO0+7MmhTvVT@unreal>
References: <20221202083029.87834-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202083029.87834-1-yuancan@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_043259_704850_21B50F41 
X-CRM114-Status: GOOD (  17.00  )
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

On Fri, Dec 02, 2022 at 08:30:29AM +0000, Yuan Can wrote:
> The np needs to be released through of_node_put() in the error handling
> path of mtk_wed_wo_hardware_init().
> 
> Fixes: 799684448e3e ("net: ethernet: mtk_wed: introduce wed wo support")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_wed_wo.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Please use [PATCH net-next] ... format in title.

> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.c b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
> index 4754b6db009e..d61bd0b11331 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed_wo.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
> @@ -407,8 +407,10 @@ mtk_wed_wo_hardware_init(struct mtk_wed_wo *wo)
>  		return -ENODEV;
>  
>  	wo->mmio.regs = syscon_regmap_lookup_by_phandle(np, NULL);
> -	if (IS_ERR_OR_NULL(wo->mmio.regs))

syscon_regmap_lookup_by_phandle() returns or error or valid pointer.
The right check needs to be IS_ERR(wo->mmio.regs)

Thanks

> -		return PTR_ERR(wo->mmio.regs);
> +	if (IS_ERR_OR_NULL(wo->mmio.regs)) {
> +		ret = PTR_ERR(wo->mmio.regs);
> +		goto error_put;
> +	}
>  
>  	wo->mmio.irq = irq_of_parse_and_map(np, 0);
>  	wo->mmio.irq_mask = MTK_WED_WO_ALL_INT_MASK;
> @@ -456,7 +458,8 @@ mtk_wed_wo_hardware_init(struct mtk_wed_wo *wo)
>  
>  error:
>  	devm_free_irq(wo->hw->dev, wo->mmio.irq, wo);
> -
> +error_put:
> +	of_node_put(np);
>  	return ret;
>  }
>  
> -- 
> 2.17.1
> 

