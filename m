Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28CBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 16:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kB8gXsco5aFnVa/ktHGC1gwnXY8V1jie/QS1Izh6nEI=; b=DKDUtO44EzYEY6q/54lq7Q0MFt
	UOyiY/8NHEcUi4S7fSWT9SMOs7GIckmGvqkushW36HPQs5JjP00LvscSWo4WsyzABYpTEV8+xy5am
	ZkffuuIWEJ459ssNAlg6QuEEpLnntLBwzxeqwNWmgsy+JbcDnoXI+HSX8iOVRgbzT5QUJae2yQ1BQ
	cekjj0/tIgPv9I6KcPP9Xtx0ei2HhWfPHCSJjP5OXIqDIvNKi6H8625VEsIkNgOJDvO1QuCAr8HXQ
	WoLZRAnkpZQrlVT8Sj9nEt/Dh0BMbjBScMOSOvXpqvFjInqJb4JFpUoA79XIylG1lI9zOvXTVRKeu
	q4Gvfkjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtB7o-00GTru-A3; Fri, 03 Dec 2021 16:09:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtB7m-00GTrJ-28
 for linux-mediatek@lists.infradead.org; Fri, 03 Dec 2021 16:09:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5E0D762C1F;
 Fri,  3 Dec 2021 16:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFE8C53FD2;
 Fri,  3 Dec 2021 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638547764;
 bh=lnJSHKCZvGVPK48N7mQhF2MzGkmU1p9LnYQ1zzIxWjg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WBoEq0Y0FGulKH/ho84vA/VwDnaDfU9XpZq+YZGbx1Qsf/Upb+7sNHy1VKmmxfJBp
 Oi+nm4H4CcPBq15LRL+rrbqXSOmNvHXz9ZqTyFj/9jUhqA3a7+U6zNOdS+jVqhXP3X
 Bb1fsobTjYL3das8GfINdrlQXBx3RrFh5iY+dMCKr3fslkgsOXFz3uksGcL9r9xdir
 GiQ/Af3dQlMnhO+VD8sKM6aezWvlgpvevPqkvblJmSYNDss2Ss1Nx7Pqwwyu0GIK71
 EB2r8aF/Dv7USvt9rT/3FIz1GmN0wbz/ghIpBYPYNX1dXjjjMd4riDw0F2lw8C0ZXI
 MIvJjJy5gn3bg==
Date: Fri, 3 Dec 2021 17:09:20 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: Jan Fuchs <jf@simonwunderlich.de>, linux-wireless@vger.kernel.org,
 nbd@nbd.name, linux-mediatek <linux-mediatek@lists.infradead.org>,
 Sean Wang <sean.wang@mediatek.com>
Subject: Re: mt76: MT7921K monitor mode not working
Message-ID: <YapBMGjLcjuBo/vw@lore-desk>
References: <7e156597-a206-b236-e4c8-d476614de7ef@simonwunderlich.de>
 <YalFC7UlCPsCSZqE@lore-desk> <3467395.ZLqV6DWSsM@ripper>
MIME-Version: 1.0
In-Reply-To: <3467395.ZLqV6DWSsM@ripper>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_080926_167610_DE133F4D 
X-CRM114-Status: GOOD (  17.14  )
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
Content-Type: multipart/mixed; boundary="===============7548146362620788860=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7548146362620788860==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dy1Ly8MqNkbwOfbI"
Content-Disposition: inline


--dy1Ly8MqNkbwOfbI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thursday, 2 December 2021 23:13:31 CET Lorenzo Bianconi wrote:
> > IIRC you need to disable runtime-pm and deep-sleep to proper enable mon=
itor
> > mode:
> >=20
> > echo 0 > /sys/kernel/debug/ieee80211/phy<x>/mt76/runtime-pm
> > echo 0 > /sys/kernel/debug/ieee80211/phy<x>/mt76/deep-sleep
> >=20
> > Can you please give it whirl?
>=20
> Jan gave me the card. I've set it to a rather busy channel (2.4GHz channe=
l=20
> 11), created a monitor interface, attached tcpdump and then waited what=
=20
> happens. I didn't get anything and then I've tried to set runtime-pm and =
deep-
> sleep to 0. This didn't change the behavior for me at lot. I saw two pack=
ets=20
> and then it went silent again.
>=20
> I wanted to try the same on a different card (ath11k) in the same system.=
 But
> it crashed my complete system - so I had to recreate the test setup. This=
 time,=20
> I've set runtime-pm + deep-sleep to 0 before creating mon0. After doing t=
his,=20
> it seemed to work.

interesting, adding Sean to the loop here.
It seems the fw is mainting a different state in this case.

@Sean: any pointers?

Regards,
Lorenzo

>=20
> Kind regards,
> 	Sven



--dy1Ly8MqNkbwOfbI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYapBMAAKCRA6cBh0uS2t
rJOzAQCZfdsdVFUCVzP+N/SiAYJmM9ynBn2XVI9q/NZY2ynZnAEAyGzUhlgxq2X8
hndtXsB+HrLAQTK6I+FR8neLgT6QnAw=
=zQwP
-----END PGP SIGNATURE-----

--dy1Ly8MqNkbwOfbI--


--===============7548146362620788860==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7548146362620788860==--

