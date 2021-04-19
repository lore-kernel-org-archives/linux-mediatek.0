Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EFBC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:38:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A305F610CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A305F610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BvKhfCNn+FORvPMeUG31d9wJGwxpJZCxW9EUXvCLV2w=; b=eGRBjT6J8lkplGsd0Rzv2PwJd
	nbPL/pa2OLaAvU5HMv9v7WInOdQ8tl0xQ618hCPxG4rrKk6dRyGQbcjhtbv5JmalpuNDQoKUnac8b
	YwJhiBHg6TDR+npg0w9QlgquO8F9ELOgqaazkxC6dvXqk7C4tthrdzyR3HjhC+wVynunWFEnWi8Iy
	fXODH4D1AvEDO62xNrV6pCEQT1JzlDOVsqEKZ6Amgk6UdfARoS+wiM0pw43pnX8dMlF9jTUNoIV8l
	5/6cKr4jiRb7IweP+s5mhozTg/NDnoB+j2c+taVu9iPtz2b3tfm+EWdSc4fTLjBEZP9nX7u7ngofk
	PpMVaFT5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYOU1-009Mzx-0C; Mon, 19 Apr 2021 07:38:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOTx-009Mxd-H3
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 07:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=GGu5AhW2TAEJ2G4FlH0by+LNYDQEu1JPm0RJ/z9KRJ8=; b=Htlf2t524XLRb2kd7SYOdeHcje
 d8mo/N4PlqLKFfYcxTfybybZ3u1VsE6hQWEiwzkIsQgRde6w5lbAKQvkV7eePN5oHN0ieqAJUNdrV
 mbrNcbZcyv3Q647ZighiGXmsW0tTtjzwTX4m2rO9EyNhq8UfrTkGeTzvD7l4EDswOVJ3f8Xq+vQuc
 lgjcPTNqbZBhBdePcv7w3ae0R3lVzeAP9fdc0Gz+7ug5HJtBy4fJMZqTezB9828nC2vAYHz3cnrkc
 irYwXcBNwsKDH31IzoibXYyZas/QtfQzfoN+QxNQK3gmcspQUA2LGImL3vXRj2Ei/XD/afscdydqO
 Mx//B1qg==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOTu-00B8tH-3A
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 07:38:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id e7so23892403wrs.11
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 00:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GGu5AhW2TAEJ2G4FlH0by+LNYDQEu1JPm0RJ/z9KRJ8=;
 b=rypVFEr+oS6XDU+B4A13SB8WaUsDa3I6RrCFmaP1Sppbo23b2wFmK2zTU3FpPx5Ton
 NwsLKmeAQaXKtYx/UJwICeeWZIjwvJT3JAJB7DoGVzaCZ2Rp738f3e5fOqatMGU1Lzdx
 oTT+qbqrIRIjKMCcTQjHd7t58jfSl3SW4sDWyo4eB4HM2fHJxYVyeU2M041Ebk0HEUvy
 l9c4pVJNuZlPzHnP/8Sv3A2abzX9otut8cRvmkCyc6O/eLRX3iocxAX7E7A9aRcXP0FF
 aAyeyb6zbHhHtqUh/wJLL0dYf5tsxQnmUKVJLPEHsQT9fYxAGskZUApOzW5FbS98c1oP
 EMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GGu5AhW2TAEJ2G4FlH0by+LNYDQEu1JPm0RJ/z9KRJ8=;
 b=fnjhNFdiolYCSVWFulCeBDaTN/OMZ56qpsD5Sp3iTg0HjC7kB4X7Cp6R8il9NUMurE
 Gdwg6oU2tt/nf2X7NZlH4zdnpG+z9y/vH2FvokveWZn/52vRmrQgZbxtSSVabIc9ECTc
 EfvfRmlIRJHUoRDyPz8YwJe2DknX9/En6QXDbHBWaQWRkkLacOo1O4yEHqxj/OWFBGga
 XazGspPYrDOuM7mIcS8JzwREiloYXqopMIxFD6ZJ6qMgm20xVSwXDsug98jXwQ8JgGQ+
 34dpDXq9as2xjgcTfeuAhUe+Rp5tBvjCttt0z1U5ayKKyrH9zE46t8VsF8Cfe3sWq1+7
 JcFg==
X-Gm-Message-State: AOAM533PE4j4sFhVkMc4YxlaFDw0q9HgM/uBPZQ4T5GuG+QHHVn30AoV
 W/jnLnJEllg0D7L7ZITXeK5PgqyWbOLVxWMD
