Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA4BC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 22:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XoZ57KQ2t8KQq59VcUGCIObJJ9YFC3Bj9uQynJzeWk=; b=hKG4Pwa7LFSnkAsb+rvixjZxh9
	hjKYChza5Mvwie2PqSmUr6nelgn9Eh5sVhNWDn/m038WJ+6iM1CY2SkSARzhqUbVR1Sji7qUK2GxE
	b5Azca4ZIqRIma2FzX42yAC2D51bDClU0r+b66LceWh9yCt1fzwtG7rjbTaMP6mAJ1jyE+ArF1dDX
	tW9n/Qnk1uC7IzkdJRb04OxALNXJ5MQXXQzLDekNMqarD/+lzcupafrvCOrjyRTauCPdZnkbGL7Wi
	rJvKz0zJ7A0Clbe0yFczkjgPX8hQ6siFBY8+vZxB087mKEJOCuZ6rRXt1dFi9vqkwqm6oFP4MXzQD
	BpbHdTBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sJa-00BQgA-O4; Thu, 01 Dec 2022 22:45:58 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0s7E-00BOi9-Pc; Thu, 01 Dec 2022 22:33:14 +0000
Received: by mail-oi1-f176.google.com with SMTP id e205so3563199oif.11;
        Thu, 01 Dec 2022 14:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XoZ57KQ2t8KQq59VcUGCIObJJ9YFC3Bj9uQynJzeWk=;
        b=KlnHh19gQTxB5AcDz0rdOwofzgkfrb/0lZRJNwleCzhe3nnWUeU50t2MKl5L1ttAlC
         52BGh/6XQl17kh5c2Glrw2gXG3kL0zG9SYvQNmXlWjPXAu80fJ+IAGOHxMdB5AhnVhOP
         Lm4Df63Dmy37wTcaZJ/+l/PXbTF8izCLmS6+Jdg312HIZcCMed0z2rJDVkVIo6EzqGgh
         aiJbyH7cdO+tkU4ajHqmAhHRjjFBbWbeD1pFy6dW4ErBMIl+ZvJNk4Cnikzr76d7RZfZ
         OxBXAEhGkkRiO5R409dMa0Elqpz9DnW+AgU1yTxZsprEsNmKAabrX81dGq05UxWLg+P8
         1LiA==
X-Gm-Message-State: ANoB5pmliZhIkUTPSB6uItBw0bw5Uy57rNj/QMzFJQTrD2UGjK/Q0+PQ
	2NnCzJVQHsmKrLeSj5J/UQ==
X-Google-Smtp-Source: AA0mqf5a/P+Jg0CbhGiTwnvrxazbAzgcxokOqED+K4ErW/L2Ks4hck7y2jw4TM8M9zRaXF1+WAevBA==
X-Received: by 2002:aca:1e05:0:b0:354:2c4e:bc6e with SMTP id m5-20020aca1e05000000b003542c4ebc6emr35484670oic.85.1669933991378;
        Thu, 01 Dec 2022 14:33:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b19-20020a9d6b93000000b0066c34486aa7sm2593598otq.73.2022.12.01.14.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 14:33:10 -0800 (PST)
Received: (nullmailer pid 1565634 invoked by uid 1000);
	Thu, 01 Dec 2022 22:33:09 -0000
Date: Thu, 1 Dec 2022 16:33:09 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	John Crispin <john@phrozen.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Marek Vasut <marex@denx.de>, 
	Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	Vivien Didelot <vivien.didelot@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Linus Walleij <linus.walleij@linaro.org>, UNGLinuxDriver@microchip.com, 
	Woojung Huh <woojung.huh@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	George McCollister <george.mccollister@gmail.com>
Subject: Re: [PATCH v3 net-next 04/10] dt-bindings: net: dsa: allow
 additional ethernet-port properties
Message-ID: <20221201223309.GA1555093-robh@kernel.org>
References: <20221127224734.885526-1-colin.foster@in-advantage.com>
 <20221127224734.885526-5-colin.foster@in-advantage.com>
 <20221128232759.GB1513198-robh@kernel.org>
 <Y4Wy7iSeGEtpQkgI@euler>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4Wy7iSeGEtpQkgI@euler>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_143312_854139_36A9880F 
X-CRM114-Status: GOOD (  24.28  )
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

On Mon, Nov 28, 2022 at 11:21:18PM -0800, Colin Foster wrote:
> On Mon, Nov 28, 2022 at 05:27:59PM -0600, Rob Herring wrote:
> > On Sun, Nov 27, 2022 at 02:47:28PM -0800, Colin Foster wrote:
> > > Explicitly allow additional properties for both the ethernet-port and
> > > ethernet-ports properties. This specifically will allow the qca8k.yaml
> > > binding to use shared properties.
> > > 
> > > Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> > > ---
> > > 
> > > v2 -> v3
> > >   * No change
> > > 
> > > v1 -> v2
> > >   * New patch
> > > 
> > > ---
> > >  Documentation/devicetree/bindings/net/dsa/dsa.yaml | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> > > index bd1f0f7c14a8..87475c2ab092 100644
> > > --- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> > > +++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> > > @@ -38,6 +38,8 @@ patternProperties:
> > >        '#size-cells':
> > >          const: 0
> > >  
> > > +    additionalProperties: true
> > > +
> > 
> > Where then do we restrict adding properties to ethernet-ports nodes?
> > 
> > >      patternProperties:
> > >        "^(ethernet-)?port@[0-9]+$":
> > >          type: object
> > > @@ -45,7 +47,7 @@ patternProperties:
> > >  
> > >          $ref: dsa-port.yaml#
> > >  
> > > -        unevaluatedProperties: false
> > > +        unevaluatedProperties: true
> > 
> > Same question for ethernet-port nodes.
> 
> For ethernet-port nodes, the qca8k has unevaluatedProperties: false. But
> the fact that you're asking this question means I probably misunderstood
> something...

The above is the case where you aren't adding extra properties (IIRC), 
so 'unevaluatedProperties: false' should be correct.

'unevaluatedProperties: true' is never correct in bindings. If you ref a
schema that sets it to true, you can't override it.

So qca8k, should reference dsa-port.yaml, define its extra properties 
and set 'unevaluatedProperties: false'.

> For the ethernet-ports node, I'm curious if my other follow-up answers
> that question where I realized dsa.yaml should, under the base
> definition, have additionalPrpoerties: false. But again, my guess is
> that isn't the case.

That one looks correct.

Rob

