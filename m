Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132F0C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 21:43:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4F272073E
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 21:43:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rDnvv7Et"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4F272073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kjf0CC+iLgNXbLvhg6bJAVI2dpvv7xr21CvYhyquvCE=; b=rDnvv7Et9IcfDG4kXWLIf3Uoa
	uV6YCUZGzhP6gbyFdO2QbuUzj2LfkEnUlohDUJA0lGCoVyVFkoHkrYaL4Ad0fTOEqgDtHmngDyIc2
	pZlUuNl+dMC7zjQCiaAHZyJBv2Lxb8BB9KVxTE6x6uM1vApSwGd1vDs0L6/De0bjlQucgzZ2foJiu
	EC1KZ4wycKqS/ORpyGTwnVveD3553MYJvu4FvdXaxzHsO9kUOSMFx4jZuINNW2aLI4O0VwoxcgrXr
	rr8W9JRjETVN2otvpPHC2I2nE4wMTrCAMfYInEG4VHrhJ+ifXkl+REiHNpF0q8YPFGBmAW5f3wAil
	3Upos7Q+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3RBV-0002Au-P9; Wed, 05 Aug 2020 21:42:53 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3RBS-0002AK-5H; Wed, 05 Aug 2020 21:42:51 +0000
Received: from localhost (router.4pisysteme.de [80.79.225.122])
 by pokefinder.org (Postfix) with ESMTPSA id BF3252C0829;
 Wed,  5 Aug 2020 23:42:47 +0200 (CEST)
Date: Wed, 5 Aug 2020 23:42:42 +0200
From: <wsa@the-dreams.de>
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH v3 0/4] add i2c support for mt8192
Message-ID: <20200805214242.GA2182@kunai>
Mail-Followup-To: <wsa@the-dreams.de>, Qii Wang <qii.wang@mediatek.com>,
 <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
References: <1596624742-14727-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1596624742-14727-1-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_174250_348402_CCC1F7EA 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============9054226772534668723=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============9054226772534668723==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2020 at 06:52:18PM +0800, Qii Wang wrote:
> This series are based on 5.8-rc1 and we provide four i2c patches
> to support mt8192 SoC.
>=20
> Main changes compared to v2:
> --delete unused I2C_DMA_4G_MODE
>=20
> Main changes compared to v1:
> --modify the commit with access more than 8GB dram
> --add Reviewed-by and Acked-by from Yingjoe, Matthias and Rob
>=20
> Qii Wang (4):
>   i2c: mediatek: Add apdma sync in i2c driver
>   i2c: mediatek: Add access to more than 8GB dram in i2c driver
>   dt-bindings: i2c: update bindings for MT8192 SoC
>   i2c: mediatek: Add i2c compatible for MediaTek MT8192
>=20
>  .../devicetree/bindings/i2c/i2c-mt65xx.txt         |  1 +

Applied to for-next, thanks!

Sidenote: I get these warnings when compiling the driver:

drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member =
'min_low_ns' not described in 'i2c_spec_values'
drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member =
'min_high_ns' not described in 'i2c_spec_values'
drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member =
'min_su_sta_ns' not described in 'i2c_spec_values'
drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member =
'max_hd_dat_ns' not described in 'i2c_spec_values'
drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member =
'min_su_dat_ns' not described in 'i2c_spec_values'

Is someone interested to fix these?


--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8rJ84ACgkQFA3kzBSg
KbaEHA/+KvbFEMpITq+MxiNEPFj85gdA4wGXCkfrVZ0ucfvHnQU7S+zzRFIOIRui
TJYm+r6YkaNts1hpKSV2h6mP2W9KjtwfywdFXdQiGYR+n5UD60xt86xISYDAsjja
rOjncjqqIqL2mDgWSUc7lZ8GV/XxJBRgRn6uPcsGuejwHWtJEWn9r0sd4YqveK8B
jwvxACdtCONziOz/YOETM7mcCB3aKvFA9gmF+Kq5UI2k6U4HzZmHRnEIC+nwmlex
kQoLGct58EzbksSOwqyf0wQLDAKdvbRR+0OHfnXB1c+hf7SSRScdtU1UD5KqZrFo
sZea8kaMC9BGAUhimBp3SBkSdWm+w1vlK5L/iLdUaKH4GMZbvMcjn4INEOlvcPvt
ylpjhlmsHebQ1sbMnrS4PtRbswT7bRIQh0af+Ei8W3YMwG/K0BoMs7VDbAzGDe5k
VWZXSAG+F+3Zi58x7gCiYShLm0tdxdIm9oUuRc0ottyXFHXoZQTLESxpQkMgcShE
n1+HbCzOzvUTgHuzOOxpxcKx6FM+Og+b6vGQIt9nyUQJZ/HaMAmFXBsGemvuXmhh
k7rTAxmflWpS/iG7i70rZhiek0vEYpMHzF2o4tFHVO0/c2zslDX+eK7ks8/HEZPv
LbTGwQerJ/ZPksOcAaYjB/kQjB7NPJUQ6VbHUxAluYC/mTRD0aM=
=1eF5
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--


--===============9054226772534668723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============9054226772534668723==--

