Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7513BC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:06:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DCAC61073
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DCAC61073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xh0NuSE03dQnKamVWwRO0QdrC+SVNiWalQiCy32uHws=; b=PWTRS/LF7DYs3QsPw4JyxNlqS
	lVTEW/O6j00E4tLvrSb9c+jgNP9hV6IQMkdDqmw9a+t2flU1O0mtY6BP0tfznXjQ3uHuptRofBdQs
	loEm3eWrmOxtyyZPorUaFiVd0q013DvL83Q67pzuPdjw2T6vSe4b5UXcn/JqjtYrChUeIcxOzRz9i
	VyiwDi2ca+s2hjPCFX48c7GreFWJSG/wMeMHgleqQCzunwTtFn9z4jagkyNcubLIjerLh96qXurg9
	OvaxqGZqAYaR6I/7r0tPlpDxTzrMmivBStkBGp7I3Za4C6W05ebJxs9JCjz7WStGpitsKm8i/yBIr
	+kgopuDow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWxxA-00FSCL-LX; Thu, 15 Apr 2021 09:06:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxx9-00FSBy-CT
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 09:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=DezIAH4AmDcqIUTrS4PPiemjpPDDsxciut5qyuzdSI0=; b=bqsZi2YQqUBmm6hCCrkFKpuHdn
 pTSDjyCCovOZ816Ac8BAv7cV8w+1GZOBSMvUXwHdib4zH6HTwfKRiw1Y35h39B965bF1fOzViTn4B
 8Pf4MDsGMj9ZPwqz+doFk4V3/lqc8P+phA8SqsCf4CULgJSWEUPxOOwZQA7fjGu/0d81whDHHvsPd
 /HddN6Qev8Mnpvm2yyJBQ5YFrLgYzkPL5SOhur5dgvlBJLA1kLGwanizR8P3rlieI5TlXJ7ZcLISJ
 QE9UB45Jx7NDb5shtjCGiPj3XEYTQBVgGAYEV8qG1qF2iICEPyPnpLyAL+1uaMcXHKnOVTc1d+Xgk
 ZHS1IJwg==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxx6-008PRG-Lt
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 09:06:22 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lWxwy-0001Uy-K8; Thu, 15 Apr 2021 11:06:12 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lWxwx-0007rB-Fc; Thu, 15 Apr 2021 11:06:11 +0200
Date: Thu, 15 Apr 2021 11:06:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: thierry.reding@gmail.com, lee.jones@linaro.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pwm: mediatek: remove unused function
Message-ID: <20210415090611.jjbwoz2nbcam3kct@pengutronix.de>
References: <1618475753-102123-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1618475753-102123-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_020620_745738_221C8D92 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Type: multipart/mixed; boundary="===============6004191533370059513=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6004191533370059513==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7bpyeb4yz3dyj6pq"
Content-Disposition: inline


--7bpyeb4yz3dyj6pq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 04:35:53PM +0800, Jiapeng Chong wrote:
> Fix the following clang warning:
>=20
> drivers/pwm/pwm-mediatek.c:110:19: warning: unused function
> 'pwm_mediatek_readl' [-Wunused-function].
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Looks right, even though I would prefer to see a patch implementing
=2Eget_state instead (which probably would make use of this function).

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7bpyeb4yz3dyj6pq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmB4AgAACgkQwfwUeK3K
7Ak5AAf7BTvu8rSzXv1FOdNJdLxf7+YfcvZs28wu+8AjrB4lxsn3KmModBJ0Zd3S
kWP2SjRYH6z6yufXwBLo+hePxCVf4ZXwtNcpjX3KS2DMiDNh3W4maCwdWwuLbuVq
Tkwvbw55qamozBBxcMvNO2NeQMk1NRoS5H5kG3sJbOppG7zaALoNz4WEEu8ByNXt
1v8d+FWjdAAfaVQnLI1ndYC1AWVkdKEjQLO6FkMQ2F/hVzRzZqnFoxAqgqYyZe8f
F4cAA9JWdK5MC5uAtCm0QfL1FFs39AZ5Y0jRkZDug5swopt6nSHS6zm6HZhJydTo
nWOhe9Ugom7Yq1L+XSiWIO8NWhq4XQ==
=wl9M
-----END PGP SIGNATURE-----

--7bpyeb4yz3dyj6pq--


--===============6004191533370059513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6004191533370059513==--

