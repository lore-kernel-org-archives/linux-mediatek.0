Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32A8C47074
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 20:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvEetwkb9xaGP1xb5l25SZewPP7nYFLZIpeTOK182Ek=; b=Yssqx5/hqZZcnpjt4ZkCdOXwIw
	xmXfLSE0MZLZm2BEWo8MW68t5/3U7y8odaQYwGHd8ETUCjcCtP45eWpXwEGYrzzoSfZyFAyGq7nYK
	RCk615t7U1tDKQGLCFAgY5cvxgkzGIfZlrt5c8+cyG1BVqgJNGzO1lovhQc+cIDUq+mj6yQloZXeu
	eXp0GEY8vRSq6qp0cLVX1HRFgiO6Dh9WbdnMhT3Ad82gM/slA8xmEBbuUTcGwPO3m6KwL2aoBo0Ph
	Qfgc4SqFCPBRAsxhxE14oxJVGVIC2i33PIrBxPurHcGrNZDwhWxnrl/N8GW7Hoxf6VqS1n4Z/z4fM
	nH+Zc+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTyY-00F9L7-3C;
	Thu, 04 Jan 2024 20:05:58 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLTyV-00F9JM-2H
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jan 2024 20:05:57 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1d3ea8d0f9dso30245ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Jan 2024 12:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704398751; x=1705003551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvEetwkb9xaGP1xb5l25SZewPP7nYFLZIpeTOK182Ek=;
        b=nd3UwoFtFeDuKMBxt2idqVtHXWVHyJgwpvoCVLcAfb2e1P/yN47X9P/Gd/OtB9LH8e
         Dbq/qa6Ey6NvR+Shp9R0FcYsnI0qbkuLYh09djPyf0A/jg2Omp9lGnkFUKG7nKuaV79c
         G+QFXAXkk8GhCLDnDMRL9f0q5iyCA0+OvMEAMPOydq/whbm71Lg+xv2pU+ZoKK3lbQu4
         5DWPXaa3DB9PcZVUBZvt9LPAhjse6aeo6J0C31iR4DW1ndFkhZo24XnphoIrk8opT6tk
         luuAsN0q/fUFO9Ys3EdCX8Q2ZO2fWSJBNq0yqKqpwaZn51Xbo5/V4BzetYPBhsqi8WxN
         p+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704398751; x=1705003551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvEetwkb9xaGP1xb5l25SZewPP7nYFLZIpeTOK182Ek=;
        b=YY+10c9YKW6HMOi76JN4RoUA3corbkMYz967L7GbnK7LY6tk7qWZANL3/pexwKZQUP
         7kAqsJ10LzRwaYt9n1cKdOpjBqNGU8VpDPsvn37yqqXnROmvWnTs1mecNhQypfoBXoIi
         Jn0UE1+80xRtaclKU9ch33YOB0QFMBWyzGth5OegsQc4/5MbUovq4lE5K4drrcNzeSQS
         Z7qP9uYM7bMSSaSX+gXptkccAgDBIesfoQ5CvZggppW3QhezXbVlndnM/rMyfqnsN69r
         /LZ7I46cOkQMNajkqNbaWfFZQFCsXrDHv6j7+QLfOz+XruWo+d5c0/crszY55p9bZ4HB
         lu1g==
X-Gm-Message-State: AOJu0Yxfg0Eh913++CwXYfXKTvR9h78ULKQSG1N6qB/K/3RwxiTwT+W6
	7lS6v0pyiUGpph3eCqdxf+DmjSBBlnAyym+3G5SnX872Jow=
X-Google-Smtp-Source: AGHT+IFtpK9YJeU2jGd3Bpf25IdYM4Caale+wmgEjoLqzqnOsTKnfaX9VNsHJOZHlAHU0P2aZXIT9K2U0qLn/rFYSYA=
X-Received: by 2002:a17:902:fa50:b0:1d4:69a6:8a9d with SMTP id
 lb16-20020a170902fa5000b001d469a68a9dmr33072plb.19.1704398750899; Thu, 04 Jan
 2024 12:05:50 -0800 (PST)
MIME-Version: 1.0
References: <20231206081538.17056-1-yunfei.dong@mediatek.com>
 <20231206081538.17056-5-yunfei.dong@mediatek.com> <ce2110bf-a16a-45ae-979b-7e41be2896cd@xs4all.nl>
In-Reply-To: <ce2110bf-a16a-45ae-979b-7e41be2896cd@xs4all.nl>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Thu, 4 Jan 2024 12:05:39 -0800
Message-ID: <CA+ddPcM6nz0ufF5NXUq7E_vF6HnFKrEEag5iUDAknT6=hWTCNQ@mail.gmail.com>
Subject: Re: [PATCH v3,04/21] v4l: add documentation for secure memory flag
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
X-CRM114-CacheID: sfid-20240104_120555_743953_718E10A7 
X-CRM114-Status: GOOD (  20.74  )
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

On Mon, Dec 11, 2023 at 3:05=E2=80=AFAM Hans Verkuil <hverkuil-cisco@xs4all=
.nl> wrote:
>
> On 06/12/2023 09:15, Yunfei Dong wrote:
> > From: Jeffrey Kardatzke <jkardatzke@google.com>
> >
> > Adds documentation for V4L2_MEMORY_FLAG_SECURE.
> >
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  Documentation/userspace-api/media/v4l/buffer.rst | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documen=
tation/userspace-api/media/v4l/buffer.rst
> > index 52bbee81c080..a5a7d1c72d53 100644
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -696,7 +696,7 @@ enum v4l2_memory
> >
> >  .. _memory-flags:
> >
> > -Memory Consistency Flags
> > +Memory Flags
> >  ------------------------
> >
> >  .. raw:: latex
> > @@ -728,6 +728,12 @@ Memory Consistency Flags
> >       only if the buffer is used for :ref:`memory mapping <mmap>` I/O a=
nd the
> >       queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
> >       <V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> > +    * .. _`V4L2-MEMORY-FLAG-SECURE`:
> > +
> > +      - ``V4L2_MEMORY_FLAG_SECURE``
> > +      - 0x00000002
> > +      - DMA bufs passed into the queue will be validated to ensure the=
y were
> > +     allocated from a secure dma-heap.
>
> Hmm, that needs a bit more work. How about:
>
> - The queued buffers are expected to be in secure memory. If not, an erro=
r will be
>   returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``. Typic=
ally
>   secure buffers are allocated using a secure dma-heap. This flag can onl=
y be
>   specified if the ``V4L2_BUF_CAP_SUPPORTS_SECURE_MEM`` is set.
>

Thanks Hans. Yunfei, can you integrate this change into the patch please?

> In addition, the title of this table is currently "Memory Consistency Fla=
gs": that
> should be renamed to "Memory Flags".

Hans, the patch is already renaming the table as you suggested. :)
(unless there's some other spot I'm missing)
>
> Regards,
>
>         Hans
>
> >
> >  .. raw:: latex
> >
>

