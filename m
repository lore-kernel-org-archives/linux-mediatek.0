Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02C6C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ianm+oK/3Nrdav46TrJiBmP/52mNqCzayho+jiWIkU=; b=qLHgcfA6R9P0a/iuXyo90yMilr
	MkkPxyAfk9ZNIDXjpBC+FUZBQBrbM6bXryag0PAML5LOvRPfIHbo7UvGgYGRCyBkwsf4fxFTMrfWJ
	OVSBrQDZrewTrRoMoJm3YYm1b0p7Co9ol35asLfwxJdikKtwB2R1b6Lxiapy8OZbMiB/HoxvZIAde
	TLHaViz0ONQ7u0+YrgJX0pHZZgUpQPfwhC43x9rhRCnxCNWFuCVprkhcLpD7tYRjqrvhpQs4TVXwR
	4aA9jlnAN9vGj81FFW6Tpa1pkO1d0mCHNSlP4ZdnedtJwjVrvw0Jo2DtYjp0J9JI3bgaibZmtWYb+
	SIcKXSIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6BIl-0056IG-25;
	Thu, 23 Nov 2023 15:07:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6BIh-0056HB-2l;
	Thu, 23 Nov 2023 15:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9Ianm+oK/3Nrdav46TrJiBmP/52mNqCzayho+jiWIkU=; b=ljBTLiaf1hJ76JNKk8LoCzMwbV
	ZcJZ6xDa65NxGWrtUcU+4hzgpRmHVIZ6Fceuf3Ba86xE0awdKaDt9XttJ7Q5OMuZ6zw8weIkusY+o
	ZacLC42AjFuLQvez3RIj8MXx51Ugy6QIp0O9ZhH0Rw5N/CQ74oOBupwnOruQ313iegow=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r6BIQ-0010N2-G5; Thu, 23 Nov 2023 16:07:14 +0100
Date: Thu, 23 Nov 2023 16:07:14 +0100
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
Message-ID: <6eb2e061-5fcb-434a-ad43-370788075597@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
 <655f2ba9.5d0a0220.294f3.38d8@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655f2ba9.5d0a0220.294f3.38d8@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_070731_917519_CEF2312A 
X-CRM114-Status: GOOD (  12.00  )
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

> compatible = "ethernet-phy-package", "qca807x-phy-package";
> 
> With "ethernet-phy-package" a must and "qca807x-phy-package" used only
> if additional property are used.
> 
> My current idea was to use select and base everything on the possible
> PHY compatible (and it does work, tested by adding bloat in the DT
> example and seeing if the schema was rejected). Had this idea since the
> compatible would never be used.

The DT people are unhappy with PHYs don't use compatibles, so
validation does not work. It probably too late to add compatibles to
very PHY driver. But this is new development work, we don't have any
history. So we can add a compatible per package to make the validation
tools work.

So for parsing the tree in the kernel we look for
'ethernet-phy-package'. For validating the tree using the yaml tools
we use the 'qca807x-phy-package'.

	   Andrew

