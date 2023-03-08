Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3673DC64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 21:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktsS6gvJqIlBbC8B6VrYT4e0IFcYp23M4iEhHPG47pM=; b=hVJHamyg9kzTRb5YTfAMslARxh
	g1XCbJ5SGVMjMK1Avum+jJ6/gpiD+IytdXssp4LCSHcFVM4bqdhl0JpgGWBxFz1hWafhwiI48ZFeE
	lY3URY5AiRG31k05liDlUUzdohVSWJBntTHlzwFnNdT4KGVISdoECzS6XLR0NLmi/0vaPiHy9t0qD
	/RM/0h+6n6H2xDVsBEOPw6cryZgoGuZWqJ/UqhowKlIjYHf/2vFHCpn1yPqAfhVToqbtzPFKnght1
	tMvPk/Toy1gdwOVszyIvbAka8xOivgLT/UGPGP5255kP0rj8NjoO/hbo9iz0XzrxmeBypAqldXxQJ
	OiL+gGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa180-006moA-UZ; Wed, 08 Mar 2023 21:15:16 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa17y-006mnR-4l; Wed, 08 Mar 2023 21:15:15 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-17671fb717cso143706fac.8;
        Wed, 08 Mar 2023 13:15:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678310112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktsS6gvJqIlBbC8B6VrYT4e0IFcYp23M4iEhHPG47pM=;
        b=TYzGhpXnh62wD1eXIWzGgVcRALK1FHGhUG9ni7yFfvX/5O3EGsTtyzUt/rAffxVqwA
         P01x97SrUVeCBv/qJq/WME3Jj0jZrIw34F7ml804jyDCFD+eY9TDMcTPP/ES1iGo35vb
         sTvGR7S4wl7MJKpUO8Jtlwq8YVL5LV73SBTQkqPe2MlVZ22M+q8yjppj54OytVBZVDYc
         t67c2vdjlQmnjyslTudDFPM15kq7M4fggdsEOLTVMWiuyDD7A7TmI2ejUiR4eitBXRVK
         WrsmVt3U4jeUtWyIAk8SrCqA7nULQZMObnO8/aYqnMLirWolohrzHd80/R7w/rZI/ElI
         HxlA==
X-Gm-Message-State: AO0yUKW43+X657i4Md4fe4J9FNlvLgYntD9blvNdov/TmBP0tAogb5n0
	dEWtA4ovvljeMuFtgMsTew==
X-Google-Smtp-Source: AK7set/guA8UuoeQpBiEWi5vzQStpahL+/DESR5U58DYCblv1tHuiS1b18dlELOYLHyJLaxszohlbg==
X-Received: by 2002:a05:6870:1602:b0:16d:ccea:3ea0 with SMTP id b2-20020a056870160200b0016dccea3ea0mr12616079oae.0.1678310112649;
        Wed, 08 Mar 2023 13:15:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e21-20020a056870c35500b0016e8726f0d4sm6616083oak.3.2023.03.08.13.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:15:12 -0800 (PST)
Received: (nullmailer pid 3855515 invoked by uid 1000);
	Wed, 08 Mar 2023 21:15:11 -0000
Date: Wed, 8 Mar 2023 15:15:11 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH 17/20] dt-bindings: pinctrl: mediatek: mt7986: fix
 patternProperties regex
Message-ID: <20230308211511.GA3850618-robh@kernel.org>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
 <20230303002850.51858-18-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230303002850.51858-18-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_131514_208218_9B78EBCE 
X-CRM114-Status: GOOD (  14.91  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 03, 2023 at 03:28:46AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Set second level patternProperties to '^.*mux.*$' and '^.*conf.*$' on
> mediatek,mt7986-pinctrl.yaml.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> index 46b7228920ed..e937881210c5 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> @@ -72,7 +72,7 @@ patternProperties:
>      additionalProperties: false
>  
>      patternProperties:
> -      '.*mux.*':
> +      '^.*mux.*$':

These are equivalent (so is just 'mux', but that's ambiguous). Why are 
we changing them? Ideally, we'd only have a wildcard on one end.

>          type: object
>          additionalProperties: false
>          description: |
> @@ -256,7 +256,7 @@ patternProperties:
>                    items:
>                      enum: [wf_2g, wf_5g, wf_dbdc]
>                    maxItems: 3
> -      '.*conf.*':
> +      '^.*conf.*$':
>          type: object
>          additionalProperties: false
>          description:
> -- 
> 2.37.2
> 

