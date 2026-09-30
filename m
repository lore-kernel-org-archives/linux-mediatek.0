Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76140CA5FC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2026 07:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRNSLRyn2N1iTesBby/+rq6D8yhyFSP+EyakI7q9A6g=; b=Yg+KOtWPx8vGzVlr9G+9kNnBCd
	7cEDz1rURI8YBMzZRkJ4TrMP67+Y/9nga2028s2Km/rVRQXcUcqlxkePZQPJl5PIx8yaHpH8P4/Yb
	eDVEOef/kfGrf9J5/UfVVZNnPxZn8ioSQ+uWVGn3HjJahpbStHGXN1kUesHTWjWF710P8nKPd40ME
	Ea4qqPGicE/QDJzn6dh60FqY57gVx/i4eyy6hQRlCc8RbNS4RprbDjixC3g0m6U8hUJZs7XlBPlHN
	F2OfckR7tm9U+neS4P7WyxN9adrsiP4xaOgj3KbJ0kh9AD1V51H0+cepuVf3E83Pas9cd5Xfk3yTG
	THHe/GdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBorj-00000005Hyv-0i78;
	Wed, 30 Sep 2026 07:36:35 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBorg-00000005Hwu-3ze1
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Sep 2026 07:36:34 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccda24afso2595436a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753792; x=1791358592; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PRNSLRyn2N1iTesBby/+rq6D8yhyFSP+EyakI7q9A6g=;
        b=kSmBxTIJdXxzW6BOYSjscFNcO7JJjEAh+EBrYtsuTOT+9R4BYr+KYIAsi1neFCot/E
         HaSTp8LB3SR4OT/eJ74DGMAPmLlzTpuUEqxS2jUcEFiM5u79kFmVj3EQp4H5FffT+yxH
         hn1O6gSrpdHA+X4Ed8Cx1Yh9zrJF8KzxICcP/lD5JWM/VyOgwYOS6+NWvmmxc73EQFp8
         rRKAQtb1pkx4Gf252C10ee8vS2rap/5Pyz9aYMUmrSOxOvAWy6wx8wm6mR45HwxS8/QU
         GGLRdSngnPjoKso4UPf8iXKxBFZ41XgXK0V32xoSnp6750EwEIFsWeVcNJ2r1susCnQN
         rMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753792; x=1791358592;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRNSLRyn2N1iTesBby/+rq6D8yhyFSP+EyakI7q9A6g=;
        b=o4h4dM5e6P5IrH55XDD8byAhPEJpj+tD7WbCtx0m5lUvEhgr9zUPul9CHOT92Uk8K5
         mf+sTj4+wLLbDzfd/wDWLrL3wnJnYjG+eAyG6DvvYS//LbC/xg3fGzTCr0iEo4Y0RSI0
         jS75McJp6Gfh1ke7xygjF7bfNjy1ZZyErK4vhgSeEGZuHn83iqDYL9G2DZVagyr74o9g
         lUxWn4VEi1eguhSPJvmXc4ftXjCfVXBvdQ22oX+B+hV5uVjS/rEiD1bM+/LaR93Rg0dQ
         8noOZDGe7miVQqE2C+XpM4eiGFP9UKLQSRGhkSn7h+0m+T1cDuSQQo4C2A8OXyZqjQfk
         /1JA==
X-Forwarded-Encrypted: i=1; AKwUvBxV1dhIlc+CK3bhvlWshZHIQMjikeo4C2DG1I2OXxfLTRvw0H+RLQv1fiPRc2g+DRQ+f7WtsJiPKfXchzz62A==@lists.infradead.org
X-Gm-Message-State: AFuF++khEbbptkqWqjCRLXb57vzkdM6yGcghbL90qGCNMd7PPRM2IaJS
	A1GO2DQxJISbYT1uBDUn+8JHrUPtQmjbdM7zimdzEaGwsuLTJew0zTtG
X-Gm-Gg: AYBFou1/XhSiMV0aRgtYEbmN4ELfDAX3OMPQ+YiI51WCwr9jvAGgEkOsVjDdFzoQ0go
	9Zh1nDt0e0Tn3V84QfmLQsY+Mjgl/jmpLUqUgl0JX6t4YrcCa+WRS25DFROIu+7ndG1hLI9aZRJ
	XlqYv/WQ5lZv47bL0AbCj+I4KyM+jDa+9OwPezFl03nc+QhV2JlzmddBg2eCdXQs9IJf3vR4aKX
	JjTs3IWNYiN6kZTPavowL0I7WEQZKFR3p/NzzFB8+txRwetFHjuRhWdEfclmtdrr/tGiP4b4Ouu
	UFgy/Y0BK6JylJM8xUy9izFh9PS4Oz7hN0C1GHV/Uzz5UD3ReF4XdwGIS8RdTdo/JPIk9x7hMkb
	6HNyUFxt2/DuBfZ2TTTklsaRfQ0Go9N7GGR3DBgNRjvrJZeunZXYcHvzI6du00ZAToNXuJ3GW2o
	NNnRg41OLMKqmEE8hyo8IUPYO7h85UixGbt8kirS5Icf3CHHuAErEiPID3w+L/S/hj6DDMcXekb
	8tReKvLNaszEVspWNiEtSRWS4BMCd3MTookDU/MCh+tyw8ClMiY57A6Z+fPg1ZMmoW5WzxCFGyz
	cbKxoUD5ZHOox+uzPP1ixJ/nQPzec5hdStvyv+M4WFuACOGa/Q==
