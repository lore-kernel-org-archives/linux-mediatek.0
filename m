Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D436C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Apr 2024 19:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqHcqubpcdGYAMy1VnzK8VjEKBwDIL3z9gbkSQbzIqc=; b=e3AeyITcFWfjIGCWN7gFFDWhP5
	BNiVLi89mnyCtEOpjYnuUWJ3ULrWFW2Zk/2KCQzRfzJWUFdSP3m30jaz7lFZIPe57Cu0P8ZWQg4vW
	ZO/YTA2JbvS9KW42wodWOjrR5fQL62ElcLJSfW4ATnU7EIqq2+m0YdEl89Dn/CW/Nj9URv57Y2UpE
	Rfcbg0K5WJESX9nELxk0/JwvrkcIyPN70SOXl/TK4KanVQzX2ciIuXJ1y84gZKyLhvOxsNef/92gv
	LlRv2BQFzcfTGPO3Nelp6D2MmzQZSCAaSGZrZjh5BtPMBKqlmmUQQV+vvDeqXYKoSSTz3ZfymX7Rb
	2AxEhsog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryzIl-0000000EnMN-4BOO;
	Mon, 22 Apr 2024 19:26:08 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryzIi-0000000EnLG-2FFN
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Apr 2024 19:26:06 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5aa241232faso3613779eaf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Apr 2024 12:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713813961; x=1714418761; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqHcqubpcdGYAMy1VnzK8VjEKBwDIL3z9gbkSQbzIqc=;
        b=ApRbx51ouYvOjIDjNzBl4tWD8IxwAOofyTS+Z4TqtN96mcMLajVBdyCamQ56gw89JN
         gM2Qc3BVs4Q1lwyaZ+Tbc1UQV3B8hlRFGpJcEpCckL0lgslBJBDXcGXFAEDCoKvXSzzx
         HS+7KRIFQ5TERJCjLMUDnjLZlgIGxzHAONQ9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713813961; x=1714418761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqHcqubpcdGYAMy1VnzK8VjEKBwDIL3z9gbkSQbzIqc=;
        b=YDo0PhMXZspdBcXYuYaHGlmzvBVnWuKZx6pUhxCEstTKBuJHvXwPuNUwOXXnyQmoqc
         nSi07hJxlbUl2GBbFdH0txWjnkAzi4zN+4NytkYs4Vso3QaXBhmYdmbsCioONb4FVqaq
         ikmvClGKLQQDEw0fGEpt1QYWZ+yCErNf8MVqHgBpTWwlAQcsaLtecCVGlma1hNvCFptR
         b/7q7kMMAqskiW3QcTauHjRdUaNYe8LZozbG5LfZNhjT/DsSd9mrqOBLgkOIPyGLDdJ5
         aLPRo3+WHmjZXYcNPND4WIdqMb5uZ1XiGDLOxqdrb7ET2GYuB7dNpeAYs1zGCb5qGsl0
         ST7A==
X-Forwarded-Encrypted: i=1; AJvYcCWMisX6Y4aRj8bhMsGJokC6iVxqsHP3zoTs4S0ZkIZHUDfZ7Mprt+aJchE4yxDubNLX4bQ41url2Ky7Rdh8ZReGdNtuEKrmHreemQ8d1ZOj9Hhb
X-Gm-Message-State: AOJu0YzIksl6aOb8RRp5SoJFeTav7jCeS+E21a8NuXLXeFUIyd32mvDo
	90XewpLoasC0q3Yl+k2kliYLZ/ahAoVG73fP21PpZo7Ln+UEVZ+2hJQTD/izPfjVkp8sSJbvWtE
	=
