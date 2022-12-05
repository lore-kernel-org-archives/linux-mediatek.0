Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2282C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 21:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piMiYVIEAWjpwWEYeB3QqgTClGJiFdhEXrf3/eSPGA4=; b=WWUIuaTInMDryyZCkAszkqVsjd
	8pvweenUvlYcFNWZPAWQJHWTtn0GWj6nyjUFMWr5+QE9WQhpGGIPQFTj6rvO5nh8jBnxVYacDmqdR
	VWzFjcxmEgFVfsHApzCUzTlfdZy14pHhEg27nlU5dUs06Q8/GL0IDZMhNaJDd0jUlhoC5lsmcS18H
	Bavzw173Zc0MY+HfP5GSGJcSZY2PLH8gADCa+eCMx/f3GOQCvLbKEaom6IGptijDn6n+CeUm+oM4C
	0E+AUYF/0AKFKjEiBhk/WY86CYwA0zPgGNpjVuIR4r6W763qQc6YXIdWsiNEUS7r/5YhT++TGMk5o
	6yFp5CkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JGy-00At9g-Ch; Mon, 05 Dec 2022 21:45:12 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JGw-00At66-AA; Mon, 05 Dec 2022 21:45:11 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-14449b7814bso10139574fac.3;
        Mon, 05 Dec 2022 13:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piMiYVIEAWjpwWEYeB3QqgTClGJiFdhEXrf3/eSPGA4=;
        b=UwXNbXEj+lXM7RiAp8u+gMdu8OQ9yAfpESGnUVT74TkXV7hkjB5nF59msQbSe/Ff42
         d/fC/FxQ6FaQ1412Co+284s5dVsKW4o6EwYgV1ZTaDWywYaJqEoFoqFZItd8v3pL9lJW
         UbsGOBoEjFgXCBc6w+mLBMzC/c9GKiJ+hfIvybQW2p9beAscrIB2voCWs4jTr5SD3hWQ
         vegrJ6wPN/U6Ox5E+m3G5yvvh69XuQTVTpexEPUE0nTWLcuX+bZf7DoEOaLtWdbBmsok
         T39rLzFYQgFjCDsKcYg3nxyoljRMGq9XmFALBZ7nkNsXye1JBUGNdpAk0kWtMzWo1b2y
         IeNA==
X-Gm-Message-State: ANoB5pkREFZgbTAsrSqkeGsT0OJuZIQCquO2nTvK4g9aDboUrs/ETEim
	4RRHg04ppUP4cp0tNeTFIA==
X-Google-Smtp-Source: AA0mqf62Tge1ck28BV8HHD8EJJ/Mjm9frnjUggG1Gaq67IgoI2NtpvZpffP3xbQIkBbH7v8UJ0rxMQ==
X-Received: by 2002:a05:6870:6123:b0:144:445b:9506 with SMTP id s35-20020a056870612300b00144445b9506mr8629349oae.70.1670276708192;
        Mon, 05 Dec 2022 13:45:08 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k2-20020a056870148200b00132741e966asm9680213oab.51.2022.12.05.13.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 13:45:07 -0800 (PST)
Received: (nullmailer pid 2679125 invoked by uid 1000);
	Mon, 05 Dec 2022 21:45:06 -0000
Date: Mon, 5 Dec 2022 15:45:06 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, 
	=?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	linux-mediatek@lists.infradead.org, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	Linus Walleij <linus.walleij@linaro.org>, Vivien Didelot <vivien.didelot@gmail.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	John Crispin <john@phrozen.org>, Eric Dumazet <edumazet@google.com>, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	Woojung Huh <woojung.huh@microchip.com>, Jakub Kicinski <kuba@kernel.org>, 
	George McCollister <george.mccollister@gmail.com>, DENG Qingfang <dqfext@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Kurt Kanzenbach <kurt@linutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v4 net-next 8/9] dt-bindings: net: add generic
 ethernet-switch-port binding
Message-ID: <167027670592.2679068.10166179243095082377.robh@kernel.org>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-9-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202204559.162619-9-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_134510_390944_21456328 
X-CRM114-Status: GOOD (  15.46  )
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


On Fri, 02 Dec 2022 12:45:58 -0800, Colin Foster wrote:
> The dsa-port.yaml binding had several references that can be common to all
> ethernet ports, not just dsa-specific ones. Break out the generic bindings
> to ethernet-switch-port.yaml they can be used by non-dsa drivers.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> 
> v3 -> v4
>   * Add Florian Reviewed tag
> 
> v2 -> v3
>   * Change dsa-port title from "DSA Switch port Device Tree Bindings"
>     to "Generic DSA Switch port"
>   * Add reference to ethernet-switch-port.yaml# in dsa-port.yaml
>   * Change title of ethernet-switch-port.yaml from "Ethernet Switch
>     port Device Tree Bindings" to "Generic Ethernet Switch port"
>   * Remove most properties from ethernet-switch-port.yaml. They're
>     all in ethernet-controller, and are all allowed.
>   * ethernet-switch.yaml now only references ethernet-switch-port.yaml#
>     under the port node.
> 
> v1 -> v2
>   * Remove accidental addition of
>     "$ref: /schemas/net/ethernet-switch-port.yaml" which should be kept
>     out of dsa-port so that it doesn't get referenced multiple times
>     through both ethernet-switch and dsa-port.
> 
> ---
>  .../devicetree/bindings/net/dsa/dsa-port.yaml | 24 ++----------------
>  .../bindings/net/ethernet-switch-port.yaml    | 25 +++++++++++++++++++
>  .../bindings/net/ethernet-switch.yaml         |  6 +----
>  MAINTAINERS                                   |  1 +
>  4 files changed, 29 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-switch-port.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

