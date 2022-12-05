Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20191C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 21:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=At/Iy89jbSM+uM6oAL5A4QbrrbFSKepIZsFF2MdZt+I=; b=WDs6rNH6dEB63DFeIG2QW3yV0S
	YnXugS285P973q+/EUBsSJKRukmDPuSNoYPncS0GbgQjYoXvqWDwhdrtaYA2u2qaKpT/IIteSFCq+
	z8nCEp1+6+fafXXWz8lKeDjcNhhfdnzHcX7mOZJEDfgax3fYEZmNBLh8kCGGQnHirREqw8KQyzPK9
	IuURF0LJqmkFi56z9kD4sxWmvzYVZrrFEGeaIfR4ep3YL09KokIoYgGQ1zZQet44HFNEA5+0uitKI
	QOivJ2v643DO7w4e3S9fyw5xuYIJrL8NT/Dk+akFNtvcgC4ruf5OgJHS1DBU6eEgzdKdOnTL1SzQS
	7zPzvx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JE9-00Ar0X-5p; Mon, 05 Dec 2022 21:42:17 +0000
Received: from mail-ot1-f54.google.com ([209.85.210.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JE6-00AqxG-6Z; Mon, 05 Dec 2022 21:42:15 +0000
Received: by mail-ot1-f54.google.com with SMTP id q18-20020a056830441200b006704633f258so1767846otv.0;
        Mon, 05 Dec 2022 13:42:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=At/Iy89jbSM+uM6oAL5A4QbrrbFSKepIZsFF2MdZt+I=;
        b=HVaV/TW66er5jVVJJviWs88vttuksn89ZiePmA92xJdiZB8nGQytYUrJ7oY1zzPw8A
         7P2GTuaBGMrFzx4eQBtt9Sk0wdrI7M1h0TRhrmbmA/eVbY0Gmqhfh8rYmbDlk/MJ5+mI
         rAUGHJR8X74GLjmfVU93TbDvaljy5e9Z/vuMpTzJ2isF+zjw4+iryhZz2EGp69aFr8RT
         szut74eVT2z10wMuujPnFycQDIVI4rTqKEw32L1uVB8+OPXLgzd1IbNQnFFAygMt0DyE
         9QvtM1PdkRRj1hRdOgr+uQFKw8B/8f0sYajAeOywoFLqE+DOoM7BJSerm0IH2xRcBenG
         CrQQ==
X-Gm-Message-State: ANoB5pmXP1hb9z88aB80jHDC7F+DDMdzay1wJ6JDTWNKmxUH4QcYp+j2
	sG6fwFDzALWcfaemTDK5Tg==
X-Google-Smtp-Source: AA0mqf6kj1GoiLDfY3xtoeuyCtevhKeHsvjbFdh4JVs9EO/VSyl7R6SPPnX8FN/JLUwlfcWHCl3skQ==
X-Received: by 2002:a9d:7751:0:b0:637:1464:cebf with SMTP id t17-20020a9d7751000000b006371464cebfmr41256218otl.100.1670276531645;
        Mon, 05 Dec 2022 13:42:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b24-20020a9d5d18000000b0066da36d2c45sm8233897oti.22.2022.12.05.13.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:42:11 -0800 (PST)
Received: (nullmailer pid 2674599 invoked by uid 1000);
	Mon, 05 Dec 2022 21:42:10 -0000
Date: Mon, 5 Dec 2022 15:42:10 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, 
	UNGLinuxDriver@microchip.com, John Crispin <john@phrozen.org>, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Landen Chao <Landen.Chao@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, 
	linux-mediatek@lists.infradead.org, Woojung Huh <woojung.huh@microchip.com>, 
	"David S. Miller" <davem@davemloft.net>, =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	Sean Wang <sean.wang@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org, 
	Kurt Kanzenbach <kurt@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
	Florian Fainelli <f.fainelli@gmail.com>, ", DENG Qingfang" <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	George McCollister <george.mccollister@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v4 net-next 3/9] dt-bindings: net: dsa: utilize base
 definitions for standard dsa switches
Message-ID: <167027652411.2674430.15313904791062984653.robh@kernel.org>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-4-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202204559.162619-4-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_134214_258195_7124E08A 
X-CRM114-Status: GOOD (  16.55  )
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


On Fri, 02 Dec 2022 12:45:53 -0800, Colin Foster wrote:
> DSA switches can fall into one of two categories: switches where all ports
> follow standard '(ethernet-)?port' properties, and switches that have
> additional properties for the ports.
> 
> The scenario where DSA ports are all standardized can be handled by
> swtiches with a reference to the new 'dsa.yaml#/$defs/ethernet-ports'.
> 
> The scenario where DSA ports require additional properties can reference
> '$dsa.yaml#' directly. This will allow switches to reference these standard
> defitions of the DSA switch, but add additional properties under the port
> nodes.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Alvin Šipraga <alsi@bang-olufsen.dk> # realtek
> ---
> 
> v3 -> v4
>   * Rename "$defs/base" to "$defs/ethernet-ports" to avoid implication of a
>     "base class" and fix commit message accordingly
>   * Add the following to the common etherent-ports node:
>       "additionalProperties: false"
>       "#address-cells" property
>       "#size-cells" property
>   * Fix "etherenet-ports@[0-9]+" to correctly be "ethernet-port@[0-9]+"
>   * Remove unnecessary newline
>   * Apply changes to mediatek,mt7530.yaml that were previously in a separate patch
>   * Add Reviewed and Acked tags
> 
> v3
>   * New patch
> 
> ---
>  .../bindings/net/dsa/arrow,xrs700x.yaml       |  2 +-
>  .../devicetree/bindings/net/dsa/brcm,b53.yaml |  2 +-
>  .../devicetree/bindings/net/dsa/dsa.yaml      | 25 ++++++++++++++++---
>  .../net/dsa/hirschmann,hellcreek.yaml         |  2 +-
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 16 +++---------
>  .../bindings/net/dsa/microchip,ksz.yaml       |  2 +-
>  .../bindings/net/dsa/microchip,lan937x.yaml   |  2 +-
>  .../bindings/net/dsa/mscc,ocelot.yaml         |  2 +-
>  .../bindings/net/dsa/nxp,sja1105.yaml         |  2 +-
>  .../devicetree/bindings/net/dsa/realtek.yaml  |  2 +-
>  .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  |  2 +-
>  11 files changed, 35 insertions(+), 24 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

