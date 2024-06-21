Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32582C27C4F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jun 2024 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgnGd0H8XNXO4QTpQq/hjcAGl8+vyyeL6r2nX4n2X04=; b=ra6HiVfe+GTCoPSWBxtTKxPMuu
	RsTOCdFQolSzQHSZoL9UOOIVf5wGz0BD8pEvUilbKFEZAd2tIsdTW4gdR+N0mlLUgj4J3Tq9/+RXn
	/FY7FbMJTJOYN2LqITCiGoZPs59wuYGEYGSHP3M4GW0L0+dpPzgH1G7o/O+4Z9Zd2tJs04blieQn8
	ets5gMWKqzRpEfAw81d6ifsn7J2TbgycmYIpWwS9swrWguvZLGT8ggbPTsfQfEOz3lOMY7qtmTZk4
	neGDMTZtXdIgAqUbV2Ej2q4FCyb+OMynTkx+83tpxVCyIFJ5p20c2mw5wtHJIHI/WBKjInNQpm8TU
	CXjLYgPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdd5-00000009CWp-1zlj;
	Fri, 21 Jun 2024 12:44:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKdcz-00000009CTM-3hfw;
	Fri, 21 Jun 2024 12:44:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D73162612;
	Fri, 21 Jun 2024 12:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4569EC2BBFC;
	Fri, 21 Jun 2024 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718973868;
	bh=bwqf13fJbLJEoJ55Fq8cVIZa/qvXiPcZ4TMFf7szj6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8IKh8rPJ6LhZPucaRVWP/8fVx7Xxn6rv2vU7HIlfwyi9Q96L78zxrZ3zhmjtudB0
	 J3tju9CVfyLjhlAOJWMauyHtWsdLjK3txtaalshO/dngDUizd1XzDP6LMIUbZBXavB
	 +8KE0WLENQ6jEdfgeJYwijdzrlgFvpOTR2HFnkBrAc0rdcKAXPoTkZLV4bV/cTusbH
	 OBtLDjkQPYR3wotR+Wn7W5zr040SNYXGr1ZQRN8QKzEvEtgTV8xggmtD7my/kpv1qT
	 wLn6blkh/cY091zWPbqahLn59Luh3YNHrKn/lEiz3fKB1cxWABQ/Sb62GAvK/7RrdJ
	 tIK9yeZk6HlDg==
Date: Fri, 21 Jun 2024 13:44:20 +0100
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
Message-ID: <1ca27c79-a83a-42a7-9e9b-766da0064c73@sirena.org.uk>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y31DJCgxhlUXFcNQ"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
X-Cookie: Androphobia:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_054430_028204_F75F8AB4 
X-CRM114-Status: GOOD (  16.26  )
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


--Y31DJCgxhlUXFcNQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 04:46:48PM +0200, amergnat@baylibre.com wrote:

> +	/* gain default values*/
> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0, MT6357_AUDPREAMPLGAIN_MASK,
> +			   UL_GAIN_0DB << MT6357_AUDPREAMPLGAIN_SFT);
> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1, MT6357_AUDPREAMPRGAIN_MASK,
> +			   UL_GAIN_0DB << MT6357_AUDPREAMPRGAIN_SFT);
> +
> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON1,
> +			   MT6357_AUD_LOL_GAIN_MASK |
> +			   MT6357_AUD_LOR_GAIN_MASK,
> +			   DL_GAIN_0DB << MT6357_AUD_LOL_GAIN_SFT |
> +			   DL_GAIN_0DB << MT6357_AUD_LOR_GAIN_SFT);
> +
> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON2,
> +			   MT6357_AUD_HPL_GAIN_MASK |
> +			   MT6357_AUD_HPR_GAIN_MASK,
> +			   DL_GAIN_0DB << MT6357_AUD_HPL_GAIN_SFT |
> +			   DL_GAIN_0DB << MT6357_AUD_HPR_GAIN_SFT);
> +
> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON3,
> +			   MT6357_AUD_HS_GAIN_MASK, DL_GAIN_0DB);

We generally leave everything at chip defaults, why is this different?

> +static int mt6357_codec_probe(struct snd_soc_component *codec)
> +{
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
> +
> +	mt6357_codec_init(priv);
> +	return 0;
> +}

Why not just inline mt6357_codec_init() into the one user?

> +static unsigned int mt6357_read(struct snd_soc_component *codec, unsigned int reg)
> +{
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
> +	unsigned int val;
> +
> +	regmap_read(priv->regmap, reg, &val);
> +	return val;
> +}
> +
> +static int mt6357_write(struct snd_soc_component *codec, unsigned int reg, unsigned int value)
> +{
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
> +
> +	return regmap_update_bits(priv->regmap, reg, 0xffff, value);
> +}

Why open code these, the core has standard adaptors for regmap?

> +static const u32 micbias_values[MT6357_MICBIAS_ARRAY_SIZE] = {
> +	1700000, 1800000, 1900000, 2000000,
> +	2100000, 2500000, 2600000, 2700000
> +};

Just use ARRAY_SIZE() for the size then the number can't be out of sync.


--Y31DJCgxhlUXFcNQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1daMACgkQJNaLcl1U
h9DFewf+M/CBa2qN5RnVF8Zc5QWTvxC4SKpFwRma8NGXYRkdIuRXOhTpxRG85BYY
w0ndJAb81OyrS1X3S8EpFu0cTQdBB7po6aGY3/n1tnY0JIkQ820QI+XDGlduderG
aPJ1LFil592z/y4CEYhDWzOsFWLLyJKyRI490d6BuyRNdljzSLS1QmJ2HrpnPI/S
D63ThavR4gijP3ePCZ6Bajond76rmR5CDUo3/LtUBAliMvLcIpwdKqcEjjdpMm7G
BuKS/CUvpRgJ5D+hyi9xFWRSBajwhFVLHJ1R/jtOLU/DQiYH/x78dMej8JApEp6X
Gohk7DuuhbfZflRiEj17qKTMYvMWvA==
=P5mN
-----END PGP SIGNATURE-----

--Y31DJCgxhlUXFcNQ--

