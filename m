Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8612C3E8C5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 18:08:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01E6B20872
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 18:08:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VoZQYjiM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+KKNmpy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01E6B20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I3j/DOXyIYPq4U1L36fD5tgKQ3lrtD36tNYH3xwFpd4=; b=VoZQYjiM2yJWtnWiCHL6hUti6
	Gnvlz70djp9MQ51RecowvYWjz+sqRIOn2yiAs+dL5K1MOabchLAISt77/RBlB6bJHJ0D5caI/0u13
	yS/YZcD+ggUOCam7nNi0oxNm1tOuD2D62DLXaBGSQfaXsqlyfWkkON0UxtOjaWg6jOHGdw9nzEMwJ
	wMQnOf2fmM9jWNXd4hVFUrXkpk8/WHZdaw7LeUYwWS9Rz9QNNgyuc0x9gX8nwHMBpaR8v+qpqag0p
	c5dM6E/8WPRdeKwIC27HK8KJY7zbpuTBokKESYOXLD4baZJP/QBhkkugET2LCP43ufhgaLLJ+7Z4x
	YKpTQu0Ag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfRsB-0007EN-P0; Wed, 18 Nov 2020 18:08:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfRs7-0007D9-Bi; Wed, 18 Nov 2020 18:08:00 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6420320872;
 Wed, 18 Nov 2020 18:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605722869;
 bh=G3eNmrElpyk/JxdBz4ZxECjisMtQTh/y/4ve+046iDc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J+KKNmpy9vshVC7uON3rYNM2VC3nQSETkj1ls4ywL6YkZbRUIQGr2DtRsZkx8cgjS
 aHZRGqKRltau/tixcju0xTJw9aIYQ5MgpdWWDeNRi1+3nq2e7hA2Si7uIs+v4jl2md
 wl7Ar/XTUBMOenMKU0EuziYi+9AFzdOztNvbx97g=
Date: Wed, 18 Nov 2020 18:07:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] dt-bindings: mediatek: mt8192: revert "add audio afe
 document"
Message-ID: <20201118180728.GF4827@sirena.org.uk>
References: <1605081920-11848-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1605081920-11848-1-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: A nuclear war can ruin your whole day.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_130759_560919_9249C70E 
X-CRM114-Status: GOOD (  13.76  )
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
 shane.chien@mediatek.com, linux-kernel@vger.kernel.org, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, Trevor.Wu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2046173892659066647=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2046173892659066647==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eDB11BtaWSyaBkpc"
Content-Disposition: inline


--eDB11BtaWSyaBkpc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2020 at 04:05:20PM +0800, Jiaxin Yu wrote:
> This reverts commit 1afc60e00de3abbb6c559da409c5c1bb8c1d98ec.
>=20
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/1768=
73.html
>  These dependency are continuing to upstream, I will revert this patch fi=
rst.
>  After the dependencies are merged, I will send 'mt8192-afe-pcm.yaml' aga=
in.

This description of what the commit does should be part of the
changelog, reverts are just normal patches and should have changelogs
describing what they do just like other changes do.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--eDB11BtaWSyaBkpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+1Yt8ACgkQJNaLcl1U
h9AhLAf/TGSE24nfALfss97iOQLpBN2TcEUOBzg/RRtpuWtwvSMYV4B6YSoNojIr
FMcDlZWyPnv+3y3iht5s5jNy278L2Dobyj10ncVofPIdIZ4duv5CRsxcuSb5bde+
4IKJ8om4SM+CEovLSNYLTclqEeu621cTX6dTklSi4cW5SOHxir9DqSKHlR973TRb
XihhxBmTMMIpUKIEYHqULed6nhHQ1nWPV2JvThXh4C51gO+PI9ixrLtGjSssfMtI
p2jSsO6qgJi4MyAPA7zZ1N/KLK/IUiL4jPE1qj5QfPtZOjOXp9uwAAJ2Y+jsRQDs
o7HKVJGxnso4TH365eWAQrexXZV6tw==
=g11E
-----END PGP SIGNATURE-----

--eDB11BtaWSyaBkpc--


--===============2046173892659066647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2046173892659066647==--

