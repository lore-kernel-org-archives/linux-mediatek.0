Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49EBDC04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gso4zEc2tsd2SpRRIptou/A9NpRMhUK2WNA/cgD69YM=; b=gv0jCjX81pyfUdHXnWf3qmwGJw
	+5d7yF2Q3qpp5+um+WUiQwcHl89j/KujAL/4R9sYU7N106+cMdN/DIXdTvETgcGrP1MSRFeGUBuHZ
	lIRJ46PDugrvHfk2Nn75xCgUDrCuNp1Y6LcxHX6vHKGxG+vBRoHy31theaSGF5MBEL0Pvg3PiLm1b
	3354Mn8Pi751uCABqSOT9z9Yhei3NJ4lyh5h7vqNXFwQlp5KyDUtAIbOShH/56so2e+bolcPOAmYp
	MUApXEuyIU3EHGTHzqNAxBcYoZkGbEyJyERkF4sgv7rqEJlb4K8/oHeRugyVnNuyNYkxTYwjjZPGM
	AiJhM+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCv9-00Enrr-0L; Thu, 25 Aug 2022 13:29:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCuS-00EnXW-0i; Thu, 25 Aug 2022 13:28:37 +0000
Received: by mail-wm1-x335.google.com with SMTP id h1so10265888wmd.3;
        Thu, 25 Aug 2022 06:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Gso4zEc2tsd2SpRRIptou/A9NpRMhUK2WNA/cgD69YM=;
        b=I0Dc00L0QNQCzKZs5Wqc8xhvt7ABLf+OoML0udhyLTnVnGgTlBD4xF0aF1YonLmEcB
         Ns1Ppwk2zEwfNHBeloXB2JQ3qmOFr96hqxa5BfsGK+8XbHgRBA+dSJ7w64v6gKaEwa50
         ncMWyic8lASJMC7TlUmwrDd1c6XqgKFz6W7mKHsOssQD4Pg8A0lvujaHKJX+LQ2hDgeO
         0pjIcps6kC1S5Z95+JZFpu9955IQBAhGkOzR9x17aRuc683742a88CZqOokBdE1vJfo2
         YzFXv42fegAbceGXqmEPDP4U2Nazoo0n88c8tuqZ0l1hs+8lBXev9uEyVaK2uZ9EOu/A
         rK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Gso4zEc2tsd2SpRRIptou/A9NpRMhUK2WNA/cgD69YM=;
        b=3vmbEAfc/LVqbCEOnN9On3mkZgWbaWOQeALtWyXWWaXRHwUaZCKzHQ4GjLtgOtl38x
         m7tUmqtB/UZ+XHYJz/jJHiEijB2jGM+7juB2keGwcXMcNZxrshX/BMua8lL3JDsE/srT
         lWozs+2Dl9DEL28t85WUC7sr3BMcG6E0r917aDobGEbY1SVsE65OVfnX1Y6wiVVFJdk5
         MdacNmF445PcPPhX3ovAgG5bQrt9d7Qt+LIWPqV5DDVGnNd1wVpTfUH0kpakWowEUjTL
         303h1/WpUTak/GWgr11W/uyeGuSILjayDQKjqPdIbcMc1FGKy2eFwVd7HsxilbaJ4HyS
         HDfg==
X-Gm-Message-State: ACgBeo2BUqHq7Cgb7RwiZoz7Yc1wCEZH6TUQhFSiuBLl1O3KMazGfjLv
	WTsu6Jyd5BH6TJwy/R9UrNo=
X-Google-Smtp-Source: AA6agR4h2e363WvW8msby77B6QYfrw2i6rg9NyHdyGpzWeUDTFjTROTo9qm/vZ8e/AWz6cTQnrgV5A==
X-Received: by 2002:a05:600c:1c8d:b0:3a6:9d60:faf0 with SMTP id k13-20020a05600c1c8d00b003a69d60faf0mr1464075wms.82.1661434112422;
        Thu, 25 Aug 2022 06:28:32 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m39-20020a05600c3b2700b003a604a29a34sm6372686wms.35.2022.08.25.06.28.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:28:31 -0700 (PDT)
Message-ID: <c83413a8-2871-ecae-8954-25baddc7f04f@gmail.com>
Date: Thu, 25 Aug 2022 15:28:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 4/6] soc: mediatek: mtk-svs: Drop of_match_ptr() for
 of_match_table
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: roger.lu@mediatek.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com, kernel@collabora.com
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
 <20220726141653.177948-5-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220726141653.177948-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_062836_113354_EEA688AB 
X-CRM114-Status: GOOD (  17.47  )
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
> If CONFIG_OF is not set, we get a -Wunused-const-variable: dropping
> of_match_ptr() solves that issue.
> 
> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   drivers/soc/mediatek/mtk-svs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index fcf246a6bb07..80d0bab1a045 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -2840,7 +2840,7 @@ static struct platform_driver svs_driver = {
>   	.driver	= {
>   		.name		= "mtk-svs",
>   		.pm		= &svs_pm_ops,
> -		.of_match_table	= of_match_ptr(svs_of_match),
> +		.of_match_table	= svs_of_match,
>   	},
>   };
>   

