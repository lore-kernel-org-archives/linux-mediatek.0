Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579E4C00A89
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 14:38:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA68D206E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 14:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m6qsyGlA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NT7p7iVh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA68D206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vcqzdYiXo9i/agouc659p9ORiCOtiZ/AvD+Rv+izu2s=; b=m6qsyGlANb0KCxgrF1NQtNQ+O
	tXWW3fohZqORrr/+yxyF+ANXdld+vckJryHuQXoNMchRIWknUPSgdcnoS8bVTvCI096InJttS3f13
	wn/Bxu1mxmMt4vnzJKlM/DxIxmuwyuQ96NVUf3c80HK/GUkICg5q8fI+cTO1BHRNz8bE+AK/wKIaR
	G7QOiOvtc2rCgeEBHkgJYS2fWcVFnzvmC04bsGWzhghtC4cKaYf8dI28XLmBBB9rh4EltM470UKb/
	0Gd1nKuB1EIej8moycHCBJsxwXAY/xp+dYbJ3Bp0hu/Z8fnAGsHoH3mWmWpcJ5DD6BbE4bYIf0R3R
	+xqZL4UYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYVXY-0000TX-Gq; Fri, 30 Oct 2020 14:38:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYVX7-0000LV-Jl; Fri, 30 Oct 2020 14:37:39 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B069206E3;
 Fri, 30 Oct 2020 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604068656;
 bh=NJEk1fOi2baSXrwNdn5V13l1z+e2gDcusHLmraYKMgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NT7p7iVhiYQCc93ZdI9+xvsSoyTLlIaAUo01rL63ndPVHXIdVEBoSuuqny4XXI6Ir
 04ToYVHYrXRwa08USQWrcDrep1P9ACW8DE8CX3EfXf7FEJON/lZyK8hPKhNOwQHBtS
 gFANu6Q+ZvnMzq9MieFG5Mcf1yuhW3qO8jVGMF7g=
Date: Fri, 30 Oct 2020 14:37:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v3 3/9] ASoC: mediatek: mt8192: support i2s in platform
 driver
Message-ID: <20201030143729.GF4405@sirena.org.uk>
References: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603526339-15005-4-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1603526339-15005-4-git-send-email-jiaxin.yu@mediatek.com>
X-Cookie: Blow it out your ear.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_103737_862581_0595924A 
X-CRM114-Status: GOOD (  17.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com,
 Bicycle.Tsai@mediatek.com, tiwai@suse.com, tzungbi@google.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, Trevor.Wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0476256254530152437=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0476256254530152437==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eNMatiwYGLtwo1cJ"
Content-Disposition: inline


--eNMatiwYGLtwo1cJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 24, 2020 at 03:58:53PM +0800, Jiaxin Yu wrote:

> +static const struct soc_enum mt8192_i2s_enum[] = {
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8192_i2s_hd_str),
> +			    mt8192_i2s_hd_str),
> +};

Why is this declared as a single element array?  It just makes all the
usages look odd for no obvious gain.

> +static int mtk_i2s_en_event(struct snd_soc_dapm_widget *w,
> +			    struct snd_kcontrol *kcontrol,
> +			    int event)

> +	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
> +		 __func__, w->name, event);

This should be dev_dbg() at most, _info() will be too noisy in the logs.
Same for a lot of functions, including the stream callbacks.

> +static int mtk_i2s_hd_en_event(struct snd_soc_dapm_widget *w,
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

This should just be removed entirely, there's trace in the core if you
need logging in production systems - the tracepoints in particular are
good for just leaving on all the time without adding overhead.

> +	return (i2s_need_apll == cur_apll) ? 1 : 0;

Please write normal conditional statements to improve legiblity.

> +	if (rate == 44100)
> +		regmap_write(afe->regmap, AFE_ASRC_2CH_CON3, 0x001B9000);
> +	else if (rate == 32000)
> +		regmap_write(afe->regmap, AFE_ASRC_2CH_CON3, 0x140000);
> +	else
> +		regmap_write(afe->regmap, AFE_ASRC_2CH_CON3, 0x001E0000);

This would be better written as a switch statement.

> +	/* Calibration setting */
> +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON4, 0x00140000);
> +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON9, 0x00036000);
> +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON10, 0x0002FC00);
> +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON6, 0x00007EF4);
> +	regmap_write(afe->regmap, AFE_ASRC_2CH_CON5, 0x00FF5986);

Are you sure this isn't system dependant?

--eNMatiwYGLtwo1cJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+cJSgACgkQJNaLcl1U
h9DnGwf/Sz+4iEFnBKdf1ReJm/KrWBeuGXFTFFpFEUkbpz6hVY2oN3efMZmKihbx
SIG8+D3lwL24nhHvAO0EKiMWyoMbVLwdwglf2r94wOfAtkKcGvIGx7iNYJzZPohm
9zkngD3hK/ZhXjTMRpXzIrQ7yKFyTtC6kEtAsmmquSzIeWaY9ZanzmT1MJL/bG8B
EiH05GkWSRHPiJBtBDeeFs3r7oA2wJH7BZ1QIx56brGjtrNDQli+R+LxCAKt9ivj
PjeOeBuu1+g8HLqHG4z4amUG4j3GEnhsjw3JXwJqoLIO+Xo+judD9VmmE4ZfJnsc
L/jfSQ2e7b9D6e5N2jangPxVJuF9Fg==
=pCPx
-----END PGP SIGNATURE-----

--eNMatiwYGLtwo1cJ--


--===============0476256254530152437==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0476256254530152437==--

