Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFC9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 17:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdvReJcIzWW0RcTLI14TC+/syozQBFMks4W/RQ76REI=; b=JTvUgAE7qLGqLM
	JS2XFV1fzvkoHb4cVsrCVeW6fi1lknKTva3/YuSbne36/g9uJ0m2J4r6Y+ew7MomrBWnwd8cV8Xsh
	lSjU5wxt8uHQHcmwa0dLkqUgUfFz7RYAX/DxtyibT26XKCIIPi9OrJKsG73Vj7Z/uq7UQM+UpT5i3
	obUfJBQFdcZUzXGDjY8Qx+TrJBx8NsOMJt1IRU6b5Z7jXu14UvrXmRFY3jjdSLUtIqYirmRPwWEdq
	7DL924isolRIf9KtkaVarVKxj+ooo4m4Jh2y4CO5Js1TliJ4ssmST+relGjaPkaeFAr+2Q5jrMD1D
	xnXyyn8Mu8/uukCFVOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n05Tk-00AzVT-HR; Wed, 22 Dec 2021 17:32:40 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n05Th-00AzUO-9h; Wed, 22 Dec 2021 17:32:38 +0000
Received: by mail-qt1-f178.google.com with SMTP id q14so2562769qtx.10;
 Wed, 22 Dec 2021 09:32:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rnVSRUWvGi3hc/dun7RSLrJGOUbv/6Fcvs2Ge1f+9VI=;
 b=eeLptx4YOLYfgQgsL4znJlL6tQrd2zMqeu4lcLsf+EYUeOZhpmchtzgvXVZVsMw/B/
 CXHIpoXDXwV5468a0AOGqgmM4RPP4wCMOyxDd5W6pThbwHapDt1maokZZRzNyJ6HvdgS
 zKM0freJ5ME6fianJlheEXkWcs2B+JIrGEM99bqVlHpRl8jFI6EMPYyCckZZPVsEoX7B
 IDwMLkBFEuf0y9L0zwu4waAddhulNGP3P2LkevzMlZH1LyzpTFxVQgWhFrYVU63egmkF
 BuUfp/mmOlY7Ay7JRth/N0K7YezT5k/ZWMG2YtmaBQkFlIQoHlPa68A5GcXmbg29MIwC
 sLgQ==
X-Gm-Message-State: AOAM533HfkMU8wxbvjC73aVfXsobsrg0rDm0scNvgCrjrCK4grEvwx1i
 50rRx3LCceRUYzsjBEriLw==
X-Google-Smtp-Source: ABdhPJwWKZzfhNl0pedugmMBWdSFfwQ5oN+9pK3tDg+VA+OSbTZIeuMNMms1VONr7sG3iC9fD4X/wQ==
X-Received: by 2002:ac8:7009:: with SMTP id x9mr2966783qtm.420.1640194356037; 
 Wed, 22 Dec 2021 09:32:36 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id ay32sm2271901qkb.63.2021.12.22.09.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 09:32:35 -0800 (PST)
Received: (nullmailer pid 2371335 invoked by uid 1000);
 Wed, 22 Dec 2021 17:32:33 -0000
Date: Wed, 22 Dec 2021 13:32:33 -0400
From: Rob Herring <robh@kernel.org>
To: Maxim Kutnij <gtk3@inbox.ru>
Cc: linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] This adds a DT binding documentation for the MT6582
 SoC
Message-ID: <YcNhMdN6rzh9yRG1@robh.at.kernel.org>
References: <20211219183134.3849-1-gtk3@inbox.ru>
 <20211219183134.3849-3-gtk3@inbox.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211219183134.3849-3-gtk3@inbox.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_093237_384464_B4D53A4F 
X-CRM114-Status: GOOD (  18.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Dec 19, 2021 at 11:31:34PM +0500, Maxim Kutnij wrote:
> This adds a DT binding documentation for the MT6582 SoC.

Please follow the convention used for other commits of these files in 
the subject:

dt-bindings: mediatek: ...

(That's true for all commits in the kernel)

> 
> Signed-off-by: Maxim Kutnij <gtk3@inbox.ru>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml           | 4 ++++
>  .../devicetree/bindings/timer/mediatek,mtk-timer.txt          | 1 +
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt        | 1 +
>  3 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 0fa55497b96..fedce0d0f3f 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -26,6 +26,10 @@ properties:
>            - enum:
>                - mediatek,mt2712-evb
>            - const: mediatek,mt2712
> +      - items:
> +          - enum:
> +              - prestigio,pmt5008-3g
> +          - const: mediatek,mt6582
>        - items:
>            - enum:
>                - mediatek,mt6580-evbp1
> diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> index e5c57d6e018..62acdb11aff 100644
> --- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> +++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
> @@ -11,6 +11,7 @@ Required properties:
>  - compatible should contain:
>  	For those SoCs that use GPT
>  	* "mediatek,mt2701-timer" for MT2701 compatible timers (GPT)
> +	* "mediatek,mt6582-timer" for MT6582 compatible timers (GPT)
>  	* "mediatek,mt6580-timer" for MT6580 compatible timers (GPT)
>  	* "mediatek,mt6589-timer" for MT6589 compatible timers (GPT)
>  	* "mediatek,mt7623-timer" for MT7623 compatible timers (GPT)
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 0114871f887..a97418c74f6 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -8,6 +8,7 @@ Required properties:
>  - compatible should contain:
>  	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
>  	"mediatek,mt2712-wdt": for MT2712
> +	"mediatek,mt6582-wdt", "mediatek,mt6589-wdt": for MT6582
>  	"mediatek,mt6589-wdt": for MT6589
>  	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
>  	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> -- 
> 2.34.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
