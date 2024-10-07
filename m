Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50A8CFB440
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 09:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGBN/ORfttaSm1/TRTkKvxpZOnc3bC2XZdTJ/5Ebo1U=; b=fzAn0R8FZQL9tzfjiHJklUhoQL
	nZAfT2pDPMoA/qzScBfJxTSKbUQi+xbM8goUdGCUCw7JUHaQPjzgXMfCLz61KPyfVpYLXtJp/+noF
	beBchFOnnJeLh+hVP1cBvWyjWDE88qdhMo66iW9ffYsFSRiaweGCVHr83CJK/M6oDLXcoMtoES+GH
	4aoU3ut02USXQMIdLN9o3sQtL/38hZiTx7PNWZP6N7GJaSsDFAXJx9J998ArDSW8ViEd2JhAvmOV0
	gpb3sRZpYLHbw6I+ZnlsSPxSAO2LMcRL+KnvIy91DekUXt/MUY5XZwwI4JLAYxx0Tiz93HHaucCic
	E83TRAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxkBq-00000001wEc-3JY1;
	Mon, 07 Oct 2024 09:38:06 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxkAQ-00000001w0f-16kr;
	Mon, 07 Oct 2024 09:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728293796;
	bh=pWjov5Fcb9t1OXwN3B6DkMW278o+8JHNmlMCNyJ1DB4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jgMLBtwTMgZCwf39YRE5Y2Qx59/Mxvnny0ZqiUtOfMbub5R6Ry+Bv4I4eTRfIYVVP
	 2FjxMZIB2yC4WoaUP68qPFWX2SFY2/YW5dbECRS7ug++I7K1Q9DvEM84LKI8jSlaJD
	 rshdeJml2fRMw5UX9Q3G9wD+sPdo0iYb3RfMB486x4sdkWllhnHWGNBsbXJK9pmcEQ
	 b7YWduc5ly+k87bfXpUotE0j76ndQWHbI8K2tpTdxt8sdYRum4UN+6qktjueEa0htL
	 Nl6ycsTQGz0qX+tC6qfAvZ5Iy3Ylkf1vBwnYKKmEuuXd4x9c5zbH2X/z0VaMgWbpkv
	 rbNENBqkwbW3g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1B5FC17E1166;
	Mon,  7 Oct 2024 11:36:36 +0200 (CEST)
Message-ID: <703213a8-1ac6-4c8d-9487-ea1dbdabec40@collabora.com>
Date: Mon, 7 Oct 2024 11:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] drm/mediatek: ovl: Fix XRGB format breakage for
 blend_modes unsupported SoCs
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Adam Thiede <me@adamthiede.com>, Yassine Oudjana
 <yassine.oudjana@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Shawn Sung <shawn.sung@mediatek.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20241007070101.23263-1-jason-jh.lin@mediatek.com>
 <20241007070101.23263-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241007070101.23263-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_023638_488724_06578D2C 
X-CRM114-Status: GOOD (  18.92  )
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

Il 07/10/24 09:00, Jason-JH.Lin ha scritto:
> If the constant alpha always enable, the SoCs that is not supported the
> ignore pixel alpha bit will still use constant alpha. That will break
> the original constant alpha setting of XRGB foramt for blend_modes
> unsupported SoCs, such as MT8173.
> 
> Note that ignore pixel alpha bit is suppored if the SoC support the
> blend_modes.
> Make the constatnt alpha only enable when having a vliad blend_mode or
> setting the has_alpha to fix the downgrade issue.
> 
> Fixes: bc46eb5d5d77 ("drm/mediatek: Support DRM plane alpha in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 89b439dcf3a6..8453a72f9e59 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -473,8 +473,14 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
>   
>   	con = ovl_fmt_convert(ovl, fmt, blend_mode);
>   	if (state->base.fb) {
> -		con |= OVL_CON_AEN;
>   		con |= state->base.alpha & OVL_CON_ALPHA;
> +
> +		/*
> +		 * For blend_modes supported SoCs, always enable constant alpha.
> +		 * For blend_modes unsupported SoCs, enable constant alpha when has_alpha is set.
> +		 */
> +		if (blend_mode || state->base.fb->format->has_alpha)
> +			con |= OVL_CON_AEN;

I'd say that you should make sure that OVL_CON_AEN is not set when
!blend_mode && !has_alpha, and you can do that like this:

		if (blend_mode || state->base.fb->format->has_alpha)
			con |= OVL_CON_AEN;
		else
			con &= ~OVL_CON_AEN;

After applying the proposed change,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


