Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C140E606A31E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 05:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W5V6/t3y;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=n+mbt3hJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OJyrNxxqSswpG73uJSwhGXWXiwyA3wVRnNN/kTlq4Co=; b=W5V6/t3yzrulRr
	ms7pcEJ5v+UCteZZeJ5r6/Lih1PLQrSpgzYu1tECEo4cRghTI+41p5ohF+dqrD6umLl+vMTEmMW+f
	Ja0ot3IYWmgSlRGMhCSmTObqod76EGgoVrD21Er84Nnu3zfAAJI7wHwBZjCrYdpA1b4HqWXhQ8EVt
	i8NZa7tZbzp+JZUQhpvY1EhBfWmBgV7GzPew/FfhsGDcNczkhLBH/uKI64iRdSb3IDLLKkiCJM/5J
	J5hq0M85N6NrsA7L3l5vrvbUelnWpYOhlDi0GRigSnSzJ9txdl5ijcwQiP/Yk2r8L0u9pO4650g8o
	ku1QpxGcg8F/64RBFNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWomN-0000000Ez1S-1bx6;
	Fri, 27 Nov 2026 05:45:51 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWomL-0000000Ez0f-1D5M
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 05:45:50 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso3149014a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 21:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795758348; x=1796363148; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJyrNxxqSswpG73uJSwhGXWXiwyA3wVRnNN/kTlq4Co=;
        b=n+mbt3hJTJZzuqdnad0ojPj4Et3xJVfIy8OuD29Jj8wghWVXiXa8PRDqKDTo/WtK9a
         JsxqedYlcWZE2Py7ZGkvn6+zwdp2yDECaj1HrPPdZhlvl1/aenY7NVF7gfw0EGgmipJL
         JkuZiLmMHZ2mybvIWz5yGy+WCDHocBUqG1ofQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758348; x=1796363148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJyrNxxqSswpG73uJSwhGXWXiwyA3wVRnNN/kTlq4Co=;
        b=telwKzMsQ5j6JQhS4GpMnJwLGzFrr/UJ4AmDnXJS1ANIdcWmTWE2LkF2V+5ZuUO3OR
         wzdXe5kMSMyshigjjn3U5fjvuNXH3lmGGmVQAF7Me/o6G9ciWzMA2LzkwAtUc+4JJZda
         ZHYAJ0QfeuPnVyHwfEhMXgR61tigrYbxsBxSVkxXsr7k9do9pLvzegD8F1NhnlLRVbhz
         bWtPmTtlP7FxsU+MQDZTTAAnuzfQtriReTKGwdKdbw9NlnnK3eV3yv8Zs5PHl9HXvy5x
         4F1UtW14PzulpD3GEl+S5gzKkAU/vE9lk2pjFC0aGGl8h0kcKbWsPYj9pBu3YeSGUmhS
         F2tw==
X-Forwarded-Encrypted: i=1; AL+hErGkwApWMcaO/gkGfO0rZbPRMdGJsp0qGKOXuCEG5t5GCmEaWsxwVOQ3LIQpOP2/f5mS3ghRFn597Pea+6uPGw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9C4mXTx45h1Ouf7YtkTWYQeawNTud6n8UjlxOpQpCI+AQ0ZjzL
	duxKIYGnDrdEzHPtxsDVBpWILowczUZLYpFShCleFqrJ6CqKw4ns7tZfLJvKzEAw/fPfYX1C2Lb
	I3U7klw==
X-Gm-Gg: AZFdTZet81MfxIocYwmVhmpOaziDtQZpUCN/O/gB9B0JUCSNa2wpI/6//kFyNqP5JBF
	JHcdOYThYNI+OnX1TIml9ixCGpudDQ6o0jyn2pD8EWVS33R+br4AlbE+Al4O/2S8ba+aYCi1LjX
	c4neqxtXUfy1YQTKlZv/HeGUvZj08f/bqz+6VjhtV32C0vxXEAJGy34v+SyvT7BIdUOBVeOyLoK
	1+EeijdvM83HdN6fthh2q0Dgh4g5zeLWW0Q4mpCPPeEp0r4Qh+9BLrkJImseFgl1WfsSFiImS5j
	OlhFDxNsnPZjNhe4UaSZPUeDi/5bZK95UVZJp+tVQVmnlAL0wtv4H7WRhM9fxjRb7O/jFIKwzcD
	+LIxaKSU0rZzFlXSLvhOELmRbq4W1Q+UcNN9dTtjJ2p8tZl03g3rISFAPcUOpW5WHjRy8hMGbcZ
	MucHqSb8+1jJEmXJwQ5+BgIEH5hxmQMvR4qq2zQ2UvHTUvTucpLxLomc+uYsLtc67iKf5E48vvo
	IfAI8A+D7JXYofC9cwun8OH17T5sUykqyz+J5VqIPgBIMUk0HJAoXgEe488NI4FlhzELM9Lrq4J
	eJ+8mgqRIDIvzw9IHWsOrFXBHvjTKg/eYxhdeyh1EXxiZuaIpf0mML0MdSQZqIR9mW9BtYMXyNR
	asU0VYfkxG0+b
