Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C331C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 08:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=omRgN0J5yZix+Z65ddu+tHeBZrf7vaMQw16XFNCfZoE=; b=AU43hYY2O7RP6j27AYeh1TIdLf
	pdfiOo+vlaCW9TZRjV4YnRqsXg8dEUH1ue5CEtJnUTz328Te/3D+cH+ITxE7xZaKG4EQGogeTRYJu
	1qYa8wGIyabvWgbwC4QQ88d61dIwxFmmTT44jGjvAnE4UbMvZIruCpu3KK0vSadcUkk6+BtzFQLIj
	Zx81lZqBBSzVLQ4WgAU74tEfSDQSppZh1qPlIPWtI/WFqJxtjUVVq4jTz6gbNt8tVeWR/DmHe1/+p
	Wcvowl7Zv6QtIDrnDe7o7Z3qXogsOXrk5od2+19079jNRF/rvC0+RG6+rlDt3RVWgPlSa/GLwb5e2
	9voBK8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBBQU-008pbX-09; Tue, 12 Jul 2022 08:39:26 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBBQE-008pQL-Ak
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 08:39:12 +0000
Received: by mail-lf1-x12f.google.com with SMTP id bf9so12717303lfb.13
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Jul 2022 01:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=omRgN0J5yZix+Z65ddu+tHeBZrf7vaMQw16XFNCfZoE=;
        b=INPcpr5fSURpySLQoUpwTeVxIZyAJyPeGNY4vyVHDfDUyd4YJBsE29rkNEGaTW5Jlo
         WMp7hGjWg3zfeVA/gKMm9wA/yDcljNnT8IFYWvtATc6ZVVPIJdfvvRsjmXgFh98QUxUJ
         wP033DHPhOANHLEEWm77C0hbw13aVaSFBoIDuAqg4gDFYJyDygLNQks3S+dFt/he2Xye
         zmk6fBDwNdUeB23cA12bPDpzpX2IadzAsruamoCpZdIai9PPiChTEkj8wAqe1ACQkIaI
         cGPQN0ZU9U1RAei2xT/AX5otcYQDIX0goD+pIHTZjC6uqyvAEabpQMlNO4ZJSxRy8/Zc
         0eRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=omRgN0J5yZix+Z65ddu+tHeBZrf7vaMQw16XFNCfZoE=;
        b=JwUP9WoOmzIVfKYBsp14IHpLI++oKq2bdF7Ts/t41WiLZ0SbjFTe43l9v4cPjqzdug
         9ZWBTxBPq96U0xH5x/xEvmSH2l4rywJ8sJsauKJwB1Y571CiVep3+L87+rgC46Er/we3
         J9hOEGZIPe+ylYn90rwphvHBJZqyFiLOaSkM19S0xZNKFekR2HOBVYlVd66lOPL8tlhJ
         P0HE5DQ8xMFCahBhwO0HEQDQFfrnGeWK64jtOxF6Jm2leQYKp2Bnl1+0BY/wPpsF9Ssv
         Dk4zONJuRBHRQEBlqZjn8BprjYDN6uo4Mdp8VdIUrdWp301fkmuClmhOjNQ7bCZiC0d3
         dakQ==
X-Gm-Message-State: AJIora+F27Bgh1oNRrAkIUPFrsY9fpTnd8J4p5mVbDRv81cD70EZos3u
	yMkyfaLttgnCLhf08ECe3yExqA==
X-Google-Smtp-Source: AGRyM1vJWqunUMEEMc/jclwCCRXBmtDYhVAs6xxWGTzvIR3Ne3/Z6Gv3umiOi6ILzvstKeSp4knBrA==
X-Received: by 2002:a05:6512:505:b0:489:c93d:a95c with SMTP id o5-20020a056512050500b00489c93da95cmr12270053lfb.115.1657615146468;
        Tue, 12 Jul 2022 01:39:06 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id c19-20020ac25f73000000b0048759bc6c1asm2056194lfc.203.2022.07.12.01.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 01:39:05 -0700 (PDT)
Message-ID: <0eff0dd7-2d77-5341-5079-09d4a9309b1e@linaro.org>
Date: Tue, 12 Jul 2022 10:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] soc: mediatek: pm-domains: Grab SCPSYS registers from
 phandle to syscon
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, mbrugger@suse.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, nfraprado@collabora.com
References: <20220711122503.286743-1-angelogioacchino.delregno@collabora.com>
 <20220711122503.286743-4-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220711122503.286743-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_013910_418690_C3ABD6FC 
X-CRM114-Status: GOOD (  20.56  )
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

On 11/07/2022 14:25, AngeloGioacchino Del Regno wrote:
> Instead of requiring nesting of the power-controller inside of a
> "syscon", "simple-mfd" node, look for a phandle to SCPSYS in the
> "syscon" property of the power controller node.
> 
> Compatibility with older devicetrees is retained by falling back
> to looking for a parent node if no syscon phandle is found.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mtk-pm-domains.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index a3dae391a38a..c5a1c766cd50 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -590,8 +590,7 @@ static int scpsys_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	const struct scpsys_soc_data *soc;
> -	struct device_node *node;
> -	struct device *parent;
> +	struct device_node *node, *syscon;
>  	struct scpsys *scpsys;
>  	int ret;
>  
> @@ -611,13 +610,16 @@ static int scpsys_probe(struct platform_device *pdev)
>  	scpsys->pd_data.domains = scpsys->domains;
>  	scpsys->pd_data.num_domains = soc->num_domains;
>  
> -	parent = dev->parent;
> -	if (!parent) {
> -		dev_err(dev, "no parent for syscon devices\n");
> -		return -ENODEV;
> +	syscon = of_parse_phandle(dev->of_node, "syscon", 0);
> +	if (!syscon) {
> +		if (!dev->parent)
> +			return -ENODEV;
> +		scpsys->base = syscon_node_to_regmap(dev->parent->of_node);
> +	} else {
> +		scpsys->base = syscon_node_to_regmap(syscon);
> +		of_node_put(syscon);
>  	}

I responded in previous DTS thread. Technically code looks ok, but it
does not make really sense - either this is a child or a sibling. Not
both for the same hardware!

Best regards,
Krzysztof

