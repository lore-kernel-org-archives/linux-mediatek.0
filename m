Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96961CF9C6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 08:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhXUqFz+knjNlQ/MovbIUpmCwXw6tHd218rYaLXMjY8=; b=iOX1HO9sF5Fr/fS9r5U2B8VFj9
	qlWl9Qls01Jj+8xhMuBEHWqeNU95vdGagW9XcDY5e0Rnl3U7TIAfQffm0iMZOm2Aq3H7UHrGycurJ
	2qTdpb64KKsczDu63WCQ8NYmD5ZoAqD08Ek+r+xoDDcPpMXvDcVJBKzdTom5Efbv1TC/FcJpZ0Eby
	L2VlcE2ND9D3HO8aPFFAO96sgJjirDbNwf2QlNsCSOBisBioyQ+jTGpHBw2OCdiEbFZ/+fbbzj8BP
	VGNXo9PMEqmSVHJtacbUfHIK7ihRMfFnXE5pjhxe2gHXNVRiaXv93QCSqZyQIOJXKcF8rafKEHkXb
	CSFOqUGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sseed-0000000GhiX-2YjV;
	Mon, 23 Sep 2024 08:42:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sseZs-0000000Ggk2-0T5n;
	Mon, 23 Sep 2024 08:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727080670;
	bh=uZQIK87N4ujgLv/ZX4cs/F+dr+2lXS1YW420lR8BHLg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lb8S9reEfu2Q90fzfVIaVABHDCgxhDm0CGNP1NxL1fMXQjixXnQKP24xe3NQzmrWy
	 AVD6TD0lVQDBEAHJ1XkE/400N7KHunEdKc/PJKc3kApY/mzE6iNlUfYd0FFBIzjz/x
	 exNQXKAY1c10jINtV5sEu4CjiI6IujID28WtIWpuLRHnsedv5DkSgl/j4/WkJ2PbLn
	 J6H5Iin+qx39qdT9xaTAmxZclK4VnfPVzh8aNBfnIweG7mZhjjOiioTVjJO5pTJ+XS
	 Hc8P4uKbzTq16WJX/ARDZc8NUlkos/OyKIIhH0eegw/5x2kx6OUkKZh98jBoNE+Tqe
	 5RaOoKTpSf82Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C591C17E105F;
	Mon, 23 Sep 2024 10:37:49 +0200 (CEST)
Message-ID: <866d7cd8-856b-431a-9408-527cdc021922@collabora.com>
Date: Mon, 23 Sep 2024 10:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] nvmem: mtk-efuse: Enable postprocess for mt8188 GPU
 speed binning
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240920134111.19744-1-pablo.sun@mediatek.com>
 <20240920134111.19744-4-pablo.sun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240920134111.19744-4-pablo.sun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_013752_333725_8FFD51CB 
X-CRM114-Status: GOOD (  15.70  )
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

Il 20/09/24 15:41, Pablo Sun ha scritto:
> Similar to mt8186, the efuse data for mt8188's GPU speed binning
> requires post-process to convert the bit field format expected
> by the OPP table.
> 
> Since mt8188 efuse is not compatible to mt8186, add a new compatible
> entry for mt8188 and enable postprocess.
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> ---
>   drivers/nvmem/mtk-efuse.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 9caf04667341..4984145025bb 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -105,6 +105,10 @@ static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
>   	.uses_post_processing = true,
>   };
>   
> +static const struct mtk_efuse_pdata mtk_mt8188_efuse_pdata = {
> +	.uses_post_processing = true,
> +};
> +
>   static const struct mtk_efuse_pdata mtk_efuse_pdata = {
>   	.uses_post_processing = false,
>   };
> @@ -112,6 +116,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
>   static const struct of_device_id mtk_efuse_of_match[] = {
>   	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
>   	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
> +	{ .compatible = "mediatek,mt8188-efuse", .data = &mtk_mt8188_efuse_pdata },

Please reuse mtk_mt8186_efuse_pdata. There's no need to add a duplicate.

{ .compatible = "mediatek,mt8188-efuse", .data = &mtk_mt8186_efuse_pdata },

Cheers,
Angelo

>   	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },
>   	{/* sentinel */},
>   };



