Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D907AC7EE25
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4tpowvLajrSGqwxArwQ8XTVeRE5lzXRcv/YtqNdBw4=; b=scsAOx4Be5jSQQZ+KMNO5mGv1o
	czu4juBeUQSaX5ygLIIf3sivKDEuyJU/Dr04TUfVODpvIyB2kEEXTUkG05YnqyZWyaOTC/YJldIeF
	OIi929Y4JtWr7QZzdggWLZXw3HXb8+MgAAMlTWKQYPYlVoq2bGrJWrrX9xrFf0CLumFju4Ld/Eu5z
	2AR5Etja19PdD8SjWMv+EiHZpyaitISYhaDPryMquplfe9iM1Yo8Ii3RIyS5qEVT58+kQk6pHbqdo
	xBTB1+jqviYwqyPSeg4HpnR3YelOlCGKhQ1cLtyKWS3Dd8jk9PMta2HuC10RKunSF/2h9/mr18CvO
	BbHz89RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7CpL-008pfg-0p;
	Thu, 08 Jun 2023 10:25:11 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7CpH-008pca-23
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jun 2023 10:25:09 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-62614f2eee1so3850086d6.0
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jun 2023 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686219901; x=1688811901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4tpowvLajrSGqwxArwQ8XTVeRE5lzXRcv/YtqNdBw4=;
        b=MTA84B0sr5UDGyDh5iVn5msSmAbrDm74UHfyejmOT+JGvEDf6wd4Is4XJesA/gh+/a
         XJqwzSWwyaifR7HuhXwN9A6CpAiG0Wbfa0lHg6Cz8rRrfoNOoxbQgveuYuIZwi65dPYk
         dVpMzwlSqrICOxm2BPty+v/UdVd/kKV9aTz+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686219901; x=1688811901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4tpowvLajrSGqwxArwQ8XTVeRE5lzXRcv/YtqNdBw4=;
        b=UjJgnQr1jRpYvmtbyM0Nxxh7akqQvSTEOmABzmalouvgXIuhC+oS0aa2c1SynnyUUA
         ufnc9XZ+5XKrHQ/mFXBA+R3/JL5BBoAae4imeOtk1egGv48W2WDHVvZzitBCG3NWwdx2
         f5sf8bHh5Sfbf/yeU52h1z8ck0/f/BILnN7uNKCLFTrT+Snp/NY2Z440CLIqgLQwWjsI
         hrqmUkxFPXyqzsbHP1MEfdTpIUlbPxUOcL2MS52NA0X2Nqlg7K33cu9mRXOSpmz4F7Nx
         lfasni7zDC7Vv1JezGua/WZDFFPj6sAOQOLNonXWC/zwArI280ogLBIEM7Fkk2pSqSDf
         YIhQ==
X-Gm-Message-State: AC+VfDz/o4X84tv1BeqEprauDQ0OxCopUWWiBxuOu/wZkY1VfouOK/1y
	zl5CvDuv0hk/YTsfwhwsxZDhlHBvP4+jXZPJ4iXaBg==
X-Google-Smtp-Source: ACHHUZ4SpyFPiZEj4l3ZJlwrXmJMUnubmj6gt0hlewriSi+badW+AtdObTku4kMwIVGuhTMaI3KP8Q==
X-Received: by 2002:a05:6214:1c42:b0:61b:5e9b:a15d with SMTP id if2-20020a0562141c4200b0061b5e9ba15dmr1209812qvb.36.1686219901293;
        Thu, 08 Jun 2023 03:25:01 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id ey14-20020a05622a4c0e00b003f98ccee846sm226491qtb.75.2023.06.08.03.25.01
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 03:25:01 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-3f9baa69682so4034461cf.3
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Jun 2023 03:25:01 -0700 (PDT)
X-Received: by 2002:ad4:5f0e:0:b0:623:690c:3cd7 with SMTP id
 fo14-20020ad45f0e000000b00623690c3cd7mr1200397qvb.47.1686219880090; Thu, 08
 Jun 2023 03:24:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230321102855.346732-1-benjamin.gaignard@collabora.com>
 <20230321102855.346732-4-benjamin.gaignard@collabora.com> <6c4658fd-3a64-b3f8-67cd-17ed2d7d3567@xs4all.nl>
 <20230531080331.GB6496@pendragon.ideasonboard.com> <608ae7d6-3f3b-137d-08d2-d41a240be2c4@xs4all.nl>
 <20230531123945.GF27043@pendragon.ideasonboard.com>
In-Reply-To: <20230531123945.GF27043@pendragon.ideasonboard.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 8 Jun 2023 19:24:29 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A6sz1BhEjiWyXH6B1TBTLt0ivAc6N0Vd73hebnpc7fKQ@mail.gmail.com>
Message-ID: <CAAFQd5A6sz1BhEjiWyXH6B1TBTLt0ivAc6N0Vd73hebnpc7fKQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] media: videobuf2: Add a module param to limit vb2
 queue buffer storage
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, m.szyprowski@samsung.com, 
	mchehab@kernel.org, ming.qian@nxp.com, shijie.qin@nxp.com, eagle.zhou@nxp.com, 
	bin.liu@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, tiffany.lin@mediatek.com, 
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, 
	stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com, agross@kernel.org, 
	andersson@kernel.org, konrad.dybcio@linaro.org, ezequiel@vanguardiasur.com.ar, 
	p.zabel@pengutronix.de, daniel.almeida@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_032507_678405_0AF0C55B 
