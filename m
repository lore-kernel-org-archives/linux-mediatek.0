Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8B3C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 19:05:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7881611EE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 19:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7881611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VL7p8uaD0MRqDeuzD2kdIodgAdVzne5yYcx6gXSHaZ0=; b=aJH5YIbuGg+bF4+I9JBnDH9Gur
	SI7xd4HpLftK3wf8MtvOSo50fHe5hasEPW5T1Vr9BHPYG0iBFKTjmE4c6OTenOrVInOOfnl1kMi1a
	hM1keN0erg9VQ6wqydLmgHhqbwj0CQFlVnfJywqkzEbhT7aqsRpVtZa/24uTrHMQLNSf5H07PfhWr
	DP+T/baIYcQdXo6jLEGykdS85MnM4BKFUlsXO+LFs8Rrdq4rPg2c82N08RU6I5bGzqRDKgt8EmSr5
	vbeIGKVd0NasznKe+2r44/oeIxahC/53BthtWk5FvirvRJb/DfLJaj9yiUegNarCdUK97SxY+O3fq
	i0HmdS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltENd-002Jmp-6G; Tue, 15 Jun 2021 19:05:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Fw-000ByJ-2j; Tue, 15 Jun 2021 13:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=do5/Ft0Ug2QKKV16pIjm1Cav55ZqsPnnwJ2SakLmvUs=; b=VX7/S9+om5xKCw4/NZY1uJ4AXI
 2F9H5ld6FzptKMaMLb1w4hdtRMnPWSX7j9O3PZyUGOGOM9bDZ+y2lgWXTHb2cYkXFfXm2VSzBPMTL
 fM8zBVuhI5Jqt+ENEhZ/qLtS9kk/MkHxXgv1JYkTSozXnjNIg/kkomCG3siCa+jWbvITWZ/IoDBPF
 QwgnGyvFexJ/2PWsa2jGjpMYHC5DuCpNIgAaWQS6mtd6P5oszuCgJ6dFBIC2F7RkvCS+/PBUnnto5
 r9jWTGBHhrV6OkHmA3TmZHsy5BHdaJ843Dv/lCzK1EUBNo10ZyktRjGYFmrIR1Z28wKi77COa1DKs
 36epJqKQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt71l-007lZg-Nl; Tue, 15 Jun 2021 11:14:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5031661019;
 Tue, 15 Jun 2021 11:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623755684;
 bh=do5/Ft0Ug2QKKV16pIjm1Cav55ZqsPnnwJ2SakLmvUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s5659nm7mU8dbxL5ejjETuQPnC819oWthIJGpuxoabBaVSQZEW67rqKNug+7bEK6p
 70b7X9PRCzK5cXOMptsXhWm7vN/I3GRo9emqOZNo3amltpwwkP777VMUVTDwM4y91F
 PCjbtDFwjk3B8zPdN3UxZCqMA7mcYd9LTEyglBgm092Z+smm3naHWPj9rUtJ7Uuefk
 oWdwi+U/f+GbYFThQBY3oGcf8U/YDxZOT0yblQOqm2IPthiSWH59Vn5AA92gCztV81
 bYOgY5bxw0QLMNv7nOt93OT4E8nAb2G8DoXLEiSDwehLcQQ/OFTxlM96TpaB/SkKuK
 dSeNH+HRii2Pw==
Date: Tue, 15 Jun 2021 12:14:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Mason Zhang <mason.zhang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 hanks.chen@mediatek.com, linux-kernel@vger.kernel.org,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-binding: mediatek: mt6779: update spi document
Message-ID: <20210615111426.GC5149@sirena.org.uk>
References: <1623721803.24597.9.camel@mbjsdccf07>
MIME-Version: 1.0
In-Reply-To: <1623721803.24597.9.camel@mbjsdccf07>
X-Cookie: See store for details.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_121448_763123_9D73D305 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6548161644396611707=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6548161644396611707==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s9fJI615cBHmzTOP"
Content-Disposition: inline


--s9fJI615cBHmzTOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 09:50:03AM +0800, Mason Zhang wrote:
>=20
> this patch update spi document for MT6779 SOC.

I don't have either patch 1 or a cover letter, what's the story with
dependencies here?

--s9fJI615cBHmzTOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDIi5EACgkQJNaLcl1U
h9DQ+wf/Yux273+r+yGK72dvXlm0Ap8q0DbSKRRXYm+S8/dxa/Z4yP6+Oj994oi6
AS5dArwtt0+KTpwXnxX/J9oEhOtSMfE2alLqgJ02tjbog38w1z00WH07fe34Ni1C
XH49gqs9bN6JhcXFeDI1VgwzzKDS+6/ZG9CFWlv3394hE4pKtxs2s2plneaqj106
voLcaPSGCJrwtiXG+xUmZO+KzBZhx/ZKAOYZ66k172OuC3eGzGbUANSDlnp7MdPv
IuKwLhwGPQDzr721R7jq8/7zVfrj+hv4lzgrV9lDCBQvpwM/hR9sPFKBbCUM+S9l
nh9imKNN80d/DKW/HQWZ2IwMTWhAyw==
=ux+v
-----END PGP SIGNATURE-----

--s9fJI615cBHmzTOP--


--===============6548161644396611707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6548161644396611707==--

