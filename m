Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11423ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 10:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6Oto6FkOxcH9sTVmFt9+mb30064xkb5Yt2EjFQ4XWE=; b=PuWFidpNo6TsqLJhyk7utJyqtD
	wnKCpX7I9uDneRurqR7SGAlcuaGMg0bcx3IhX3pnlDDezwC4BWlBi1PLXXp/ShSUITIK+qL6d+AxU
	DQvGnKxuAVZ79sQHiPzIsIszhQMbFmpzdcQXQ2kvXeMQ7m0k1BxNpAdYJTp+kuEMq7y7QjAAfpgL+
	Xht6r6JndPa7avPaCVT7FxFO1haRFaLalyumYSDC9Jpl7eluhLf4TAX11gebNRdB6E8WGQ/eyuIy2
	W1xL6RALHwlOMe6TnIvt6is+ihw/V6dwush0RTlZ/OYeJq65yF+uM93I5QWsT9z1mIklbwKIXW6HA
	S0KSN7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbsS-00000001Xz1-0LBu;
	Mon, 09 Sep 2024 10:44:12 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snbql-00000001XZq-0QY8;
	Mon, 09 Sep 2024 10:42:28 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so446122666b.3;
        Mon, 09 Sep 2024 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725878544; x=1726483344; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b6Oto6FkOxcH9sTVmFt9+mb30064xkb5Yt2EjFQ4XWE=;
        b=Q4t6UJjti8W9PwskAF/iA6rWalIsbE2vua6L2ruHNffzajpnQliYMO9VYfArDaiwBb
         yauFh3l4SIKJyhNhZ0koBVLKKql55a6W6TIho31XolCcLEZJ93Q0kEEf1RMAa5EYoRDT
         hfScFycQXJ1w2tTSimkBhPIp644BkOyIREYvxYdSD5OKTswKISY/bHZRovC9j3ZGkFiL
         x5PcikY+AThvzCyrUPWmA/BkjQdtkAAPdDrvGlOTRzj29pDUNEdsnHA/uiJcS8AKUh/D
         m1K44DfajyJB4tamMxdj5jGmx5pRkYN/B6DPBCRacgYaM5pIjWQ02NLkm+8nk3JhYNsL
         ANUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725878544; x=1726483344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6Oto6FkOxcH9sTVmFt9+mb30064xkb5Yt2EjFQ4XWE=;
        b=veHlG29KXvlRWYxvOf+a5Xs5l4DSZPcznV72oYZgwBF84odZMgudGaqGfMtroWl4Sg
         duC8iTB9f+tEvk0n3V6kYzrWu1zTHlGmxkhxsrg8S/6r4y5RWzIYgBwEXU9G1LNJ+bqV
         7+KyAszP4d2MsQEb/WUCJEnPzG+ksBGOzpYhkOzvfssxW08MjKbV/xaocCpOLn50yFfK
         au4KWFjv5tELMotWiKtKWEPqWvtL5iZww7CK54/3mvNAE0mCCyro1mP/VOaHfQ/0PM5h
         YW7Yy0p5LP8kYx2flGRezMvJCC0T2ypczk2UukrHj4ORoJqUXmfzVmqB89Y0PyAY7ImG
         8EGw==
X-Forwarded-Encrypted: i=1; AJvYcCUTHkiC4sKJNsOXT5HQLLUYFU6xDmYxfIxW1z9L7gsL6Lw10vyWmd9fOMQfeanTn0mzBQlt8CocVtJtUk6HkxcT@lists.infradead.org, AJvYcCXI6hlvChwQTwgaHHwWq6WZXqHcljU5YJo06qmP3Tx9g9mse+UzvX78kjyO4Q/NBtY4JMpdlKeymW0oy2S+JGM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyeg7qlJJcElQVRTwhzqHoMQupiBS0FkH7gTXHJkDrD8/wgeklF
	Kb1k9RknQGBTqab5V+hqdGHO3IAR51f47YW2LAy5WWnjIzHpVF3L
X-Google-Smtp-Source: AGHT+IH0iXsw3xij6cQqnu+SGrGqFa+YmSdDyrUlCs5KPYn1WYIWamsfl8DEWZSqZLwW5qUnaY8noQ==
X-Received: by 2002:a17:907:2d2a:b0:a8d:60e2:396b with SMTP id a640c23a62f3a-a8d60e23b34mr113737166b.65.1725878543657;
        Mon, 09 Sep 2024 03:42:23 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.7.156])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d259528ecsm323452266b.67.2024.09.09.03.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 03:42:22 -0700 (PDT)
Message-ID: <d39fe852-23f9-4202-8785-70cc977f22d7@gmail.com>
Date: Mon, 9 Sep 2024 12:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: mediatek: mt8365: remove unused mt8365_i2s_hd_str
To: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240907200053.3027553-1-arnd@kernel.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240907200053.3027553-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_034227_180834_4CD583E5 
X-CRM114-Status: GOOD (  16.37  )
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



On 07/09/2024 22:00, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The mt8365_i2s_enum and mt8365_i2s_hd_str variables are not
> used anywhere, but cause a warning when building with C=1
> or when enabling -Wunused-const-variable:
> 
> sound/soc/mediatek/mt8365/mt8365-dai-i2s.c:781:27: error: 'mt8365_i2s_hd_str' defined but not used [-Werror=unused-const-variable=]
>    781 | static const char * const mt8365_i2s_hd_str[] = {
>        |                           ^~~~~~~~~~~~~~~~~
> 
> Remove these for the moment, they can be added back if a
> user comes up.
> 
> Fixes: 402bbb13a195 ("ASoC: mediatek: mt8365: Add I2S DAI support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   sound/soc/mediatek/mt8365/mt8365-dai-i2s.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
> index 6b4d8b7e24ca..3482d8f8b4e7 100644
> --- a/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
> +++ b/sound/soc/mediatek/mt8365/mt8365-dai-i2s.c
> @@ -777,13 +777,6 @@ static struct snd_soc_dai_driver mtk_dai_i2s_driver[] = {
>   	}
>   };
>   
> -/* low jitter control */
> -static const char * const mt8365_i2s_hd_str[] = {
> -	"Normal", "Low_Jitter"
> -};
> -
> -static SOC_ENUM_SINGLE_EXT_DECL(mt8365_i2s_enum, mt8365_i2s_hd_str);
> -
>   static const char * const fmi2sin_text[] = {
>   	"OPEN", "FM_2ND_I2S_IN"
>   };

