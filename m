Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F72CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZwxABOibllqEMrJOxonBLvrqppkjvGSsU7jrQraVf0=; b=d/YljKOIbhLAX1bSfQ0akpAwX4
	KfPfHbqci3gdXBcA6am6CsLOJQEgzl/gyN2e2V7MmlSGDfWzKvN5rhLkdGuk6XnHgb91ui4Qtw0WP
	tM7d953OOQasC69cCbrlo6vrNalaEGkkz3BUMkBRM8YnorcNxcbiEZVw2L/c1Dc3VTLbIwCezWTzQ
	V9ucljqxEYwrjJrUqvYy8exwx/xjjgzKdDmeSxIpmWJ/TSZAAfGGkn7+7bHmMp0qjhSkEWwQbDPP7
	PK5XhKePp9H68YIjKL2PZxVexAQHXu9pqTfbJy9sWzG8iVjusCdEBteJTOnWuRdGsW+30wYH5B96C
	6NgcG33A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwiZ5-0090gG-SQ; Mon, 13 Dec 2021 10:28:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwiAR-008qPy-D3; Mon, 13 Dec 2021 10:02:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E58D81F422D4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639389763; bh=gbwMY8tv7htkSgQhxyiYITlrUTUsJaPP690NeQU6YUQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EU11AE4wrTQEE+5LfvBgVxBkiE++ZIemMYyUK2B+hSS6eJlY/R0cwCg4KczXtV85K
 vVohGdjYANIWOHL6bzUmMFYYOCUsABOL4FQNdnB5XZsiujMneDka+KmSgY+XqyTswi
 Q4GAwtC//aDpKYEFXBJz1zJ90R8FOGD4ojbWqXyr5Fpx7EIU1jTi/aspJE4E5k//Vv
 Y0TKL11uPblz25B1JNQBmqSnvnrrHktxrcMj3PvgwCA1xcFREg+olOOnr3IIebmBlu
 /KdbveU3l7mNYSfN4Dh9IeWggwcAj9cFhS5A5DT/+GgdxI4CHdNgnxy28q1GzzkkGb
 se5mtDkliq2Bg==
Subject: Re: [PATCH] drm/mediatek: hdmi: Perform NULL pointer check for
 mtk_hdmi_conf
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, dafna.hirschfeld@collabora.com,
 kernel@collabora.com
References: <20211028074311.57842-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <000ba19e-0220-f5c3-0efd-abb8338bb8f2@collabora.com>
Date: Mon, 13 Dec 2021 11:02:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028074311.57842-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_020247_667101_E06E5486 
X-CRM114-Status: GOOD (  20.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/10/21 09:43, AngeloGioacchino Del Regno ha scritto:
> In commit 41ca9caaae0b ("drm/mediatek: hdmi: Add check for CEA modes only")
> a check for CEA modes was added to function mtk_hdmi_bridge_mode_valid()
> in order to address possible issues on MT8167; moreover, with commit
> c91026a938c2 ("drm/mediatek: hdmi: Add optional limit on maximal HDMI mode clock")
> another similar check was introduced.
> 
> Unfortunately though, at the time of writing, MT8173 does not provide
> any mtk_hdmi_conf structure and this is crashing the kernel with NULL
> pointer upon entering mtk_hdmi_bridge_mode_valid(), which happens as
> soon as a HDMI cable gets plugged in.
> 
> To fix this regression, add a NULL pointer check for hdmi->conf in the
> said function, restoring HDMI functionality and avoiding NULL pointer
> kernel panics.
> 
> Fixes: 41ca9caaae0b ("drm/mediatek: hdmi: Add check for CEA modes only")
> Fixes: c91026a938c2 ("drm/mediatek: hdmi: Add optional limit on maximal HDMI mode clock")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_hdmi.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 5838c44cbf6f..3196189429bc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1224,12 +1224,14 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>   			return MODE_BAD;
>   	}
>   
> -	if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
> -		return MODE_BAD;
> +	if (hdmi->conf) {
> +		if (hdmi->conf->cea_modes_only && !drm_match_cea_mode(mode))
> +			return MODE_BAD;
>   
> -	if (hdmi->conf->max_mode_clock &&
> -	    mode->clock > hdmi->conf->max_mode_clock)
> -		return MODE_CLOCK_HIGH;
> +		if (hdmi->conf->max_mode_clock &&
> +		    mode->clock > hdmi->conf->max_mode_clock)
> +			return MODE_CLOCK_HIGH;
> +	}
>   
>   	if (mode->clock < 27000)
>   		return MODE_CLOCK_LOW;
> 

Hello, friendly ping!

Can I please get a review (or merge) of this commit?

This is an important fix for a null pointer KP and restores HDMI functionality.

Thanks,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
