Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB80DC10F1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 08:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCgSfPagde6d/ABPspOMI3lsg3aDrKX9SBMWiVfXbrc=; b=zGSAcWFkUbaQDwTMIA6B33kD5s
	WoYrL77muSFjm2MvoCAP3TUpvBxc0k/siyU6UasrbjzCfdkTXbclYfo8OP7qxVIPxGNk9CXV+mrxS
	i16D3THIZ2K1fGe72hlauy9kGxBYfJjBxdfKXlpJyLFJxnwYNzy0q5CZ+2Th1j3CqwHCZwKVhTUAU
	kpiRtKvE+UcDUncir/hzAQYL9jTseQhV4YTmbeybvXxsQjT2Zg7OUIfmalrVIsJ2on1ghulINuKwq
	RcCeUAFnif9dffiGLFFmGMTAw//hxdjtOqJsgn2IShonxo4BdtndCofwt/jCs6iID6EW2MtcniUpC
	mrMr1ICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4GKz-0000000AA0i-3lbC;
	Tue, 07 May 2024 08:38:13 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4GKq-0000000A9ub-05N3;
	Tue, 07 May 2024 08:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1715071084; x=1746607084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kCgSfPagde6d/ABPspOMI3lsg3aDrKX9SBMWiVfXbrc=;
  b=p5dntRIGgCHmU+XbyQ6NMa6WBBdixMkz/gO2OI8Nomg19XMNQWA1tLiB
   n/+3/pcxtJXrBh8rDR359gDGPFuxXgnOk8D5Ag+5HZKW60ND5HMAMNDtQ
   oc6/1DoaENbhgxXp1TXRY++3eWpAuPhTgH0Igq5mq5Cuyd7l8mDw+BPNa
   /VDucWdLt8spC9DA8kA2YJ2K7frkyZj3vZxKu1u7KtvYzBpYa3QCuleQU
   8lf00UJjrhfauxoHk1eHLQLkXulQcTAttysyIZUbrXGifRgpcRX/a/iG9
   2ePxcOc+ktStuHObXc9MUyLWhAK01CBOY2g91M1Bp+ithPpUlVjgF2orw
   A==;
X-CSE-ConnectionGUID: Svc8qAVLTSiOeuN7nyehnw==
X-CSE-MsgGUID: 2I61W6DfS5iDfT/LbGMx+A==
X-IronPort-AV: E=Sophos;i="6.07,260,1708383600"; 
   d="scan'208";a="36780743"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 May 2024 10:37:59 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DEE5D176472;
	Tue,  7 May 2024 10:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1715071075;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kCgSfPagde6d/ABPspOMI3lsg3aDrKX9SBMWiVfXbrc=;
	b=QPZnrgN6o+h3vyUvwj0wVo0UJUUiAfyFAdHT8nXdQARRbD1/AQQiMaWv0HDsoNBFU5vZjG
	nYWxaj4Vez9+E8JSKgUhbSG0VdkE2LUrGCrv4RVUkR2xXf3HE7/zjdAHdV8gBsixT2+JUF
	9jEl6x11SaXvMgiRVfxKDyscOmjcJAgVVL3lsyNrwPmvo8ZF+HRF4lzq2WX1eJxacxiFXF
	hDmzArHEU3NCrhtti+I/ZT7hxC9ZY76n9F0mRkuDpXA0CABTRLgYVWMpi51wx19+Hs5xNq
	lW3wq92IuckX2fFQaO5zs4Q6Ys4Ux5UN+Ia2VwfB/yeifesQ4q9efaWFv5dlxw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org, Michael Walle <mwalle@kernel.org>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 01/20] drm/bridge: add dsi_lp11_notify mechanism
Date: Tue, 07 May 2024 10:37:54 +0200
Message-ID: <2189493.irdbgypaU6@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20240506-tc358775-fix-powerup-v1-1-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org> <20240506-tc358775-fix-powerup-v1-1-545dcf00b8dd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_013804_687891_3584CD49 
X-CRM114-Status: GOOD (  28.71  )
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

Hi Michael,

