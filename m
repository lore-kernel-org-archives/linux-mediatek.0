Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E223C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 20:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksFFUFoS+7yfglTlfjwpEQG9tD2y826vjz36H5d3EMY=; b=e9vI2wCi8+2jZotGp6qtIywnbN
	Wv8GFM3H9vF7o18GkbrPq4lG23PcezILNb0bYECpJZMGHTJ79J7gl2VnJJSlzs3km3t+j3UWQVc9m
	CsT3+3+bVFIWka1lojHL/mK5DO3P5yiK1NNCJ/gr427yOV8ZzIzqVXqlXJDTyG+FReALJoz0cUAsu
	MhnYC0TVeStFFT+jWR8KGbPzpQNNFd9X/Vd5dqWocR9NmJUkGzBV56tx5I+uRpOZcg2vWl0hmZoK5
	IwNKk5XPHCrcKi0jkqZmbFVxavrui0YpiaU2HfYjtnsQjUrJSwIKdHOYUjyltrJYelAJ5vNXwJhxn
	5PS5Q6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHUbH-0000000E2ne-39Qe;
	Wed, 12 Jun 2024 20:29:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHUbD-0000000E2mo-463H;
	Wed, 12 Jun 2024 20:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F3B67CE2298;
	Wed, 12 Jun 2024 20:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F786C116B1;
	Wed, 12 Jun 2024 20:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718224177;
	bh=gCWYIm7bTku77ZC6+dqoln8xvBDLmYRwniWsE89dzJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNaxhTTKl+SspOwSlEHNQvVoS0JL8tO0YYyYJuwXVEoSo8ReWdiq+NtN7oJ8NAveT
	 z0/gkj8P9jZjc+NQSKy8ETCvdUOJbEb1CQjPVn29Os88FsauX1BN/xY/zRqQ+pmLQK
	 iE3iPhD34t4/evmgNP5NrPWC+5PVrgCYZbTk7WzwYeKZy9NH1jSTTREwOzKiW3hBXa
	 I3veBK3rMM5ogi/b080kLseDv5V4stIgIgjWTFOcVc0XdAN8UYQQ1MyxOPigU9M0V6
	 NanknOc+8I6p+XApjml3BsC7b94+BFBP/v0RwJbE/iE0/5CX//jUiSU6WvbUB8kCor
	 6/zwW1RYJZIvg==
Date: Wed, 12 Jun 2024 21:29:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH] ASoC: mediatek: mt6358: Add "Dmic Mode Switch" kcontrol
 for switch DMIC mode.
Message-ID: <ZmoFLizJO-J0N-m2@finisterre.sirena.org.uk>
References: <20240612094155.23354-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XNKysN0M+FLP/L8C"
Content-Disposition: inline
In-Reply-To: <20240612094155.23354-1-jiaxin.yu@mediatek.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_132940_222817_7E5D73C2 
X-CRM114-Status: GOOD (  11.91  )
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


--XNKysN0M+FLP/L8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2024 at 05:41:55PM +0800, Jiaxin Yu wrote:

> +static int mt6358_dmic_mode_set(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
> +	struct mt6358_priv *priv = snd_soc_component_get_drvdata(c);
> +	int enabled = ucontrol->value.integer.value[0];
> +
> +	if (priv->dmic_one_wire_mode != enabled) {
> +		priv->dmic_one_wire_mode = enabled;

This will allow any value to be written rather than just 0 or 1,
mixer-test should report that this is a bug - there should either be
validation or clamping of the value so it stays as either 0 or 1.  Both
options are valid.

--XNKysN0M+FLP/L8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZqBS4ACgkQJNaLcl1U
h9COmQf/a8xD+qrXvkFvABKq8FFX5YPeNHTkBlKnyk5PLvhdn856OJ7nHQoq3reW
8qMriRZkD3z1FVN9qzUpt0hygDXVV6alDJ522jwYJVcr6kxuMpVlp9xwfX+H5nCR
7slQUKmP7cyMS3LYJJZfGtG/a5oseajX6pRXl2q/BSui8usaEyYVzrfVd2I0F78G
tQvPmJ/tQUX85DSWXCJmSUJJe6rQE0tH/Ly0hDfuIZuWS25XzFhkWnp3iDS7uKsK
mCPiLFkvMRngfRApM8T2iPQiMBKFt5AkgzHWcBsHRalB1OlAQmZXchn4d5EKL5/j
QrkFiepQBmCiKQ1rGMLc/CDy4GpjhQ==
=0AqR
-----END PGP SIGNATURE-----

--XNKysN0M+FLP/L8C--

