Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71527C04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epdhZqgOKxSCYuj6ZDK3LgVWsQLpcgWt/VYdPWJM6sI=; b=4w4JZtgyMnwomvuS6xfAt5TJFT
	rbghaMljcv2nOPtqgJW9JEJ06mMacdxr+ZqCMJ6L5PmPKgUxAjVLAxsIfydlsPfQ9uW9H3GJKSzdg
	CC4MunMw5xxbx9giXPHa2XntT7yG0H/poppqz0b+Z/gwJ5FlCgMmI8aiS1fvRtspoXJpcBw9f5Df5
	qjj3cgbI5YlGl+QEneKEqYUIBg+eIg05v6Pe6itlmzaRZZOTP0bViIEOAelp18/r6X76MQqp52/C+
	aQ3+aIKKxWI0YoJ7AWm2DNGkQEvM+/1WANLoc8y5dWGaGZlkTHfq8TxnSraOtIxs9AxSCELnNW+Be
	qI3xpq1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7uvk-00000007XQm-3bQy;
	Fri, 17 May 2024 10:35:16 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7uvh-00000007XPN-2PCQ;
	Fri, 17 May 2024 10:35:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715942106;
	bh=so8083+XXFPwmPiUAe9pwH122x32KJYu7Z5cJlP4fbo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GVRaEZQ9H2SKdq0VVIXT+gcllkY2PMORQtl6/qHv2TFAibtwTeYtKcCtaAE5UAyj9
	 6s6TDJVI61Z90/TVpAXvnvNLu+tadovRA8ZwhD138f6ihFuuahHz1tKhtkyxPBgAVJ
	 96pv4IY/wLXLeJf1RX0oqR0Q+cUHz7fOq/wkgLUKiyXGfEnqrzPW2vAz22NXXt7iGt
	 3pkNH9jBHLuCk9vq5Hiv2ocXq47TpuOd7TTuLPg8ueM2Hvvxniq0StYYu36vOgGLwP
	 bdCEcajMl8KCEjk4dNmCoWOCmhqrHLwQSaBn1QM+3kF+j0Mt6RuFYHsvbGWaNwYQx0
	 8+8jzQIdyL9Dg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0D24F3782198;
	Fri, 17 May 2024 10:35:05 +0000 (UTC)
Message-ID: <de0191f3-271b-4f0e-aa73-910543587c9d@collabora.com>
Date: Fri, 17 May 2024 12:35:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek/dp: fix spurious kfree()
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240517093024.1702750-1-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240517093024.1702750-1-mwalle@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_033514_129307_22B41BB8 
X-CRM114-Status: GOOD (  18.51  )
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

Il 17/05/24 11:30, Michael Walle ha scritto:
> drm_edid_to_sad() might return an error or just zero. If that is the
> case, we must not free the SADs because there was no allocation in
> the first place.
> 
> Fixes: dab12fa8d2bd ("drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection")
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 536366956447..ada12927bbac 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2073,9 +2073,15 @@ static const struct drm_edid *mtk_dp_edid_read(struct drm_bridge *bridge,
>   		 */
>   		const struct edid *edid = drm_edid_raw(drm_edid);
>   		struct cea_sad *sads;
> +		int ret;
>   
> -		audio_caps->sad_count = drm_edid_to_sad(edid, &sads);
> -		kfree(sads);
> +		ret = drm_edid_to_sad(edid, &sads);
> +		/* Ignore any errors */
> +		if (ret < 0)
> +			ret = 0;
> +		if (ret)

Eh, this will never work, because you're clearing the error before checking
if there's any error here?!?! :-P


Anyway in reality, it returns -ENOMEM if the allocation was not successful...
in the event that any future update adds any other error we'd be back with the same
issue, but I'm not sure how much should we worry about that.

To be extremely safe, we could do...

if (ret != -ENOMEM)
	kfree(sads)

audio_caps->sad_count = ret < 0 ? 0 : ret;

Cheers!
Angelo

> +			kfree(sads);
> +		audio_caps->sad_count = ret;
>   
>   		/*
>   		 * FIXME: This should use connector->display_info.has_audio from