X-Received: by 2002:a05:6a20:d492:b0:3dd:a196:3095 with SMTP id adf61e73a8af0-3de9ebb39c1mr589504637.69.1790753791652;
        Wed, 30 Sep 2026 00:36:31 -0700 (PDT)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab202f1sm367179a12.27.2026.09.30.00.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:36:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>,
 Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH 16/28] ASoC: apple: Add macaudio machine driver
Date: Wed, 30 Sep 2026 17:36:21 +1000
Message-ID: <ItQHm5ZKQ4Wltp6qbCRkSA@gmail.com>
In-Reply-To: <0ae94fbe-cd41-4d49-b073-e65ab8eff724@sirena.org.uk>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <6dv6M3LAS9mol5fvC8Ie-w@gmail.com>
 <0ae94fbe-cd41-4d49-b073-e65ab8eff724@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_003633_010098_682B7802 
X-CRM114-Status: GOOD (  29.64  )
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

On Monday, 28 September 2026 9:03:13=E2=80=AFpm Australian Eastern Standard=
 Time Mark=20
Brown wrote:
> On Sat, Sep 26, 2026 at 11:06:02AM +1000, James Calligeros wrote:
> > On Tuesday, 22 September 2026 7:38:54=E2=80=AFpm Australian Eastern Sta=
ndard Time=20
Mark Brown wrote:
> > > > +	list_for_each_entry(kctl, &ma->card.snd_card->controls, list) {
> > > > +		if (!snd_soc_control_matches(kctl,
> > > > volume_control_names[ma->cfg->amp]))
> > > > +			continue;
> > >=20
> > > This is used from the volume limit timeout work which doesn't hold the
> > > controls_rwsem, userspace can add or remove user controls which would
> > > change the list so the work needs to lock the controls list.
> >=20
> > Would it be sufficient to scoped_guard the controls_rwsem wherever we
> > use this pattern?
>=20
> I think so, but I didn't properly check.
>=20

I did some testing of this and it causes deadlocks if we try to take the
semaphore from inside the workqueue. I believe it is related to the fact
that speakersafetyd has a blocking handle to the controls open at all times.
This may be fixable by simply having speakersafetyd take a nonblocking
handle instead. I will do some more testing before submitting v2.

> > > > +static int macaudio_dpcm_hw_params(struct snd_pcm_substream
> > > > *substream,
> > > > +				   struct snd_pcm_hw_params *params)
> > > > +{
> > > > +	struct snd_soc_pcm_runtime *rtd =3D
> > > > snd_soc_substream_to_rtd(substream);
> > > > +	struct macaudio_snd_data *ma =3D snd_soc_card_get_drvdata(rtd->ca=
rd);
> > > > +	struct macaudio_link_props *props =3D
> > > > &ma->link_props[rtd->dai_link->id];
> > > > +	struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> > > > +	struct snd_interval *rate =3D hw_param_interval(params,
> > > > +						     =20
SNDRV_PCM_HW_PARAM_RATE);
> > > > +	int bclk_ratio =3D macaudio_get_runtime_bclk_ratio(substream);
> > > > +	int i;
> > > > +
> > > > +	if (props->is_sense) {
> > > > +		rate->min =3D rate->max =3D cpu_dai->symmetric_rate;
> > > > +		return 0;
> > > > +	}
> > >=20
> > > It feels like this DAI ought to have separate ops...  Also, for the
> > > sense link will we definitely already have a rate set up?
> >=20
> > AIUI, the cpu rate should always be set up by the time we hit
> > this path as it is only taken when setting up the VISENSE FE (after the
> > playback stuff is already set up).
>=20
> Is that something we actually enforce or is that just a thing a sensible
> userspace should do?  I can see something racing.

We don't really enforce it. speakersafetyd is the only thing that opens the
VISENSE PCM and does a blocking read of samples
which only starts and subsequently completes after the "real" PCM
is configured and playback begins. The sample rate is reliably
reflected to speakersafetyd via the kcontrol on the VISENSE PCM. We
have not experienced any race issues with this arrangement in ~5 years
nor has anyone reported any to us. I'm happy to take pointers on
how we should be doing this if the current approach won't fly.



