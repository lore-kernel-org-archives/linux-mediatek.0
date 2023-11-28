Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BF0C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 00:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ns3R255gsALDi2Q2TyvQsGBPXsb0MIEuzdoPy5X6KnI=; b=YCQsC0O3zmgvgDh03gpXzALf/1
	nAnk7bvi+LSztl4FJBslNRwyrvf7rsMMZDUPzhM7ew0mDBa9SXgAn6fC5bv3ztnKgTIaZiSKiYocp
	x6y4vofwdHROyEcq+2sY3UTUG+c5xIUsbQ09AwtTPtXr9xb97nr64yu1ezU5boZbG7AXLoL7NJMCY
	9itI7G4tPFgAEcai2mvuqZvqQusBGc6Mn6MtLskTEF/Cn8i27bgNVEAOL+yLlVz+1gZo+4WN+hVzg
	56UqeOdCq9Ya4XLj4uf9xeiHD2Li5kMRQSouRVFvE6xIy5CG0NPV+76qhYPRXeSdUGf7SOyXiL8aj
	pRIqJ53A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7lff-003ihI-38;
	Tue, 28 Nov 2023 00:09:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7lfd-003igO-0U;
	Tue, 28 Nov 2023 00:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ns3R255gsALDi2Q2TyvQsGBPXsb0MIEuzdoPy5X6KnI=; b=HnwPnhLtC1NJ6kLr+65/SGM542
	v59VSZsTZ7cRCCvbFw41KMq0xkqFLbduLGZ4qO5R3PnQ3Wm/G5Vd/vcR5CXbWVc8vbiTdq4W1WT4L
	Ke6HQCCTY50pF+kV4hyxACfpkCj4yw+AV42r3oz4N9T3oJPI5wx8xRTDIQoX1NBaN7Cs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r7lfO-001OlF-5C; Tue, 28 Nov 2023 01:09:30 +0100
Date: Tue, 28 Nov 2023 01:09:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rob Herring <robh@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 1/8] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <afacaa4c-c3b1-41ae-aa14-d91efd6ac2d3@lunn.ch>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-2-ansuelsmth@gmail.com>
 <20231127221611.GA4023452-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127221611.GA4023452-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_160945_203906_4EB8ED7F 
X-CRM114-Status: GOOD (  17.43  )
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

> > +    description:
> > +      The base ID number for the PHY package.
> > +      Commonly the ID of the first PHY in the PHY package.
> > +
> > +      Some PHY in the PHY package might be not defined but
> > +      still exist on the device (just not attached to anything).
> > +      The reg defined in the PHY package node might differ and
> > +      the related PHY might be not defined.
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> 
> You are implementing a secondary MDIO bus within this node. It needs a 
> $ref to mdio.yaml instead of defining the bus again implicitly.

This is where i think this is questionable. It is not implemented in
the kernel as a secondary bus. The devices within this container are
just devices on the MDIO bus. The value of reg inside the container
and outside the container refer to the same bus.

However, i do agree about referring to mdio.yaml inside the container.

> > +patternProperties:
> > +  ^ethernet-phy(@[a-f0-9]+)?$:
> > +    $ref: ethernet-phy.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    mdio {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ethernet-phy-package@16 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            compatible = "ethernet-phy-package";

Christian, this needs a specific compatible to the
package. e.g. 'qca807x-package', and that needs its own .yaml file
indicating what properties this package can have.

	   Andrew

