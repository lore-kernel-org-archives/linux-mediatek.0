Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BBBCFA45C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2024 17:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmEVhBJVJsQXnrJhRZPfZUzFLJqycfl8GOOHTWz4FTY=; b=qIzOyy3uh/bojytgUcv1qkkszx
	yX0sIj29Wbn8bM3CBa/xAeFGIVWTlm+FPl/ZrC+agOoHdLk6OJYTA4LABX/lx/+IYOIFTTkmsuikS
	nMzBsmdGU366d0Z7aHrTWfnp7wYMM4zZuXWl5b+lxSx8EAYCN9YwMX9vngSYZgm+1u1pcHerjgT4z
	d4+U7myDGnSLIJHBI0KfyLtZ5QoUNAelgU7NrxgDjvm2YP0QoHIATxafFjD3xEPmo165ekfoT5KDi
	hQ0T5pfptfRYhgaRADjpMOdkaw3p98pf2vq5oQTMnSTPMA2Jv4APUON+71Qe97dVNhYdoN0qXgk+o
	KvgqX31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fOO-0000000FPSB-0J0v;
	Wed, 23 Oct 2024 17:43:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3er6-0000000FJ24-2PcJ;
	Wed, 23 Oct 2024 17:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gmEVhBJVJsQXnrJhRZPfZUzFLJqycfl8GOOHTWz4FTY=; b=hp4wPkSZbMXNN95Uk34gpoCcvo
	kMgc4Kx2KFDq4hrzZ7/1mBSPikuzlXlMY0EvidbGFVm45qDRNfh+yFDeF+wB3b+fCxQTs7voApWvu
	WlrFrE9EKhYYh1EHuxgQJ/7nLzKXsh0rFQziXfbsiq9w9vhW7h4xgyxrSA9uDbZ9r+yo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t3eqv-00AzoS-OD; Wed, 23 Oct 2024 19:08:57 +0200
Date: Wed, 23 Oct 2024 19:08:57 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next RFC PATCH v2 1/3] dt-bindings: net: dsa: Add Airoha
 AN8855 Gigabit Switch documentation
Message-ID: <5761bdc3-7224-4de6-b0f5-bedc066c09f6@lunn.ch>
References: <20241023161958.12056-1-ansuelsmth@gmail.com>
 <20241023161958.12056-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023161958.12056-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_100908_766053_E2391E7B 
X-CRM114-Status: GOOD (  13.62  )
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

> +  airoha,base_smi_address:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Configure and change the base switch PHY address to a new address on
> +      the bus.
> +      On reset, the switch PHY address is ALWAYS 1.
> +    default: 1
> +    maximum: 31

Given that this is a 5 port switch, what happens if i pick a value
greater than 31 - 5 ?

Do you have a real use case for this? A board which requires the PHYs
get shifted from the default of 1? Vendors have all sorts of bells and
whistles which we never use. If its not needed, i would not add it,
until it is actually needed, if ever.

> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Define the relative address of the internal PHY for each port.
> +
> +      Each reg for the PHY is relative to the switch base PHY address.

Which is not the usual meaning of reg. 

> +            mdio {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                internal_phy0: phy@0 {
> +                    reg = <0>;

So given that airoha,base_smi_address defaults to 1, this is actually
address 1 on the MDIO bus?

	Andrew

