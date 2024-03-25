Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05E2C54E64
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Mar 2024 14:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QJoobOdCQdR9R/mVEy3woF/hSUg+GYu60zK2M90pvY=; b=c4XSjMtz8gYOU5NkFwUsTGXVuv
	o3HQH6zkdijdPoV+NkkrTXFZ+qw0nwZs4QTjymB/GwDvWsM7F8hj/OJgZ945TM9nnAG/E38Kd9al8
	hc7CUTN5736WBWgWYsBFsNbMjlL2qvGc8gqn0Zvshz8SyjjEZyuyeRagj86Rmn5uiUsyS+2tNVjjh
	6Mbmyk8nzV3+VDDqvdqaLdu7/V6r9oPXWunBT9GN6Lizv6M1dewDSEGHEg52TmgynhdIuyDf2hsTH
	gj+sD5UBskcMRi4rMhHa6CIYqRJkMFX7v6FRTYGY0FS0sBCDwT5b14MY51UpkzV7xulNWDyXy+K7s
	qQcG4Z5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rol9z-00000000BB8-02N6;
	Mon, 25 Mar 2024 14:18:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rol9X-00000000B26-3yG8;
	Mon, 25 Mar 2024 14:18:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8E8561028;
	Mon, 25 Mar 2024 14:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551B6C3278D;
	Mon, 25 Mar 2024 14:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711376298;
	bh=jbD2Lb5wA/eUCNXCJLVthr6/MzEiKX6SqxWZxnTuOnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIJBcOZwUhINwFcGdCy+3ok576TN9S810xuZ8ZzXc+YsDCkkdm2aFq4Rb/QQx0lUi
	 1wCvxXFctAcTrEW1JWL8HrusNRZ090ozLa1y+/4W1HSAvRJjjagI3SeojbTeSEOpth
	 JVqpRvqwRP4xMipGrKVSugC394E0I0wHmQz9uqnRmKjiVb/ma5GFpOxfhYS80hw1VN
	 kVa+H456ovUt/aptnwA12NIMQRD+kFb7iLum3bA1g0EF9EYSVIOthLrTUNXqEuuQBR
	 8qkEq2K1UK+3Qux+vNE58QmXDQuoGAu7RuT+3ssdB6orI+bYKjCVexSqifI7VacJfd
	 +OE8pqjMaaDuA==
Date: Mon, 25 Mar 2024 14:18:08 +0000
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
	trevor.wu@mediatek.com, maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com, shraash@google.com,
	amergnat@baylibre.com, nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de, dianders@chromium.org,
	frank.li@vivo.com, allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com, ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com, nfraprado@collabora.com,
	alsa-devel@alsa-project.org, shane.chien@mediatek.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 05/22] ASoC: mediatek: Add common machine soundcard
 driver probe mechanism
Message-ID: <6b9dd2ad-a24e-497a-8a5c-c7c04475cf5d@sirena.org.uk>
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
 <20240313110147.1267793-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HA8wmAlBS5gx6s1i"
Content-Disposition: inline
In-Reply-To: <20240313110147.1267793-6-angelogioacchino.delregno@collabora.com>
X-Cookie: Is it clean in other dimensions?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_071820_162105_4DF927F1 
X-CRM114-Status: GOOD (  13.61  )
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


--HA8wmAlBS5gx6s1i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 12:01:30PM +0100, AngeloGioacchino Del Regno wrote:
> Add a common machine soundcard driver probe function that supports both
> DSP and AFE-direct usecases and also provides a hook for legacy machine
> soundcard driver probe mechanisms.
>=20
> Note that the hook is there because, even for legacy probe, a lot of the
> actual code can still be commonized, hence still reducing duplication
> for the legacy devicetree retrocompatibility cases.
>=20
> This common probe function deprecates all of the inconsistent previous
> probe mechanisms and aims to settle all of the MediaTek card drivers on
> consistent and common devicetree properties describing wanted DAIs,
> device specific DAI configuration and DAI links to codecs found on
> each device/board.

This breaks allmodconfig builds:


/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In funct=
ion =E2=80=98mtk_sof_dai_link_fixup=E2=80=99:
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:18:41: er=
ror: initialization discards =E2=80=98const=E2=80=99 qualifier from pointer=
 target type [-Werror=3Ddiscarded-qualifiers]
   18 |         struct mtk_sof_priv *sof_priv =3D soc_card_data->sof_priv;
      |                                         ^~~~~~~~~~~~~
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In funct=
ion =E2=80=98mtk_sof_card_probe=E2=80=99:
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:58:41: er=
ror: initialization discards =E2=80=98const=E2=80=99 qualifier from pointer=
 target type [-Werror=3Ddiscarded-qualifiers]
   58 |         struct mtk_sof_priv *sof_priv =3D soc_card_data->sof_priv;
      |                                         ^~~~~~~~~~~~~
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In funct=
ion =E2=80=98mtk_sof_find_tplg_be=E2=80=99:
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:76:41: er=
ror: initialization discards =E2=80=98const=E2=80=99 qualifier from pointer=
 target type [-Werror=3Ddiscarded-qualifiers]
   76 |         struct mtk_sof_priv *sof_priv =3D soc_card_data->sof_priv;
      |                                         ^~~~~~~~~~~~~
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In funct=
ion =E2=80=98mtk_sof_check_tplg_be_dai_link_fixup=E2=80=99:
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:116:41: e=
rror: initialization discards =E2=80=98const=E2=80=99 qualifier from pointe=
r target type [-Werror=3Ddiscarded-qualifiers]
  116 |         struct mtk_sof_priv *sof_priv =3D soc_card_data->sof_priv;
      |                                         ^~~~~~~~~~~~~
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c: In funct=
ion =E2=80=98mtk_sof_card_late_probe=E2=80=99:
/build/stage/linux/sound/soc/mediatek/common/mtk-dsp-sof-common.c:147:41: e=
rror: initialization discards =E2=80=98const=E2=80=99 qualifier from pointe=
r target type [-Werror=3Ddiscarded-qualifiers]
  147 |         struct mtk_sof_priv *sof_priv =3D soc_card_data->sof_priv;
      |                                         ^~~~~~~~~~~~~
cc1: all warnings being treated as errors

--HA8wmAlBS5gx6s1i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYBh58ACgkQJNaLcl1U
h9Dw2Qf+OK6uEVJdUDAeL+cRMOtxJ5v8lWJ4kCDEd4EzMY8PITg8YZaxDb1HJs18
yfD4+oR2f/uMSGayxCnuRgzBthSs96xOJ34EkRpUgsB81RrC1Jjv5zWwIP1SCQlN
e2rKPS4ccBdE5uowKduc5TIbqbgbjLCArqTpqHDX6IBQP4A3SqYkcv/tOwFHuC/t
kE6+fH8gG7hQ9no9cE3WumRCLDyE8rRca6smAENrfcco8/5DCg2LqJ+SOEC64X+o
TYw0mmtRwPdObNmdHyrCtfk9XppdDLh21bKZrQvpj7WW2+EqSzbYLdyxvArVbzMq
bEqhwUbisC0nv6/RJbKsKWZy/N3IUA==
=6CF1
-----END PGP SIGNATURE-----

--HA8wmAlBS5gx6s1i--

