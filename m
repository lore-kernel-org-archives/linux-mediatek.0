Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34B8C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 12:06:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1AD52080C
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 12:06:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0HNvIaM7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jT2HBedN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1AD52080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QhzCDYo0tkEWVt3C+m3CogmwCj4bniq4qGrKGpEDr2o=; b=0HNvIaM71YtN3MCSWkPLfkdDq
	A0trpLjj2emKhlbboW+wpQa/+IS7lGErU/3ddltJw6CYtE2Rh1s2ARzvqohWlHQxpg7lzqDv1CwcH
	G3vyVtha2TZFotLxIygU9aKteI6dim5Gof1NERNJ5ZOEHAo3fihF1H9m5m34brbuQIlEDi6SpIPki
	sT70iAsoQghQR9xP9pgFst3i7OipjZ11pwjYF50RWO+6kMjwW1w7p344oWEI8+Peu8mVGTwvLNYwn
	4D6GtQtJ3rtjIX6kw4NKg4TrvwiF1uEK40P9GQfo0wSyLi0Cuse4JyaRNaxy1Ljtvew8FFiV/mu2O
	i7tONxTLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5pWF-00077Q-Ul; Wed, 12 Aug 2020 12:06:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5pWA-00075i-76; Wed, 12 Aug 2020 12:06:07 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E78D4207F7;
 Wed, 12 Aug 2020 12:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597233964;
 bh=MM8pmV2QgsjxdXSSM0B2DrSsgot2dM8rNva9Cu3oxH8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jT2HBedN+7Xl2ZMqfco4gYuAi3jJlp6W72K6S+ofFy1AO5aUUC1zZeI5QwXPv89S+
 JV0aP++AnLYNFZ7uvMw85wcAQJ7QwOTYxV2wD89dpQubayYvwWjJCwntESy3xnX3r1
 0jrjy1RRyENK1rJGcsxsZdOpUos08yVoOzHs1NG8=
Date: Wed, 12 Aug 2020 13:05:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt6359: add codec driver
Message-ID: <20200812120537.GA5545@sirena.org.uk>
References: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
 <1597028754-7732-2-git-send-email-jiaxin.yu@mediatek.com>
 <20200810185933.GI6438@sirena.org.uk>
 <1597217353.23246.45.camel@mhfsdcap03>
MIME-Version: 1.0
In-Reply-To: <1597217353.23246.45.camel@mhfsdcap03>
X-Cookie: No purchase necessary.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_080606_470546_09DDB27F 
X-CRM114-Status: GOOD (  32.66  )
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
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3535045539718475411=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3535045539718475411==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2020 at 03:29:13PM +0800, Jiaxin Yu wrote:
> On Mon, 2020-08-10 at 19:59 +0100, Mark Brown wrote:
> > On Mon, Aug 10, 2020 at 11:05:53AM +0800, Jiaxin Yu wrote:

> > > +void mt6359_set_playback_gpio(struct snd_soc_component *cmpnt)
> > > +{
> > > +	struct mt6359_priv *priv =3D snd_soc_component_get_drvdata(cmpnt);

> > What are these, should they not be managed through gpiolib and/or
> > pinctrl?

> These are the functions that control the mux of input or output
> signal. I refer to the other codec drivers, most of them are manipulate
> the regs in their codec drivers also. Maybe it's easier to control?

These functions are exported for other drivers to use rather than
something done internally by the driver - if this were internal to the
driver it'd not be a big deal but when it's for use by another driver
it'd be better to go through standard interfaces.

> > > +int mt6359_mtkaif_calibration_enable(struct snd_soc_pcm_runtime *rtd)
> > > +{

> > > +EXPORT_SYMBOL_GPL(mt6359_mtkaif_calibration_enable);

> > Why is this exported?

> This function is exported to machine driver to do calibration when
> registering. The interface between MT6359 and MTK SoC is a special
> interface that named MTKAIF. Therefore, if MT6359 is to be used
> normally, it needs to rely on the platform for calibration when
> registering.

So this needs the SoC to do something as part of callibration?

> > > +	switch (event) {
> > > +	case SND_SOC_DAPM_PRE_PMU:
> > > +		priv->dev_counter[device]++;
> > > +		if (priv->dev_counter[device] > 1)
> > > +			break;	/* already enabled, do nothing */
> > > +		else if (priv->dev_counter[device] <=3D 0)

> > Why are we doing additional refcounting on top of what DAPM is doing?
> > This seems like there should be at least one widget representing the
> > shared bits of the audio path.

> We have "HPL Mux" and "HPR Mux", there will be two paths enabled when
> playback throuh HP. But actually they share the same control sequences.
> So in order to prevent setting it one more time we do additional
> refcouting.

That sounds like you should just have one output path defined in DAPM
and merge the left and right signals together rather than maintaining
them separately.

> > > +	/* hp gain ctl default choose ZCD */
> > > +	priv->hp_gain_ctl =3D HP_GAIN_CTL_ZCD;
> > > +	hp_gain_ctl_select(priv, priv->hp_gain_ctl);

> > Why not use the hardware default?

> We have two ways to control the volume, there is to select ZCD. Because
> the other one it not often used, ZCD is used by default.=20

Why not just let the user pick at runtime?

> > > +	ret =3D regulator_enable(priv->avdd_reg);
> > > +	if (ret) {
> > > +		dev_err(priv->dev, "%s(), failed to enable regulator!\n",
> > > +			__func__);
> > > +		return ret;
> > > +	}

> > Perhaps make this a DAPM widget?

> "vaud18" needs to be always on so we enable it when codec probe.

If it is just supposed to be left on all the time it's better to do this
in the main device model probe rather than the component probe.  The
component probe should usually only be used for things that need the
rest of the card to be there.

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8z2xAACgkQJNaLcl1U
h9D7Wwf+OdwVBUD42cfqMOKbAwel1jObAQofx/ASxy8YgjsPQp8Jjkm39G6YSYyJ
8nK3lQ1sz6qZtJ2KsZp6jG/aEOC5w7aBQdZszyRHXuneIp4KtvLG+AYHSO54DMXb
ftsOw4EyQjzNY61qz0ZZ3H7vMObW+1o8uMEBKadB8MMz7oufbCUcV8auAps+K+L1
si165INgJFZpfrKk/8YvNVqBAlcXMDjGpcZtO6gfEi9AuDQnZfJWte/1hOBgQynL
84UFJWIEtkVCWadlYwBU1VcQD/3bOkpfyFMIoYII0BquCKBUqxmcLA2NxFV7Ami1
U58UVe1qf4mt+vS7hAjBlmh6JTrUnw==
=Fkwb
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--


--===============3535045539718475411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3535045539718475411==--

