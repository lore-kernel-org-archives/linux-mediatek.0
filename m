Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9FCEE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 11:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdzItYYvpLhk0RUpyByyeIWLhyBqC2CZWQ/5OZgtUDM=; b=kpskmO+79a/6yzXD4DZonoEdX6
	XVDgPjgPjuz9GkaYC/K9gYr5GtsGxgzQQ9FqSZ6tUqAn9K8qrgqSTc0+2mYARok21Uy4U13ppjQNf
	L7pi8Bqm3UQ+BbnC3zFaDvRAXwLlscH9AFDGHZC9yaaNbxgXhmIFc1q1rtpb/P71FQo5I+2hST2+z
	Cth0IJ6XOflzC1YRKgb/v6oV2TcZHAPE3GOp29KwkSYZ/ulXpNUt5TC9Kq/UxokXhMDJkwtliz4ei
	tyxafCpPZXTEvaF3XMJuifwpz/jqKEFxz/YYKZpmRMRe3t5wheiuEVrmhgJVTtZem3wAM56ZZWhIC
	Tq52pvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qff5y-000Nj9-2Q;
	Mon, 11 Sep 2023 11:28:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qff5v-000NiZ-2U;
	Mon, 11 Sep 2023 11:28:45 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 655AC6600BB0;
	Mon, 11 Sep 2023 12:28:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694431722;
	bh=VCO8hFhrrVLv5Zdp1yxb+bem6zXtstRZklPiz0+rgd4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uk2qcLfxmAsXKNnobr9UNWX4/Ixh2BMKHQizFVNm6y/5eJw/LNhXRmE076AoXbeb2
	 KNz58L4dve0LM/UXPpGDrjBwXVKxXhvw5P51AwyLvh34KSGxD69kIsN7LM8j2PMSK5
	 MCajBCmrgbPfeIyr+6ETuuxKdVDc5Z7o7JyCLuDorWYeeCLWNdzAWi9grFLIG2fc9K
	 BUgSM7KUdFx0SzGwjsKUaFaGbVzCKVtCoevH40yqAHtKO4GrsosIXsrvaShGuwSdym
	 M7iAZg7SgY7HvPozqZvAaTCiS6RG/8j8mlBLA469IM0D8cBMMH222+BFB49eTZC+kW
	 wWrOP2B9rYW3A==
Message-ID: <247d0b44-9359-2682-7e64-313eb1dd3e67@collabora.com>
Date: Mon, 11 Sep 2023 13:28:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RESEND PATCH v6 20/20] drm/mediatek: Set DPI input to 1T2P mode
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, "Nancy . Lin"
 <nancy.lin@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>
References: <20230911074233.31556-1-shawn.sung@mediatek.com>
 <20230911074233.31556-21-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911074233.31556-21-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_042843_958640_ED5F57E0 
X-CRM114-Status: GOOD (  16.67  )
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

Il 11/09/23 09:42, Hsiao Chien Sung ha scritto:
> DPI input is in 1T2P mode on MT8195,
> align the setting of MT8188 with it,
> otherwise the screen will glitch.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

First of all, this commit needs a Fixes tag... but then, instead of getting a
1:1 duplicate of mt8195_dpintf_conf you can, at this point, entirely remove
mt8188_dpintf_conf and assign the 8195 one to the 8188 compatible: please do so.

Thanks,
Angelo

> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 2f931e4e2b60..c6ee21e275ba 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -963,7 +963,7 @@ static const struct mtk_dpi_conf mt8188_dpintf_conf = {
>   	.output_fmts = mt8195_output_fmts,
>   	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
>   	.pixels_per_iter = 4,
> -	.input_2pixel = false,
> +	.input_2pixel = true,
>   	.dimension_mask = DPINTF_HPW_MASK,
>   	.hvsize_mask = DPINTF_HSIZE_MASK,
>   	.channel_swap_shift = DPINTF_CH_SWAP,
> --
> 2.18.0
> 


