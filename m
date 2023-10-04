Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9510E8FDD1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 07:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzbt6X7Q7d0mjTqmZT49evnXk1E+0LrXDBffntKrV+U=; b=rbYdP8bCZTn0kQe5QIAFaaT85b
	MqT/acSPgkhCa5N79ejCzgDVc4T6v6Dekj4354whF3zxHIB1q1xOSoKr5XEL9xr4PUVHaTarzMD5U
	Yw3FXZDLhGG6kly+X+S8ZGwzAxe+XJ1Gx1rOIf3/TZWeNOhYYWZ/1q7ATY+pOLQ1G3gdUa6pJ3/3m
	tBpfy1wQJ936eMsICSKS29inFOOhhUO/pA+R5bDUqMe1/n3W2IbhNXPZ9jbJNs9t8Hfx35TCmkiMz
	e0rnfQT5Tk2NKj8te+9o4JewdIlGheDf8ltNSqsaL0Sk2RPnwD5M4AY6eHMFQcnI0bQ/YHUsnHmDF
	N5Y39ahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwNa-00GcD1-1Y;
	Wed, 04 Oct 2023 07:33:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwNY-00GcC2-1s
	for linux-mediatek@bombadil.infradead.org;
	Wed, 04 Oct 2023 07:33:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yzbt6X7Q7d0mjTqmZT49evnXk1E+0LrXDBffntKrV+U=; b=reUYAwSl9JOmeYWogvoIdrkjPg
	U/43LyCcFGj956i9iVwahceWThjjOoU3L61QPhg2+5hkIrs7b3ySTHeQDTpPOSA1rT12QV36pn1sp
	CWoEV5LdK29hxYOi7ETBk28Gk4OjUPm2mjiMoXkAtrA/Y6Nd0+FBnDwV41vg3MakPkbXrIj+hHDzu
	LD4+gyd0nbTprbTzqnz5SVJWwu/6dGgjLxKp2tdFDdyXhNnyQoJU/RHHv79RQlqnGLrE3YK0pCzwi
	pfY1cFn0qN2XCpFD+U01oJbqvFoVwQnvBUX0GG91qPQOiXIUhPTxofNYoqo7VIaraKq3ymnH/jxYZ
	oylXmcfA==;
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwNS-00AaNi-0l
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Oct 2023 07:33:06 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c008042211so20784581fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Oct 2023 00:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696404779; x=1697009579; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzbt6X7Q7d0mjTqmZT49evnXk1E+0LrXDBffntKrV+U=;
        b=nSjFVawy1da0b+2su4yh/x0G+tWCc9vifI3WEeedZFwOF7yC+j81XCbk19G/nVs6Z1
         FnmtrWJO3CUDxC3Ffd3BgHIfXMEQNoKTp9uelMefCX7x4I9ysZnbTcmYv3lhbrW7q21s
         Foaypa1KDpW5yuVpo+zZVZz5iQ5j9Llh3RsKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696404779; x=1697009579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzbt6X7Q7d0mjTqmZT49evnXk1E+0LrXDBffntKrV+U=;
        b=cd2eHztqDwBlYncoJUkbZn+hIRq7c7c/NdMaamOQRp5zNoymtgB1702nbDWXZkpWZl
         SgxsursHhZXjOilnqdQVrZosms758oDi4UcgUeA3TaZgVHA92XJQAh8tAkykjSYnOGJz
         Xq2bW5Do+NmPVVOKbNHClJmLd8Mk4oGcQWMK5qZR5vIGR4BV/1dqIENyE4/7jcgJxkQI
         qinHk2czdQ5sKO6AaK7wCo8fUB8UX5cdOSrFo352jZDEkgu+z7MWPF4ud4byAJldspGI
         ZC2qd00/ReygdyOUtA7HHK3VBMMyrmqJVSlxtrX/8baIhKhwS724LokvZDkrrlAYecdu
         1tMg==
