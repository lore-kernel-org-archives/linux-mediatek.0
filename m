Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1384CC64E7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 15:17:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC192076C
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 15:17:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w3vQEOqX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jm01DLEJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DC192076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tT4LEyGXqu8IMa4ds9sRt2d6jHDpCWn46ayerRjG9UA=; b=w3vQEOqXR4PvhGZZW5HRM0TyO
	kaPcOQRYxk5AUdSNMMRyzZkb1dvrAcY6Q9SIPCAW5qzyAapB2JC0pancOJDIv11VITXTdOw3R9tQz
	ZFYRCvut8c6HM41F/TGuCl/X/o1I49PZylSU80twPXdjZmeJvyVug2iJvPFOVe+CUueQcdh1FA/Ab
	3EenvUWswy9EhKseDUWl462SjQBhK4/rfCfSFZkKC42KV2F0IbMb9HuZ0IjfwfhnbgZwkBeA2oUMj
	Ys3LsGvP3L+dmTIaSaTRCfdnoOIxdyj2hN0BiSzoP0aZBADBB9KVb0tdNhM3O1lf/SbfFeHh9NTBi
	GIMQ37Z9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk7P4-00018k-MU; Tue, 01 Dec 2020 15:17:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk7P1-00018J-V3
 for linux-mediatek@lists.infradead.org; Tue, 01 Dec 2020 15:17:16 +0000
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 835362084C;
 Tue,  1 Dec 2020 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606835835;
 bh=dGfNSOBgGRBJkk/Dgt6x48Q5cXIZYVgrqNOCHjMDkls=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jm01DLEJUVd9ljYXUFOFnvDXYouaD7xBo/EfaVWKNbXZaKWnA8Enq2kgNj3Dzr65D
 9+v/oLboL5EjgttiJnoat4rw1L/ku95iNEl3J7Dtn4AlshxKZvoGi4tm95B8LEE38b
 6KKT/FCY/dFGKul8AkDWrjXE1u12QzCJedmi23XQ=
Date: Tue, 1 Dec 2020 15:16:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Shane Chien <shane.chien@mediatek.com>
Subject: Re: [RFC] ASoC: Add compatible for mt6359-sound device
Message-ID: <20201201151645.GI5239@sirena.org.uk>
References: <1606801293-19472-1-git-send-email-shane.chien@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1606801293-19472-1-git-send-email-shane.chien@mediatek.com>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_101716_107596_66BB9F9B 
X-CRM114-Status: GOOD (  13.92  )
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
 chipeng.chang@mediatek.com, wsd_upstream@mediatek.com, fan.chen@mediatek.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com, jeter.chen@mediatek.com,
 tzungbi@google.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Hsiung.Wang@mediatek.com
Content-Type: multipart/mixed; boundary="===============6210792449519564952=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6210792449519564952==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xQR6quUbZ63TTuTU"
Content-Disposition: inline


--xQR6quUbZ63TTuTU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 01, 2020 at 01:41:33PM +0800, Shane Chien wrote:

> However, if the device is not given a comaptible,
> of_node of struct device is null. I cannot use
> devm_iio_channel_get such iio interface to get
> auxadc value from iio channel. Because during
> using devm_iio_channel_get, of_node of mt6359-sound is a
> input parameter of of_iio_channel_get_by_name.
> If the of_node is null, devm_iio_channel_get will
> eventually return ENODEV error.

I would expect the IIO channel to be requestable using the top level
device for the MFD - part of the deal here is that the function drivers
for the MFD know they're part of the MFD so can look at their parent
device for some things (eg, this is how regmaps are normally obtained).

--xQR6quUbZ63TTuTU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/GXlwACgkQJNaLcl1U
h9BAOwf/YpwGU5QaZRcMFXBXVD7bkQtu2EutCs5svrbEIbr3lA1niZuznQAxi+6a
EJCmeJQMOhfM1eWqoPsMR8Ys1EKuWKLwG6YQWS08MaQnTYWfxbrUOVojFD58OzaL
hQo4Yi/3k08L2Hne44kqKBRtlKsOUinIUZi3Bfd+kApSW1EpnKsSr91qfyTJRFrx
7qBCTxt2qNnd47lDqIrDEm72iyFR9SyCAttQJCGBnqm6ByFEhZgGQh92GOZfWG/w
Ubq9Y3f3nY08xj3kCQD+H8HAjTPh8zdtXk5oJe8X80j9FyZDbQ01GlFkcnWeL7+p
cc8ntzCYuiapNx0EQQhYBOrTDUkX8Q==
=4ZF0
-----END PGP SIGNATURE-----

--xQR6quUbZ63TTuTU--


--===============6210792449519564952==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6210792449519564952==--

