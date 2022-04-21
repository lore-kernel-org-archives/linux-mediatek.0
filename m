Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549CDC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 13:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hh7PZJk+lHwWlxsESYvZUA6h+C3NMyIKJdtCw2KF3K4=; b=OmN41VCerueQmAGEBqAmVqbF9T
	PI50ZOzYJZIrHKJuByjfN3QpyVxvXEDa9WjW5Il3K0vZpaSfD/aYdoUXiwVX0X1ZPsd6mhSPjuH7u
	OtrNi4ZM9KX1E5f3noxsZTYNaSmmzUijWquUNS1Cg5LAujO7yzhdZoDewhabgVGNS1Dh+RFnQd8Po
	/4PP0DUFi2xJMQ4h62blOl67+ny/ONo4LAT2xWghe24S8U0doU3lj+u9T8t9Ue6YlRDuCHDQUR7Wr
	PcauxQGvIayVGCOPsfU+M3EeOwhYi4ugviOblNEFa+cT2mnfkvEu2U4d0rxWF8n2Va6Jqt2fGS2vx
	QbCsc0Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhXAj-00Dbx5-Vb; Thu, 21 Apr 2022 13:48:37 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhXAh-00DbtJ-5o
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 13:48:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nhXAT-0005v7-9y; Thu, 21 Apr 2022 15:48:21 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nhXAS-004N86-2u; Thu, 21 Apr 2022 15:48:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nhXAP-004hN3-N3; Thu, 21 Apr 2022 15:48:17 +0200
Date: Thu, 21 Apr 2022 15:48:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: xinlei.lee@mediatek.com, thierry.reding@gmail.com, lee.jones@linaro.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rex-bc.chen@mediatek.com,
 jitao.shi@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6, 5/5] dt-bindings: pwm: Add interrupts property for
 MediaTek MT8192
Message-ID: <20220421134808.sqnecvysuzlgdsz5@pengutronix.de>
References: <1650284456-16407-1-git-send-email-xinlei.lee@mediatek.com>
 <1650284456-16407-6-git-send-email-xinlei.lee@mediatek.com>
 <a92d3b46-ace4-2d19-fef9-c59cd1a596ce@collabora.com>
MIME-Version: 1.0
In-Reply-To: <a92d3b46-ace4-2d19-fef9-c59cd1a596ce@collabora.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_064835_241304_350CEE09 
X-CRM114-Status: GOOD (  15.54  )
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
Content-Type: multipart/mixed; boundary="===============8258677146173521948=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8258677146173521948==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g74nijuruvmiaccu"
Content-Disposition: inline


--g74nijuruvmiaccu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Apr 21, 2022 at 12:17:00PM +0200, AngeloGioacchino Del Regno wrote:
> Il 18/04/22 14:20, xinlei.lee@mediatek.com ha scritto:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> >=20
> > Add interrupts property of pwm for MediaTek MT8192 SoC.
> >=20
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
>=20
> Hello Xinlei,
> the pwm-mtk-disp.c driver does not support interrupts.
>=20
> Please add interrupts support to the driver first, and only then
> add that in the dt-bindings.

in my understanding the linux driver state and the binding documentation
are somewhat independent. Here I'd say adding the irq information to dt
without the driver supporting it is fine.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--g74nijuruvmiaccu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJhYJUACgkQwfwUeK3K
7AmXqgf+MrAe0PFC2xF5YzOIK5R/MGmmmV3pJNlax2M2UkDsWxeavnkcBOQcilzv
ln6uRHHRETr5tUiBEZBTPVgX8/suEhfhw+/EPtUSH/LUK9cMEAxsSjZItwZCjzUi
+4SKV+24sivp5jfmsbyrZCKsGDNjDynXf3DBVcJbB4MLWl42NDVTIqqxA0hQe7Of
pfwrYWjTX0MM3ZHBN3vA7reDg/d+qvoDwxn6dHT0oRvXmhyH7xhQ5N2KxkhGPBpP
MJv4P3O37I6QygsplJHpJaoDv7zAYSJXx4wk9w1vp9vj3fZxVB9TsP9m9ILZx30U
9PmDnaULNIt8tZukhdV4M8VDymcQJA==
=vy1d
-----END PGP SIGNATURE-----

--g74nijuruvmiaccu--


--===============8258677146173521948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8258677146173521948==--