X-Gm-Message-State: AOJu0YyVeXLLwB6ZZ5DZO7aVnsCNZihb6QdadDlEmBSM8dLAgnjBaaZ2
	t3zVXvhkouswV0LfdXm1z3XYZj3RBUhFN+n2nJftfA==
X-Google-Smtp-Source: AGHT+IGssoE7hQqBg/N5JbkjtBec11yjXOZDIx9mR4vfXI1H5ndkIzs/dQErwY530PlhjT1G82jsZ/AwIGzfKfKkfKA=
X-Received: by 2002:a05:6512:3b28:b0:500:7de4:300e with SMTP id
 f40-20020a0565123b2800b005007de4300emr1597917lfv.58.1696404778196; Wed, 04
 Oct 2023 00:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231002092051.555479-1-wenst@chromium.org> <CAC=S1ng3_z0H48awhum7unXTTk0yfn61pTWqSmPJ9fWdoURL=A@mail.gmail.com>
In-Reply-To: <CAC=S1ng3_z0H48awhum7unXTTk0yfn61pTWqSmPJ9fWdoURL=A@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 4 Oct 2023 15:32:47 +0800
Message-ID: <CAGXv+5Ex9ZN+MPZx0CyNaHf0h+DC2VLNH6Obs7Wt-nokU70MNg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Correctly free sg_table in gem prime vmap
To: Fei Shao <fshao@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_083304_690313_DDDE3044 
X-CRM114-Status: GOOD (  28.82  )
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

On Tue, Oct 3, 2023 at 11:14=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:
>
> Hi,
>
> On Mon, Oct 2, 2023 at 5:21=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
> >
> > The MediaTek DRM driver implements GEM PRIME vmap by fetching the
> > sg_table for the object, iterating through the pages, and then
> > vmapping them. In essence, unlike the GEM DMA helpers which vmap
> > when the object is first created or imported, the MediaTek version
> > does it on request.
> >
> > Unfortunately, the code never correctly frees the sg_table contents.
> > This results in a kernel memory leak. On a Hayato device with a text
> > console on the internal display, this results in the system running
> > out of memory in a few days from all the console screen cursor updates.
> >
> > Add sg_free_table() to correctly free the contents of the sg_table. Thi=
s
> > was missing despite explicitly required by mtk_gem_prime_get_sg_table()=
.
> >
> > Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap fun=
ction")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Please merge for v6.6 fixes.
> >
> > Also, I was wondering why the MediaTek DRM driver implements a lot of
> > the GEM functionality itself, instead of using the GEM DMA helpers.
> > From what I could tell, the code closely follows the DMA helpers, excep=
t
> > that it vmaps the buffers only upon request.
> >
> >
> >  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/m=
ediatek/mtk_drm_gem.c
> > index 9f364df52478..297ee090e02e 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > @@ -239,6 +239,7 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object *o=
bj, struct iosys_map *map)
> >         npages =3D obj->size >> PAGE_SHIFT;
> >         mtk_gem->pages =3D kcalloc(npages, sizeof(*mtk_gem->pages), GFP=
_KERNEL);
> >         if (!mtk_gem->pages) {
> > +               sg_free_table(sgt);
> >                 kfree(sgt);
> >                 return -ENOMEM;
> >         }
> > @@ -248,11 +249,13 @@ int mtk_drm_gem_prime_vmap(struct drm_gem_object =
*obj, struct iosys_map *map)
> >         mtk_gem->kvaddr =3D vmap(mtk_gem->pages, npages, VM_MAP,
> >                                pgprot_writecombine(PAGE_KERNEL));
> >         if (!mtk_gem->kvaddr) {
> > +               sg_free_table(sgt);
> >                 kfree(sgt);
> >                 kfree(mtk_gem->pages);
> >                 return -ENOMEM;
> >         }
> >  out:
> > +       sg_free_table(sgt);
>
> I think this will cause invalid access from the "goto out" path -
> sg_free_table() accesses the provided sg table pointer, but it doesn't
> handle NULL pointers like kfree() does.

You're right. I'll send a new version fixing this.

