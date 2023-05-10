Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6245CC7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76FXAH8QjI+FOKBGsSy8WrQUk/FqdfktfF/bZ9G6p1o=; b=bRcavw87wPLg4ZgPPmDM/qmj4q
	f9jkmaa3BSIk2sNdzBs4fisetSesDo5lJiemTHuDYHCUwhgokstgYXwJHZ/ulv04qNsGf3Wo/yYR7
	nwqseKB78dwHdHfXWO+jCnp6NB8VwaX0NnKiUnqUjG3xLFnR3PIfLC9WYaSUhVTPIxkZuXvt1yYO5
	/hJ2r7ybO1ad/bJtpWz2XISScjhwFoQ4RCshj7PjVrt/gLEDBRgrj9b+MVIAnp+xM/Jq4MtVpo/Jo
	Sd6tyZgXynJTl9qscl6n9AaJhOCTJCVAR8G420H974vY/93h4hoH70EJvdemLD3MoosBZBBhpZI+X
	YZSLNLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwn6s-006c9c-0d;
	Wed, 10 May 2023 16:56:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwn6o-006c84-2k;
	Wed, 10 May 2023 16:56:12 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3064099f9b6so4856907f8f.1;
        Wed, 10 May 2023 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683737768; x=1686329768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=76FXAH8QjI+FOKBGsSy8WrQUk/FqdfktfF/bZ9G6p1o=;
        b=gNKuLRopV1WQ4kTxS/5wQ4m7hl4+BBPI5aKmYXMfQzCkG/dQTYM6HjsPXyuP9p8gC7
         DYoA6qAoWh6KkfZn5ttIKFY0ArHdhQ9C5jYWkQAVD1p5tYLPQ0619I0wlXfMh0NMLH7R
         cmVUVONh/MADkTDLSeKaa2PSwNA6CZlB+7L+Sos2GSwWyi8Xl3bj23T3XSF6GEw+RrcZ
         JKKiDf1B2Xgk6JHIRfcPUy2yOim6DRFEF1qG3FMof9GLw7utN4ueUescSZGpAd6gmVrD
         oFoKFWR5bCPsbfITWgjNhsB9FKmJ1nS70yD1AFocheVXy9bUxHBe0ZM+Zojj4yyP0cYo
         27KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683737768; x=1686329768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76FXAH8QjI+FOKBGsSy8WrQUk/FqdfktfF/bZ9G6p1o=;
        b=BoQ98sZdHahMhSmppHMC0BFKkxrLiJo6uO3UNao83EsWVf/W2wn9yQTO+bzmQAiLTY
         dNrSf9iMH2klMEv72DS4BE3b4hr79UZE9cnfUGBYwpgzQ6Yti53X1jWE3erLYyUJu31t
         SxGVy6266WeztBGTOSa00aGEAvpsl6cYJ4hMsFqzthgDq1QlP11JmLNZl7lCmGz/iNE9
         lWBSiYvCAUF8XinuMv4StH/ApXST5S8TyV2PF2G3FyHezqlbIJMtle85pY2rqCalBKVA
         vA8j2/kxJaADm9d11XTYwCqDEtmbe9eWpesZdRSNfF3oKcQ9y6VpHandendISNlcBgCQ
         qTEA==
X-Gm-Message-State: AC+VfDzrLv+c9+VxUOvoKz5ALEMlH4ZIp8Q6n7bbH/6rnyyoBjyH4h6j
	JwCHZxu6aikIg+uGPkyX+OI=
X-Google-Smtp-Source: ACHHUZ62RGTf3iIJSn5ZpPrGv/U9gxaQ0dWwbzOVZAIuYaRat6he6PFt5S7VdYEzDyP1bpENowcR9g==
X-Received: by 2002:adf:de8d:0:b0:2f5:3fa1:6226 with SMTP id w13-20020adfde8d000000b002f53fa16226mr13285768wrl.14.1683737767570;
        Wed, 10 May 2023 09:56:07 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id d18-20020adfe852000000b002fe13ec49fasm17764802wrn.98.2023.05.10.09.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 09:56:05 -0700 (PDT)
Message-ID: <450c7dae-9935-1189-4853-001f5f1d1be6@gmail.com>
Date: Wed, 10 May 2023 18:56:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 42/89] i2c: mt7621: Convert to platform remove callback
 returning void
Content-Language: en-US, ca-ES, es-ES
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Stefan Roese <sr@denx.de>, Wolfram Sang <wsa@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-43-u.kleine-koenig@pengutronix.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230508205306.1474415-43-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_095610_908325_DADA53B1 
X-CRM114-Status: GOOD (  23.73  )
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



On 08/05/2023 22:52, Uwe Kleine-König wrote:
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
>   drivers/i2c/busses/i2c-mt7621.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 20eda5738ac4..f9c294e2bd3c 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -332,19 +332,17 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_i2c_remove(struct platform_device *pdev)
> +static void mtk_i2c_remove(struct platform_device *pdev)
>   {
>   	struct mtk_i2c *i2c = platform_get_drvdata(pdev);
>   
>   	clk_disable_unprepare(i2c->clk);
>   	i2c_del_adapter(&i2c->adap);
> -
> -	return 0;
>   }
>   
>   static struct platform_driver mtk_i2c_driver = {
>   	.probe		= mtk_i2c_probe,
> -	.remove		= mtk_i2c_remove,
> +	.remove_new	= mtk_i2c_remove,
>   	.driver		= {
>   		.name	= "i2c-mt7621",
>   		.of_match_table = i2c_mtk_dt_ids,

