Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F09DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:29:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D034E61C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 17:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D034E61C4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/ca45m48DmerIR6rKAMb78mp8dyDdeEpXA2Sq4lSYo=; b=gys6u2LGptA6xBZg0StB+iNEOd
	3EJ0kYrTT2unb0LVTLwsK+S/Dobb3er6Mi0RIYFRB5Uc09k1SOrACE1f2qEyyxbwGBopZhEtaWKjO
	Z4i5djAjqwzDnlhlI/iytdPmP/eIf6g5TWiLmW+0hjby6KLJ6tL3XjyFZmS5h+Dj+RZzyqE64VtX8
	TDokHf4xf6bHOcL9KfjOsLxhElx9kFPNf4s8X2L3zEE1C+ZPrwCA3xH6hFLHf3m6dTwXKQ5RKx9wg
	PP9Ud5cX4c1E4cg6v7idi46jxLI6qksOFLVEyvDPDndlNB8fgMnHjZN+VayC2AocuMjWovP850/S7
	aNkC+G7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnOkI-005qYo-Ed; Wed, 17 Nov 2021 17:29:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnOkF-005qXz-MH
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 17:29:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE6BF6138B;
 Wed, 17 Nov 2021 17:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637170155;
 bh=/OY3TTIbV3uqWHM/tEbq0g7zfM/Ce2n1Er3jv+U3qDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=riEW7iAQGlfz/01XujlKXW58hpsfRK2MX8Vib0ljC9yKWVFlvlq3qyx/nf0HCUc+a
 5AbHTlE66rT1wD34hxtikfQRt4ud9m637U1/octfKduJNIjD2CMbbP43LKiMgFNRWW
 i5WFd1cMfci2wDKywf7cx4CbFcxLeQYBDmkqL7E2udw7WZZb/FvZItvt022qlnMONZ
 dk3PVaz22gcjJ+nNDFPc49SJdWvJvRenasLC512ZHRbgXFCcvqD2ffPq4RL+EwtvNA
 bZeOnOyhCY/qd+Bs5WILvGYDCD8vA9TMYu9rQ3CneU1PUCvZXLeby4QfKAakiGtoeh
 FKWxlDvSP10AQ==
Date: Wed, 17 Nov 2021 17:29:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, daniel.baluta@nxp.com, daniel.baluta@gmail.com,
 AjitKumar.Pandey@amd.com, Balakishore.pati@amd.com, vsreddy@amd.com,
 Julian.Schroeder@amd.com, vishnuvardhanrao.ravulapati@amd.com,
 linux-kernel@vger.kernel.org, yc.hung@mediatek.com,
 linux-mediatek@lists.infradead.org,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH 16/21] ASoC: SOF: topology: Add support for Mediatek AFE
 DAI
Message-ID: <YZU75B2JHbYHy40l@sirena.org.uk>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
 <20211117093734.17407-17-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
In-Reply-To: <20211117093734.17407-17-daniel.baluta@oss.nxp.com>
X-Cookie: Leave no stone unturned.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_092915_765714_2A98ED8E 
X-CRM114-Status: GOOD (  11.46  )
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
Content-Type: multipart/mixed; boundary="===============1870036473898432039=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1870036473898432039==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y1aGE2SznRaFViUz"
Content-Disposition: inline


--y1aGE2SznRaFViUz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 11:37:29AM +0200, Daniel Baluta wrote:
> From: YC Hung <yc.hung@mediatek.com>
>=20
> Add new sof dai and config to pass topology file configuration
> to SOF firmware running on Mediatek platform DSP core.
> Add mediatek audio front end(AFE) to the list of supported sof_dais

This breaks an x86 allmodconfig build:

/mnt/kernel/sound/soc/sof/mediatek/mt8195/mt8195.c: In function 'mt8195_run=
':
/mnt/kernel/sound/soc/sof/mediatek/mt8195/mt8195.c:207:2: error: implicit d=
eclaration of function 'sof_hifixdsp_boot_sequence' [-Werror=3Dimplicit-fun=
ction-declaration]
  207 |  sof_hifixdsp_boot_sequence(sdev, adsp_bootup_addr);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
At top level:
/mnt/kernel/sound/soc/sof/mediatek/mt8195/mt8195.c:201:12: error: 'mt8195_r=
un' defined but not used [-Werror=3Dunused-function]
  201 | static int mt8195_run(struct snd_sof_dev *sdev)
      |            ^~~~~~~~~~
cc1: all warnings being treated as errors

_boot_sequence is added in "ASoC: SOF: mediatek: Add fw loader and
mt8195 dsp ops to load firmware" which is later in the series.

mt8195_run should be either global, a static inline or not declared in
the header at all.

--y1aGE2SznRaFViUz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGVO+MACgkQJNaLcl1U
h9BHUAf/WPdQ1sU34pc7wXKT7HjpQzqXz6Y92JQZagFk6v6n4c5zaV8lGeMp4RJe
b7qYWE1l7b+95S89NCV2cZOTqRX/e0aikOjZp4COv6NUSx9wwq6niGVbf7Vp7514
eRbtxcUNrzrjW6ccMgjuV9J5X+QMXY6+hShIqxVFFDWuzQl0TzXFpXaZ1mb7C1gC
KQIkWxluoO20C4TSQi/TvoxSGnxIfq4dvrb6i1oVMFnMOBvbQrqPRkVs1+r+cv8K
s43s9ZjcIQkDOzVX76tMmLSb64yEP+7FJzlwIhaIaPOoMmebYpzzf8JNHE4rjti1
necJgXEnDl0sH2hhC7ZS5gv1m6qkGQ==
=WcZw
-----END PGP SIGNATURE-----

--y1aGE2SznRaFViUz--


--===============1870036473898432039==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1870036473898432039==--

