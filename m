Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C8CC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Dec 2022 15:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vGtw2h+bowuvSjh8g4+ZRsAkXMwjWUJCok9p6khI3E=; b=A3LmeUcsk/mxUedWOTfyC5zkWk
	LMHJc9UoJOJRjc3jXkkqheb05xFzLcvSK2cI6P87FH0kg8V3tjFLUQjWmwhs1+o6GKvejXMuSqZ3s
	uhk2wNQegmMCmpXs0PyrMc2Hpnw8QU9B2v51UVsRpdFnq+DhCeo5ZTAXyYXnOISYFAa+bFerQQAdW
	EpPtD+CgrCus4IocSa/7JwIvCbx3GG9nucL6udNCFeYWP6JOrer4vVBRmTYAwK3wTWI3SoZSy6fWC
	5skqiuAzWZzcEeaxKyEufZy7VOy/cEO4CRxPjwI2ljcyR8lV8fpUY6fe8WORCsQqkiELQteC6UPuC
	ckSh8i4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9T83-00CeYm-1K; Sun, 25 Dec 2022 15:41:35 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9Ref-00Bk4w-VS; Sun, 25 Dec 2022 14:07:11 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1p9ReY-0002Hy-1h;
	Sun, 25 Dec 2022 15:07:02 +0100
Date: Sun, 25 Dec 2022 14:06:59 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: mediatek: Enable irq before the spi registration
Message-ID: <Y6hZA19rWuDkGJa2@makrotopia.org>
References: <20221225-mtk-spi-fixes-v1-0-bb6c14c232f8@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221225-mtk-spi-fixes-v1-0-bb6c14c232f8@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221225_060710_157476_37997BF6 
X-CRM114-Status: GOOD (  26.17  )
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

On Sun, Dec 25, 2022 at 09:37:12AM +0100, Ricardo Ribalda wrote:
> If the irq is enabled after the spi si registered, there can be a race
> with the initialization of the devices on the spi bus.
> 
> Eg:
> mtk-spi 1100a000.spi: spi-mem transfer timeout
> spi-nor: probe of spi0.0 failed with error -110
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000010
> ...
> Call trace:
>  mtk_spi_can_dma+0x0/0x2c
> 
> Fixes: c6f7874687f7 ("spi: mediatek: Enable irq when pdata is ready")
> Reported-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> spi: mediatek: Fix init order (again)
> 
> Hi Mark
> 
> Here is a fixup of the previous patch. Daniel, can you confirm that it
> works on your hardware? 

Yes, this fixes the issue and SPI now works fine on MT7986 with the
patch applied.

Tested-by: Daniel Golle <daniel@makrotopia.org>

> 
> Thanks and sorry for annoyance. 
> 
> To: Mark Brown <broonie@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: linux-spi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/spi/spi-mt65xx.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 6de8360e5c2a..9eab6c20dbc5 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -1253,6 +1253,11 @@ static int mtk_spi_probe(struct platform_device *pdev)
>  		dev_notice(dev, "SPI dma_set_mask(%d) failed, ret:%d\n",
>  			   addr_bits, ret);
>  
> +	ret = devm_request_irq(dev, irq, mtk_spi_interrupt,
> +			       IRQF_TRIGGER_NONE, dev_name(dev), master);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register irq\n");
> +
>  	pm_runtime_enable(dev);
>  
>  	ret = devm_spi_register_master(dev, master);
> @@ -1261,13 +1266,6 @@ static int mtk_spi_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, ret, "failed to register master\n");
>  	}
>  
> -	ret = devm_request_irq(dev, irq, mtk_spi_interrupt,
> -			       IRQF_TRIGGER_NONE, dev_name(dev), master);
> -	if (ret) {
> -		pm_runtime_disable(dev);
> -		return dev_err_probe(dev, ret, "failed to register irq\n");
> -	}
> -
>  	return 0;
>  }
>  
> 
> ---
> base-commit: 45b3cd900bf8d1a3cd7cf48361df8c09ae5b4009
> change-id: 20221225-mtk-spi-fixes-99c863a6fdf1
> 
> Best regards,
> -- 
> Ricardo Ribalda <ribalda@chromium.org>

