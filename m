Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7A1C352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 15:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d2aBoo/MYw9aBXVIt2KwK6USjefW0Af7yl2CPwd0c+Y=; b=oZw7AeZaSTi4INoXMEDzENUSTT
	3qt5LPG5hZtJER4Wxxi10kcZ+pPM/HaSCoxt+kOeHpUwEfbcE2/9y2NDWVjWqzNEvV4q+hN9izV9N
	gkC+VL66UjFBQXClGiFnSBwA6L/BHr9u11kOJ+CDLs+Fef+ZmjzkCNdij/OW2gRQkbgaD3JSB0nY5
	JpIH75CME3tp6pv+ffPV6dDch0YrPbSWZmokFpd2IljK+RUdIKdT0wgsi4WZfI7TfAv+D1QxbXdDm
	XyJcYbsQ53fGSHbeWerfb821JgrxLNj42zr788ssjzfstZ7KstZEiIEt8L4CqKqwj1C0n2oVsL3yU
	4Y/7Grng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2a0u-00CrkR-1t; Tue, 06 Dec 2022 15:37:44 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2a0q-00CrOf-3L; Tue, 06 Dec 2022 15:37:41 +0000
Received: by mail-ed1-x52f.google.com with SMTP id d14so15857309edj.11;
        Tue, 06 Dec 2022 07:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d2aBoo/MYw9aBXVIt2KwK6USjefW0Af7yl2CPwd0c+Y=;
        b=m1EAVUMRFBrbV5dDsnZXZAN6o4Dfn+5ZtDOmrO8InSOtQNuaJvKLypbDPCae4W7nE0
         dfGD1nkqiZScFBTSAXrMo0ZYe2c1/zVQEXWKzjEE/KgtRZQbpO8vm8KF8jscF0w39kOW
         8sTLlLy4mNogAyostv9wzFo5TXgGdzil1/3PrPjSfDo7IP96v0UG+VhXwnB0BKfvXmO8
         FFuGHXpT6zM7CxvyVazsGMwfTMxxfOeIgZ7gYjT1KBwuMeazUAC4V5uenFL9hHPQMLbx
         Dw6eDRVh9wTONI2EA6Ckn+eJeXox5pcjHEve47WYEX74zlrscsKFc7Y4D9701dsFQWgG
         AuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2aBoo/MYw9aBXVIt2KwK6USjefW0Af7yl2CPwd0c+Y=;
        b=q0Tuh/d58xOXGv8Fax5K/CpHBcpwUtSUVVyczlend4OhBZNopYnycv972mT70a6W8n
         G+Y2mAVBTLHe6ywu1IZv83PFh0KfF0Lzn0BO+Lu6DuCGepdDPJSOza9qqrOP0Ts/EjE4
         OMzda7z1h4+VmS5RkizEhpKku8g5Dgz1GsxdiLiPdEYlexxcfQagbF+LTrx5uV3RESHW
         vbdqswP3No6gEP7HEq/KZxzChpRktrAcOBy1Mjlh74e50xKqYeznYwBqVsBGG8ibBv7N
         etsi97cHJUAJjcoGpTK9x9N1uSmFT2oeVGkeUO0L3a3M64q3pDar9OUAjQZ5OEqQLNY4
         F14w==
X-Gm-Message-State: ANoB5pkn2jB85i82uKLVSeY/v/I4eFXvD58MAiqc8VRfJCHwfrnHv9XJ
	YI+lXpniBl6Q0jZ8fz8+7xA=
X-Google-Smtp-Source: AA0mqf7e8IIimBlKAfh2D9udgEdKCjOXXkqfj6vyYRzkBhGRJ8OJs9j1GbXUw6+eZQEmwekG0p8zRw==
X-Received: by 2002:a05:6402:1045:b0:461:68e1:ced5 with SMTP id e5-20020a056402104500b0046168e1ced5mr13559071edu.142.1670341058481;
        Tue, 06 Dec 2022 07:37:38 -0800 (PST)
Received: from skbuf ([188.26.184.215])
        by smtp.gmail.com with ESMTPSA id e14-20020a170906314e00b007aee7ca1199sm7614767eje.10.2022.12.06.07.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 07:37:38 -0800 (PST)
Date: Tue, 6 Dec 2022 17:37:34 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	George McCollister <george.mccollister@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 net-next 3/9] dt-bindings: net: dsa: utilize base
 definitions for standard dsa switches
Message-ID: <20221206153734.4os4effdzlt2calg@skbuf>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-4-colin.foster@in-advantage.com>
 <20221202204559.162619-4-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202204559.162619-4-colin.foster@in-advantage.com>
 <20221202204559.162619-4-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_073740_178512_3484F9F0 
X-CRM114-Status: GOOD (  11.62  )
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

On Fri, Dec 02, 2022 at 12:45:53PM -0800, Colin Foster wrote:
> diff --git a/Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml b/Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml
> index 259a0c6547f3..5888e3a0169a 100644
> --- a/Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Arrow SpeedChips XRS7000 Series Switch Device Tree Bindings
>  
>  allOf:
> -  - $ref: dsa.yaml#
> +  - $ref: dsa.yaml#/$defs/ethernet-ports
>  
>  maintainers:
>    - George McCollister <george.mccollister@gmail.com>
> diff --git a/Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml b/Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
> index 1219b830b1a4..5bef4128d175 100644
> --- a/Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
> @@ -66,7 +66,7 @@ required:
>    - reg
>  
>  allOf:
> -  - $ref: dsa.yaml#
> +  - $ref: dsa.yaml#/$defs/ethernet-ports

I'm wondering if "ethernet-ports" is the best name for this schema.
Not very scientific, but what about "just-standard-props"?

