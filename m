Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAF9C197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 20:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIArtSu73qZ+pj+BkJUnVf1olPkA9bvYl7JJi8jdX28=; b=0OeX32mCQB9Wid1bnX9ijWjx/O
	2QF0ptJj2y8gNfcSnpWhyfjg2SRK0Y+EnE79quOjVeSYQek8UNjstYy6+79+2+R35NIlxsVgDAlFt
	IoQDQ9kEiBIdAnNX8ofMUTH5oLJJllW3zG25tn0mwxzZRXOGrf9D3gzOxLeo2PZkAQORx0cmYlMzN
	B0W3HF8r8rp6pMWIyFKtOavGQJsRm+RjTS5pX7ULzNkSJ0ysRiyeFQo+uU6WDAQHNY19aeYHppzix
	bj4EgSORbb9+gab1MAv0apmSEikVH8Mq4K8Y+JrE+ZpQ5pL45TwkxVutKsr0+A+nzqA8c4mFdbZCr
	kRGkkj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5B9D-00Eo3x-1f;
	Mon, 20 Nov 2023 20:45:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5B9A-00Eo3K-31;
	Mon, 20 Nov 2023 20:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sIArtSu73qZ+pj+BkJUnVf1olPkA9bvYl7JJi8jdX28=; b=AYT5n4zN8bXBGmQ+Er5Mry3+6Y
	skGsDer8az7og+mM5vEveX7ts+gG6IH3Z3t4rRRHXtmY06hEc20reo5sZU2Nf9YacW5BfJzEwcIaw
	M8K1Sr9GuVaArcJMEufbd3Yt88zWjrY+YwzEBb2Tbu6ZI7HuGYAqhgE6dmHbO3ddZpyyR3N5RjkLK
	6B1QPAzmMcbwNmnNavKVNQ67iKvfuQIMec8g0e4uC1Y6MV/wyWuDj2bjIfbcVqg2lwMMdz5MOIhMl
	vHEMZ0V/g8YPzw3U4g05S7Rz+yMjzYWyB08eN4wt7aTH72AHqfKBv8KxNA81qEWoLdiavjINqtMOE
	EfhyZ7bg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5B95-00B7CT-2P;
	Mon, 20 Nov 2023 20:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sIArtSu73qZ+pj+BkJUnVf1olPkA9bvYl7JJi8jdX28=; b=yuT8rGT0TTi4VPzDs6M2tW4+WD
	t30M18tp5flsnRnUYv0P085yVZDhzSKt6/kQdYDCH5cy2zQMSZ8DTp7v66dUeDdQVEETNn0QxSktR
	NxU60V3wCYit/jTCg0cdTlQVb8Fwyhu8m5Ecqct7NMmQ19I4zPSWZD1sZXTlmaP7DVEA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5B8c-000gjh-WD; Mon, 20 Nov 2023 21:44:59 +0100
Date: Mon, 20 Nov 2023 21:44:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120135041.15259-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_204529_368763_0F5DFD2E 
X-CRM114-Status: GOOD (  21.87  )
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

On Mon, Nov 20, 2023 at 02:50:30PM +0100, Christian Marangi wrote:
> Document ethernet PHY package nodes used to describe PHY shipped in
> bundle of 4-5 PHY. These particular PHY require specific PHY in the
> package for global onfiguration of the PHY package.
> 
> Example are PHY package that have some regs only in one PHY of the
> package and will affect every other PHY in the package, for example
> related to PHY interface mode calibration or global PHY mode selection.

I think you are being overly narrow here. The 'global' registers could
be spread over multiple addresses. Particularly for a C22 PHY. I
suppose they could even be in a N+1 address space, where there is no
PHY at all.

Where the global registers are is specific to a PHY package
vendor/model. The PHY driver should know this. All the PHY driver
needs to know is some sort of base offset. PHY0 in this package is
using address X. It can then use relative addressing from this base to
access the global registers for this package.
 
> It's also possible to specify the property phy-mode to specify that the
> PHY package sets a global PHY interface mode and every PHY of the
> package requires to have the same PHY interface mode.

I don't think it is what simple. See the QCA8084 for example. 3 of the
4 PHYs must use QXGMII. The fourth PHY can also use QXGMII but it can
be multiplexed to a different PMA and use 1000BaseX, SGMII or
2500BaseX.

I do think we need somewhere to put package properties. But i don't
think phy-mode is such a property. At the moment, i don't have a good
example of a package property.

> +examples:
> +  - |
> +    ethernet {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ethernet-phy-package {
> +            compatible = "ethernet-phy-package";
> +            #address-cells = <1>;
> +            #size-cells = <0>;

You have the PHYs within the Ethernet node. This is allowed by DT, for
historic reasons. However, i don't remember the last time a patch was
submitted that actually used this method. Now a days, PHYs are on an
MDIO bus, and they are children of that bus in the DT representation.
However you represent the package needs to work with MDIO busses.


    Andrew

---
pw-bot: cr

