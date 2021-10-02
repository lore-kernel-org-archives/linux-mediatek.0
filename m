Return-Path: <SRS0=6vjs=OW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F30CC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 06:37:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB236136A
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 06:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BB236136A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A9oMVP6vz5J0/uDpG4Cw1umt2vqFE18DUV/hM0B36R8=; b=zXoN4hHHImVs0YbF0xDd/hsTwV
	MfFaFfFx1FpigbUQ/oFYxH5b57qffKd3MrTRI9rEWXA5HJ39B7Em5+Fod34m8Xdl8qV6Bw2gVTQ8q
	h5BuCV0/tyAO8sLqPA7ilHqvqS8p6isUqes2pe7hDoDm8EdPaQsKCihKpm5peyhRPEn6kI8e3EECi
	uAkPQ5aqkka2X4Qchu5esKuSB41vupxkNHKGee5cDV3YM+1AtUXqL/Ha16S6U+6uA27vNpGgTHbyA
	nTFi3+Ahuakz0oahHrZSCV8UcKahWjixgh5pX5002jX9ZS7GF3f/QdI8vCzrGQVAE0sS9CIgWmhwB
	r/uh3hGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWYdp-001qAd-Ur; Sat, 02 Oct 2021 06:37:01 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWYdS-001q92-L5; Sat, 02 Oct 2021 06:36:40 +0000
Received: from localhost (p5486c558.dip0.t-ipconnect.de [84.134.197.88])
 by pokefinder.org (Postfix) with ESMTPSA id EFF282C01D8;
 Sat,  2 Oct 2021 08:28:19 +0200 (CEST)
Date: Sat, 2 Oct 2021 08:28:16 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kewei Xu <kewei.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v7 1/7] i2c: mediatek: fixing the incorrect register offset
Message-ID: <YVf8AH4rnV5jaweB@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
 Kewei Xu <kewei.xu@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 qii.wang@mediatek.com, liguo.zhang@mediatek.com,
 caiyu.chen@mediatek.com, ot_daolong.zhu@mediatek.com,
 yuhan.wei@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>
References: <20210917101416.20760-1-kewei.xu@mediatek.com>
 <20210917101416.20760-2-kewei.xu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210917101416.20760-2-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_233638_891610_CBD32BAA 
X-CRM114-Status: GOOD (  10.27  )
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
Content-Type: multipart/mixed; boundary="===============0322886992164815123=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0322886992164815123==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2fNKO1T4RlkFDC+j"
Content-Disposition: inline


--2fNKO1T4RlkFDC+j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 06:14:10PM +0800, Kewei Xu wrote:
> The reason for the modification here is that the previous
> offset information is incorrect, OFFSET_DEBUGSTAT =3D 0xE4 is
> the correct value.
>=20
> Fixes: 25708278f810 ("i2c: mediatek: Add i2c support for MediaTek MT8183")
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Qii Wang <qii.wang@mediatek.com>

Applied to for-next, thanks!


--2fNKO1T4RlkFDC+j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFX+/wACgkQFA3kzBSg
KbY7/BAAqT8oWhkKTTEZIwjngOiYXNrMHlU599Dodhf11fePoYwE0YIEyMPDvds+
d11jk5pP5CQY9/UrB/Z8ySwQi5kvmUXXmB0n9APhBEwd95ViWY2YDUSk6k6BEoh2
HeN5pLqfVfXBt+yViatvUPfa9o5sB8SFqGVrKmI4HueEzNvYrdbJO3Ga9snoRPBE
Hd4L3ZflHcF78pvYnx8D4MfNcaRksUYf8oapDyk52lmm8bLRi+1NXIKjGLZnOOXJ
CMkJy80ZbdHgOFu0ZsEDa7MEXfK/kWvkTLld90Kkskf3ope1uKSPL3MS4Ycb3mTA
zvM+aNXza6UU5IzQJK60ThBFkcdpGt42u5hQ7Jtoi6388SGFEoKS/9EHmtCkmyJI
2B/K7LTjza4FsxxabiTJwcq7YSu/O+yMTVkTNCR2aiISYtSSnetuH7Y174qmVN0J
SNFKNT8PL+zBRmtL+Y+Nyb1KbzvjI4aEth8kn85e3N9UymP8dQ9RwhLNhjyzGqTQ
asTTIJ6H4vSh47y63EBtDtfugLXa88YhJR/9jUNY2rjq/RVWXmrsVezzqfndXpNi
s3wAqkfzWSk/UdtqczoTNU4R7YsOb2FcGDpkVPP6oehBBvw+TuK2BH6TKWyDicCZ
yOMacsLapc10ikwATJRPr4GA0i+7l40FIB/wN/TQ7tP+KYxbRw4=
=9lUR
-----END PGP SIGNATURE-----

--2fNKO1T4RlkFDC+j--


--===============0322886992164815123==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0322886992164815123==--

