Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5D2C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 20:16:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01C4C6100A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 20:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 01C4C6100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7Qj+WXDO5TvjseGqV5HY0ca3UzRseOqzgSZik85o/g=; b=KsWwJUE4hkLI9PIFBPs0bmbJkG
	YfNJIeO8tlI5y9QZEcQmLEDJR+U5fxq/1trZlXJ+h3ZxNcURUp8e89e+iv2JoizRiF51TPPHNaCun
	noCzBgqgx2evGxhhr97g/p+Tl4IVQP91uo9iWnYMiOGvrUEP/yOUx/VQEp9NLCfd2fIem5OeFTSiH
	8LKa6zkjyKksbbrFYQASb7iv+4sFrbzFx0znsjNTItYOADa0GW1iTuc5vhXZhMmhhEdXdhdbDuoYi
	LiFz3j6J9NA4rK+lKu/4FJFz1E8ao1VnWEsdusLJWuS87uDl+SCQiWX5MGpwTQLrxA8pV1j81gy+4
	RN6eEwIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAeMb-0008sy-Fc; Mon, 02 Aug 2021 20:16:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAeMP-0008iB-7y; Mon, 02 Aug 2021 20:16:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5036E6100A;
 Mon,  2 Aug 2021 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627935388;
 bh=1ftJ9kb+Y2xAzoMqL2sOYtIko6amvbIbdc1OAEJxocA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fVuyEfUv4izjaGIz+P+Ea3mknWUyuJyiQ2TQ2MdPkQucekEpoqrh68+Vyhlqgi70S
 jD9dXjdaPvkjS5V5fK59wOZ1hihrL48U5gOwd3JTEP8es04ssFJeXki1DdVG0YlBxr
 vf8kLCAoDA/clTyAowv8NtWEqohkyDwMIccbXn+4H3umMBVQJyHmXijrY7oL8jQmKZ
 PaKMvI4kgnmOQbFHY/6LB6cNW6uAJ9Gb+aXQjBWZ9diY2mC3HKCWf/Nr+JzQZZvrlU
 HlH2ZeCOwhXxQPs6Np1SEcUyECFxFFSEOsyLmt8lSocKr+k9sPKHnvqEU+HDxylBZX
 XxovNwQ/gV/sQ==
Date: Mon, 2 Aug 2021 21:16:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Mason Zhang <mason.zhang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 leilk.liu@mediatek.com, wsd_upstream@mediatek.com
Subject: Re: [PATCH 2/3] spi: modify set_cs_timing parameter
Message-ID: <20210802201614.GA39900@sirena.org.uk>
References: <20210719091642.24633-1-mason.zhang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210719091642.24633-1-mason.zhang@mediatek.com>
X-Cookie: hacker, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_131629_358978_B3E78F47 
X-CRM114-Status: UNSURE (   8.47  )
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
Content-Type: multipart/mixed; boundary="===============5314052651903616783=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5314052651903616783==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 19, 2021 at 05:16:43PM +0800, Mason Zhang wrote:
> From: Mason Zhang <Mason.Zhang@mediatek.com>
>=20
> No need pass in spi_delay to set_cs_timing callback.

This breaks the build:

/mnt/kernel/drivers/spi/spi-tegra114.c: In function 'tegra_spi_probe':
/mnt/kernel/drivers/spi/spi-tegra114.c:1328:24: error: assignment to 'int (=
*)(struct spi_device *)' from incompatible pointer type 'int (*)(struct spi=
_device *, struct spi_delay *, struct spi_delay *, struct spi_delay *)' [-W=
error=3Dincompatible-pointer-types]
  master->set_cs_timing =3D tegra_spi_set_hw_cs_timing;
                        ^

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEIUo0ACgkQJNaLcl1U
h9A9nAf9F1Go1sfPbVr4y4p+ywDUg5Wsr+MKi1rOBL4AbcQ1yxaoPt+Hy9u9SMos
0LRfPt0j7LOGZr7vifhjc3oUF1RlB9y6gUMBcLiim6+4pbUz+Tajw2porzvSiK94
MvdhImTpbS8LPsEKwhXkpogz2uBiOMzmIlGHJL/k2gsewC1xGlXmdORTM+UBfr9Q
EXPNo9RPLAJP4WGoHjenHIQ7iixQnoLHnikVJtzET2heloGFaTdm0XUL2KUSE7s8
vOe18JfW8HRf19mr0CNVp4cKg4jE1gQEzXS7s64laov5hmoaFpf6eXVDFX7F0/u+
EVjpgvgR5/Yb/J/BntGxYQQyaGxUHA==
=rKDf
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--


--===============5314052651903616783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5314052651903616783==--

