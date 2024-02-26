Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D33C5478C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 16:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVLmf2g8RKufa/nr1hBc8FyiLOIsjE9HLgh50Hmd1F4=; b=XgYibdgcRwtpi9c7fUFQegM2xu
	eaKSybb2DF1POaeaGeEngB+RfGotA9Ew8gUiT8UZYqo6vAnxFhx+0qaXQKXaHNIjG+HwV3Esmkpio
	SpiRBjKox7BPGo/7IXhpfnSG7xieWqERo2CBS1vmKsQOvkwvItYj3H6OHeXAJ4nuOxbCjXeqLvYnS
	ha1la8X89nT+AC+gnnC1+5LLya8arbzoNmSWTE3zuTtBpHcIx9tc9c7/r+6Xd9m+hRohGl9i8BDhf
	risQROBiGKxP5vMGi21P9BczDupWN3DzbhLjavPFeCCiDA8iOmWGftrL2XGouFlgoQRAXKq0VUhz1
	5W3nZNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1redXx-00000001a1O-0ErZ;
	Mon, 26 Feb 2024 16:09:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1redXt-00000001Zzc-11lt;
	Mon, 26 Feb 2024 16:09:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CC160CE0018;
	Mon, 26 Feb 2024 16:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3858C433F1;
	Mon, 26 Feb 2024 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708963774;
	bh=544qUMhqgYQOHGl46eHK6g/2ihFgsZn/LHzZzuoNf14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFKSjVwP60i6oW9D7LFMScKauvLLEEnmQASp+Uth6mTofKuSpkIQq72+2SDSFXZ6R
	 Lq1ZT4yI+OaSa41rwTMpeOj5sbsruVuvaxytpdeoM3mWQ6iV+7K1OeNGrhBLoCz/2i
	 dTrZH7dG03AaoXC267IIp6BIqJ2w1vurx7gjm8QLgpfD5U7WkqMKQYhBBbyRT9fpOc
	 HDalcrYaW3e2HphJwpjaqrUVi3BGrjIH2eQGKh6nHJGgmqSAQnXBCyaFcFggWxVqn5
	 vJqdYB/klAj/39MMDPZHvGtUhlGcsH9DLE4+bQbCDJWVo2dydZozgQ9SPNQ+YZwRHv
	 7TuEZXZlVRG3A==
Date: Mon, 26 Feb 2024 16:09:25 +0000
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
	Will Deacon <will@kernel.org>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Message-ID: <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CwpsPPtJ8s7wyugW"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
X-Cookie: Walk softly and carry a BFG-9000.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_080937_765482_5496D18F 
X-CRM114-Status: GOOD (  24.33  )
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


--CwpsPPtJ8s7wyugW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 26, 2024 at 03:01:50PM +0100, amergnat@baylibre.com wrote:

> index 000000000000..13e95c227114
> --- /dev/null
> +++ b/sound/soc/codecs/mt6357.c
> @@ -0,0 +1,1805 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MT6357 ALSA SoC audio codec driver
> + *

Please use a C++ comment for the whole comment to make it clearer that
this is intentional.

> +static void set_playback_gpio(struct mt6357_priv *priv, bool enable)
> +{
> +	if (enable) {
> +		/* set gpio mosi mode */
> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2_CLR, GPIO_MODE2_CLEAR_ALL);
> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2_SET, GPIO8_MODE_SET_AUD_CLK_MOSI |
> +								  GPIO9_MODE_SET_AUD_DAT_MOSI0 |
> +								  GPIO10_MODE_SET_AUD_DAT_MOSI1 |
> +								  GPIO11_MODE_SET_AUD_SYNC_MOSI);

This would be a lot more legible if you worked out the values to set and
then had a single set of writes, currently the indentation makes it very
hard to read.  Similarly for other similar functions.

> +static int mt6357_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
> +	unsigned int reg;
> +	int ret;
> +
> +	ret = snd_soc_put_volsw(kcontrol, ucontrol);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (mc->reg) {
> +	case MT6357_ZCD_CON2:
> +		regmap_read(priv->regmap, MT6357_ZCD_CON2, &reg);
> +		priv->ana_gain[ANALOG_VOLUME_HPOUTL] =
> +			(reg & AUD_HPL_GAIN_MASK) >> AUD_HPL_GAIN_SFT;
> +		priv->ana_gain[ANALOG_VOLUME_HPOUTR] =
> +			(reg & AUD_HPR_GAIN_MASK) >> AUD_HPR_GAIN_SFT;
> +		break;

It would probably be less code and would definitely be clearer and
simpler to just read the values when we need them rather than constatly
keeping a cache separate to the register cache.

> +	/* ul channel swap */
> +	SOC_SINGLE("UL LR Swap", MT6357_AFE_UL_DL_CON0, AFE_UL_LR_SWAP_SFT, 1, 0),

On/off controls should end in Switch.

> +static const char * const hslo_mux_map[] = {
> +	"Open", "DACR", "Playback", "Test mode"
> +};
> +
> +static int hslo_mux_map_value[] = {
> +	0x0, 0x1, 0x2, 0x3,
> +};

Why not just use a normal mux here, there's no missing values or
reordering?  Similarly for other muxes.

> +static unsigned int mt6357_read(struct snd_soc_component *codec, unsigned int reg)
> +{
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
> +	unsigned int val;
> +
> +	pr_debug("%s() reg = 0x%x", __func__, reg);
> +	regmap_read(priv->regmap, reg, &val);
> +	return val;
> +}

Remove these, there are vastly more logging facilities as standard in
the regmap core.

> +/* Reg bit defines */
> +/* MT6357_GPIO_DIR0 */
> +#define GPIO8_DIR_MASK				BIT(8)
> +#define GPIO8_DIR_INPUT				0

Please namespace your defines, these look very generic.

--CwpsPPtJ8s7wyugW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXct7QACgkQJNaLcl1U
h9Agkgf7BBrglcg7jMvSrH2s1xIYkCIuoub5OdCpv9Ph6xdo47W9uy2hoGlAK6nD
BS+w4kyaZmwgueREI0Rf/l6hYRPKJtWv9emek2zz9z5r4R7xzhdbzj2R4MVJkcJH
O9QTkYk0PoAJkgVJnH6XNqFGriEYmNxkuRdF4l3Mdbn6KiHlf4XwaqWx29KLmXci
bxoCisLzrR5rPaZAKPMuf8lPvMAQr19dvvk1RlMkyZ2Di1mpakxQIn+QZY7ja2GI
dJs9hbr+UAJTCKhf0uhtslARm+WZfNCHtGbr8YUjZnzQ+z6vAcNdTTfgDBYINKSC
AWTgPQtQPSt9Ti03CsQj0ka+/ujatQ==
=uDQI
-----END PGP SIGNATURE-----

--CwpsPPtJ8s7wyugW--

