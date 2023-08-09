Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA92C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Aug 2023 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zd4L1RcNMatQQw5hO4kN0BqebHH8Z7kfM3C1HqnlYUY=; b=Jizc7Thwim70ju1qWPbq2UgoM9
	EPKAIZLA1nl5edzFLxrmCbEjbFq4JzgfH8p3XrjspCrm1eV++ea2/QDtz6g8EmX6clZjTKYi7S+AQ
	9fddeAQ2r6X+EtwMsnOIZml0trhgM0qa02tqAGrn5/rrDsMyd60Y976o6q7xQKKbOMozCzpjNaeYY
	eVN0ubHrie/HAGq9JwsUyz/6nM4B0D8Mx9VI3iQXeSJibJidQ744rk9c5Cq7bLJizwSIQQabea2fz
	Aznn+h0oFOzqVrgfWSvfXTIlWQA4NCMq3h1iIlOKIwlNy6PNlWI6qkCfxflx5TB8uBb/OUSnJpFhV
	AfEVI8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrEw-005xN9-1c;
	Wed, 09 Aug 2023 22:01:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrEq-005xM8-07;
	Wed, 09 Aug 2023 22:01:12 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-317e427488aso294745f8f.1;
        Wed, 09 Aug 2023 15:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691618465; x=1692223265;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zd4L1RcNMatQQw5hO4kN0BqebHH8Z7kfM3C1HqnlYUY=;
        b=IUZ+Ifb4IB0F/S0DIL8t0yC14UqjN1pzQsDj/ddHAUFQHfxzismvpH+yD9UHzen5Na
         iIxhAMogeV3vcFrg/M+wagnmVH5bMWpS3750ZWpn41b+5/bBs8LKqIs5t6FkOGh0v34T
         ek5RlZAJkDF0gxSxIpEiWZCU/1Djyk2emKX4OVa189VqzT23J3dfEdV+YGMcCRb2KNMR
         cXy98+ILJYIzTCrD36KCHUjuNY6iFaoUMqD07kSfLarr1rLP7zfTMO4UZDl6q8sskilf
         24KW2ligoxC+R7ThIKnXOOkM+NRW4pIolW9EwA1JXBtlvXIiNDKcXzEleLL6kHsrcU6A
         xSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691618465; x=1692223265;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zd4L1RcNMatQQw5hO4kN0BqebHH8Z7kfM3C1HqnlYUY=;
        b=QuDx7r8Pfl5Uw6xpzj1noPYqHeOWbNs/pUUII5RZj7friiwjA7Bhd6iHxynCYOVzg1
         eMdPDnF5AmS1uk95FVN/V+cY0G88eCqCiOT90Jv8gKhrkKQNOl6NwaSVuzMl4qpZof9e
         O637ZdriOITpXq6YNQNEzoofr0oemg0j15+Hoc9w6ecYPnve1PNIIBNUkEQ09FcFapLq
         3s5Tx/O0zqKPrrE+6/754zHjXLr0HXIaNo2huYdNHMoVZHU0NT6LyVt5mhYAjC7m+mUf
         lBTkjW68xXQ2zyteAVU+XB0mEKngXGxrPqJJwNqq6aKni1KHQmmPHHQCxeH8DWHpbZMZ
         yl6g==
X-Gm-Message-State: AOJu0YyghAoAm0De+EYVZvfXaHZrEMZmpOTZ/zQyz9QQO9Jbd2foGbIi
	7NSRp9lRer4q8x768cH4MUk=
X-Google-Smtp-Source: AGHT+IEkVjpEjBs0/DVnPkvkOgz0pDNqvnwAyD9x+MOAlUpcdK4j4QHczbRXIG77r+sexstUochFaw==
X-Received: by 2002:a05:6000:1090:b0:317:58eb:1e33 with SMTP id y16-20020a056000109000b0031758eb1e33mr495585wrw.8.1691618465110;
        Wed, 09 Aug 2023 15:01:05 -0700 (PDT)
Received: from skbuf ([188.27.184.144])
        by smtp.gmail.com with ESMTPSA id p4-20020a056402074400b005233ec5f16bsm15547edy.79.2023.08.09.15.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 15:01:04 -0700 (PDT)
Date: Thu, 10 Aug 2023 01:01:02 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND net-next 2/2] dt-bindings: net: dsa:
 mediatek,mt7530: document MDIO-bus
