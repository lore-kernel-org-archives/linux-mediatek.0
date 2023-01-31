Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F0EC38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 16:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocvFu8bY6yVyMnTFTmW4VNxSdgQzFoQqdQVplWxIToI=; b=WkOg2OOHS5bYy68S2if4llFAbD
	RpUN3Y/uXIVJWB4xC1WL0q8VjSynuIck4grU8TODKn1OnvVwX5hpAOZrwmKdzsdKhnfWRbYe5X+G0
	ysoqqY1QsSqqc69Y2nGXbBQnLqSw/xXFfOYzmXnYbV1wyRDwY4gDtnG+CZqbMEHN16uTFxyl92KVL
	fprwOoJqHuzt2X0SHoiTfrDUguObUv74ri6gDtB0BNwuxegc7pnQ1SZhG2XsQi+dxh+PAj4O6fXh7
	/YY8A1c4i6qUqrMUhg0EhVkgVNeB9TgYAZkOg4C77thcQwBvEBcIUHFlkpn/Lz36KaqeYwGO3mb16
	J8a6HYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMtnD-008kUB-8g; Tue, 31 Jan 2023 16:47:35 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMtn2-008kPJ-1H; Tue, 31 Jan 2023 16:47:25 +0000
Received: by mail-ot1-x32e.google.com with SMTP id n25-20020a9d7119000000b0068bd8c1e836so1377705otj.3;
        Tue, 31 Jan 2023 08:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ocvFu8bY6yVyMnTFTmW4VNxSdgQzFoQqdQVplWxIToI=;
        b=KPvdMbaCbzTt1996PdkhalzCn32qnfE/+x6iWKqOtAr86WLL7UGnp+xik3NEXPjST5
         2KcIVy+uq5R79zpJnBjXbVhGG3lmka9T3E04QHapx6PY8fsRWzRSHO2qX5YAAyltrwFj
         DaVaKed+xErvZiYv/F45ZvEE7q4e8APev0bb/5+JFdM2qPQrFUwrEEEQWbYYbofVz0or
         bHwLQSTHir2VcHS+c5GERmesFhf+5bFP3HyTBYQ5poP+b2XiyxnCs6ENpyw9wrqmsXZe
         DbFGmIiLRmh8JVzfgkYZ8ynf0XBhlZZeflUtDkf/dxdDMR2X5QM+Ewq4dz29Rd5WvXwa
         /48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocvFu8bY6yVyMnTFTmW4VNxSdgQzFoQqdQVplWxIToI=;
        b=3ZG5z7+VvHr6kVzkYqmThWrw9zao8M2LMymqS3TiLMsqvrDH3HhnvCcB9SZ/Jq5vpi
         0PzY5L2NzF4Ilmf/5lkX27Kp4QdlTbZmbIGN5Nn3t+o25kL7gVdcGFSvKONmrTdSZ4Z3
         x1xz/0qt62Rmn/8oflN4cEpY5l/PYK1Pu36zMvsIQ95t9Bu0MzuP/RvZ77kxmLyoLufg
         uqMeaYEzXJXO8brjTTOduhBl9t6CaeAGqqh4vQ/aD7GBaS5qZnwK7xbP0SoaiRoZkOz1
         nXeoR2GcfLSPhmgjMndttjDpXXQqo8oegIvQlcmTaavwM0U4jBZvwogefLQ6TNPJ7NUa
         Rl8w==
X-Gm-Message-State: AO0yUKVwl9WzjG5K/p0PW8mwiSl9XvMGHnZMOrHIOpHHJ1jKAx/aU7gl
	EA4UfNzWlgS5N5tEdkCcWkg=
X-Google-Smtp-Source: AK7set/ZY4mTvooxBqD3WOeWuTHhOB53Df1V/jE4+7aw+J59Tn5gh1ghMARazQlh+2Jka9hjBOGf1g==
X-Received: by 2002:a9d:2e2:0:b0:68b:9e3b:3758 with SMTP id 89-20020a9d02e2000000b0068b9e3b3758mr7953734otl.9.1675183640063;
        Tue, 31 Jan 2023 08:47:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s10-20020a9d58ca000000b006865223e532sm781368oth.51.2023.01.31.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 08:47:19 -0800 (PST)
Date: Tue, 31 Jan 2023 08:47:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: watchdog: mtk-wdt: Add
 reset-by-toprgu support
Message-ID: <20230131164717.GA3596213@roeck-us.net>
References: <20230117014023.2993-1-allen-kh.cheng@mediatek.com>
 <20230117014023.2993-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117014023.2993-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_084724_090923_53393BE9 
X-CRM114-Status: GOOD (  15.53  )
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

On Tue, Jan 17, 2023 at 09:40:22AM +0800, Allen-KH Cheng wrote:
> In some applications, the mtk-wdt requires the TOPRGU (Top Reset
> Generation Unit) to reset timer after system resets. Add optional
> mediatek,reset-by-toprgu property to enable it.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index b3605608410c..55b34461df1b 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -52,6 +52,12 @@ properties:
>      description: Disable sending output reset signal
>      type: boolean
>  
> +  mediatek,reset-by-toprgu:
> +    description: The Top Reset Generation Unit (TOPRGU) generates reset signals
> +      and distributes them to each IP. If present, the watchdog timer will be
> +      reset by TOPRGU once system resets.
> +    type: boolean
> +
>    '#reset-cells':
>      const: 1
>  

