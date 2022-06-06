Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67A6C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 19:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGvaMsrjAHmRqgYYMU1mJIAiXH4U3gGgfsI1F5XFxM4=; b=HKRPT9/Ww6JFXc
	kQt/403d3ZEECKiz3TzjbfnNV85toOnCiBYKqfi8SLkev7trMdCp8DhDz8VNGcRUSAnaoq9npiC+o
	p2rfrufIXq6pe4MD5xzY+BGHAdbIuzit9+93a3gWGDXKkGU+FXvAYX/QCVxQr9XRBi3IPrBmB+t4o
	ieyqGA1pWXeVjGtYWDOxv3Z/2fC2Xi98q4Nvwi4cikLCr0TRFGwQO8/2wCbqir2VfM6X0ehViXlR/
	mrBNVbR57NoMvXmQbHq9RXwZHscEwlgqR7R285QziGS5RvT9XanFVauwmRbIXyzmNNpD8VVWqhQ3t
	sjVIRF61Ka+o10PhiAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyILp-002RoP-Jl; Mon, 06 Jun 2022 19:25:21 +0000
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com ([46.30.210.183])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyILn-002RnM-1Z
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 19:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=6Cg1ugMW2sgR40fh9Scahx5XXbaDSIss/S9MBAp8xq8=;
	b=ETNremb0uLGQKMa9jdGQJ2mGNnyNkXO2sPf08r/Z0bnFUkACFuvUBKMu1U6HNCSky8IqzL9AxavKd
	 aoNnlzE6w67Kc8H5HUsEATZ50YDG1B0LFEy7qZCgP5xSdJbXT1TpeX5qI2okHWTEZptwbDhCdPm2H4
	 IgOhPgdmwcFXNTT0Gw//7ajYP+ppdFccxK/S7Ney+1dWDHWMDL3laztIiI295Z4mM+i+TsAJ0xGXPa
	 pClgkifJLS2q8tYRURntTr5T2lROayoQf/OUEqIcN/IZy+bGvKE8/CgYKgTrjyhFXHfORBjekidJMf
	 uFxsoG5ADMIyWwXWOXg++N4MGQ41qeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=6Cg1ugMW2sgR40fh9Scahx5XXbaDSIss/S9MBAp8xq8=;
	b=H4W1sEEIyckKy4ictTk9wQBkyCsvmPLwtpavm6fJMLh5D2dGa+zCB5sMBBKOPDG4Cwf4Ul/oZeZlX
	 sy8p4T8CQ==
X-HalOne-Cookie: d1498cb72ad0f58e22308cc44230f2d4a7b4d137
X-HalOne-ID: 62ba285a-e5ce-11ec-a911-d0431ea8a290
Received: from mailproxy4.cst.dirpod3-cph3.one.com (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 62ba285a-e5ce-11ec-a911-d0431ea8a290;
	Mon, 06 Jun 2022 19:25:13 +0000 (UTC)
Date: Mon, 6 Jun 2022 21:25:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	Rob Clark <robdclark@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/8] drm/panel: panel-simple: Implement
 .get_orientation callback
Message-ID: <Yp5Ul/ODUB/sQ0Jf@ravnborg.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-6-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606152431.1889185-6-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_122519_406436_DB43EBBA 
X-CRM114-Status: GOOD (  26.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

On Mon, Jun 06, 2022 at 11:24:28PM +0800, Hsin-Yi Wang wrote:
> To return the orientation property to drm/kms driver.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4a2e580a2f7b..f232b8cf4075 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -411,7 +411,12 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>  	/* add hard-coded panel modes */
>  	num += panel_simple_get_non_edid_modes(p, connector);
>  
> -	/* set up connector's "panel orientation" property */
> +	/*
> +	 * drm drivers are expected to call drm_panel_get_orientation() to get
> +	 * panel's orientation then drm_connector_set_panel_orientation() to
> +	 * set the property before drm_dev_register(). Otherwise there will be
> +	 * a WARN_ON if orientation is set after drm is registered.
> +	 */

This comment is not really relevant here. If we need to explain this
then put it in drm_panel.c/h - as this applies for all panels and not
just the panel_simple.
Keep in mind, this is the source new panels often use a inspiration and
no need to have this copied around.

>  	drm_connector_set_panel_orientation(connector, p->orientation);
>  
>  	return num;
> @@ -434,6 +439,14 @@ static int panel_simple_get_timings(struct drm_panel *panel,
>  	return p->desc->num_timings;
>  }
>  
> +static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
> +{
> +       struct panel_simple *p = to_panel_simple(panel);
> +
> +       return p->orientation;
> +}
> +
> +
>  static const struct drm_panel_funcs panel_simple_funcs = {
>  	.disable = panel_simple_disable,
>  	.unprepare = panel_simple_unprepare,
> @@ -441,6 +454,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
>  	.enable = panel_simple_enable,
>  	.get_modes = panel_simple_get_modes,
>  	.get_timings = panel_simple_get_timings,
> +	.get_orientation = panel_simple_get_orientation,

I like the order in this list to match the order in the .h file.
So my OCD would like you to move it up right after get_modes,
but feel free to ignore this.

With the suggested changes:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>  };
>  
>  static struct panel_desc panel_dpi;
> -- 
> 2.36.1.255.ge46751e96f-goog

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
