Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B5BC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Dec 2022 07:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DH9rWFiSpnIUtROcGFobZVIBMfhsphaC0SMZ9clWmA=; b=XluuhC9FfJQKVPHqWLJqMUr/uv
	Y+aNMZXE/Dcz1qal8K0mZvCJI7eP7BuOFhNELu0NoMpAwDjob4im4q14o1GQmT02+zC4UmIhzokhA
	FJRGRNF8HSdDFm4zJOVDlFhnqDnIavR6NFu8MZ5Wo1JWUuSC2Vp1awiSkg7VvPldvavOfg1aAV9k1
	MHQ2bKUD1pYdZtJdUuw3OP9fg/rq1PsCsjGwfdbzcaDaCAucPItvy1wk4MseI9JuaQE6GkI4UCEbS
	LVTnS/xHvq/SPNXQxjbpT6lnSr6eSe8G2/OG+PoWOUZCVTijoU9HtEYp9fmraivJiXs0OrNMYHeCy
	QL9j4zBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8yyC-00FzJl-3s; Sat, 24 Dec 2022 07:29:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8rLC-00CvgA-KK
	for linux-mediatek@lists.infradead.org; Fri, 23 Dec 2022 23:20:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CF2761E84;
	Fri, 23 Dec 2022 23:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553E6C433D2;
	Fri, 23 Dec 2022 23:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671837636;
	bh=7DH9rWFiSpnIUtROcGFobZVIBMfhsphaC0SMZ9clWmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p06B7zGqQvM0j/itRnzCNn+nmYUjn03eTbRWs9uJirjqd4K36a+KT+fuDJvVPF0wu
	 UVsfPNDOioKOr8+IxN+Xw6sKvpNvmVSF+/ppZTQsQBMgobt2ZSxZH6TmC8TOJMhHJH
	 CMrWsjFCy47aP9/Y461CvNTESnLA03rcsgoxY1gOgVDdU6wmFS+9Co3+N2mF8uLcgU
	 BnmOc17xnrNGRRebF7THDrmO/Oi2kqwFuPP+maP5R2IwhowD7mnWQcp2gn9LwfkKSU
	 OMc5/wadnsnLuBIgY0WJxD9nZLw0qqnBMoFtiaWNaTuoyUtzzB7klaHbpypcixl/VZ
	 gPhIZ3VNKex+g==
Date: Sat, 24 Dec 2022 00:20:35 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Nick Morrow <morrownr@gmail.com>
Cc: nbd@nbd.name, ryder.lee@mediatek.com, shayne.chen@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>, deren.wu@mediatek.com,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [bug report} wifi: mt76: mt7612u/mt7610u - 6.1.x hard locking
 systems
Message-ID: <Y6Y3wzSxbTG2aLAo@localhost.localdomain>
References: <CAFktD2fRnSbNgWRRoGbQzG5_Mw7=zFJKTVBHS_3D+mNUYcv9hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EyFLBunWBbUw4B6e"
Content-Disposition: inline
In-Reply-To: <CAFktD2fRnSbNgWRRoGbQzG5_Mw7=zFJKTVBHS_3D+mNUYcv9hQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_152038_749442_529B6850 
X-CRM114-Status: GOOD (  16.58  )
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


--EyFLBunWBbUw4B6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Starting with kernel 6.1 rc1, mt7612u and mt7610u are hard locking
> systems when connection is established. From a report this morning:
>=20
> "So I'm using a MT7610U based adapter and updated to 6.1.1 in Arch
> Linux and it's a complete lockup a few seconds after connecting as
> other people have said, I'll use the LTS kernel (5.15) in the
> meanwhile but this is probably going to get a lot of people that use
> distros with newer kernels."
>=20
> Background: Problem first discovered with kernel 6.1 rc1. Bug report
> was seen on linux-wireless around the rc5 timeframe. This is an
> additional bug report.
>=20
> I don't think additional info is needed as I have tested on several
> distros with various RC's of 6.1 and the problem is 100% reproducible
> and unavoidable. This is a show stopper bug and will result in
> widespread reports as distros upgrade to kernel 6.1.
>=20
> Regards,

Hi Nick,

Can you please try the patch below?
https://patchwork.kernel.org/project/linux-wireless/patch/20221217085624.52=
077-1-nbd@nbd.name/

Regards,
Lorenzo

>=20
> Nick
> https://github.com/morrownr/USB-WiFi

--EyFLBunWBbUw4B6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCY6Y3vwAKCRA6cBh0uS2t
rLwBAP9Si8qAR4w7Z8svcpPJMCP9/AUqU42Wb3LYasIg+ROAeQEA9qMNbWXbSO1s
kQ+KWOiA/9XDM5lAd+UHkzWHz51JzAs=
=3Y+6
-----END PGP SIGNATURE-----

--EyFLBunWBbUw4B6e--

