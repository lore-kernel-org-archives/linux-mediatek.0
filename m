Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EE1C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 09:26:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6096A2068F
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 09:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OOZ+rx09";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRavcvUv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6096A2068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AJSwBpv6qrGxAmv3HzNH/tTE2DZVMd0kgUj31X1/T1Y=; b=OOZ+rx09NfVJymhLwUtlRkzsS
	C43WK3DwZkLle1i1Tkft7hpYbEW1cb4yvGbWqM4Jc6s0TxA0zX0+vrJKA8EmxS64cu6tSb05be1fE
	qpuOF5y3oZmjgE/byIte114FOOnSXWUrzPnZtVChMGJCoG4AyNKWO3xc9xSo4sZ0k0fleI9AVt6fd
	5COjF4OWsH9X8HFzG1F5LEKds/j0t1rjvuqUiTf8oK4iR8DJUfHY6Xi0XkAb48zD/HZxfBijttI7Q
	CDHsBBntolp5CekmGRLz4Hobm+3SafhRS624Z6gZGokLCY1xlbkxuYlGlhC5iL7lns558sjISVjdv
	+Z9aGA0Vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAVE5-0006EJ-CW; Tue, 25 Aug 2020 09:26:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAVDy-0006Bg-Av; Tue, 25 Aug 2020 09:26:38 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 10BF02074D;
 Tue, 25 Aug 2020 09:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598347597;
 bh=xjRUlLJiGzDBfJ7+riJgK5GH7YnvOwbUoZtfaHvq9m0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WRavcvUv7eOhBnb8hi8CS7GITp1H59HeJh1ddaYOVbCy65qJuN8J/LYy7j2gUkqkz
 Zh6TiUnjR6b4ZpwfS6oxvmO0bVWNnvCUTzhyu4UI+M8xcKhgFig8Jf8X276o1Kvonb
 ZVeTg/9DI3JKU7BnJWF0LAB4i2rsaw59lpZ9Xw3s=
Date: Tue, 25 Aug 2020 10:26:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v3 1/2] regulator: mt6360: Add support for MT6360 regulator
Message-ID: <20200825092602.GA5379@sirena.org.uk>
References: <1597910022-22617-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597910022-22617-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200820114524.GC5854@sirena.org.uk>
 <CAE+NS34WuWnT7zvsHhaciWVLT2y0wpwt0wXAp3UmjEuJ2its6A@mail.gmail.com>
 <20200824110458.GB4676@sirena.org.uk>
 <CAE+NS36ZK2pq8CAcmiqiUf6Ph5RET5aO4nUPFUd-EDHVEuharA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE+NS36ZK2pq8CAcmiqiUf6Ph5RET5aO4nUPFUd-EDHVEuharA@mail.gmail.com>
X-Cookie: Don't get to bragging.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_052638_434377_98431819 
X-CRM114-Status: GOOD (  10.86  )
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
Content-Type: multipart/mixed; boundary="===============0650487268954001736=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0650487268954001736==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 25, 2020 at 05:13:43PM +0800, Gene Chen wrote:

> Should I use dev->parent->of_node and set
> regulator_desc.regulator_node to parse each regulator definition in
> device tree?

Yes.

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9E2SYACgkQJNaLcl1U
h9BTvAf/SKwBThcS5qz2q647IodkHIleD2IJYA6d9KuYw6T2O4sywHAL61N8i8rS
rYc/hL7MKpp4IuOQ5+jAmS4WhfMrzY9azyZJFtPkcGgs7JioJRT/VoiX8lvr77qP
75NOm9lmwqChKhRvkB0JWcnfDtLvQmY+Iw33HKOHcOPDifnyNtdpGN/oaPVkADvy
vH9MiSFgFumGInyev7zRGedPv0F2EnTD5S3sN0LchDPX8RZYV1ZRNN5mqaPOFxr1
hWZvqoRurKjSL9fCYNZvAc373RwfO9OfaDag/qrPe8f1b3cXxcou8spim5EofU2v
UsmwKIggTpgrLuXqu6tvFiw56F4TxQ==
=IKjm
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--


--===============0650487268954001736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0650487268954001736==--

