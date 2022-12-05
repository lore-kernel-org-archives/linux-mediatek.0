Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1862EC47088
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 21:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNGr0I77rqwyAC8AXud43K7iOEl8cm1zQzmCR6XwoTA=; b=BtMfw1UyvMM2EeBkglUrQSCdnD
	sCx+9nb6s9y+yEPvZroc3I55wIwWhk4jLFHdd5ee144uPiOmDrQApAkDWF+pNxixnpCxoerforw99
	Ho2bXvO8te5tJlMDVn81B8Ol71zOONE5s19BSZIO1nDguLj536jJ0ipwHPz0ahrqW80YFYJ80X5LL
	00fgolmHPGLehrkoFRzR4VzUNWcVC1O17xvYHv542ZcbG47usUcusKvzAQ+/Z2DZEkZf4p9tAzGe0
	32o40gyq/gKkkGyqJzyDuzCX3hJAs9ZFB17ELSsfxWYKc2G2xqwMlBZ7PcxLGuY/Z4ouYEoeQr1a2
	DWm1F5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JEL-00Ar9s-Vu; Mon, 05 Dec 2022 21:42:30 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JEH-00Ar5D-WF; Mon, 05 Dec 2022 21:42:27 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-12c8312131fso15102608fac.4;
        Mon, 05 Dec 2022 13:42:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNGr0I77rqwyAC8AXud43K7iOEl8cm1zQzmCR6XwoTA=;
        b=Gpo79mIJTMTmqlIytl0t/8o0SDQXbSpBNmC/3RA694oNprBE1f9FjZySpFrcMw5Dc5
         CMdxlUz5xIV3rC5TzgDcLyQzA44he1Slyon0Jq8uboUe2owQeHG4Yro5SrbLnkaJ3J5O
         S1kdnrvbKIemGc8e6giS0LB6I0CqxitO8HEZZii8+o+8S/6K3KeFoRqvPvcFmGswGGrm
         JANKQsSptQlN7aWe7Rq7g828YzMR8+ouV5Duo9ySiLTizUcs238FqvOnHTdwRxeURyon
         AQJCltl8zvVxAN4u0nSehFKuR0zTV3mGL++m42ON5rSM6Gnj1xRNG/qI0v9vp8KlCC31
         cYIQ==
X-Gm-Message-State: ANoB5pn4vMeAUXx61CmOVk+NSka47aobTlTjf3+24mnfnzP6TeCAWUDm
	Os/VSd9MTMU8bm6is1K0vQ==
X-Google-Smtp-Source: AA0mqf7hwLNcWO6bZt8FX+2pOdAAkaDRY2N5Cp1AwZT3A0cQlaZQR1AeANmbE7FqmKtksp2OPcT/og==
X-Received: by 2002:a05:6870:3b8f:b0:144:2395:41b9 with SMTP id gi15-20020a0568703b8f00b00144239541b9mr10882014oab.294.1670276543724;
        Mon, 05 Dec 2022 13:42:23 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bh8-20020a056830380800b006621427ecc7sm8120175otb.60.2022.12.05.13.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:42:23 -0800 (PST)
Received: (nullmailer pid 2674969 invoked by uid 1000);
	Mon, 05 Dec 2022 21:42:22 -0000
Date: Mon, 5 Dec 2022 15:42:22 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: Landen Chao <Landen.Chao@mediatek.com>, Woojung Huh <woojung.huh@microchip.com>, 
	linux-mediatek@lists.infradead.org, Vivien Didelot <vivien.didelot@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean <olteanv@gmail.com>, 
	John Crispin <john@phrozen.org>, UNGLinuxDriver@microchip.com, 
	Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	"David S. Miller" <davem@davemloft.net>, ", Kurt Kanzenbach" <kurt@linutronix.de>, 
	George McCollister <george.mccollister@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	DENG Qingfang <dqfext@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Marek Vasut <marex@denx.de>, =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH v4 net-next 4/9] dt-bindings: net: dsa: allow additional
 ethernet-port properties
Message-ID: <167027654137.2674912.5511174194632704012.robh@kernel.org>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-5-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202204559.162619-5-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_134226_137662_45E61D07 
X-CRM114-Status: GOOD (  13.06  )
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


On Fri, 02 Dec 2022 12:45:54 -0800, Colin Foster wrote:
> Explicitly allow additional properties for both the ethernet-port and
> ethernet-ports properties. This specifically will allow the qca8k.yaml
> binding to use shared properties.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> 
> v3 -> v4
>   * Change ethernet-ports node to have "unevaluatedProperties: false"
>     instead of "additionalProperties: true"
>   * Change ethernet-port node to have "additionalProperties: true" instead
>     of "unevaluatedProperties: true"
>   * Add Reviewed tag
> 
> v2 -> v3
>   * No change
> 
> v1 -> v2
>   * New patch
> 
> ---
>  Documentation/devicetree/bindings/net/dsa/dsa.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

