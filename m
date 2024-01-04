Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A73C47073
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 20:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5ZXdX4bS3ERPeQksYREtFg6egDHCXXKYTYbIsKvCx8=; b=3xEyh4trRNjbu6vlePd/TdYDFd
	ZQ5bWkvqaaLbIWNgUsOj7vi8FszivAhjLvpItC2mBlmiUw1ozsfSVjra6JukoJ49yFgBP5+BVdJvr
	hk4bGdXxgJagFZ5tb1uLGdTQH3ZyFZV9SHjMdzVSKUcu5Uj9CWaubCVomuMEy5untTCTLlSC5Igwe
	cSVk87DhxO729rnnlIRlUfZrTUFZnkzDoCwSbis/09bZMT9DJZZLDkIW76S60V6hFu6x7kDaNYZP5
	JActdSMTbTl4myZgsWsYYZbokQbpZQ0GhbxqWJBJRnwzjESx7TCbmTtr9xT0ilM7HEeN9fKxNYgr1
	5rJVD+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLU0K-00F9Ya-0Z;
	Thu, 04 Jan 2024 20:07:48 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLU0H-00F9YF-1i
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jan 2024 20:07:46 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d3ea8d0f9dso30605ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Jan 2024 12:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704398865; x=1705003665; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5ZXdX4bS3ERPeQksYREtFg6egDHCXXKYTYbIsKvCx8=;
        b=rOPb8g5kSB7ggbW1ybRpdWw+7TrdPaNhfzG8fgQq6C/UQ3TE17PumY+KE1XbobfwkI
         ewkkoIKp7clotjbMWhjHhsWK1NjixMx/RJAmUvPbA5DGWQN0Hg9DRKwStht6/xEw9Kbq
         4Vm2N7yK9SXaRG7kVIDG8TA3QpL/bS5Jk45rjj5FB95q58egV3f1sZbMa7LnZSLQzwoL
         LEiKPOfnDiPgz+X1iuSDZR9C9hr6qkFGn39sZj8kVMenFTijzWv7+uqT78EtLwC9w84z
         ZVj1cCfzo7SROV7gug4BIoV73Es+Oy7VvGbsqCD2GkiFoXuUX0h3OLG5irC6MubDNWaX
         h5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704398865; x=1705003665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f5ZXdX4bS3ERPeQksYREtFg6egDHCXXKYTYbIsKvCx8=;
        b=Jvs0FEXRqPo6+A2qz96P5mwJHplI+ObsEZrP1SC+n7UMefdGtT31nfSBjuNF8Kgkop
         GjG8J28JL77WHZ2KLKKlXOwVFaX5DZkOTGEKETsKpXZhdGSK+dEQD9Vogls4PiHnl/IT
         UGAR98kLusJ5eeOTqSn6UL2x6wcR3R/+tOM43diSR5lqNAq35VMpPE+Gi1J6WayTIuCr
         c85WpKd9jGrdKERffJXNuJ8NS9s+eADKsZ87QdSYQ8N94NZ7S8kVakLKDIyqgwgVf+P4
         BePlLbciF2dTKim0+TXWtMOZLz+mR2YWBsELsWfedVg9a8jai4T44u81OdwvqPriK0QW
         iGCg==
X-Gm-Message-State: AOJu0YwsIAPI1Gd6HA+RR+C2h8Mv7nBEjAEARBZ2YpfaEQvgUexjC5cf
	mb6qHd8MI8hWWkUnm8SPl8Du9mMI3ywmKBoTOy+SnSaQH10=
X-Google-Smtp-Source: AGHT+IE1vkesK4ZOVeDXSnQesWkwfg2DZNXrNfara5a0m92sCbqwWjRcDNy568hvPKmtKyTR34K9s+lngyphSHVzEeE=
X-Received: by 2002:a17:902:e884:b0:1d4:d462:f5a9 with SMTP id
 w4-20020a170902e88400b001d4d462f5a9mr38645plg.20.1704398864639; Thu, 04 Jan
 2024 12:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
 <20231206081538.17056-4-yunfei.dong@mediatek.com> <705ce6b0-e945-404c-8014-38881a01fbca@xs4all.nl>
In-Reply-To: <705ce6b0-e945-404c-8014-38881a01fbca@xs4all.nl>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Thu, 4 Jan 2024 12:07:32 -0800
Message-ID: <CA+ddPcPH+M=rnAzyPgq7rMUV2sAdCJ5xdEAncPUyTfspxswzjQ@mail.gmail.com>
Subject: Re: [PATCH v3,03/21] v4l2: verify secure dmabufs are used in secure queue
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_120745_568996_CB9CB621 
X-CRM114-Status: GOOD (  23.22  )
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

On Mon, Dec 11, 2023 at 2:58=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 06/12/2023 09:15, Yunfei Dong wrote:
> > From: Jeffrey Kardatzke <jkardatzke@google.com>
> >
> > Verfies in the dmabuf implementations that if the secure memory flag is
>
> Verfies -> Verifies

Thanks. Yunfei, change that please.
>
> > set for a queue that the dmabuf submitted to the queue is unmappable.
> >
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  drivers/media/common/videobuf2/videobuf2-dma-contig.c | 6 ++++++
> >  drivers/media/common/videobuf2/videobuf2-dma-sg.c     | 6 ++++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/dr=
ivers/media/common/videobuf2/videobuf2-dma-contig.c
> > index 3d4fd4ef5310..ad58ef8dc231 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
> > @@ -710,6 +710,12 @@ static int vb2_dc_map_dmabuf(void *mem_priv)
> >               return -EINVAL;
> >       }
> >
> > +     /* verify the dmabuf is secure if we are in secure mode */
> > +     if (buf->vb->vb2_queue->secure_mem && sg_page(sgt->sgl)) {
>
> This needs a bit more explanation. I guess that for secure memory
> sg_page returns NULL?

How about if we change it to:

/* verify the dmabuf is secure if we are in secure mode, this is done
by validating there is no page entry for the dmabuf */

>
> > +             pr_err("secure queue requires secure dma_buf");
> > +             return -EINVAL;
> > +     }
> > +
> >       /* checking if dmabuf is big enough to store contiguous chunk */
> >       contig_size =3D vb2_dc_get_contiguous_size(sgt);
> >       if (contig_size < buf->size) {
> > diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/driver=
s/media/common/videobuf2/videobuf2-dma-sg.c
> > index 28f3fdfe23a2..55428c73c380 100644
> > --- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > +++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
> > @@ -564,6 +564,12 @@ static int vb2_dma_sg_map_dmabuf(void *mem_priv)
> >               return -EINVAL;
> >       }
> >
> > +     /* verify the dmabuf is secure if we are in secure mode */
> > +     if (buf->vb->vb2_queue->secure_mem && !sg_dma_secure(sgt->sgl)) {
>
> I can't find the sg_dma_secure function. I suspect this patch series
> depends on another series?

That was an oversight, it should be the same as in
videobuf2-dma-contig.c. Yunfei, can you change this to match what's in
videobuf2-dma-contig.c after the comment is reworded?
>
> > +             pr_err("secure queue requires secure dma_buf");
> > +             return -EINVAL;
> > +     }
> > +
> >       buf->dma_sgt =3D sgt;
> >       buf->vaddr =3D NULL;
> >
>
> Regards,
>
>         Hans

