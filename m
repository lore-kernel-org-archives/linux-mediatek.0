Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C01C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpcluM18UYDkFLv+A5X1wgasf679v/aG1vwHuIKcfZ8=; b=WxTBuvBU+ae5T2jSBQkfunFgPQ
	U4Qnp48raF3qq/+G5KhDCmsfLEgxSywc/Pa7mrAOCQfvE38E4B9fMRmR/YgtIUi2sOPu2BH5fK36Y
	ysOVYKxr00p5p6InTsqayWYjn9vfHeSmwHqeGjJazoibEIUdMgTwqQk8SrP8BqqnXU87oWWg6NvHf
	Paxm7E1ofp7yJymvt3SRZh5aYT/kx9EqRd+rmScwyv5LntK2Zxxi6zLXT3su3QsBJzFKjrqX0+i7A
	xRzpqH8Od8a2pk3OyXNlNdoYPUiXi1PGCB57YRzhcooOd9SHArK3nf3IYNWzI2jhE3skzRqHN6TMx
	xTbeK8pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfiq-00000009cmq-3CQQ;
	Fri, 21 Jun 2024 14:58:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKfim-00000009ck6-1qmz;
	Fri, 21 Jun 2024 14:58:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4135626AD;
	Fri, 21 Jun 2024 14:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE66C2BBFC;
	Fri, 21 Jun 2024 14:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718981915;
	bh=iTy+ar2v/aPDrGFgYNM/EKjztldR0LbzdgwRrLgUwaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dLNZ5w7OhfaSkX+v1brG7veriBApUjUqkk7BE8esWrTGvoYtGimxMKK3Gl0PPc54O
	 xknBq1zsamjVsrO3GuexV7RVQMc7uVA3vArhI2tkHqL5ya35XV3N272wNYvUFhb8RF
	 bf9IcY23muCRsn/KvT95JTyEk9IpAxIuPZDGb1IDxGQZ22QnIKpWxNgXETaoatEjMb
	 qGA8hBa+roOxP8p89YBJZAiZpoPt26NWrfOLECjww3vw0ggAsly7e4aGb92+iDk8ko
	 B4qe57iWIrTC7lFt1FsMQ3nOueuVOatM7CNelfL4Aohry88xYCRBpxefZ5A/YK1bWK
	 odNViv395bCYg==
Date: Fri, 21 Jun 2024 15:58:27 +0100
From: Mark Brown <broonie@kernel.org>
To: amergnat@baylibre.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH v6 12/16] ASoC: codecs: add MT6357 support
Message-ID: <e6f1e8b6-f542-4cc7-828d-69810209e9b3@sirena.org.uk>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jw2Y2pYWLtcvlWMC"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
X-Cookie: Your supervisor is thinking about you.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_075836_583102_76E5FC30 
X-CRM114-Status: GOOD (  11.32  )
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


--jw2Y2pYWLtcvlWMC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 04:46:48PM +0200, amergnat@baylibre.com wrote:
> From: Nicolas Belin <nbelin@baylibre.com>
>=20
> Add the support of MT6357 PMIC audio codec.

This breaks an x86 allmodconfig build:

/build/stage/linux/sound/soc/codecs/mt6357.c: In function =E2=80=98mt_delay=
_250_event=E2=80=99:
/build/stage/linux/sound/soc/codecs/mt6357.c:993:29: error: unused variable=
 =E2=80=98pri
v=E2=80=99 [-Werror=3Dunused-variable]
  993 |         struct mt6357_priv *priv =3D snd_soc_component_get_drvdata(=
cmpnt);
      |                             ^~~~
/build/stage/linux/sound/soc/codecs/mt6357.c: In function =E2=80=98mt6357_p=
latform_drive
r_probe=E2=80=99:
/build/stage/linux/sound/soc/codecs/mt6357.c:1867:55: error: too many argum=
ents=20
for format [-Werror=3Dformat-extra-args]
 1867 |                 return dev_err_probe(&pdev->dev, ret, "Failed to pa=
rse d
ts\n", __func__);
      |                                                       ^~~~~~~~~~~~~=
~~~~~
~~~~~
cc1: all warnings being treated as errors


--jw2Y2pYWLtcvlWMC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1lRIACgkQJNaLcl1U
h9A1bwf/V2Qer6d82i9EFIihaq/lGhQ/qfe9gIru+7gJsGI4DqFQH74lqhneOg79
dbDE9ZxWZMSkRPam0eioJpIWXqp6PInaXpjQ/9S2xHdNwc1c/uUCoChWA98NXlo5
RADmcGSWVwtbKq/nplum3hiKS2+GF5VUC6Rce/pnb22YK8EGSfgsMzdtSRVrcqaW
3Rjoh1zf6wzyWBjQmJ1x+8C0lvVH2IbGzQStK9Khpo+Ojz5prAo6tXZA983ktHF5
m4VZoVblQEiohNk7UTYvsUD511IEo2WS1f9NIHZcQLSzjTbst70usLoGwnA9sjmb
+0XWKkjxGKPzqT7CHhn2IW2qzOam0Q==
=OTn4
-----END PGP SIGNATURE-----

--jw2Y2pYWLtcvlWMC--

