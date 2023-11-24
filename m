Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD75FC61DF4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 18:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwmyJG9vbp3QOEoifoxISsT4fXojTNtLKYVLH+21FeI=; b=AmilBD5VAOqNF83NPTszHF0Qqk
	YtRDqV7eOkUFBoW2BkJUXN66Hx0Eg6AKm2BQsSaA5sdl0N10nt3qpeFM4LHUF06sHTSnS8WfbuPGZ
	unE6c6EXQc6Ne8VrljFF2vKzpF/1QNAKnYhvA8+cGiS9lcHI+u5AiyLRQwal8IzxFdkvUOORysNKE
	QjA283DhB7A97G/HZvMdrLawQlgHd1tJZmN3iVbHb8gdcJCAoFM1+re1sOLcZrIdNDSvtACp63kTM
	HyPi9vguYB476gkkw+PFAj5BpKso06487Q3mkFAOdI7xBbclAn7qisNHAldo0B+KWr17DV95uMWEv
	SVr/jp+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6b29-007t4h-18;
	Fri, 24 Nov 2023 18:36:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6b26-007t3a-0a;
	Fri, 24 Nov 2023 18:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gwmyJG9vbp3QOEoifoxISsT4fXojTNtLKYVLH+21FeI=; b=hQEe5os3F07048ijAtiZMvGGWh
	ZZmKad7TP8b2Xydt3N25pbnMjju/0738kGnsfpBCSSuZKnEnY5eSG8fzNl6FXigNaf5UzWr+EIasK
	8pLW/BaSuzKc/VrixnHCEr8hzWFrDhJE6USIRDu5odK2ahnDzPXwMEnM6Zo7NSK1vFxU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r6b1b-0017zc-6B; Fri, 24 Nov 2023 19:35:35 +0100
Date: Fri, 24 Nov 2023 19:35:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <b8981dc4-5db0-4418-b47d-3e763e20beac@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <20231124165923.p2iozsrnwlogjzua@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231124165923.p2iozsrnwlogjzua@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_103606_219472_65324664 
X-CRM114-Status: GOOD (  16.17  )
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

> I think you are hitting some of the same points I have hit with DSA.
> The PHY package could be considered an SoC with lots of peripherals on
> it, for which you'd want separate drivers.

At least at the moment, this is not true. The package does just
contain PHYs. But it also has some properties which are shared across
those PHYs, e.g. reset. 

What you describe might become true in the future. e.g. The LED/GPIO
controller is currently part of the PHY, and each PHY has its own. I
could however imagine that becomes a block of its own, outside of the
PHY address space, and maybe it might want its own class LED
driver. Some PHYs have temperature sensors, which could be a package
sensor, so could in theory be an individual hwmon driver. However,
i've not yet seen such a package.

Do we consider this now? At the moment i don't see an MFD style system
is required. We could crystal ball gaze and come up with some
requirements, but i would prefer to have some real devices and
datasheets. Without them, we will get the requirements wrong.

I also think we are not that far away from it, in terms of DT, if you
consider the later comments. I suggested we need a phy package
specific compatible. At the moment, it will be ignored by the kernel,
the kernel does not need it, it probes the PHYs in the current way,
using the ID registers. But it could in future be used to probe a real
driver, which could be an MFD style driver. We need to see updated DT
binding examples, but i don't see why we cannot slot it in at a later
date.

	Andrew

