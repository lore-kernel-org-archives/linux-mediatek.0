Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B874FEE3F0F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 19:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8gdWrWuVeFlnSIKZ2NOJm7Y8BUbwd2ZNwalxRE+BW0=; b=4Wl63BUq5DoxpIQV9a4xUH/my8
	5qvG2jy1TJR33TIi4E0RI3XukwT4WXz7Cw13uSlatxHBpQxbS2WUmZVG9/kVpDvQI54IjzAcwpC2o
	6D13CO78PudDGox/PYonuD3NMG3oaG+aSf7yzhexqauOmiFOTUyj1A6DapJbFxQgbO5rhbKkZIdWb
	jXZgWv8YI09btnpNAHPpaiLHsk58+Qp9uYRMA0oZNHA7iqXflGYMZX2+15A0isuGDgYP3Jzcts3Bj
	9HYWTmbSPzVSr3sXaPKUrEZbtdCIu/kt/pvlgGzm4b3mhz0+4tIQQraqmiR1jBmnkkrsAotJUOIBX
	S/gWu67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg9A5-0043BL-2T;
	Tue, 12 Sep 2023 19:35:01 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg9A1-00439m-2F;
	Tue, 12 Sep 2023 19:34:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bcf2de59cso765324166b.0;
        Tue, 12 Sep 2023 12:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694547294; x=1695152094; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z8gdWrWuVeFlnSIKZ2NOJm7Y8BUbwd2ZNwalxRE+BW0=;
        b=b1rQhiTqk3sLiMxCCYewCqRgbbrfmR7P0dEa1mpL4QzUim7yDZgLwBvKM5sguHnD0C
         Gp3+AZW0pZd4x3IW2f5/2eSm7zbXlyXJcph66wXBKhDyxu5lywPTsqARI54mKTa+omFd
         gdS3tbMRmqFHyYuhMw8chFju3FMB+9wve2+sK/AWL+stwGiHyJn3QD2SZRgneOKOUdpP
         /YtWbD1/79tSm4BIDYeuXqTaPa0tCv8O6mMe/RZBwi4zlxmnYgRbjJ/aIbzb0FL05SwN
         1YnjFfWxDKzctkBFW9zT4E/cy8JBMZzsaYQPNx9q7UXkfC6VyGugb1Cd8hzFxNF2qEI3
         MA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694547294; x=1695152094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8gdWrWuVeFlnSIKZ2NOJm7Y8BUbwd2ZNwalxRE+BW0=;
        b=YpyJf64LKN5Fcao8Y369YsGD+hg4WqpCbf+MQCJsjc59JytH+anIN7kRI/ij6QJMKr
         P51/4p4gEpg43nLYn8NniWdtNFx44j90nBsTT0HnPbiMG7kSXQCX4ONRDosNyhil3HWq
         G3eFhzFNUzxOGN63/VeKrRLB2t1wqPuUIoMWkYo4SJrrkS0ck2MsueDauVQPMVwy/JcP
         vq+hiCpNqvI1/4b64YhcYelIzI/EY6RAyfObAMX9GAr9zzy/qncOdHsyM+5VZCz2NVh7
         KlnCDmuoUD6qUEUPxhJ1u14FDRY+N7vPNLBtiJX7bcZPfs7bGgBR07t/uIxwVPlF+2GF
         FM8A==
X-Gm-Message-State: AOJu0YwbUBar8mu5h6ESYl2Jtbcg+x+GASkmNivLW0SQgsf2O/YDDj9i
	DO2Y1QxcC6UmFG87/1WM3hc=
X-Google-Smtp-Source: AGHT+IF2x+0PJReOu0h7LIhK4z/2N8GnhuzGa4jCv35kEX4WT+YNV6CCZ1h1zkd9sRMux2n4P4GJMQ==
X-Received: by 2002:a17:906:3149:b0:9a5:cade:8044 with SMTP id e9-20020a170906314900b009a5cade8044mr186839eje.21.1694547293556;
        Tue, 12 Sep 2023 12:34:53 -0700 (PDT)
Received: from skbuf ([188.25.254.186])
        by smtp.gmail.com with ESMTPSA id i18-20020a17090671d200b0099cf840527csm7290131ejk.153.2023.09.12.12.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:34:53 -0700 (PDT)
Date: Tue, 12 Sep 2023 22:34:50 +0300
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
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Message-ID: <20230912193450.h5s6miubag46z623@skbuf>
References: <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
 <20230911225126.rk23g3u3bzo3agby@skbuf>
 <036c0763-f1b2-49ff-bc82-1ff16eec27ab@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <036c0763-f1b2-49ff-bc82-1ff16eec27ab@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_123457_735650_25771289 
X-CRM114-Status: GOOD (  21.86  )
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

On Tue, Sep 12, 2023 at 10:23:51PM +0300, Arınç ÜNAL wrote:
> On 12.09.2023 01:51, Vladimir Oltean wrote:
> > On Sat, Sep 09, 2023 at 11:53:50AM +0300, Arınç ÜNAL wrote:
> > > What to do:
> > > - For mscc,vsc7514-switch, enforce phylink bindings for ports.
> > > - For mscc,vsc7512-switch, enforce phylink bindings for user ports.
> > 
> > you can also look at dsa_switches_apply_workarounds[], and if the switch
> > isn't there, then you can replace "user ports" with "ports" here and
> > everywhere.
> 
> The phylink bindings for user ports I ended up making by looking up the
> existing devicetrees are different than the phylink bindings for the shared
> (CPU and DSA) ports currently enforced on all switches.
> 
> My phylink bindings for user ports:
> 
>             allOf:
>               - anyOf:
>                   - required: [ fixed-link ]
>                   - required: [ phy-handle ]
>                   - required: [ managed ]
> 
>               - if:
>                   required: [ fixed-link ]
>                 then:
>                   not:
>                     required: [ managed ]

Right, it should have been anyOf and not oneOf.. my mistake. It is a bug
which should be fixed. It's the same phylink that gets used in both cases,
user ports and shared ports :)

> 
> The phylink bindings for shared ports enforced on all switches on
> dsa-port.yaml:
> 
>   allOf:
>     - required:
>         - phy-mode
>     - oneOf:
>         - required:
>             - fixed-link
>         - required:
>             - phy-handle
>         - required:
>             - managed
> 
> Here's what I understand:
> 
> - For switches in dsa_switches_apply_workarounds[]
>   - Enforce the latter for shared ports.
>   - Enforce the former for user ports.
> 
> - For switches not in dsa_switches_apply_workarounds[]
>   - Enforce the former for all ports.

No, no. We enforce the dt-schema regardless of switch presence in
dsa_switches_apply_workarounds[], to encourage users to fix device trees
(those who run schema validation). The kernel workaround consists in
doing something (skipping phylink) for the device trees where the schema
warns on shared ports. But there should be a single sub-schema for
validating phylink bindings, whatever port kind it is.

