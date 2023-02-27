Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F03BC64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 17:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oN8FxBckZtmYaMSZo87sPI384Nrsl3rmx9eLsbfMrE=; b=HPQDXkNFBmA6WJiIhiolobK2o4
	8olU3oqG4i9BQov7qVdRELdzpRI1Lyvkv3OAajerYPubDZi4gM4VvFX8HdOAf+YfQnp0Iz3Np1g36
	L2FYgFpFRROL64IdLjZUujDyep5Z9tBtcLYfrJuvACpHcSa/kbfG/YSya9jh92MQvgVodGbrv8kgO
	P11syVJ+OgyRun+NHluWDCZ/BUjGHGBssHIJ7gc8Hi6+9q4XNGtXuR6rPU0tAbHv/4REoH+O8ChVO
	Jsm/cZRFoR2XYPf6DMzrF4oDdBF4H8M/V6xnMFkDVbgBY069dUxFBxBsACv9SilxM/4jb2tlDd+lj
	VoyHHEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWhNe-00AUet-Gl; Mon, 27 Feb 2023 17:33:42 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWhNZ-00AUd4-5M; Mon, 27 Feb 2023 17:33:40 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1729bdcca99so8111538fac.12;
        Mon, 27 Feb 2023 09:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/oN8FxBckZtmYaMSZo87sPI384Nrsl3rmx9eLsbfMrE=;
        b=xujWnDiIeDhEg4Zxmf41m2KT2Dbv6kPptD/gTPWTfKrZv3xi3SLtURwoAUCNXM78Uu
         ocqZA/J6WxyTZYtSwwbq+Kz5oSGeAKGW24RPedqgJoK6kWm85gzJqmw8ff2YZeZFDPjK
         P6qLPyq3m/U1fxYC0v2P3bq4tmIRb1RQvK0YkxgLc3Q5aNwinSuqWqkQAcdoeu8WNz4e
         kirDyGCwSkJPI9J6HF+l7oZNauAIKacVK4ifbpQGIR5b/AkkRKlQlnvnpg/pTsonQ79Z
         7UZ/Q5Uazu1xq9xVIht6RdAuLGxwT0xoDW3VMF9lqHlI37/NM+SkMQWyzpweu+6g83ld
         FmlQ==
X-Gm-Message-State: AO0yUKUPMlHXAB+W80+uiNsPxoto2ujwMvHC/YsFmVS0tdsDSdmVware
	LxXbTtEeT9Z2HaVZoUZJyQ==
X-Google-Smtp-Source: AK7set9iB+Y2H2YVIxACw0NlHiSHBMwnkJWQVinPxVxj6RyNikXsn6AAahpz+oWM/OgaYUHPeqIz/w==
X-Received: by 2002:a05:6870:5387:b0:15b:8856:f0cb with SMTP id h7-20020a056870538700b0015b8856f0cbmr20100932oan.57.1677519214294;
        Mon, 27 Feb 2023 09:33:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w18-20020a4aded2000000b00525270c233asm2828098oou.39.2023.02.27.09.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 09:33:33 -0800 (PST)
Received: (nullmailer pid 504389 invoked by uid 1000);
	Mon, 27 Feb 2023 17:33:33 -0000
Date: Mon, 27 Feb 2023 11:33:33 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH 07/16] dt-bindings: pinctrl: ralink: add new
 compatible strings
Message-ID: <20230227173333.GA496999-robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-8-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230222183932.33267-8-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_093337_252144_C84FB64F 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-gpio@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 22, 2023 at 09:39:23PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Add the ralink,rt2880-pinmux compatible string. It had been removed from
> the driver which broke the ABI.
> 
> Add the mediatek compatible strings. Change the compatible string on the
> examples with the mediatek compatible strings.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml | 7 +++++--
>  .../devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml | 7 +++++--
>  .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml | 7 +++++--
>  .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml | 7 +++++--
>  .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml | 7 +++++--
>  5 files changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
> index 1e63ea34146a..531b5f616c3d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
> @@ -17,7 +17,10 @@ description:
>  
>  properties:
>    compatible:
> -    const: ralink,mt7620-pinctrl
> +    enum:
> +      - mediatek,mt7620-pinctrl
> +      - ralink,mt7620-pinctrl

We don't update compatible strings based on acquistions nor marketing 
whims. If you want to use 'mediatek' for new things, then fine.

Rob

