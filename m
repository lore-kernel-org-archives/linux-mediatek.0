Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DC1E77188
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 13:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqZewggKXh0wm9IbjtQFexabLRuUSMGH6a4/lzMIbGw=; b=KSh3AsueUBHYyy+EC0MPplWF25
	oiyMQTAJ83e2nXTM1t1Y+uVSvUp/pnfy+MMEL3NzKvTm6drp7zjBnlRxlS2j6f2a0PWYExlzWElcv
	WibKAT1davw8X91g4Ti8jXI4LBIAnM04jBDFN8lZATbhRb9/e+zMvaI2th7D8SuGSgZ/3pFCuhDBf
	7uvPUB+ItG8oCHGIgINHdl3KTuLnr0qVJNC2bTOAN6k2CWDAgVPFfhCPhIAiYwTngL7JacFQlaV+y
	d+YShZkNHN9x4mezdjy65qFSzKWZLRbYjxON6NWZa+y/YXaLoM+M5B2ifRJO7/rEcA+gisQLONhSX
	d+doczig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVW3B-00000008bZo-3RiU;
	Wed, 08 Jan 2025 13:24:45 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVsg-00000008ZD3-2kf5
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 13:13:55 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-53f22fd6887so15346293e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jan 2025 05:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736342032; x=1736946832; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YqZewggKXh0wm9IbjtQFexabLRuUSMGH6a4/lzMIbGw=;
        b=luPIJNq4hiS9/MMj3YKPv4yu19WRfzT0PaYtvf/S4fOSaw58/mGwywzkr9KsLDzaSS
         4QLpFwWQ0qZEueH4I/dxp/lqJn+YXG5NNHbzRlnSndBCSzfa6iOfExg6kuqfdapxmGjp
         gVX9rHFDRURF8aGQB1rVNW1VqNvXEg9MWo+n8NH7iw0WjuYSM7+ap0WN/LPioZImLure
         i2FcgTs7xZlxxTBN715Ip+LBQxFYlYLNqgqoZUdwswMMwDexOVirl2fBZhIdIF8yzotZ
         /bQGEIHcB4RvrkEB5phjWJ8taD5EGZL4W75XgUUVHPbN8gM/p4umgzmbmA+cY/pDNYDk
         csdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736342032; x=1736946832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqZewggKXh0wm9IbjtQFexabLRuUSMGH6a4/lzMIbGw=;
        b=VK1W3Jqwie1VlL54eduLvy7MAwUhFcGovas2f2ces9Ve1XPZJa6VPYaVJRAuFOhjXL
         wrIRZ4M/wX0mvEuxBOY/O6ziR7h0LXsEidp9JRXPvSf68MxxfHrmhnCQzhvP6cOy7UBf
         nMBKInOKTI3ZBy8T62FLP1ufNDaweL+wjanGBxPzTe/UTUzuyahgsx27HpzPdCC/tkFY
         /EudQLx6s7cIk8AXqG8pvyn9+zp3mfMNHuxerwLws8e8+Pselka2hHv/ZuEGd2EFLCRT
         Jt7oduFZOG5ZwvbukSDYA/8gYQtoSIrUxbgAdvZxMopJk9ijhzEAOiWLHYvBo89D0D3O
         j1cA==
X-Forwarded-Encrypted: i=1; AJvYcCVXBXYi60muOG7Tq3+muYSvgZenku05xhD0XZ5/TG631/xktSp23u5AzR89ILTinfDwXbI0e8Zeag/SmCcJrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpGr+0aucTmsk9aYF/bgujodG6UBHYjRPhpV74oJRJrK1H0RLD
	0GUQqdgfQbEClRM2AuEuaWNe8XXqidVt8qPP3HtMkB5yFdlzsKoeYIugEtRZhFo=
X-Gm-Gg: ASbGncsHjxlpb5Cq8fQPJ3BlO/eYtj9Wu62mgaoNXweY8MxPuofO4RsR7cGN0kW76R0
	PaF/CH7qPSbpRfcfyvi0XhZ0NrHpWDdCVnDUH8eZsuHps89J5eaH6uxKLjp9q9Cl4nYAWl9atF6
	0JliQoPpXJk3p+jtpn94AwGGtOur1A/sr6+XB8vmoHCeP/Iuc6dcStxm0jB/Oeo4zOAyANC9lUH
	y8n9QxmR0CfWXyJh9/fA1FPCUHVcv76b2M7s6JE65n4iLK2+Qbwg1Iv8s2Ak7Y1WoH9XMFH1DDn
	fVezATpaCFb2ztnQHSDV6WobHBc3tHmcQ6sc
X-Google-Smtp-Source: AGHT+IEkuQPiOLgGXs8zWdEMj0wAqNSMaSTV6vSQ/tkCnop+NG9gWvZpeLRpiajpdeM8K2LlU6tzqA==
X-Received: by 2002:a05:6512:3c8a:b0:542:28dc:b692 with SMTP id 2adb3069b0e04-542845b9480mr694480e87.14.1736342032480;
        Wed, 08 Jan 2025 05:13:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54269fd89e8sm1549488e87.91.2025.01.08.05.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:13:52 -0800 (PST)
Date: Wed, 8 Jan 2025 15:13:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com, 
	junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, lewis.liao@mediatek.com, 
	ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, jason-jh.lin@mediatek.com
Subject: Re: [PATCH v4 33/34] drm/mediatek: mtk_hdmi_common: Add var to
 enable interlaced modes
Message-ID: <bovw662duw6ufmjleicb4kuhyn3an6emo53mgg3477dfuarapq@zcmekc7zzeub>
References: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
 <20250108112744.64686-34-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108112744.64686-34-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_051354_699451_1B956324 
X-CRM114-Status: GOOD (  18.12  )
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

On Wed, Jan 08, 2025 at 12:27:43PM +0100, AngeloGioacchino Del Regno wrote:
> Add an interlace_allowed bool member to struct mtk_hdmi_ver_conf
> which will be used to signal whether interlaced modes are supported
> by the bridge (in our case, the HDMI IP), and enable it for HDMIv2.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 1 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_v2.c     | 3 ++-
>  3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> index 4cecfef1466b..8841fa4e476a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
> @@ -1301,7 +1301,8 @@ static const struct mtk_hdmi_ver_conf mtk_hdmi_conf_v2 = {
>  	.bridge_funcs = &mtk_v2_hdmi_bridge_funcs,
>  	.codec_ops = &mtk_hdmi_v2_audio_codec_ops,
>  	.mtk_hdmi_clock_names = mtk_hdmi_v2_clk_names,
> -	.num_clocks = MTK_HDMI_V2_CLK_COUNT
> +	.num_clocks = MTK_HDMI_V2_CLK_COUNT,
> +	.interlace_allowed = true

Nit: if you have a trailing comma, you don't have to change the last
line when adding a new one.

>  };
>  
>  static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8188 = {
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry

