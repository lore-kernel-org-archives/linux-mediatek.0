Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE75ACA5500
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 07:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqyPmr2+k/NZVSejvLbli04qwXaMrXe8lYcDTd578VI=; b=UOfM8+U9jtuSSHJYgH5LY7JtHl
	lZNZWWTK/3YgfteYmcORiHjjcvmktX6kPL1lMg9iSbWurHqRGHJXzIdll+dqNy4voO44ni5oI2lPu
	2xKSB6qGJXdJU45jdNW1qzz4nlRbhmTqTxq+PBdzyTZlfzhbH7FvEcOGx+VhhfG2lba5+cQT/+Bdx
	d3M57BfMtCedqyWVB3l6o3fu8fD4pT/okBmLfN8zfTtc8e/S4SAJhM9aDkphIx1aotx+wy9lVezDS
	fcLbqfnXXcAN3E4KSEU1pg6XNU0K1O0ReTDY9ua82S0EcIv+NLME4RhrJcKHPlijBcRYuRLTz47+F
	xSg6TQkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKWJ-004yBH-0k;
	Wed, 13 Sep 2023 07:42:43 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgKWF-004y9p-1g;
	Wed, 13 Sep 2023 07:42:40 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52fe27898e9so370258a12.0;
        Wed, 13 Sep 2023 00:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694590955; x=1695195755; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iqyPmr2+k/NZVSejvLbli04qwXaMrXe8lYcDTd578VI=;
        b=DLzeSa1WOPYWbnAIQcj/wx9ui0anpDbpAPNF+sahBNEVEtfH63nx4x6aH8Zfi1Uq1x
         /VpYGlmvTPaNLa3PQDcQ+KgjQmQnxDUW2sjHWew3o2NAT7K+LrQjf5IrYEdvOhFEgpQ8
         VXi6lU6hY/WCapnAOFN02cOkPRh+L3lRJ6wNVd/ov5FfvVQMY+NG0VvQZJSYyRsEb44r
         t5pKvGQQsoWVCP8JliA+K9xYB8jYsJuh4+pTOpxVFsux+lbAO7kRkeXogixVy0V3mnVf
         52mwb+TpibJKGt3waCAyyevMYwc4X+qdojV0A5Zo2laSj8T93X4cF7JFxn8emfgmRN5/
         8ZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694590955; x=1695195755;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqyPmr2+k/NZVSejvLbli04qwXaMrXe8lYcDTd578VI=;
        b=q8yuSGzHfB3b0e17WVsedVXLP83YPDH+ft8NfjDfuZnDAFCg7ydqU7/QWsqy/PTvHA
         N+1FAF3YOvt3R9ylw2MRaZXGhF/IB4BoTk/Yu/oB5sFbw5xRpO3u9WIxngt6LHlq7BpC
         WgWWerodDw24bDHsejra2VsQDmk4eri5bIUN3Z1gi9TPRw++FhZmC9lD1NPwheEb4oyZ
         0/+C2zkVlPaBrsz/rkqSN0Mi2y9nh2XJd7d+sBjY4MnccTOzao3da3o6w/7ODB/5J1LM
         e3UJUUmjf3Fm4HZdE9Df1lP4VHmZOAwsfbFo+TSf7Chln/P3rwgQdFICXQ/MkZDK545i
         4wwA==
X-Gm-Message-State: AOJu0YzPFOaZE4e1gLHelNIEAyuknyonD8krk/ZqAbXXd8lNNo0lqqku
	sYv3jp9k1L3DyeUTDWd6ALk=
X-Google-Smtp-Source: AGHT+IG9wMEyhBjSpRxfH9WcGpwpPQcuKOXyDTvt6JEficQoouj+74NmVu6JoToLxPGIgK4sRqX+TQ==
X-Received: by 2002:a17:906:74c7:b0:9aa:1020:8c39 with SMTP id z7-20020a17090674c700b009aa10208c39mr1295768ejl.18.1694590954694;
        Wed, 13 Sep 2023 00:42:34 -0700 (PDT)