X-Received: by 2002:a17:90b:4a48:b0:3b1:bf11:c65 with SMTP id 98e67ed59e1d1-3b41c7ac06fmr21562901a91.1.1795758348232;
        Thu, 26 Nov 2026 21:45:48 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm38768040a91.11.2026.11.26.21.45.47
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 21:45:48 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386bd881d39so8367353eec.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 21:45:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEXpONMbUc/6On2tmhEhh2BnBq2zV0HT+OZMU8B44E7rC+1yceODTzPmvVQBweLXDV7htu17F7NYKKwXvR/Cw==@lists.infradead.org
X-Received: by 2002:a05:693c:87d2:10b0:386:b5a8:1c5b with SMTP id
 5a478bee46e88-386b5a82496mr13605222eec.18.1795758345905; Thu, 26 Nov 2026
 21:45:45 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023075642.3671805-1-fshao@chromium.org> <20261023075642.3671805-2-fshao@chromium.org>
 <21a907f61fe983203120d44dbc4fa84269feee69.camel@ndufresne.ca>
In-Reply-To: <21a907f61fe983203120d44dbc4fa84269feee69.camel@ndufresne.ca>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 13:45:07 +0800
X-Gmail-Original-Message-ID: <CAC=S1niZJjX92misxLioPnpoFJNfJEjWuaHsH_iiQ7TGs2afDQ@mail.gmail.com>
X-Gm-Features: Aa3M54qNDjQhU6gA65neybgLv3Xn13aUHMcLYLRb3RcSnItlV06t95c1GfEEZAc
Message-ID: <CAC=S1niZJjX92misxLioPnpoFJNfJEjWuaHsH_iiQ7TGs2afDQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: mediatek: vcodec: Return source buffer on
 NULL va in stateful decoder
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_214549_325383_D6FC0463 
X-CRM114-Status: GOOD (  24.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 27, 2026 at 3:17=E2=80=AFAM Nicolas Dufresne <nicolas@ndufresne=
.ca> wrote:
>
> Hi Fei,
>
> sorry for the delay, so many patches...

No problem at all. Appreciate your time and review!

>
> Le vendredi 23 octobre 2026 =C3=A0 15:55 +0800, Fei Shao a =C3=A9crit :
> > mtk_vdec_worker() peeks the source buffer with v4l2_m2m_next_src_buf().
> > If vb2_plane_vaddr() returns NULL because the buffer has no kernel
> > mapping, the worker finishes the m2m job with the buffer still at the
> > head of the ready list. v4l2_m2m_job_finish() then schedules the same
> > job again, which fails the same way, so the decoder never makes
> > progress.
> >
> > Remove the buffer from the ready list so that the job is not scheduled
> > again, and return it with VB2_BUF_STATE_ERROR so that userspace gets it
> > back. Print the error before that, as the buffer must not be touched
> > once it is returned.
> >
> > Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video=
 Decoder Driver")
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> >
> > ---
> >
> > (no changes since v1)
> >
> >  .../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c         | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_=
dec_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_=
dec_stateful.c
> > index aa9bdee7a96c..a4cbb7c76998 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teful.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_sta=
teful.c
> > @@ -348,9 +348,11 @@ static void mtk_vdec_worker(struct work_struct *wo=
rk)
> >       buf.dma_addr =3D vb2_dma_contig_plane_dma_addr(&src_buf->vb2_buf,=
 0);
> >       buf.size =3D (size_t)src_buf->vb2_buf.planes[0].bytesused;
> >       if (!buf.va) {
> > -             v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
> >               mtk_v4l2_vdec_err(ctx, "[%d] id=3D%d src_addr is NULL!!",=
 ctx->id,
> >                                 src_buf->vb2_buf.index);
> > +             v4l2_m2m_src_buf_remove(ctx->m2m_ctx);
> > +             v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
> > +             v4l2_m2m_job_finish(dev->m2m_dev_dec, ctx->m2m_ctx);
>
> I did some research as all this felt very late and defensive. My conclusi=
on is
> that you should validate this in vb2ops_vdec_buf_prepare() (mtk_vcodec_de=
c.c).
> This will let you remove this defensive check. Buffers that failed to map=
 (or
> unmappable/protected memory?) will simply not endup in the queue. It will=
 also
> give an immediate feedback to userspace.

Agreed. Early rejection, fewer manual checks and less code overall is
much better.
I sent v3 as a single patch:
https://lore.kernel.org/all/20261127-vcodec-null-va-v3-1-e24521086062@chrom=
ium.org/

Thanks,
Fei


>
> Nicolas
>
> >               return;
> >       }
> >       mtk_v4l2_vdec_dbg(3, ctx, "[%d] Bitstream VA=3D%p DMA=3D%pad Size=
=3D%zx vb=3D%p",

