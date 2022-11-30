Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC3AC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 10:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGPlL9lZ5xvH+B3mVmAc8JvO5zer6RowH0S3PzS9r9U=; b=KFu+mloQGc2Cp+Ojf3uE4nh6rc
	6hWRddMhk6Ej+LY30fHojVkvePN1QzzNRyCvc+ItVAU/uDmdsFYAM7o65k+NElBvAocN3Wxyf5nG1
	rPASavxXsmtWoy4m8+HkICsPJzHho4bfPRv/uu8wV+TSNMHT0lc3moCIYITntPgEPfKZjxWCDui9q
	t3dBjuuNcvmHCZnwkPZVULP2rNSpb/m4mKsxTpOJBz/D7VQZpd7I3NDBzxHrDaT6BCqq9s3WAaPKq
	UsRamDWhQGDqknVS+5er2fm40djlqgjmkzBvMlzS3U6z2mBjnMI3YnUbsR6hkhegbVQWqK3v0Dh+k
	88MObrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0KYt-00FWmS-NX; Wed, 30 Nov 2022 10:43:31 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0KYr-00FWl7-Hz
	for linux-mediatek@lists.infradead.org; Wed, 30 Nov 2022 10:43:31 +0000
Received: by mail-wr1-x434.google.com with SMTP id m14so2448152wrh.7
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Nov 2022 02:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGPlL9lZ5xvH+B3mVmAc8JvO5zer6RowH0S3PzS9r9U=;
        b=lGx7StVF6qQsTDaKmvZp1gvL21/xrmMNCXvQCyuBtp8eB26CGM1s1CyQUOXlCtsWu2
         LITUGy35uTtfdtsLvH3Y9gQCe9YK3oEMsCWdZEejvtuz4KD40BeCevLY8D+pOe23TonI
         Xf9c1QuM/kypVlj5DMeqPKfePUBqzqNEx/u9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGPlL9lZ5xvH+B3mVmAc8JvO5zer6RowH0S3PzS9r9U=;
        b=feK/yos3VMHPumqN1HzbJ5VN7ouZvJ1N7ojrxrsxitmrsUTMlRy9nsiF0jVt16AXNu
         pgwwmJgr3+6bLnVmtosEGPtdD7Gk7esa41lMOcuWR+Srz5QmnrXjyspYlIQOtn/M1o0L
         X383TJL1GMqZGYMCO/LtPXcIeBdgs++vGM3gp243KVq2jNNW4BgNjAH7F5+JvldsHcVq
         pHaRuI/0AwYjcas2/G1fjMXHQ+xO/tTdvxmG5IKX3hvjoe/2iuh5jnm14jcUMOb3z/fj
         wq2LwWMk5xNoXsYH+7wGbYF4VzO8/5HrZEKBEEmZapi3q58Z/q8+mVAhaoHNPT+5YPbK
         zKUw==
X-Gm-Message-State: ANoB5pkQy7YC8ZtD5fPH9oz+8R4bi7828VLmpRMgxVZmQqMg4lDfcqql
	U6OwXvCdZJk9Fq/4YokYe1+3tQ==
X-Google-Smtp-Source: AA0mqf5PE/wnU0Q+X6aw1n886cna9WKQ3FZBAb/LMVn5jwenWpq7cUhFELwzoBfWPFlUu5dm72yMWQ==
X-Received: by 2002:a5d:4441:0:b0:242:2b6b:da5 with SMTP id x1-20020a5d4441000000b002422b6b0da5mr1353255wrr.535.1669805007024;
        Wed, 30 Nov 2022 02:43:27 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id o37-20020a05600c512500b003cf5ec79bf9sm1683349wms.40.2022.11.30.02.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 02:43:26 -0800 (PST)
Date: Wed, 30 Nov 2022 11:43:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Yuan Can <yuancan@huawei.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, matthias.bgg@gmail.com, stu.hsieh@mediatek.com,
	ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/mediatek: Add checks for devm_kcalloc
Message-ID: <Y4czzLVPKsdKZCN8@phenom.ffwll.local>
References: <20221125014123.121268-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125014123.121268-1-yuancan@huawei.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_024329_612231_9B2B2110 
X-CRM114-Status: GOOD (  19.62  )
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

On Fri, Nov 25, 2022 at 01:41:23AM +0000, Yuan Can wrote:
> As the devm_kcalloc may return NULL, the return value needs to be checked
> to avoid NULL poineter dereference.
> 
> Fixes: 66b2cf9623fa ("drm/mediatek: use layer_nr function to get layer number to init plane")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 112615817dcb..5071f1263216 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -945,6 +945,8 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  
>  	mtk_crtc->planes = devm_kcalloc(dev, num_comp_planes,
>  					sizeof(struct drm_plane), GFP_KERNEL);
> +	if (!mtk_crtc->planes)
> +		return -ENOMEM;

These (= drm object allocations like drm_planes, drm_crtc) should all be
moved over to drmm_, since devm_ has the wrong lifetimes.

Just in case you want to spend a pile of time in here, the error handling
needs to be fixed either way.
-Daniel

>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>  		ret = mtk_drm_crtc_init_comp_planes(drm_dev, mtk_crtc, i,
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

