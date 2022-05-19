Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E81BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 18:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyvfLMVa9pL4GlMQ+SQQIU6c79c2PWMgxSpPa04f9pA=; b=A5uFmffB2IcX+1
	haKOCZyfwXua1f217yrkCtZeDIA1HyAPJob0IeerqBSRbtDrK1RhBzVBBfxEOnT+BWmz2V4fALdpI
	Uud0DU/Pq142GfLSBd+gg6aQmcS/HL8rk5liisfzYel19sSisu/1Vy6udezNbENmLHpLdk4E8Vraq
	9k+ByAh6Rev1C+oqvVjd539w7Fd/ReuZus7b9PY7GZLmdxird3uuT7w96EyYsGSdcSqhNvxxu6ZwM
	LQNof0m4+o4/r4T83/A/rBzNQuBzLG1mKUIFjsBJGNO7L8Wi3d/XtqBHr9x6wHgDels3E2sECmMVJ
	9/RU7K1t2JVyY2khEd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrkTl-008lk8-BA; Thu, 19 May 2022 18:02:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrkTE-008lRp-GI; Thu, 19 May 2022 18:01:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D9E0561A08;
 Thu, 19 May 2022 18:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7641C34113;
 Thu, 19 May 2022 18:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652983314;
 bh=5TB3amHvIS/8xulQW3QDR705oTNqy0oeeRwvOkTmj/g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mUGdzAAJft9SNL3NkxRrCUzRXP10P1rYo8kaD+07aUq3fRCS/juZkMmfW/tl6f8ue
 16CktaD02X67HabtSTMHPBBzurRt9SaGHGR1vlZlJVGsSFZ/12Vziz6aRblY7ONbYL
 IZtiVXr5Pv+SYpgIs+zSjg4gUeIw3L7or4DFb8M1w13A9M9myzHkSGA8ZmtYgW5c8j
 YsPYVSsHsk5zlnC01s+yOA8KadFwNwlQHTO6bByxpAfsAuof09Rn3buGlJszx6BA8M
 Tj+XQdEpgLQpcpJLeGaZBWdcwXsR8d7ogL/08tkI5lFtAaUB1yx8Cp/FqADId7cuUB
 C1H8RJWwyuJkw==
Date: Thu, 19 May 2022 23:31:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@mediatek.com, matthias.bgg@gmail.com,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, nfraprado@collabora.com
Subject: Re: [PATCH v2 2/2] dmaengine: mediatek-cqdma: Add support for
 MediaTek MT6795
Message-ID: <YoaGDjtg0R6NRMmg@matsya>
References: <20220503140624.117213-1-angelogioacchino.delregno@collabora.com>
 <20220503140624.117213-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503140624.117213-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_110156_612252_2F230D82 
X-CRM114-Status: GOOD (  16.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03-05-22, 16:06, AngeloGioacchino Del Regno wrote:
> Add a compatible string and platform data for the Helio X10 MT6795 SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/dma/mediatek/mtk-cqdma.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
> index a2fb538d9483..e1772dbf50d5 100644
> --- a/drivers/dma/mediatek/mtk-cqdma.c
> +++ b/drivers/dma/mediatek/mtk-cqdma.c
> @@ -757,8 +757,14 @@ static const struct mtk_cqdma_plat_data cqdma_mt6765 = {
>  	.reg_src2 = 0x60,
>  };
>  
> +static const struct mtk_cqdma_plat_data cqdma_mt6795 = {
> +	.reg_dst2 = 0x44,
> +	.reg_src2 = 0x40,

Please define these registers

> +};
> +
>  static const struct of_device_id mtk_cqdma_match[] = {
>  	{ .compatible = "mediatek,mt6765-cqdma", .data = &cqdma_mt6765 },
> +	{ .compatible = "mediatek,mt6795-cqdma", .data = &cqdma_mt6795 },

where is this documented?

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mtk_cqdma_match);
> -- 
> 2.35.1

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