X-Google-Smtp-Source: AGHT+IHUfGyckwcNubArwvON7HwrYoqSN+J+sOPE+vxQCodet6Skj/+hgm/Ea9e+qNudbxYioLOhzw==
X-Received: by 2002:a05:6358:7295:b0:17e:d8fe:be45 with SMTP id w21-20020a056358729500b0017ed8febe45mr15586389rwf.8.1713813961272;
        Mon, 22 Apr 2024 12:26:01 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id h13-20020ac8776d000000b004397cede9d4sm2288612qtu.19.2024.04.22.12.26.00
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 12:26:01 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-436ed871225so561cf.1
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Apr 2024 12:26:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5vmEgPF4nk+KkBV0sx2Pwr9TgZi5ezCrDWrWGbs1ZF0NmrKiyjXB7V0MQXFEgf8t+h3PZ/1hXyeTadFegyUOkgTfeVFtnRA/+yC3I39gGY6Gr
X-Received: by 2002:ac8:4dca:0:b0:438:d778:5b17 with SMTP id
 g10-20020ac84dca000000b00438d7785b17mr47685qtw.12.1713813960387; Mon, 22 Apr
 2024 12:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240422100354.1.I58b4456c014a4d678455a4ec09b908b1c71c3017@changeid>
 <022936a6704d08fbed22e7f241810d857eecaeda.camel@collabora.com>
In-Reply-To: <022936a6704d08fbed22e7f241810d857eecaeda.camel@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 22 Apr 2024 12:25:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XSyLJiTCHYF7UaLersix0zP-q-MybW+nOR3A2WfccQcg@mail.gmail.com>
Message-ID: <CAD=FV=XSyLJiTCHYF7UaLersix0zP-q-MybW+nOR3A2WfccQcg@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Alloc DMA memory with DMA_ATTR_ALLOC_SINGLE_PAGES
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
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
X-CRM114-CacheID: sfid-20240422_122604_618873_31C17159 
X-CRM114-Status: GOOD (  26.79  )
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

On Mon, Apr 22, 2024 at 11:27=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi,
>
> Le lundi 22 avril 2024 =C3=A0 10:03 -0700, Douglas Anderson a =C3=A9crit =
:
> > As talked about in commit 14d3ae2efeed ("ARM: 8507/1: dma-mapping: Use
> > DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc"), it doesn't
> > really make sense to try to allocate contiguous chunks of memory for
> > video encoding/decoding. Let's switch the Mediatek vcodec driver to
> > pass DMA_ATTR_ALLOC_SINGLE_PAGES and take some of the stress off the
> > memory subsystem.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > NOTE: I haven't personally done massive amounts of testing with this
> > change, but I originally added the DMA_ATTR_ALLOC_SINGLE_PAGES flag
> > specifically for the video encoding / decoding cases and I know it
> > helped avoid memory problems in the past on other systems. Colleagues
> > of mine have told me that with this change memory problems are harder
> > to reproduce, so it seems like we should consider doing it.
>
> One thing to improve in your patch submission is to avoid abstracting the
> problems. Patch review and pulling is based on a technical rational and v=
ery
> rarely on the trust that it helps someone somewhere in some unknown conte=
xt.
> What kind of memory issues are you facing ? What is the technical advanta=
ge of
> using DMA_ATTR_ALLOC_SINGLE_PAGES over the current approach that helps fi=
xing
> the issue? I do expect this to be documented in the commit message itself=
=C3=A9.

Right. The problem here is that I'm not _directly_ facing any problems
here and I also haven't done massive amounts of analysis of the
Mediatek video codec. I know that some of my colleagues have run into
issues on Mediatek devices where the system starts getting
unresponsive when lots of videos are decoded in parallel. That
reminded me of the old problem I debugged in 2015 on Rockchip
platforms and is talked about a bunch in the referenced commit
14d3ae2efeed ("ARM: 8507/1: dma-mapping: Use
DMA_ATTR_ALLOC_SINGLE_PAGES hint to optimize alloc") so I wrote up
this patch. The referenced commit contains quite a bit of details
about the problems faced back in 2015.

When I asked, my colleagues said that my patch seemed to help, though
it was more of a qualitative statement than a quantitative one.

I wasn't 100% sure if it was worth sending the patch up at this point,
but logically, I think it makes sense. There aren't great reasons to
hog all the large chunks of memory for video decoding.

-Doug

