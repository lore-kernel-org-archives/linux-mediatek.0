Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF49E8FDDB
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfmW3coigpVfgSMijltIl7QADja7SAFkOQQrbcYexQk=; b=jFvHnz2nEmK0pQMp6RhY9Gv9dQ
	hdnWtbvsNB/dLNz4cQ25lxgwOpcu6D7Nv93iXLDo1M4vrdXAOnTfX8nTthksN+lFQBXoBgMQ27YY2
	miZlFHpvHJs/tInPhAtTGjqcJ279x+l9vZad/JfWaYJHuVt4HCoWMkdElAvn7sYjKi2b8/y8+wuQy
	npsZYjEKCwNaPW8xQ+NzfIOL91MiPGvGuVJsdj0T4dkCFS+dyGAOKnwVowWdRPPXKDiHYe8BRs7gq
	GI6KfvNGsNWzvSOvaMlRLkLjj9jVm4eDJSAo3Nh5Y7y1cRYFiFECsL2UM/tqJQc/R+XYIGbG8+296
	eAHkvoYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxKb-00Gqto-24;
	Wed, 04 Oct 2023 08:34:09 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxKY-00Gqqm-10
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Oct 2023 08:34:07 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-502e7d66c1eso2150320e87.1
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Oct 2023 01:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696408443; x=1697013243; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfmW3coigpVfgSMijltIl7QADja7SAFkOQQrbcYexQk=;
        b=R0birQQzegGm4WUj93xpBlWKf6Z/DVamsJ83leoCKQHJtAParkQ/vv9wUUsFcveuS2
         iOJxXeYK8KVtZJEcIfyYXMJu5ogNw819Uh8KFsAIVyaIbZ6Mki2Mkf01b46d49K5d+t/
         VMqGxwjKcrXFRpfuCtrSAfrF2+cPliDvaRDRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696408443; x=1697013243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfmW3coigpVfgSMijltIl7QADja7SAFkOQQrbcYexQk=;
        b=ZJfMML7wnF6aHkf+CHF2UPspVxqa1N6UWjja/xFOqIBgl2gQAgngqZ1OGqnarFZPdW
         XFuUoNRzMfUXFA8redzgI8q7InxXtYel5hKEyA1pXQJRpnqPl9UMojFTfPwB8M4KCCwV
         yvH9NcwD7sbOxF4XoNpJl/DdJL0Fxfvi6rYO4GsJ7zUzPEFL4NlEn0M9o834xyEiYF2G
         Pt/zuxg0hMgjfWnU/vYSCT5yG4yW36PSn0IYAVmD8QL/+la3rR2+bSKzNQLORjuvNSyT
         znALPIY7H8HnV4hBQ/e7ypiJaiei7Sxum2XavUfuMZ/Ow8ecpTGsUEecfr5fQsuPi9CZ
         LoEQ==
X-Gm-Message-State: AOJu0YySJJMs0XCDlLdxt0QQet4i0BD89jZ15qNWkLD29bMdoi2sgCcS
	jeMc1Y92wCyhGStqNz/YX2JjPJ+v0qfsIWYsWTRvbg==
X-Google-Smtp-Source: AGHT+IF9sR2Cj+7e97L/FPexpqaBojFR/xX2jui4Z8uoOZLn5ebZKHpYgKEeRaYNH0lTMRLG8ectez6G8uh/TNsdVuw=
X-Received: by 2002:a19:e015:0:b0:500:94c3:8e3b with SMTP id
 x21-20020a19e015000000b0050094c38e3bmr1344729lfg.57.1696408442607; Wed, 04
 Oct 2023 01:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231004083226.1940055-1-wenst@chromium.org>
In-Reply-To: <20231004083226.1940055-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 4 Oct 2023 16:33:51 +0800
Message-ID: <CAGXv+5GiN22ObkB8P_w7ftVsWkRfOvoq3dAT4OtoUw3TTpUtaw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Correctly free sg_table in gem prime vmap
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_013406_349532_CD5B491B 
X-CRM114-Status: GOOD (  27.19  )
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

On Wed, Oct 4, 2023 at 4:32=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>
> The MediaTek DRM driver implements GEM PRIME vmap by fetching the
> sg_table for the object, iterating through the pages, and then
> vmapping them. In essence, unlike the GEM DMA helpers which vmap
> when the object is first created or imported, the MediaTek version
> does it on request.
>
> Unfortunately, the code never correctly frees the sg_table contents.
> This results in a kernel memory leak. On a Hayato device with a text
> console on the internal display, this results in the system running
> out of memory in a few days from all the console screen cursor updates.
>
> Add sg_free_table() to correctly free the contents of the sg_table. This
> was missing despite explicitly required by mtk_gem_prime_get_sg_table().
>
> Also move the "out" shortcut label to after the kfree() call for the
> sg_table. Having sg_free_table() together with kfree() makes more sense.
> The shortcut is only used when the object already has a kernel address,
> in which case the pointer is NULL and kfree() does nothing. Hence this
> change causes no functional change.
>
> Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap funct=
ion")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Changes since v1:
- Move "out" shortcut label to after sg_free_table() and kfree()

> Please merge for v6.6 fixes.
>
> Also, I was wondering why the MediaTek DRM driver implements a lot of
> the GEM functionality itself, instead of using the GEM DMA helpers.
> From what I could tell, the code closely follows the DMA helpers, except
> that it vmaps the buffers only upon request.
>
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index 9f364df52478..0e0a41b2f57f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -239,6 +239,7 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *obj=
, struct iosys_map *map)
>         npages =3D obj->size >> PAGE_SHIFT;
>         mtk_gem->pages =3D kcalloc(npages, sizeof(*mtk_gem->pages), GFP_K=
ERNEL);
>         if (!mtk_gem->pages) {
> +               sg_free_table(sgt);
>                 kfree(sgt);
>                 return -ENOMEM;
>         }
> @@ -248,12 +249,15 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *o=
bj, struct iosys_map *map)
>         mtk_gem->kvaddr =3D vmap(mtk_gem->pages, npages, VM_MAP,
>                                pgprot_writecombine(PAGE_KERNEL));
>         if (!mtk_gem->kvaddr) {
> +               sg_free_table(sgt);
>                 kfree(sgt);
>                 kfree(mtk_gem->pages);
>                 return -ENOMEM;
>         }
> -out:
> +       sg_free_table(sgt);
>         kfree(sgt);
> +
> +out:
>         iosys_map_set_vaddr(map, mtk_gem->kvaddr);
>
>         return 0;
> --
> 2.42.0.582.g8ccd20d70d-goog
>

