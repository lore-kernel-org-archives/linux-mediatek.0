Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B692C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Dec 2022 17:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTQ6G2szldacTi/s3gJTUQlmGKJMBS6VQ125oYFyBx8=; b=Fr6NBY+AP8djnWBcYmhmmFsExF
	XQmi6jOatX8K9Q6ha/WmIXw/ypV6vVrFp8vkcyiyoRkQZxZI8Ks/qmBuGzFjZIsyhbG/H6aJAcvGI
	++ZIzsIG+yQmaWPgT51l84A3jHYA/CXtcnAoVLjUkQZLl/VTPkGKTLs6aQdZm24/i+EAIK2YWILDq
	cQug2CkFoXV1+YgWG48J/4PLyBMM3snJNflDKFawQfIaWMWwHeLA9nlbed37knQpsp46VRB0snUzG
	oFsNyxyglf2P9s3EIkkQj/sGaVq/CwxoNsUtBMqQZ5adEnBvHdb7u5G9BTvhveghOgTnZwTktzVU0
	EFJdq8IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Jc5-00GVVn-Qs; Mon, 19 Dec 2022 17:07:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7I69-00FOlp-3o; Mon, 19 Dec 2022 15:30:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id m14so9015234wrh.7;
        Mon, 19 Dec 2022 07:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTQ6G2szldacTi/s3gJTUQlmGKJMBS6VQ125oYFyBx8=;
        b=eUav2kVKU5p8sDthFIbgHzqdA3yxrgylMhYz07uqKZs90eIQYt8H+orFGPL1ygyWXJ
         WvrOOs18X2Fs3iGoXObwlrJ3/0ZEJLvZ5/NivWy+zmYiuc9vaRVs1rGkDhPOvaqJAZfH
         tB5Y4GRe/rQv8wYeq67N1lsT1zZ9owWplgT1D9SURqAnQooqvdOY8uZK8XiV1JpN5jMt
         2gI96QZyPWr34rbjj/KsTCjJg6Dj/t7YhkbJeGWKKUBik7QU78i9euO1ZYWmYt2bPQyC
         jpmVsJ8gJOXeWnLjvTY/E62zmUqoixBxGS7vwooY6OCSbk+PVBbrWM9M3v0boCz1ms5Y
         hVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTQ6G2szldacTi/s3gJTUQlmGKJMBS6VQ125oYFyBx8=;
        b=Al5w9gC7hkLzAjyNCix8DyDX95KP/MuoIXPwVbvEHczwPZJH26yV4wnJvfbWykrhHy
         O3MncQ+DjDuobl3YpPXV1QsLKUniV3jzLXVMvFfH6wMIVJO7xXR2RRQWWB1p2AK2kiFR
         AHztvjK3EQWcHT5iiFFAeJT54SFgUlUjnhrv5wGrQroOJQA46ULF2QQodR8AaHsyMek3
         SUFcKH/uy30t7qwlzGhJXuYzrQlfFNOL2ULuM/ps5YR7/d77fxM8XgS+SEbYnP2W9px2
         zgz/NrJZx7/n5BYxTRC2sh9Uj6JBU2b4PSaDaI6AR8L7qRghjS+MTJPcqprI3UrOKsBZ
         Og5Q==
X-Gm-Message-State: ANoB5pnn6J+11am+YyM2FdfK45+0VA9clJIzImdO6Laa5ISPv1uURL50
	GxIyqJlUH7FmrSaRSV8rxtw=
X-Google-Smtp-Source: AA0mqf6OHT62PrwhgFgVpJEqsIU0+tVRZO6rLoXmVtaw9hEQeVPbnkWFog31jANr4bCVbjtIihTb3Q==
X-Received: by 2002:a5d:690f:0:b0:242:2b3c:c7e with SMTP id t15-20020a5d690f000000b002422b3c0c7emr27389352wru.17.1671463834297;
        Mon, 19 Dec 2022 07:30:34 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z1-20020a5d6541000000b00241f029e672sm10191022wrv.107.2022.12.19.07.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 07:30:33 -0800 (PST)
Message-ID: <5ebaf98b-a77e-3c5a-3e08-bbb0119558a2@gmail.com>
Date: Mon, 19 Dec 2022 16:30:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v5 01/10] spi: mtk-snfi: Change default page format to
 setup default setting
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221219024019.31974-1-xiangsheng.hou@mediatek.com>
 <20221219024019.31974-2-xiangsheng.hou@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221219024019.31974-2-xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_073042_646938_36DE420B 
X-CRM114-Status: GOOD (  17.03  )
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

Thanks for your patch! There is something to improve please see below.

On 19/12/2022 03:40, Xiangsheng Hou wrote:
> Change default page format to setup default setting since the sector
> size 1024 on MT7986 will lead to probe fail.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> ---
>   drivers/spi/spi-mtk-snfi.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
> index fa8412ba20e2..719fc6f53ab1 100644
> --- a/drivers/spi/spi-mtk-snfi.c
> +++ b/drivers/spi/spi-mtk-snfi.c
> @@ -1430,8 +1430,7 @@ static int mtk_snand_probe(struct platform_device *pdev)
>   
>   	// setup an initial page format for ops matching page_cache_op template
>   	// before ECC is called.
> -	ret = mtk_snand_setup_pagefmt(ms, ms->caps->sector_size,
> -				      ms->caps->spare_sizes[0]);
> +	ret = mtk_snand_setup_pagefmt(ms, SZ_2K, SZ_64);

Couldn't you just set sector_size in mt7986_snand_caps?

Regards,
Matthias


>   	if (ret) {
>   		dev_err(ms->dev, "failed to set initial page format\n");
>   		goto disable_clk;

