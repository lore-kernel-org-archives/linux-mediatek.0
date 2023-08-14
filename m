Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF97C001DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 14:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wWKCUp2yq16ZBo58YuOZhMaFJTEXME++1KBwQF44Y3o=; b=rwt88vuFT6f2LsPLxK63Yr9iAe
	RRVTtW3j0nvddtQpobi6WYk4L59bxO7BWnBPhSRM3yNstQgRXHf+VCyKCtOM/+9WYNbn4sC77mD9T
	NjX77vLwXuicupWNVoES6EGvNSrh7Nj1sE332oJAE9L17xkKnozuu7eHCaOdgiXcvn7m98eLyzuKa
	QXG6dw8/J/XvSz9KYLNOX6wT2JCHnbntd0xQP2LD0TrJEHzLm3Ay25xIpwgfX+bLN9lya3ewtC6d3
	wUASQI7Tn6xxqRTS+11baUOexxbpFpXpMT4IgqyxgdAIn0Ct4qdD1QXE+C+G5qnkrUkr01fCry427
	Z0x9xrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYwS-00HNnx-1l;
	Mon, 14 Aug 2023 14:53:12 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVYwP-00HNnO-1s;
	Mon, 14 Aug 2023 14:53:10 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99c93638322so914428466b.1;
        Mon, 14 Aug 2023 07:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692024787; x=1692629587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wWKCUp2yq16ZBo58YuOZhMaFJTEXME++1KBwQF44Y3o=;
        b=BVMd15TcKSqiobpIdT/J/hWTHgjlmyGfcHaTZx5coE8RbvluwebBuuXc3FxtyC7kvB
         mgeoI9CwqQ1odg48P1swSA8Hc/dNSAZv9L4DSnNxzhvDKhMAI2/3639aPgKAZ0eKusn/
         Ap6oL5ddWZtM+V3c6WPE2t0YsMPA0Giws2twA+IhMCLFIddg/quuD46ccKmhqT4DflUo
         j9/ndUqGGk1LTzNS55e2NaCR87WIPIXCGBba1zFsBPNXEO6sGiDty2DJa7Ohbm4Wceky
         +pYsKLNabLxVBCNN/DgOtcYBNPfUZaZycVxiaBCMzz4/3dWaKHKve8A+yhIW4xEPesRB
         Nciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692024787; x=1692629587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWKCUp2yq16ZBo58YuOZhMaFJTEXME++1KBwQF44Y3o=;
        b=CFUEAbSJg6U22aySGi1Jv7NTSMk01lsSEl0koXkmGa75vUTY1ygULRLNxwjiuGmLpB
         dNtis1C29U/1RYb59LhxT6wqFQy7m1kyf7Uu8EN+BJ2LghUB+/fXqyHVWZA9IYjSxTZw
         GuK8GWmkU2bFAUV/8mmQDMS+0h+tWwV8fh/Z27sK4jg0BqatTQ4sj13UfBhk+kExL1qs
         pfvlGqATqRzGvVDEsDvkzqc3VGIAC9l56tdSlf2fqhsMZz0nT8FBJBfafCegrmfc5uUi
         tXbOg/evLvH4ESMmGJmf8faVHuDOoItQj6XQZr4H/y9O8zIHrLnvZnQZ3bnWZjIllTU8
         IvmA==
X-Gm-Message-State: AOJu0YyZQOh19s+4Gy8bIBreqLl8ObXUYYGnmI21jrnO2C2aZULxry3b
	ZJ6DFFixt9FmcGamdkLS/Ek=
X-Google-Smtp-Source: AGHT+IFtixjrdADMZKOEGkvAvBctiXAzgbQ0mso/IW2gdlLC49MP49+TS5aibY9BoUnf8wWiX5cTgg==
X-Received: by 2002:a17:907:9483:b0:99b:af5a:fc2c with SMTP id dm3-20020a170907948300b0099baf5afc2cmr14913956ejc.26.1692024787125;
        Mon, 14 Aug 2023 07:53:07 -0700 (PDT)
Received: from skbuf ([188.26.184.136])
        by smtp.gmail.com with ESMTPSA id j19-20020a1709064b5300b00982a92a849asm5768751ejv.91.2023.08.14.07.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 07:53:06 -0700 (PDT)
Date: Mon, 14 Aug 2023 17:53:03 +0300
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
Subject: Re: [PATCH 3/4] dt-bindings: net: dsa: realtek: require compatible
 property under mdio node
Message-ID: <20230814145303.bqiknvvi5urnpjgz@skbuf>
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-4-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230812091708.34665-4-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_075309_640428_2050653C 
X-CRM114-Status: GOOD (  15.11  )
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

On Sat, Aug 12, 2023 at 12:17:07PM +0300, Arınç ÜNAL wrote:
> The compatible property must be defined under the mdio node. Enforce it.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

>  Documentation/devicetree/bindings/net/dsa/realtek.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/realtek.yaml b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
> index ea7db0890abc..f600e65fc990 100644
> --- a/Documentation/devicetree/bindings/net/dsa/realtek.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/realtek.yaml
> @@ -103,6 +103,9 @@ allOf:
>              compatible:
>                const: realtek,smi-mdio
>  
> +          required:
> +            - compatible
> +
>    - if:
>        required:
>          - reg
> -- 
> 2.39.2
> 

