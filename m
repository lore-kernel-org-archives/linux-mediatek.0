Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98250C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6ECVnm5lgJVKodC0naisWfJUSuAnOVd88vm1FjK2XM=; b=fJuLbGOKx1gB08lLasETavX4sw
	zBcqY4ZtYHVj2xhMuRJ8C83e7z9d2jxkC6al00mNYE6Tg39gWYdptwAqlSWShrixxqChSvwOez1Xd
	B5q7jCqcDAnDW/9ie7DdTADJzb/16owUSAeRL3GpAR2VYsiS26b47s22vucUWpXWi2iyorIAh3JHa
	+uBIwCqanNra/qovZATa8xXxtBpRvt/K3QGzA5TP2yv/vLU69ED556hWex0j4eBb6mJkq+Gl7SDD2
	PQugLVJcpfhwPfkFBHxBxpfS7zRo62oaqvmBYSgOSa/FB8oTE71AopyOcgNpq7e4rHnOW0YbPgL8w
	Yb0QF8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Ag5-0050s5-1I;
	Thu, 23 Nov 2023 14:27:37 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Ag2-0050o6-0I;
	Thu, 23 Nov 2023 14:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=M6ECVnm5lgJVKodC0naisWfJUSuAnOVd88vm1FjK2XM=; b=I0uTW84KZwen/D/8drpmgWT+jO
	tsfe8n/9Ooc8sjh12y9g0EpHz4/sDdjvPgmjtt7tAS87ULOgEuYGAv/TOIiweJxQgfq1spPWwD5QW
	pcKsN9q2rzfa+vW9hMxtj0lM+4vE9SkZ8lnRpdlrQ1Mcno/YIaCvBNIzPeqOjLv1BSBE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r6AfZ-00105f-3x; Thu, 23 Nov 2023 15:27:05 +0100
Date: Thu, 23 Nov 2023 15:27:05 +0100
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
Message-ID: <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
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
X-CRM114-CacheID: sfid-20231123_062734_131273_B4C91B31 
X-CRM114-Status: GOOD (  11.72  )
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

> Just to be more precise qca807x can operate in 3 different mode:
> (this is controlled by the MODE_CFG bits)

> - QSGMII: 5 copper port

4 slots over QSGMII, plus the second SERDES is connected to the MAC
using SGMII/1000BaseX?

> - PSGMII: 5 copper port

5 slots over QSGMII, the second SERDES is idle?

> - PSGMII: 4 copper port + 1 combo (that can be both fiber or copper)

5 slots over QSGMII, with the second SERDES connected to an SFP cage.

Are ports 1-4 always connected to the P/Q SGMII. Its only port 5 which
can use the second SERDES?

Does changing between QSGMII and PSGMII really change the protocol run
over the multiplex link? The clock rate is slower, there are only 4
multiplexed slots vs five? Or does it keep using PSGMII and leaves one slot

I can see how it is messy to validate, if you only have phy-mode. So
maybe MODE_CFG is a package property. You then can validate the
phy-mode against MODE_CFG.

	 Andrew

