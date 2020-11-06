Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F461C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 12:27:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC41A2071A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 12:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l3bfaT+K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYs4+EV9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC41A2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=26ZYBgZdE5LOGs+piFYDuy5ZeiqwT9K30MXDj8Sb2c4=; b=l3bfaT+K7n6LeNz02nFujv2y2
	EglvkLlmxuUPReB8FPcN6Y+9+n+w/6TTQXDXSVQUvY1CNbuFvfvoMr/VrCRtmd9Q7zwJaicSevRc+
	o4uf7uOVisf0wvZt3I2OTkOlRoQJW2JdcO98BJNNMDMnFvtJOE3+Qtp9/mT90RCV9aiGAzlnNKHPB
	7EVR6RfcZ3tbXTYLQhUyo8M0j5/m0LzkEhW3Q+L6lvDWgPeaPoOv8zR6kpG/Ja+cKw86T40R346pO
	LsxB6nvZAgdLf3fXnhlPM41BwHN3Tut+kwluHlmMOR1DTQz0TfXSvXienTShLsK2Yz1XNWl/nm6Aj
	iS3WUraHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb0pM-0002ON-To; Fri, 06 Nov 2020 12:26:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb0pK-0002NY-I1
 for linux-mediatek@lists.infradead.org; Fri, 06 Nov 2020 12:26:47 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2014F2071A;
 Fri,  6 Nov 2020 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604665605;
 bh=9V54Jr5H0EdeTkVkxoMOzaxfGCPypxqBxjaZGL7Cm0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mYs4+EV9t/i7hajNy4K6BMmfClq3akssETZ5FGnkl1Bz74kMf3QK3ypU5VbkJuPKI
 WITwP9TSJ5JIDC86DozewaI5KFy0ONn9K2/+Oj9teymV2hrgSLy6T3YfMp7VP2D2vJ
 dDxIgjcFQINek/iwsif4jj1chN/dZZwRY4+qoqms=
Date: Fri, 6 Nov 2020 12:26:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Shane Chien <shane.chien@mediatek.com>
Subject: Re: [PATCH] ASoC: Fix vaud18 power leakage of mt6359
Message-ID: <20201106122633.GD49612@sirena.org.uk>
References: <1604643517-3527-1-git-send-email-shane.chien@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1604643517-3527-1-git-send-email-shane.chien@mediatek.com>
X-Cookie: When does later become never?
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_072646_695228_E5C214DE 
X-CRM114-Status: GOOD (  13.77  )
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
Cc: devicetree@vger.kernel.org, chipeng.chang@mediatek.com,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: multipart/mixed; boundary="===============8895854648955052980=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============8895854648955052980==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hoZxPH4CaxYzWscb"
Content-Disposition: inline


--hoZxPH4CaxYzWscb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 06, 2020 at 02:18:37PM +0800, Shane Chien wrote:

> +static int mt_vaud18_event(struct snd_soc_dapm_widget *w,
> +			   struct snd_kcontrol *kcontrol,
> +			   int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
> +	int ret = 0;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		ret = regulator_enable(priv->avdd_reg);
> +		if (ret)
> +			dev_err(priv->dev, "regulator_enable err: %d\n", ret);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		ret = regulator_disable(priv->avdd_reg);
> +		if (ret)
> +			dev_err(priv->dev, "regulator_disable err: %d\n", ret);
> +		break;

This is just a SND_SOC_DAPM_REGULATOR_SUPPLY widget as far as I can see
- why not use one of those rather than open coding?

--hoZxPH4CaxYzWscb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+lQPgACgkQJNaLcl1U
h9ATgAf+MT1NV/U76nz6AUWoZkMQhuvyA3qL76F+YzE1WOVNx0KUfjs4EkbXahvJ
+UAo0/iy/ZxtVGfKB2yGpdNb3rCVPhi4kjoUHx+o3qKdXqf9Eq4Ax45OKzTJF1PS
3FtGEnGsOEyJuhCDomp9MTdWDQq7LlypB9Qv7BnNjU/XHt7KRZEUGAiQv4EwuwYq
qg/H+tqFg9zozQFj2tXP7gvvsFcRZfTUqqhnlgob33RUvVKT3Uyiw8voNbeFuXby
NQym7YshcBcIv8EiS3Tvo3t5/FOx0/+/4EPQU53Mtxv4PQafMqQlseEUaN7U83ou
E9gWxWQ6vcKW3HNgGcDFLfUmnURj+g==
=IN8z
-----END PGP SIGNATURE-----

--hoZxPH4CaxYzWscb--


--===============8895854648955052980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8895854648955052980==--

