Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F7AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 14:16:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59E8F613A1
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 14:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59E8F613A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1ltrE+TdAuUV8ClGN89licJ52F2nNzRzF19Bgs9hgE=; b=2/XkVjcNDlI2ap
	6k/ngMMVG7o0FjXVAqcns2YThWOjMAkGeIYI5Im6JAW8031sKzUc1BKRHysGo6Ay5A96lEgpn34ez
	wrWrLni65deAJnMkSSGhgbLO2YGtN1Xi/SUym2dfDTPu5DP2Miqp22NVkYxajMPCYo0q7vb0NDdrx
	D62+mIGzIfTQ+HevLNIKAdSudz4GUE977OOwXVMdhLXXPeJy5B/fbujhpSJN03haRi43qt5EheTzj
	I8gzqE8zbjxgWUetAdKqHWlCoAqi77h1OQX0a6Ru+sdWc5btdrL7Y/mivkF+2i3t5tf6eoz54ItOG
	rviA8+58P982a3kFKp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdvLV-00BFSw-Qi; Fri, 22 Oct 2021 14:16:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdvL9-00BFJn-4S; Fri, 22 Oct 2021 14:16:12 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0C1551D;
 Fri, 22 Oct 2021 16:16:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634912168;
 bh=Aeh70f2r0wQV/wb1x02cOw9hnDeyXSaLBnVvry1mwe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rzBB0LaMFaMCZ2/dRF1HPjKReXJ7F978Gl8b3WnKVG4RBRlozPil9ZZwqX8as3T1K
 IVgOgyAYDmi5y6xxhfxVMDJ7m8jQ0VqISSbeEfU8H3Jq0cg9u1e6HJj4gB9EJ+3kct
 9jmtrc0DbMiOgdCITq76tJvu4SoaAWkaNpLnJOYw=
Date: Fri, 22 Oct 2021 17:15:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 1/7] drm/bridge: ps8640: Use atomic variants of
 drm_bridge_funcs
Message-ID: <YXLHlaLfPD4wI7R7@pendragon.ideasonboard.com>
References: <20211020181901.2114645-1-sam@ravnborg.org>
 <20211020181901.2114645-2-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020181901.2114645-2-sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_071611_444358_28E62D77 
X-CRM114-Status: GOOD (  20.84  )
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

Hi Sam,

Thank you for the patch.

On Wed, Oct 20, 2021 at 08:18:55PM +0200, Sam Ravnborg wrote:
> The atomic variants of enable/disable in drm_bridge_funcs are the
> preferred operations - introduce these.
> 
> The ps8640 driver used the non-atomic variants of the drm_bridge_chain_pre_enable/
> drm_bridge_chain_post_disable - convert these to the atomic variants.
> 
> v2:
>   - Added a few more people to cc: (Jitao, Enric, Philip) to increase
>     possibility to get test feedback
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Maxime Ripard <maxime@cerno.tech>
> Cc: Jitao Shi <jitao.shi@mediatek.com>
> Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Cc: Philip Chen <philipchen@chromium.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/parade-ps8640.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 3aaa90913bf8..0b620afe99c0 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -376,7 +376,8 @@ static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
>  	ps_bridge->powered = false;
>  }
>  
> -static void ps8640_pre_enable(struct drm_bridge *bridge)
> +static void ps8640_atomic_pre_enable(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  	int ret;
> @@ -388,7 +389,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>  		ps8640_bridge_poweroff(ps_bridge);
>  }
>  
> -static void ps8640_post_disable(struct drm_bridge *bridge)
> +static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *old_bridge_state)
>  {
>  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>  
> @@ -489,7 +491,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>  	 * EDID, for this chip, we need to do a full poweron, otherwise it will
>  	 * fail.
>  	 */
> -	drm_bridge_chain_pre_enable(bridge);
> +	drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
>  
>  	edid = drm_get_edid(connector,
>  			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
> @@ -499,7 +501,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>  	 * before, return the chip to its original power state.
>  	 */
>  	if (poweroff)
> -		drm_bridge_chain_post_disable(bridge);
> +		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
>  
>  	return edid;
>  }
> @@ -508,8 +510,8 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
>  	.attach = ps8640_bridge_attach,
>  	.detach = ps8640_bridge_detach,
>  	.get_edid = ps8640_bridge_get_edid,
> -	.post_disable = ps8640_post_disable,
> -	.pre_enable = ps8640_pre_enable,
> +	.atomic_post_disable = ps8640_atomic_post_disable,
> +	.atomic_pre_enable = ps8640_atomic_pre_enable,

Don't you also need to implement .atomic_duplicate_state(),
.atomic_destroy_state() and .atomic_reset() to use the atomic API ?

>  };
>  
>  static int ps8640_probe(struct i2c_client *client)

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
