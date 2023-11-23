Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634E3C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfGgqTUyQW3nytRqECKvTmNuGYaEc5iawnb0wTmFF4A=; b=elzNVhj5HJwiKNwuq3KgLPgRsk
	aaXSs1uMdl+6cdWscdI9i9At4Tfr+onvmzkqOv2g5/0R+xP3x6//8cp16U3wFv+3o/xpQ7LanolGa
	SiHTV6fq/R3eXay07T9vnVjPhJN0dCOClgscu6PAB6Yhb15798N3UmMggEjD+KOJJNJikSzpl/jWU
	NDuRi9x9ijUVbfDaGo0yx9BNha75SwxOvVVjgEW8iXieXSYnD6RLQ7vJHCQwhSavdl8wG3/1JBZN1
	/ixWqeaREPpsifC9riy/whr9xSRV/44gBizhfXSiwJW2KFus2dElnqOtjwUbiS2CrC6BOtSxkT0fD
	EnSN0Ylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6B9r-0055RJ-1M;
	Thu, 23 Nov 2023 14:58:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6B9n-0055QQ-2b;
	Thu, 23 Nov 2023 14:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kfGgqTUyQW3nytRqECKvTmNuGYaEc5iawnb0wTmFF4A=; b=Y/2HyafF1/CBVlx6o7AHGy62st
	Gm9gu1nVAEutBUdDIjHMwfkLNLqbI1m1VHolp8rQW+6gOHdjpnNNuGyYCG8HuIBzE4tOLIju+dUfs
	0WMLyF7NHK2zIwS60kgXpFYwVnCE6tvex1Kf1Sxx7/N19xriJ+1Ewj/Y6SQgBieBOK8c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r6B9S-0010J5-97; Thu, 23 Nov 2023 15:57:58 +0100
Date: Thu, 23 Nov 2023 15:57:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Jie Luo <quic_luoj@quicinc.com>
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
Message-ID: <e32d5c84-7a88-4d9f-868f-98514deae6e9@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
 <655f2ba9.5d0a0220.294f3.38d8@mx.google.com>
 <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
 <ZV9jM7ve3Kl6ZxSl@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV9jM7ve3Kl6ZxSl@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_065819_849775_09EB4E33 
X-CRM114-Status: GOOD (  17.00  )
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

On Thu, Nov 23, 2023 at 02:35:31PM +0000, Russell King (Oracle) wrote:
> On Thu, Nov 23, 2023 at 03:27:05PM +0100, Andrew Lunn wrote:
> > > Just to be more precise qca807x can operate in 3 different mode:
> > > (this is controlled by the MODE_CFG bits)
> > 
> > > - QSGMII: 5 copper port
> > 
> > 4 slots over QSGMII, plus the second SERDES is connected to the MAC
> > using SGMII/1000BaseX?
> > 
> > > - PSGMII: 5 copper port
> > 
> > 5 slots over QSGMII, the second SERDES is idle?
> > 
> > > - PSGMII: 4 copper port + 1 combo (that can be both fiber or copper)
> > 
> > 5 slots over QSGMII, with the second SERDES connected to an SFP cage.
> > 
> > Are ports 1-4 always connected to the P/Q SGMII. Its only port 5 which
> > can use the second SERDES?
> 
> I think what would really help here is if there was an ascii table to
> describe the configurations, rather than trying to put it into words.

Yes.

And also for ipq4019. We need to merge these two threads of
conversation, since in the end they are probably the same driver, same
device tree etc.

       Andrew

