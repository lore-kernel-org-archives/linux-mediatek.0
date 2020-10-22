Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4142CC388F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:06:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F642221FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:06:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mg9oF6FF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4Y4GTYO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F642221FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vXsq3R3KupV6kjuVZBFN8hWtz6Nu3wVgco7AZaEAl4c=; b=mg9oF6FFjrrEl2tP3Fq6CX4MC
	q9ALY0NAjHDkLR4aFP+zPEOSVxOxn0oZEh4QcfTaBvjcfQNn+YkF3w1NuH5gsLnisCTp8jU4Yh/XJ
	BRAJusTas47TuQI65d/4sQ6to0JACHuOS5oOlGeBa7/CM4uolMZUqSKMozmT7CgVFHdTiEkdnQouv
	+Gv1vQ37Q8WjGjViQPQmYRmLak7+b5J2lmsS6XnNDXbuZVjwtzwW+WAyDshkG+VseVdHbzsouoHrh
	A3hjPyo3V9smaRcAP/CJSUfKTkpHdl8a5DunGw6oHJVEs0J1rjTgB7iRD3ifGYX+3xwp1mctHyWff
	TzFgxga2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVZMH-0001ZJ-8N; Thu, 22 Oct 2020 12:06:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVZM9-0001Xs-E9; Thu, 22 Oct 2020 12:06:13 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A441C221FE;
 Thu, 22 Oct 2020 12:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603368368;
 bh=t+X/fz+JfWcR2EunKKVuaJPpOA4TjedvNGMrxIpej5U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E4Y4GTYOPdmpu+/ow4kGpO4WqSwMFJB/JM+AYpGMSMnsPEGbpwWkDYYEM3oY/NsRL
 k2q6jz57MFl1cwOa86eGIVfCtsjMmUUvPe4Lx0k+JqiNEAkt2BgkRW68izrBXw/WR6
 9I5yT2TWdP6XkATm8b/dS7Nw0BQUAzXZMWLH0zm0=
Date: Thu, 22 Oct 2020 13:05:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2 2/5] ASoC: mediatek: mt8192: add platform driver
Message-ID: <20201022120556.GA4826@sirena.org.uk>
References: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603270435-3548-3-git-send-email-jiaxin.yu@mediatek.com>
 <20201021132339.GF4497@sirena.org.uk>
 <1603361084.8921.26.camel@mhfsdcap03>
MIME-Version: 1.0
In-Reply-To: <1603361084.8921.26.camel@mhfsdcap03>
X-Cookie: Some settling may occur.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_080609_568207_B9A84F02 
X-CRM114-Status: GOOD (  14.45  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com, tiwai@suse.com,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2997356286369217667=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2997356286369217667==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mP3DRpeJDSE+ciuQ"
Content-Disposition: inline


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2020 at 06:04:44PM +0800, Jiaxin Yu wrote:
> On Wed, 2020-10-21 at 14:23 +0100, Mark Brown wrote:

> > This is *way* too big to be a single patch, please split it up - it's
> > over 600K.

> I will split the dai driver files as a seperate patches. Such as:
> ASoC: mediatek: mt8192: support adda in platform driver
> ASoC: mediatek: mt8192: support i2s in platform driver
> ASoC: mediatek: mt8192: support pcm in platform driver
> ASoC: mediatek: mt8192: support tdm in platform driver
> They're still in series of "ASoC: mediatek: mt8192: add platform
> driver".=20
> Is this appropriate? Please correct me if there is any misunderstanding.

That should help, yes.

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+RdZ4ACgkQJNaLcl1U
h9BFaQf+L3FRqaz4A2QbQxIofXh6aZaoYBnbTRNNHq9tK52ZNoBuo7c5Oq5jdDxU
Vrp2Lrp2/5zPc3t2ejKzfghfdaExq0CI+3HhZyy2rpD7DorFI9hhUoMEEy0HeDD2
OObHcIoDeTTQyTTGmTfQ4ii5+pgfNvxbmId1wYBUD4T/3oY2d1ZV9USUCxavMzRy
IhMQabPIRTnOitpCtk8fpWUEzz/2t9vDWFJOTzuUA/wyzPjQ+6oMX1YS3op3n0Y8
GS8Xh70JKZ/tJA4wpprIwovx6dwS8qxs17YvvZSIIopzxlZHbsbZzJpUFdbbF2E1
s/vPkaVt6maR2dVRk2afz3FWPighSg==
=jh/Z
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--


--===============2997356286369217667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2997356286369217667==--

