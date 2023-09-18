Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6817CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 21:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfOE2sJsXPR0OmMBLo97GwreagHx3S8gUyFPzMiTpO0=; b=jU9mBrPrOkrBI7znCHJMauB9QE
	uZ0aStNHuXpkJpRMwIQObgvrEB0kag88NL9SgQYpZxhdySM4VhF8Pqamqt1KhLzgDpAVzNTNNzgEj
	R9rC8ku9MDDW+9GYwIZVA64A86Efp9KWkzE4co2TwhJOgoN8JRTkkxdb+yT5LKq4Xmrfpb/49/q5L
	foaHXE0NoIq3VJ/IqlVSvcYF4fE1lhf764XuRcUH6r/sZRuomzLAMg8PNrqVPJEmcXeXnWEOzHccK
	+3psT/p4N6jTd55hu08lGDEPjaITi14UKuFKAdBQ4hnqXUc8mGrkL95ZRCcrJEFnbc5HDOGd1EQ4j
	PSXWj61Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiLXO-00GMlE-1t;
	Mon, 18 Sep 2023 21:12:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiLXK-00GMkJ-2z;
	Mon, 18 Sep 2023 21:12:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 32D6C61368;
	Mon, 18 Sep 2023 21:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AAEC433C8;
	Mon, 18 Sep 2023 21:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695071525;
	bh=m/n53GAvddAGYEj8KIWHPEfGhiEY0hHq/daTN/xqmFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lT6zdRyXLl3hGuDf4Nmys6NDjz2efBIL530DSrN/5R5/MRcQKduO3iwEIe/7x/+w2
	 Z8CCwA50YfY9NmcTYlhnpktZTivUUex6T+i5eEfh0sP7g4927U7pMO84D07R5uQK5M
	 vBIlzWxcu1TwjS/d4EVqTPKVPrLn4+69kUMEIoDy7RwpksLVaFf/wg9sZXzQ8NEJ79
	 p1VOE/dv37lACSur8VEm86e4EzSZJsXMvfFNl5tCpidcZat1b2us9VdssDOB+m1zRj
	 NLYItvKkINSQ6o1g6ynePQDp+4HuEpK3ybeCVliZ7KCbTkdDnCDOXVbkuvfwSJT7cG
	 XDOt1yurB5n0A==
Received: (nullmailer pid 1768524 invoked by uid 1000);
	Mon, 18 Sep 2023 21:12:02 -0000
Date: Mon, 18 Sep 2023 16:12:02 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mithat.guner@xeront.com, erkin.bozoglu@xeront.com, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: mtmips: document pins of groups
Message-ID: <20230918211202.GA1743810-robh@kernel.org>
References: <20230917162837.277405-1-arinc.unal@arinc9.com>
 <20230917162837.277405-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230917162837.277405-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_141207_054127_78892DFF 
X-CRM114-Status: GOOD (  16.51  )
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

On Sun, Sep 17, 2023 at 07:28:37PM +0300, Arınç ÜNAL wrote:
> Document the pins of each group on the MediaTek MTMIPS SoC pin controllers.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../pinctrl/mediatek,mt7620-pinctrl.yaml      | 22 ++++++++++++-
>  .../pinctrl/mediatek,mt7621-pinctrl.yaml      | 18 +++++++++-
>  .../pinctrl/mediatek,mt76x8-pinctrl.yaml      | 33 ++++++++++++++++++-
>  .../pinctrl/ralink,rt2880-pinctrl.yaml        | 17 +++++++++-
>  .../pinctrl/ralink,rt305x-pinctrl.yaml        | 16 ++++++++-
>  .../pinctrl/ralink,rt3352-pinctrl.yaml        | 17 +++++++++-
>  .../pinctrl/ralink,rt3883-pinctrl.yaml        | 16 ++++++++-
>  .../pinctrl/ralink,rt5350-pinctrl.yaml        | 13 +++++++-
>  8 files changed, 144 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
> index 221adcef6e14..eb9d9d2bd90f 100644
> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
> @@ -44,8 +44,28 @@ patternProperties:
>                     wdt refclk, wdt rst, wled]
>  
>            groups:
> -            description:
> +            description: |
>                An array of strings. Each string contains the name of a group.
> +
> +              group             pins
> +              ------------------------------------------------------------------
> +              "i2c"             1, 2
> +              "spi"             3, 4, 5, 6
> +              "uartf"           7, 8, 9, 10, 11, 12, 13, 14
> +              "uartlite"        15, 16
> +              "wdt"             17
> +              "pa"              18, 19, 20, 21
> +              "mdio"            22, 23
> +              "rgmii1"          24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35
> +              "pcie"            36
> +              "spi refclk"      37, 38, 39
> +              "ephy"            40, 41, 42, 43, 44
> +              "nd_sd"           45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56,
> +                                57, 58, 59
> +
> +              "rgmii2"          60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71
> +              "wled"            72

This list of strings should be an enum like 'function' above.

> +
>              maxItems: 1

This is wrong if more than 1 string is allowed...

Same goes for the rest of the changes.

Rob

