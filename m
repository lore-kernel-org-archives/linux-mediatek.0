Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DBDC77B61
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Apr 2023 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=475k3G03c46QPyiaxfGPBy/K6bUcqTXt0A1kqbPfJrQ=; b=HCga67N34ebLeRY15eGx6UtfVw
	7y1Gj+yTlRWa1OJUN8ohKhc3dSuOqCEOhWvBUUY7YWvu2An0QTciP7z6RUCDNRGnVgLyWP+RFCtQ6
	V2XPODs01ZzmGkcgTJn0kvt3f+bcUpH4UlwSNg1H/Gv8EU7dq+bhgysR2kpwc3rbKhTycAeUzUlad
	aOXyeDwCYvb+eEQg49H08THGsFx9P9Fb7OYOtMQBRc9JAqBoC4hGcQ544TR2vlqxti8WFxaRHZWKv
	k2z5LhpLt/dnpjjLSCilaomfgVscjd/18M+0H7adOXIeo0trV7168ToZeWEWN4KA9V8UcPhzD3y2d
	49rV822A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po4bB-00E2hA-31;
	Sun, 16 Apr 2023 15:47:29 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po4b8-00E2g8-1c;
	Sun, 16 Apr 2023 15:47:27 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-32a62613a69so4700025ab.2;
        Sun, 16 Apr 2023 08:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681660044; x=1684252044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=475k3G03c46QPyiaxfGPBy/K6bUcqTXt0A1kqbPfJrQ=;
        b=QRcu8+d2+ACNA4wQ+1n+kyTE6ET4Dmpf3RebBLyuTpj9Vwy5kuABYUWs4kExn48Ns1
         aqkleZBSYA6B+QySAnae45XqmA+iylIHoMWArKNgQys9jjzpX/wcUc/9DuSGnWGQqV00
         PKaBxQx4oPWGlcILHCfEM9Krm5IOJsjz/0qRgED8NLccCrjjzfxsfHriJp2AvH7qqmXm
         C/1DPNM+OLDZctbLAqx809+9FgHu6/clZlt6wA9uxgUqawx6J05vicQ/7Pbt7EPElbCO
         wA7+H5YRpDrA3udh9qtw7dY7gyKsVs4IUROTnv1gVbMEZqeG0/4KPLCED7XiqNXwhvbH
         BJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681660044; x=1684252044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=475k3G03c46QPyiaxfGPBy/K6bUcqTXt0A1kqbPfJrQ=;
        b=Ei4EsziXlHDGRkr7Ys67e8LuBsqCyx7CEbPJAVCmCBPW9l+RNaY2k/xUTvbWeIlDLD
         YhFH8nlx+rFxkBbHQkjX5gVmJeWU0SsynzAMcJzy/VfOl/3QbvzA2E47rt05hzkr+9nr
         7kZx2sbaTGUt6XZKSwzsXLM8EzdFIs/v98vDQ1hsKJKnBmhh7hwbIKSsv3orlcV+YTUm
         ObX/0c8wRF5S0IKon4Qfl1VXMERuT7Ckmh01RHIJmNazr5MDwk/fSOzmbXwyG5bbQbzD
         aIBR1pzvJNXfZ3QtDfZSUOnF8Ia1psWYUQEYuZhI0O3/hQQqk56MaFDkQ9qJBnRMuqOU
         N8EQ==
X-Gm-Message-State: AAQBX9cA85WY1ecIrwyogf57tnNiAJGJXj8afsSrKZv2jmR8E5Bf35UT
	o75t3tKgPJR9xFcWP92IKQM=
X-Google-Smtp-Source: AKy350aiKvWziwxjnRlCjjjVuxGGl1XwZhqvK/dJAcHfLH23CksyCOFNBusPgWMemoZmy81VyyssvQ==
X-Received: by 2002:a92:dc50:0:b0:32a:93f5:fbd with SMTP id x16-20020a92dc50000000b0032a93f50fbdmr6050404ilq.27.1681660044687;
        Sun, 16 Apr 2023 08:47:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 7-20020a921307000000b0032732e7c25esm2571870ilt.36.2023.04.16.08.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 08:47:24 -0700 (PDT)
Date: Sun, 16 Apr 2023 08:47:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 03/12] dt-bindings: watchdog: mediatek,mtk-wdt: add
 mt8365
Message-ID: <05d07422-d53d-408b-972b-5937861afa63@roeck-us.net>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
 <20230203-evk-board-support-v5-3-1883c1b405ad@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203-evk-board-support-v5-3-1883c1b405ad@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_084726_566848_B8DBA249 
X-CRM114-Status: GOOD (  13.32  )
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

On Fri, Apr 07, 2023 at 02:59:22PM +0200, Alexandre Mergnat wrote:
> Add binding description for mediatek,mt8365-wdt
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index 55b34461df1b..66cacea8e47f 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -38,6 +38,7 @@ properties:
>                - mediatek,mt7623-wdt
>                - mediatek,mt7629-wdt
>                - mediatek,mt8173-wdt
> +              - mediatek,mt8365-wdt
>                - mediatek,mt8516-wdt
>            - const: mediatek,mt6589-wdt
>  

