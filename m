Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35E3C25B4F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 13:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5p3RC2fOBcO/yszjFBGlQ+kLMIrLhRgtWIMaY5UGI4Q=; b=j+eZdzgpU4D43d3+aAtDEQTws/
	NEZMpcIhzcG7x0kUemz7IsDYzcLvPcT1h28XA1wBbrnSHh2ZZUpLTBha/xy27uEHrKa15tArsM/et
	vBZ6gmEtIpP0XFXwR0ZzfGBFgzY2AmEAckUDXSV6F2LgpdCERqAg3l1vF+6zdoVMhchCXU7EJUs7F
	s+pUI9rArql851n59MEVDRFDU7X+vKVAqDv2G7GVgd9WsgBxo65Ru0lw0Ht+d9WX9V8DCoDWRfdxO
	PhnuajgxIEsDMs5b58S9jBrgrxpGYM0q7uHnMdLSYFAR6CY9haWnizTyi/vKIaY8vbM9/F7kOptKb
	4zDOcJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4L2f-0000000BHvn-1Epr;
	Tue, 07 May 2024 13:39:37 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4L2b-0000000BHsf-3ujl
	for linux-mediatek@lists.infradead.org;
	Tue, 07 May 2024 13:39:35 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5210684cee6so1463649e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 May 2024 06:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715089169; x=1715693969; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5p3RC2fOBcO/yszjFBGlQ+kLMIrLhRgtWIMaY5UGI4Q=;
        b=jACnwJXlXazbqw/IM16t1tnDXlV6R/ElNJzAHkW2ZTZ6qxtz8bDtskzJI96275b4JE
         6GYbGalKj3lLjtTrrsYDpuDbcSCGw75NZqE6aotoZlHebVz/oXNZRJpk7ZXxf2sdgY9h
         ht9Dx1CNouQrCSeX/4+fuDugqjBleixdJiKDbt2AmawVngZaHe4wmXYxDpJDTHGUNKwP
         yTfOypvtuHeX/Rqw3KpcpoQDPiL7YcyOlaQWc1iap4x9nhPYKhH8oB2rZrszyCT18LTp
         JlcuA516XuMZDbFM/C1aTaiqP6SsTd7pgfjdydAzlIQ7HIFk0mYlhhLdrMSbDunODUvL
         Jypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715089169; x=1715693969;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5p3RC2fOBcO/yszjFBGlQ+kLMIrLhRgtWIMaY5UGI4Q=;
        b=sRcZdBJPKs+bBnb5f6ZDo0uWXxWW1Nf9lh91d2t8aj8MVE5nOida8+Hvudpo5L3zNT
         P2oPy4zG3n874yGVy3FXzo/QB/8cL2TryGZsh4q2uQ5UfP0wTDomB4emD0kWCtTEIIWM
         KQkYpFkk8uSxBBSBFXR4u4/CamaZ1xPgiP+zUda+Rm7x8jHs40vTcJjkqrhta47zpFm1
         Srrm67/f4DNQ+6dCUnHhQwZe5mKu5z4spr+0JhPg4d8uY5OhdOG2n+OaJgnaxvVfYpUO
         hJd4JBYS4Cw2gkwNCqN+EUMtrwYPVwwkA6IMcKQgLNwjjZluRcENHpnF711pKyrVBqQV
         ha8g==
X-Forwarded-Encrypted: i=1; AJvYcCWnEbn6a8H7A3+O59OWVHrp1Zu7qV5sKnwZuUVy/fXcIwJUuhf+Dl25R3unIueC55QnKq2hl6t8yogocc9O/HttyQ1W+rQ15SQxnA3U65w6oR3F
X-Gm-Message-State: AOJu0Yxq3zxyZHoaH8jkRBInUpFOdxBFAo0UD/NmyGihUiOYHmi7UtxG
	vYKUXy1sleEU4Kch0fj5zZqScGg3mU3msWY/1xnrmGX7wK/soqu8Cxl/bQqWpRA=
X-Google-Smtp-Source: AGHT+IESLrpsKBO3/nRqeo+k6p8A6E2bV8DthVHdN8GSSDT4aFa4P1rb+4V8Tlme+ePuRrgdQdEv7A==
X-Received: by 2002:a19:8c16:0:b0:51e:150e:2c45 with SMTP id o22-20020a198c16000000b0051e150e2c45mr8493801lfd.63.1715089168968;
        Tue, 07 May 2024 06:39:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id x36-20020a056512132400b0051d4321ef58sm2127976lfu.61.2024.05.07.06.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:39:28 -0700 (PDT)
Date: Tue, 7 May 2024 16:39:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Vinay Simha BN <simhavcs@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	dri-devel@lists.freedesktop.org, Michael Walle <mwalle@kernel.org>, 
	Daniel Semkowicz <dse@thaumatec.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/20] drm/bridge: add dsi_lp11_notify mechanism
