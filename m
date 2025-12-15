Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DE6D5B172
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Dec 2025 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxGuhzzENL2/jmnIvpsLOTktbSkGH0gOmyfnscBlOiI=; b=FWU3MNi2jTdnlrLGrDQVTlGdX7
	W+45NzUm9tegzbpIVH0PlgAEtwvab0r76wrjSk3ecIGG6TwHnbeTnPeoHSHWfH035rP/D9aYqD6Gj
	x1grolZoz45O2Z/e54LtFsC1LGZQLcCuCP3EwiUbrj8A/J+5WgGvR7Jy/TLKME1pUVMZPTyL9qVa1
	8q7vMIou7VbSM1c4P2eaD+JaLb2FHf8uArAvxi8+zq8XxfSY/wbLmi9nKvH3rtRh1735TjShF6cNY
	Q3MBzpZF4VW37dSgGalJ+wFEIa6qD0xVRTDjcPQ+fyo5lMxFLsk7sTXm9alQFQqPmimgu1xu3RHrr
	s/bfnqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9dK-00000003oEJ-3tXD;
	Mon, 15 Dec 2025 14:33:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9dJ-00000003oDu-0fUt;
	Mon, 15 Dec 2025 14:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80BEE60156;
	Mon, 15 Dec 2025 14:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1FE9C4CEF5;
	Mon, 15 Dec 2025 14:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809184;
	bh=qxGuhzzENL2/jmnIvpsLOTktbSkGH0gOmyfnscBlOiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uD5W8jQAT+LDPgg/i+ZV8y76tvhMEQ6M1uaQhpUyQ14LMpTBNdIhPBEjqERelpRGy
	 MAFo0OjI5gNVvPMGbqpLQLQ4ECC2wkjUaVYnk5o8y6yWpU5u/skGb+Es2ZCJAPymib
	 77uFHAhM20uFVDufTQusThSYmCYfcAD69tx6mBsWgJIpMVvHL2bWHZ+2xbxktlKA/r
	 u5ropR40zYCtvs1QWoT5txpFXHtPT2+VNLY/bdGKxMXY3E8nrAyJkwdbuDJ2QPX4Bd
	 2EDqkkvWDcFC2nCxH1F59pKSRe2QUK9nFEgc4xvuiwUJUCXfVhWpPA9+Ra8EN7LvP/
	 CEcU6p6dyNdSA==
Date: Mon, 15 Dec 2025 15:33:01 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Move net_devs registration in a
 dedicated routine
Message-ID: <aUAcHVULgJTpdGzT@lore-desk>
References: <20251214-airoha-fix-dev-registration-v1-1-860e027ad4c6@kernel.org>
 <aUAXJ01iHnSJtItt@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CpRBRRZdAIdkXjna"
Content-Disposition: inline
In-Reply-To: <aUAXJ01iHnSJtItt@horms.kernel.org>
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


--CpRBRRZdAIdkXjna
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sun, Dec 14, 2025 at 10:30:07AM +0100, Lorenzo Bianconi wrote:
> > Since airoha_probe() is not executed under rtnl lock, there is small ra=
ce
> > where a given device is configured by user-space while the remaining on=
es
> > are not completely loaded from the dts yet. This condition will allow a
> > hw device misconfiguration since there are some conditions (e.g. GDM2 c=
heck
> > in airoha_dev_init()) that require all device are properly loaded from =
the
> > device tree. Fix the issue moving net_devices registration at the end of
> > the airoha_probe routine.
> >=20
> > Fixes: 9cd451d414f6e ("net: airoha: Add loopback support for GDM2")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Hi Lorenzo,
>=20
> As a fix this patch looks good to me.
>=20
> Reviewed-by: Simon Horman <horms@kernel.org>

Hi Simon,

thx for the review.

>=20
> But I am somewhat surprised that the netdev isn't unregistered earlier
> both in airoha_remove() and the unwind ladder of airoha_probe().

do you mean moving unregister_netdev() before
airoha_qdma_stop_napi()/airoha_hw_cleanup()? I was thinking about it to be
honest :)
Since it is not related to this fix, I will post a patch as soon as net-nex=
t is
open again.

Regards,
Lorenzo


--CpRBRRZdAIdkXjna
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaUAcHQAKCRA6cBh0uS2t
rJ+zAP9fyAYNDREzULQu+K9SkC9WRtWhAAKAzSC+7XDJzug54AEAvJJE68/amNbP
+lE2gjA+wHza9p6bnH+vAdDIyHgo0Qw=
=1TE+
-----END PGP SIGNATURE-----

--CpRBRRZdAIdkXjna--

