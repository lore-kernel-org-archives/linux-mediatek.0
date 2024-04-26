Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5B3C04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 10:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjXJYA5Q88JBRncKCAE8ZYdsQF4jhAftI0NHQOw9IJE=; b=thHLQHRFt6br1BChJXV0zUXP30
	RHniuCK7DMfIYxUTk+zgW4Lk1nEeNO4vAX34mw0ef91MWQNha6LIBlEcBjvcuk3ggEYXgDMd2NK+O
	QX4RwU7JFTvFoSY16mRJp4zfQYfCLVEvCserPxHUluel+ceW1CN/EQWfFWhjmTCh5m1mbCQTO1VeQ
	sajxI31i8fNSqCS+VOthp858nE57yEqtcPLHPkgKnQtSp8Sz00+GBhllotyV/Sk5K23m1tvqthA5E
	YSFo/+kzjWRH6+tRci1KfP1offN1rAtlGRd4rCq3W1TaTOETFM+DwgQSPlBx304ZKywzjXtxqXSnV
	PcDWNZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IhR-0000000C7rw-3nEJ;
	Fri, 26 Apr 2024 10:21:01 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IhO-0000000C7pT-0EVl
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Apr 2024 10:20:59 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-dbed0710c74so1951483276.1
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Apr 2024 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714126856; x=1714731656; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjXJYA5Q88JBRncKCAE8ZYdsQF4jhAftI0NHQOw9IJE=;
        b=IQdsfHMhN1IkPa9ZuQnIY01eqz5yAs7ZdkGIXdUYxfUQgeLg7NoEHzNnWTURJ4HTdb
         Qb1q5ZU+GY/TvyPkp72SjOkg9tllOtcVYsw+mfAWKOQq/SsF8LUZ94ax8ToZt5p0229y
         mHda61HdvDCUA5AmSwTnC3u5B4mjHY9J/hWIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714126856; x=1714731656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjXJYA5Q88JBRncKCAE8ZYdsQF4jhAftI0NHQOw9IJE=;
        b=Fmwo10+Q71kVFURs7VYJt7UD6HB6g/oIOCaGWNBcfybtQXgoRCPDcMsdh1VC30zdl1
         jJ8DJYWNVDGkxvQa1seuvrJ1FjiMdeIBVmR5eVjxoowLS14xUHXMfk4qfWJZ8YwyxFlv
         vUXoNGfe1SAVMaGdIIFVa/mq6xWISlfTNC41Ny2TIYZzQsqM+xXlyz5W8cMXE/N5DoaR
         yEcQ3zUcx1Dwfz1fXDg4KGwCCoxU/K0AIip98ZsDE8CBF0A88igN2zwHNm7/jrLcYoJW
         /JV5AeElIomJp0aQPg3eNNAUdywz6DQBNEJBzL8lk7UvBMG2BqBuUIV14hyTvCaHXMqy
         c8fg==
X-Forwarded-Encrypted: i=1; AJvYcCUW6Qqlu9VNfV9DgIUylUjKR9DsPTnPUvX7ndL6ByXsmuZRpL7MybKI4BuzzpI9eVBsJOLYPk0gyu+qIj8exMuhqf6GTz/VZsSS4pLYGenbQU5h
X-Gm-Message-State: AOJu0Yw2Mf7pnc9uzYYCBoB9FP37k4ctFXEWbQNN6wOLFNyUq5JDuw15
	3tbpztHP0Iz54kq4RO+plVbxn6UF8aQloHmiQkb8aEF1BGx0+UgP4AhsQEM4UuTZEAEtqZJjeer
	bWzUIu0gzd1WHNJId5vjer0pPcKpuLoRcozo8
X-Google-Smtp-Source: AGHT+IHWnmyJ6qY0q7iyDyA3XOCFfbMc89g4bmjlOa0MiZ8jfng1uljxIs6yB4rlgqQh0CKOxXSCfqT44NRv/pXIOtM=
X-Received: by 2002:a25:800f:0:b0:dcb:e0dc:67ee with SMTP id
 m15-20020a25800f000000b00dcbe0dc67eemr2211823ybk.45.1714126856342; Fri, 26
 Apr 2024 03:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240422100354.1.I58b4456c014a4d678455a4ec09b908b1c71c3017@changeid>
 <022936a6704d08fbed22e7f241810d857eecaeda.camel@collabora.com> <CAD=FV=XSyLJiTCHYF7UaLersix0zP-q-MybW+nOR3A2WfccQcg@mail.gmail.com>
