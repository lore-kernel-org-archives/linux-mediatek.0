Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2644FC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 01:46:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51F366198F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 01:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51F366198F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p/lCxUzcn6dAbGPDB/vRbQjWB4DmYzCTZU/upx9UJpw=; b=S958wNLMtzDvb5B7JqVk5Pjg8
	896+DvgYhkXQjfjIFiQRHKWK0MReEO6vdoYv+n7I8NOOvXTsYeTj/YkDS5yM2+m2VVj+7oybHqayP
	x90+yEtmnbEzXXepwQ0eWGMW2i0l1AGEDi+N3K3mveUkEpDdahePoIpgUDoNt9y61z0GrbYbHAPFi
	LXgSXUos/EyE7+JSAzEc2v2wFKAwyM6VD436aN6NkhmxD6ao8K9csOb5krZEpDMLzb+8iFrMe0HSe
	ULNbRGZkKJdF22O5svkd8mA/cKIa4Ms3+ryD203aOgSPLhVekrivQiTll+zq46qmFVOOXHDlDpgmF
	C9+8XYHbg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR3SV-002N0q-Ds; Tue, 30 Mar 2021 01:46:19 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR1qp-0026DC-FU
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 00:03:22 +0000
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2B03102;
 Tue, 30 Mar 2021 02:03:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617062585;
 bh=z08DZ+zSaLkhCxLYzk2DbSu2wZCH3gpsOvQtJqa4s8c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I7jDfa1MyAI8vHprTjDaLv0F2CW7Ew2AwAn8x8RYuQmM2Zk9dI87gr5Aj3oqBwXxZ
 5FdT9LJE0XpTaoSm6Ww6EyL6bqiSlW0uJoC7d/jtmXhDHGA/LVpZMF/EnGJF+4qtnj
 2lrV+B8/IVPTk0EJ1jDpfYWf/I0z4ZMwdBECJw5I=
Date: Tue, 30 Mar 2021 03:02:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 dafna3@gmail.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, enric.balletbo@collabora.com
Subject: Re: [PATCH v2 1/3] drm/mediatek: Switch the hdmi bridge ops to the
 atomic versions
Message-ID: <YGJqjPp2COsP18As@pendragon.ideasonboard.com>
References: <20210329153632.17559-1-dafna.hirschfeld@collabora.com>
 <20210329153632.17559-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210329153632.17559-2-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_010320_430266_BF2BFD6A 
X-CRM114-Status: GOOD (  16.96  )
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

Hi Dafna,

Thank you for the patch.

On Mon, Mar 29, 2021 at 05:36:30PM +0200, Dafna Hirschfeld wrote:
> The bridge operation '.enable' and the audio cb '.get_eld'
> access hdmi->conn. In the future we will want to support
> the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR and then we will
> not have direct access to the connector.
> The atomic version '.atomic_enable' allows accessing the
> current connector from the state.
> This patch switches the bridge to the atomic version to
> prepare access to the connector in later patches.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 8ee55f9e2954..f2c810b767ef 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1357,7 +1357,8 @@ static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
>  	return true;
>  }
>  
> -static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
> +static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_bridge_state)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>  
> @@ -1371,7 +1372,8 @@ static void mtk_hdmi_bridge_disable(struct drm_bridge *bridge)
>  	hdmi->enabled = false;
>  }
>  
> -static void mtk_hdmi_bridge_post_disable(struct drm_bridge *bridge)
> +static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> +						struct drm_bridge_state *old_state)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>  
> @@ -1406,7 +1408,8 @@ static void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
>  	drm_mode_copy(&hdmi->mode, adjusted_mode);
>  }
>  
> -static void mtk_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
> +static void mtk_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
> +					      struct drm_bridge_state *old_state)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>  
> @@ -1426,7 +1429,8 @@ static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
>  		mtk_hdmi_setup_vendor_specific_infoframe(hdmi, mode);
>  }
>  
> -static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
> +static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *old_state)
>  {
>  	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>  
> @@ -1440,13 +1444,16 @@ static void mtk_hdmi_bridge_enable(struct drm_bridge *bridge)
>  }
>  
>  static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.attach = mtk_hdmi_bridge_attach,
>  	.mode_fixup = mtk_hdmi_bridge_mode_fixup,
> -	.disable = mtk_hdmi_bridge_disable,
> -	.post_disable = mtk_hdmi_bridge_post_disable,
> +	.atomic_disable = mtk_hdmi_bridge_atomic_disable,
> +	.atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
>  	.mode_set = mtk_hdmi_bridge_mode_set,
> -	.pre_enable = mtk_hdmi_bridge_pre_enable,
> -	.enable = mtk_hdmi_bridge_enable,
> +	.atomic_pre_enable = mtk_hdmi_bridge_atomic_pre_enable,
> +	.atomic_enable = mtk_hdmi_bridge_atomic_enable,
>  };
>  
>  static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
