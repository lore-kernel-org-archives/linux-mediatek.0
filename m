Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BACEB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 09:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjvpbNWsSmKt2It/I8LUrF/jvCM4G0n4hG6hijOnhSA=; b=kLdf98SrhE5AVsnNxNKXtuvQOx
	zwHTUmz4bj8UReYg1Xg4Rjt9x25LF//y9oDsxQlIDAtFLHxydIIWCMr+VYKAt5kN1TIIDeGVdByHC
	n/h/cHzYYMNBgNnhaAT3/s6Z8sQPyN9Zut79ILtA5+Af7H47+9VvtRiHkOiKj6mG0tIljyeLO8loP
	d6kqBH7Wq7ddvPNAns56vsrFaDuSCP2rCL0zeQGGzGvLBueC222aRwngkJxLkOIXi08PLV6SL6Duz
	rrXxAOdQ9TE6Ea20INYfQJ0m8YstO49F9OjZDluG4KnUbO5vfOFbwNPFAgscl9PqipgrggFvFhF+m
	NzdszabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGGD-00A1k0-1j;
	Mon, 03 Jul 2023 09:54:21 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGGB-00A1ib-0m
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jul 2023 09:54:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qGGFi-0000sj-6H; Mon, 03 Jul 2023 11:53:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qGGFW-00Blsj-7i; Mon, 03 Jul 2023 11:53:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qGGFV-001phL-C8; Mon, 03 Jul 2023 11:53:37 +0200
Date: Mon, 3 Jul 2023 11:53:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yangtao Li <frank.li@vivo.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, heiko@sntech.de,
	hayashi.kunihiko@socionext.com, rafael@kernel.org, amitk@kernel.org,
	alexandre.torgue@foss.st.com, linux-tegra@vger.kernel.org,
	thierry.reding@gmail.com, jernej.skrabec@gmail.com,
	miquel.raynal@bootlin.com, srinivas.pandruvada@linux.intel.com,
	festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
	bchihi@baylibre.com, florian.fainelli@broadcom.com,
	daniel.lezcano@linaro.org, chi.minghao@zte.com.cn,
	jonathanh@nvidia.com, linux-rockchip@lists.infradead.org,
	agross@kernel.org, bcm-kernel-feedback-list@broadcom.com,
	linux-imx@nxp.com, wenst@chromium.org, rui.zhang@intel.com,
	thara.gopinath@gmail.com, kernel@pengutronix.de,
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	s.hauer@pengutronix.de, linux-mediatek@lists.infradead.org,
	mmayer@broadcom.com, matthias.bgg@gmail.com,
	DLG-Adam.Ward.opensource@dm.renesas.com, johan+linaro@kernel.org,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	niklas.soderlund+renesas@ragnatech.se, andersson@kernel.org,
	linux-kernel@vger.kernel.org, shangxiaojing@huawei.com,
	konrad.dybcio@linaro.org, mcoquelin.stm32@gmail.com,
	shawnguo@kernel.org
Subject: Re: [PATCH v2 01/15] genirq/devres: Add error information printing
 for devm_request_threaded_irq()
Message-ID: <20230703095337.27bhco7nkqtxr4me@pengutronix.de>
References: <20230627101215.58798-1-frank.li@vivo.com>
 <20230627110025.vgtplc6nluiiuvoh@pengutronix.de>
 <87h6qpyzkd.ffs@tglx>
 <690b12b7-5586-6ade-de83-99f463bc8397@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ifm6dkdtwbp3ztq"
Content-Disposition: inline
In-Reply-To: <690b12b7-5586-6ade-de83-99f463bc8397@vivo.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_025419_277766_1414BC4D 
X-CRM114-Status: GOOD (  10.89  )
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


--4ifm6dkdtwbp3ztq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jul 03, 2023 at 05:13:29PM +0800, Yangtao Li wrote:
> [...] v3 has been sent.

Please make sure that you send a v3 patch series (at least) to the
people who gave you feedback for v2. If you skip people who had general
concerns about the whole series, this might help you in the short run
because they might miss to also criticise v3, but in the long run it
might result in a loss of trust in you.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4ifm6dkdtwbp3ztq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSimqAACgkQj4D7WH0S
/k6WAQgApvFvslry9NwR8H0z4aDKfgwg20hFIuR9LFKWPzquLmB7y1nBdA9z1Mpp
Ybkb+E4cxXIe/uFWnm7mr+SlHuHQdwR6b983iZQjHGYCLiqxcAcWzp0W+b/ZH8JZ
AYUipaQ9T6hm8Kqh+HgQN5VhXv7PM0fQH/yoBNeEF+CDsMwGMAoViefMhwHeZLx2
+yHExhGOQNgoN2ge6GgpvdryJJ1NSl5PXpcyCG+1ED6a1pGmueDK5ipp+dMaxOQg
l3/9ECPLYTDvPK4951UMlOuWdVG5qKqYw8q9Z8I5QGTav+lKoshXgpbAbQnHNpv+
44KmixTXlQmRdC4XP2f1Em3/fP/8Dw==
=4vu6
-----END PGP SIGNATURE-----

--4ifm6dkdtwbp3ztq--

