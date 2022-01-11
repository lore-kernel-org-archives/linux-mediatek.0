Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1C2C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1z65yVa09mNmu//vdH74l9T6MsoEE/2XHmEcaugG5U=; b=FNJjsubH7IWxnhcG5NvD165R1+
	gNao8pvGtX6avEgGiHDJRtFrLOxkgcoMehfCsIAUhM9IuONvIofrzJ4Io54mI9iFRGZdIdeqOd/s/
	S7DXR1ArIU/9bS4OCSV/GSPOG/t7mou5LAAmgZnyqHxyCNDnsvdPPwu1FI/iaZ3Joo7fUpITSusGF
	ygroVzcNRv6NMWsEHeWrn3ush5J7JThx0Nh7ucEdCPXeswXQ2NmLK22dGXQsm584CJzWDvcITAsKv
	9GgJvjsIuNUBM5OViAHvi/M3D20i3Q9Z6FE6iqDaJm1rPDWCEgdsk+y9meNA1JnRNY22zI3paIa+S
	ffHixYIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7EyS-00Fx88-Ct; Tue, 11 Jan 2022 11:05:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7EvO-00FvkV-SC
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 11:02:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D4023615A2;
 Tue, 11 Jan 2022 11:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B638DC36AE9;
 Tue, 11 Jan 2022 11:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641898965;
 bh=bpDyuPCSeMVqJyeugkA7wQopRLRWRBPLU2LF5wLNe8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B0JjGXgMGBwLwKbWaaEtu9QTD3QigaJQOdps+TZWdEkW6WFieqW4J9e3+UIsFrfBM
 NI0K5G08992uKy502/kb+TgYY/J/u6q2/2A4egeEpzevxrbua5DbAgH97Ptfna71Bp
 vW+U52aTuLF9fov697XcyMNLSPnMW6MeZZWGosBxy/Ss5Lh+cqpGEI9MENKvL85t+N
 3uJ5wb4T3bE7b9jN87/l9EzZhGfQ2agOrY8F0FxXOKIrU+xSOB8Sws0iPVz8zrBcqN
 Tru4X9WDWzOMzyJRQga9IPQsy9dTiB7juVdSH28g2sPUF0252y455I9/vUDKe1KrLz
 zwZg8zIrQaM9Q==
Date: Tue, 11 Jan 2022 12:02:41 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: lorenzo.bianconi@redhat.com, sean.wang@mediatek.com, nbd@nbd.name,
 jf@simonwunderlich.de, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Deren Wu <deren.wu@mediatek.com>
Subject: Re: mt76: MT7921K monitor mode not working
Message-ID: <Yd1j0UFVkDC50x8D@lore-desk>
References: <YapTmM3EztojTS9F@lore-desk--annotate> <12706913.cppxkphV4n@ripper>
 <YbusBazb4GAC6YQl@lore-desk> <34944167.qDeGz8lmHr@ripper>
MIME-Version: 1.0
In-Reply-To: <34944167.qDeGz8lmHr@ripper>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_030247_002150_6AB7874D 
X-CRM114-Status: GOOD (  15.40  )
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
Content-Type: multipart/mixed; boundary="===============7307108025063863665=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7307108025063863665==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jWgpeJokEZ4CKhaP"
Content-Disposition: inline


--jWgpeJokEZ4CKhaP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,
>=20
> On Thursday, 16 December 2021 22:13:41 CET Lorenzo Bianconi wrote:
> > can you please try the patch below to see if it fixes the crash/hang in=
 monitor
> > mode?
>=20
> I have tested it now. But it seems like it was already applied. Otherwise=
 I=20
> would have provided my Tested-by.
>=20
> The only problem I have with the monitor mode is the missing beacons (and=
=20
> maybe more frames which I haven't yet identified).
>=20
> Kind regards,
> 	Sven

Hi Sven,

can you please test my latest patch?
https://patchwork.kernel.org/project/linux-wireless/patch/f6ad709b1a64152b5=
955e71b7eef9f9c4c7f127e.1641893305.git.lorenzo@kernel.org/
This patch will automatically set/clear runtime-pm/deep-sleep adding/removi=
ng a
monitor vif.

Regards,
Lorenzo

--jWgpeJokEZ4CKhaP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYd1j0QAKCRA6cBh0uS2t
rM6kAP9hz6s1QHJtutAXCkq6/VTbZpOGXDHIodyEESZicFRlIAD/WkjRu83dUNWg
A2ZzAcHLlxpJGttwvqBE9SDQHoyfQw0=
=Cn3t
-----END PGP SIGNATURE-----

--jWgpeJokEZ4CKhaP--


--===============7307108025063863665==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7307108025063863665==--

