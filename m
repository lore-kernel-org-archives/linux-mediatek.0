Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EC0C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 11:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9EueikcJqzgxliNaML55RWwk0DUMw6PhD2Kj1HW7Tc=; b=b8wdv+tal39AZFdKj5pvzotvfL
	JMLXeQR0YXjovL3wGbrZk0XkUNtMcgdMeIMOnvbc1hEegaJsyEnBkdfht7B9uCuWGzgnmSzde+OGp
	L+NrMO8izcOevxXTDY5M4RsWI+jHTIMJrRd34LN2Qbd7mf6hqEIdB7Y3GsF8veOoCU1eS5t/E0LjI
	3DyUTUSWz4xpgJFliXrjhQ2w0j/PAFxyPCmuYG2JA22JIbd/tYBmfeljVbAu8qXZeCoC/gjtxC1sN
	rbTKL0qqRnb30xSX5snmDlupc0XrItwtxxFNoaMhtO6z2E5amT4TjHU4sINTt7a22ZZLLq/LjiHEa
	m0QYPVXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q28y6-00GUPl-1p;
	Thu, 25 May 2023 11:17:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q28y2-00GUOU-2U;
	Thu, 25 May 2023 11:17:16 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 17AE06605842;
	Thu, 25 May 2023 12:17:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685013433;
	bh=WtKJ8VIwt3KMym+KTBKAb1FdnlblHiYe+qro4eOjHW8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n24nCTXbgfypBRN3U7fnJnu2up3ADScJwpc2JA0nFGui1qdmf5duZY9yePFWb0Ymo
	 wFkRyo8k16ATEz5a23f736ySW4zS1rzRzKO8bZQS+MNNUHjylZL3n7xglvzdElxsMZ
	 LScAryY9OVQGnAdO0XPlR6C19TYs/z1vWKzS/zzq9IBBvNHimjcBPUg5KrZjvby8Oe
	 6iyBlHuk5T2UV9L+jhelwbe01MkvDIvTTS880A36gm/DOO904YJafpZVE7uhXGOXhv
	 RAQVA9KaPKqldBBbvXGSVzv2fMxuvGAHyf0lke77i1f+3eC7kL1juBhNSE6X02w6kA
	 wsZy3MgKhJyog==
Message-ID: <2bf27b63-2269-1e11-dd20-bf6a7691ee42@collabora.com>
Date: Thu, 25 May 2023 13:17:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] Revert "thermal/drivers/mediatek: Use devm_of_iomap to
 avoid resource leak in mtk_thermal_probe"
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 matthias.bgg@gmail.com
Cc: void0red@hust.edu.cn, daniel.lezcano@linaro.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel@collabora.com
References: <20230525111417.3350271-1-ricardo.canuelo@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230525111417.3350271-1-ricardo.canuelo@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_041714_940927_58304176 
X-CRM114-Status: GOOD (  16.09  )
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

Il 25/05/23 13:14, Ricardo Cañuelo ha scritto:
> This reverts commit f05c7b7d9ea9477fcc388476c6f4ade8c66d2d26.
> 
> That change was causing a regression in the generic-adc-thermal-probed
> bootrr test as reported in the kernelci-results list [1].
> A proper rework will take longer, so revert it for now.
> 
> [1] https://groups.io/g/kernelci-results/message/42660
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Adding context: the rework would require us to "probably" change this
iomap to getting regmap handle(s) and working with that, which is why
that wouldn't be trivial.

My apologies about initially misunderstanding the fact that
devm_of_iomap() behaves in a different way compared to of_iomap().

Ricardo, huge thanks for sending this revert.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


>   drivers/thermal/mediatek/auxadc_thermal.c | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
> index 0b5528804bbd..f59d36de20a0 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -1222,12 +1222,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> -	auxadc_base = devm_of_iomap(&pdev->dev, auxadc, 0, NULL);
> -	if (IS_ERR(auxadc_base)) {
> -		of_node_put(auxadc);
> -		return PTR_ERR(auxadc_base);
> -	}
> -
> +	auxadc_base = of_iomap(auxadc, 0);
>   	auxadc_phys_base = of_get_phys_base(auxadc);
>   
>   	of_node_put(auxadc);
> @@ -1243,12 +1238,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> -	apmixed_base = devm_of_iomap(&pdev->dev, apmixedsys, 0, NULL);
> -	if (IS_ERR(apmixed_base)) {
> -		of_node_put(apmixedsys);
> -		return PTR_ERR(apmixed_base);
> -	}
> -
> +	apmixed_base = of_iomap(apmixedsys, 0);
>   	apmixed_phys_base = of_get_phys_base(apmixedsys);
>   
>   	of_node_put(apmixedsys);


