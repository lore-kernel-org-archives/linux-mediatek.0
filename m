Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EE2C35FE7
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Sep 2024 10:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfJHt9roWykgi6iCo8OJXtKub6FZQX7k2pQODR1XVPY=; b=3XVFRWQvaz0TiaVVAGb7vDWgGj
	eONe8PX4n++iFB2gqzvXMsXRxcNivnBRlot4AjPVctGnPscIx5UjqJxSsA+C/UF+URiuBjuOaxIG7
	lJp3jRmD094eYasU89gHkdDbbnKXquH8lDNsZ8Ldo5HhypGs2yP6amAxybD8qyNlQZbQvb/qeg9Tq
	PFq0nryICEDl8tJIVgcQlIuh4LbsbrVoy4iZnCuTWi+xTRw9dFV2gzOcb0g1Y9hcad7MJntaxZWPG
	xwua6pClCTp3cS4Yattn6Jdu1zSHecELdV3Rj9FiZLhsWok/qPd1vqWuYQ1V+Fy3thptp1MPkBSGe
	qX3g76jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spmuM-00000001ztS-0YLQ;
	Sun, 15 Sep 2024 10:55:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spmuH-00000001zsk-1Zh1;
	Sun, 15 Sep 2024 10:55:08 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42cb806623eso30402695e9.2;
        Sun, 15 Sep 2024 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726397703; x=1727002503; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KfJHt9roWykgi6iCo8OJXtKub6FZQX7k2pQODR1XVPY=;
        b=MGImPaYiYho6bRTc/lp3ySP9cM+Ndf5zmsGaW4RIJoNpkUskbphZPw4PWX7h+Nl55x
         yNqUO0h+C1tJ0TQo+5QawhjTh+Dz0SWSMqppiOLULrlpRyPb0+DXZBgT5k2+GWxQ2Aj2
         IejCft7lf6gQWv4CEwGHgRaPcs63gC/akwiBNMatvH+16jBU7YHoPTvEuJzNqD+YNsfB
         nSD3vYjqiztxquJGz+ta2I+Htei/uwmls1TvFL8tBJZNK1j4780MDdoCCUl9Qqih8jlV
         iCR6GNWoJCx2ce3NeHjbsn6lmamDJHo0YnhcX64THpMcKNxjuGjlir0oIopWjn/UR5RZ
         8r6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726397703; x=1727002503;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KfJHt9roWykgi6iCo8OJXtKub6FZQX7k2pQODR1XVPY=;
        b=dobwAwL4a3ZZePK3Km3m/2f4u7Iu3QZV1pmZa7QxIfzYB8MfAwW/Nik/TBoJJ4q6yo
         0hQr84bDcpJYgzEiqpaIVQ9SW20FwXqAwO0BlWXrhubw3+qqqXZbeL8590olkIKUp/Or
         Ej+XvU1THYiqiiFtMJYUppXIBNuURgQTkC+M7NywH8H7+p4RoeN5x4uzOUbJQTrZdXI0
         ppgbv4Tad5lRUwF/oPaUXBtgH4CaINBFz2JEPJHuWF+QWz4oWy407UAuL9FETPK3yyQf
         YB9BzCN7yGdy6f8RdJrY9e55BDhEjFKUKjTSWIcQ2hZs5VvqMa4mOOeXGXuzHaW07Spx
         uF0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrc8ySMW+A7VD6GeMyObwXD8vIpcmVqshCQ0TYJ5JxHPvfPCE8c60/Iele4rfFPYQjFnp4joMhK7IxCish8at5@lists.infradead.org, AJvYcCX58TQE2c2GxP8p5eKpGaWCIDo3iGwMMstQj75lmSw/eNvCLH9yYVTTisits9TP2l7lSEsRomC171DGL9GnQwM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf5pgn8uHiMy1QBlGo0BN9boBcRVErAb0OCafsbienKtmxsjX3
	JBz2Ko5YbsSnL/BxKBeAvTrL1ijhwCnygdPMvjBodVxiipXAmzwI
