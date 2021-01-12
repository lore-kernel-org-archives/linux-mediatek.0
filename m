Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44560C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 13:53:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB66823110
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 13:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB66823110
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IJWjv3kE9gbQz/DykKmOZQ40TkKQ+ojP4t7r92X7OO8=; b=I57cFEjzgrJj6305l2ylQ3p+7
	ABnOVsJa/UJRxowI7JnJZbG/Oxye7Q/sPzTPYSGbCKmao8DzB463j7zH3zMOMG2EKMRUWXGGUMMnJ
	0JuwmtwronNveh1ov9Bxmci5eIWFRbxcYDMhP5RDsXMDE2asz89OCUhGvROxvYzmnvINdUJXSpad7
	swh38I5jUmgBysY4ts1cDKEB/fUq3jrRLfw9yd4wwcUsXhyg34QTN4o0ISnoXpuEiEfTTMpZYRzUW
	eVFbYs6q3li6jfZkL4fMWpcXR92F06gbN1Niu8QKy6FtdNDC/HGtOBR5Z5cff+iElAxYGb7B4DZbI
	1a1UzUsYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzK6Z-0005P0-Dz; Tue, 12 Jan 2021 13:53:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzK6N-0005KE-L4; Tue, 12 Jan 2021 13:52:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2C9723109;
 Tue, 12 Jan 2021 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610459570;
 bh=ybnUi5z0HlJzczbJA/zh6uzuqgX4GFPAw52BtZ5QGco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eLTEal0MLhseZ2IUmbvd6fG9MhUsW6e92TBqhjx1uAIGDHX2UsTV1hQZRCbp5Txu5
 QHs/MV2EA3E7JwjqrfdktJOsNMkey2/bQVi5YOtoBljF0nbYgHlX1sKo2JKvr/ACAV
 80I94tDJbAe4I/s7jwiyJziWwNiB9tWt/h+jcGF+0925g0I52Hp81YKnbtkya37EFC
 i0a4xs8wO4Y8oe2aL5I6iNDL9g7Buy/lMgAaINOKxiIE6Pg7JoGjakPWlC8uvxzU4B
 FdeIyB3smoGIz4FJ1JCKC4Addiz95vElWTJKXbXngHtYwsqrFLksQg1ZMkPY02B8J1
 1s5AeLoRWCSJg==
Date: Tue, 12 Jan 2021 13:52:17 +0000
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@kernel.org
Subject: Re: [PATCH v3 1/2] regulator: mt6358: Add OF match table
Message-ID: <20210112135217.GB4646@sirena.org.uk>
References: <20210112100659.19350-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210112100659.19350-1-matthias.bgg@kernel.org>
X-Cookie: Stay away from hurricanes for a while.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_085251_801766_D67482A9 
X-CRM114-Status: GOOD (  12.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Gene Chen <gene_chen@richtek.com>, Matthias Brugger <mbrugger@suse.com>,
 Axel Lin <axel.lin@ingics.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: multipart/mixed; boundary="===============5070145576335168589=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5070145576335168589==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2021 at 11:06:57AM +0100, matthias.bgg@kernel.org wrote:

> The binding documentation mentions that a compatible is required for the
> MT6358 device node. But the driver does not provide a OF match table.
> This way auto-loading is broken as the MFD driver that registers the
> device has a .of_compatible set which makes the platform .uevent
> callback report a OF modalias, but that's not in the module.

As previously discussed it'd be better to fix the binding document to
deprecate the requirement for the compatible and remove the usage from
the MFD.

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/9qZAACgkQJNaLcl1U
h9AvHQf/dZnoemzOHIqA+LE6lhqqLgw9NX1cTsb4oncHJaYArCHM3ThlY46CGnLD
Syjh2P+iIa92uQfKgQ+MT6m0mUbAsm+tCf73biTyC1pklvnQm3gxwGLkOAWLngI1
QQxwoHfK8y/KLSg9ZS4w0m4zygVA2QP+BwVv0XbfHI7yd3ZTWDHOU61hSACdjDM8
b6D2UvgsPDHhMOygohWy3N9hlZaRN6oU85vqKBmM4JnlkRtk3+XaVZEj+gmpl+tw
zi9wc42wGDkCcaCGDWOEAKKY/a5ZalRdOfooNvU1zyUtndiEUbzHb4bLnFZVTkYJ
J/GpwTyz30GmsTOmFVCeoH2dtnFzdA==
=+RD0
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--


--===============5070145576335168589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5070145576335168589==--

