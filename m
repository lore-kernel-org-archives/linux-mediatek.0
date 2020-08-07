Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E52EC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 11:17:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D96E2075D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 11:17:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1VShAUNu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="If8Hdv3J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D96E2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bvQK0/VFnWcFV4JN27M1L2TGfG4dCCtwaOnAV35p+Wk=; b=1VShAUNumyCmNZcBslFy/wp9h
	egR+2jWQ74PPSjFHuDdjiFKkdh3D7Lz9leuv+nE1+wtbrHHAz1I9aaFDbgOlIaKhsnhLinclc8/qG
	oqT+9dRGxB05arrVkN5LD0TaOMX6GJvQc2pLnr7GUe1Q82PZaK3EzzMglblR+AVxRUu2UDMMiUZMu
	BANj4fX248/pGW3kax76mz5W+C+y+AwzJ8ZzQVon0ogiTDampreqLiCWKHaQoq+BIwA0RLUgFmZTs
	x+w8Df6NFBuWD3uszRW5dNEe9fVbThlLhSXZ0lZxhFyoe+NmV5z61A/HyYpu+rM9TwU9ZWJl9pTmi
	TS58kHMgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k40Mr-0001my-At; Fri, 07 Aug 2020 11:16:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k40Js-0008Cw-J8; Fri, 07 Aug 2020 11:13:54 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED96A2177B;
 Fri,  7 Aug 2020 11:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596798831;
 bh=AalJ328+Kw2GpSU7PvwDcyeAsPIWJzp6tH6Jz0SFfXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=If8Hdv3JWrN2SKiaxTY7ICzHgyqblbV+YiwLt02EBMz/LrhNhvN/Q/sw5wiwui2sM
 jxmcht9s2x6Jp8/V7PK0Y1Hv1/SCMjSDcgCKp6TRL46hqfQ73Hn6rQOAXul6BbYWC1
 cScDcgzg0GlDAN5Z9u43NWm2sGPaRvmVUTqmW30w=
Date: Fri, 7 Aug 2020 12:13:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH 9/9] mfd: mt6360: Merge different sub-devices I2C
 read/write
Message-ID: <20200807111327.GB5435@sirena.org.uk>
References: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
 <1596558782-3415-11-git-send-email-gene.chen.richtek@gmail.com>
 <20200805161021.GK5556@sirena.org.uk>
 <CAE+NS360iKLoGxiiz8NmQqCp2Uge98Eehe4g2sn_N0e-E3DgyQ@mail.gmail.com>
 <20200806121332.GB6442@sirena.org.uk>
 <CAE+NS37tr65GnTue89wJkPvJzddahKj__KPgzmjzwkOfWQnc8g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS37tr65GnTue89wJkPvJzddahKj__KPgzmjzwkOfWQnc8g@mail.gmail.com>
X-Cookie: Disposable, use only once.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_071353_004359_94575C22 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: Gene Chen <gene_chen@richtek.com>, rafael@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: multipart/mixed; boundary="===============9053874516443709737=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============9053874516443709737==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline


--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2020 at 10:16:08AM +0800, Gene Chen wrote:
> Mark Brown <broonie@kernel.org> =E6=96=BC 2020=E5=B9=B48=E6=9C=886=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:13=E5=AF=AB=E9=81=93=EF=BC=9A

> > You really also need to write a much clearer changelog, I would be hard
> > pressed to tell from the changelog that this was moving things to the
> > regmap core rather than shuffling regmaps within the device.

> MT6360 has 4 I2C worker devices

It's still just a single user with a single driver.

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8tN1YACgkQJNaLcl1U
h9DvqAf/ccwwW2FC3T3xh4YHttvbhhV6yhTSQkpczkqwcVenOgtKJKVK+iZP8LyV
Y9McD3B0rSmN/uEIEASXLkWZL2OMQBLE4743J4oIv0xsbi8rIugjXmE7o00is7QY
ZFs587wrz0YEdfEaQN+rX559JCAoo25IbONlya/hhCSfAyYo3jtJK+rKRXbNBnk6
MCeMAg2RGiL1UGHVXcWT/czs/pYilonaX7cQ56CnbdpiRCbmv3DNanwGvvrfx/vl
D3wyuvK8f1NucQMgCMkWAE5dROcgka22mqd2T+mdfP5SWmID4H+Eln0NmG2QAEda
DHWwC7CDn+MepI6basM9jZOdWnSdgg==
=39J1
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--


--===============9053874516443709737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============9053874516443709737==--

