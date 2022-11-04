Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DA8C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 18:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fmOKByI3KZe2A+MbL7heqgNPSfdsbAmN+AppMoJZ00=; b=RbmuODS5fZV6anNuOnOx/bwHpq
	IQijfNec485qOEs2CXeWvhi5VlklPDThP1S2m2WQ6xPcVJmeptRFZDk7dBf2lckVgqdIRl2W1zfk6
	ErmH4VYcFzbd225Strmlu+V2/xyMiUeTLoEUlIVWxEdgd8RC7/U78FuDTpTsZlTpqM3OKJRPnx0mw
	RneXH0uFwP3jh+qXTaBPkp2f//dL7Mz2vDAh4qZ/xinABzZQeJmke5amF1U+T/7YSy8euirybbEm4
	xpz05x7SvqgMp7iAI2RDAlxn3vsKfvvZPTxh0EzjlnuMH/tTALBd+U49JkmC4tLYoF5StHmn7UcF4
	F936QwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or1p7-004pB6-RL; Fri, 04 Nov 2022 18:53:49 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or1p5-004p9P-J1; Fri, 04 Nov 2022 18:53:48 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-13ae8117023so6475911fac.9;
        Fri, 04 Nov 2022 11:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fmOKByI3KZe2A+MbL7heqgNPSfdsbAmN+AppMoJZ00=;
        b=EPvdD/2IK069zzfOrpx9CDxl1hQHFKNvZ1eAWHNpM14B66NhkkmXXhSoUyI92nEqod
         PvAXczp2nPRbeTHrhZuIf3VV5daK9V545LjLEcNJSKnX3FH4HDI0YANcpBW/umrWjg2Q
         ccv46ffBqoTP2JvRzunVCtfP9O4FWGoOmDYuGZ/telM3ekL1zSa5XTSeOLO3+UM69lKQ
         pH66nuIVise9W5DWTn5HtM7K0TCNDHoyDXoghQY+uWNgQ2KkgRnZaipa4JAzoG1SvBho
         hD6fhdailZ19yzsuUCuYtunyQHoyDI6rvI4KrIsihY5SnS2jclrNVdYnRDGBPXNWXbAO
         Qz7A==
X-Gm-Message-State: ACrzQf1v0MjjpnAicjBLoIy4bXAU28SuVhmK0xLLE3ophmmgodk1cqho
	u/JiVkxWXce9RFKKRJCK1Q==
X-Google-Smtp-Source: AMsMyM7H12TuDK4Qcc7Lp3VgFO0eqWpI/aipb/7bHwsocq/OaNXhxdKmKwIjE8/ecQst2AvBtkN/qw==
X-Received: by 2002:a05:6870:42c3:b0:136:4251:1642 with SMTP id z3-20020a05687042c300b0013642511642mr22945908oah.210.1667588022771;
        Fri, 04 Nov 2022 11:53:42 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i9-20020a4ac509000000b0049e9fbf1615sm1328008ooq.48.2022.11.04.11.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 11:53:42 -0700 (PDT)
Received: (nullmailer pid 2245794 invoked by uid 1000);
	Fri, 04 Nov 2022 18:53:43 -0000
Date: Fri, 4 Nov 2022 13:53:43 -0500
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, =?iso-8859-1?Q?n=E7_=DCNAL?= <arinc.unal@arinc9.com>, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v2 net-next 3/6] dt-bindings: net: dsa: mediatek,mt7530:
 remove unnecessary dsa-port reference
Message-ID: <20221104185343.GC2133300-robh@kernel.org>
References: <20221104045204.746124-1-colin.foster@in-advantage.com>
 <20221104045204.746124-4-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221104045204.746124-4-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_115347_659432_5D61E11D 
X-CRM114-Status: GOOD (  16.03  )
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

On Thu, Nov 03, 2022 at 09:52:01PM -0700, Colin Foster wrote:
> dsa.yaml contains a reference to dsa-port.yaml, so a duplicate reference to
> the binding isn't necessary. Remove this unnecessary reference.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
> 
> v1 -> v2
>   * Add Reviewed-by
> 
> ---
>  Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index f2e9ff3f580b..81f291105660 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -159,8 +159,6 @@ patternProperties:
>          type: object
>          description: Ethernet switch ports
>  
> -        unevaluatedProperties: false
> -

You just allowed this node to have any property.

>          properties:
>            reg:
>              description:
> @@ -168,7 +166,6 @@ patternProperties:
>                for user ports.
>  
>          allOf:
> -          - $ref: dsa-port.yaml#
>            - if:
>                required: [ ethernet ]
>              then:
> -- 
> 2.25.1
> 
> 

