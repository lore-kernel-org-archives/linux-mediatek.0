Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BBCE7AD6E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G502n/pwsi2xTvXRats/u+gp/KdtO1vpg74dn53OTQA=; b=s62SzzoFqm5J5OO9xEjAdlVt0u
	CYxRTnsv+Ykl/UFdTo552qG/drUe+haK5rYcYTl2zF3K/jJGe93NlO42+hBMFZptoIBYPgSCe4IzJ
	ZW05sabpQIhesyCs9eL8Kom4Aie77qw0mziTjJ421AXKqw1cwWXH8L3fg3gXSqTUw2wRg6+s5zDC0
	tj+UkROHkzl7oQ5ZDJy3ub79CgverbVPuLGn1OR68RremCUHj0fap55nlulglJqRRjgDfwHUoR1wG
	2b7pk/GPx+rasYfRvPwK0Lq8PWKlCPDpnOOde2BHlHi1LAN5Vjehtmnj/LmTmOCN9o/rPXi3oyjcZ
	iwvV30WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnh6r-00EqzR-1Z;
	Tue, 03 Oct 2023 15:14:53 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnh6l-00Eqx1-0V
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Oct 2023 15:14:52 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 71dfb90a1353d-49b289adca9so461857e0c.3
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Oct 2023 08:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696346084; x=1696950884; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G502n/pwsi2xTvXRats/u+gp/KdtO1vpg74dn53OTQA=;
        b=mrxERYYZKA+Ptx7rSzqfvAIk6BwXrmNSFR7Tac0v7ZTUavJ23iH5TJ9hmZAAjxzJK3
         cECg7618Jc0D9/EGixXo/yZEJfcfz2/paA/ktpNvQuYRT+9DWzyCrMtBXidkR2VU//zX
         blY7Zsq69Kp+PuAcgXR5LZeg0d0q6ZEbcozMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696346084; x=1696950884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G502n/pwsi2xTvXRats/u+gp/KdtO1vpg74dn53OTQA=;
        b=mknAyA76auuftpwBILW4+2/BYd/7pY9DppaU3bFjM6fLtXMlUAY2jchJlvfuEXlyYq
         26FNv2seEZG1spf8guO6KXzFze6QMyxApluWnhzgcXXuV1sdzigKalVFhyXKTzRtgJIC
         gtcYWuXvIUzjCX8COCkupu6UJLUYn9FsRIYwWXZuN2KvZh1bfaXaApD1ryTafq0R0d/7
         Bw9f0xN7hQ220YXUCJA9e4nUCvuVRWK6ItgLsFItoDaxMSRGHRDopKHpb1IQQvikYuym
         AP6AptRAnUTim1RoDorIw6a1PzSlGga3PLKsSRCRr4pG5kTpmsJlhye2wqeHvI2vVDHH
         5GfA==
X-Gm-Message-State: AOJu0YxdYw1TxIaJ5JprPYrx1ZrremAhkQP2OUdzShrlL44i6nuEhzZF
	HBDVlpqR94g3+/HteHWhL9TCQu6QWIYVqAeJWyY=
X-Google-Smtp-Source: AGHT+IGQryfO1IwQ4bg4WMwOWsWh/PJBx9Tosj1CS+sjOV2yZ114f8q6bZ984GUxxqWo3SRo6gb+Fg==
X-Received: by 2002:a05:6122:21a8:b0:49d:723f:5912 with SMTP id j40-20020a05612221a800b0049d723f5912mr5850841vkd.12.1696346083962;
        Tue, 03 Oct 2023 08:14:43 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id p14-20020ac5ccae000000b0049d2122e009sm186682vkm.24.2023.10.03.08.14.43
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 08:14:43 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7b0ec7417bdso470058241.2
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Oct 2023 08:14:43 -0700 (PDT)
X-Received: by 2002:a05:6102:274c:b0:452:9384:139a with SMTP id
 p12-20020a056102274c00b004529384139amr13589952vsu.22.1696346082550; Tue, 03
 Oct 2023 08:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231002092051.555479-1-wenst@chromium.org>
In-Reply-To: <20231002092051.555479-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 3 Oct 2023 23:14:06 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng3_z0H48awhum7unXTTk0yfn61pTWqSmPJ9fWdoURL=A@mail.gmail.com>
Message-ID: <CAC=S1ng3_z0H48awhum7unXTTk0yfn61pTWqSmPJ9fWdoURL=A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Correctly free sg_table in gem prime vmap
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_081447_192125_B01BE0CD 
X-CRM114-Status: GOOD (  25.38  )
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

On Mon, Oct 2, 2023 at 5:21=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
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
> Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap funct=
ion")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Please merge for v6.6 fixes.
>
> Also, I was wondering why the MediaTek DRM driver implements a lot of
> the GEM functionality itself, instead of using the GEM DMA helpers.
> From what I could tell, the code closely follows the DMA helpers, except
> that it vmaps the buffers only upon request.
>
>
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index 9f364df52478..297ee090e02e 100644
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
> @@ -248,11 +249,13 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *o=
bj, struct iosys_map *map)
>         mtk_gem->kvaddr =3D vmap(mtk_gem->pages, npages, VM_MAP,
>                                pgprot_writecombine(PAGE_KERNEL));
>         if (!mtk_gem->kvaddr) {
> +               sg_free_table(sgt);
>                 kfree(sgt);
>                 kfree(mtk_gem->pages);
>                 return -ENOMEM;
>         }
>  out:
> +       sg_free_table(sgt);

I think this will cause invalid access from the "goto out" path -
sg_free_table() accesses the provided sg table pointer, but it doesn't
handle NULL pointers like kfree() does.

Regards,
Fei


>         kfree(sgt);
>         iosys_map_set_vaddr(map, mtk_gem->kvaddr);
>
> --
> 2.42.0.582.g8ccd20d70d-goog
>
>

