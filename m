Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9C5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 01:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9kEHh2uqEcTxay8IXJpj7B8eZqE5bmy8Lxw7NCJ7XA=; b=D4dSaL888nA5JC
	KKurQBBiMUObuMQzlJzElgcws4ulh5XBLmt68TtPtwAhqJW64Hb4K1ydyk4JQGnY0wj5In2fuq43J
	tvojIIkDKOVdklm/G2XGs33FvaSxShog4KlYnFT9Ob7P+2t709sHKSVr05fXtElalOYvpn0IRbTsc
	Dgxtdn2IS2Kd04FZgnhLbISR1o6V8YwU9E3zhJK9xXGKvSdfZ+dN7SaoQN7FLLtOtpMvia/Poi6bh
	Mo5fvYleKOZL6VLizzeVzsQeMV7AgIDp5DUIxhmEYk5aMg3VZf6AVr5ax5SJI9eevUttVrj2GeoSC
	oxatJfEImBAOjVUrzEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr8u4-00Ge1b-Dl; Wed, 18 May 2022 01:55:08 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr8u0-00Gdzx-HB; Wed, 18 May 2022 01:55:06 +0000
Received: by mail-oi1-f181.google.com with SMTP id r1so1070870oie.4;
 Tue, 17 May 2022 18:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ckNmPcl7fe5xiocWvQwlJ3B7sjwM65UrQXbcw0Qh69c=;
 b=m6GLs5gffp7GD50qyo1IpclDTMkFTXIEeCaKGK8aoCO2vHwow1UVzV2uC1d6WKY+2S
 6rdDO56Cuoaink6LYyXuM0fQpCj8p6jUY0k4cq/Pb6/HdSO+Ez1JUgQB+wuv2z0Kj9lP
 sir44WPky3sY+lJ0Wdq5svs0ynrxJ71KwMN+9Y7K8iuZXt/mKt0fYHAeqPiW0P4YZn2c
 bGNlefZgX2pdy2xchNQj8ZYR3oiJgQafxe4vWM+8lmLUJ+okmuaPRlgI7mMcx9En9Xvj
 DK+PMAUvHocrA0HDM2v+Kwj10oQamKOdcvFUGILOlpwhttvPm6P9RIWdsNYMgyJWG6Pc
 euQg==
X-Gm-Message-State: AOAM532XnYWr4fHej7Royxngo91ToGMhOYCjVVD0ykmaJ0LCqp/Bvm6C
 N2qT0ftaJshlxuBD422rzQ==
X-Google-Smtp-Source: ABdhPJwKaRtIBExfohDctD5F8a5l+hdyd55lfF+Tzt7FpFR639U7gZCg8kE/+Q4JuJyS7fUtDHEamA==
X-Received: by 2002:a05:6808:188a:b0:326:7f5f:985c with SMTP id
 bi10-20020a056808188a00b003267f5f985cmr11975649oib.210.1652838901111; 
 Tue, 17 May 2022 18:55:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b11-20020acab20b000000b00326414c1bb7sm362362oif.35.2022.05.17.18.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 18:55:00 -0700 (PDT)
Received: (nullmailer pid 2063166 invoked by uid 1000);
 Wed, 18 May 2022 01:54:59 -0000
Date: Tue, 17 May 2022 20:54:59 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Ungerer <gerg@kernel.org>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: Re: [PATCH v3 1/6] dt-bindings: net: dsa: convert binding for
 mediatek switches
Message-ID: <20220518015459.GB2049643-robh@kernel.org>
References: <20220507170440.64005-1-linux@fw-web.de>
 <20220507170440.64005-2-linux@fw-web.de>
 <YnqymzCbabEjV7GQ@robh.at.kernel.org>
 <trinity-68761fe5-fcca-456b-ba50-ead759f0fb54-1652256165646@3c-app-gmx-bap47>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-68761fe5-fcca-456b-ba50-ead759f0fb54-1652256165646@3c-app-gmx-bap47>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_185504_612727_CEEB26D8 
X-CRM114-Status: GOOD (  22.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 11, 2022 at 10:02:45AM +0200, Frank Wunderlich wrote:
> Hi
> 
> thanks for review
> 
> > Gesendet: Dienstag, 10. Mai 2022 um 20:44 Uhr
> > Von: "Rob Herring" <robh@kernel.org>
> > On Sat, May 07, 2022 at 07:04:35PM +0200, Frank Wunderlich wrote:
> > > From: Frank Wunderlich <frank-w@public-files.de>
> 
> > > +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> 
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt7530
> > > +      - mediatek,mt7531
> > > +      - mediatek,mt7621
> > > +
> >
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> >
> > I don't see any child nodes with addresses, so these can be removed.
> 
> dropping this (and address-cells/size-cells from examples) causes errors like this (address-/size-cells set in mdio
> node, so imho it should inherite):

I think you are off a level.


> Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.example.dts:34.25-35: Warning (reg_format):
> /example-0/mdio/switch@0/ports/port@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)

That's for yet another level where 'ports' node need the properties.

> Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> 
> > > +  interrupt-controller:
> > > +    type: boolean
> >
> > Already has a type. Just:
> >
> > interrupt-controller: true
> >
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> 
> > > +patternProperties:
> > > +  "^(ethernet-)?ports$":
> > > +    type: object
> >
> >        additionalProperties: false
> 
> imho this will block address-/size-cells from this level too. looks like it is needed here too (for port-regs).
> 
> > > +
> > > +    patternProperties:
> > > +      "^(ethernet-)?port@[0-9]+$":
> > > +        type: object
> > > +        description: Ethernet switch ports
> > > +
> > > +        unevaluatedProperties: false
> > > +
> > > +        properties:
> > > +          reg:
> > > +            description:
> > > +              Port address described must be 5 or 6 for CPU port and from 0
> > > +              to 5 for user ports.
> > > +
> > > +        allOf:
> > > +          - $ref: dsa-port.yaml#
> > > +          - if:
> > > +              properties:
> > > +                label:
> > > +                  items:
> > > +                    - const: cpu
> > > +            then:
> > > +              required:
> > > +                - reg
> > > +                - phy-mode
> > > +
> 
> > > +  - if:
> > > +      required:
> > > +        - interrupt-controller
> > > +    then:
> > > +      required:
> > > +        - interrupts
> >
> > This can be expressed as:
> >
> > dependencies:
> >   interrupt-controller: [ interrupts ]
> 
> ok, i will change this
> 
> > > +            ports {
> >
> > Use the preferred form: ethernet-ports
> 
> current implementation in all existing dts and examples from old binding are "ports" only.
> should they changed too?

They don't have to be the schema allows both, but the example should be 
best practice.

Rob


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
