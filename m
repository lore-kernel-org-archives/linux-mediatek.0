Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246C2C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 19:49:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAE6420706
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 19:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ezoBOnnO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="unHmRmq5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAE6420706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uLv5wdBIM4vlY6YMx9ASo74qV4A6Hxb5QnKzYIUp/9g=; b=ezoBOnnOmEhwnbV3uGHk5yqtn
	fYyrZTlUp5ZJFc4ucDZGzE7X326i0VH0PYp5cTvZIYRop8j7R62Mi3LNE2WldaYgjwRxOgNYcOS/b
	NJ9EoYM141OOil7xxTAVya922r91v4HvTA9YXSqhDBLgFt5ZidT6Veq6CIIdrBp37OZppJ7r5rwNY
	oAA/jpp2HsGM/L89IdvL5+9TPY7Khb0qCbVyM+H7v1Aq6bStxgBlUOLjItil9jtei0YzBnqi1mXVA
	BJLHya5ByTLZSGHPKmhBPpWw6R0FlVVrb5fWlKthbPCH0+kMAZ0B9Nxlno4ssCsl736CG0zyCvkWy
	UPtyqxgLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAIT1-00075I-V4; Mon, 24 Aug 2020 19:49:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAISx-00074R-Pu; Mon, 24 Aug 2020 19:49:16 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 342F520706;
 Mon, 24 Aug 2020 19:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598298554;
 bh=mwscSKU6PEXC91lvhthJtvDN6yZmk6pyRkDdDWHNMjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=unHmRmq5SzE2wUxKaRZVNXlbJunyWBVrwYm8Sosw6nG18Exlno4oGHKWx1QLCg1lN
 2WItwmNJaNTUoFLUJ6i3d5bctlz01NLYcjdTYJrtOEjGJhewcNBfajxu3y/E4wq0Ne
 zb+8EhZqZu85SzjqP+4/e6MXt1b/OtsHBPg2f0Uc=
Date: Mon, 24 Aug 2020 20:48:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: mt6360: Add DT binding documentation
Message-ID: <20200824194840.GF4676@sirena.org.uk>
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-3-git-send-email-gene.chen.richtek@gmail.com>
 <20200820113015.GB5854@sirena.org.uk>
 <CAE+NS36C0AwbrFJdYGY6_n_g3DVitp_e1GfZUxjMbKu1bJ_t4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS36C0AwbrFJdYGY6_n_g3DVitp_e1GfZUxjMbKu1bJ_t4w@mail.gmail.com>
X-Cookie: Weekend, where are you?
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_154915_998959_2C4F9510 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree@vger.kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1012980455244729755=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1012980455244729755==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2FkSFaIQeDFoAt0B"
Content-Disposition: inline


--2FkSFaIQeDFoAt0B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2020 at 03:21:57PM +0800, Gene Chen wrote:
> > On Thu, Aug 20, 2020 at 03:53:42PM +0800, Gene Chen wrote:

> > > +  LDO_VIN3-supply:
> > > +    description: Input supply phandle(s) for LDO3

> > Only LDO3 needs a supply?

> LDO_VIN1/LDO_VIN2 is real MT6360 pin supply from VSYS to LDO1/2/3/5
> LDO_VIN3 is also real pin supply from BUCK2 to LDO6/7

So shouldn't there be a documented LDO_VIN1/2 then?

--2FkSFaIQeDFoAt0B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9EGZcACgkQJNaLcl1U
h9C+yQf+L9lKWcQ3xqYmQlPlgMYNCT+yaAkHdHpJM6dVTHnNOqyv/z73C/e/NU6N
JtvI9bR0aFytdFSRmSsfEhHmd0k2XzKAqqT66jzCLZTpT0BGtDxhQ+DLjaACr6Hm
n3wwxVJQx0ZpQd5zUijzCfHbStmLmPf8qHfiedPGYsdNZx2T76kAG4p9kDh3/sz0
tCW2DuMt2YGEbk8NGvCsZop7n7fCNQA6Ap1mdlJY7pa60ARNFxvLJHqYEDHZiLgB
cjbeVNOwKcT8ujUGvm2cRKL92qYi5b7xDHRGKqNgM0kJ3QWvzBgGDxNGak5IicVo
OGjqBFp7aLfwRU1KePiVK2qoXdKzxA==
=0Aah
-----END PGP SIGNATURE-----

--2FkSFaIQeDFoAt0B--


--===============1012980455244729755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1012980455244729755==--