Received: from skbuf ([188.26.184.93])
        by smtp.gmail.com with ESMTPSA id w5-20020a17090652c500b0099bd453357esm7874749ejn.41.2023.09.13.00.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 00:42:34 -0700 (PDT)
Date: Wed, 13 Sep 2023 10:42:31 +0300
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
Message-ID: <20230913074231.5azwxqjuv2wp5nik@skbuf>
References: <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
 <20230911225126.rk23g3u3bzo3agby@skbuf>
 <036c0763-f1b2-49ff-bc82-1ff16eec27ab@arinc9.com>
 <20230912193450.h5s6miubag46z623@skbuf>
 <6cec079e-991e-4222-a76d-d6156de0daca@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cec079e-991e-4222-a76d-d6156de0daca@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_004239_581611_CE89B061 
X-CRM114-Status: GOOD (  31.65  )
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

On Wed, Sep 13, 2023 at 08:52:37AM +0300, Arınç ÜNAL wrote:
> On 12.09.2023 22:34, Vladimir Oltean wrote:
> > On Tue, Sep 12, 2023 at 10:23:51PM +0300, Arınç ÜNAL wrote:
> > > The phylink bindings for user ports I ended up making by looking up the
> > > existing devicetrees are different than the phylink bindings for the shared
> > > (CPU and DSA) ports currently enforced on all switches.
> > > 
> > > My phylink bindings for user ports:
> > > 
> > >              allOf:
> > >                - anyOf:
> > >                    - required: [ fixed-link ]
> > >                    - required: [ phy-handle ]
> > >                    - required: [ managed ]
> > > 
> > >                - if:
> > >                    required: [ fixed-link ]
> > >                  then:
> > >                    not:
> > >                      required: [ managed ]
> > 
> > Right, it should have been anyOf and not oneOf.. my mistake. It is a bug
> > which should be fixed. It's the same phylink that gets used in both cases,
> > user ports and shared ports :)
> 
> One more thing, I don't recall phy-mode being required to be defined for
> user ports as it will default to GMII. I don't believe this is the same
> case for shared ports so phy-mode is required only for them?

phy-mode is not strictly required, but I think there is a strong
preference to set it. IIRC, when looking at the DSA device trees, there
was no case where phy-mode would be absent on CPU/DSA ports if the other
link properties were also present, so we required it too. There were no
complaints in 1 year since dsa_shared_port_validate_of() is there. The
requirement can be relaxed to just a warning and no error in the kernel,
and the removal of "required" in the schema, if it helps making it
common with user ports.

I think that the fallback to PHY_INTERFACE_MODE_GMII applies only if
there is a phy_device (phy-handle). But otherwise, I don't remember if
the PHY_INTERFACE_MODE_NA passed to phylink_create() will persist at
runtime, or cause an error somewhere.

> > > The phylink bindings for shared ports enforced on all switches on
> > > dsa-port.yaml:
> > > 
> > >    allOf:
> > >      - required:
> > >          - phy-mode
> > >      - oneOf:
> > >          - required:
> > >              - fixed-link
> > >          - required:
> > >              - phy-handle
> > >          - required:
> > >              - managed
> > > 
> > > Here's what I understand:
> > > 
> > > - For switches in dsa_switches_apply_workarounds[]
> > >    - Enforce the latter for shared ports.
> > >    - Enforce the former for user ports.
> > > 
> > > - For switches not in dsa_switches_apply_workarounds[]
> > >    - Enforce the former for all ports.
> > 
> > No, no. We enforce the dt-schema regardless of switch presence in
> > dsa_switches_apply_workarounds[], to encourage users to fix device trees
> > (those who run schema validation). The kernel workaround consists in
> > doing something (skipping phylink) for the device trees where the schema
> > warns on shared ports. But there should be a single sub-schema for
> > validating phylink bindings, whatever port kind it is.
> 
> Hmm, like writing phylink.yaml and then referring to it under the port
> pattern node? This could prevent a lot of repetition.
> 
> Arınç

Yes, that would sound good.

