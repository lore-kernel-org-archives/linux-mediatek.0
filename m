Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D049C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 19:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YHCquK1xnZp7seOMVO/egUMHM3ClCinBe/Ah9VBljgY=; b=rdjU3KeLUm4Ko7
	jD3DxYHHsqCkPeVbiPqRy06od6UeWdqxuA3/JHx55weey4CQb0mdvRME7/XzVxlyQOPiGFZ4JsLQh
	qxRA70rWcvrjdQX7ijTAdoPdMTbgs7Zrgi0+lXRIFXcukmsax3XVTimG+08rQJn3+E9/dMspw9+RH
	wNCgP8HOjGfcem9Gl5IXdTAh8xCYpMCjSi/2asz6D9/Me6hFK3EvAT9OU7XcFl2jrVXAaGxGVJ4mn
	JklWwzGPSSAhAGhpvOcdT/cIa5qtHnLgp196Unqa+Zh8Zkcb2uYgZmjwVIaLFjOhOWlhL3NlwfWtz
	1ku9EvoW/KrfW4iix8kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIHb-002R6p-TZ; Mon, 06 Jun 2022 19:20:59 +0000
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com ([46.30.210.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIHY-002R4Z-8R
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 19:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=bsO7yZsq6WgHwa/T9Pr5gaYQAXZ8gtEznFx8SQx+qfc=;
	b=L1gfAqSV85PV28u4ZNw6sT2fasgTWDxl2bTVb3LAc/SPW4xmkuuNovf1Ap1YuVS0Bgwjr9nn8ZXsl
	 +f1tySHn5617WNbkacDt1JRWggSMyDDXhUxRrT5zTzZBN/OiWcAYt/hmbf7owIFJog8akkFSJunS3h
	 EZn1pS5EXxJr6LuuAcd3Aq44MjR/x/ELx5PaLTzALwQhuDgzYFF7IfAuUVjmysatFCknd+N0HnMLtT
	 ahDR5ANGsErMFpHH6L7n8zeh+SlqvcxKr5kHQM4GNbc77Lb4jcLaJF3oTA3TXFTAOL0Q4QsjQJuzB4
	 La20QzQQe+H1M92fN9X3Ms7A4E4BBJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=bsO7yZsq6WgHwa/T9Pr5gaYQAXZ8gtEznFx8SQx+qfc=;
	b=TC4IXbo7to2hzL84wxc32MVECmma+pMj8vVtBtEoAbkthCYrWvrAYbZC+msb1ku1sZNZIFVgC6QaA
	 FtLAj3GAQ==
X-HalOne-Cookie: a8c49c672b514c0c53227159aa925696221cf6c8
X-HalOne-ID: c3449a73-e5cd-11ec-a6bf-d0431ea8a283
Received: from mailproxy3.cst.dirpod4-cph3.one.com (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id c3449a73-e5cd-11ec-a6bf-d0431ea8a283;
	Mon, 06 Jun 2022 19:20:45 +0000 (UTC)
Date: Mon, 6 Jun 2022 21:20:43 +0200
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
Subject: Re: [PATCH v4 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
Message-ID: <Yp5Ti3ov/fnw0xeQ@ravnborg.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-2-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606152431.1889185-2-hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_122056_625227_62D2190A 
X-CRM114-Status: GOOD (  24.75  )
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
On Mon, Jun 06, 2022 at 11:24:24PM +0800, Hsin-Yi Wang wrote:
> Panels usually call drm_connector_set_panel_orientation(), which is
> later than drm/kms driver calling drm_dev_register(). This leads to a
> WARN().
> 
> The orientation property is known earlier. For example, some panels
> parse the property through device tree during probe.
> 
> Add an API to return the property from panel to drm/kms driver, so the
> drivers are able to call drm_connector_set_panel_orientation() before
> drm_dev_register().
> 
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> v3->v4: Add a blank line.
> ---
>  drivers/gpu/drm/drm_panel.c |  9 +++++++++
>  include/drm/drm_panel.h     | 10 ++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371c717a..e12056cfeca8 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -223,6 +223,15 @@ int drm_panel_get_modes(struct drm_panel *panel,
>  }
>  EXPORT_SYMBOL(drm_panel_get_modes);
>  
> +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)
const as mentioned by Stephen.

> +{
> +	if (panel && panel->funcs && panel->funcs->get_orientation)
> +		return panel->funcs->get_orientation(panel);
> +
> +	return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> +}
> +EXPORT_SYMBOL(drm_panel_get_orientation);
> +
>  #ifdef CONFIG_OF
>  /**
>   * of_drm_find_panel - look up a panel using a device tree node
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index d279ee455f01..5dadbf3b0370 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -133,6 +133,15 @@ struct drm_panel_funcs {
>  	 * Allows panels to create panels-specific debugfs files.
>  	 */
>  	void (*debugfs_init)(struct drm_panel *panel, struct dentry *root);
> +
> +	/**
> +	 * @get_orientation:
> +	 *
> +	 * Return the panel orientation set by device tree or EDID.
> +	 *
> +	 * This function is optional.
> +	 */
> +	enum drm_panel_orientation (*get_orientation)(struct drm_panel *panel);

Please move this up so it is together with the other get_* methods, in
alphabetic order. That is, right after get_modes(), and then this also
matches the order in the .c file with is extra bonus.

With the two fixes:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>  };
>  
>  /**
> @@ -202,6 +211,7 @@ int drm_panel_enable(struct drm_panel *panel);
>  int drm_panel_disable(struct drm_panel *panel);
>  
>  int drm_panel_get_modes(struct drm_panel *panel, struct drm_connector *connector);
> +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel);
>  
>  #if defined(CONFIG_OF) && defined(CONFIG_DRM_PANEL)
>  struct drm_panel *of_drm_find_panel(const struct device_node *np);
> -- 
> 2.36.1.255.ge46751e96f-goog

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
