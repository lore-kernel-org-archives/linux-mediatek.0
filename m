Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB518C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Feb 2022 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMeQs/sp0V0pFqwY9ej4xt16GryIdouInJpuL+91/YY=; b=IvIUC4MMntLF85MKJum+VKQ/jv
	TcvpP9wvQQZVVhUnHLTk+b+CalVpfrD1JWUxktL8r1pBUoT0SuAGJxyZt0f5zu2QDUBCMO5t2XXZ5
	KcSjSNX5Dd4egm0jJqi+aBRsBlmDVU/ei8OAShxhmKZViJI140+WPK7ZW9iXUXRx4u456H2M+/sad
	+OXWdY9ISOmjbMuGixLEw3Zx83BH+Jfarckvc1Pll0c+SdJHOXGtmEf5DPIsE95SblnCNA2AlFvCt
	lUjh0km85L+zZLf3V1DVRr1YRjDo29Pqblc6H7Kg+sFzwrKPHU3saLPz/QoeLyPXRdeZFTAK+hh3p
	R+Fx5SlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIXZv-007iyq-AH; Fri, 11 Feb 2022 15:11:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIXZf-007iwS-EY; Fri, 11 Feb 2022 15:11:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D42C2B82A6D;
 Fri, 11 Feb 2022 15:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71801C340E9;
 Fri, 11 Feb 2022 15:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644592260;
 bh=yJSk4L5HsItHxMJcn7RPlOgarRlO8VBIH+WmTOcXLOg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VEjL6R0ZUonlqNIwyPEtl0VSA6V/hI22RLzZDd+F6g1Cq+8+bQ5L9Qmirb0BqBdQO
 WAvvR81ULKp2sF0fIkQYe1Nf89uIkVTBZ1bA2yTOcP7CXJx03FC867IMwhFzDy0jaV
 l5uqea3U58VGTj8dXgFw5oVk71WbZpN+nXKNUhzKv2aC6Q5jv7qC+O9nqOon2kbHSb
 M7/Iyp0VQlewoMLx5W27UQSc9abaEpkYM1cCCaAk4hdbQJbgOTyzxV0pKu3gIDtAXh
 Edc3Pf30q0NK1nJisNoEYs9bhzdHXVSDc3N26fZKTlAjRA2WvHTTnBwn3ovnqWsIru
 K8X6vWgc0LNwA==
Date: Fri, 11 Feb 2022 15:10:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: lgirdwood@gmail.com, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, p.zabel@pengutronix.de,
 geert+renesas@glider.be, trevor.wu@mediatek.com, tzungbi@google.com,
 zhangqilong3@huawei.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/15] ASoC: mediatek: mt8186: support adda in platform
 driver
Message-ID: <YgZ8fnvd4/Mxm3wp@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
 <20220211103818.8266-4-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20220211103818.8266-4-jiaxin.yu@mediatek.com>
X-Cookie: do {
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_071103_794788_6C798899 
X-CRM114-Status: GOOD (  22.56  )
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
Content-Type: multipart/mixed; boundary="===============1451676727066849027=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1451676727066849027==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jQ99B0YRXDijfpGR"
Content-Disposition: inline


--jQ99B0YRXDijfpGR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2022 at 06:38:06PM +0800, Jiaxin Yu wrote:

This looks pretty good, there's some issues below but they're all very
minor, mostly stylistic things rather than anything substantial.

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  MediaTek ALSA SoC Audio DAI ADDA Control
> + *
> + *  Copyright (c) 2022 MediaTek Inc.
> + *  Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> + */

Please make the entire comment a C++ one so things look more
intentional.

> +static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol,
> +			     int event)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> +	int mtkaif_dmic = afe_priv->mtkaif_dmic;
> +
> +	dev_info(afe->dev, "%s(), name %s, event 0x%x, mtkaif_dmic %d\n",
> +		 __func__, w->name, event, mtkaif_dmic);

This should be dev_dbg() at most, otherwise the logs will get very noisy
(but note that there are trace points in the core which cover this).
There's a bunch of other dev_info() calls like this on DAPM events.

> +		if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2_CLK_P2)
> +			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x38);
> +		else if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2)
> +			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x30);
> +		else
> +			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x30);

This could be more clearly written as a switch statement.

> +			if (strcmp(w->name, "ADDA_MTKAIF_CFG") == 0) {
> +				if (afe_priv->mtkaif_chosen_phase[0] < 0 &&
> +				    afe_priv->mtkaif_chosen_phase[1] < 0) {
> +					dev_info(afe->dev,
> +						 "%s(), calib fail mtkaif_chosen_phase[0/1]:%d/%d\n",
> +						 __func__,

Should this be a dev_err() given that the calibration failed?

> +/* mtkaif dmic */
> +static const char * const mt8186_adda_off_on_str[] = {
> +	"Off", "On"
> +};
> +
> +static const struct soc_enum mt8186_adda_enum[] = {
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8186_adda_off_on_str),
> +			    mt8186_adda_off_on_str),
> +};

This is a simple on/off control so should be a standard numeric control
with a name ending in Switch to help UIs handle it properly.

> +static int mt8186_adda_dmic_set(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> +	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
> +	int dmic_on;
> +
> +	if (ucontrol->value.enumerated.item[0] >= e->items)
> +		return -EINVAL;
> +
> +	dmic_on = ucontrol->value.integer.value[0];
> +
> +	dev_info(afe->dev, "%s(), kcontrol name %s, dmic_on %d\n",
> +		 __func__, kcontrol->id.name, dmic_on);
> +
> +	afe_priv->mtkaif_dmic = dmic_on;
> +	return 0;

This should return 1 if the value changed so an event is generated for
userspace.  You might want to run the mixer-test kselftest (ideally the
version that's in -next as there were a few bits added very recently),
it should detect issues like this.

--jQ99B0YRXDijfpGR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGfH0ACgkQJNaLcl1U
h9DHegf9FFOH5x7aOO8tIrLCjfLZFtOCnSo3V7OkQ8PJX+03uK3Ix78EZtr4fty8
+Kp/3NwD98U0ZtN8thMfTOozGdzcfWUFiKGiBLFN0lFXt6h4whktuTB+OJfhmwy1
mbmVi46mEJphnEyVhY6cS8b/AXeZ8usoZb3h/3meT8/nHKfP3ihQZKeBntk1y4Eh
Fj/mJtQIOA/ck+U6bMyaXaSZ8kYsBlpNin/MI+dPNxk50W2WSZJIFNe+PIMeGiuT
41F/eRkbYtv+nCmVmmdBuw3YLNUzSXLNYzttDYlofXvnz3mbraXvhny8qJ0ZA3X7
fBlHVaOI7kH11JdpDxFVoftYhH2YQg==
=N7WM
-----END PGP SIGNATURE-----

--jQ99B0YRXDijfpGR--


--===============1451676727066849027==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1451676727066849027==--

