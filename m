Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899F1C636CD
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 13:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vw801mwWk0KCcLWM1T0jrGEH/aT4tkjZkJZV8F+ShB0=; b=OBkBdSs39RlbRWnKsWojc2O8Hf
	ZSLdeHELH8WGFm965WioTZ29hPNgZfhYeQ6d+JGRPQ8DfYmtSy9toQ3CFgM+CS6jMf/n5jzjaVjxD
	v0SN+MRj5QqmE+nFiV4NUc79svJcL4d9+k2ZL7S7KuXWj1eF0sqPdQM104q1rMPOD37n81v0CG0aK
	mRdW43jgGimd79L1qRqhUEcvs70yGzQpnR3MXdrELwNMrevd/3ZEmL/nQmaj1RiIfPtolqi+iJES9
	1VzKVeb60VxUWsI74OYCup+Q8sly8EdWhXyYNtXwp3Pdze7pc4eX4c8a7mWvzXP7NDao1CjAaOQcB
	tOpX4e5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDHG-00C69f-KG; Wed, 01 Feb 2023 13:35:54 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNDGy-00C64D-V6; Wed, 01 Feb 2023 13:35:38 +0000
Received: by mail-ed1-x529.google.com with SMTP id u21so17698943edv.3;
        Wed, 01 Feb 2023 05:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vw801mwWk0KCcLWM1T0jrGEH/aT4tkjZkJZV8F+ShB0=;
        b=plbH1ZCnKk8fhiONJXHFzOcpQpwaukvumZdGWQXuQEO0R13C9FSY2vD7K2gKtTJ9mh
         aU2BNkGI4CaJdY5ZALiO01x7xzYeA+iRnr+u+WpITk7lnZxy0ePowVfeSP5vxBbdrsk6
         W1y5SSzImmEMKKYi9XoovvhYNjVfg2AquiPrH3wcIv6LD5pUIcF7gleeH3iYq298Nf+m
         6EbM3DjPM4GybInCF44qHjQG84B07l3hYfdoKTXGD1QfRKgPySv9oC9mcAW3ZRTdUKQp
         vC7sVtbBzaLH4/7toQyio0JFjvGosWQuv/Dj+onJSuQuodhGqmsLPbSgj6CVURuJvU7X
         5rSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vw801mwWk0KCcLWM1T0jrGEH/aT4tkjZkJZV8F+ShB0=;
        b=iXPYy5r4yq9j/YNV1hqk1k2MpBwmz/SOHiZ46fVJA5gUcq084ZCrh6y71Qc5pMEEIG
         BL7EDByVxclFRXU9nKfbf2FcLqnKUjXP1Fid6y/JXlkL//LTeHq/gt6AgVmNv4WvjLsX
         cQtXoAhVQsgwtdEW0Y4XfuJ3ZjhOa9J/4VwdQRo9U53X0t3JoolwkAEHzlieMm5VsKXY
         4bwFUKW+5l9tpc1IYfc/4Thc/z+mbdoRjRdY+N4DEHdOhh3Hxv8cES+pV2hjUrXhIW8m
         KW5BlMGDD8aj8xGpPrzql+4h+BjAKGK4D4nyuMtwzWdFrF+ynsNyk/eOwQ0ZBxk4AsXW
         dlNg==
X-Gm-Message-State: AO0yUKWQaAPXrTGSM9ogjKVoTDFIkIU1GaVrjRAj32G2DQINK0zkOemJ
	3Njv81iMbmkLKvIe09j0m2+hDbAO/NA=
X-Google-Smtp-Source: AK7set8GBn429IEg/c4qLHQJBaojzk45vQ7JlI6+mY8WK2wuZhrzdtaXDv3kzUFaM75m1x9OJ5ZT8A==
X-Received: by 2002:a05:6402:290:b0:49e:28c1:9375 with SMTP id l16-20020a056402029000b0049e28c19375mr1977989edv.10.1675258535251;
        Wed, 01 Feb 2023 05:35:35 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id la7-20020a170906ad8700b00872c0bccab2sm6178895ejb.35.2023.02.01.05.35.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 05:35:34 -0800 (PST)
Message-ID: <11f26ee5-62e5-6315-b915-67aae535d44c@gmail.com>
Date: Wed, 1 Feb 2023 14:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH -next] soc: mediatek: mtk-svs: add missing
 MODULE_DEVICE_TABLE
Content-Language: en-US
To: Zeng Heng <zengheng4@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 liwei391@huawei.com
References: <20220928151346.1942977-1-zengheng4@huawei.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220928151346.1942977-1-zengheng4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_053537_064545_77E625FD 
X-CRM114-Status: GOOD (  17.38  )
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



On 28/09/2022 17:13, Zeng Heng wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition
> which generates correct modalias for automatic loading
> of this driver when it is built as an external module.
> 
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>

Applied, sorry for the delay.

Matthias

> ---
>   drivers/soc/mediatek/mtk-svs.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 0469c9dfeb04..b5c38816b553 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -2326,6 +2326,7 @@ static const struct of_device_id svs_of_match[] = {
>   		/* Sentinel */
>   	},
>   };
> +MODULE_DEVICE_TABLE(of, svs_of_match);
>   
>   static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
>   {

