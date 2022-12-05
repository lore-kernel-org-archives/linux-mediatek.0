Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73899C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 21:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r4t1aZekiFnI1K6g/oFt0H7FLSbbOm+1ZjgnBturRNQ=; b=eo++52FDk1RZBf42F8guVaihyf
	MHCmvjwt+aFkwzbfMokBW9v/ORnI9VfeHpAo+nL0rAQ2q0uU1eGYCh29fKg0uk19/hBVf17/rrFWr
	ZbPQrumkkWIxFGM+hPWW3rTBNlyv1tkXe+ghJ3ed6+3iY9DQl0BO4TdK6Nq4zqH+1SYvGe0bsdK2T
	jC3EVZpS2T5gZG/JJ4kOUUjd6Hb/L9QJd4AVXpo5kOAGxAhPghhgnbV0aeEIYao6wk5h1mklq3JJl
	BBwZbefFxZWOVxGljrawuRbj0K35o0/wMUKwmIRZB6gw36b0tAjRZq37Qg58M9yV4HMoKiIp2VTeC
	+pqqk9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JGk-00AsxA-AY; Mon, 05 Dec 2022 21:44:58 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JGW-00AsmV-Ac; Mon, 05 Dec 2022 21:44:45 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1441d7d40c6so15059774fac.8;
        Mon, 05 Dec 2022 13:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r4t1aZekiFnI1K6g/oFt0H7FLSbbOm+1ZjgnBturRNQ=;
        b=qWjihgcvPR3b+B9flTRZbXCVrHfZMXpwBj0m3oWP5LiYGNsCn5efyf19/JhKK63Rut
         kUlFjBZ774nYYhkQ9aRTNDCrmQOeZOB846niQv00YETZBzB+5xzjOC5Wv5SXzKnF5vXb
         PdroIV0baba1q+e7qLUcJ+U9xDigHr2seVHSj4+kG0wlu/CSGJtChp1Jg5ZWQNfjB3Gp
         INTizQ6k7UMz+o9F+4a3hSnnmqf9w5gLMhhGCy/sSy932dbGmYb0Xv36021HuBURYp0e
         MKI31Z9F9mkt4Nj7UwoIWwKfImBS0Qi2vitOeNJgHtvD2HZG0zjVtrD3/jsMjsxQ+gyT
         vtAA==
X-Gm-Message-State: ANoB5pnY3AI5u16v5QBobqIShr0OAV/HcyMDJ/1qcu6Oyi8iJA52lyQJ
	WQ7HR+KSf7MJG63w3YpdtA==
X-Google-Smtp-Source: AA0mqf7W8Ga6qUQgGB4ZXmtR85+VAgIAzQlmXWo60AdPDc73ugwWFKyUZu8X8gYUJRh0D2tDMNtPOg==
X-Received: by 2002:a05:6870:440d:b0:144:c280:838a with SMTP id u13-20020a056870440d00b00144c280838amr512625oah.195.1670276681299;
        Mon, 05 Dec 2022 13:44:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w32-20020a056870b3a000b0012b298699dbsm9749207oap.1.2022.12.05.13.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:44:40 -0800 (PST)
Received: (nullmailer pid 2678417 invoked by uid 1000);
	Mon, 05 Dec 2022 21:44:39 -0000
Date: Mon, 5 Dec 2022 15:44:39 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Vladimir Oltean <olteanv@gmail.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Florian Fainelli <f.fainelli@gmail.com>, UNGLinuxDriver@microchip.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	linux-arm-kernel@lists.infradead.org, Woojung Huh <woojung.huh@microchip.com>, 
	Marek Vasut <marex@denx.de>, Jakub Kicinski <kuba@kernel.org>, DENG Qingfang <dqfext@gmail.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org, 
	Sean Wang <sean.wang@mediatek.com>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	George McCollister <george.mccollister@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 net-next 6/9] dt-bindings: net: dsa: mediatek,mt7530:
 remove unnecessary dsa-port reference
Message-ID: <167027667922.2678357.1832683707932570480.robh@kernel.org>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-7-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202204559.162619-7-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_134444_405231_74B2DB45 
X-CRM114-Status: GOOD (  11.72  )
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


On Fri, 02 Dec 2022 12:45:56 -0800, Colin Foster wrote:
> dsa.yaml contains a reference to dsa-port.yaml, so a duplicate reference to
> the binding isn't necessary. Remove this unnecessary reference.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> 
> v3 -> v4
>   * Add Florian Reviewed tag
> 
> v2 -> v3
>   * Keep "unevaluatedProperties: false" under the switch ports node.
> 
> v1 -> v2
>   * Add Reviewed-by
> 
> ---
>  Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

