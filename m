Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78684CD98D2
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2026 09:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqTMTiQg1sf52LbnFTly3RfFBwAHjqFaOZSFE8C6iQ8=; b=fqfFrImC5eqNFDFi72jO9DToGl
	zgA8T67/v7TXlzFZRK9gPr4GyL/KIx0hKcJgy0nyP65P+i/LgpnikxW/9QGMOHXj1ToXYcAPLLofJ
	CmAeAjyZfqSOTW5yUPt32r3qKZfl6L0hW0vcFFXtjZBnRzgdXJ8X9MpAh64w3K79mUwBHdVWv60GQ
	3/yVsfmkHnOawSNtaKQ6nWuylwcjfifXUZEEMgJElmwqsj4xw0f0sEMehEc9QGUuNUwRAJj5MWSEp
	fT2k2wZ+iDpa5pOIlBQu3+QbDatCx7a/ilyw92aQqLi79UVSduF4/VBc1bSBQCc+CsxgpvyBRQErw
	tQSArAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYh77-0000000Cq72-2MtF;
	Sun, 14 Jun 2026 09:26:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYh75-0000000Cq6v-3wKT
	for linux-mediatek@lists.infradead.org;
	Sun, 14 Jun 2026 09:26:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DA90B6008A;
	Sun, 14 Jun 2026 09:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105241F000E9;
	Sun, 14 Jun 2026 09:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781429202;
	bh=QqTMTiQg1sf52LbnFTly3RfFBwAHjqFaOZSFE8C6iQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hwkZQqtd4opBAdy2o1ZHR9ZMbv03X9dvQK+31NZdxMF1MlXWQjho9sAMeAz4tW9v1
	 0xN6owDCIGOz9k3HNDB8me/Yar9ahFhQ5dgMV1trfDcwLW7fvvIyg/qIuXVj3+vMv/
	 Ax0NU0Es/6pyVCzfOGOUQA+PZ+TsNmWOlXmnBrFkxyQNVY/JY0CmbwdvUPTglR5b5s
	 +iT98q643glfs/MfDRgC4DIRUaeZwDg2L5Y2E+Z1osXhLGjhS4Q8i+W0NAN8MOIzUm
	 VuSnLLFy/AXJI/7AIBz5BRylSxtO4+j7AajcNQ1rHr+fD/ip4BAz5gZrFg5S58eobq
	 6owLNsCuHDBwQ==
Date: Sun, 14 Jun 2026 11:26:39 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Sean Wang <sean.wang@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/5] wifi: mt76: add USB RX aggregation support
Message-ID: <ai5zzwOcBrrtvjNk@lore-desk>
References: <20260613224655.2405686-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pyRDaUZ8du7f0YkO"
Content-Disposition: inline
In-Reply-To: <20260613224655.2405686-1-sean.wang@kernel.org>
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


--pyRDaUZ8du7f0YkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> This series adds optional USB RX aggregation support to mt76 and enables
> it on mt7927u.
>=20
> RX aggregation allows multiple RX frames to be received from one USB URB,
> reducing USB completion overhead and improving RX efficiency for
> high-throughput RX traffic and monitor capture.

Hi Sean,

MT76 usb already supports Scatter-Gather (SG) for RX urbs in order to recei=
ve
multiple buffers in the same urb. Since this approach has a better memory
footprint, can we reuse this approach?
Moreover, can you please provide some performance comparison? (e.g. through=
put
and memory usage).

Regards,
Lorenzo

>=20
> The common USB support remains opt-in, so existing USB drivers keep the
> current behavior unless they explicitly enable RX aggregation. The same
> settings work for both mt7927u and mt7925u, but this series enables the
> feature only on mt7927u for now.
>=20
> This series does the following:
>=20
> - size RX page-pool pages from the queue buffer size
> - support out-of-order RX URB completion
> - add optional USB RX aggregation parsing
> - add debugfs stats to verify aggregation behavior
> - enable USB RX aggregation on mt7927u
>=20
> The series is based on wireless-next commit:
>=20
> 21352612198c ("b43: add RF power offset for N-PHY r8 + radio 2057 r8")
>=20
> It also cherry-picks the following patch from patchwork as a dependency:
>=20
> wifi: mt76: mt76u: use a threaded NAPI for the RX path
> Link: https://lore.kernel.org/all/20260609105301.196302-1-phial@phiality.=
com/
>=20
> Sean Wang (5):
>   wifi: mt76: usb: size RX page-pool pages from queue buffer
>   wifi: mt76: usb: support out-of-order RX URB completion
>   wifi: mt76: usb: add optional RX aggregation support
>   wifi: mt76: usb: add debugfs aggregation stats
>   wifi: mt76: mt7927u: enable USB RX aggregation
>=20
>  drivers/net/wireless/mediatek/mt76/debugfs.c  |  35 +++
>  drivers/net/wireless/mediatek/mt76/mac80211.c |   3 +
>  drivers/net/wireless/mediatek/mt76/mt76.h     |  38 ++-
>  .../net/wireless/mediatek/mt76/mt7925/usb.c   |  18 +-
>  .../net/wireless/mediatek/mt76/mt792x_usb.c   |  23 +-
>  drivers/net/wireless/mediatek/mt76/usb.c      | 251 ++++++++++++++++--
>  6 files changed, 335 insertions(+), 33 deletions(-)
>=20
> --=20
> 2.43.0
>=20

--pyRDaUZ8du7f0YkO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCai5zzwAKCRA6cBh0uS2t
rCL5AQD36+ZV63ZKM6pJRZP22/1sqTURbayd1hEhI0lMVKf43gD/SF0dbi/igXqj
DfJcZqHMDeVDEevEJBwuDnj4/GwA9gc=
=kFQp
-----END PGP SIGNATURE-----

--pyRDaUZ8du7f0YkO--

