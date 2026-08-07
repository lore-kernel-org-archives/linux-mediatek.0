Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12302C5AD2B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 22:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWHQrKkplC0WYi76yok/S4SnvzljhW3mlGtup9LzYK0=; b=LRJHYS73R18SZaQhvidDR0vgww
	ZjUMnX8xYee7ejz16QoU/Xn7evVUQKjRFWl/zcc3RiqzCgIp2h19mkNrZcBcSMfW0mvoqzqgtCPsH
	bt0NWFrScpFYZKsrKZ/2Bof0OJY44T0ZwAJW43bc7stBxAb9arv5GWHPu2C1RVTa5g0WJ1X1SzvOY
	5kUVfI6AKh0Gv890F+RdaTcTsNkuKSh1RzqqVLYiyGf6xioBVcowRecESE1eigCS2voJX9ycRJYfK
	bD6AlgMnNdfnuSdCbx8uq+1W4s0vlcuEy6HO6Fvbm6bH8zX8Wl3Z07jYIABBAHCmpO/XtmRK70lHZ
	eZUjLTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTUr-00000008q44-40qb;
	Fri, 07 Aug 2026 22:57:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsTUp-00000008q2B-1cWZ
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 22:57:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-495635a85d2so639485e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 15:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786143417; x=1786748217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WWHQrKkplC0WYi76yok/S4SnvzljhW3mlGtup9LzYK0=;
        b=YWA17XwIySzXHNZNYHlKbKmeEUx3WAIGh+YilI1H9teaPqHabMppJ/rZlxsYXsaD2G
         4ZWrRU/jsOTm+eeVPLfVuyOC/Ln/5rXq9GFjR10laTOwHJ0kO0/u6CbRcMH/xfSLZCs6
         U5CqwxyuyTyim3XvLD44gd78gNhq9ob8UtwBvqDixjAHxv1xfbDyp1Zo3jT3bu2pUaQO
         iaZCGkaC7peT62pm2mOK3n7SnUs0K2Lr1GhyYp4FsuOdXP9nmHeZHy2/M/V+DKT62LME
         6W9EV4YLeSsNH7LcbM5bosTAQWl3/7NxB1COnsMlmp6SBDKiZfWjibKrI+g/KWRhD7ij
         YzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786143417; x=1786748217;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWHQrKkplC0WYi76yok/S4SnvzljhW3mlGtup9LzYK0=;
        b=JAey2OoUjn3lsRL96IxIyEk9T4W+svllKGJZk/tRD5PajQBeT8ngnC+JPdlSKY0OeM
         /v5Q4gQjKP9IxaZ7+VMw4LpRFrnrKR6jFcJR8siUYGiRzJO4kU/1H4I3a99b3EG/nLYK
         ZwI65s0Er8XRYi0q5PpSh8gzkcZBJNrIgmxXR4izZgEK5wkw5buYoI8maAgjNIVBXHwe
         4l0tLx4RhFV73P0zVeh3vpb8bZ0H1/KpW/lYBfKzSD5j92LXJdJ1chkrKgiZjcO4mufr
         4mA/NnEjIqVRpBJwyv9MggqZ5zQ8csdlNP4Psht0mhZPNxw6syztQTqJkxZQjBh88Uda
         e4hQ==
X-Forwarded-Encrypted: i=1; AHgh+Rof5J2pE5qxnV0Nm49Xi8+0GlSXy+7jEb7ekGAxa2dxzwQnHlK4wEtaFGyqTDEj5yWiSatklQsycIDCTUWsuA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz+KwcPrOYfTs+hL2ty2Uznltscl6BPOeKtOvS2frZcHDaLInK
	Evt9tebim25iyL7XlA/aQexjd2Pyr9iJ8Cg7pZbqVykXOWiaVdRtw75q
