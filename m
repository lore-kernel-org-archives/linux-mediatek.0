Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A41CD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4jSpaPfow6+ml545k0HY9HHXw7c8Do/h5EdHSfFnZ4=; b=BYFDQ/zGcFJsSpq4x7dni6WqK1
	5V71WsOCLbq0VlXBLrLwv42YpLMYExKgZDX12KsYTPH2oxusEZIN5f9W1gt+Z4NidPAAs7TAVxVrw
	5eVoq9zBkIzV3uYZlUlYpiZTf6VQK9VFGYLA3gbma+k18ZfcMa0FxK8NxiS0pGDwOCfFuq4FYuzsK
	NoWxGiOt8bdZl4QppP+gS5OpQDnSzwjudFWV4jpcanbLRW8fWhCL/XTa4UU+i/sRuqmwyP5OQLhdD
	NaUkeIcYxH8zEl3ibdbAXS/lqLDvE4s5BZBqruqP6SRy/hCms68imZbT/YZcTxIuMPX3t5CJ66kji
	MUHlettA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl4yi-0000000E4Cp-3k8v;
	Mon, 02 Sep 2024 11:12:12 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl4yg-0000000E4Bq-1XX4
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Sep 2024 11:12:11 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a8a16c53d3cso30136666b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Sep 2024 04:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725275528; x=1725880328; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p4jSpaPfow6+ml545k0HY9HHXw7c8Do/h5EdHSfFnZ4=;
        b=MAC2Z37LkyjiIXiF9/o9ny9CYRb1oa9zkowen0TM7TO0EfRkJs9ZQO/dfGacyhP9v5
         BHYo1xbjmTMbBn7WSQyjqDItJS+JrZ3HuMhlTKUlbugx/nSkEgKbReU1dtVjaMrxFCG5
         bjmqMlmEmBIvga+rO7BqlvfUZobeU82Jt/CZVtUpJZVkqrcmwO0MIHsZpweRLFpoxklv
         FfelJmdSpAkuOxV+k2e4lQK88kaceJRUZB2avVJ625HKR/VBoKyU6E6oihU5tYVomDZa
         9pB7HE4Ho1uxbw4RgVQF0SRHZwgGccWC0+Jfnbzba8PUG/fknGhqDW6M6jsZ8xiYhSyX
         szwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725275528; x=1725880328;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4jSpaPfow6+ml545k0HY9HHXw7c8Do/h5EdHSfFnZ4=;
        b=DLG7bYV5bO/i1KqtRJWdwksFwKXeve5aSER5EBkS86dtojvwibnS8C7dyV0aOcXzoS
         Qe95CY05U2mWEYFcKdVwRDs60JCVJcX2quUdVmKenwTSDnH+sgnw/U8M9IAlF8IgRaf1
         oZn8UR9HmJfTbade/HfMEtFizgkK+MlduKSQjHukl0DuwS2OTXpAgWSrH1cOuSwf9sN5
         N7SjVnSIIkaus22crkFdojtcsitXvtqChWi8g2vhvjNahqRqGlcdYzJYzE5YBlBv/i6E
         GsXEqwU12CMAr+gkax21l8JQZAVbeClXV0lqZHVUELBtyPJjZKNkJB4sUp9U4ZXnSWyZ
         6INg==
X-Forwarded-Encrypted: i=1; AJvYcCUaMEM6IWbR4gg9ElliT1M3rfS6+LGCkR1MZxWcfAMUMg9y5BdbFFukoyvM3m2DY9i8b+WBo20HP8mZA+ANzw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3L1wIXrHQE5+Wf0dpuTvYaElmVXO9zV5hFEFdeBGFEg0Rx2Vu
	xjB8bAN0NkTuLrh9LvQ7oTYC8/44cr8DzR73S1eJb5jzlcGSbtes
X-Google-Smtp-Source: AGHT+IG/XGCurZXihIULw+QDIlJ4QeBYMB+6WOuN7ftHaAbSTzW4It94lvV85w7JbUwnay8SFX5l1g==
X-Received: by 2002:a17:907:608a:b0:a86:7a59:55e9 with SMTP id a640c23a62f3a-a897fa7360emr960421866b.55.1725275527528;
        Mon, 02 Sep 2024 04:12:07 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6f9esm546820366b.154.2024.09.02.04.12.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 04:12:06 -0700 (PDT)
Message-ID: <0d8c7614-809a-4bf1-b91d-4517e888e15d@gmail.com>
Date: Mon, 2 Sep 2024 13:12:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] pmdomain: mediatek: make use of
 dev_err_cast_probe()
To: Hongbo Li <lihongbo22@huawei.com>,
 angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org
Cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240828121230.3696315-1-lihongbo22@huawei.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240828121230.3696315-1-lihongbo22@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_041210_440612_70A211ED 
X-CRM114-Status: GOOD (  14.12  )
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



On 28/08/2024 14:12, Hongbo Li wrote:
> Using dev_err_cast_probe() to simplify the code.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/pmdomain/mediatek/mtk-pm-domains.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index e274e3315fe7..88406e9ac63c 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -398,12 +398,10 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>   		scpsys->dev->of_node = node;
>   		pd->supply = devm_regulator_get(scpsys->dev, "domain");
>   		scpsys->dev->of_node = root_node;
> -		if (IS_ERR(pd->supply)) {
> -			dev_err_probe(scpsys->dev, PTR_ERR(pd->supply),
> +		if (IS_ERR(pd->supply))
> +			return dev_err_cast_probe(scpsys->dev, pd->supply,
>   				      "%pOF: failed to get power supply.\n",
>   				      node);
> -			return ERR_CAST(pd->supply);
> -		}
>   	}
>   
>   	pd->infracfg = syscon_regmap_lookup_by_phandle_optional(node, "mediatek,infracfg");

