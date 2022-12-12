Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A213CC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 17:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGUdmy+g/qTasB/RYlCtkR0cf44cupB5Kch7orL6C8k=; b=rMRGD0vc2X7JuvGuXieBaEt5af
	Sj41iMMVOBeJuCaGAeYZjwxKbU5nmPdnHtzZruoRWRpdMcc1IVDr/X4uHE+Nv5J7oLlvsEQydXMPr
	/AqnbxENaXJANXop8kBOgr4pm1N/z5B6t73zWrJNStG+/Wpb7siOe6c+X+MvaGl3DW1/JheIX146z
	PCv7zBtbEIaWvRJpcRYEevRBQ4Xzzk51NWP+nGf78n7R9Bskiz384CeYM+B+0Gmv2sKYnB4yKrZB6
	qBAKpumTL+bGnhZJJLi/DFL7NRAOo6i9bnzwbRFqoIBCYTHpLDBBg48uz9WHUxqA+ETOz0RKmDnHX
	7OtjiRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4mNB-002ZZy-QY; Mon, 12 Dec 2022 17:13:49 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4mN1-002Z6R-LO; Mon, 12 Dec 2022 17:13:40 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-1442977d77dso9180277fac.6;
        Mon, 12 Dec 2022 09:13:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGUdmy+g/qTasB/RYlCtkR0cf44cupB5Kch7orL6C8k=;
        b=XU36VO4SrcHHShTQQy14xn7nc6uWjoWfOliZZXBD1tlOb4b9vYl6hqVdH/5JcosnNb
         Fbhkv5d4Y87Zc9l5jSz6su6Hja7h3E+3GZeNTlmek6TG9S7U/VeFoITXux+rYcDbTluz
         db2c6q/dB2GkJhaIXQmgg97Lz1odE1hCT+3mjAEN2wmseDmqJeU1pJ1Ss3pQLbvKGJkb
         Uh5OepW6TZ+6AeZRiUozkT/o1yP2J7Ic5yTbqvUQ9TMybUJqDDmLGVD8KFLhY4nGbbUh
         /717cFWzBVIBB7helOqHgbF1fry/JGaNPYyuHk+nKTnCPB4m48c+NxRdKfsBWW8KE3bX
         euRQ==
X-Gm-Message-State: ANoB5pmjahsZdJJzDJ81ntzimKiD/3doOGNLj6dv4KiObjUbT4+jNwT6
	inKhiwy4L6EHO3lMoOhLAA==
X-Google-Smtp-Source: AA0mqf4TgLSi1nA9lDe/di5Hok12V+737QACa0Nu2l7rV/UJ4b97Gx0ku7i4xI0Vm0f3uz83kDKy1A==
X-Received: by 2002:a05:6870:9123:b0:144:d2bd:f6ac with SMTP id o35-20020a056870912300b00144d2bdf6acmr9120964oae.43.1670865215081;
        Mon, 12 Dec 2022 09:13:35 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ba35-20020a056870c5a300b0013b9ee734dcsm155255oab.35.2022.12.12.09.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 09:13:34 -0800 (PST)
Received: (nullmailer pid 1147754 invoked by uid 1000);
	Mon, 12 Dec 2022 17:13:33 -0000
Date: Mon, 12 Dec 2022 11:13:33 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	", Eric Dumazet" <edumazet@google.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Sean Wang <sean.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	Marek Vasut <marex@denx.de>, Woojung Huh <woojung.huh@microchip.com>, 
	Vivien Didelot <vivien.didelot@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	linux-renesas-soc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, "David S. Miller" <davem@davemloft.net>, 
	linux-mediatek@lists.infradead.org, Kurt Kanzenbach <kurt@linutronix.de>, 
	George McCollister <george.mccollister@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew@lunn.ch>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	John Crispin <john@phrozen.org>, Jakub Kicinski <kuba@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vladimir Oltean <olteanv@gmail.com>, 
	netdev@vger.kernel.org, UNGLinuxDriver@microchip.com, 
	=?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v5 net-next 01/10] dt-bindings: dsa: sync with maintainers
Message-ID: <167086521259.1147694.13128574954492521303.robh@kernel.org>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-2-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210033033.662553-2-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_091339_721664_110075ED 
X-CRM114-Status: GOOD (  12.25  )
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


On Fri, 09 Dec 2022 19:30:24 -0800, Colin Foster wrote:
> The MAINTAINERS file has Andrew Lunn, Florian Fainelli, and Vladimir Oltean
> listed as the maintainers for generic dsa bindings. Update dsa.yaml and
> dsa-port.yaml accordingly.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> 
> ---
> 
> v5
>   * New patch
> 
> ---
>  Documentation/devicetree/bindings/net/dsa/dsa-port.yaml | 2 +-
>  Documentation/devicetree/bindings/net/dsa/dsa.yaml      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

