Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5D1CD8CA2
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDB8Xo9cJ2VeIdENPctPOpmpBQtYaHFP/tzuWEeiQzA=; b=WajkMTymAoTcOI1pBSBPRQppUh
	L9ADKuVp2fGoj0oxuVMBEuRQdO6q/EtPXFL0RxieX7y4SsmnS58voSlLn9O29M3r6v3+zXBRLtciL
	2pHhmR3fntBUXEEYnVWlkqBUmnTDnrAbHzw5IsCPTw9A+q+Ej6i2m9bV8/ULYC/UXClaTCGLSjClo
	Ha1020bPcmI3WJnDPoHVtjDFwl1nwK4GXTrq6hNqesZzawhDLP1+9qnWKMdEBXwZg02/dwbixHOc6
	PJ18Lx6ZB+BkTeMXaUg73LmUoAJfbC/DUyhHEHopPfyeYiJDehAlhKrPy15kgiCo0qOQ683+je5AR
	C96yjcEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqEjv-00Dh1T-05;
	Tue, 10 Oct 2023 15:33:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqEjr-00Dh0w-1h;
	Tue, 10 Oct 2023 15:33:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D840ACE1E7D;
	Tue, 10 Oct 2023 15:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35732C433C9;
	Tue, 10 Oct 2023 15:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696952017;
	bh=uCeGXpQ2PhB2LhIPquLo56o19XqjK0xYL5TVnuMv/+U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EWSBW2fwN/2X5IF6uuWJ2T0Ug0fKHP0BR60rjiZ98D7b+0D5YH7OZoBJuYr8vewe3
	 ej5UceVmEfNbjoRbsPD2wXrFdzIiEhd7KURWJmTKOXit+h8xneME7SgE90NNYHutU0
	 tgNdNs3kql8u5m3FIhC7S0cb95i9y9iQdWSzEDhPFWg34b+QRpPheb++z6SNYEz/5K
	 BySmRLyxiHMXfmf0XTvfacF/pgtoEEjv3qdT16w327kJ0h596RDI3hIPSk1cnahddC
	 hBsp8bFDWLRrKZqqOaIe3F//7c/UKE96Q4LXyv19ozBaEJS1zLGXn/5NSpuHCYj0gb
	 SJd/UewTRBMMA==
Date: Tue, 10 Oct 2023 16:33:46 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lars@metafoo.de, matthias.bgg@gmail.com, ruanjinjie@huawei.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
Subject: Re: [PATCH] iio: adc: mt6577_auxadc: Fix kernel panic on suspend
Message-ID: <20231010163346.3e346536@jic23-huawei>
In-Reply-To: <20231010121940.159696-1-angelogioacchino.delregno@collabora.com>
References: <20231010121940.159696-1-angelogioacchino.delregno@collabora.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_083339_740797_9867B590 
X-CRM114-Status: GOOD (  17.50  )
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

On Tue, 10 Oct 2023 14:19:40 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Commit a2d518fbe376 ("iio: adc: mt6577_auxadc: Simplify with device managed function")
> simplified the driver with devm hooks, but wrongly states that the
> platform_set_drvdata(), platform_get_drvdata() are unused after the
> simplification: the driver data is infact used in .suspend() and
> .resume() PM callbacks, currently producing a kernel panic.
> 
> Reintroduce the call to platform_set_drvdata() in the probe function
> 
> Fixes: a2d518fbe376 ("iio: adc: mt6577_auxadc: Simplify with device managed function")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Applied to the togreg branch of iio.git (as the patch it is fixing is only there for now)
Pushed out initially as testing for 0-day to take a look.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/mt6577_auxadc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/adc/mt6577_auxadc.c b/drivers/iio/adc/mt6577_auxadc.c
> index 370b84c2d0ba..3343b54e8e44 100644
> --- a/drivers/iio/adc/mt6577_auxadc.c
> +++ b/drivers/iio/adc/mt6577_auxadc.c
> @@ -293,6 +293,7 @@ static int mt6577_auxadc_probe(struct platform_device *pdev)
>  	mt6577_auxadc_mod_reg(adc_dev->reg_base + MT6577_AUXADC_MISC,
>  			      MT6577_AUXADC_PDN_EN, 0);
>  	mdelay(MT6577_AUXADC_POWER_READY_MS);
> +	platform_set_drvdata(pdev, indio_dev);
>  
>  	ret = devm_add_action_or_reset(&pdev->dev, mt6577_power_off, adc_dev);
>  	if (ret)


