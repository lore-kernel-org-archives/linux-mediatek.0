Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224AEC07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 20:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3qsgjZUiGkI+HnQU8qd10Dy5+V7e3QdrB1P5/64d/0=; b=hglvbtlQFm/pd73lMJPQxM7UQ6
	shKBWv6u+Y1bnUbxqqDem46DWplw3JV1f1oNOeHvSfP9n7IcD5xnDhdoy0oeCYcouOIG1EOZoQtuf
	F0bWgeMdM4Mlj1wQJ0DSwtQXo+4efRG3HGT8P3gw6tL1s2d5wMxMjZ5/TjxteR3VZ+Fy/sHYXrFIY
	anrTPDPxFTcWQvJM15ZS7Sf4+sTXBfVKa9pC/CB7PAvfPLde/WDW7c3hsumKtf06x26S2akP4NnFl
	uS3TQ9KFRE6AHLKmNSqBWlVYwW7ev7e//A2nbtkqZ1eGFTR7Rhj/Trmk8GsGYQd6cALyzHdFANL51
	qXadt/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvO2f-00Aou5-0L;
	Tue, 24 Oct 2023 20:30:21 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvO2b-00AotE-1A;
	Tue, 24 Oct 2023 20:30:18 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1dceb2b8823so86584fac.1;
        Tue, 24 Oct 2023 13:30:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698179412; x=1698784212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3qsgjZUiGkI+HnQU8qd10Dy5+V7e3QdrB1P5/64d/0=;
        b=WeAE4EsKAsIDwFCgFbkKvKLJue5MuutLd5kXyv1In2uK+UsESxQqmfywLlF9wQKlHh
         sxCzinfa7lizxba56Uw8lPqCkPpYibjo2RtgM8Xs5d8tFLF99K6VVzEmf9UeySng18oE
         bx3vxXaZDyme1wC7O8cgnePwmAIdY9kRxuxBVo7weH3hcKPzbO3lNiBKyurJekJA3x1G
         x69YqVlD3TPVncK5SxWrbZ9BzUSEtUB0g+xNthZSDpDftI/1Tk1S9DUMY4sjcnQkZgfC
         bqocAxlsnycv1UYV7sKoP/VVirzCSF4DkN8CoZW5VGnEh4e1Vi82mcstRLXmT8CU4F5x
         nGTA==
X-Gm-Message-State: AOJu0YyqmI+SqaSB+11ukrzLzjoTDk5EIazlchByrdMvH3ba1PAvI4rU
	STPGyjoObEAt0l9t+40DSA==
X-Google-Smtp-Source: AGHT+IE0whMUPrsoD9gh5o2IGz/Y8fxi2DnAYWxZTqLGtOQkx7r5SAEcn/I7BBShMQO37QiqQon48g==
X-Received: by 2002:a05:6870:e38e:b0:1e9:e413:b9d with SMTP id x14-20020a056870e38e00b001e9e4130b9dmr8879744oad.2.1698179412672;
        Tue, 24 Oct 2023 13:30:12 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j2-20020a056870530200b001e9b02b00e9sm2285355oan.22.2023.10.24.13.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 13:30:12 -0700 (PDT)
Received: (nullmailer pid 520032 invoked by uid 1000);
	Tue, 24 Oct 2023 20:30:10 -0000
Date: Tue, 24 Oct 2023 15:30:10 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 05/18] dt-bindings: display: mediatek: dsi: add binding
 for MT8365 SoC
Message-ID: <20231024203010.GA518520-robh@kernel.org>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-5-5c860ed5c33b@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v1-5-5c860ed5c33b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_133017_424296_ED783F61 
X-CRM114-Status: GOOD (  14.63  )
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

On Mon, Oct 23, 2023 at 04:40:05PM +0200, Alexandre Mergnat wrote:
> Display Serial Interface for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> index 12441b937684..2479b9e4abd2 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
> @@ -34,6 +34,8 @@ properties:
>            - enum:
>                - mediatek,mt6795-dsi
>            - const: mediatek,mt8173-dsi
> +              - mediatek,mt8365-dsi

Not valid YAML nor json-schema. Please test your series before sending.

> +          - const: mediatek,mt8183-dsi
>  
>    reg:
>      maxItems: 1
> 
> -- 
> 2.25.1
> 

