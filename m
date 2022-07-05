Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A453C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 09:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9c2zH5Ka/eXErCWc9OAeEIYZxxfn0kGsAuxHLmR0MwM=; b=dU9VP2hWSv5D9mlMYUGTf3FFdK
	gLDG5XBzEtB9Dfrw/QOucibS6VEx+oU+VbudcAqqae1pBGkEjRZWmMK+vlYnma3AddVYiBfY1Zr7Y
	ecGeia6qE/qqhWAAJQbGiJarQdM4QP2LWvzBFga/dk1/I2r7JG6JzcSoaATjjNjrTBz+oGVyNKEU3
	n39yVSZ07s0ZQW9gKMH+/tRc6HSLZ0aZoVfXvJDRdh1nWERWM7Enhmoyz+EjBfwWXl6BfScO9nEgP
	lynmoUIbL9H/CGTYoN4yOJrXJ+M/hG0EHGfsAA4lXLv1v4dzq4FibI/ssokNeGu3pEv6pGQhzKpoz
	pLVpVcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8f4e-00Gpzk-RO; Tue, 05 Jul 2022 09:42:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8f2N-00GoHi-U7
	for linux-mediatek@lists.infradead.org; Tue, 05 Jul 2022 09:40:09 +0000
Received: by mail-wr1-x434.google.com with SMTP id h17so3548084wrx.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Jul 2022 02:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9c2zH5Ka/eXErCWc9OAeEIYZxxfn0kGsAuxHLmR0MwM=;
        b=JgKFYwGLb3WNTsHz51CqAdXff9PBIjZy1XgPLck66brhFctZtsLIz6DFizileE81G2
         8P3FfHIKhBLoA/m29D3sZ3Trz2e6aVHPTFkTWqrQWjW+LaJWXSnRDuxB4gyXVLpj0jOp
         QUoMYZgewPvFyRdEEVooGycGJlEfaFrDXaObXWg/dyjhrExDYj62FCXwGYnJ6oXq88J1
         VTgD2K3cAYZIleQDTNC+LNQZzPpK961y2973ljjQ+A7G9N9ym5imrEQIejg2T0lwQPeY
         61ycT2gtQTh8WYdiPclhstQX4chVB5CgDZOciBK9cJ7a31e1zyuel3aSl5lsowLAqda+
         t95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9c2zH5Ka/eXErCWc9OAeEIYZxxfn0kGsAuxHLmR0MwM=;
        b=upaY05+qeEEIhGTISRiub/AmSzzGtSlHF/RkMQiTooU1jgqEVQFLI3EdFtpISYQ5XE
         1kzA/MHTqnWg3Y+WrQzIO8SgI6A2bUj4IrguGORNdS++9QuOWT88iRPMnG52D3ux0Gjj
         KqnWdb063/pwEXVz/nfVXyOqcg/A+7W4e00YeG5vRSwfZRMCOOnhvWJilwclpOqJXLg8
         IBMGDshduzEOptnT2H/27qH61LRCpH26+I9ibGFCTouPlz8UuOGJCU/UsJe7iDkeT4U2
         1xcTF9oyjOdOY8fOOaYacQ5ESrJYld92IgqxnS9+5p0w21JK6ZMaonomqQgO+kIXIBC9
         DX8Q==
X-Gm-Message-State: AJIora9fqupeUejIbWAkFy/uiPZyAs9dPUvlEd6UW5XkvNz2YcSVXSzt
	rfuCDwXWe+H8YydumC7/V6h4pQ==
X-Google-Smtp-Source: AGRyM1tr6pY5j2TTIj5nJsSBtLXQusyIjGe24us5gI23ia3KWn8EVRUCy2OD/Hd17J5lwsEX+pLbog==
X-Received: by 2002:a5d:598e:0:b0:21d:3f55:47a8 with SMTP id n14-20020a5d598e000000b0021d3f5547a8mr25273650wri.409.1657014002013;
        Tue, 05 Jul 2022 02:40:02 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id l20-20020a05600c1d1400b0039c4ba160absm21129871wms.2.2022.07.05.02.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 02:40:01 -0700 (PDT)
Message-ID: <8e278e36-c31b-b2bd-9cab-01bc940bcd44@linaro.org>
Date: Tue, 5 Jul 2022 10:40:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] nvmem: mtk-efuse: Simplify with
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220623121558.107400-1-angelogioacchino.delregno@collabora.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220623121558.107400-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_024008_119159_AD4D0D8B 
X-CRM114-Status: GOOD (  13.77  )
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



On 23/06/2022 13:15, AngeloGioacchino Del Regno wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> No functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied thanks,

--srini

>   drivers/nvmem/mtk-efuse.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index e9a375dd84af..a08e0aedd21c 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -41,8 +41,7 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	if (!priv)
>   		return -ENOMEM;
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->base = devm_ioremap_resource(dev, res);
> +	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>   	if (IS_ERR(priv->base))
>   		return PTR_ERR(priv->base);
>   

