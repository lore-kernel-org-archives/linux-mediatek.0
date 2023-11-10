Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9AFAC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 21:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OReAG/NBqEVFLwZGkLlqa+2uqckd3cbd5xDGpNykLUc=; b=Z6XLr0RlEd3IhzSuhcbHGVPxbl
	FeiH6vDcM0Jx3+dG2GUFqVpTWndgoAsuFvu3bP96AopvHREwZ6gC0pyeTH6PSSDdqri/RuJj2eLqQ
	ELnpaR/xZPrtXNRh7VUZLDCTgvk9WO4aRLrFeUER2nyTxD8HkJn1vJJzHukfEJTKWyz6/4I//wud6
	8oeFThz0UkvYLZTa6S4CZ6eCHp3jVMzIIwYAeD0ALkFLzIdw2513AjuOIiwHFkmDxoFgfhFqs9vLX
	wnwWjXrK9MBgwOA7HEkSllcNgfND1Z6Qexr6Wb13F4cr1Ev8Df4XrrGSI2OzUNKxwNOuhrwrX5wBd
	YapFoHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1YgL-009RnT-1u;
	Fri, 10 Nov 2023 21:04:49 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1YgI-009Rmr-15;
	Fri, 10 Nov 2023 21:04:47 +0000
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1f066fc2a28so1307269fac.0;
        Fri, 10 Nov 2023 13:04:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699650285; x=1700255085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OReAG/NBqEVFLwZGkLlqa+2uqckd3cbd5xDGpNykLUc=;
        b=FTcn+Xp+S2Q5GZ0ZuNbIi1I5YWNu/3Ubuvcty8qRbRkwBn/jniaqEFQw5qkrfoMHiG
         N7s28osJsYqscYbAhf4mw1e3JM2UFyJEnLWqbVEtha76+hYv5Ikh1cHGSkiMyeYZ9Xbc
         WGVtKMdHrgUFsNzo/gtL62OTghuOOFo/wQuit4bPT+LwPP7FZAbAyq8kW2C3420rPuQt
         /jDBJlcCY3PELosltYcXqz4Fvs9DGNdUI2ExpfWmWC1Y9IJpf/TbKfZqZ+EaTVl8pnBl
         WCiTVhZ1p8eSJb137VG+nL63n1cWbth30nO2/Q/fZmLDx5PR4ZgPFoobkotIsixTcSDD
         +JpA==
X-Gm-Message-State: AOJu0YxxfDi+6ZykaY+9l/5O4rm077sjWfo1Y+3of4kG6s6w7Zg2RYOD
	h9JXtl52BC68ycSw34xYDA==
X-Google-Smtp-Source: AGHT+IFiqy2OZ3nIDTm6Fa8CJvyvr/Lh1xdBTB5opdpha0WN/3K5zzZBM9is72GKFetK8Yo/bFgGqg==
X-Received: by 2002:a05:6870:2dc6:b0:1c8:c27f:7d9b with SMTP id op6-20020a0568702dc600b001c8c27f7d9bmr406200oab.27.1699650285305;
        Fri, 10 Nov 2023 13:04:45 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v13-20020a05683011cd00b006d2e04a55e8sm55062otq.14.2023.11.10.13.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 13:04:44 -0800 (PST)
Received: (nullmailer pid 431470 invoked by uid 1000);
	Fri, 10 Nov 2023 21:04:43 -0000
Date: Fri, 10 Nov 2023 15:04:43 -0600
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, keescook@chromium.org, petr.tesarik.ext@huawei.com, rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [RFC PATCH v2 6/7] dt-bindings: arm: mediatek: Remove SKU
 specific compatibles for Google Krane
Message-ID: <20231110210443.GA419831-robh@kernel.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
 <20231109100606.1245545-7-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109100606.1245545-7-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_130446_395755_17599791 
X-CRM114-Status: GOOD (  19.83  )
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

On Thu, Nov 09, 2023 at 06:06:03PM +0800, Chen-Yu Tsai wrote:
> In cases where the same Chromebook model is manufactured with different
> components (MIPI DSI panels, MIPI CSI camera sensors, or trackpad /
> touchscreens with conflicting addresses), a different SKU ID is
> allocated to each specific combination. This SKU ID is exported by the
> bootloader into the device tree, and can be used to "discover" which
> combination is present on the current machine. Thus we no longer have
> to specify separate compatible strings for each of them.

You just broke an existing kernel with a new DT having this change.

Just because you come up with a new way to do things, doesn't mean you 
can remove the old way.

> 
> Remove the SKU specific compatible strings for Google Krane.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index a4541855a838..ef3dfb286814 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -186,9 +186,6 @@ properties:
>            - const: mediatek,mt8183
>        - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
>          items:
> -          - enum:
> -              - google,krane-sku0
> -              - google,krane-sku176
>            - const: google,krane
>            - const: mediatek,mt8183
>        - description: Google Willow (Acer Chromebook 311 C722/C722T)
> -- 
> 2.42.0.869.gea05f2083d-goog
> 

