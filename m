Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070A4C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 14:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNJOWTUsLcLz6r4tprHVV6qtj+o+qsTlaJpsU+sB5Pw=; b=tbSr+cJ6Yu4xNrl3mfrtH+ZZ9A
	6sUKhUUsu43Yqo3vU3wxhL0NY/TDR9YDWe6QBPyt/s40K7/Wnn62MaBObJ7ahEGfp4FNvO4HszY11
	WejmfTkSylo9Dak9UdhG4RVkHzfHWOh+duZZWgrAtX4idZPYNl6ye6cx7I4ly+jfcsOeR6TmpNbDd
	qXFB8KAlyyzf4SIaCzCp/Kz0ztiM0FXLII7kng78sBy7E0TUDylC8+fHBqRganOiib+HJb6etxqmw
	bHTg9gkkecrvV3fxx52JKfYMR7cUC2B+JxpUThiGM3Q5mMx1X+r0tbJaNNuej7Bji6sx9Ss3oa2QM
	3x+yZBSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AoN-0052Pl-2Y;
	Thu, 23 Nov 2023 14:36:11 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6AoH-0052Mn-0R;
	Thu, 23 Nov 2023 14:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sNJOWTUsLcLz6r4tprHVV6qtj+o+qsTlaJpsU+sB5Pw=; b=QW2rJqd5NiwvgiZI6DPw1+5mJ3
	iyymF1DBsw9tjQu7dpwxO4eehB/450IFx+5XP2AqiqL1IiKOQ+aol4hXIyVQh0B+K6qhxQlqGOml/
	KVJN8b0mGSiC2PjSoK+2w9GFfWtF51zUxjq8upnsghavWU1V/V9dVFwCBbCq5n1ZwlPACHAVJbZsg
	5R4E2N8I+cYf5bloe37MFNG7ODxb9fx250XbAantEQd0iXU176qVuRn4kDhp0fWprt9lOTi39kfYk
	3qHBG5WF5yPihU9GvRvlxrp5kfD8ckwzPzYGJMtL0/X3E17ecuceD7W/QVDJm21y/upPNs3303kW/
	15EO1gaw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36562)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r6Anm-0001hW-32;
	Thu, 23 Nov 2023 14:35:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r6Anj-0006Hp-Lf; Thu, 23 Nov 2023 14:35:31 +0000
Date: Thu, 23 Nov 2023 14:35:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <ZV9jM7ve3Kl6ZxSl@shell.armlinux.org.uk>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
 <655f2ba9.5d0a0220.294f3.38d8@mx.google.com>
 <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_063605_174793_C1C95347 
X-CRM114-Status: GOOD (  13.79  )
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

On Thu, Nov 23, 2023 at 03:27:05PM +0100, Andrew Lunn wrote:
> > Just to be more precise qca807x can operate in 3 different mode:
> > (this is controlled by the MODE_CFG bits)
> 
> > - QSGMII: 5 copper port
> 
> 4 slots over QSGMII, plus the second SERDES is connected to the MAC
> using SGMII/1000BaseX?
> 
> > - PSGMII: 5 copper port
> 
> 5 slots over QSGMII, the second SERDES is idle?
> 
> > - PSGMII: 4 copper port + 1 combo (that can be both fiber or copper)
> 
> 5 slots over QSGMII, with the second SERDES connected to an SFP cage.
> 
> Are ports 1-4 always connected to the P/Q SGMII. Its only port 5 which
> can use the second SERDES?

I think what would really help here is if there was an ascii table to
describe the configurations, rather than trying to put it into words.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