X-Google-Smtp-Source: ABdhPJxIyZEKyEBbVba8z8nssGC5KYLYbd5ya1yLNfYhOqYQOuq8OWKksDyjTCDdV55SZLZH+sIeqg==
X-Received: by 2002:a5d:590d:: with SMTP id v13mr12577663wrd.85.1618817883781; 
 Mon, 19 Apr 2021 00:38:03 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:2e82:31e6:67f1:4f33?
 ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id q10sm18527589wmc.31.2021.04.19.00.38.03
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 00:38:03 -0700 (PDT)
Subject: Re: [v2,PATCH 3/3] drm/mediatek: dpi: add bus format negotiation
To: linux-mediatek@lists.infradead.org
References: <1618407316-10042-1-git-send-email-rex-bc.chen@mediatek.com>
 <1618407316-10042-4-git-send-email-rex-bc.chen@mediatek.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <6b870b7d-3330-ff01-b6be-083d554a2bb9@baylibre.com>
Date: Mon, 19 Apr 2021 09:38:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1618407316-10042-4-git-send-email-rex-bc.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_003806_176437_40F29432 
X-CRM114-Status: GOOD (  22.34  )
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

Hi,

On 14/04/2021 15:35, Rex-BC Chen wrote:
> Add the atomic_get_output_bus_fmts, atomic_get_input_bus_fmts to negotiate
> the possible output and input formats for the current mode and monitor,
> and use the negotiated formats in a basic atomic_check callback.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 89 ++++++++++++++++++++++++++++--
>  1 file changed, 84 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 76431fe849b8..b4e9c6c8d706 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -536,6 +536,87 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  	return 0;
>  }
>  
> +#define MAX_OUTPUT_SEL_FORMATS	2
> +
> +static u32 *mtk_dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					unsigned int *num_output_fmts)
> +{
> +	struct drm_display_mode *mode = &crtc_state->mode;
> +	u32 *output_fmts;
> +	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
> +
> +	*num_output_fmts = 0;
> +
> +	output_fmts = kcalloc(MAX_OUTPUT_SEL_FORMATS, sizeof(*output_fmts),
> +			      GFP_KERNEL);
> +	if (!output_fmts)
> +		return NULL;
> +
> +	/* Default 8bit RGB fallback */
> +	if (dpi->conf->dual_edge) {
> +		output_fmts[0] =  MEDIA_BUS_FMT_RGB888_2X12_LE;
> +		output_fmts[1] =  MEDIA_BUS_FMT_RGB888_2X12_BE;
> +		*num_output_fmts = 2;
> +	} else {
> +		output_fmts[0] =  MEDIA_BUS_FMT_RGB888_1X24;
> +		*num_output_fmts = 1;
> +	}
> +
> +	return output_fmts;
> +}
> +
> +#define MAX_INPUT_SEL_FORMATS	1
> +
> +static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state,
> +					u32 output_fmt,
> +					unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
> +			     GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	*num_input_fmts = 1;
> +	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	return input_fmts;
> +}
> +
> +static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state)
> +{
> +	struct mtk_dpi *dpi = bridge->driver_private;
> +	unsigned int out_bus_format;
> +
> +	out_bus_format = bridge_state->output_bus_cfg.format;
> +
> +	dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
> +		bridge_state->input_bus_cfg.format,
> +		bridge_state->output_bus_cfg.format);
> +
> +	dpi->ddr_edge_sel = (out_bus_format == MEDIA_BUS_FMT_RGB888_2X12_LE) ?
> +		 		true : false;
> +
> +	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> +	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> +	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> +	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> +
> +	return 0;
> +}
> +
>  static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
>  				 enum drm_bridge_attach_flags flags)
>  {
> @@ -574,6 +655,9 @@ static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
>  	.mode_set = mtk_dpi_bridge_mode_set,
>  	.disable = mtk_dpi_bridge_disable,
>  	.enable = mtk_dpi_bridge_enable,
> +	.atomic_check = mtk_dpi_bridge_atomic_check,
> +	.atomic_get_output_bus_fmts = mtk_dpi_bridge_atomic_get_output_bus_fmts,
> +	.atomic_get_input_bus_fmts = mtk_dpi_bridge_atomic_get_input_bus_fmts,

+       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+       .atomic_reset = drm_atomic_helper_bridge_reset,

Are missing to handle the bridge state, otherwise you will hit a warning in the atomic bridge code.

>  };
>  
>  void mtk_dpi_start(struct device *dev)
> @@ -620,11 +704,6 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
>  	}
>  	drm_connector_attach_encoder(dpi->connector, &dpi->encoder);
>  
> -	dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> -	dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> -	dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> -	dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> -
>  	return 0;
>  
>  err_cleanup:
> 

Neil

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
