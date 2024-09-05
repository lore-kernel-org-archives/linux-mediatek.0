Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4214CD98FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 18:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmw+C6AGt+s2oTpqKtQzIcUC/3UDxQxltFXDb2g6ktw=; b=qeD8IpOp6ZINT7Gu9ac7NPsYnq
	NO2UyL4k4x8HNgqPDZLGBeL3h0HXwI5Wmuw90WOVO+cnqh+n+S9rSKlnhI/4m84hicGTsmr65pPpe
	+yDSUvWaZ73Sxy81rcbemFBel0DZyA1eHoxXCL8x5WDfAAJD3txZi0lJcbIlDWB8dTzXuFBJyV7c6
	cwLPkM1THBkXEM+4riZnEP5KN6WDoAX1qp7OI+8E6Tvs0DXD/iPESVE+mzwQICI3/F0Y6+Kc7sVd1
	am5jmvYngXjzNO47LU779e6Oq9UuP4HOxCDFu+rb0XfWm60bxefBSYNT2DsI+cw0f2+l6yQSjjXMG
	ZFEwX4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHRn-00000009Tv7-13NR;
	Thu, 05 Sep 2024 18:43:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHQn-00000009Tbb-0IMb;
	Thu, 05 Sep 2024 18:42:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3C01A44EDE;
	Thu,  5 Sep 2024 18:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E462CC4CEC3;
	Thu,  5 Sep 2024 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725561727;
	bh=JLzVazegeLJ+NiJYdoB5mJULvbuw17ruPjgTitRufoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F0cbN73WOD3DxYI/K0CjeWeXQd+U2po05/OERE8h+3LJsoO65AO8hdXiC5G1uW26k
	 Mr0thEzBNsosJ/XZ/MGKrcc2q5nRtKbmNN07lWaa2J/plvpbavsA5vQFfFAM4wWdcG
	 OfoBOn5tY98MNlmAvKTK+yV+h2l3A8+BUVyoWyTWQFIYsxxiYa1cnwNztDaigyURad
	 7Md/MqbqhEpRZ3vC1ibWwrh7QeHcsYKy59cpPvy8Izuzugfn2oGrsNsYq6gvgLB1ja
	 H6tuWfrXiZDfcB+A7Z89KPML8vSAp6ugE6xqJPmppgoGBvbPlErl8sR1UX5DmI4sUk
	 EKTqn0OtRTQLQ==
Date: Thu, 5 Sep 2024 19:42:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 09/12] i2c: of-prober: Add regulator support
Message-ID: <1e91439d-e8fe-4675-ac0b-03939f563bca@sirena.org.uk>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-10-wenst@chromium.org>
 <CAD=FV=UGOz3Xzg7reJKP=tA1LqTxszv5w-CL9krmoXQtXdJLaQ@mail.gmail.com>
 <CAGXv+5F27K76t=ht5v75jKsNF-J+C0r5+m=czHz6PtV3t5DxcQ@mail.gmail.com>
 <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XGG4EEhvNkYs12Vb"
Content-Disposition: inline
In-Reply-To: <CAD=FV=XVrAdQN8p9QJtt3Ah_YQAG7Y-D4wDx8_+qb1EGN7+Uig@mail.gmail.com>
X-Cookie: The horror... the horror!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_114209_263949_2A853A5E 
X-CRM114-Status: GOOD (  20.42  )
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


--XGG4EEhvNkYs12Vb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2024 at 11:14:58AM -0700, Doug Anderson wrote:
> On Thu, Sep 5, 2024 at 8:10=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:

> > This next item would be a later enhancement (which isn't implemented in
> > this series anyway):

> >   - optional prober callback that does actual probing

> > In our case it would only be used for cases where an HID-over-I2C
> > component shares the same address as a non-HID one, and some extra
> > work is needed to determine which type it is. I still need to think
> > about the structure of this.

> IMO _that_ would be a great option to the i2c prober. It feels like
> you could have an optional register read that needs to match to have
> the i2c prober succeed. Most people would leave it blank (just the i2c
> device existing is enough) but probably a single register read would
> be enough to confirm you got the right device. Most i2c devices have
> some sort of "version" / "vendor" / "id" type register somewhere.

I'm not so sure about the "most" there - it depends quite a bit on the
class of device.  This also imply that the prober would have a regmap
config as well...

--XGG4EEhvNkYs12Vb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbZ+3cACgkQJNaLcl1U
h9C98Qf/eDbxzuWN9wKXOgtyn/KGNJ9usI1DrqYUNAy7+kXpYwuywHuxw7jQX/m7
apBm7viyIeyEcsCjy7BmmPJ3Fyfqfpt/4/cvh+wFla+E/dVadH0thHf+1XHjI7sC
M6Vs/bjtPpEIAC2StD3yNUezMRQc/6KW2mlzh66rPCfE7vubfHN3xXgq5xFr402G
/m1HX2HkBqGarvXdkUgOOQuFfb/FIiKB4l+VyXwGmzAgwTeXYofMuEwfF6lPqpvX
VYgxNyAJdvImmjHthf/EFx5TDwj3tSMDYj0/qAhKrFnreXU6H1sNcAhIvv/7gyGa
+SArYn2Cah9+B40+mW2rGa619WFc7Q==
=aEkW
-----END PGP SIGNATURE-----

--XGG4EEhvNkYs12Vb--

