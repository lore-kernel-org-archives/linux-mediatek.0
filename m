Return-Path: <SRS0=PXBb=2F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43FBC43603
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 12:36:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8670E206C3
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 12:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uSw+8pQa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8670E206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0/oi02+s+CZEq0H9nqvewZj5fq36dVKuvL/2uwTdGJ4=; b=uSw+8pQaIOkC3e
	hV88N1YgfWUWKLRgeydBPFz21yblObfAtpnw94F3d8RuoFnL+oYCX4XN4yzPlA07Tm3SNvMI6rFG3
	4i67dRqZACC9Ch+SDpHtzBrUqlIXDNlsg37Z8VyAcz1DWm+LxpxuhDOwlt7sVq9rWmz1ueQJXOMdz
	cFd61OxqBj8XNAaI9kSM3u2Nb5ksLNPMoQMNMEEuqS8o/qg+JHS0iRjVt2iL+VXifaiaCB6YGXdG4
	A+pvk+w60Hn74i1F2Ri+LKrhhPERe3a9lnnZbWPuA6pC0k56qvZLD5NohssKD7J8m8R025Ka1+Qti
	Qe/roxJSRAQiOcSbza+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igT84-0006Zo-DQ; Sun, 15 Dec 2019 12:36:08 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igT80-0006Z2-Td
 for linux-mediatek@lists.infradead.org; Sun, 15 Dec 2019 12:36:07 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 17A26804FC;
 Sun, 15 Dec 2019 13:35:52 +0100 (CET)
Date: Sun, 15 Dec 2019 13:35:51 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH] drm/panel: seperate panel power control from panel
 prepare/unprepare
Message-ID: <20191215123551.GA32327@ravnborg.org>
References: <20191106064005.8016-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191106064005.8016-1-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8
 a=UN12_I82iCspjviWGz0A:9 a=CjuIK1q_8ugA:10 a=6heAxKwa5pAsJatQ0mat:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_043605_331042_9D9E9962 
X-CRM114-Status: GOOD (  19.85  )
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
Cc: David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 sj.huang@mediatek.com, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jitao.

On Wed, Nov 06, 2019 at 02:40:05PM +0800, Jitao Shi wrote:
> Some dsi panels require the dsi lanes keeping low before panel power
> on. So seperate the panel power control and the communication with panel.
> 
> And put the power control in drm_panel_prepare_power and
> drm_panel_unprepare_power. Put the communication with panel in
> drm_panel_prepare and drm_panel_unprepare.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

Panels that requires power before communicating often/always have
some timing constraints. Power need to be applied in XYZ micro seconds
before it is safe to communicate with the panel.

To support this a typical pattern is:

panel_xxx_prepare()
{
   // power on the panel using one or a few regulators

   // wait until panel is known to be ready

   // Communicate with the panel

}

first driver I looked at (panel-feiyang-fy07024di26a30d.c) follows this
pattern.

So we have the timing spelled out in the enable() function
and the sequence is obvious.


What will the benefit be from a separate drm_panel_prepare_power()
function pointer?

	Sam


> ---
>  drivers/gpu/drm/drm_panel.c | 38 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_panel.h     | 17 +++++++++++++++++
>  2 files changed, 55 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 6b0bf42039cf..e57f6385d2cc 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -131,6 +131,24 @@ void drm_panel_detach(struct drm_panel *panel)
>  }
>  EXPORT_SYMBOL(drm_panel_detach);
>  
> +/**
> + * drm_panel_prepare_power - power on a panel's power
> + * @panel: DRM panel
> + *
> + * Calling this function will enable power and deassert any reset signals to
> + * the panel.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_prepare_power(struct drm_panel *panel)
> +{
> +	if (panel && panel->funcs && panel->funcs->prepare_power)
> +		return panel->funcs->prepare_power(panel);
> +
> +	return panel ? -ENOSYS : -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_panel_prepare_power);
> +
>  /**
>   * drm_panel_prepare - power on a panel
>   * @panel: DRM panel
> @@ -170,6 +188,26 @@ int drm_panel_unprepare(struct drm_panel *panel)
>  }
>  EXPORT_SYMBOL(drm_panel_unprepare);
>  
> +/**
> + * drm_panel_unprepare_power - power off a panel
> + * @panel: DRM panel
> + *
> + * Calling this function will completely power off a panel (assert the panel's
> + * reset, turn off power supplies, ...). After this function has completed, it
> + * is usually no longer possible to communicate with the panel until another
> + * call to drm_panel_prepare_power and drm_panel_prepare().
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int drm_panel_unprepare_power(struct drm_panel *panel)
> +{
> +	if (panel && panel->funcs && panel->funcs->unprepare_power)
> +		return panel->funcs->unprepare_power(panel);
> +
> +	return panel ? -ENOSYS : -EINVAL;
> +}
> +EXPORT_SYMBOL(drm_panel_unprepare_power);
> +
>  /**
>   * drm_panel_enable - enable a panel
>   * @panel: DRM panel
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 624bd15ecfab..0d8c4855405c 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -61,6 +61,13 @@ struct display_timing;
>   * the panel. This is the job of the .unprepare() function.
>   */
>  struct drm_panel_funcs {
> +	/**
> +	 * @prepare_power:
> +	 *
> +	 * Turn on panel power.
> +	 */
> +	int (*prepare_power)(struct drm_panel *panel);
> +
>  	/**
>  	 * @prepare:
>  	 *
> @@ -89,6 +96,13 @@ struct drm_panel_funcs {
>  	 */
>  	int (*unprepare)(struct drm_panel *panel);
>  
> +	/**
> +	 * @unprepare_power:
> +	 *
> +	 * Turn off panel_power.
> +	 */
> +	int (*unprepare_power)(struct drm_panel *panel);
> +
>  	/**
>  	 * @get_modes:
>  	 *
> @@ -155,6 +169,9 @@ void drm_panel_remove(struct drm_panel *panel);
>  int drm_panel_attach(struct drm_panel *panel, struct drm_connector *connector);
>  void drm_panel_detach(struct drm_panel *panel);
>  
> +int drm_panel_prepare_power(struct drm_panel *panel);
> +int drm_panel_unprepare_power(struct drm_panel *panel);
> +
>  int drm_panel_prepare(struct drm_panel *panel);
>  int drm_panel_unprepare(struct drm_panel *panel);
>  
> -- 
> 2.21.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
