Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E914CCDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 15:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAQIUSSFEkh8UCmi8THqE2sWEJcCZDabuYYz4V23TW8=; b=k8RcchLGIWYWI8wfUWt+S8GKZF
	XYNR9xbxLwDbP7h9kepGQ+poWmR4RpkaeeU7Ei7knkWPxRTa3JXnztbO/ebQfyAZ5u8SmytJQMe3j
	sWc9GoxFCuq+jfRU+riBXK+prfaRvGcvcrED+Npcq8gaFuCTC9RzUME3bnZCNll3/hxIMUZOt2o27
	N/9PwFA6ORTZQjpujtK4hf74DVNPKNOGR8Crgq0FOj7/Fuhg3m8wDpv+iQZnp2BeTcJwFLd7Eaj9G
	XymoosZoVIf8xSvFBx7LP4BWxUsD9UQtrUAqLWoqhiEfa9zgC4BuP7uf1GyxKZRDn4sIxFjnT2k8w
	HtEwi4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslmC-00CihI-2d;
	Tue, 17 Oct 2023 15:14:32 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslm9-00CieN-0S;
	Tue, 17 Oct 2023 15:14:30 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso54960511fa.1;
        Tue, 17 Oct 2023 08:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697555665; x=1698160465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LAQIUSSFEkh8UCmi8THqE2sWEJcCZDabuYYz4V23TW8=;
        b=UrZZwpvkhfuDIkBIJjLhmg5DErzxYTqbp16z3rtxIslS9hLTrLO2Q2LnTkB4xSDUBx
         sl/G5xCPIg0WKsyHvCvEOXCTE5wuqsPfoQhT4QDLxLhn/tKMn/om4I97a0qdYSpbkwJ7
         5FaOAvWmwrQebzIO0cQc+tALDp7L/1kTzlZ+Ovt0sfx160qTFx0zpdlkG1idTDZ4DlSc
         2BDtdi/migZ0j/vjRMOX1yI5dd+/TLKss/DXxe7QcGwavZ0sOEVZ2Mp+3hJNN+3sSNVO
         4/3Bt/NE6sbTr4/zyMzVsAinvXlPcsi2Rp6dRQtrcM+UKhuYw58Gp215/onCr8DkqkIZ
         Dq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697555665; x=1698160465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LAQIUSSFEkh8UCmi8THqE2sWEJcCZDabuYYz4V23TW8=;
        b=PkOrxfNNYuPbYqPFj9ciq1nY2tu00nVlJvZg2ePjLdq604cDuwhdUVB0lqcx3Wf35i
         gixJpTsYihy+oSkZibLII/OjOq+2b2BnR4CUAnVLSnZCk9bE5dSCxfkidpZYs/jm/OPf
         LpX5JbPwUKvaYIKgKfdyDW1ttGcM89Lfzwy34/tfYrOgaEITpZ7eQv5x/vpOktVXOiCr
         tXSUfbDETb5KzyJrRyb7KFELcYwFNsz3hrwU2YhuaGSXa3V97vjvCwKJLTiGoZvN2wVu
         ArCrQRHcLqQ24cV/nM/twznCmNU0YmHcS18bIFDxdajMPk4NUom1CWJMtBN1vHe6f6n6
         eXQw==
X-Gm-Message-State: AOJu0YwuMFGy4izVkS68NWYp+p6q37jIFK6mGT0oIguvvvbgk3s2bLGf
	Gj6aHV6gfc17vmH3Snhjmuw=
X-Google-Smtp-Source: AGHT+IGGk9+XOX5f1XNqFWNen/mWjFSeo+yOGyG3yMMSOnh8F9Yx0HDcS+QgLDHdukQU3wtBx5MZag==
X-Received: by 2002:a2e:aa22:0:b0:2c5:31e6:e8e2 with SMTP id bf34-20020a2eaa22000000b002c531e6e8e2mr1904703ljb.25.1697555664440;
        Tue, 17 Oct 2023 08:14:24 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c15d200b00406447b798bsm1907790wmf.37.2023.10.17.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 08:14:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Linus Walleij <linus.walleij@linaro.org>,
 Alvin =?utf-8?B?xaBpcHJhZ2E=?= <alsi@bang-olufsen.dk>,
 =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 =?ISO-8859-1?Q?n=E7_=DCNAL?= <arinc.unal@arinc9.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 John Crispin <john@phrozen.org>,
 Gerhard Engleder <gerhard@engleder-embedded.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH net-next 1/8] dt-bindings: net: Add missing
 (unevaluated|additional)Properties on child node schemas
Date: Tue, 17 Oct 2023 17:14:21 +0200
Message-ID: <2720928.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_081429_183411_F860D5ED 
X-CRM114-Status: GOOD (  11.86  )
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

Dne ponedeljek, 16. oktober 2023 ob 23:44:20 CEST je Rob Herring napisal(a):
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Add unevaluatedProperties or additionalProperties as appropriate.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml     |  2 ++

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  Documentation/devicetree/bindings/net/dsa/brcm,sf2.yaml        |  1 +
>  Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml |  2 ++
>  .../devicetree/bindings/net/dsa/microchip,lan937x.yaml         |  1 +
>  Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml     |  2 ++
>  Documentation/devicetree/bindings/net/dsa/qca8k.yaml           |  1 +
>  Documentation/devicetree/bindings/net/dsa/realtek.yaml         |  2 ++
>  .../devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml        | 10 ++--------
>  Documentation/devicetree/bindings/net/engleder,tsnep.yaml      |  1 +
>  Documentation/devicetree/bindings/net/nxp,tja11xx.yaml         |  1 +
>  10 files changed, 15 insertions(+), 8 deletions(-)




