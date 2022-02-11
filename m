Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6372C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3o7nJ0cdHZVIqzwqGF2YU8Q6A2qVj0nbCZYKcMSGNk0=; b=DWk3/jgDXTZWKwYn6izijInoT2
	EyFj4/S0HuIUy9K6N2jJeujfP1wdGP2IqoU3IXPWgnfgGkvUkc0pQfumttlDKo5oKQpSEs3mPELWz
	0FOhJ9t8U0JE7xAPd+PY7b7MuqdwvflFJU/mUvFrtlC1CllxBdnflWF257KuRB5XC1By24BBWGPvk
	BfqfgoKJOPJA/jF/16IuDCkl5GBuIR7oKf5Ettt3BrxvAIe3tJwdQXQ+oIJFWl34JW3SSmjv4zSB2
	oODWXMStdEh049ZghKrxuJYyEIg+rdbe1c2Knu9ftD0a6HBb9YBCEJxUu1TrKKyF4Y3bZgM5OJ2Mt
	y8x2hJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIXmv-007o1t-CB; Fri, 11 Feb 2022 15:24:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIXmh-007nx7-M7; Fri, 11 Feb 2022 15:24:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83CF661FCB;
 Fri, 11 Feb 2022 15:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D89C340E9;
 Fri, 11 Feb 2022 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644593069;
 bh=XDskYT+gPzjRfk5oDbdrltedXVUeMzqmkjFFDGb6NLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BvpT7Oqvcfj4W8XiGWUycZmHiE3+Etza3fUd5xp8iddyoLealvqndsADzP2UgqpxZ
 gXh2j2xq76OojNzT7LTqG+HJDWzT7czRxj/id6794sYd6ipF26w03Zvgz8cneDMpGf
 9D2NV2IqSLW75FxIQQ4JAsazmCe5Lf80UZVOcMuDPfWoJQMUB+9ebkeyXT28ez2uPh
 zcAM7L1dsH/QiSktz4EXbvfPF27xiI6bG72oKHQsrq10o695oU7PlFeNTBWb7NF2lb
 yKEeRP8Y2nD1WJCYlf+J9H8pS+MGs+PGZxo9RsGaN6PSuuJ9bMigy/7usBecHoXVyd
 mD87gCcsvogcw==
Date: Fri, 11 Feb 2022 15:24:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, p.zabel@pengutronix.de,
 geert+renesas@glider.be, trevor.wu@mediatek.com, tzungbi@google.com,
 zhangqilong3@huawei.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/15] ASoC: mediatek: mt8186: support tdm in platform
 driver
Message-ID: <YgZ/pzrJqvcAuzmE@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-10-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220211103818.8266-10-jiaxin.yu@mediatek.com>
X-Cookie: do {
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_072431_823167_75EBDF6D 
X-CRM114-Status: GOOD (  15.86  )
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
Content-Type: multipart/mixed; boundary="===============8538142871116762856=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8538142871116762856==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N3h3NzMMytsYzN3d"
Content-Disposition: inline


--N3h3NzMMytsYzN3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2022 at 06:38:12PM +0800, Jiaxin Yu wrote:

Again, mostly looks good just fairly small and easily fixable issues:

> +static int mtk_tdm_hd_en_event(struct snd_soc_dapm_widget *w,
> +			       struct snd_kcontrol *kcontrol,
> +			       int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +
> +	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
> +		 __func__, w->name, event);
> +
> +	return 0;
> +}

This does nothing, you can just remove it.

> +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +	case SND_SOC_DAIFMT_NB_NF:
> +		tdm_priv->bck_invert = TDM_BCK_NON_INV;
> +		tdm_priv->lck_invert = TDM_LCK_NON_INV;
> +		break;
> +	case SND_SOC_DAIFMT_NB_IF:
> +		tdm_priv->bck_invert = TDM_BCK_NON_INV;
> +		tdm_priv->lck_invert = TDM_LCK_INV;
> +		break;
> +	case SND_SOC_DAIFMT_IB_NF:
> +		tdm_priv->bck_invert = TDM_BCK_INV;
> +		tdm_priv->lck_invert = TDM_LCK_NON_INV;
> +		break;
> +	case SND_SOC_DAIFMT_IB_IF:
> +	default:
> +		tdm_priv->bck_invert = TDM_BCK_INV;
> +		tdm_priv->lck_invert = TDM_LCK_INV;

You should return an error in the default case rather than just picking
one of the behaviours to help spot any configuration errors.

> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBM_CFM:
> +		tdm_priv->slave_mode = false;
> +		break;
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		tdm_priv->slave_mode = true;

We're trying to move away from these defines and the master/slave
terminology to talk about clock providers instead - the new defines are
_PROVIDER_MASK, _DAIFMT_CBP_CFP and _DAIFMT_CBC_CFC.

--N3h3NzMMytsYzN3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGf6YACgkQJNaLcl1U
h9DaCQf/cvTLimeQ43iRd7ilDTcJcq6Hgfgbl+cTNCLiaWII83oyeXd7E9t7kCj1
yTaVBO8XyWDCXM+lr20knToRa/o/RCYIRdIa4LB6fu5N320nPDlo6CVRunRk0mMv
CEReCuzQdXSuXB5ai3QIwPHSTYE8yPrc3Pf8+bCjJB1ZtyIBnVgk/LWg306IehOt
Xbu8BhYTof0YFIBtFsP2zpoyoUbchd3qAVlRX6TW3s2bwGDzpufHPKI+Kh6pzsc/
GBZN69zzjoSbFCCvGEp9E/5oC1DwbooP6sGa3lHTtHOQH9GP6MWJP3nSK0Uw+Qio
+YgeERJyMEZuXJEFexP5LD4mqotXGA==
=YiTK
-----END PGP SIGNATURE-----

--N3h3NzMMytsYzN3d--


--===============8538142871116762856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8538142871116762856==--

