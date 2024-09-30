Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B98FCF649D
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 10:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNxp202Ue49hjmssTzUdfZ8S2ZyOV3LuqK+qnyuDOfw=; b=nfliuePaAZRrR88VZJx/vZGIPW
	FuQ3s9E5/wAqMb0uswppUouK8F6TYpRpVMxpzzzhk3tsbK+PJPBpkiJo+HbyFRGY2RRLe8H4Nd4wy
	Xzugj4biBNeqQcQrUImctIN39ANGp6vlpv7FXpUji+f7INr+aMYv2BbbQSl2G6iu1pYtetyX0sQdH
	VirPxXWXD6QcRM+BCIL22sCZ+eazr1grvApnQi+OXsXoceYqsO6tlpw7qOSikkGJwROIibhBd4WsB
	j809DegnvIObXNw4oO0t5HZPJhl+PJQqTRgpe4TDu/nTnAAx1AVmYh5Dn8EAw47qmqp/XK5hQ630T
	g1SjizWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDGU-0000000GdDe-28us;
	Mon, 30 Sep 2024 10:04:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svCt7-0000000GZHU-1qYG;
	Mon, 30 Sep 2024 09:40:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727689215;
	bh=morSWfr1TfMGPO5UKWsSeeHNUs1wlUZiPwNAmlEjidI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P35XlTt8282gqz35vELPtYBH1CIQb6tu8A/3DFY3CFYLIZCt8SG/ZNoF6ognQgeMV
	 ROkoNt3eYANU2fdZTnfRgglV8tSMCdjr6WKa8+QlDu+edUgaOwOZJelzG/KfBysOTQ
	 Ud50YWLIo0cGkpcqRIy/LWRwSkOksnQYiXmZOVlLF2qKe53ZBrnPsPV9DXiw5eUaq7
	 01B8TdAu5nNAMkxVQceUYFj8gySaNzgfQJPmYKeAFoiWMm2LWOwTkQi+iAabUY0KOF
	 RS68jgOvfuih9hfuiHO0eK8HdWqM2uCEviCLzNiUrjvvkVsqETSKeZrvLGOmi2Cfj4
	 jT26RjK6NiQKA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3879B17E10C2;
	Mon, 30 Sep 2024 11:40:15 +0200 (CEST)
Message-ID: <57dfe684-c9a1-4cb3-8c87-9d2fef09aed7@collabora.com>
Date: Mon, 30 Sep 2024 11:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] nvmem: mtk-efuse: Enable postprocess for mt8188
 GPU speed binning
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240927103005.17605-1-pablo.sun@mediatek.com>
 <20240927103005.17605-4-pablo.sun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240927103005.17605-4-pablo.sun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_024017_688486_EBA034FC 
X-CRM114-Status: GOOD (  20.69  )
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

Il 27/09/24 12:30, Pablo Sun ha scritto:
> Similar to mt8186, the efuse data for mt8188's GPU speed binning
> requires post-process to convert the bit field format expected
> by the OPP table.
> 
> Since mt8188 efuse is not compatible to mt8186, add a new compatible
> entry for mt8188 and enable postprocess.
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>

I know I told you to just reuse the pdata from 8186, but there's something else
that came to mind, here...

...actually, the efuse block from 8188 is indeed compatible with 8186, meaning
that the register r/w, etc, are all the same (bar the addresses, yes)

So, I wonder if it's not just a better idea to not even add mt8188-efuse in this
driver's of_device_id array, and just add that to the binding so that we permit
using
		efuse: efuse@11f20000 {
			compatible = "mediatek,mt8188-efuse",
				     "mediatek,mt8186-efuse", "mediatek,efuse";
			[etc]
		}

Means that in mediatek,efuse.yaml you'll have to add...

       - items:
           - enum:
               - mediatek,mt8188-efuse
           - const: mediatek,mt8186-efuse
           - const: mediatek,efuse <---- or without this, even.

In the end, the "mediatek,efuse" property is somewhat deprecated, so that'd
also be a good time to start the dropping process, as I imagine that future SoCs
would also need the same speedbin transformations - which means that they'll all
be compatible with 8186....

Cheers,
Angelo

> ---
>   drivers/nvmem/mtk-efuse.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 9caf04667341..38d26e5c097a 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -112,6 +112,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
>   static const struct of_device_id mtk_efuse_of_match[] = {
>   	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
>   	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
> +	{ .compatible = "mediatek,mt8188-efuse", .data = &mtk_mt8186_efuse_pdata },
>   	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },
>   	{/* sentinel */},
>   };



