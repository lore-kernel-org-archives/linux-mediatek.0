Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDEDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 14:04:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F41B61104
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 14:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F41B61104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDtIEaiZR4sIKjhNZ6YWew/a34wRzZp1+nahPNokKw8=; b=I1Z59SMPhH1xk3CZV9iObIpdK7
	NUEX95LSkpKSUf2jyuQ9/lJjF+1EGQ8+5n3pXdCwbP9+IaER85ndQ52XJFdFL0DOyT/mtbTlinRTR
	2qCVY9VYkzQzEjdpt4LsU/2klTLYoEPaWrv1jT/Zo96RTSTkGR80dyIQjkk/tuNqo1eJeXKX/WyY3
	kzjbeSf3DHxDCjwbOQ+lbddDBxmr2UhZCuUIOMHzWd+RWY7XRftV2BF55ot3VOeD6aHiOBc2/nEfO
	67hDrEUu3JEgQAa3XYVRMoKhsTdMl3/qrTuMZKkrousNz94/oXRig1R9T9KDTrMfvJcD6j69RQCqd
	VhQkK8Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmcaa-00Fnsi-7V; Mon, 15 Nov 2021 14:04:04 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmcaM-00FnqS-Qa; Mon, 15 Nov 2021 14:03:52 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id D1CA51C0B76; Mon, 15 Nov 2021 15:03:44 +0100 (CET)
Date: Mon, 15 Nov 2021 15:03:43 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: jacek.anaszewski@gmail.com, matthias.bgg@gmail.com, dmurphy@ti.com,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: Re: [PATCH v15 2/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20211115140343.GA13493@duo.ucw.cz>
References: <20210716081731.80118-1-gene.chen.richtek@gmail.com>
 <20210716081731.80118-3-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210716081731.80118-3-gene.chen.richtek@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_060351_076632_25C54653 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============7686770078459664724=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7686770078459664724==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2021-07-16 16:17:31, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
>=20
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> moonlight LED.
>=20
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

Thanks, applied.
								Pavel
							=09
--=20
http://www.livejournal.com/~pavelmachek

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYZJovwAKCRAw5/Bqldv6
8iQwAKCbn6E5ocaFepIatVEpoz3cam0C1gCfXTnqIfam5+VMmDOuw0IDBie3jKE=
=4B7h
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--


--===============7686770078459664724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7686770078459664724==--

