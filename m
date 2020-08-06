Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63987C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:14:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C30122D70
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iulqYZ+d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVLTvmka"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C30122D70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3i1PfTVvBfpj9L7+H0ydMJWNVhCv+PBp6geNdGAYh5s=; b=iulqYZ+dFMlFbQd2v3y7XcM32
	KtAszI5VZCNc23r2qY6U0VR2PtbqoK6jyvUGeWNJY4IBxbaUkT+gqRjWzmqgPi5PXm/2IVGEtGDsP
	J0lKgRKsD5MfXxoMahuwQMH0tXq/2vkZhAJOBiwQPU3oW4PdePJqepOY+OYKkuy/IQM4Xfmk08i+j
	kYTQwyMt6rZ18nq5H7lnVRNTDUEaP5Tl1bNCyfLhhffUF/QPHlhtKWIsuTlkqpznBw3Dc62bAF8me
	T/qeeW5GxtZukwY64uLyOx7StT3wzFiodWCp1DR3odcPlJUvY+9x/E0AyXSmESC9F5F18/MBW7TNL
	Nl7ER2YZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3emX-0002qm-JR; Thu, 06 Aug 2020 12:14:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3emT-0002pt-JB; Thu, 06 Aug 2020 12:13:58 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E66DE22D71;
 Thu,  6 Aug 2020 12:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596716036;
 bh=O+Yq62Jpar2u7KQqkWw3dmiGoRjXxGUD+TIIm4JmqPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UVLTvmkatzujC2ujO9N7gWd52kh2sNsgn5jwQ+uywt+FYWEPpJBsVba/+L3uMReZm
 63eUsD7dqXhwQ2ECvgg8qWpw/0ZDSTubwwYZUAEirXTLleLjzlzlfRAOUraMbW650E
 RVkGTvGqJr2ao26DVT9G+MDQ9KjBGWZVD6ZAxpRA=
Date: Thu, 6 Aug 2020 13:13:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH 9/9] mfd: mt6360: Merge different sub-devices I2C
 read/write
Message-ID: <20200806121332.GB6442@sirena.org.uk>
References: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
 <1596558782-3415-11-git-send-email-gene.chen.richtek@gmail.com>
 <20200805161021.GK5556@sirena.org.uk>
 <CAE+NS360iKLoGxiiz8NmQqCp2Uge98Eehe4g2sn_N0e-E3DgyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS360iKLoGxiiz8NmQqCp2Uge98Eehe4g2sn_N0e-E3DgyQ@mail.gmail.com>
X-Cookie: Hedonist for hire... no job too easy!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_081357_700074_28FF63C4 
X-CRM114-Status: GOOD (  15.13  )
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
Content-Type: multipart/mixed; boundary="===============5421903888059771464=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5421903888059771464==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 11:30:56AM +0800, Gene Chen wrote:
> Mark Brown <broonie@kernel.org> =E6=96=BC 2020=E5=B9=B48=E6=9C=886=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:10=E5=AF=AB=E9=81=93=EF=BC=9A

> > It's not clear why this isn't just done in the device regmap, there's
> > exactly one user?

> because I use one regmap to access 4 I2C devices,

There appears to be only one device here?

> I need change the regmap_bus struct to fit I2C read/write with CRC bit
> Therefore, MFD reviewer suggests I can move the regmap api to regmap
> folder such as regmap-ac97.c

AC'97 is an industry standard bus used by a range of devices in
different subsystems.  You can already have custom operations for a
device just in a regular regmap using the reg_read() and reg_write()
operations which are there so devices that individual device support
doesn't need to be added to the regmap core.

You really also need to write a much clearer changelog, I would be hard
pressed to tell from the changelog that this was moving things to the
regmap core rather than shuffling regmaps within the device.

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8r8+sACgkQJNaLcl1U
h9B2agf7BQ0T2JHp32v4pfLGpKGHkSI9JcjEGjBwSmahI1cX35HCV5U268ZSJX3d
BLazy73BTK0mInugyZ9eWwpku1FaC3/t7Iof6Vm8rLUkpEPezWLYamGihace/tjc
qAUXy954H3ad8WHYtHulkoolE9B8YXr5hxMJ+vN8PNOYMkCuCWHlis1hR4ipH6mJ
9xdU/uD88UEf/E0JjxmKr/szzWQVrdfQ3pN7j1T5cl44fzYFXpyeH21pq+Qjg6tX
8moEToplBFHmRmrDPDryDbqRLHLhCLknTcfyAfYM8T9aZUysEdcSDDh/A7FQJ7cq
f2/PfBNJ2N1pmMGhdyZd01U9Qjr41w==
=qguZ
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--


--===============5421903888059771464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5421903888059771464==--