In-Reply-To: <CAD=FV=XSyLJiTCHYF7UaLersix0zP-q-MybW+nOR3A2WfccQcg@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 26 Apr 2024 18:20:20 +0800
Message-ID: <CAJ66y9FrpyzEwa1J=5L1OwRkrSBm308g8OZKnasYQcJYJpRbRA@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Alloc DMA memory with DMA_ATTR_ALLOC_SINGLE_PAGES
To: Doug Anderson <dianders@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei-Shun Chang <weishunc@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_032058_209072_AA5A131F 
X-CRM114-Status: GOOD (  38.65  )
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

Hi Nicolas,

On Tue, Apr 23, 2024 at 2:52=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Apr 22, 2024 at 11:27=E2=80=AFAM Nicolas Dufresne
> <nicolas.dufresne@collabora.com> wrote:
> >
> > Hi,
> >
> > Le lundi 22 avril 2024 =C3=A0 10:03 -0700, Douglas Anderson a =C3=A9cri=
t :
> > > As talked about in commit 14d3ae2efeed ("ARM: 8507/1: dma-mapping: Us=
e
> > > DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc"), it doesn't
> > > really make sense to try to allocate contiguous chunks of memory for
> > > video encoding/decoding. Let's switch the Mediatek vcodec driver to
> > > pass DMA_ATTR_ALLOC_SINGLE_PAGES and take some of the stress off the
> > > memory subsystem.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > NOTE: I haven't personally done massive amounts of testing with this
> > > change, but I originally added the DMA_ATTR_ALLOC_SINGLE_PAGES flag
> > > specifically for the video encoding / decoding cases and I know it
> > > helped avoid memory problems in the past on other systems. Colleagues
> > > of mine have told me that with this change memory problems are harder
> > > to reproduce, so it seems like we should consider doing it.
> >
> > One thing to improve in your patch submission is to avoid abstracting t=
he
> > problems. Patch review and pulling is based on a technical rational and=
 very
> > rarely on the trust that it helps someone somewhere in some unknown con=
text.
> > What kind of memory issues are you facing ? What is the technical advan=
tage of
> > using DMA_ATTR_ALLOC_SINGLE_PAGES over the current approach that helps =
fixing
> > the issue? I do expect this to be documented in the commit message itse=
lf=C3=A9.
>
> Right. The problem here is that I'm not _directly_ facing any problems
> here and I also haven't done massive amounts of analysis of the
> Mediatek video codec. I know that some of my colleagues have run into
> issues on Mediatek devices where the system starts getting
> unresponsive when lots of videos are decoded in parallel. That
> reminded me of the old problem I debugged in 2015 on Rockchip
> platforms and is talked about a bunch in the referenced commit
> 14d3ae2efeed ("ARM: 8507/1: dma-mapping: Use
> DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc") so I wrote up
> this patch. The referenced commit contains quite a bit of details
> about the problems faced back in 2015.
>
> When I asked, my colleagues said that my patch seemed to help, though
> it was more of a qualitative statement than a quantitative one.

The story behind this is that I'm looking into an issue on the MediaTek
MT8188 Chromebook, where in some scenarios the system may emit 30+
video decoders concurrently (e.g. generating thumbnails for excess
amount of video files etc.), and such behavior can easily hang the
system if it has a smaller amount of memory (<4GB).

In addition to seeking mitigation in the user space software side,
we're also looking for ways to optimize how the video decoders use
memory, so Doug suggested this improvement.
My preliminary experiment showed that it has some positive impact -
the system doesn't freeze up completely with it and is still
responsive in the UART serial console. However, just like mentioned, I
didn=E2=80=99t have any rigorous numbers to support it.

To test the patch better, today I set up a local WebRTC demo to
simulate a video conference with 49 people where the mocked input
stream is captured from the device's own front camera.
With that, the original system easily hung in less than one minute
with less than 40MB available memory at the time; but with the change,
the system ran for several minutes and had an average of over 100MB
memory. It's not a huge improvement, but it's something.

I know this isn't the most scientific experiment, but I hope it=E2=80=99s a
good enough representation of one of the multi video decoder use
cases, and gives you some confidence that the patch is worth merging.

With the test above I think I can give this:
Tested-by: Fei Shao <fshao@chromium.org>

And, since this patch LGTM and I support it, here's my humble
Reviewed-by: Fei Shao <fshao@chromium.org>

Regards,
Fei

>
> I wasn't 100% sure if it was worth sending the patch up at this point,
> but logically, I think it makes sense. There aren't great reasons to
> hog all the large chunks of memory for video decoding.
>
> -Doug

