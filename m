Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2E8C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jS21SMY7LLJ9uQR7zi1696IU55qRBJE/fO3+8OaFGnI=; b=3u2hs3yYZhvTClT0k7tTKRpUeW
	rfPylsBYYQbDjntoGaWIyws1YQf7OH/GkG9poaONgdNiH2TgeZ1LCdffqIJ0kzibDNh00X5VrxZAU
	Vq3gIHX7lMukvT1SAJsWnzlQ5vLgAZxk2XnZjSpVthK+PwtV4Yj8+bJzXZtGA/gW1M8aQlm/KYbk+
	BBg9WJe/aqoj3lLIJ7OdbWzSOFHDUkEDRY+DTzt/y+dgWAD5JQnLuThhkuhCEFTrtzG6yHZcQ64xt
	PsElICMZEULI5cEnQa6iq0TrPgq7eMCtyUrrKYO3l6UMC97SBzcNxu/FQMY+x0kxiEyNa/JPNx0u+
	Thxp13IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPnks-00GNdB-4z; Wed, 08 Feb 2023 16:57:10 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPnkh-00GNaE-EA
	for linux-mediatek@lists.infradead.org; Wed, 08 Feb 2023 16:57:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPnkL-0004Pj-GR; Wed, 08 Feb 2023 17:56:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPnkI-003Yhr-5a; Wed, 08 Feb 2023 17:56:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPnkI-001uAR-5y; Wed, 08 Feb 2023 17:56:34 +0100
Date: Wed, 8 Feb 2023 17:56:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Wyes Karny <wyes.karny@amd.com>
Cc: linux-arm-msm@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
	kernel@pengutronix.de, Kevin Hilman <khilman@kernel.org>,
	iresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Markus Mayer <mmayer@broadcom.com>, linux-pm@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] cpufreq: Make cpufreq_unregister_driver() return void
Message-ID: <20230208165633.dzfpkier6jcl54em@pengutronix.de>
References: <20230207195909.474953-1-u.kleine-koenig@pengutronix.de>
 <20230208160457.ouh2kg36s4kqpahe@beas>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knqz7kbydnvdpef4"
Content-Disposition: inline
In-Reply-To: <20230208160457.ouh2kg36s4kqpahe@beas>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_085659_496212_B763AA80 
X-CRM114-Status: GOOD (  28.15  )
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


--knqz7kbydnvdpef4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 08, 2023 at 04:04:57PM +0000, Wyes Karny wrote:
> On 07 Feb 20:59, Uwe Kleine-K=F6nig wrote:
> > All but a few drivers ignore the return value of
> > cpufreq_unregister_driver(). Those few that don't only call it after
> > cpufreq_register_driver() succeeded, in which case the call doesn't
> > fail.
> >=20
> > Make the function return no value and add a WARN_ON for the case that
> > the function is called in an invalid situation (i.e. without a previous
> > successful call to cpufreq_register_driver()).
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/cpufreq/brcmstb-avs-cpufreq.c | 5 +----
> >  drivers/cpufreq/cpufreq.c             | 8 +++-----
> >  drivers/cpufreq/davinci-cpufreq.c     | 4 +++-
> >  drivers/cpufreq/mediatek-cpufreq-hw.c | 4 +++-
> >  drivers/cpufreq/omap-cpufreq.c        | 4 +++-
> >  drivers/cpufreq/qcom-cpufreq-hw.c     | 4 +++-
> >  include/linux/cpufreq.h               | 2 +-
> >  7 files changed, 17 insertions(+), 14 deletions(-)
>=20
> > base-commit: 05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
>=20
> You may have to rebase it on top of this [1].
> Recently this patch series was picked up by Rafael.
> You have to add the below hunk in your patch.
>=20
> diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
> index 168a28bed6ee..70debd5a9f40 100644
> --- a/drivers/cpufreq/amd-pstate.c
> +++ b/drivers/cpufreq/amd-pstate.c
> @@ -831,7 +831,7 @@ static void amd_pstate_driver_cleanup(void)
>=20
>  static int amd_pstate_update_status(const char *buf, size_t size)
>  {
> -       int ret;
> +       int ret =3D 0;
>         int mode_idx;
>=20
>         if (size > 7 || size < 6)
> @@ -844,7 +844,7 @@ static int amd_pstate_update_status(const char *buf,
> size_t size)
>                         return -EINVAL;
>                 if (cppc_state =3D=3D AMD_PSTATE_ACTIVE)
>                         return -EBUSY;
> -               ret =3D cpufreq_unregister_driver(current_pstate_driver);
> +               cpufreq_unregister_driver(current_pstate_driver);
>                 amd_pstate_driver_cleanup();
>                 break;
>         case AMD_PSTATE_PASSIVE:

Good catch. The adaption looks right. @Rafael, please tell me, if you
want me to adapt my patch and resend.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--knqz7kbydnvdpef4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPj1D4ACgkQwfwUeK3K
7AnVxgf+ILsyJwNmEvnAnizS6MgxdLlPUiJftEk6PnIdgwAmCH0zkQzc6w6rQ8Hn
5vQ2IkoYxDwn9sVYZte5k63thHvBzkdSz0aX2pgUSWWxTJNXraJeNwKaUoMX5bjv
vADTUsMWmPishXMmUkp/aPhFAKA3+hGiKyQS4vVCtWibnjk57H2B6nnXxGtKRO7S
zjo46yLa1/C4h5Io9ICvEu9KKCU48qhv8r1HdMckI0ziOdu0zsnX+FP1ZpbAOvLA
qSr7G7VHdcADBJlM69aRFliyH25ePUyVl5SexuJynMzuNCMwVCjpSt3ZJCWDbO13
gWG6FmwvepzA5GI4ZTIjRQuUUJqqzg==
=Zzsp
-----END PGP SIGNATURE-----

--knqz7kbydnvdpef4--

