Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEC7CE79A9
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 23:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CBBvqgdHlaE7qrp16rL/k+TOy6ZHc5Otw9KkoIR3N0=; b=Hafms3mCtcJObRufjr/lZesNbS
	XxkXtCYb0qQYXtPoPxDgbcddrELQEfl1sWEnebqS5UxhS7Z0osDIIALS+rwIvWzR37jBSb+2WyMHy
	/1176NF0iWNU2v+VKe/oXR87bNBjy9mreUse+GNYRhQjJitHjFx/kvtHzdAFNJaybc1m2I44af/UC
	QcXJMgehfsIatZAgzYEqyCzby0ytXKwRtq4v2cnUeFSGNuKo1wKsh3GU5M/E5E/Az403deWAuZ7pv
	Ciz42+nDBVbFnh5Kcvdd67sNp+glQQEiRv+hfadK3bglBex+4waF/iUiJEpWNGb0xtIL4hiWN13Jc
	OWGDqutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qikHv-001T83-0O;
	Tue, 19 Sep 2023 23:37:51 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qikHr-001T6f-1C
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 23:37:49 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-34f1ffda46fso49555ab.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Sep 2023 16:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695166666; x=1695771466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CBBvqgdHlaE7qrp16rL/k+TOy6ZHc5Otw9KkoIR3N0=;
        b=ilR/CK/5bu4d3mEqeCsYewcshT0M4yexSBXwbI60VduaZh6C9+4POAcXnKnnL8r5wb
         sdAlo16Mq5S+85MSeLipWMWgel9Evmzq0L+cYxfwCDcYmPgV3Utt2qr8Gpa2BPHZd4QA
         gcCEXK1F+W6yYhmXEPni+3wSac4MvwN4NMF+xCt0VnKk4mUof0Wpwg54MPK5L5MaWx6t
         joXzA7yY7UYkTmEASUuHxyQa2WOaEIikK96rYHaz39O8jjicthsbznbx3o169aKUy6SE
         LL71ahgUzbZRtmhgMpF0HKfmChXZstlTBH7k87DNL26U7N0CxBg2KQDRjzIAIWqVchCg
         Y8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695166666; x=1695771466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3CBBvqgdHlaE7qrp16rL/k+TOy6ZHc5Otw9KkoIR3N0=;
        b=J6toBhwcnJKkwGX86CxFOR1MnCY92Bx1JXR98LfjptPvCp/DAG23KFIjAQ4sk2tMbS
         vz0UlwfmgLu5HX6HgG1g8dNP/TRpMb6tqNhbh3au2qQSaf+KNRaky8MfqoS5QjvQw6IF
         ewJnCWz1kRgR56+c33QIZBQm3Lujp7Giozex6EzMCXPj9nDll7YVPLW1oLeTo+dekvZ3
         a5gJ9G2eWcDRyIlHRu6ZrjQHuO01aG/bCzi0hBRN0Z9Tq72iaR+HVbiigWWFtT7jV4mF
         WoeQQSNB25Kofl3lw881VY5vazOSvn/iEi81b3beNyno4IH3LMkuGo7AN3ZPKUnJd2iE
         IiLg==
X-Gm-Message-State: AOJu0YwGR+AUDQCBLu6TFKrZ5MQeMjMPXevR0icgY1FmoMD+BTInvuCA
	MZfh8X4z9ebblHtv+OUJSOzWSwVxrRSVOHjLItEz
X-Google-Smtp-Source: AGHT+IEkj4ZxRK6CIppUtSGaqRy1AaoOr04YDLb3I3H35DnusOgqyPctNPG82NvpQQR2jBPAph/dtWVJ+aWn6Xi3hns=
X-Received: by 2002:a92:c56b:0:b0:34f:5587:4353 with SMTP id
 b11-20020a92c56b000000b0034f55874353mr45782ilj.25.1695166665921; Tue, 19 Sep
 2023 16:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230919030345.8629-1-jason-jh.lin@mediatek.com> <CAPj87rOHctwHJM-7HiQpt8Q0b09x0WWw_T4XsL0qT=dS+XzyZQ@mail.gmail.com>
In-Reply-To: <CAPj87rOHctwHJM-7HiQpt8Q0b09x0WWw_T4XsL0qT=dS+XzyZQ@mail.gmail.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Tue, 19 Sep 2023 16:37:30 -0700
Message-ID: <CA+ddPcMw0K-zkjW5LEHA4B81E25_HSVHVnEF67Lp0jGGNNUAxQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add mediate-drm secure flow for SVP
To: Daniel Stone <daniel@fooishbar.org>
Cc: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, 
	Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, 
	Nicolas Dufresne <nicolas.dufresne@collabora.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_163747_409654_A29A72A9 