Am Montag, 6. Mai 2024, 15:34:30 CEST schrieb Michael Walle:
> Some bridges have very strict power-up reqirements. In this case, the
> Toshiba TC358775. The reset has to be deasserted while *both* the DSI
> clock and DSI data lanes are in LP-11 mode. After the reset is relased,
> the bridge needs the DSI clock to actually be able to process I2C
> access. This access will configure the DSI side of the bridge during
> which the DSI data lanes have to be in LP-11 mode.

Apparently this is an issue for a lot of DSI bridges. But enabling LP-11 for
a bridge is impossible with current documentation [1], which states "A DSI
host should keep the PHY powered down until the pre_enable operation is
called."
Additionally tc358767/tc9595 (DSI-DP bridge) needs LP-11 for AUX channel
access to even get EDID. This is a requirement before pre_enable would
even be possible.

So some changes to the current flow are needed. But I am not so sure
about LP-11 notification. IMHO a device request to the DSI host to
enable LP-11 seems more sensible.

Best regards,
Alexander

[1] https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#mipi-ds=
i-bridge-operation

> After everything is
> configured the video stream can finally be enabled.
>=20
> This means:
>  (1) The bridge has to be configured completely in .pre_enable() op
>      (with the clock turned on and data lanes in LP-11 mode, thus
>      .pre_enable_prev_first has to be set).
>  (2) The bridge will enable its output in the .enable() op
>  (3) There must be some mechanism before (1) where the bridge can
>      release its reset while the clock lane is still in LP-11 mode.
>=20
> Unfortunately, (3) is crucial for a correct operation of the bridge.
> To satisfy this requriment, introduce a new callback .dsi_lp11_notify()
> which will be called by the DSI host driver.
>=20
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 16 ++++++++++++++++
>  include/drm/drm_bridge.h     | 12 ++++++++++++
>  2 files changed, 28 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 28abe9aa99ca..98cd6558aecb 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1339,6 +1339,22 @@ void drm_bridge_hpd_notify(struct drm_bridge *brid=
ge,
>  }
>  EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
> =20
> +/**
> + * drm_bridge_dsi_lp11_notify - notify clock/data lanes LP-11 mode
> + * @bridge: bridge control structure
> + *
> + * DSI host drivers shall call this function while the clock and data la=
nes
> + * are still in LP-11 mode.
> + *
> + * This function shall be called in a context that can sleep.
> + */
> +void drm_bridge_dsi_lp11_notify(struct drm_bridge *bridge)
> +{
> +	if (bridge->funcs->dsi_lp11_notify)
> +		bridge->funcs->dsi_lp11_notify(bridge);
> +}
> +EXPORT_SYMBOL_GPL(drm_bridge_dsi_lp11_notify);
> +
>  #ifdef CONFIG_OF
>  /**
>   * of_drm_find_bridge - find the bridge corresponding to the device node=
 in
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 4baca0d9107b..4ef61274e0a8 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -630,6 +630,17 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*hpd_disable)(struct drm_bridge *bridge);
> =20
> +	/**
> +	 * dsi_lp11_notify:
> +	 *
> +	 * Will be called by the DSI host driver while both the DSI clock
> +	 * lane as well as the DSI data lanes are in LP-11 mode. Some bridges
> +	 * need this state while releasing the reset, for example.
> +	 * Not all DSI host drivers will support this. Therefore, the DSI
> +	 * bridge driver must not rely on this op to be called.
> +	 */
> +	void (*dsi_lp11_notify)(struct drm_bridge *bridge);
> +
>  	/**
>  	 * @debugfs_init:
>  	 *
> @@ -898,6 +909,7 @@ void drm_bridge_hpd_enable(struct drm_bridge *bridge,
>  void drm_bridge_hpd_disable(struct drm_bridge *bridge);
>  void drm_bridge_hpd_notify(struct drm_bridge *bridge,
>  			   enum drm_connector_status status);
> +void drm_bridge_dsi_lp11_notify(struct drm_bridge *bridge);
> =20
>  #ifdef CONFIG_DRM_PANEL_BRIDGE
>  bool drm_bridge_is_panel(const struct drm_bridge *bridge);
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