X-Google-Smtp-Source: AGHT+IE7YoEPsvKgdohHfPyJvwpQ7Im0rUIBUpBdVjvxGocvco6SAce7YBX2SYunJXDZO0VL5oYdrg==
X-Received: by 2002:a5d:5e12:0:b0:378:c2f3:defd with SMTP id ffacd0b85a97d-378c2f3e021mr6334242f8f.13.1726397702891;
        Sun, 15 Sep 2024 03:55:02 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b87a9sm46384925e9.6.2024.09.15.03.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Sep 2024 03:55:02 -0700 (PDT)
Message-ID: <c8f8d556-77bf-4b60-abd9-bfcf7ac40ac5@gmail.com>
Date: Sun, 15 Sep 2024 13:54:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: ovl: Add fmt_support_man for MT8192 and
 MT8195
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240914201819.3357-1-jason-jh.lin@mediatek.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <20240914201819.3357-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_035505_469572_9071B06B 
X-CRM114-Status: GOOD (  17.21  )
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

Hi,

On 2024-09-14 23:18 +03:00, Jason-JH.Lin wrote:
> OVL_CON_CLRFMT_MAN is an configuration for extending color format
> settings of DISP_REG_OVL_CON(n).
> It will change some of the original color format settings.
> 
> Take the settings of (3 << 12) for example.
> - If OVL_CON_CLRFMT_MAN = 0 means OVL_CON_CLRFMT_RGBA8888.
> - If OVL_CON_CLRFMT_MAN = 1 means OVL_CON_CLRFMT_PARGB8888.
> 
> Since OVL_CON_CLRFMT_MAN is not supported on previous SoCs,
> It breaks the OVL color format setting of MT8173.
> So add fmt_support_man to the driver data of MT8192 and MT8195
> to solve the downgrade problem.
> 
> Fixes: a3f7f7ef4bfe ("drm/mediatek: Support "Pre-multiplied" blending in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 28 ++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 89b439dcf3a6..aa575569f996 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -70,10 +70,18 @@
>  #define OVL_CON_CLRFMT_UYVY	(4 << 12)
>  #define OVL_CON_CLRFMT_YUYV	(5 << 12)
>  #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
> -#define OVL_CON_CLRFMT_PARGB8888 ((3 << 12) | OVL_CON_CLRFMT_MAN)
> -#define OVL_CON_CLRFMT_PABGR8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_RGB_SWAP)
> -#define OVL_CON_CLRFMT_PBGRA8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_BYTE_SWAP)
> -#define OVL_CON_CLRFMT_PRGBA8888 (OVL_CON_CLRFMT_PABGR8888 | OVL_CON_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_PARGB8888(ovl)	((ovl)->data->fmt_support_man ? \
> +					((3 << 12) | OVL_CON_CLRFMT_MAN) : \
> +					OVL_CON_CLRFMT_ABGR8888)

Should be OVL_CON_CLRFMT_ARGB8888 (*RGB* vs *BGR*)?

Otherwise I still see broken colors, but in blue instead of red.

> +#define OVL_CON_CLRFMT_PABGR8888(ovl)	((ovl)->data->fmt_support_man ? \
> +					(OVL_CON_CLRFMT_PARGB8888 | OVL_CON_RGB_SWAP) : \

Compile error, likely (OVL_CON_CLRFMT_PARGB8888(ovl) | ...)?

> +					OVL_CON_CLRFMT_ABGR8888)
> +#define OVL_CON_CLRFMT_PBGRA8888(ovl)	((ovl)->data->fmt_support_man ? \
> +					(OVL_CON_CLRFMT_PARGB8888 | OVL_CON_BYTE_SWAP) : \

Same as above, OVL_CON_CLRFMT_PARGB8888(ovl)

> +					OVL_CON_CLRFMT_BGRA8888)
> +#define OVL_CON_CLRFMT_PRGBA8888(ovl)	((ovl)->data->fmt_support_man ? \
> +					(OVL_CON_CLRFMT_PABGR8888 | OVL_CON_BYTE_SWAP) : \

Same as above, OVL_CON_CLRFMT_PABGR8888(ovl)

> +					OVL_CON_CLRFMT_RGBA8888)
>  #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
>  					0 : OVL_CON_CLRFMT_RGB)
>  #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \

With those changes, colors are fine on my MT8173, MT8183, MT8186 
Chromebooks.

