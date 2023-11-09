Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95487C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 04:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTb319PKi1K5hE3fGXAxhdTNxkLrwLwVOwF53ZkG1AY=; b=qtwyp6tqaVdR41gYIgrSswPDWY
	YFpYnWqLDVX8IJcC/gnwXHp7zJE0YX7bs6qiRoca19DowxRZTvOCTilSgQ95zM/BkZ/KTXe/Eiefv
	h60e41/NOKnqf3jTczle6CxKKuLTFSKug0/K3a/y8cyWiTEpZ8IA/fIHV4/jRjlazwo0Hm+oT28dh
	pJDl1oDOVlq0W0njtvlWZ+U9Lq9TrkHGR+Nh3yKVVbpxuQn0XwxISUPEB+pKTyvA7fWsoCYGL/1q4
	jlAc8+hTOuloiPNg6C8ESi14r2hpNTIgfPCeD+ML3cFGtA88gl6yFDb9U6400+sOdV7Ei4CmDEIjb
	A/BYQr/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0wjM-005G6Y-1G;
	Thu, 09 Nov 2023 04:33:24 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0wjJ-005G5x-1F
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 04:33:22 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9bf86b77a2aso74305466b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Nov 2023 20:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699504397; x=1700109197; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTb319PKi1K5hE3fGXAxhdTNxkLrwLwVOwF53ZkG1AY=;
        b=f/fJn4hbZBX89T8FTmsJNC/P3KHPj7F1ZQC+LcUO2ARn4+iv83fbSQEw+z1ej1CBxF
         V9XEMFOr8h+HEa1Qv+5chFMy+vx7q38aYy6PCx6ZJKmE0Ef9/4S44eJXqGf88DK0qSxk
         wDHDM9uispcezYGU/ozfA+sBnkvz682XnnwvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699504397; x=1700109197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTb319PKi1K5hE3fGXAxhdTNxkLrwLwVOwF53ZkG1AY=;
        b=TvCnv8sQfFAmIHX1aB6Ywez4Poxsq5gTKKaisPslrM6CDbY0NXS0s8cIe9rmRB5wpe
         2fml+edEWrIcuFdyVUXqJMTd9cgiRJ4t9I/Tu5cDSBzMd3dWe47dOpbwvX3dv9UNezT2
         vsI7oSsRggCpsmwtcIWdcvKSW1m/3aMIDGIMhCKvBLjOr9wtEFCV+8g5m1c+CosTOz9r
         eyV3u5PRYlUXiPuC+N4EGkIatRSQHjKJrlF6cNRS4Lw2Z4mbcXPr3G8jsKo4SKFlgMKg
         2E8Q6St9TiOGhb4GeZT2gkfrwtujruK6jHkOgipAJEORDOjsg3v62BApv2Jz0qvI/8tA
         kehA==
X-Gm-Message-State: AOJu0YwV3ALBlUhvn2JQGyKygZOyV3iMLKHkHLQvYaI63DKgP7BLUoF1
	bAZcVdiF2ZmFaHapBYmScZjAkemwNMUK6GEfPQLI6Zed+QU=
X-Google-Smtp-Source: AGHT+IHEW/1mmiVKeLchbB6Tu5JM82+D9HM1Bg02SlnzPbdETUgGMRZnhpP6Au4zQRgQ4OwSDwOchg==
X-Received: by 2002:a17:906:1c07:b0:9e4:6ebc:dff7 with SMTP id k7-20020a1709061c0700b009e46ebcdff7mr1186738ejg.61.1699504397235;
        Wed, 08 Nov 2023 20:33:17 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id fx15-20020a170906b74f00b009bf94de8971sm1992238ejb.70.2023.11.08.20.33.17
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 20:33:17 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9d242846194so72881966b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Nov 2023 20:33:17 -0800 (PST)
X-Received: by 2002:a05:600c:4ecd:b0:405:7400:1e3d with SMTP id
 g13-20020a05600c4ecd00b0040574001e3dmr3298654wmq.32.1699504062425; Wed, 08
 Nov 2023 20:27:42 -0800 (PST)
MIME-Version: 1.0
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-6-benjamin.gaignard@collabora.com> <20231108085016.3kmhmdroh4qs53f5@chromium.org>
 <795ef94f-23d3-433e-b5a3-0a2e0ab7a18c@collabora.com>
In-Reply-To: <795ef94f-23d3-433e-b5a3-0a2e0ab7a18c@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 9 Nov 2023 13:27:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Dd_w50ppjy1_wQ2yX+Qj0mOMWbhJKsJ7Cq6zYsQ+GwyQ@mail.gmail.com>
Message-ID: <CAAFQd5Dd_w50ppjy1_wQ2yX+Qj0mOMWbhJKsJ7Cq6zYsQ+GwyQ@mail.gmail.com>
Subject: Re: [PATCH v14 05/56] media: videobuf2: Access vb2_queue bufs array
 through helper functions
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, m.szyprowski@samsung.com, ming.qian@nxp.com, 
	ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, 
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_203321_449457_C27C7C1B 
X-CRM114-Status: GOOD (  24.54  )
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

On Wed, Nov 8, 2023 at 7:24=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 08/11/2023 =C3=A0 09:50, Tomasz Figa a =C3=A9crit :
> > On Tue, Oct 31, 2023 at 05:30:13PM +0100, Benjamin Gaignard wrote:
> >> This patch adds 2 helpers functions to add and remove vb2 buffers
> >> from a queue. With these 2 and vb2_get_buffer(), bufs field of
> >> struct vb2_queue becomes like a private member of the structure.
> >>
> >> After each call to vb2_get_buffer() we need to be sure that we get
> >> a valid pointer in preparation for when buffers can be deleted.
> >>
> >> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> >> ---
> >>   .../media/common/videobuf2/videobuf2-core.c   | 151 +++++++++++++---=
--
> >>   .../media/common/videobuf2/videobuf2-v4l2.c   |  50 ++++--
> >>   2 files changed, 149 insertions(+), 52 deletions(-)
> >>
> >> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers=
/media/common/videobuf2/videobuf2-core.c
> >> index 968b7c0e7934..b406a30a9b35 100644
> >> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> >> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> >> @@ -408,6 +408,31 @@ static void init_buffer_cache_hints(struct vb2_qu=
eue *q, struct vb2_buffer *vb)
> >>              vb->skip_cache_sync_on_finish =3D 1;
> >>   }
> >>
> >> +/**
> >> + * vb2_queue_add_buffer() - add a buffer to a queue
> >> + * @q:      pointer to &struct vb2_queue with videobuf2 queue.
> >> + * @vb:     pointer to &struct vb2_buffer to be added to the queue.
> >> + * @index: index where add vb2_buffer in the queue
> >> + */
> >> +static void vb2_queue_add_buffer(struct vb2_queue *q, struct vb2_buff=
er *vb, unsigned int index)
> >> +{
> >> +    WARN_ON(index >=3D VB2_MAX_FRAME || q->bufs[index]);
> > nit: Would it make sense to also ensure that vb->vb2_queue is NULL?
>
> Since vb->vb2_queue and q->bufs[index] are always set and clear in the sa=
me
> functions I don't think it is useful to test the both here.
>

Well, they are if the caller is not buggy. But I suppose the check is
to detect buggy callers?

For example, an m2m driver could accidentally call this on a buffer
that was already added to another queue.

Best regards,
Tomasz

