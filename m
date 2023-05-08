Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A0DAC77B7F
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 May 2023 08:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXa0uGPhE0KctSUw4+SndKWGHKFHHzQ2XqiJ9KtCp7I=; b=Btf4++gjIF5EnrOZ+pJf04RqTc
	/jUQ5Tbu1IQSX+mFzwoRmp0+bqoNf8MmUv+zoMrbmZplGJ1kLQMCmCDqaq5eiW9qEvMsFDqD5kSFS
	PsCRf14tbCVed6bcR05WBbk2K9LNhw6BUyBzko8VQNbCQsoK/uGMt3A6q+cVx6lCjcr/x53eMh3rd
	1VOMKdqbmtXbesR9/2HpWPvIHX3rfAtugTLvUv/t/uNnf/H/lsv1syir0j8mOETlANqfKeYI8flj0
	BZ/J/xX/+gW162VsJuFFxSXbV2UAb59jvZLVSUy2DkwZ0CSB7sbj2qIwlqtZy5nc1J57iELsQaogC
	9x/C00ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwCA-00HZvE-0g;
	Mon, 08 May 2023 08:26:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvwC7-00HZts-06;
	Mon, 08 May 2023 08:26:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3062db220a3so2659639f8f.0;
        Mon, 08 May 2023 01:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683534363; x=1686126363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xXa0uGPhE0KctSUw4+SndKWGHKFHHzQ2XqiJ9KtCp7I=;
        b=FTiru0tnSJy7FuH7UZujStcI8OERjVTJl8+UTIU112kpB19VMbW2UBampbjIvqDz0i
         hktclbT9kWu14p4GzOCb+g6MTseYCRYvLKP/HZWtljr/sDjfeAjKrU7aCiqZPs6Jw24m
         3XpEPVHYNjjbtOskVlfjRlQp9/rM60o/wD+Nx/JOtGf0ZsgvecI8GZb7brPPqo9Ad/+v
         qFO6OVEUIMRPX4phcUFsR3EdnULfLMX9aeziaJJdm7MV2K8TPdfBOy1Dwtcu5k+NNlrB
         o1YwDt8mtGMomAiDQB/2VghFhae4UA5KFGkhUKpRcCTS3EERpmSmBkPJfHvTmDCADnv6
         WrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683534363; x=1686126363;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xXa0uGPhE0KctSUw4+SndKWGHKFHHzQ2XqiJ9KtCp7I=;
        b=MWhsDcECf+ZCPqawZ2fLMwnDCVPnaVGhsJgdHZfFh9FjpbRc+J9UQGOECbYaz7YO+W
         +qZHwIl3rr7wTxlXTBmLF8rBCJ3bo/iBFN2ouOVtCilWxcKaglPkM9tYkogcFKI3cG52
         59t0kkQUmvZ1cxkd0rdWTahkltqFXX2hnA9kBxZ7+DugNQSj5BOf9Yqrq6L/SsQdjMtZ
         WHnZ8niSUvAr+LDCjMF1L5FCtg3+gwoX0dKRPCYBNlE2BIKt7E+zyJ61hwAEl/T4rLto
         vdUdBmxVxRdPtmN24ZA5XHb52/3OkPCraUbi0dy0lh3pvJV/DEp5+/EG513xsYsBI4rf
         V2SA==
X-Gm-Message-State: AC+VfDwXpoLFE1UpkswkN7LSs5xDmVbtejicvKe7brNK5DJN1ye/tH4j
	HiKuuXFVxWc4AI5kuzPPNLI=
X-Google-Smtp-Source: ACHHUZ4vgqYc95MP1tLQbZAD7zAu1WzZp8GKxK+1hLCjTeIxzu3i0reKJSeaDWKZs0XindiyzHVglw==
X-Received: by 2002:a5d:46cc:0:b0:307:1bba:ea61 with SMTP id g12-20020a5d46cc000000b003071bbaea61mr6867402wrs.44.1683534363097;
        Mon, 08 May 2023 01:26:03 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k11-20020a7bc40b000000b003f4247fbb5fsm2888892wmi.10.2023.05.08.01.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 01:26:02 -0700 (PDT)
Message-ID: <7aa7aca9-aa50-209a-fefd-a0792540aceb@gmail.com>
Date: Mon, 8 May 2023 10:25:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 28/53] drm/mediatek: Convert to platform remove callback
 returning void
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230507162616.1368908-29-u.kleine-koenig@pengutronix.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230507162616.1368908-29-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_012607_075379_F132468A 
X-CRM114-Status: GOOD (  24.26  )
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



On 07/05/2023 18:25, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_cec.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index b640bc0559e7..f47f417d8ba6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -235,13 +235,12 @@ static int mtk_cec_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> -static int mtk_cec_remove(struct platform_device *pdev)
> +static void mtk_cec_remove(struct platform_device *pdev)
>   {
>   	struct mtk_cec *cec = platform_get_drvdata(pdev);
>   
>   	mtk_cec_htplg_irq_disable(cec);
>   	clk_disable_unprepare(cec->clk);
> -	return 0;
>   }
>   
>   static const struct of_device_id mtk_cec_of_ids[] = {
> @@ -252,7 +251,7 @@ MODULE_DEVICE_TABLE(of, mtk_cec_of_ids);
>   
>   struct platform_driver mtk_cec_driver = {
>   	.probe = mtk_cec_probe,
> -	.remove = mtk_cec_remove,
> +	.remove_new = mtk_cec_remove,
>   	.driver = {
>   		.name = "mediatek-cec",
>   		.of_match_table = mtk_cec_of_ids,

