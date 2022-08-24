Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE25C3F6B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 19:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGbTiH5MlwiXaRbgDFTCR8WHSkMV+X8PO6SJOF3rCjU=; b=1Ot6QxhiQdZndotsD9TdOFi3Bo
	zEWadYCxEfiSD1XE31A91NxASMBmiS41Yz5N7sfaP7LSxe8vNoRTyF693KwCM75teTxKYEIqP0J8u
	DWb2tkcU3rcfug4dO7k5r1RAkJuopiNnhwvlPCnrMqMcwao+OaTgImJJENhWOv+01jWnswhH684oH
	znZ0Wfb27SnHeZZNM+OqbAxnWi5k5dFGCcbZjTm9DJQKKHnvKG2z9ZxnGV1YhW0hZ1vUW3rBSFoqT
	j7TupJBLGqSGT1p8mmGczv/6+UqBFEc/7V2D+LMClfORRRU04ueExEGl9hej2Q2WUqQIJNEeogKcS
	pDT6bLjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQwJB-00FzlH-U4; Wed, 24 Aug 2022 19:45:01 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQwJ8-00Fzgi-CA; Wed, 24 Aug 2022 19:44:59 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-11c4d7d4683so22161065fac.8;
        Wed, 24 Aug 2022 12:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=GGbTiH5MlwiXaRbgDFTCR8WHSkMV+X8PO6SJOF3rCjU=;
        b=NWqSJ/QyYUu/NiNQmY1desXf+osEs0WvVT2f5+ar7+G5psUFcouj0YL631sPmkykiV
         eC5XqyB6fTnk5IrphAaDJZeJEVjg9IkBmc+ho6NWLLrW7yL0b4iL5G8A7gN7A55PxA9K
         H9VWmBMKXjG3x0ErQi+weVNg6QKtTy/uydicADMN5X4WNr9S+fQVd5IeeTUe/dcjnvbO
         O6qG4U22aT7RhceKmmEADXpQLZRd9ibsWtuM1BopZyhr8ShMXU5itJWhZ3VHLFync5g9
         8HmCmiQ0YTk71NwD8BlN4lMeOE3TQGhu8CN/LnRpx34ZUSop/BlG3qlKnLp+TCWggYJr
         TBUQ==
X-Gm-Message-State: ACgBeo0OwhqhlZkfjT7D6Z6kgvj+fQXgEl4cSjZolwU1dRQ6Jzob/Ggf
	ReIUoQWjtlyw+JanZIi8SQ==
X-Google-Smtp-Source: AA6agR7g9enQ2VOPXxjiBBaQyiivB97fu0ajQpyomq4xaBUyjmklH9YO+Uml4yuCLV96TFgcFbgd0g==
X-Received: by 2002:a05:6870:f6a3:b0:11d:1ca9:ed55 with SMTP id el35-20020a056870f6a300b0011d1ca9ed55mr4500889oab.121.1661370296312;
        Wed, 24 Aug 2022 12:44:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p1-20020a544601000000b00344cc0c4606sm4284544oip.58.2022.08.24.12.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 12:44:55 -0700 (PDT)
Received: (nullmailer pid 2768602 invoked by uid 1000);
	Wed, 24 Aug 2022 19:44:54 -0000
Date: Wed, 24 Aug 2022 14:44:54 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v5 1/7] dt-bindings: net: dsa: mediatek,mt7530: make
 trivial changes
Message-ID: <20220824194454.GA2768100-robh@kernel.org>
References: <20220824104040.17527-1-arinc.unal@arinc9.com>
 <20220824104040.17527-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220824104040.17527-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_124458_449107_1A159FDB 
X-CRM114-Status: GOOD (  14.29  )
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
Cc: Sander Vanheule <sander@svanheule.net>, Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 24 Aug 2022 13:40:34 +0300, Arınç ÜNAL wrote:
> Make trivial changes on the binding.
> 
> - Update title to include MT7531 switch.
> - Add me as a maintainer. List maintainers in alphabetical order by first
> name.
> - Add description to compatible strings.
> - Stretch descriptions up to the 80 character limit.
> - Remove lists for single items.
> - Remove quotes from $ref: "dsa.yaml#".
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 39 +++++++++++--------
>  1 file changed, 23 insertions(+), 16 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.


