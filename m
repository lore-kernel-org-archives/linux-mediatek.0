Return-Path: <SRS0=bzTf=AF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9EB1C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 09:43:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 958282088E
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2020 09:43:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eGBj3o2T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMQawrP4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 958282088E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Khb2vvYTp//r6fDCKqaxYZ6uW5zRUiXIMdskywuB3zM=; b=eGBj3o2TVQamMeMuD5siHYmTg
	BsA28uLPsJgxY8NRQ4KS9OA2U/F/BlyWDnm07Qxvrs2P85dcX2fNfDnt1UBq3VlcU/prFjvL7ebAr
	5cuA2X0ObRYlu3lJF2joL3ju4rPeGJT0HY73GW6wFB+uT1DbovPTsq52NobBM/13kwXjwdfyP063o
	LwWRlCAUHoR3uhOuCK1cvBaIkajKHAmQGs9j/tM6KkIoblH1brmpkYY/BF2VFRC7WbQscNLJgAF+C
	gX1BhMiTBoIK5lPJcqAOokrG1T7ntixOJjdn6KCl3x+UkfG+bSslD6PaHtM/eDBCXj0rMmaUxcoUC
	YeHLJsf6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo1w1-0002qR-Ao; Wed, 24 Jun 2020 09:43:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo1vt-0002nd-Sw; Wed, 24 Jun 2020 09:43:06 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7102C20885;
 Wed, 24 Jun 2020 09:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592991785;
 bh=rYiMLNyH6eejq1M7FI0t8GXIQIY1y4HUlGHPYP73bvA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iMQawrP4gD/kEbaeFzV0OLvI9+7NVkmw8/GoJ2aEPtRKA/jirfzwFYy0L5Y/OzPCu
 xisKHDnJn2fl+MFySaTny0zOqs4oZxopj5XvUAjHuCdvuRhKkw4v/EbNApMnkwuGh8
 +rPE3Bwi4OtimVg+6yswW8FMP+j9M58H929pco0w=
Date: Wed, 24 Jun 2020 10:43:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 09/15] net: phy: delay PHY driver probe until PHY
 registration
Message-ID: <20200624094302.GA5472@sirena.org.uk>
References: <20200622093744.13685-1-brgl@bgdev.pl>
 <20200622093744.13685-10-brgl@bgdev.pl>
 <20200622133940.GL338481@lunn.ch>
 <20200622135106.GK4560@sirena.org.uk>
 <dca54c57-a3bd-1147-63b2-4631194963f0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <dca54c57-a3bd-1147-63b2-4631194963f0@gmail.com>
X-Cookie: So this is it.  We're going to die.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>,
 Iyappan Subramanian <iyappan@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>,
 Frank Rowand <frowand.list@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Yisen Zhuang <yisen.zhuang@huawei.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Keyur Chudgar <keyur@os.amperecomputing.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Salil Mehta <salil.mehta@huawei.com>,
 netdev@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Pedro Tsai <pedro.tsai@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: multipart/mixed; boundary="===============0877313700363721495=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0877313700363721495==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 23, 2020 at 12:49:15PM -0700, Florian Fainelli wrote:
> On 6/22/20 6:51 AM, Mark Brown wrote:

> > If the bus includes power management for the devices on the bus the
> > controller is generally responsible for that rather than the devices,
> > the devices access this via facilities provided by the bus if needed.
> > If the device is enumerated by firmware prior to being physically
> > enumerable then the bus will generally instantiate the device model
> > device and then arrange to wait for the physical device to appear and
> > get joined up with the device model device, typically in such situations
> > the physical device might appear and disappear dynamically at runtime
> > based on what the driver is doing anyway.

> In premise there is nothing that prevents the MDIO bus from taking care
> of the regulators, resets, prior to probing the PHY driver, what is
> complicated here is that we do need to issue a read of the actual PHY to
> know its 32-bit unique identifier and match it with an appropriate
> driver. The way that we have worked around this with if you do not wish
> such a hardware access to be made, is to provide an Ethernet PHY node
> compatible string that encodes that 32-bit OUI directly. In premise the
> same challenges exist with PCI devices/endpoints as well as USB, would
> they have reset or regulator typically attached to them.

That all sounds very normal and is covered by both cases I describe?

> > We could use a pre-probe stage in the device model for hotpluggable
> > buses in embedded contexts where you might need to bring things out of
> > reset or power them up before they'll appear on the bus for enumeration
> > but buses have mostly handled that at their level.

> That sounds like a better solution, are there any subsystems currently
> implementing that, or would this be a generic Linux device driver model
> addition that needs to be done?

Like I say I'm suggesting doing something at the device model level.

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7zICMACgkQJNaLcl1U
h9Ca2Af/csONj6LtRsNrXjMLjw4BGVBnwP/tZBvSxig6MizM80Yd7HzvQiUWDAQW
opLo3gkpbl+73elKt2hSf5gktte6pl5jBepYzqd54u71xWQ6bZE4U3ONtKN2Q7eb
b2CIxsthUl15y6Y+spJAGYjqB7+3JSU4j60NpuRAnH25gsxkJyokoyDQNwz3/itl
CJcvpaKru9uCPKXfk960C6SkRpX0kNfFc3yBm7yFTIMeiicFei9o/qdEBzqaRC/8
Plrsjw9hilHtWP4/3AhHXk98OGzuTzYSS78XVYRGBC58Wj7IDO+ytY5mCR7mZdtg
gZPYYA7XHRNX3252/FCJO39GTfJMCg==
=ttw3
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--


--===============0877313700363721495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0877313700363721495==--

