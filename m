Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDBFC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 21:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uil9plJP9Dnr6dnTwH9f7lNtwClTBHMqVkSdIzaqKlc=; b=bsc/nqqUjpBwXjMHm6A6lx9zrZ
	IBUfAYDQz+flvB+4qufe1fDNc3BRH7K5a3tg1QSmh1oxQKMlJm6X8biLVSi+6hm4PP4RgWyffqDeJ
	07vXQGWD3urgp/yfjDciHXvA0+QbqNdjgcpAfOstPBC/PONg4DWANyWQBUKmSOjWWhWZqkPbaGPEK
	lSAFgBK2W8sXzkelwTEUj/oKpsQFctvfWw78DdqEDyopCTl0dTrZbys+lf6AUx2s1FLdKqKaRHHTJ
	52fvsfUR4tU30i6A1KjRC2zASRZjEh4g+J+VvtUG6spRt+NOLmuAaujvx1bzS9sM5g013KtMozTOG
	u5GwJ05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otEsQ-00APuR-NQ; Thu, 10 Nov 2022 21:14:22 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otEsN-00APte-It
	for linux-mediatek@lists.infradead.org; Thu, 10 Nov 2022 21:14:21 +0000
Received: by mail-io1-xd30.google.com with SMTP id y6so2268620iof.9
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Nov 2022 13:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uil9plJP9Dnr6dnTwH9f7lNtwClTBHMqVkSdIzaqKlc=;
        b=AKd0LH+WS7kEa/YEwAZYDnDp3WXdZduDiw3Phr/ihPD7HAgl+hxcBCqg+vaBQ0WQTb
         DOWVhtqnQVdl++ZvD03DAHyedXWwMCGV462/zvFHP4BvXIUBZtLXLl4vo8vhn4luflwT
         676k/RTExfcmWxsxzxWurI5e9A0W5lCgTk9/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uil9plJP9Dnr6dnTwH9f7lNtwClTBHMqVkSdIzaqKlc=;
        b=RvTvJm/ugK7h/gAGl7YkXcvkSV8WgRGoiauNsSp0Rp984pJB/gc5IjZRgGp9Qp2LHN
         b9r1l4OhkYApwro988XOFKpKTIzBen4hqujt9XoHYlY/C57UREPJPRMndMRDbjuJxVLP
         06fs3E7kjG21l/H+AX/DLX6hwjsr9DBtmEMxIeyNFokqutE0tL2oDxWkx03HvrQQiNpm
         TXq96HT81uIvn1Kg2NQMcNidcMFwE+BOCjAS2hSBh+31F4ZtN3lKC7N1Tl6KhUe28Lx8
         +3o8WwFpcdgBvnZaVx/ZiE+2WMXS6FhnpPtq2gb8PcfW4WqgWIA8gj+ED89PTw+odAiz
         ZJNQ==
X-Gm-Message-State: ACrzQf1uP7v2W7UkXzytyg2ia9aIFRY1UoiL4kIoxWxpStiktCZdYCWb
	sBqcHtW8+M6WnzrEZe2+qsYNPXo3iMzNgQ==
X-Google-Smtp-Source: AMsMyM79O9IyyLo/fWCtzM9sQNLxzbeXW0hrjEst3EhuN8jVhndJ/3MP+Hf3RJX8Co8kSEnxnfrWBQ==
X-Received: by 2002:a05:6638:3d05:b0:363:a437:e54b with SMTP id cl5-20020a0566383d0500b00363a437e54bmr3751531jab.261.1668114857703;
        Thu, 10 Nov 2022 13:14:17 -0800 (PST)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id f69-20020a0284cb000000b0036384f898a0sm162754jai.133.2022.11.10.13.14.17
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 13:14:17 -0800 (PST)
Received: by mail-io1-f49.google.com with SMTP id b2so2257751iof.12
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Nov 2022 13:14:17 -0800 (PST)
X-Received: by 2002:a6b:6e02:0:b0:6bd:2e10:96cf with SMTP id
 d2-20020a6b6e02000000b006bd2e1096cfmr3362371ioh.24.1668114856597; Thu, 10 Nov
 2022 13:14:16 -0800 (PST)
MIME-Version: 1.0
References: <20221110184852.1848917-1-gildekel@chromium.org>
In-Reply-To: <20221110184852.1848917-1-gildekel@chromium.org>
From: Sean Paul <seanpaul@chromium.org>
Date: Thu, 10 Nov 2022 16:13:39 -0500
X-Gmail-Original-Message-ID: <CAOw6vbLRWMVeLch_i6WVxUHO_PptMcshdk-LQXr=+e6-kJc+XQ@mail.gmail.com>
Message-ID: <CAOw6vbLRWMVeLch_i6WVxUHO_PptMcshdk-LQXr=+e6-kJc+XQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: make eDP panel as the first connected connector
To: Gil Dekel <gildekel@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@linux.ie, matthias.bgg@gmail.com, 
	daniel@ffwll.ch, daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_131419_673861_74AD7EE7 
X-CRM114-Status: GOOD (  21.26  )
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

On Thu, Nov 10, 2022 at 1:49 PM Gil Dekel <gildekel@chromium.org> wrote:
>
> [Why]
> Some userspaces assume that the first connected connector is the "main"
> display, which supposed to display, for example, the login screen.
> For laptops, this should be the internal connector.
>
> [How]
> This patch calls drm_helper_move_panel_connectors_to_head() right before
> crtc creation to ensure internal connectors are at the top of the
> connector list.
>
> Tested by ensuring the internal panels are at the top of the connector
> list via modetest -c.
>
> This patch does to mediatek what the following patch
> https://www.spinics.net/lists/stable/msg590605.html
> did for qualcomm.
>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Gil Dekel <gildekel@chromium.org>
> Tested-by: Gil Dekel <gildekel@chromium.org>
> ---
> v2: Fix copy-paste errors in commit message so it's relevant for this
>     patch and the mediatek driver.
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 91f58db5915f..76daaf6a0945 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -386,6 +386,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         if (ret)
>                 goto put_mutex_dev;
>
> +       /*
> +        * Ensure internal panels are at the top of the connector list before
> +        * crtc creation.
> +        */
> +       drm_helper_move_panel_connectors_to_head(drm);
> +
>         /*
>          * We currently support two fixed data streams, each optional,
>          * and each statically assigned to a crtc:
> --
> Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

