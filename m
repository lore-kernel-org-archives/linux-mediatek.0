Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF4AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 13:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jh3/teTJajhpKoVWo8hSHtWjQtcJdZ5ow264nmRu4v4=; b=gXzrKMAopbx5iUTazc/EciEN1s
	YXxJUrY/y9GzDF1ICMG2nPdAaOOp0OLDY6vQHUhP136CkG+33mzzLJnN4IyP19qavRbR1AV4Ycmmc
	jmxupGREaRnw4NeNBlKjUtbx6OlnTu8RIjBwJZkE+fCt/LWbWUcw5oVotZ4tCA8N1twwKVTqNGblZ
	l553LloYkCuuzC/xmV9Nrg6YImpotVR14uI3HsfNfZ5GlFGBn88qz2ZlORfI7zaIKVd95yFN4xXpj
	z3ffdK43pGpSh3I4wazgCnaTvYnsOVs4w+zLnPFIdWUeHkb8tExE6hftGU3jigFyxmcCTfsUMytYS
	qa4B2VIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEsJ4-004hjv-3M; Fri, 22 Jul 2022 13:03:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEsFu-004ey7-AC; Fri, 22 Jul 2022 12:59:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9C1FB61F98;
	Fri, 22 Jul 2022 12:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466A1C341C6;
	Fri, 22 Jul 2022 12:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658494785;
	bh=BKrizWV96d8+rZwIec8s+GHsD43ct+a/ytonnY3af3Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TAIxnlQx4527e7gKVxmMg1IyqHmGp7XRatUsqJ/ANbfat2x0Ad5ap6wHnp2dNfFrb
	 DYmhQmD0xL3CkWfA0X/VTddr/NosMCBZG7KXgUSNcb7WRDdeAp/I2YkzYYSiOu+n7Y
	 V2cTtfkce9tmYGi3lYZqZPdjjHLxdbW8NbScXEcdh+5Hs0NZoeIjViekvD/r/cgxOR
	 CgGDDglgNry2vcNHljiUSez3IS+uKG/G4sXv/rH5twGAFaYilVJoXWYczvPDhdKu6f
	 jrp213JC37jLfc9Lvflko5MHOE5Ftw7xIYeeBxE9R9yCj53RMKI/kpr/bChYDb21me
	 /AbxW+iqz3aFA==
Date: Fri, 22 Jul 2022 14:59:36 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alvin __ipraga <alsi@bang-olufsen.dk>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Daniel Scally <djrscally@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Jakub Kicinski
 <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, Landen Chao
 <Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <20220722145936.497ac73f@dellmb>
In-Reply-To: <20220721182216.z4vdaj4zfb6w3emo@skbuf>
References: <20220716105711.bjsh763smf6bfjy2@skbuf>
	<YtKdcxupT+INVAhR@shell.armlinux.org.uk>
	<20220716123608.chdzbvpinso546oh@skbuf>
	<YtUec3GTWTC59sky@shell.armlinux.org.uk>
	<20220720224447.ygoto4av7odsy2tj@skbuf>
	<20220721134618.axq3hmtckrumpoy6@skbuf>
	<Ytlol8ApI6O2wy99@shell.armlinux.org.uk>
	<20220721151533.3zomvnfogshk5ze3@skbuf>
	<20220721192145.1f327b2a@dellmb>
	<20220721192145.1f327b2a@dellmb>
	<20220721182216.z4vdaj4zfb6w3emo@skbuf>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_055946_465071_6CAAD706 
X-CRM114-Status: GOOD (  21.79  )
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

On Thu, 21 Jul 2022 21:22:16 +0300
Vladimir Oltean <olteanv@gmail.com> wrote:

> On Thu, Jul 21, 2022 at 07:21:45PM +0200, Marek Beh=C3=BAn wrote:
> > Marvell documentation says that 2500base-x does not implement inband
> > AN. =20
>=20
> Does Marvell documentation actually call it 2500base-x when it says it
> doesn't support in-band autoneg?

Yes, it does.

> > But when it was first implemented, for some reason it was thought that
> > 2500base-x is just 1000base-x at 2.5x speed, and 1000base-x does
> > support inband AN. Also it worked during tests for both switches and
> > SOC NICs, so it was enabled.
> >=20
> > At the time 2500base-x was not standardized. Now 2500base-x is
> > stanradrized, and the standard says that 2500base-x does not support
> > clause 37 AN. I guess this is because where it is used, it is intended
> > to work with clause 73 AN somehow. =20
>=20
> When you say 2500base-x is standardized, do you mean there is a document
> somewhere which I could use to read more about this?

IEEE Std 802.3cb-2018: Amendment 1: Physical Layer Specifications and
Management Parameters for 2.5 Gb/s and 5 Gb/s Operation over Backplane.

Annex 127A (informative): Compatibility of 2.5GBASE-X PCS/PMA with
1000BASE-X PCS/PMA running 2.5 times faster

  ...
  This annex discusses the restrictions when operating 2.5GBASE-X
  PCS/PMA with a 1000BASE-X PCS/PMA link partner running 2.5 times
  faster. Compatibility of the PMD is outside the scope of this annex.
  In this annex when 1000BASE-X PCS/PMA is referred to, the 2.5 times
  speed up is implied.
  ...
  The 2.5GBASE-X PCS does not support Clause 37 Auto-Negotiation.
  Hence, the 1000BASE-X PCS is expected to have its Clause 37
  Auto-Negotiation functionality disabled so that the /C/ ordered set
  will not be transmitted. If a 2.5GBASE-X PCS receives /C/ ordered
  set, then undefined behavior may occur.
  ...

Marek

