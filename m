Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403EAC61D85
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 03:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2W1eIGoN44WfeZqoSJKCknBFLhg1MSvdghZBej8Tto=; b=wc6SwKJgGZG3bD7Rts4tOXCE3c
	dpgV6UGruHi+JQm72lW3s9DjYbqsnreFKKTZ8uTaJsxNspR+fkL6kEbBHujhfZjc0MNefB/l5K33v
	dmjJlWJRr4u44yMMkaGJeUxNUs4uZklNzUhabCKXjX2a3/Gxa5ThQLcdfuxoffmmbtgvfMP8Nv2xJ
	cme/vJ74amEsd9bbMQepsoxSowzNxUiKvzQE3IDfARQj6twCMQyM8jGWLPEQCUsF0LM9IoZjFWbBt
	AUgKtbVDS0WiN4ld4TeCk5w2l14f03ZETeyV235nFubdthf4k9DQlJBbKiUtPEDDZ1kh/84n4FZMP
	tVppwb7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r60Qu-003fQ7-0a;
	Thu, 23 Nov 2023 03:31:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r60Qr-003fPU-0r;
	Thu, 23 Nov 2023 03:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=R2W1eIGoN44WfeZqoSJKCknBFLhg1MSvdghZBej8Tto=; b=41r6vZ8a0N5C3aFfaYIGG3Nt0+
	w3Wk45OWIBchNx7QWgxcgGk46uyazknOwo6LSarraXU0NkFLrQhUmbSFQejl4OYdVtn+LZGZlV1Zk
	r/YlMNC4pQdIepOfwnD2IWi1WitSCbjq3+02JW0KXua8igRoE0YY8hYTujInIJaLRFC8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r60QS-000wAv-CM; Thu, 23 Nov 2023 04:30:48 +0100
Date: Thu, 23 Nov 2023 04:30:48 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_193113_311299_B3DBA671 
X-CRM114-Status: GOOD (  43.05  )
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

On Wed, Nov 22, 2023 at 07:32:22PM +0100, Christian Marangi wrote:
> On Tue, Nov 21, 2023 at 03:45:42PM +0100, Andrew Lunn wrote:
> > > > I do think we need somewhere to put package properties. But i don't
> > > > think phy-mode is such a property. At the moment, i don't have a good
> > > > example of a package property.
> > > 
> > > What about power supplies and reset/enable lines?
> > 
> > Yes, good point. I can imagine some packages sharing regulators. Reset
> > might also be shared, but it makes things messy to handle.
> >
> 
> Sooooo.... Sorry if I insist but I would really love to have something
> ""stable"" to move this further. (the changes are easy enough so it's
> really a matter of finding a good DT structure)
> 
> Maybe a good idea would be summarize the concern and see what solution
> was proposed:
> 
> Concern list:
> 1. ethernet-phy-package MUST be placed in mdio node (not in ethernet,
>    the example was wrong anyway) and MUST have an addr
> 
>    Current example doesn't have an addr. I would prefer this way but
>    no problem in changing this.
> 
>    Solution:
>      - Add reg to the ethernet-phy-package node with the base address of
>        the PHY package (base address = the first PHY address of the
>        package)

Yes.

>        We will have a PHY node with the same address of the PHY package
>        node. Each PHY node in the PHY package node will have reg set to
>        the REAL address in the mdio bus.

Basically Yes. I actually think the first sentence is not 100%
correct. It could be all the package configuration registers are in
the base address, without an actual PHY. The PHYs then follow at
addresses above it. I can also imagine a case where the first PHY in
the package is not used, so its not listed at all. So i think it
should be "We often have a PHY node with the same address of the PHY
package node."

> 3. phy-mode is problematic.
> 
>    It's an optional value to enforce a specific mode for each PHY in the
>    package. For complex configuration the mode won't be defined.
> 
>    Solution:
>     - Rename it to package-phy-mode to make it less confusing.
> 
>     - Add an additional function that PHY package can use to make custom
>       validation on the mode for every PHY attached (in the PHY package).
> 
>       Would make it less clear but more flexible for complex
>       configuration. Maybe both solution can be implemented and the
>       special function is used if the mode is not defined?

The description you give is that there are two SERDES, and both could
be connected to a MAC. What does package-phy-mode represent then? 

Luo Jie patch for the qca8084 seems to have the same issue. It has two
SERDES/PMA, and both could be connected to the MACs. So it seems like
QCA devices don't actually fit this model. If we want to describe the
package link mode, we probably need to list each PMA, and have a
property in the PMA node indicating what link mode the PMA is
operating at.

At least for the moment, its not clear we actually need this at
all. It seems like the phy-mode is all we need. The PHY driver should
know what values are valid per port, and so can validate the value.

> 4. Not finding a correct place to put PHY package info.
> 
>    I'm still convinced the mdio node is the correct place.
>    - PHY package are PHY in bundle so they are actual PHY
>    - We already have in the mdio node special handling (every DSA switch
>      use custom compatible and PHY ID is not used to probe them
>      normally)
>    - Node this way won't be treated as PHY as they won't match the PHY
>      node name pattern and also won't have the compatible pattern for
>      PHY.

We do need a compatible for the package. The kernel is unlikely to use
it, but the validation tools will. Each package can have its own DT
properties, so we need a .yaml to describe those properties. So i
would expect to have a "qca807x-package" compatible, which then lists
the tx driver strength etc. The PHYs within the package don't need
compatible, they are just linux PHYs, probed using the same code as
PHYs outside of a package.

    Andrew

