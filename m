Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF03C83F14
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rsg+3I5nwAao024D777CO27I/mKvRlEcVFmehdDKmio=; b=atxbOTHSTRWdHy4jvK3lyKY1Jn
	ciHypXtp9nnTI0r/SYW8ifRWT7dtlKvRM241LTus9/GFL31cZBdWHeGaUdypu4CyycUMRIqGDouVg
	0y/fISVmdvOnPhLRx7RwuSb8EBoONH21mUgSk966sBVsOvwpCnBnkR8kpfLWuW4IFS9l+8tcltBNK
	h07kfIiGGquS0IriKyPV7wwCIKCkRkKsm6wq0fkcQN3CteE7ClfxUP4+g3igPJtM6lzktHB2nC2ke
	4hohgKqeR/GdjIBO0ZAvQ51bN2NnWHnVbIqnEQqgGd7yEWpxZTbpsF66sHeyc1jhHsD4o6CC1xwHA
	VOkhu8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qayeJ-00BZpZ-01;
	Tue, 29 Aug 2023 13:20:51 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qayeE-00BZoH-10;
	Tue, 29 Aug 2023 13:20:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1693315246; x=1724851246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rsg+3I5nwAao024D777CO27I/mKvRlEcVFmehdDKmio=;
  b=pP1Sljrz3MapOtxBk3CDboSOonTr61oYEj4oqU7Qr5pl5rIJ4JQxJ/j6
   v9svQw8jzeJd7Pgr2Ls4tC6Bk/qfv7UlByx5UWGeiVT+B3SPlT5qMFUAx
   gwYKHZsAT/55eGwMojpcPafIpOslDBf90+W8J4zU38RTp7HVZJon9btnH
   dsgchi7TvZxDyIdNtRGh9V8NItwSTS1gi2KwwjwaQ10evokK5zextfpMV
   tFAzLhogaeqTSXVnU74U7ca3Oe/61SFof73YtZ5Uk50DX5JwMQ/ZbnIUr
   /+YGXvRP4XAIYg0pZt1TTffxIUAcn4OkY9dpJQo1EXpw6RwGYOogEUy3N
   g==;
X-IronPort-AV: E=Sophos;i="6.02,210,1688421600"; 
   d="scan'208";a="32678579"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 29 Aug 2023 15:20:43 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 65E39280045;
	Tue, 29 Aug 2023 15:20:43 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Feiyang Chen <chenfeiyang@loongson.cn>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.
 delregno@collabora.com>, linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: clarify difference between "interface" and "phy_interface"
Date: Tue, 29 Aug 2023 15:20:43 +0200
Message-ID: <5966848.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ZO3uUIFgtkIHHqjL@shell.armlinux.org.uk>
References: <E1qZq83-005tts-6K@rmk-PC.armlinux.org.uk> <12274852.O9o76ZdvQC@steina-w> <ZO3uUIFgtkIHHqjL@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_062046_734042_5E402B2A 
X-CRM114-Status: GOOD (  19.17  )
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

Am Dienstag, 29. August 2023, 15:10:40 CEST schrieb Russell King (Oracle):
> On Tue, Aug 29, 2023 at 02:38:33PM +0200, Alexander Stein wrote:
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c index
> > > ff330423ee66..35f4b1484029 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > > @@ -419,9 +419,9 @@ stmmac_probe_config_dt(struct platform_device *pd=
ev,
> > > u8
> > > *mac) return ERR_PTR(phy_mode);
> > >=20
> > >  	plat->phy_interface =3D phy_mode;
> > >=20
> > > -	plat->interface =3D stmmac_of_get_mac_mode(np);
> > > -	if (plat->interface < 0)
> > > -		plat->interface =3D plat->phy_interface;
> > > +	plat->mac_interface =3D stmmac_of_get_mac_mode(np);
> > > +	if (plat->mac_interface < 0)
> >=20
> > This check is never true as mac_interface is now an unsigned enum
> > (phy_interface_t). Thus mac_interface is not set to phy_interface
> > resulting in an invalid mac_interface. My platform
> > (arch/arm64/boot/dts/freescale/imx8mp- tqma8mpql-mba8mpxl.dts) fails to
> > probe now.
>=20
> Thanks for catching that. Does this patch fix it for you?
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c index
> 231152ee5a32..0451d2c2aa43 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -420,9 +420,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, =
u8
> *mac) return ERR_PTR(phy_mode);
>=20
>  	plat->phy_interface =3D phy_mode;
> -	plat->interface =3D stmmac_of_get_mac_mode(np);
> -	if (plat->interface < 0)
> -		plat->interface =3D plat->phy_interface;
> +
> +	rc =3D stmmac_of_get_mac_mode(np);
> +	plat->interface =3D rc < 0 ? plat->phy_interface : rc;

I need to use plat->mac_interface on top of your patch. But despite that th=
is=20
fixes the probe error.

Thanks and best regards,
Alexander

>=20
>  	/* Some wrapper drivers still rely on phy_node. Let's save it while
>  	 * they are not converted to phylink. */


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



