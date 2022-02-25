Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3203CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 19:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dHw56YIHQVvChN6o4lTl+IVorS8iWwFh0HR6F/Oa80=; b=2W0UMKjVUt9hqi
	eTv4P/z3uSwBw0cuKpL4XiN0LsfL2eZ20yQg8cqwKzZpTyRHAdTVK1AgYWzQzHbRXK2IaiuJQjPZU
	h1HhnPSSG0WFpBXYWMA6ZE+eQ6nx309cmhas366quJZ7aORfHjM2wWGfOkdvNmW3jXPIUF08Z4353
	jebaCAOKLJb5zUCIoXaeIjwQqdoSX2xx8hzVDzoN4PurbikvAjmYbkdxvng8BDoikS/W+RZnmZp0D
	7VdkGf7GMEOSA4kOAN7Lt0v+eGvAO1UYNcP2Bj21SnKU3eIk+B9TTFyOpbpS4jr3pD64N62OZ2Bhs
	2D0gruO+it83qYmzWCJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNfsq-006jFR-Ur; Fri, 25 Feb 2022 19:04:04 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNfsY-006jA7-Pd; Fri, 25 Feb 2022 19:03:48 +0000
Received: by mail-oo1-f54.google.com with SMTP id
 p206-20020a4a2fd7000000b0031bfec11983so7464455oop.13; 
 Fri, 25 Feb 2022 11:03:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W0Val0Ukv5fc/tGMu5TCj12Uoxf42dXInoyYE17+MPc=;
 b=Xg8XZXU/d7KMBfESngKLdWwcf5UtBhtr2CAo1C75/PsWTjARF5OdrTkTIse+En3qEt
 uGDKtO2V6HkZ87Slr5gcuW3bFHCyp3/Asi348OeDldbwBSaIq5iEcvHuqLGj1dd6ZynZ
 GjqgK+oBoKCCyXdcDfzQAfQVXb24Wpfi+wYVfBr+1620U/liWGrqFdzSYDhPJZEIn1ba
 DiXdX//d/BNZE1loQlKJwAqurTGErQ3aFjAySV2vUem5Oq4sPwc2C294sCfaAfr4crWv
 FkiWTT/iRtcEJEw4hfwpoUsGF+H1TlICbhOwGm4uc44f/C9Vr61IxCRi+XKQDXi93RRf
 KujQ==
X-Gm-Message-State: AOAM531VEJ9pj+7Eawkh6u9tFaFhPrtmfDmClcyJNtcA0ODM0H7MqEYu
 O76XlgH0Rmi8Wm4L7Dlfbw==
X-Google-Smtp-Source: ABdhPJybIyDkpZ+VSbdLMj5yQB/PISufEfhnfVZJOC1EGYTqNwHN37uTAm7DrRhyXdvzgCvwBXnpjw==
X-Received: by 2002:a05:6870:ed48:b0:d2:40f0:1c02 with SMTP id
 ex8-20020a056870ed4800b000d240f01c02mr2018986oab.45.1645815826146; 
 Fri, 25 Feb 2022 11:03:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 e7-20020a056830200700b005a09222e268sm1539747otp.7.2022.02.25.11.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 11:03:45 -0800 (PST)
Received: (nullmailer pid 1255800 invoked by uid 1000);
 Fri, 25 Feb 2022 19:03:44 -0000
Date: Fri, 25 Feb 2022 13:03:44 -0600
From: Rob Herring <robh@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH V2 5/6] dt-bindings: spi: support spi-hclk
Message-ID: <YhkoEJiLMs8jfUAm@robh.at.kernel.org>
References: <20220221040717.3729-1-leilk.liu@mediatek.com>
 <20220221040717.3729-6-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221040717.3729-6-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_110346_854496_0A5BAA88 
X-CRM114-Status: GOOD (  16.45  )
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

On Mon, Feb 21, 2022 at 12:07:16PM +0800, Leilk Liu wrote:
> this patch support spi-hclk.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index 241c0f5880d3..6920ced5451e 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -55,12 +55,14 @@ properties:
>        - description: clock used for the parent clock
>        - description: clock used for the muxes clock
>        - description: clock used for the clock gate
> +      - description: clock used for the AHB bus, this clock is optional

Not optional unless you have minItems.

>  
>    clock-names:

       minItems: 3


>      items:
>        - const: parent-clk
>        - const: sel-clk
>        - const: spi-clk
> +      - const: spi-hclk
>  
>    mediatek,pad-select:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
