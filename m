Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A126BC001DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 14:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdQr3rrizrMRhKoEmZUiV2af/wkAGf076hXpLFsw31g=; b=LgHSNm1Oq4rZ6lqqF56z+DQwHG
	CrwwNTEjMU5xA7x9kPcJ40TLaRg2I4ytl+jpqdqcjOH6GwZ/aLJRpbgoBwc74pMqps0/BsYmNqx5y
	cCz8lRQh6Xlgc8BybFCAfxeNJydEIOTVJZSPVKVXMqeY8Yu+L/vmVr0jEOD3sHVJdTKY2QKDIMg0H
	f8nzTaM5CjL66FJ7NK59F67uxoYcmTurL8OXvreKJ8LcxMxq8zrSruQ+vkLmDLTqnaRdz0i8n7z3S
	yZ6I4AsBA1w/Qb3lcfk33/s8z+Woj+neTm7k1LZkKTCLXInS+lHw3aXAsN0Uhi5Fot5gOMr2sK1yQ
	ppFsuT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYyC-00HO5e-1d;
	Mon, 14 Aug 2023 14:55:00 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYy9-00HO4A-27;
	Mon, 14 Aug 2023 14:54:58 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c1c66876aso587431866b.2;
        Mon, 14 Aug 2023 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692024896; x=1692629696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SdQr3rrizrMRhKoEmZUiV2af/wkAGf076hXpLFsw31g=;
        b=cJpN17+XMgDreKMySImUvNHZksbt4rB280CaUXDOttaJA280+H7xGnogrnAC3wkGYO
         Wx8q5yJltHuAYXHIq12XESM+AWMq2o+xK/N3+WFGjy1q5hj+V86Ag0wXspihkYcHdULk
         XNCiba2p7GCrfK2/a7khsCdUAQxFHo6qbWjcaJQ4oiBHSr+G4oHperJs0875V/l5wEIZ
         WX5/ZTizYDiFpmFlOkN+ov+k5ET0n1Z6xqYhntGuW8jYREQ7C0lUcrYM80fZD/0npfR+
         oCbDAq6RXYskXP0SEocdIWIaqrejtXpTwLhKFLmFpnr5fsbbip5DtlEQxli6PQ/gIUDp
         eE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692024896; x=1692629696;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SdQr3rrizrMRhKoEmZUiV2af/wkAGf076hXpLFsw31g=;
        b=k/NS2FIJU3lIaNevFN3bKparSLyUNbmmXHS/LAfJemnz0R9/aHi8EE8QMkmD98BKi+
         h3qlSbIL8QMPz0s7J5HFxSn3uUuR9c9sMCHBmiMMM/mpOQ+XkLNbTdo3tmap8wcNie23
         QwjBqbTLnKiwmMTOq5vJe/EXYbV3fSqSvLO/ea56XEqoLVwhqZsjaj+CDq48QtCxPbb9
         zvwLo3Pk8F6Y/P57JNfs2NQ1Gfc3f/LMcSueaQjQam1UNtaND24KB9Qk9SF+StmydEup
         joe/IPmam06LNBa3Fzyfven8q6gNzz6EngBvxtMEdAUAZPSoVrb7sqnxMtVSJ6P9C731
         msPA==
X-Gm-Message-State: AOJu0Yymwg3BNzvvX1pxW6DSoeO37jH4hdRFssp7Gj9r9y7RcA0JCxqL
	1fKSzkPYUz1rI/nIF9DieNY=
X-Google-Smtp-Source: AGHT+IGD+bEMcb3aN2r3jf0W/51DuXGWSsBb0MvHmMbqHAkymleRZPycJXHf7avCMC7iSeqawJ64/A==
X-Received: by 2002:a17:907:1de9:b0:99b:55e3:bbd with SMTP id og41-20020a1709071de900b0099b55e30bbdmr8394422ejc.34.1692024895791;
        Mon, 14 Aug 2023 07:54:55 -0700 (PDT)
Received: from skbuf ([188.26.184.136])
        by smtp.gmail.com with ESMTPSA id p18-20020a17090635d200b0099d0a8ccb5fsm5767726ejb.152.2023.08.14.07.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 07:54:55 -0700 (PDT)
Date: Mon, 14 Aug 2023 17:54:52 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: net: dsa: microchip,lan937x: add
 missing ethernet on example
Message-ID: <20230814145452.i73g7bfb6wkoqp5w@skbuf>
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230812091708.34665-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_075457_697781_EE57CC74 
X-CRM114-Status: GOOD (  16.34  )
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

On Sat, Aug 12, 2023 at 12:17:05PM +0300, Arınç ÜNAL wrote:
> The port@5 node on the example is missing the ethernet property. Add it.
> Remove the MAC bindings on the example as they cannot be validated.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

>  .../bindings/net/dsa/microchip,lan937x.yaml           | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
> index 8d7e878b84dc..49af4b0d5916 100644
> --- a/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml
> @@ -68,16 +68,6 @@ examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
>  
> -    macb0 {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -
> -            fixed-link {
> -                    speed = <1000>;
> -                    full-duplex;
> -            };
> -    };
> -
>      spi {
>              #address-cells = <1>;
>              #size-cells = <0>;
> @@ -138,6 +128,7 @@ examples:
>                                      phy-mode = "rgmii";
>                                      tx-internal-delay-ps = <2000>;
>                                      rx-internal-delay-ps = <2000>;
> +                                    ethernet = <&macb1>;
>  
>                                      fixed-link {
>                                              speed = <1000>;
> -- 
> 2.39.2
> 

