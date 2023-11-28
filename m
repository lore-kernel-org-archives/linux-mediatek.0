Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87D1C07E97
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 00:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rCiSJ0JteV9fXbkXFk1duODECuXLFBCy7Ih056e2Wc=; b=qsFAkpTZHtpnPOt64rCmVWlz2m
	/JiQX9UQSO5jWMjl+o4WmtRCAiOCAz7lYcFEOmABZM5bnA/dE8Zq18AHS35mZOyDoFZwdz2HSRf4R
	2wjgvdtmeE90euZhIiHmLW8FKB9V0Dbn/llYD/5buVxmsIGmVT7qSJvumeko9UukxN8COb7EcRiLs
	8yrr852/XcF7kSPwmt/thA+JiUiCl+0yC3WIDBNczLIFB/LkTROmghM9LN6WheQYr5IGX8qO/fzCM
	avU0iTIDwHih+tqUlZtplO57mzknU+1U53QBgmHrICGJlB6P70GhiIRohiHq4SvUNdNE6C9QO/MdX
	e1R7kUbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7lpv-003jT0-2a;
	Tue, 28 Nov 2023 00:20:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7lps-003jSS-0Z;
	Tue, 28 Nov 2023 00:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3rCiSJ0JteV9fXbkXFk1duODECuXLFBCy7Ih056e2Wc=; b=hW0dZeRHACO/frHZ9YnX3eoLtx
	ZG4ktbt2J7QdboYO3eTqrtkBibe95L41acOPNsXyHMn18Tcb4nOT/FUxsSZ4TCrDrEGGdm3h96IKk
	dUWHSEb2dcLSLRLxSlaIuQDe25Ra/l8MSE+VbSNVoGi8Q3oHYvX4dFWWcxVE1XmvLONU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r7lpj-001OoV-D5; Tue, 28 Nov 2023 01:20:11 +0100
Date: Tue, 28 Nov 2023 01:20:11 +0100
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 0/8] net: phy: Support DT PHY package
Message-ID: <a29b1106-87a6-4ea2-bb1d-9858f9ab425b@lunn.ch>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126015346.25208-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_162020_219288_E4F24BDF 
X-CRM114-Status: GOOD (  23.38  )
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

On Sun, Nov 26, 2023 at 02:53:38AM +0100, Christian Marangi wrote:
> This depends on another series for PHY package API change. [1]
> 
> Idea of this big series is to introduce the concept of PHY package in DT
> and generalize the support of it by PHY driver.
> 
> The concept of PHY package is nothing new and is already a thing in the
> kernel with the API phy_package_join/leave/read/write.
> 
> The main idea of those API is to permit the PHY to have a shared global
> data and to run probe/config only once for the PHY package. There are
> various example of this already in the kernel with the mscc, bcm54140
> mediatek ge and micrle driver and they all follow the same pattern.
> 
> What is currently lacking is describing this in DT and better reference
> the PHY in charge of global configuration of the PHY package. For the
> already present PHY, the implementation is simple enough with only one
> PHY having the required regs to apply global configuration.
> 
> This can be ok for simple PHY package but some Qcom PHY package on
> ""modern"" SoC have more complex implementation. One example is the PHY
> for qca807x where some global regs are present in the so-called "combo"
> port and everything about psgmii calibration is placed in a 5th port in
> the PHY package.
> 
> Given these additional thing, the original phy_package API are extended
> with support for multiple global PHY for configuration. Each PHY driver
> will have an enum of the ID for the global PHY to reference and is
> required to pass to the read/write function.

Please update the text. As far as i see, a lot of this is not relevant
for this patch set. phy_package_join() etc has no relation to DT,
since the driver knows how many devices are in its package, it knows
its base address, etc.

The DT is only about properties which are shared by all PHYs within
the package, e.g reset, regulators, maybe the MODE_CFG register for
this particular PHY package.

> 
> On top of this, it's added correct DT support for describing PHY
> package.
> 
> One example is this:
> 
>         ethernet-phy-package@0 {
>             compatible = "ethernet-phy-package";

This needs a compatible for this particular PHY package.

>             #address-cells = <1>;
>             #size-cells = <0>;
> 
>             reg = <0>;
>             qcom,package-mode = "qsgmii";

This property it not useful. Why PCA does it apply to, when there are
two? It makes much more sense to describe the overall configuration
mode, from which you can derive what interface mode each port should
be using, and thus validate the phy-mode in DT.

   Andrew

