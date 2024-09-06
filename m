Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D17CE7B1E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 14:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Cc:Subject:To:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qnqI7iOnahE62SwXPzzltBMUvAsobCRUbQrRW5Muk8=; b=JYxAbGp/x4ysGCxfkxdzgZ5iDs
	TwAQZESRgw4yEzooXleJF1jEUhl3yMJUd2zaxcMNrRoUQ3dL/gIxNx86prvgKoF6abqJHFihAqdHq
	oTg8xhoabH+GM/W26QXPPu2kq9N9gCKF8CwbIJkAlxs9of4fUEjSI1LGUDEwDS2fug+IvsEILVErB
	Rpm+NxsXV32YNki4l23nRt0BnuYLD4q6lFSdvChePxTfzk4JXXauEeQ0raN1rbvf7HgNyqvsOsRQX
	g6JgkfvIounMJIBEG61PpGzjZ5Y4MT5WQgRPC8+nHCXV5OwJsp96ZqOUn3EM2NWE1sR2w2wvm0CsE
	T3WRJuxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sma8o-0000000CZwY-2bZ7;
	Fri, 06 Sep 2024 14:40:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sma2f-0000000CYO8-2Y09;
	Fri, 06 Sep 2024 14:34:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CB682A4505B;
	Fri,  6 Sep 2024 14:34:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48836C4CECB;
	Fri,  6 Sep 2024 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725633267;
	bh=GJhdh1KL6sQuQwMV3OtKllaFyTdDwk8Rn9pISls1GlQ=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=Oeodf737b6AFFx4Kr6GnO9BnmgcUssKIwZ8gGfjzhQP1O55srkqsQQfstsM5EEn0O
	 2ZZXS4n6Cdw/xQlH9EtlcuhlHktS1nkTpHONG6XeEYcyWth+4jQHIwxUgZtbSoylsj
	 wZ11yX2W0pJ9kUiQlBq0MWEUpjbssT+k26gveVgOts2HgiGjQXfNe3axfNAJ/hSDK4
	 1hgpkQzCc5BolbX5xQoDa3P0ptOMKBWGvnyOK7vbghZ2c7RILpbidDSzjrwC+Z7Kh8
	 dUDoWHlRMweBEbae6rkOrHIf/v83537Ushy91usqBZ+D2eB+3UgfgHC1STX5ITeKFl
	 m4+dSUdMxZPhw==
Content-Type: multipart/signed;
 boundary=e8ad010c817a911994476ecdfdd40bb8fa6aeac4a7fb87b11405e936193a;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 06 Sep 2024 16:34:23 +0200
Message-Id: <D3Z9XTBHSUEN.2GW0UCIPLR6HY@kernel.org>
To: "Daniel Semkowicz" <dse@thaumatec.com>
Subject: Re: [PATCH 09/20] drm/bridge: tc358775: remove complex vsdelay
 calculation
Cc: "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sam Ravnborg"
 <sam@ravnborg.org>, "Vinay Simha BN" <simhavcs@gmail.com>, "Tony Lindgren"
 <tony@atomide.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
 <20240506-tc358775-fix-powerup-v1-9-545dcf00b8dd@kernel.org>
 <CAHgnY3=KCD4gyJ4nL6nN1tvWcsiRQL+Oz11RNOniDdyMoEPcSg@mail.gmail.com>
In-Reply-To: <CAHgnY3=KCD4gyJ4nL6nN1tvWcsiRQL+Oz11RNOniDdyMoEPcSg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_073430_014417_3CC39AC7 
X-CRM114-Status: GOOD (  21.34  )
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

--e8ad010c817a911994476ecdfdd40bb8fa6aeac4a7fb87b11405e936193a
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Daniel,

> > To cite the datasheet on VSDELAY:
> >   During DSI link speed is slower than that of LVDS link=E2=80=99s, dat=
a needs
> >   to be buffer within 775XBG before outputting to prevent data from
> >   underflow. Register field VPCTRL[VSDELAY] is used to for this purpose
> >
> > This driver assumes that the DSI link speed is the pixel clock (as does
> > every DSI bridge driver), after all the LVDS clock is derived from the
> > DSI clock. Thus we know for a fact, that the DSI link is not slower tha=
n
> > the LVDS side. Just use the (sane) default value of the bridge and drop
> > the complicated calculation here.
>
> I am not convinced this is a good idea to revert to a default
> VSdelay value. I tested your patch series with RK3399 platform
> and default value (5) was not enough there. There was small data
> underflow visible, resulting in display offset. Removing this patch
> and using the original calculation formula fixed the problem.
> The calculated VSDELAY value seems to be a lot bigger than required,
> but keeps us on the safe side.

Did you use just parts of this series or did you port the "lp11
notify" mechanism to the rk3399 platform? Please keep in mind, that
this bridge doesn't really work if the reset isn't deasserted during
lp-11 mode and lots of odd things happen.

Also, do you know if you have an EEPROM attached to the bridge or
does any firmware part initialize that bridge?

> It looks that hback-porch value for panel is used also on DSI link,
> effectively delaying hactive data delivered to TC358775 bridge.
> I suspect this causes the requirement for higher VSDELAY.

It was ages ago since I've worked on this bridge and extensively
tested and even measured and decoded the DSI link and the LVDS
stream. But IIRC this delay was only to compensate the difference
between the DSI clock and the LVDS clock, that is, if you push the
pixel stream slower into the bridge than the bridge is pushing it
out to the LVDS panel.

So the back porch should be irrelevant here (?!).

-michael

--e8ad010c817a911994476ecdfdd40bb8fa6aeac4a7fb87b11405e936193a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZtsS8BIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jrSQF/dh0L7uqo4iFgWteWoYgl5oebRy9RWFyV
GIMN9nOpNVjk4Qk35Rw5AMwTJ2loI9hGAX9gKMZj5wZtErKpKvkIAqbL0vCimlYi
c9LSAvT6UG+2c6Fu/Fb0C0Cu0idGKpxaoCU=
=Ydxr
-----END PGP SIGNATURE-----

--e8ad010c817a911994476ecdfdd40bb8fa6aeac4a7fb87b11405e936193a--

