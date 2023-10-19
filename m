Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44D8CDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 18:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jFz3N6LeFOOVODdL64dwWeQWp+bpB7F4zr/o34e38ik=; b=2mqILHNJZbxCsL6M+GJMrRxn67
	IAKQ4Z7Wrp5KYWuyzVJ7Qdwsna4wmVZTsT7b0jFIOvN/yGNjFhQdGViFdTbRzOmjKz6udBcJ0m0mF
	PW39NdrqYjilriMuz+E4szOOSV7xhvqrzbqKutfV5VgWmhvJ1GlLyR43Y9X+RSZjCYoAqK7mOz5iL
	52DmcB9L7juxFGAe2NGucAd9G7aRTzEyMbxPhUgOa8XkzVUdL8DcTS1xh8inCL6QaYX2wiv73pF1A
	W+TwlHWku8HX+a+5JqEOGTMwPvbJTCJ/jhZ1xFEKzuYpTj5DAMNbh3Lm9O+2w8Je9dBOkGdv0IQmP
	5Jhx5x7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtXP1-000TW7-24;
	Thu, 19 Oct 2023 18:05:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtXOv-000TTW-05;
	Thu, 19 Oct 2023 18:05:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F59461C61;
	Thu, 19 Oct 2023 18:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBEDC433C9;
	Thu, 19 Oct 2023 18:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697738739;
	bh=13yt5cryvUi1YLdWtQi3541qTBZX6Xxnaa5Zjb/IhK0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FBweXG01tz7i3yGhEu0rZq9X3fHqysIn62AciqqqNTXgJLPWeTA0KqGLV7NAv4dAG
	 6phlNA4RBO9tcom4ns5IXNNy+JNzgUjqyjQYx/NgwnEi1oklxKi6sLCG8gtr5+lNCH
	 jXyziYWk4el32e877PCAHSFXEH7eoixVQxEePW9pO2BnOz/WBNtXiJkW3xmhOLOCc5
	 1OybPsPseRw8gqbnbzyS04USEyT/hwk7WQccCevEbkgj2IEWmEGxllhO2wBxzzxTtb
	 DS9weU2uiT5IFoy4AB7uv3+RAdvd/5yn6fn620OD5zc1EWyOhz0xcWggEWZctJAbw8
	 ncKbR4aDyRlOg==
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-32dc9ff4a8fso1963553f8f.1;
        Thu, 19 Oct 2023 11:05:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YyXcXdNTBAbgjeQT4+J6QyJxeKUdrphoAmdYpZiOi3EUcEBUndr
	ajpR7m8qYGLD13vJn0/BHZjXOs/OciaJ6qse8g==
X-Google-Smtp-Source: AGHT+IEjbNUU8g3b3xf9dnd0eY+00UyD/xRWPuvjqCt6uPBJrdf2zudScRRu1FwHOHQso0cwFJ/4Jb+Lufriea1TdN4=
X-Received: by 2002:a19:ad05:0:b0:500:d4d9:25b5 with SMTP id
 t5-20020a19ad05000000b00500d4d925b5mr2093637lfc.56.1697738717670; Thu, 19 Oct
 2023 11:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org> <20231019131806.lbzydoplodybvb62@skbuf>
In-Reply-To: <20231019131806.lbzydoplodybvb62@skbuf>
From: Rob Herring <robh@kernel.org>
Date: Thu, 19 Oct 2023 13:05:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJmUe9XtHEwU+GVMZc8RrKy5OV5RM6pfE2KqwMhRekMOw@mail.gmail.com>
Message-ID: <CAL_JsqJmUe9XtHEwU+GVMZc8RrKy5OV5RM6pfE2KqwMhRekMOw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/8] dt-bindings: net: Add missing
 (unevaluated|additional)Properties on child node schemas
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, 
	John Crispin <john@phrozen.org>, Gerhard Engleder <gerhard@engleder-embedded.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Sergei Shtylyov <sergei.shtylyov@gmail.com>, Justin Chen <justin.chen@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_110541_175799_ADFBF29A 
X-CRM114-Status: GOOD (  18.88  )
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

On Thu, Oct 19, 2023 at 8:18=E2=80=AFAM Vladimir Oltean <olteanv@gmail.com>=
 wrote:
>
> Hi Rob,
>
> On Mon, Oct 16, 2023 at 04:44:20PM -0500, Rob Herring wrote:
> > Just as unevaluatedProperties or additionalProperties are required at
> > the top level of schemas, they should (and will) also be required for
> > child node schemas. That ensures only documented properties are
> > present for any node.
> >
> > Add unevaluatedProperties or additionalProperties as appropriate.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5p=
sw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > index 833d2f68daa1..ea285ef3e64f 100644
> > --- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > +++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
> > @@ -61,17 +61,11 @@ properties:
> >
> >    ethernet-ports:
> >      type: object
> > -    properties:
> > -      '#address-cells':
> > -        const: 1
> > -      '#size-cells':
> > -        const: 0
> > -
> > +    additionalProperties: true
> >      patternProperties:
> >        "^(ethernet-)?port@[0-4]$":
> >          type: object
> > -        description: Ethernet switch ports
> > -
> > +        additionalProperties: true
> >          properties:
> >            pcs-handle:
> >              maxItems: 1
>
> For my edification, this patch removes #address-cells and #size-cells
> at the same time, because "additionalProperties: true" (which was also
> implied before) doesn't care if they aren't defined in this sub-schema,
> and they are defined through $ref: dsa.yaml#/$defs/ethernet-ports,
> right?

Yes, they are ultimately checked via ethernet-switch.yaml which
dsa.yaml references.

Rob

