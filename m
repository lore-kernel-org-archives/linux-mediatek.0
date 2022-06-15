Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50571C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 21:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZSDdV6mNRQiDJWSYS9igOAu0wbjoocy2kuoW1xZJug=; b=ESOJi6e1xYxOxf8xnAHen7PG+x
	RRrp4As3YL+Nlqwr+pjmOg53vi/A2zHeTR6RyRmKiY7oN+zN4w6RLNPhTJEgnrmRi4UsEqtl94CPn
	mBPT86ryWraX6JVOqZnkzCZSlzTU62Jt2eigLIE6c7r88uIEYOMFedHNBDe1MXbrmKpOmkWdI7rTt
	E8GCQVxCVwCY0xCM0E3TER3Q9+gM6Us1SuK0/E/sJ4za0hmfvRH+NZoTJzKe89TG17RshzuU1Knkp
	BJT6/m/7OQ9H2jAZtVN4YhvKw26Hek+xtMw93COYw8YReuPizl3dKzKSI+OfW5jMi9GDI/qkMdrWf
	jGyf9H1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1asY-00GWMl-ID; Wed, 15 Jun 2022 21:48:46 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1asP-00GWKL-Lo
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 21:48:39 +0000
Received: by mail-pg1-x532.google.com with SMTP id l4so11504872pgh.13
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 14:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=FZSDdV6mNRQiDJWSYS9igOAu0wbjoocy2kuoW1xZJug=;
        b=ZpEJrFA438ZSkfTtEVYExa6cnAWhsvmUfpjsXYhT3+RglSUp+BETn8FrcoVEUH1Xf3
         w89oj7m1+dvWYEBxZTzq8TOIK8k7osRT9F74IS6tONgVl/5eeyTXRDi4TNMcOvgrgGyK
         vtqC3QS4kuPYkPGwcJ41fbjaNm+v47aPMQA70fUDHFmvVcvy3Fq8Id2wO6YPLQhbfk+m
         ObQQZHAfWJStEW2KMHfeluBeHBzPldcOqfOXoL4LybCKsNNGImxL7J0tQj3XW1OJ/Cs7
         RYDFS/eBia5pw8WTh0ft13K/OGlBMrdMbKZ1B0ZXhfp2CZOsjSsA4O/eFJ6WV9w/PsIp
         2IyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=FZSDdV6mNRQiDJWSYS9igOAu0wbjoocy2kuoW1xZJug=;
        b=yq4obFZ55CuHpB1ZfKsYdNZjNnV0I1ZkvQnyq8a8H2JSACKjd7r5asMUpJq99sUoPq
         Yue2qqcsgjO2ocgNMnJYE2xbAQTrRe6knWQWO+1IOI2nKNqFpsDwkCh6xPaAPK06Ee0N
         1Co1B6iWL0lF5fTokGiZjhZnIsHBGS76tWfDknmSJBPi+l4vLKuQ5G1fma0OdnlPPg4U
         DpmvUHBaugT/GZuBSNpxGBTRCHNwLIyaoPbreM2JYP2Idcgyyxg0cO2KwTbCNCyclvpk
         40XfvoVW1f5gGr0lMyClpXUM0OAtWAAJoMqsw+GGFORJYvyciTW1vIbnTHMBPSNTq9kV
         tjMA==
X-Gm-Message-State: AJIora8b6llZg3d2/JPucSwqIJ2qa4t4Ms7pcTQ2EPPzpTThemK91BGx
	SMinnZKvuB9hlLkNj4/BsrPfUg==
X-Google-Smtp-Source: AGRyM1vkhWHhrlIjk/HHd51WfK5Or24gmvhP0SqUbOiKWv1kc7ZmeBlxTK44Ul6iywlD0zO883LPZg==
X-Received: by 2002:aa7:94a6:0:b0:51b:ddb8:1fcf with SMTP id a6-20020aa794a6000000b0051bddb81fcfmr1411308pfl.23.1655329714602;
        Wed, 15 Jun 2022 14:48:34 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id u1-20020a170903124100b00163f8ddf160sm97347plh.161.2022.06.15.14.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 14:48:34 -0700 (PDT)
Date: Wed, 15 Jun 2022 22:48:31 +0100
From: Lee Jones <lee.jones@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, johnson.wang@mediatek.com,
	hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: mt6397: Add compatibles for MT6331
 RTC and keys
Message-ID: <YqpTrwlXmXMYuDd0@google.com>
References: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
 <20220520124617.228808-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220520124617.228808-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_144837_744968_BA6BCEFD 
X-CRM114-Status: GOOD (  14.52  )
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

On Fri, 20 May 2022, AngeloGioacchino Del Regno wrote:

> MT6331 is a multifunction device, providing RTC, keys and more: add

No such thing as an MFD.  What does the data-sheet call it?

What "more"?

> the necessary compatibles to start implementing the basics.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> index d59063503b0d..2a9533c47365 100644
> --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> @@ -30,6 +30,7 @@ Optional subnodes:
>  - rtc
>  	Required properties: Should be one of follows
>  		- compatible: "mediatek,mt6323-rtc"
> +		- compatible: "mediatek,mt6331-rtc"
>  		- compatible: "mediatek,mt6358-rtc"
>  		- compatible: "mediatek,mt6397-rtc"
>  	For details, see ../rtc/rtc-mt6397.txt
> @@ -55,6 +56,7 @@ Optional subnodes:
>  - keys
>  	Required properties:
>  		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
> +			      or "mediatek,mt6331-keys"

Please place these in a vertical list.

>  	see ../input/mtk-pmic-keys.txt
>  
>  - power-controller

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

