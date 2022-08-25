Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32EEC04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8Q++Ru9csFLxgnhJzeufcmNCmRUsGcf17MVPKICnH0=; b=JilpkTFTuVRqw9qfLi0qAk3ijp
	T6lczIHQrvxKXlEEjSGD0K/sX6NjItoElBR0S+BPdWHL4Fqnn+7Sh7xCsLLJZu1gOJ2ZUrFddMDuf
	Qbl/81GT6qFEejMZNzzCc/xJVr9PV3JGF8jSqwFkrYJgd2jB1n2Jge2JX5sq7zOi1i6vdebGJdJ+D
	aIZQ3KJ3PscblXCfP7QTxhw8abV7+VptkcMyLqSSNx68LGFKMwSvYVsdvXtK/YAqB8Appt8kLqFUa
	CQgZaHJYPEgKnbCtS29RpjOiD0rIIS3bAMw3BRlgShB/sAXyBs24Hp86ymuJ6PcBZSx0EFbQdx/iF
	r7Uur0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCt0-00Emqc-C6; Thu, 25 Aug 2022 13:27:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCsc-00EmfL-VB; Thu, 25 Aug 2022 13:26:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so2695265wmk.3;
        Thu, 25 Aug 2022 06:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=l8Q++Ru9csFLxgnhJzeufcmNCmRUsGcf17MVPKICnH0=;
        b=RxAreS/eI7mqZ/PdSSm5cTrGl2S3fwpt9sYhIyYeA6E6mXtYUB5RhW0PYqMCq5rnLM
         F2kxTf1V1gdLJG+AsDxYQSjzA8MJMc9SpB5iZfhVSnIE/oKCXS2Bda/jx9OxORBg4DNM
         eomf2vopklY5SNbFbiMsXos8FLPKZ5Hdyd+iQHLusTpYz7B2IjPIv5jCCG14Jhv5O8Vq
         vUVhqUdRQSbsdK5ls+m8WVRqljDQsor+rm3ZM2YNVjhW3zWzxR2loApzhEY4nQ98tG3L
         1JZCnzWjOjBjg2Ws8ONS2tOcWZcuupOCoo1U3yjYeuJ4w3I/YwJ6LTUX6kjIrxzY0jF+
         K0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=l8Q++Ru9csFLxgnhJzeufcmNCmRUsGcf17MVPKICnH0=;
        b=xdsHswlEaJnejOf1wBTzIQmBEXSxukc1ZYtcXTNz9OljGcXDC9x6q0EhZpfgNn/bMw
         mfRYDQGttcqPPH5u+E/GViuLqNIA2xS6G3oZ8O/qzjlwhUlVCObuAxlXs+nMRH9gPpFF
         ZBgCx2SHmBfeNceRxB10PQR6BfATKJBAz/bhCJ6BFPmeKsUyYO8S4ELu3qDam99sff7k
         8Hq/PVCu8A9fmB5Qd5ezxweBTRlfbsR7fE7CwngMqeyMFOvQfFaYKDeZUV4mekwSvrba
         XKzHIbNhWp4cKmHpTJdwmOBvppYqR6XjjroOg8IB01AgxK+NofpyZ8kIeTyuSC8PCEvD
         fBvg==
X-Gm-Message-State: ACgBeo2cRUozzV2/egAu1VpKI/IztQAfaogwA0FmQhby3WtW24m9naRL
	Ux8yEbdSZCkn0RdKc9yl1uM=
X-Google-Smtp-Source: AA6agR4oST7c6wvGCrpkNjV083dfHtO+/pRsLsJceDFTNG5zoXEEgag6nl7bW7voHJs1KwSZSbo3nw==
X-Received: by 2002:a7b:ca42:0:b0:3a6:9d:a444 with SMTP id m2-20020a7bca42000000b003a6009da444mr8538802wml.51.1661434000373;
        Thu, 25 Aug 2022 06:26:40 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q1-20020a056000136100b0021d80f53324sm20206297wrz.7.2022.08.25.06.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:26:39 -0700 (PDT)
Message-ID: <c757c143-44b4-a6f9-299a-6a35b05d9f64@gmail.com>
Date: Thu, 25 Aug 2022 15:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 2/6] soc: mediatek: mtk-svs: Switch to platform_get_irq()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: roger.lu@mediatek.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com, kernel@collabora.com
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
 <20220726141653.177948-3-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220726141653.177948-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_062643_066583_BCC27350 
X-CRM114-Status: GOOD (  19.06  )
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



On 26/07/2022 16:16, AngeloGioacchino Del Regno wrote:
> Instead of using irq_of_parse_and_map() to retrieve the interrupt from
> devicetree, switch to platform_get_irq() instead: this function will
> conveniently also write an error message in case the irq is not found.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks.

> ---
>   drivers/soc/mediatek/mtk-svs.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 600492dc334c..ee990acfc2d5 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -2757,8 +2757,7 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
>   static int svs_probe(struct platform_device *pdev)
>   {
>   	struct svs_platform *svsp;
> -	unsigned int svsp_irq;
> -	int ret;
> +	int svsp_irq, ret;
>   
>   	svsp = svs_platform_probe(pdev);
>   	if (IS_ERR(svsp))
> @@ -2776,7 +2775,12 @@ static int svs_probe(struct platform_device *pdev)
>   		goto svs_probe_free_resource;
>   	}
>   
> -	svsp_irq = irq_of_parse_and_map(svsp->dev->of_node, 0);
> +	svsp_irq = platform_get_irq(pdev, 0);
> +	if (svsp_irq < 0) {
> +		ret = svsp_irq;
> +		goto svs_probe_free_resource;
> +	}
> +
>   	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
>   					svsp->irqflags | IRQF_ONESHOT,
>   					svsp->name, svsp);

