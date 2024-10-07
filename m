Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956EFCFB43F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 08:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=flWVBTVWl4edI7MTJQuFDuQPbwOw0gqd/xjsDkgKv7c=; b=qkJM27ILaFqFT9
	fH+vQ4rq/09JBd3cuMlh/mH7Ttr6CKF0FDl6HcySJg/EAYaAiiUAvihNRegdFx/VknzHFs7WlCdAZ
	+KMmd4CX4lkyJRWFs6xpHlSQPeUOOC1/J1pGkXS42f41zO+N5+h1Ubj/5aDx62HGDSGItzFb22GUh
	EY/XeCArcLMYua2ofFmChyY63hzx9RCALQ6PGx5OaABjQ+ooTuPm//zLIKqJdPYVQ7F6eVVuwPbk6
	SvpEuzp0jIRsrkWu3e5kuz+bILc40+Xid878Y/36G+zs2aLu4uqqepEQt0TT9UIPG9qDgMbJlR2cr
	O1F20cQ25Rh5LVHyk3bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxizq-00000001k8i-3dHk;
	Mon, 07 Oct 2024 08:21:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxidt-00000001gTs-0Ap8;
	Mon, 07 Oct 2024 07:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728287934;
	bh=wOh0QPI7DTVnxpT5sRYZP+/1OT7v2CLXqVlg+poKfWg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UTi+cpH66SgdTO9JjX72kICGcoj2zsDKXtG9fkd0c/XyFK1RBa4uVFrULFfu0RZOf
	 o6oOOJL0yhufT304VcUaf6gjEU7pk1WCzsRJS7LAC0587QreuuwXmDxbYb9pj3EeXB
	 bQdkn8uQe9Gs1DCtewabFWXBMPy8vIze1hbiYKCqjLRITEgKncGIS/jHwPLQzgc0cp
	 +qRzura2syXO3TRvhYUqdSfH2Adil35hsAbUnlYCIDi3qvV0bklMCoQhqjy+AUzAsZ
	 TvnL4z60r8dRl4hvNCKqS+lrCTyoK1qDPbCdrJOCAOsIQNFDvdfPHLkzkUKdg6Atyi
	 y3ia2HM8jIb2g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 821B817E1083;
	Mon,  7 Oct 2024 09:58:53 +0200 (CEST)
Message-ID: <89e54baa-0f05-47d7-8d81-68862f822c59@collabora.com>
Date: Mon, 7 Oct 2024 09:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mmc: mtk-sd: add support for mt7988
To: Frank Wunderlich <linux@fw-web.de>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
References: <20241006153447.41377-1-linux@fw-web.de>
 <20241006153447.41377-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241006153447.41377-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_005857_267965_E5B18248 
X-CRM114-Status: GOOD (  14.68  )
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
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 06/10/24 17:34, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add support for mmc on MT7988 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

There's no need to add yet one more duplicate mtk_mmc_compatible platform
data, nor one more compatible string to this driver, as this is exactly
the same as mt7986.

Please reuse the MT7986 compatible; in DT you'll have:

compatible = "mediatek,mt7988-mmc", "mediatek,mt7986-mmc";

Cheers,
Angelo

> ---
>   drivers/mmc/host/mtk-sd.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 89018b6c97b9..6d5afe51a61d 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -571,6 +571,19 @@ static const struct mtk_mmc_compatible mt7986_compat = {
>   	.support_64g = true,
>   };
>   
> +static const struct mtk_mmc_compatible mt7988_compat = {
> +	.clk_div_bits = 12,
> +	.recheck_sdio_irq = true,
> +	.hs400_tune = false,
> +	.pad_tune_reg = MSDC_PAD_TUNE0,
> +	.async_fifo = true,
> +	.data_tune = true,
> +	.busy_check = true,
> +	.stop_clk_fix = true,
> +	.enhance_rx = true,
> +	.support_64g = true,
> +};
> +
>   static const struct mtk_mmc_compatible mt8135_compat = {
>   	.clk_div_bits = 8,
>   	.recheck_sdio_irq = true,
> @@ -629,6 +642,7 @@ static const struct of_device_id msdc_of_ids[] = {
>   	{ .compatible = "mediatek,mt7620-mmc", .data = &mt7620_compat},
>   	{ .compatible = "mediatek,mt7622-mmc", .data = &mt7622_compat},
>   	{ .compatible = "mediatek,mt7986-mmc", .data = &mt7986_compat},
> +	{ .compatible = "mediatek,mt7988-mmc", .data = &mt7988_compat},
>   	{ .compatible = "mediatek,mt8135-mmc", .data = &mt8135_compat},
>   	{ .compatible = "mediatek,mt8173-mmc", .data = &mt8173_compat},
>   	{ .compatible = "mediatek,mt8183-mmc", .data = &mt8183_compat},