Message-ID: <20230809220102.t3dqw7iojez5xsq3@skbuf>
References: <6eb1b7b8dbc3a4b14becad15f0707d4f624ee18b.1691246461.git.daniel@makrotopia.org>
 <9aec0fe0cb676b76132c388bb3ead46f596a6e6e.1691246461.git.daniel@makrotopia.org>
 <dcb981b9-b435-c0e5-8e47-d66add207fdc@arinc9.com>
 <20230808121707.chona7hakapp6whe@skbuf>
 <44fde617-1159-4961-84c4-372fe265fbd8@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44fde617-1159-4961-84c4-372fe265fbd8@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_150108_098226_905A7BD3 
X-CRM114-Status: GOOD (  33.70  )
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

On Wed, Aug 09, 2023 at 12:03:19PM +0300, Arınç ÜNAL wrote:
> On 8.08.2023 15:17, Vladimir Oltean wrote:
> > On Sat, Aug 05, 2023 at 11:15:15PM +0300, Arınç ÜNAL wrote:
> > > I don't see a reason to resubmit this without addressing the requested
> > > change.
> > > 
> > > > > Wouldn't we just skip the whole issue by documenting the need for defining all PHYs
> > > > > used on the switch when defining the MDIO bus?
> > > > 
> > > > Good idea, please do that.
> > > 
> > > https://lore.kernel.org/netdev/0f501bb6-18a0-1713-b08c-6ad244c022ec@arinc9.com/
> > > 
> > > Arınç
> > 
> > Arınç, where do you see that comment being added? AFAIU, it is a
> > characteristic of the generic __of_mdiobus_register() code to set
> > mdio->phy_mask = ~0, and nothing specific to the mt7530.
> 
> What I believe is specific to DSA is, 1:1 mapping of the port reg to the
> PHY reg on the mdio bus is disabled if the mdio bus is defined. Therefore,
> I believe a notice like below fits mediatek,mt7530.yaml.
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index e532c6b795f4..c59d58252cd5 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -128,6 +128,15 @@ properties:
>        See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt for
>        details for the regulator setup on these boards.
> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Node for the internal MDIO bus connected to the embedded ethernet-PHYs.
> +      For every port defined under the "^(ethernet-)?ports$" node, a PHY must be
> +      defined under here and a phy-handle property must be defined under the
> +      port node to point to the PHY node.
> +
>    mediatek,mcm:
>      type: boolean
>      description:
> 
> Arınç

In that case, putting the comment here would make more sense, no?
(and maybe enforcing an actual schema, but I've no idea how to do that)

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
index 480120469953..5a415f12f162 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
@@ -59,7 +59,14 @@ properties:
       - rtl8_4t
       - seville

-# CPU and DSA ports must have phylink-compatible link descriptions
+# CPU and DSA ports must have phylink-compatible link descriptions.
+# On user ports, these are also supported, but are optional and may be omitted,
+# meaning that these ports are implicitly connected to a PHY on an internal
+# MDIO bus of the switch that isn't described in the device tree. If the switch
+# does have a child node for the internal MDIO bus, the phylink-compatible
+# bindings are also required (even if this is not enforced here). The detection
+# of an internal MDIO bus is model-specific and may involve matching on the
+# "mdio" node name or compatible string.
 if:
   oneOf:
     - required: [ ethernet ]

Since commit fe7324b93222 ("net: dsa: OF-ware slave_mii_bus"), DSA as a
framework also supports auto-creating an internal MDIO bus based on the
presence of the "mdio" node name, so I guess it makes sense for the
"mdio" to appear in the generic dsa.yaml if there's nothing else that's
special about it.

Also, in the earlier patch version you had replied to David Bauer:

| > While i was not aware of this side effect, I don't see how this breaks the ABI.
| 
| Your patch doesn't break it, my then-intention of doing PHY muxing by
| utilising this would. Your first patch is perfectly fine as is.

Could you please clarify what is your valid use case for not having a
phy-handle to a PHY on an MDIO bus that is otherwise present in OF?
It doesn't _have_ to be broken. Since DSA knows the addresses of the
internal PHYs, it can circumvent the lack of auto-scanning by manually
calling get_phy_device() at the right (port-based) MDIO addresses.
But any patch would need to have a clear reason before being considered
for merging.