X-Gm-Gg: AR+sD12YiB1LTQ2zE/NnOUpwmlNVjA/EixGbpMvJiIJ7NrEhIO/QjgQlrp81r0IQoa1
	/LHiVz9zzlsoOxwb8zlDdA8kUsEC+xp4KVWLGyfa92zovWaACQRpkjzIqhxmkKWW/4VXxtpuqJU
	7JFkNDAXbPLyNcCBhbBSDy+/05/jXk+EE6sr0WmcRQe7/KInAVJbBOdGru0GFl5pS5mn5IJ6bSh
	vYurltgVP1oGWoCKabqbK/3tlj4WtkcSkAgV85j3kfmHZqgu3JyxBTodSbWDeunvWAethpfhGia
	JiQ8OxvLOsIaE/qWHkoq2XaROObjGwZin6j7kIatHW/U3xaozSBS5bx43QHUk5/cRmi6+fYzo/x
	CTgaWNjQoxAyrj8BCjmzciG+vDfSF+RbMrzK9HtlwKF21VKp6kIbdYk4TFFhetphRvPMAW312fm
	CQNUTmzPWT8BOsmEpV6jO/iwU4lPQzIKtKDPAhBsU6mcNRH8W2aKIeo55w/PWoq104r084NfUvv
	gYJH1raCWL6tWcIAIcS4S1++aH8D2jpRC/fec+Np1JfL1c=
X-Received: by 2002:a05:600c:840f:b0:496:c1f3:e8fb with SMTP id 5b1f17b1804b1-4994e71ffafmr333123705e9.8.1786143417357;
        Fri, 07 Aug 2026 15:56:57 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995427a244sm180639745e9.10.2026.08.07.15.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:56:56 -0700 (PDT)
Message-ID: <6a7662b8.6220df5f.3c6b34.4460@mx.google.com>
X-Google-Original-Message-ID: <anZitWJCkH5j0Zyg@Ansuel-XPS.>
Date: Sat, 8 Aug 2026 00:56:53 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 4/4] ASoC: airoha: Add AFE and machine driver for
 Airoha AN7581
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
 <20260807200936.201827-5-ansuelsmth@gmail.com>
 <8146f434-1e16-4ebd-80a4-b9c27bfa45af@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8146f434-1e16-4ebd-80a4-b9c27bfa45af@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_155659_438211_CD347C25 
X-CRM114-Status: GOOD (  25.53  )
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

On Fri, Aug 07, 2026 at 11:52:58PM +0100, Mark Brown wrote:
> On Fri, Aug 07, 2026 at 10:09:34PM +0200, Christian Marangi wrote:
> > Add support for the Sound system present on Airoha AN7581 SoC. This is
> > based on the mediatek AFE drivers.
> 
> > Also add the machine driver to create an actual sound card for the AFE.
> 
> This should be more patches, the machine driver should be a separate
> patch at a minimum.  Possibly PCM and ETDM drivers too.
> 

Sooo you are suggesting 3 patch? one for machine, one for basic pcm and one
for etdm?

> > +static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
> > +{
> > +	struct an7581_afe_private *afe_priv;
> > +	struct reset_control *reset;
> > +	struct mtk_base_afe *afe;
> > +	struct device *dev;
> > +	int i, irq_id, ret;
> > +	void *base;
> > +
> > +	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> > +	if (!afe)
> > +		return -ENOMEM;
> 
> We allocate afe here with devm_kzalloc() so everything is zero...
> 
> > +	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
> > +				 GFP_KERNEL);
> > +	if (!afe->irqs)
> > +		return -ENOMEM;
> 
> ...then we allocate an array using a size read from the struct which must
> therefore have zero elements.  We also didn't assign dev, either we
> should assign it and use it consistently or we should drop it and use
> &pdev->dev like the first allocation.
>

Nono these were just my mistake with moving code... I already fixed them...
sorry for the mistake.
 
> > +	/* register component */
> > +	ret = devm_snd_soc_register_component(&pdev->dev,
> > +					      &mtk_afe_pcm_platform,
> > +					      NULL, 0);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Cannot register AFE component\n");
> > +
> > +	ret = devm_snd_soc_register_component(afe->dev,
> > +					      &an7581_afe_pcm_dai_component,
> > +					      afe->dai_drivers,
> > +					      afe->num_dai_drivers);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "Cannot register PCM DAI component\n");
> > +
> > +	platform_set_drvdata(pdev, afe);
> 
> The component registration might result in a card being instantiated so
> we need the driver data initialized before we try to register.

Sorry this was asked to be moved in the previous revision by another
review. I will revert following the pattern done in other AFE driver...

-- 
	Ansuel

