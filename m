Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061A3C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 07:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQDUZN0OMyoox6Z93YbNjehKhvRKHn2tu12DYd6IG4c=; b=GanrlTkI+GfeMbEL75lNCrD1vf
	Ev4plC7eO8puUE0R7dZncysweybSpQq+gj1Ytgwt19FWxgWW+B1qMuwt7ivr+OVTwn/mG7A2Gtkp7
	fBOEwFDdotrm5R7xgfCoLVLV7LFCPBazyL3Vq47t0l37Fr0AEXsiOvhfNUTmYTDevceiriDNVLmTf
	er4S7vz68FBw+jNhUC8Pv4e+tC9jH57G2piqTRMbwIFFjexr4pxEjV93qY7Ywhy22HaVMU/l8tIp0
	bXMArRuZDIJhLRpkRi2Ngb8X7LmkqxLKvt8NvQtjdNUpRowEPNfsHi6QMKvtF8/y03BrfRhtzpZUH
	l9TEidbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s78ra-00000000k5M-3R7O;
	Wed, 15 May 2024 07:15:46 +0000
Received: from prime.voidband.net ([2a05:f480:1800:ee:5400:4ff:feab:5961])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s78rU-00000000k2R-15eh;
	Wed, 15 May 2024 07:15:41 +0000
Received: from spock.localnet (unknown [94.142.239.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by prime.voidband.net (Postfix) with ESMTPSA id E595E6356CD1;
	Wed, 15 May 2024 09:15:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1715757325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MQDUZN0OMyoox6Z93YbNjehKhvRKHn2tu12DYd6IG4c=;
	b=R2pLt/FYUh5KewsQxU5COKqCEmn9Ug1dJfcyz6XCkQVzGWAgY6RTxKZsQ1ubJWTjXFc4rB
	JvAY6X3Y0cgHtC/c95eZQKKg50iKAHuomQrTPUjDcxcr+LwKJv9OHodC5nt453x7DZ74KX
	Z3yaVPZmfRloZIom6ZcitNrAqAMcWLE=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>,
 StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
Date: Wed, 15 May 2024 09:15:12 +0200
Message-ID: <2200096.irdbgypaU6@natalenko.name>
In-Reply-To: <60fe8df750a74331b8a54a76d55d5e8349ac46b4.camel@sipsolutions.net>
References: <6061263.lOV4Wx5bFT@natalenko.name> <2341660.ElGaqSPkdT@natalenko.name>
 <60fe8df750a74331b8a54a76d55d5e8349ac46b4.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart13529873.uLZWGnKmhe";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_001540_445569_EA0B79D5 
X-CRM114-Status: GOOD (  12.64  )
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

--nextPart13529873.uLZWGnKmhe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
Date: Wed, 15 May 2024 09:15:12 +0200
Message-ID: <2200096.irdbgypaU6@natalenko.name>
MIME-Version: 1.0

Hello Johannes.

On st=C5=99eda 15. kv=C4=9Btna 2024 8:23:35, SEL=C4=8C Johannes Berg wrote:
> On Wed, 2024-05-15 at 00:51 +0200, Oleksandr Natalenko wrote:
> > Also /cc Johannes because of this commit:
> >=20
> > 6092077ad09ce wifi: mac80211: introduce 'channel request'
> >=20
> > On st=C5=99eda 15. kv=C4=9Btna 2024 0:43:40, SEL=C4=8C Oleksandr Natale=
nko wrote:
> > > Hello Felix, Lorenzo et al.
> > >=20
> > > With v6.9 kernel the following card:
> > >=20
> > > 01:00.0 Unclassified device [0002]: MEDIATEK Corp. MT7915E 802.11ax P=
CI Express Wireless Network Adapter [14c3:7915]
> > >=20
> > > doesn't work any more. Upon mt7915e module insertion the following sp=
lat happens:
> > >=20
>=20
> 6.9 didn't get commit 2f7cf3b61d85 ("wifi: mt76: mt7915: add missing
> chanctx ops")? Huh?

Yes, you are right, this commit is not present in v6.9, and I can find it i=
n the "next" branch only.

I can also confirm this commit fixes the regression for me.

Thank you.

> johannes
>=20


=2D-=20
Oleksandr Natalenko (post-factum)
--nextPart13529873.uLZWGnKmhe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmZEYQAACgkQil/iNcg8
M0vELBAAtzFurVLA2p05EBkdZqnYzYFZSF1PqO+Gl9ycGnsEtOrfdBLnJX68Fe3Y
2ALMWI/SiP+nY16RnLH74Zv1vZPZ4cCraP2RcsZx7foWX3/5Vp6HXZNCTft4mY/z
ukh1bYGL22wgMYzcdxcsYzNWx8hPPBWtcQBLlI135gWwsFMWLceLqSxdSArycjjM
RgmmKUYWC7hicfeQ2IusZ+KIETvOadet1mW5Jkgtb0Xl7BD2bdeWmTEaPudRye4/
alYhrMEKUDWRr48uV5KohVlj4SR06t3RF2TVg9bGfupyhD80DRobXE2MqTsQ04ve
2X9XeXPkfhVzo1MjZMqNhbln1tG1C9v3E+yQIqyZ4N9hrCZ4T6RMztz/OooHkNqq
NfVnZFf59FTPfkd4kCb4gzJ6bcxT2DVnbnBndeGSQ3yh+4xA5uokbezQBUuw9ub/
iVoPo6bTo15GE3uM47+LEGQcahYG6PC798n5megvVCuBepFvVEkOW4Tku6vI3rx+
ox+NpWdgm7u0262OdwpMXBEQzj0aCJC8KafE9TmfAMF+5DNdD6r+gqR+4SL0A90l
GJHudrVX0MD9ZixIq5Nc0rVpT2i167xZHgMfq24Uw04M2awxSZIb9oyEiwYCP9QL
svxPKWThbWw8uZB2yWKDUqzotS1Xo6cYZEV/MrgN28czKZlvA0Q=
=EtZ6
-----END PGP SIGNATURE-----

--nextPart13529873.uLZWGnKmhe--