Message-ID: <577v55mspa672t2bqbwwvdtfdgtbj6mpejo3n56qk7bt2j6bt3@q54dfnupcvs4>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
 <20240506-tc358775-fix-powerup-v1-1-545dcf00b8dd@kernel.org>
 <2189493.irdbgypaU6@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2189493.irdbgypaU6@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_063934_050316_FBC94044 
X-CRM114-Status: GOOD (  39.34  )
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

On Tue, May 07, 2024 at 10:37:54AM +0200, Alexander Stein wrote:
> Hi Michael,
> 
> Am Montag, 6. Mai 2024, 15:34:30 CEST schrieb Michael Walle:
> > Some bridges have very strict power-up reqirements. In this case, the
> > Toshiba TC358775. The reset has to be deasserted while *both* the DSI
> > clock and DSI data lanes are in LP-11 mode. After the reset is relased,
> > the bridge needs the DSI clock to actually be able to process I2C
> > access. This access will configure the DSI side of the bridge during
> > which the DSI data lanes have to be in LP-11 mode.
> 
> Apparently this is an issue for a lot of DSI bridges. But enabling LP-11 for
> a bridge is impossible with current documentation [1], which states "A DSI
> host should keep the PHY powered down until the pre_enable operation is
> called."
> Additionally tc358767/tc9595 (DSI-DP bridge) needs LP-11 for AUX channel
> access to even get EDID. This is a requirement before pre_enable would
> even be possible.
> 
> So some changes to the current flow are needed. But I am not so sure
> about LP-11 notification. IMHO a device request to the DSI host to
> enable LP-11 seems more sensible.

Granted that there can be several DSI devices sharing the DSI bus (aka
split-link), I was toying with the idea of making the DSI host call
attached DSI devices when the transition happens.

I don't have a fully working PoC and I probably won't have it ready til
the end of May because of the lack of time and different local
priorities.

> 
> Best regards,
> Alexander
> 
> [1] https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#mipi-dsi-bridge-operation
> 
> > After everything is
> > configured the video stream can finally be enabled.
> > 
> > This means:
> >  (1) The bridge has to be configured completely in .pre_enable() op
> >      (with the clock turned on and data lanes in LP-11 mode, thus
> >      .pre_enable_prev_first has to be set).
> >  (2) The bridge will enable its output in the .enable() op
> >  (3) There must be some mechanism before (1) where the bridge can
> >      release its reset while the clock lane is still in LP-11 mode.
> > 
> > Unfortunately, (3) is crucial for a correct operation of the bridge.
> > To satisfy this requriment, introduce a new callback .dsi_lp11_notify()
> > which will be called by the DSI host driver.
> > 
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 16 ++++++++++++++++
> >  include/drm/drm_bridge.h     | 12 ++++++++++++
> >  2 files changed, 28 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 28abe9aa99ca..98cd6558aecb 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -1339,6 +1339,22 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> >  }
> >  EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
> >  
> > +/**
> > + * drm_bridge_dsi_lp11_notify - notify clock/data lanes LP-11 mode
> > + * @bridge: bridge control structure
> > + *
> > + * DSI host drivers shall call this function while the clock and data lanes
> > + * are still in LP-11 mode.
> > + *
> > + * This function shall be called in a context that can sleep.
> > + */
> > +void drm_bridge_dsi_lp11_notify(struct drm_bridge *bridge)
> > +{
> > +	if (bridge->funcs->dsi_lp11_notify)
> > +		bridge->funcs->dsi_lp11_notify(bridge);
> > +}
> > +EXPORT_SYMBOL_GPL(drm_bridge_dsi_lp11_notify);
> > +
> >  #ifdef CONFIG_OF
> >  /**
> >   * of_drm_find_bridge - find the bridge corresponding to the device node in
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 4baca0d9107b..4ef61274e0a8 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -630,6 +630,17 @@ struct drm_bridge_funcs {
> >  	 */
> >  	void (*hpd_disable)(struct drm_bridge *bridge);
> >  
> > +	/**
> > +	 * dsi_lp11_notify:
> > +	 *
> > +	 * Will be called by the DSI host driver while both the DSI clock
> > +	 * lane as well as the DSI data lanes are in LP-11 mode. Some bridges
> > +	 * need this state while releasing the reset, for example.
> > +	 * Not all DSI host drivers will support this. Therefore, the DSI
> > +	 * bridge driver must not rely on this op to be called.
> > +	 */
> > +	void (*dsi_lp11_notify)(struct drm_bridge *bridge);
> > +
> >  	/**
> >  	 * @debugfs_init:
> >  	 *
> > @@ -898,6 +909,7 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
> >  void drm_bridge_hpd_disable(struct drm_bridge *bridge);
> >  void drm_bridge_hpd_notify(struct drm_bridge *bridge,
> >  			   enum drm_connector_status status);
> > +void drm_bridge_dsi_lp11_notify(struct drm_bridge *bridge);
> >  
> >  #ifdef CONFIG_DRM_PANEL_BRIDGE
> >  bool drm_bridge_is_panel(const struct drm_bridge *bridge);
> > 
> > 
> 
> 
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
> 
> 

-- 
With best wishes
Dmitry

