Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0BDC77B7D
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Apr 2023 15:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4x2UJbvA5jImCs/m0TE0mCVt0AeoRniWoSCs1UrDqo=; b=lDRI9XCiD37anJbaBoaGDPaoMa
	SKvbYH3a5qvcn+h7iGHV3WozfzE0NFbw0hBjhOET3o4ioXDxBxp9nxRTrpbId6gS1+2aMYgfHdxdw
	Y5nm6lbzTKwOuMKmRO3nkDfiuXKTI16RAEsleXe2CJ1f355P5sMPEPxJnIDjoFJ+p6gO6fib7qagi
	1EWBVG9Las4paIzyygmVuwsU7UwVNZCfnR8aEoL8dtLlteGpPCy4BX9xM/OsxpQENg3ITcTh/HsdJ
	NHesWREsuwpzB4XHbU85dalybA2RMxAQRAdP+HhzNzextH2pa3PmoeDm3yfl6fHa53rIVuNebeb6V
	26d97X4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1po4gM-00E3Ir-0m;
	Sun, 16 Apr 2023 15:52:50 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1po4gJ-00E3IH-0a;
	Sun, 16 Apr 2023 15:52:48 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-760f5070ccfso10193639f.2;
        Sun, 16 Apr 2023 08:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681660364; x=1684252364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4x2UJbvA5jImCs/m0TE0mCVt0AeoRniWoSCs1UrDqo=;
        b=ScGUjRJTU56vQ6XAjspmGfU+EZ2wfDnMHBldx/bQuYz1s7xiP1bp1v93edwVkoa60U
         cg+zNaSACeqDSzKBiQNMOTsBhYR7ZCHWZEIdY93KbDg5wo2iihTXLErzrhP/T+Lk+eH7
         AmUjc4a/tj/Ljju0pNP+QklD32B2XC+2U1rn8AB4WH7bMGRDIBZpzcBr4U3c6YY3d/jE
         S0s6rJPf563CL7O417OkJXkrgLgtmSkC5KCfB+uYbtxZz7OO1+CYjd5D8DZqWOSbLfpD
         /VqPF/FNyTTMU5SXRVYvL42ZRy5leAXJsNUedhihIEmbcdH0sXJ/jIpQ8maDNPAVyTEg
         UdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681660364; x=1684252364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4x2UJbvA5jImCs/m0TE0mCVt0AeoRniWoSCs1UrDqo=;
        b=hPJLELpc2W+K3Iqpk/kSYhamGkOfDZ40Wr9OCeau5/R8OXxB0GgIuHA6sDjRgxALSD
         O9t4Q41A6Vl73DOZf7RtcF8EY9aox5rWC02nbj7WT/yIjkWGW3a+jj2kUHObrDsRlpXi
         HWIA7hZnrsLNP0K6raWU17+3YYGKD38VxxnM9l+WxrRFMQwlgMYMbwyclixlaQQyMCuB
         FPaMDfkAQksitU1iXttpMM1Sjtz6q1IBLM8gx02PbxoRjCprQNYgdYc/LpOi1R984vzD
         dz2hFNGichBasq/yq1aS/y8yZyFTSkXrcOUl4Uker64gnkIp8YiaWWqlAPyUEPqaogSx
         9zIQ==
X-Gm-Message-State: AAQBX9etB4cUcr+toICQSxErt2duwnAULcHifvQk6i29/6rBWTvp6glU
	QxuGuWDdHI7rDVMs7G7KD1U=
X-Google-Smtp-Source: AKy350a2fmmqdnZl4mg3g2vqLIdSX8pwTBimS6MtogYV0JnSjs8ic62o+L+RAxzAJTi2ddB3s/jTyw==
X-Received: by 2002:a92:d48f:0:b0:318:d56e:9efa with SMTP id p15-20020a92d48f000000b00318d56e9efamr7990945ilg.24.1681660363979;
        Sun, 16 Apr 2023 08:52:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l13-20020a02664d000000b0040bbcee6b57sm2543288jaf.133.2023.04.16.08.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 08:52:43 -0700 (PDT)
Date: Sun, 16 Apr 2023 08:52:42 -0700
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
Subject: Re: [PATCH v3 01/17] dt-bindings: watchdog: mediatek,mtk-wdt: add
 mt8365
Message-ID: <50a598a4-016b-4f2a-9d7e-19707d612238@roeck-us.net>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-1-0003e80e0095@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203-evk-board-support-v3-1-0003e80e0095@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_085247_220287_637B7455 
X-CRM114-Status: GOOD (  13.43  )
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

On Wed, Mar 29, 2023 at 10:54:22AM +0200, Alexandre Mergnat wrote:
> Add binding description for mediatek,mt8365-wdt
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

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

