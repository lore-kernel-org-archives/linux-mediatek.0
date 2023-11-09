Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4F7C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 07:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZGyCYYTcq3tfAOSXtV2/dw7L3jydVZ3P+lrWN5MQ7s=; b=F1e7JLeAg93iPspkmX+g5BqP3g
	FgprTqcak9cK3m1ZhofqTZDQkyQiiISKYJ7XDUfzzMbUxZqL/tQztWFm1r7qv6amkKXW4HtftUabE
	sqBq37F78xEKsHpHIWvHLUKLJyQlqJp3pdlMTv5z2ZNTGDP11Mhzw1YEAz21n0zmy21nNnWTZ9waY
	BLxjRIMa+I6mF97VPyWrmEqSk9Fufl9mbBWVS7ieXOf2mUD5WW1sPtoqkKuCpnCPQbKGFUPQCr5Sr
	+iK+z0xxzZ+nRt6v+7C1y03V2hjIpJ2IaSPZY5nKZUkc69K7wjyrN0/jpWcn/ZuncaDliDcM4r1nw
	C1drxYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0zT8-005VGO-0h;
	Thu, 09 Nov 2023 07:28:50 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0zT5-005VEg-1e
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 07:28:48 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9df8d0c556eso81467466b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Nov 2023 23:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699514921; x=1700119721; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZGyCYYTcq3tfAOSXtV2/dw7L3jydVZ3P+lrWN5MQ7s=;
        b=hMMvP1C0RwlAf+3uPvX7T1DeZ/LsulaL7rSos9xXmzSAO9WE+gzegu8UWefsD9kg+e
         s1N4ka3De9N5RcGvWZaoIdIZH6KqcYlkfXWcoY87Vd3WM40BDYZIzrDdn6TKSksX9QBT
         KYl8K/AwU/2NZOq+MjgnkzjGQpK2I7sqxH7cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699514921; x=1700119721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZGyCYYTcq3tfAOSXtV2/dw7L3jydVZ3P+lrWN5MQ7s=;
        b=JirqS4XKLbPozhUUBx8AAb+dB+oEk6UxJG/hBBXc2fhyxPIoAUF+ZK8p4sHsf2Pbrm
         lU4BgZgKOY+H61VJooluiJEkVPRTGFrP0mWrqKB/4e6rP/lquM2wQhcD3BJgGIKyCRCO
         cdUFUhfzlcr2v2A4YslPZTFAj6npUsM28u6BBiGHcTA/QvaktDZ4IjE6YBSiUpmnj6rN
         Bn3zhXVda8kvQcz5llif7agC4eaWHnUM3Wux9OfdnwOhLgc9tgypLr2WqvTVmz1xE7cK
         YWb6ZTOPPVGOnnL61/A//Y0nRgNnjOAms2mHR4rtRkF8YYpF4L+MrNo+4V2g1mSGJ4EQ
         3nGQ==
X-Gm-Message-State: AOJu0YzpZLX+PoZZPu0mHKYVt5c7hrgMXB+bShw1AOxyKez19FwtqIxB
	b2+GLiBFX7M6r3dQA9c7y1749TI26+GKUmFEc3IL0ExC
X-Google-Smtp-Source: AGHT+IHBv45XwZnZQYoeAnvxFVJfCvxP7PsB0ZuctG28qmsC4P+F1VJXN+eCKCHBsRNABlmFSsA49A==
X-Received: by 2002:a17:906:4fcc:b0:9ba:65e:7529 with SMTP id i12-20020a1709064fcc00b009ba065e7529mr3767144ejw.68.1699514921155;
        Wed, 08 Nov 2023 23:28:41 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id a17-20020a170906685100b009aa292a2df2sm2158453ejs.217.2023.11.08.23.28.40
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 23:28:41 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40790b0a224so3361355e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Nov 2023 23:28:40 -0800 (PST)
X-Received: by 2002:adf:e311:0:b0:32c:ea14:89e5 with SMTP id
 b17-20020adfe311000000b0032cea1489e5mr3220105wrj.39.1699514920620; Wed, 08
 Nov 2023 23:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20231031163104.112469-1-benjamin.gaignard@collabora.com>
 <20231031163104.112469-53-benjamin.gaignard@collabora.com>
 <20231108104439.oxpbbd2yro7u57t4@chromium.org> <e9eeac63-b4d5-4710-bb85-b0997dce55cc@collabora.com>
In-Reply-To: <e9eeac63-b4d5-4710-bb85-b0997dce55cc@collabora.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 9 Nov 2023 16:28:20 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AH6x461-a2=2JmzUhW2pWacgwj1w3SZH1kfMBbsmaZ3A@mail.gmail.com>
Message-ID: <CAAFQd5AH6x461-a2=2JmzUhW2pWacgwj1w3SZH1kfMBbsmaZ3A@mail.gmail.com>
Subject: Re: [PATCH v14 52/56] media: core: Add bitmap manage bufs array entries
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
X-CRM114-CacheID: sfid-20231108_232847_545749_BE86D704 
X-CRM114-Status: GOOD (  22.45  )
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

On Thu, Nov 9, 2023 at 12:30=E2=80=AFAM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
>
> Le 08/11/2023 =C3=A0 11:44, Tomasz Figa a =C3=A9crit :
> > On Tue, Oct 31, 2023 at 05:31:00PM +0100, Benjamin Gaignard wrote:
[snip]
> >> @@ -1150,7 +1150,10 @@ static inline bool vb2_fileio_is_active(struct =
vb2_queue *q)
> >>    */
> >>   static inline unsigned int vb2_get_num_buffers(struct vb2_queue *q)
> >>   {
> >> -    return q->num_buffers;
> >> +    if (!q->bufs_bitmap)
> >> +            return 0;
> >> +
> >> +    return bitmap_weight(q->bufs_bitmap, q->max_num_buffers);
> > Hmm, could we just cache the number of buffers we have, so that we don'=
t
> > have to go over the entire bitmap every time? (Basically just keep the
> > code that we had for handling q->num_buffers before this patch.)
>
> I would prefer no duplicate how the number of buffers in a queue is compu=
ted
> and bitmap offer helpers for that. Why not use it ?
>

bitmap_weight() can become costly when the number of buffers grows.
Since it's easy to track how many buffers we add and remove, we could
just cache that number and then any code could call
vb2_get_num_buffers() whenever it needs the buffer count without
caring how costly it is.

> >
> >>   }
> >>
> >>   /**
> >> @@ -1253,13 +1256,13 @@ static inline void vb2_clear_last_buffer_deque=
ued(struct vb2_queue *q)
> >>   static inline struct vb2_buffer *vb2_get_buffer(struct vb2_queue *q,
> >>                                              unsigned int index)
> >>   {
> >> -    if (!q->bufs)
> >> +    if (!q->bufs_bitmap)
> >>              return NULL;
> >>
> >>      if (index >=3D q->max_num_buffers)
> >>              return NULL;
> >>
> >> -    if (index < q->num_buffers)
> >> +    if (test_bit(index, q->bufs_bitmap))
> > Aha, I see why we need the extra condition above now. Perhaps it should=
've
> > been added in this patch instead?
>
> For me it was more explicit do introduce it at the same time that
> max_num_buffers field.

Okay. I don't have a strong opinion, especially since it was just an
intermediate patch.

Best regards,
Tomasz

