Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F38EC433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 09:49:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B10E2072E
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 09:49:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MmPv9rTx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgAhMgk3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B10E2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7OXWe47xwA/pLn7oXFhCZLPEPHinsNAEZLR6onG/XSE=; b=MmPv9rTxPouwMGJ78z0Nny+rl
	NmGYfbUO4CIQsJHlVmEXRDF/e6vzVOSV809iDTTJQddSzy7gAwsZgPQpntTp4WL8UyleNUMcubE8E
	ncFwtxCiyJeEfFDc9nPwQnAHp/Mm90FajqtUMOXK+vCnPGBm/7UpmWR6FQW8PJEiz0O2+/WuK/Tg0
	Rb02sPJ0hfoyEGKK9ZzoOOocB4UWff6jAd+mKu++H0AeX3JMk8dxMBjPb5J+9o78X3W5bqb6iVQor
	CI5vGTXiKOgMShOfPx+F3Z8FLelaO4qX3378+P/bVU4/ty8DtklljCc/XaXYw+hIwjZmWLFMaXeDB
	U/ZNN5r7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxoti-0003bc-Fa; Tue, 21 Jul 2020 09:49:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxotd-0003a4-IC; Tue, 21 Jul 2020 09:49:14 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 416092072E;
 Tue, 21 Jul 2020 09:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595324952;
 bh=HBl3U/frwOt22N3pqrjLjSOH31yq1r1eFl3vgEFJ7KU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EgAhMgk3P2S9xtaT8KwyEsD8lQixAzJAQTEF8OrXQgw/MNtxENV+YlWrqW5EYzuUp
 qQWasjc85rxrgpep4PmBIyYM6ycTEvZAMwm2NVzj3mQi/6U0griHMWn9qCTC6EE/UL
 L74Cu6Pb5+vHL7pnSUv83VOEYTn8Huqaa/T3u1eQ=
Date: Tue, 21 Jul 2020 10:48:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Subject: Re: [PATCH] dt-bindings: spi: update bindings for MT8192 SoC
Message-ID: <20200721094859.GB4845@sirena.org.uk>
References: <20200721024819.7150-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20200721024819.7150-1-leilk.liu@mediatek.com>
X-Cookie: I'm also against BODY-SURFING!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_054913_673574_8280413D 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8552807673600500248=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8552807673600500248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2020 at 10:48:19AM +0800, Leilk Liu wrote:
> From: "leilk.liu" <leilk.liu@mediatek.com>
>=20
> Add a DT binding documentation for the MT8192 soc.

I'd expect to see a matching driver patch.

--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8WugsACgkQJNaLcl1U
h9DNOAf/U7WSHzWn6QeIOU6cZmJEboD/Jpm+YlFFOmeZ09Tt588WYDWCW7cfjiTE
JaFOMr53LA1OdW8WeKXklihwqEMP3dXcKdEpNbtVbU32PrCRAxj4XyrBxaBHEoKn
LzcMAcpmLngZAI6/1o9qyQte2d9r2EMNtiJz8XkWO4N5ZlLf04x0tD1TUqgwz/4h
lGTCCLPmVFbKZzU/V7QW2BgUKu/EEmVyhZx+EDQoUusWET66R92OHTMOJQil+aPC
XwPhYt9Lynxv98qUDDhxjfaKpBQqEk2wLSBHJ2xNDKPQes9Ea+CabdvHp5Jn92An
0sYM9AzJTTmbxHc4MBM51af5Ny5/jQ==
=lcjN
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--


--===============8552807673600500248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8552807673600500248==--

