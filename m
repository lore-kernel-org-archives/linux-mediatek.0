Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D66ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 16:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNo/5JQlPioPgVM6bGGKsUAm2aRckgEWHiEMjJKzbGg=; b=QHqkqBUi2JUF9RhA5jNE7DTPSu
	QM6CINPq8NQWz+u5j2HE227NTgMjkXcL3MY6M+yi7/+40nRn7hMrS7wf2EaLZREHAjWPBh0etBCSM
	8Kz7xgZ4aGT2SvmF1CCWsDGpJWgeay1XZmmxkrshKFMZSLpVCUW01TkLl9bdSaiVRHmTXzlWB8Vp9
	EvTTafoGE2GRS4Xj641SYOTY7Uv6dn37BqmhRSYJhKSxhlN5+mAn0TQMuCx5Q/MY8v9d+jrrQZrgH
	Yph0bHC82EvFEEY12OquorH0SRy/ostthWJHCFRPLbrd6Dq0mUgIDqHcH2C+twPxZw+mjE2LmglKc
	cln0mnDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooS3b-000r44-TZ; Fri, 28 Oct 2022 16:18:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooS3K-000qyw-6Q; Fri, 28 Oct 2022 16:17:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B0FB6B82AF5;
	Fri, 28 Oct 2022 16:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E5BBC433C1;
	Fri, 28 Oct 2022 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666973867;
	bh=MPN/lPTpCXpy+0PRxdY8GXPpytF3KfULUfkRjnBwUpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4jN1aqrPtVpL4VSh4NG5IKIR0V5D/7XGlmxImplMYfIF2nvv4TCI3FNBmihmGZEx
	 V9fP0Zer515uPmI0ZDdCMLln/GOWnTRqQLKZua/VEzttslPumufiygnfvpQkIRwWcN
	 TFV8I7d6Xb1VlRUUJUGFLovN1ITdLhP++IPi3/9/Kzb4u/eEdSZhq4pEuihKYZtYWY
	 oSwO3C8T7BU3xoCKInl61SsWHX7yvHNbaSMiProzM44CvwTnhalM6/ts6sIf7QvvPU
	 nFmLKoj7eJeHyGNZJqrQcw5BQOiUVpp/hiTtP1rzYhOLWD7zppUH9YgIc8Xpo08WMx
	 HBiUwucVzAr2A==
Date: Fri, 28 Oct 2022 17:17:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	"chunxu . li" <chunxu.li@mediatek.com>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v1 2/2] ASoC: mediatek: mt8186-rt5682: Modify machine
 driver for two DMICs case
Message-ID: <Y1wApOeV7OoQzkt5@sirena.org.uk>
References: <20221028160733.1390230-1-ajye_huang@compal.corp-partner.google.com>
 <20221028160733.1390230-3-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cw3lWstGeVw1b8Ns"
Content-Disposition: inline
In-Reply-To: <20221028160733.1390230-3-ajye_huang@compal.corp-partner.google.com>
X-Cookie: Life -- Love It or Leave It.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_091750_531742_86BD1647 
X-CRM114-Status: GOOD (  17.62  )
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


--Cw3lWstGeVw1b8Ns
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 29, 2022 at 12:07:33AM +0800, Ajye Huang wrote:

> +static const char * const dmic_mux_text[] = {
> +	"FrontMic",
> +	"RearMic",
> +};

> +	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
> +					ARRAY_SIZE(dmic_widgets));
> +	if (ret) {
> +		dev_err(card->dev, "DMic widget addition failed: %d\n", ret);
> +		/* Don't need to add routes if widget addition failed */
> +		return ret;
> +	}

> +       if (of_property_read_bool(pdev->dev.of_node, "dmic-gpios")) {
> +               mach_priv->dmic_sel = devm_gpiod_get_optional(&pdev->dev,
> +                                                       "dmic", GPIOD_OUT_LOW);

My prior comments about it being nicer to make the addition of the
control depend on the property being there and the description of the
options configurable do stand (I appreciate that the other driver might
not have done this which was probably an oversight).

Also do we really need the of_property_read_bool() there?  I'd have
expected that devm_gpiod_get_optional() would be handling that for us.

--Cw3lWstGeVw1b8Ns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNcAKQACgkQJNaLcl1U
h9Dszgf/VXVqdAt6y4Tux5PXD9zW+9i23ZFaCs1y/E0zse4AyVDDvo+BtL+IrkcL
z9i6r9EqrQuX6SBUCup87nUu3s4aIwtlCvH3Li2znhZWKfY1PEN7xWA7IB6eZDrp
nWBO4wPITY3ftUoLGTEpv2ZgQ3QIFm4B/rQpNEkfxbwF91kv/JPK2VzAL2Q0zbck
ahvvraHhPGI+2MkDjcufrlzqUke/MteuKH+zKgZjDLYDicXFaj0gHhS/0n7s46Nw
Uq2pcLsOFtU8yBm9LVBeC2CDk134qJH4h81Pen/yF/v2+7Pyz5uJD1X2PqXqVRDF
Et13wKZD5oDLUdFdlZhs82B5gcdQ4g==
=Qv/e
-----END PGP SIGNATURE-----

--Cw3lWstGeVw1b8Ns--

