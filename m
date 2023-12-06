Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43268C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 17:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVvKb6i7wo7hYt34/eMVmwbOEhX11Cv22+paj5pF8JE=; b=v0H4l2Vn76IHpmFad8apVcNLmS
	zNAMlgTm611/H5ST3gAkoH5jkDMFjRN3drF5Y8UonsD3/pvsrxb6M1HOLqfjbrrzt3B/V5AzMcd86
	z/5ES8pgxIjA80aMzjsVkaCXFjpBWnkwh7BYpYbEoCTT6yyM95ey6FnD6NAKzJzbELWh093pENe4M
	deg4FjHi/zx50PoKyShJRGyx+KtZPebpk4WsDF3hfdIPEkqW8DSmt1UJklONwpRMRPuh/8Rq+1sgH
	w7hEFfxwBSC0THhgWJIBV9lK7FSTQCfQgRzmE7E0RezW/Xugy9gWESEqCzSq9UGMBTtllnnvRgSYr
	GXZPP0vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvrc-00AwOw-1x;
	Wed, 06 Dec 2023 17:39:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([185.203.201.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvrZ-00AwOC-0l
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Dec 2023 17:39:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAvrJ-0001zC-1c; Wed, 06 Dec 2023 18:38:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAvrH-00E0m4-Ce; Wed, 06 Dec 2023 18:38:51 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAvrH-00FdlK-32; Wed, 06 Dec 2023 18:38:51 +0100
Date: Wed, 6 Dec 2023 18:38:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 12/18] dt-bindings: pwm: add binding for mt8365 SoC
Message-ID: <20231206173850.s6dndsjeeuy3sjan@pengutronix.de>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-12-5c860ed5c33b@baylibre.com>
 <20231023214411.sbrdqgethas25rkd@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ywtlv6jlyscfsmgx"
Content-Disposition: inline
In-Reply-To: <20231023214411.sbrdqgethas25rkd@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_093909_299527_2BB18071 
X-CRM114-Status: GOOD (  14.91  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--ywtlv6jlyscfsmgx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Oct 23, 2023 at 11:44:11PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, Oct 23, 2023 at 04:40:12PM +0200, Alexandre Mergnat wrote:
> > Display PWM for MT8365 is compatible with MT8183. Then, add MT8365 bind=
ing
> > along with MT8183 SoC.
> >=20
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>=20
> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> What is the merge plan here? Should the whole series go in via drm?

I'll assume that Alexandre will send out a new round of this series and
this patch isn't supposed to be applied as is to the pwm tree. So I'm
marking this patch as "changes requested" in our patchwork.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ywtlv6jlyscfsmgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVwsaoACgkQj4D7WH0S
/k4hSggAle3BHyJ1MVsRw1KxYXPxxCujjOlC/iVTOF+lNCnkFIgsBCP3LIGUb/Vw
5cmRVOyQP9gr52PMZeQo7aa3eMxhZqixVS3FbEWppG6kPVCE2RwP6CV7SfP7N3Hp
VjKdzXifWVgRH366u/RaWoVuLftZvofZFYMTtF24KxoH0r40anqojRtJYYLwy/np
NDqAUYu3WNdjYKWsNa1s1PBSlasbG0B7bcAP5RfRuJXoTuTssx2XxrbjLcpu3Zhr
jPMxcBS60BO81t/LYCTMHDz6RNHpacGnRHTeWbnUaZm1SuHpyFuRGSAfIBkAmDGX
DXzkv8oxnnoFs+g0fj0LuxnlSkXixg==
=95Im
-----END PGP SIGNATURE-----

--ywtlv6jlyscfsmgx--

