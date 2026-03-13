Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29155105F79B
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2026 11:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=We4xbhCLnVGWb+FeULUEnWlzdRYYUPWL5jBwuKXCQdE=; b=Wy+LCt5E94AFFjR37ZpS4CKAmX
	vRKgD86a8fSAsV5zuHsxHyj6h9HAxcT8ZvgcbUIoWjVXXCx1hYKnwpFGHP23kmFbWYzyYGGaPmmxS
	plOCfoRHW93Y6bXQvINj2CnISvAiy7sLP9tCWgwlO3YsND717NrTeJ9Uk81kUIv287Kjxtk1gVek7
	s/yhr9O/DDf+sguzllctKLI7/hCstTmgWmiUwUbaSLNXxBZAw0BjEgFbvcifi5PUJReeVva3h+rrg
	840CoIOB1pnvFBLVcFeZDNKVE0s1tYtDATdJHvdt5Vz3gHvbg5Z5oMI7R0kuTzOn8eyweK+lTZSGC
	Tj509VgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10hc-000000001sh-36ay;
	Fri, 13 Mar 2026 11:29:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10hZ-000000001s6-1RfQ;
	Fri, 13 Mar 2026 11:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 633696012B;
	Fri, 13 Mar 2026 11:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97075C19421;
	Fri, 13 Mar 2026 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773401348;
	bh=We4xbhCLnVGWb+FeULUEnWlzdRYYUPWL5jBwuKXCQdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hc3EiEhRZ459XQjJbLdmBLwVMNVL783S6CzqheN9VJdxfHy/efoHoocDgjuT/2Teg
	 dPO4Mno6qvsTahx9yPBlXH9IhUW68z6GP7G6azE4TDK5J0mSxYn6ZsPCmIU51sk7vs
	 zX//xodgRr6coA0rKDOpkVkQgcHRShX20pMP06IRVk5O1Y8inrMxAEq1Ij/ULNpXxI
	 2cOISIldv7ZgzbO7TGuVgsoYOqiWKjHrUQyL5JQetvM7tuRidRcUj53ORwskHDp5uU
	 7p/+sN7npJDPticbnDu9K5s6E28HEGslt2EK7PBCkMQF1LSnYKiUzAfToY3mGj1/vi
	 wFCmNRydPfjdw==
Date: Fri, 13 Mar 2026 12:29:05 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Remove airoha_dev_stop() in
 airoha_remove()
Message-ID: <abP1ARU0xdMUq8_e@lore-desk>
References: <20260311-airoha-remove-ndo_stop-remove-v1-1-596fe853b2e1@kernel.org>
 <20260312182128.33d2d88c@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5IoUYz3qF2Nrx8Dy"
Content-Disposition: inline
In-Reply-To: <20260312182128.33d2d88c@kernel.org>
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


--5IoUYz3qF2Nrx8Dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Wed, 11 Mar 2026 10:54:57 +0100 Lorenzo Bianconi wrote:
> > Do not call airoha_dev_stop routine explicitly in airoha_remove()
> > since it is already executed by unregister_netdev() if necessary
>=20
> This one is a fix I think? We underflow the atomic if the port
> is already down. Once again, commit message way too terse :(

Hi Jakub,

ack, I will post v2 targetting net instead of net-next improving the commit
message.

Regards,
Lorenzo

> --=20
> pw-bot: cr

--5IoUYz3qF2Nrx8Dy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCabP1AQAKCRA6cBh0uS2t
rLEVAQDiiXdm1BxS4JyeMV9BgqqOADTgmX5CNx0dAqXpb0bI2gD8D4YNYpnLwf8r
7QtzRLSdbg5A7rAQwhMMQ70zeScODQ8=
=zyl8
-----END PGP SIGNATURE-----

--5IoUYz3qF2Nrx8Dy--