X-CRM114-Status: GOOD (  40.28  )
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

On Mon, Sep 18, 2023 at 11:33=E2=80=AFPM Daniel Stone <daniel@fooishbar.org=
> wrote:
>
> Hi Jason, CK,
>
> On Tue, 19 Sept 2023 at 04:04, Jason-JH.Lin <jason-jh.lin@mediatek.com> w=
rote:
> > The patch series provides drm driver support for enabling secure video
> > path (SVP) playback on MediaiTek hardware in the Linux kernel.
> >
> > [...]
> >
> > Memory Usage in SVP:
> > The overall flow of SVP starts with encrypted video coming in from an
> > outside source into the REE. The REE will then allocate a 'secure
> > buffer' and send the corresponding 'secure handle' along with the
> > encrypted, compressed video data to the TEE. The TEE will then decrypt
> > the video and store the result in the 'secure buffer'. The REE will
> > then allocate a 'secure surface'. The REE will pass the 'secure
> > handles' for both the 'secure buffer' and 'secure surface' into the
> > TEE for video decoding. The video decoder HW will then decode the
> > contents of the 'secure buffer' and place the result in the 'secure
> > surface'. The REE will then attach the 'secure surface' to the overlay
> > plane for rendering of the video.
> >
> > Everything relating to ensuring security of the actual contents of the
> > 'secure buffer' and 'secure surface' is out of scope for the REE and
> > is the responsibility of the TEE.
> >
> > DRM driver handles allocation of gem objects that are backed by a 'secu=
re
> > surface' and for displaying a 'secure surface' on the overlay plane.
> > This introduces a new flag for object creation called
> > DRM_MTK_GEM_CREATE_ENCRYPTED which indicates it should be a 'secure
> > surface'. All changes here are in MediaTek specific code.
>
> To be honest, it seems strange that DRM is being used as the allocator
> for buffers which will mostly be used by codec hardware which is not
> mentioned here. I can understand that minigbm and gbm_gralloc make
> this easy to implement, but it's not really right to add this all to
> mtk-drm just to support some codec features.
The buffers allocated are used as the output for secure video decoding
and then rendering as well. So they aren't just used by the codec HW,
they're also used for display on the overlay plane.

And I'm the user of all the secure video path patches Mediatek has
been posting, this is for secure video playback on ChromeOS ARM
devices. (just mentioning so you know my context in this all)
>
> NXP posted a patchset a while ago to add secure-memory support to
> dma-heaps[0]. This would be much cleaner (e.g. avoiding strcmp on
> allocating name, avoiding mtk-drm being a render node when it can't
> render) I think, and also allow common secure-path semantics between
> different vendors.
>
Yes, I saw that now. I agree that having a common secure-path solution
is preferable. But the two issues you mention with this patchset
aren't directly related to the dma-buf heap implementation I think.

The ugly strcmp can be removed from this patchset...because it doesn't
actually need to check the heap name, it only ever invokes
mtk_drm_gem_create_from_heap for secure memory allocations...so that
should just be renamed mtk_drm_gem_create_from_secure_heap. The RENDER
flag can also be removed. IIUC, that's an artifact of how ChromeOS is
doing the allocations and that it's performing it on a render node.
That can be removed from this patchset and we can address that problem
on the ChromeOS side instead.

Going back to the NXP implementation...the main difference between
that one and what Mediatek is proposing (aside from all their vendor
specific naming of things) is that the NXP patchset does all the
allocation in the kernel itself and the kernel is handing out physical
addresses from the reserved range w/ no virtual address mapping. I
think that would mean you have to always allocate contiguous blocks,
which would be prone to fragmentation.  In the Mediatek
implementation, they are doing the allocations from the heap in the
TEE, so they can deal with physical memory fragmentation through
virtual addresses since they can do SG lists to allocate from
fragmented memory in the TEE.




> Having common secure-path semantics between different vendors would be
> very helpful, because the first question when we add new uAPI is
> 'where is the open-source userspace?'. If there is at least a common
> interface through e.g. dma-heaps, then we could have some standard
> cross-vendor userspace code which would work well with the standard
> interface.
>
Thanks for your feedback, I definitely want to work to get this to
something more usable by a wider range.

> Cheers,
> Daniel
>
> [0]: https://lore.kernel.org/lkml/20220805135330.970-2-olivier.masse@nxp.=
com/

