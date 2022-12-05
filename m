Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B2BC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 21:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3FyNfYivQwMLOF6RUZwmkn/sgZ3GskW73HlQfJ4j1s=; b=eloXpSM1nG47Lr8IJ2eBZIkC6z
	rtS6APkzgOV2zxgtZcBdlt0eFrt1MM//EolQEUkKguTMuZYpZJ7pqEsChcKA3Or/pUdH3Bio4s2Vv
	kF00U6VkOQeO/1WRSNdaDWptZ+97xwfH7oH5R6QV22V5UL4KDb+4nNvIanF9XdZSIOcFfWg3NeEau
	SqnTmAwBesv2hT0hr5RZbV3jmfO2EVWr2JSlo6X6XpMVPLUtE30Qpwd3uWwCjLvB59e9p5ET1wdZV
	g38cCKa0ThRw1+IR6w+MqXYAvvGZRmzjN60H6AmoeWYrxg9b/J+BOcxSbJFRfEFawaZr86U5ggzLC
	Vl3YlWWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JEf-00ArP4-8S; Mon, 05 Dec 2022 21:42:49 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JEV-00ArFX-4B; Mon, 05 Dec 2022 21:42:40 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1433ef3b61fso15042221fac.10;
        Mon, 05 Dec 2022 13:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3FyNfYivQwMLOF6RUZwmkn/sgZ3GskW73HlQfJ4j1s=;
        b=XbLQoKjpcHottJI/m7nC8DEgtQ/tE6MiYMA8cBs3Ccqsybq58Fw57IBs5DmA/RAKNQ
         4I6SkkIzTZI74fPKXHjmsemjCi5yDgAUcZH6tCgNXaDfV5Xo+taEFUcNVVuOiZESjTgL
         5u9y/JNL7tIvT+dvLbPDXPySOSFmaNbUu0akVqbquyo253JWl06BlB1YZlQ0OQsY7M97
         cykYp+F/issCME2+wJTYg+3sv1MJp/Ra5wfg+XvPCUQLU4b6ozn81cZXzlVJU8svaAZd
         4l5ten4pyosdGWkA90r3UXTrmgwpD1bWIqpl5rL7KMGFGdqnSQkltoQk0gqKo2wm2X/s
         RNlA==
X-Gm-Message-State: ANoB5pldBdXG2Uf+mnN4aYskhzHLXFgsu1qE/VIdzsjkvdYsnI9BoyLU
	41QIPIwNJk5xz5Svq8JjSA==
X-Google-Smtp-Source: AA0mqf5lL0R7+W+RHjbcvEkN74SVEW9xDKe8Lo/rK/nX1nK5gtfCsbsVFuNwy7AFbJIFsEkverQ85w==
X-Received: by 2002:a05:6870:179d:b0:13a:fa4a:27d0 with SMTP id r29-20020a056870179d00b0013afa4a27d0mr37686866oae.255.1670276556697;
        Mon, 05 Dec 2022 13:42:36 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 123-20020aca0781000000b0035028730c90sm7616822oih.1.2022.12.05.13.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:42:36 -0800 (PST)
Received: (nullmailer pid 2675372 invoked by uid 1000);
	Mon, 05 Dec 2022 21:42:35 -0000
Date: Mon, 5 Dec 2022 15:42:35 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Vivien Didelot <vivien.didelot@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-mediatek@lists.infradead.org, 
	George McCollister <george.mccollister@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	John Crispin <john@phrozen.org>, UNGLinuxDriver@microchip.com, 
	"David S. Miller" <davem@davemloft.net>, Woojung Huh <woojung.huh@microchip.com>, netdev@vger.kernel.org, 
	Kurt Kanzenbach <kurt@linutronix.de>, Florian Fainelli <f.fainelli@gmail.com>, 
	=?UTF-8?B?LG7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, linux-renesas-soc@vger.kernel.org, 
	Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org, 
	Eric Dumazet <edumazet@google.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, DENG Qingfang <dqfext@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH v4 net-next 5/9] dt-bindings: net: dsa: qca8k: utilize
 shared dsa.yaml
Message-ID: <167027655461.2675313.2465931055798706710.robh@kernel.org>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-6-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202204559.162619-6-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_134239_266180_5C567B7B 
X-CRM114-Status: GOOD (  13.88  )
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


On Fri, 02 Dec 2022 12:45:55 -0800, Colin Foster wrote:
> The dsa.yaml binding contains duplicated bindings for address and size
> cells, as well as the reference to dsa-port.yaml. Instead of duplicating
> this information, remove the reference to dsa-port.yaml and include the
> full reference to dsa.yaml.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> 
> v3 -> v4
>   * Add Reviewed tag
>   * Remove unnecessary blank line deletion
> 
> v2 -> v3
>   * Remove #address-cells and #size-cells from v2. The examples were
>     incorrect and fixed elsewhere.
>   * Remove erroneous unevaluatedProperties: true under Ethernet Port.
>   * Add back ref: dsa-port.yaml#.
> 
> v1 -> v2
>   * Add #address-cells and #size-cells to the switch layer. They aren't
>     part of dsa.yaml.
>   * Add unevaluatedProperties: true to the ethernet-port layer so it can
>     correctly read properties from dsa.yaml.
> 
> ---
>  Documentation/devicetree/bindings/net/dsa/qca8k.yaml | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

