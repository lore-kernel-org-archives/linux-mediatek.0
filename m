Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966E0C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 16:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iR8CM1l7mSjgUX5ysimVK0uN3n/6IwTT58FYQEEeKZg=; b=wSvSYGYwRY9yg+z8X21o2GqEAl
	igx4iRYM+PhvkmOlQK+lUkHSqEwn+hWmlbuKbfv1DuswabwcDQhlf8I2iK8pVNWb2P5x/0ulF0Zxe
	qgf30x+KYnH7D3F3bUFmCB3PW2xxUuBJ4nsAEEEQBc7+KnVeAva5GMSA3GHbpL98tVWrc7DrMAB6j
	WWhJHz/MjyL6qI1kzbLD8D2pgWxHyqeNsKpJM//H3s8yx0I37hilV4Pxj4hNnDibvacjKbwhpMuYe
	qmzmkw9d1uM066SllMWyyGlzvc2UVqpEJmAyuDEEuRS5FTzLO2/19N+cyU9vuzKBdFwvHH02+5zUc
	fCOFleeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD62Y-00CIj6-10;
	Tue, 12 Dec 2023 16:55:26 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD62U-00CIhc-1v;
	Tue, 12 Dec 2023 16:55:23 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b9b90f8708so3895587b6e.2;
        Tue, 12 Dec 2023 08:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702400117; x=1703004917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iR8CM1l7mSjgUX5ysimVK0uN3n/6IwTT58FYQEEeKZg=;
        b=HjL43pynodM830H49cVTWQqjeTH0bVwsfnzablSm3SaGMBxPYjW/Gr+EB6Av4H6ndY
         rHVC6g+7zxUVgaAOyLSOYyH/M69GkogcNkEhz8UXTOSXi2LzxX35pLjYpkJkM48YrDUe
         eKaulmbKDYri2cr2w9W3KmmIl5wQyAthZa5eT1lGZLEYj27wIql5KWBpjw4BgG6Aw6gz
         4V3jtPWvx6di7tTyKwHGSAidVZ3z8yoO6PdR1ZiaVRxAXQlP0r/OURBkOr9K/cVkLBnC
         UrbbJKmszrBx2iUo2mOGWjjHOJKhqRqWYohVEKtGKmemOE81kD4KQEClRxNQR9ufyTFT
         F9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702400117; x=1703004917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iR8CM1l7mSjgUX5ysimVK0uN3n/6IwTT58FYQEEeKZg=;
        b=GclcGKnruX/mE3+iM78pNJCamUo6yLs4TvRtI40eRXq800G2xZPRjymuLOzipGyHD5
         Ap3b3QmNAlAx1W/eBU4Xm6YCCPGBSuHJaEexrYO7d/juXIH1w4ACvE1Dx3jr5qjPpAnf
         IKkrq2Z7uXGiBDzLL7W34UALfRuMnKWBuIyDcD/sDwm9T2ENC3DUHgR96nmyvtAo3PyJ
         2UaMy8epxr5AR5Du60HSBFo21BE1V0ALl7vlg4r/e9eG+OJfO5GfXA3GYA/sEIrzTcuf
         1OJbGL1sJXGwStpKZaLD/QQQj4Qys+D7Rq/MW7taI+z3H01QMRmwDGMiQUcRZ+jkLY7n
         No3Q==
X-Gm-Message-State: AOJu0YzBW/xmWzBdCTs05MT9gdY0odiB+ba2EZYMGYPkQmsnMqdT7SWq
	Xn9mzOttb/f9C4yQcPUK4oU=
X-Google-Smtp-Source: AGHT+IEx+wh7QtzF3FIi6gsB7OMnp5P8qxzEDYPpvY5u2XUrX1jUBOgX8clMwoVfj3aqq6UQzLghvw==
X-Received: by 2002:a05:6808:1492:b0:3b9:e317:ec55 with SMTP id e18-20020a056808149200b003b9e317ec55mr6844124oiw.44.1702400117042;
        Tue, 12 Dec 2023 08:55:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a23-20020a056808099700b003b9f6ecb222sm1936175oic.6.2023.12.12.08.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 08:55:16 -0800 (PST)
Date: Tue, 12 Dec 2023 08:55:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add
 MT7988 watchdog and toprgu
Message-ID: <17ece724-95d7-48d6-a95a-41c667df9fd7@roeck-us.net>
References: <e26a98fd0b7b7b431922405732275bac01eaf220.1699890006.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e26a98fd0b7b7b431922405732275bac01eaf220.1699890006.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_085522_636438_AB54A5E0 
X-CRM114-Status: GOOD (  15.16  )
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

On Mon, Nov 13, 2023 at 03:43:24PM +0000, Daniel Golle wrote:
> Add compatible mediatek,mt7988-wdt.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2: Drop adding include/dt-binding/mt7988-resets.h as that header is not
>     actually a binding header.
> 
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> index cc502838bc398..8d2520241e37f 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> @@ -25,6 +25,7 @@ properties:
>            - mediatek,mt6735-wdt
>            - mediatek,mt6795-wdt
>            - mediatek,mt7986-wdt
> +          - mediatek,mt7988-wdt
>            - mediatek,mt8183-wdt
>            - mediatek,mt8186-wdt
>            - mediatek,mt8188-wdt
> -- 
> 2.42.1

