Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE700C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 01:13:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 906E360F02
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 01:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 906E360F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsk3u48bl6oKHvPUZEDziaARs2xjQaFyTooFFATGGlQ=; b=QhB8sVAAZRIjqN
	3TXoxfIyTaPEgPU3NNdqJhsmE+IND14Wg4GtHV3NGY+wt9lm1kfe2vUkhiWG206Jzr6GuMSWg7OHt
	Wl549oFv+vdpoF3M66ceqZ9dfY1wtBceU2YmFT9FIzLxOe9uWv5OasnnjDbKdI7/Qe9pQbLsbILCR
	mXFfT/Cz70wmUDS3eB5kvhi6PGE5WRRuZ8d9YuCcoC+Sqroufy2EN3momAdBVnZmWa+3wFLX2p3SG
	ykuZhSXP+af4SC79MgfhQ/VS9WI6L820e4Dcz5qVMJNAQrQD7oZbdcs85UrAtFgb6R1R8LrIrPhDB
	55w1h+z7QHJuKjTlH45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfB1o-000PQW-1f; Tue, 26 Oct 2021 01:13:24 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfB1l-000POm-0d
 for linux-mediatek@lists.infradead.org; Tue, 26 Oct 2021 01:13:22 +0000
Received: by mail-qt1-x835.google.com with SMTP id w8so12057012qts.4
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Oct 2021 18:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zoFDos6hqsoqPNE3Ubon2jXwfOR6C/kTOnroswa4np0=;
 b=YD76ZQyDKFx2VikMwfx6Wtm4xSipBCQMd/DLWlpZ4zQmxA5Ud/s31RJ4FSUZA77SF5
 8VKmNmiXVI1JNvMACnCbxkuTr3kiesrznZiUIdy7f1/20He1Z4WdGTHmqmfkiJdU0eeu
 77YLxMrXZ0o4r2X158iw2180hPelIRw6n/OGcKFzn/B0ClULewryvg3Qvv/TqQ0V8hnT
 FzIbYZrouWQ+nxIHHd/mw6/h/P9Y1JrLkUnzTGWA/8NQLM9GzXcHrwY/UUs18ChJIF3Y
 PpIfbNQsnbCuVZuSDrfrnt+5d7Eaxjb/cd0XvPKX5ckVFvzboFMgdYvyDa7JsW6NmiyY
 hoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zoFDos6hqsoqPNE3Ubon2jXwfOR6C/kTOnroswa4np0=;
 b=eOT3whC3ljQ03b0UdlN5TN9EvwgK0MSuXUgkvzUi7VDByjFoQsARnCdmvEss+MUkU4
 YWUXZnspOcmE5mcYL8Cv41GXe9Y1uw+N7vAGmTkNNtfBcyiVzyn/pnH8j9BPOhDZPpcq
 KRgyVcK0e0HPHq++saYH5z1kKMwzDqG1SP7rP2Rn+3YDrBOgjtm6GzfB/eZ8GtiB7+C2
 c0aW/DjA40XyVuXXs6ticHaFwNw0yrtnmjvUPFFYC+XRu+BfqitDrJHITBn2oHnD2oax
 uWJXJfeHtV4NbQVY3Lf69HeDwrwN2c4eFGVJ6DWJJsbdDUW4KM6b3w/tVXJHrURAWdhg
 RmNQ==
X-Gm-Message-State: AOAM532mSDTRG0BA4uUcnzpA0IoGH+NbRU5lFTBNmddXecn2aRsgnpuk
 fBuWbA8O/O0YYLDd5SbmzBIGTw==
X-Google-Smtp-Source: ABdhPJwZ4eKoLPCDqP0AOPkjcIy0mJFLBRYWPbATnTT744Z29KzjLAreryt+LTa8sHr0LQ9cUbLj4w==
X-Received: by 2002:a05:622a:13:: with SMTP id
 x19mr21230249qtw.83.1635210799496; 
 Mon, 25 Oct 2021 18:13:19 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id bj26sm10232892qkb.127.2021.10.25.18.13.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Oct 2021 18:13:19 -0700 (PDT)
Date: Mon, 25 Oct 2021 21:13:18 -0400
From: Sean Paul <sean@poorly.run>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: linux-mediatek@lists.infradead.org, seanpaul@chromium.org,
 Mark Yacoub <markyacoub@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mediatek: Set default value for Panel Orientation
 connector prop.
Message-ID: <20211026011318.GF2515@art_vandelay>
References: <20211022172413.195559-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211022172413.195559-1-markyacoub@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_181321_078871_E11FEAA9 
X-CRM114-Status: GOOD (  17.65  )
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

On Fri, Oct 22, 2021 at 01:24:03PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> Creating the prop uses UNKNOWN as the initial value, which is not a
> supported value if the props is to be supported.
> 
> [How]
> Set the panel orientation default value to NORMAL right after creating
> the prop.

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> 
> Tested on Jacuzzi(MTK)
> Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 0ad7157660afa..b7c2528a8f41c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1039,6 +1039,8 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>  		DRM_ERROR("Unable to init panel orientation\n");
>  		goto err_cleanup_encoder;
>  	}
> +	drm_connector_set_panel_orientation(dsi->connector,
> +					    DRM_MODE_PANEL_ORIENTATION_NORMAL);
>  
>  	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>  
> -- 
> 2.33.0.1079.g6e70778dc9-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