X-CRM114-Status: GOOD (  43.59  )
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

On Wed, May 31, 2023 at 9:39=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, May 31, 2023 at 10:30:36AM +0200, Hans Verkuil wrote:
> > On 5/31/23 10:03, Laurent Pinchart wrote:
> > > On Wed, May 31, 2023 at 08:36:59AM +0200, Hans Verkuil wrote:
> > >> On 21/03/2023 11:28, Benjamin Gaignard wrote:
> > >>> Add module parameter "max_vb_buffer_per_queue" to be able to limit
> > >>> the number of vb2 buffers store in queue.
> > >>>
> > >>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > >>> ---
> > >>>  drivers/media/common/videobuf2/videobuf2-core.c | 15 +++----------=
--
> > >>>  include/media/videobuf2-core.h                  | 11 +++++++++--
> > >>>  2 files changed, 12 insertions(+), 14 deletions(-)
> > >>>
> > >>> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/driv=
ers/media/common/videobuf2/videobuf2-core.c
> > >>> index ae9d72f4d181..f4da917ccf3f 100644
> > >>> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> > >>> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> > >>> @@ -34,6 +34,8 @@
> > >>>  static int debug;
> > >>>  module_param(debug, int, 0644);
> > >>>
> > >>> +module_param(max_vb_buffer_per_queue, ulong, 0644);
> > >>
> > >> There is no MODULE_PARM_DESC here? Please add. I see it is not there=
 for
> > >> the debug param either, it should be added for that as well.
> > >
> > > Would this be the right time to consider resource accounting in V4L2 =
for
> > > buffers ? Having a module parameter doesn't sound very useful, an
> > > application could easily allocate more buffers by using buffer orphan=
ing
> > > (allocating buffers, exporting them as dmabuf objects, and freeing th=
em,
> > > which leaves the memory allocated). Repeating allocation cycles up to
> > > max_vb_buffer_per_queue will allow allocating an unbounded number of
> > > buffers, using all the available system memory. I'd rather not add a
> > > module argument that only gives the impression of some kind of safety
> > > without actually providing any value.

Good point. It's even simpler, just keep opening new vim2m instances
and requesting max buffers :).

> >
> > Does dmabuf itself provide some accounting mechanism? Just wondering.
> >
> > More specific to V4L2: I'm not so sure about this module parameter eith=
er.
> > It makes sense to have a check somewhere against ridiculous values (i.e=
.
> > allocating MAXINT buffers), but that can be a define as well. But other=
wise
> > I am fine with allowing applications to allocate buffers until the memo=
ry
> > is full.
> >
> > The question is really: what is this parameter supposed to do? The only
> > thing it does is to sanitize unlikely inputs (e.g. allocating MAXINT bu=
ffers).
> >
> > I prefer that as a define, to be honest.
> >
> > I think it is perfectly fine for users to try to request more buffers t=
han
> > memory allows. It will just fail in that case, not a problem.
> >
> > And if an application is doing silly things like buffer orphaning, then=
 so
> > what? Is that any different than allocating memory and not freeing it?
> > Eventually it will run out of memory and crash, which is normal.
>
> Linux provides APIs to account for and limit usage of resources,
> including memory. A system administrator can prevent rogue processes
> from starving system resources. The memory consumed by vb2 buffer isn't
> taken into account, making V4L2 essentially unsafe for untrusted
> processes.

I agree that proper accounting would be useful, although I wouldn't
really make this patch series depend on it, since it's not introducing
the loophole in the first place.
We had some discussion about this in ChromeOS long ago and we thought
it would be really useful for killing browser tabs with big videos,
but otherwise using very little regular memory (e.g. via javascript).

One challenge with accounting V4L2 allocations is how to count shared
DMA-bufs. If one process allocates a V4L2 buffer, exports it to
DMA-buf and then sends it to another process that keeps it alive, but
frees the V4L2 buffer (and even closes the DMA-buf fd), should that
memory be still accounted to it even though it doesn't hold a
reference to it anymore?

>
> Now, to be fair, there are many reasons why allowing access to v4L2
> devices to untrusted applications is a bad idea, and memory consumption
> is likely not even the worst one. Still, is this something we want to
> fix, or do we want to consider V4L2 to be priviledged API only ? Right
> now we can't do so, but with many Linux systems moving towards pipewire,
> we could possibly have a system daemon isolating untrusted applications
> from the rest of the system. We may thus not need to fix this in the
> V4L2 API.
>
> --
> Regards,
>
> Laurent Pinchart

