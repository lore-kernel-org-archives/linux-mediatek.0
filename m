Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6235CA1009
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 19:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xbv9MUgctREV3I8QFnFJimenjDRYGcNMI7J8VHQbO2M=; b=T4yyVRpmbTp5bBJWi/V0751c0c
	kSg8y28beF19zOAqFiCfjUuCBtWrretGNbM+OA2eBp56S67/46xo6h529+PkqtfwRpUjMYeq8k8EY
	FjhpNXnoxrCVVxMHI8a7QxkKFFqoQSsypyanBGnrKqurYfRxUyiNGLo5xHx4TRwsV8delPHlZY09Z
	hUD+K0AjWNhOdTuLDJtVdgrlP0tqV0QKNT6CsQxe3lLf1MwPo3r8r/kbwHAKWS3VjHXlnse7QD13r
	0e/0wBTy5PudNrQUoVJRUoMXKkIi+W8XnfI2/gnKEgupnFubMG8vsekX+u2xwMz83awaQ3ZRph0b4
	7dZfh+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk7Xb-00000007WNq-2zRF;
	Fri, 30 Aug 2024 19:44:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk7Mk-00000007U48-1s8C;
	Fri, 30 Aug 2024 19:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1725046379;
	bh=EGQHQ9fk8ZiqDNL6+X+CQQWMMmNTIja/SNDq7dE//XE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EVFmW8zm6BHJo4kzQuf1Ng1cIjCUEEe08QXEAtUdXsssM/A105UrkQdJEMDQECxWE
	 DHIr8fVYHbhGxUtopqOj0q5rhUp0kfQtf/yjp8xRxmRMH2lSimy5tN/OyK5H743Tm8
	 4d+9tqLjSE7YXJ7Y68c8NOoX00M+WTBarAwkVVkM/SV1Z1JQIhQy8O3cpVEV8haA24
	 ZY2UXS8KGYs+opY/035pG4aoDHkoi51ImMzy1eCdlghZ8fqsak6V/ewfxXm2hV8VMM
	 BaO0B6HpVFcQwwq8KrWahZYQ+V4fY4EkMHfZNpQEah1kGPn22KK12KJTO9fEt/4bPk
	 t8wGKP+MMkeQA==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F2CED17E114A;
	Fri, 30 Aug 2024 21:32:58 +0200 (CEST)
Date: Fri, 30 Aug 2024 15:32:56 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Yan Zhen <yanzhen@vivo.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v2] soc: mediatek: Simplify with dev_err_probe()
Message-ID: <d269df37-3bf9-45fd-8e3f-fb4f36ff9d8f@notapiano>
References: <20240830080538.376200-1-yanzhen@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240830080538.376200-1-yanzhen@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_123302_680187_0F889FE7 
X-CRM114-Status: GOOD (  23.83  )
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

Hi,

thank you for the patch. See comments below.

On Fri, Aug 30, 2024 at 04:05:38PM +0800, Yan Zhen wrote:
> Using dev_err_probe() to simplify the error path and unify a 
> message template.
> 

From [1]:

  Describe your changes in imperative mood, e.g. “make xyzzy do frotz” instead of
  “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to do frotz”, as if
  you are giving orders to the codebase to change its behaviour.

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

So should be "Use dev_err_probe()...".

Also, the commit summary seems a bit too broad, please add "mtk-mmsys:" in the
subsystem:

  soc: mediatek: mtk-mmsys: Simplify with dev_err_probe()

> Using this helper is totally fine even if err is known to never
> be -EPROBE_DEFER.
> 
> The benefit compared to a normal dev_err() is the standardized format
> of the error code, it being emitted symbolically and the fact that
> the error code is returned which allows more compact error paths.
> 
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>
> ---
> 
> Changes in v2:
> - Get rid of `ret = PTR_ERR(mmsys->regs);`.
> 
>  drivers/soc/mediatek/mtk-mmsys.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 938240714e54..a6e0c41c10ab 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -397,11 +397,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	mmsys->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(mmsys->regs)) {
> -		ret = PTR_ERR(mmsys->regs);
> -		dev_err(dev, "Failed to ioremap mmsys registers: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(mmsys->regs))
> +		return dev_err_probe(dev, PTR_ERR(mmsys->regs),
> +					"Failed to ioremap mmsys registers");

You're missing the \n at the end of the string.

Also, would look nicer if it was aligned like so:

		return dev_err_probe(dev, PTR_ERR(mmsys->regs),
				     "Failed to ioremap mmsys registers\n");

>  
>  	mmsys->data = of_device_get_match_data(&pdev->dev);
>  
> @@ -413,10 +411,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>  		mmsys->rcdev.ops = &mtk_mmsys_reset_ops;
>  		mmsys->rcdev.of_node = pdev->dev.of_node;
>  		ret = devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n", ret);
> -			return ret;
> -		}
> +		if (ret)
> +			dev_err_probe(&pdev->dev, ret,
> +					"Couldn't register mmsys reset controller");

You're missing the return here. And the \n is also missing.

Also, here checkpatch actually complains about the alignment (run
'scripts/checkpatch.pl --strict' on your patch).

CHECK: Alignment should match open parenthesis
#50: FILE: drivers/soc/mediatek/mtk-mmsys.c:416:
+			dev_err_probe(&pdev->dev, ret,
+					"Couldn't register mmsys reset controller");

After making those changes you can add

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

