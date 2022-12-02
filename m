Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC10C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1s87F0jHsN+K8Jdv5MXlU56rAQ6211drjO4hi6iYFg=; b=R0zEX8erKIrYENmHLpyf3b5sgQ
	Z1gIZ1forQ5udLlyf80tObQ6+mfnKPvx6eCxZURhFciVP41r1MBwg/5sG9Y+mAgYYFSQeeFfIWfuz
	b5aQxNELNRrTqtprV35pU7ysMFgh1VVWjoZb1TmcYedFVBnPyps15I45XFfyo/BM5isPC9lXj1qwi
	wKsSswoPAU1PjYo7Ax6lIu8Sj+E1w7eDeUNmQAyf0aNuy6190k8BnrhOZIq4AetrJFcBgL/pP9V8C
	htdHT+w2gqkHENhlT+kPTKIVp4+1uOz+1PdNjIHoE6mutmr2oMCxi9LsirxHgUXh+77/BnALtCH6W
	3ViaeVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11dc-00EdEx-38; Fri, 02 Dec 2022 08:43:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p11dP-00EdB1-L2; Fri, 02 Dec 2022 08:43:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9807F6212C;
	Fri,  2 Dec 2022 08:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3080C433D6;
	Fri,  2 Dec 2022 08:43:00 +0000 (UTC)
Message-ID: <4f4b9ff6-73e3-a8b3-1d1c-e1d0a0b9b38c@xs4all.nl>
Date: Fri, 2 Dec 2022 09:42:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] media: platform: mtk-mdp3: Fix return value check in
 mdp_probe()
Content-Language: en-US
To: Qiheng Lin <linqiheng@huawei.com>, mchehab@kernel.org,
 matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221201023505.48015-1-linqiheng@huawei.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20221201023505.48015-1-linqiheng@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_004303_798361_342E7F5D 
X-CRM114-Status: GOOD (  22.69  )
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

Hi Qiheng,

Can you rebase on top of the latest staging tree? (https://git.linuxtv.org/media_stage.git/)

This patch no longer applies.

Thanks!

	Hans

On 01/12/2022 03:35, Qiheng Lin wrote:
> In case of error, the function mtk_mutex_get()
> returns ERR_PTR() and never returns NULL. The NULL test in the
> return value check should be replaced with IS_ERR().
> And also fix the err_return case.
> 
> Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
> Signed-off-by: Qiheng Lin <linqiheng@huawei.com>
> ---
> 
> v2:
>  - Add fix the err_return case.
> 
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index c413e59d4286..48f3e32fe54e 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -207,8 +207,8 @@ static int mdp_probe(struct platform_device *pdev)
>  	}
>  	for (i = 0; i < MDP_PIPE_MAX; i++) {
>  		mdp->mdp_mutex[i] = mtk_mutex_get(&mm_pdev->dev);
> -		if (!mdp->mdp_mutex[i]) {
> -			ret = -ENODEV;
> +		if (IS_ERR(mdp->mdp_mutex[i])) {
> +			ret = PTR_ERR(mdp->mdp_mutex[i]);
>  			goto err_return;
>  		}
>  	}
> @@ -288,9 +288,10 @@ static int mdp_probe(struct platform_device *pdev)
>  err_deinit_comp:
>  	mdp_comp_destroy(mdp);
>  err_return:
> -	for (i = 0; i < MDP_PIPE_MAX; i++)
> -		if (mdp)
> -			mtk_mutex_put(mdp->mdp_mutex[i]);
> +	if (mdp)
> +		for (i = 0; i < MDP_PIPE_MAX; i++)
> +			if (!IS_ERR_OR_NULL(mdp->mdp_mutex[i]))
> +				mtk_mutex_put(mdp->mdp_mutex[i]);
>  	kfree(mdp);
>  	dev_dbg(dev, "Errno %d\n", ret);
>  	return ret;


