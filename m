Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED237C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 23:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50e1Whr1p5O5BfXr1b5aKvoRaix0X3o5rBbjLfH/hl0=; b=xhqCX8hIJDUYwuUggI7cl3eqXu
	D4ukDdV/aOUgcXvWeASQUAxGnJTCPaFYtWM2ryCEr+z18xXau9usMTHSS+TNR3DO9c47CvogCzKiq
	fJM2uAtafM704vSt/tKREwy4TFu6GSD2SPYpfoke7ltHGEWRqcXTGxPptaCqokY4KKZnPPecb0Y68
	6Af7an0GbLBXENlWxz+tgLJJEHlvqW+hoac/MvCobSpJE3lGoYVc4fgPsrwtKW6LvZKf1GEbF4qNF
	ffEShH/7rtQpOODPfxRYrt7RfJaUY2aEwYdNLNpFEqmYSsxnPmvW3Toy/0gfUg0uBaWz7DL/G8PdE
	Wjlv1ChA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPuAl-00HEmd-49; Wed, 08 Feb 2023 23:48:19 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPuAh-00HEjH-CH; Wed, 08 Feb 2023 23:48:16 +0000
Received: by mail-ot1-f50.google.com with SMTP id d21-20020a056830005500b0068bd2e0b25bso80471otp.1;
        Wed, 08 Feb 2023 15:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50e1Whr1p5O5BfXr1b5aKvoRaix0X3o5rBbjLfH/hl0=;
        b=lFMe20+sdhOapDfOlKl5RSxERuBkogaHPMkrvn3UKrjmrg6FBXNNOLokTl+UL+qwi3
         hT+Gq15rKnoRwdRKucFOQ/U2L9zO30XLbYoSWK9Jo421yupxpGls70zYi0JXW+PDxE9c
         A349wDZHTONi5RlgvK5YDSfRM6zb6HqliPoWXmlyhAiIHYfFtBE5Br88GLtIiFzd7N4S
         q7/dH5km6RKjG/yfASkr54S3t00xbZ+/qB8eM1gs/WmtXlUN573+3pIM6fmnt/fbAis1
         RISDCC5BEXtRRM5omgIJRye3kJxTFaEyComEVXjmawiDbrYpgjZGwlfnJjrYR1VIaoVC
         dMeA==
X-Gm-Message-State: AO0yUKXWIEn8b7C3nrxEf/jDcfYAnUeQttFL5VSzWuf754ZoQGIvfAy/
	wrmfUakmmezBGvvY25Eqpg==
X-Google-Smtp-Source: AK7set/MAs5BubHgfwo8YE/1H72/fOatEqJB6vH4FwLOvCDTyVaWJ99UtL9xSLK4cD2uvjP9j1qy6Q==
X-Received: by 2002:a05:6830:2008:b0:68b:d347:2457 with SMTP id e8-20020a056830200800b0068bd3472457mr4177424otp.21.1675900092263;
        Wed, 08 Feb 2023 15:48:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z3-20020a05683010c300b0068d542f630fsm8717770oto.76.2023.02.08.15.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 15:48:11 -0800 (PST)
Received: (nullmailer pid 2936796 invoked by uid 1000);
	Wed, 08 Feb 2023 23:48:10 -0000
Date: Wed, 8 Feb 2023 17:48:10 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH] dt-bindings: mt76: allow up to 4 interrupts for mt7986
Message-ID: <20230208234810.GA2935682-robh@kernel.org>
References: <20230207171512.35425-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207171512.35425-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_154815_462704_C0BF9FE2 
X-CRM114-Status: GOOD (  19.98  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 07, 2023 at 06:15:12PM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Mt7986 needs 4 interrupts which are already defined in mt7986a.dtsi.
> Update binding to reflect it
> 
> This fixes this error in dtbs_check (here only bpi-r3 example):
> 
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: wifi@18000000:
> interrupts: [[0, 213, 4], [0, 214, 4], [0, 215, 4], [0, 216, 4]] is too long
> 	From schema: Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: wifi@18000000:
> Unevaluated properties are not allowed ('interrupts' was unexpected)
> 	From schema: Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../devicetree/bindings/net/wireless/mediatek,mt76.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index 212508672979..222b657fe4ea 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -38,7 +38,10 @@ properties:
>        MT7986 should contain 3 regions consys, dcm, and sku, in this order.
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 4
> +    description:
> +      MT7986 should contain 4 items.

The schema and the description don't match.

You need to define what each interrupt is.

Rob

