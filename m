Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A0DC77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 10:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrHrY3AWtq70CRoLtNhxsvgCg243JPmz7/kyzBYJpQA=; b=0NKG8Cqd7k5zaqofA5z8ZJXYi9
	xyA03WZhCRzkVY2p3TqyhEseD53IgMismlDdmG0u56UZqOiFPI6tqQbZhU4/92iHEaL8RRXODkYod
	DH7rHBYKvnUfuFJVnNsFEp+zMXaAxNTtmtuZmPQW5NLSyJajq9DxoM/DRpiZStHJjuGcqRG88caZe
	p50px+5PXxhvlKvz8GTVbY0hGEtoyGY5HIErXFNTIAsWzxmf4Bs59oo0dNnSzyafUDoi7mmWoh7BL
	KRVqXHNby2lhVXh7JREYjsi9KzwheF6HFzIlpKD2fLeXV+yG+FeArBlgJE/pzPLQ9vQic0kFeWC2W
	MPfVa1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEFj-009K0j-0O;
	Wed, 17 May 2023 10:19:27 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEFW-009Jlk-0A
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 10:19:15 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-783e5ae103aso223969241.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 03:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684318751; x=1686910751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OrHrY3AWtq70CRoLtNhxsvgCg243JPmz7/kyzBYJpQA=;
        b=gx73QOkq3byJIA/Bb/mmsN9l7Oz6EDJzEum6sbZ3Du/ESMpCrjyioyH0N9FWcwijXM
         +NyJZyziL7HGeGgIkhmTVFF0Qxb40NcFuFoneKGdSAjo/1DnKBfOyuTM4rRaYqLJGq7c
         QIWiNpi/sxFZ5zHKF245m3qOEb4GeX48lYZ0jZ3ToNt2qfbLERFcdBQpsOuXB971LJJ7
         gl2zBEpZdKtjmNHs5ZJTLJdlRa86JMIdfwyOCHNDFpkxpKv9op0twjBO9rBNxlovc578
         foz1HwAK7hRLdoQVMoQIhAwfd/88fHF1+KlE0VSxD4KtH6Mjwt29JraZjX23m7C0xtsb
         xSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684318751; x=1686910751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrHrY3AWtq70CRoLtNhxsvgCg243JPmz7/kyzBYJpQA=;
        b=F8jzCJiTuXysXtfZpumiZk8j4z0DV5lvNac671ByAYID3TXjceFSOLZ3xT7DhKYDK0
         +x6yabD1LzkQYEVRFP+EqCOAihi6ptcvGnmJAT81HRW11MCDPP/ybbSEtonNVNGm2Z4A
         p/OO6AZzRsf4wjXqvVanFcsiqzGJ3DrVffAGWCKd5AlnAvqBuFmG3nIN5138e+5/Pt5s
         myTKoHUbCXcJAUh/4dBbCZsC9s8gASjsuAZKKH88YvtnHFEvouWlaS3RB9es5rAoj7b8
         WpixkOG3FDHP1kUEE0sgE/ZrHzCWNwxdRUF3BCpLa8sRAjzuQ6TvKkU03aTpieHVE+1L
         9DTA==
X-Gm-Message-State: AC+VfDw2pi8Sc/ajvBE0cVrbV67w8mTKGNTJ+QJ2Zkx1wOvDJz/ELOOj
	Mp7W9EIaaCAJiwT3MFTTGcFXzt1nqxXykN5cUtJ43w==
X-Google-Smtp-Source: ACHHUZ5Mb/NeiO/iDJb+RFsGn+oHgCv/thgz5utXRC5vjJkVkqjaX/1mVMnKg6tlXR15pAZMUKKT+mZqUv4DrifFGrs=
X-Received: by 2002:a67:f94b:0:b0:436:5a8b:14e0 with SMTP id
 u11-20020a67f94b000000b004365a8b14e0mr4386138vsq.26.1684318751690; Wed, 17
 May 2023 03:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230517031856.19660-1-xiaoming.ding@mediatek.com>
 <ZGSDoVKKVqCkbaCB@infradead.org> <CAFA6WYO+AvnbuAdWyBAQ8HkLaOno7PXdsPb9SubxrGNvAm4UnQ@mail.gmail.com>
 <ZGSLiiK/JzD5KMd7@infradead.org> <CAFA6WYPOMwmrA3J84AHzoD2eAtNkpMxr754qHpc-j6XRkgFFvQ@mail.gmail.com>
 <ZGSgCZrg+RjAbGO1@infradead.org>
In-Reply-To: <ZGSgCZrg+RjAbGO1@infradead.org>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 17 May 2023 15:49:00 +0530
Message-ID: <CAFA6WYO+EpiECFxdVgmd-Ey9jq1Ybt78WupK_bW5+oDcW-soVQ@mail.gmail.com>
Subject: Re: [PATCH] tee: add FOLL_LONGTERM for CMA case when alloc shm
To: Christoph Hellwig <hch@infradead.org>, Xiaoming Ding <xiaoming.ding@mediatek.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, fei.xu@mediatek.com, 
	srv_heupstream@mediatek.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_031914_102267_4136946E 
X-CRM114-Status: GOOD (  17.68  )
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

On Wed, 17 May 2023 at 15:06, Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, May 17, 2023 at 02:56:13PM +0530, Sumit Garg wrote:
> > Do you mean a pinned user-space page can be paged out automatically?
>
> No, pinned pages can't be paged out.
>
> But a short term pin implies it will be release after a short delay,
> and it is feasible for wait for the pin to go away.

Okay, I see. I would be interested to know the ranges for that short
delay. I guess it may depend on how much memory pressure there is...

>
> For a long term pin waiting is not an option, and anyone wanting to
> do something with the pinned page that requires it to not be pinned
> must simply give up.
>
> > Just FYI, the underlying use-case for TEE registered shared memory is
> > that the references to pinned pages are provided to TEE implementation
> > to operate upon. This can happen over multiple syscalls and we want
> > the pinned pages to be always in RAM as otherwise the physical
> > addresses may change if they are paged out in between.
>
> That's a very use clear case for a long term pin.

...however, thanks for the insights.

@Xiaoming,

Please use the following fixes tag for the v2 along with extending the
commit description regarding the reliability provided by the long term
flag.

Fixes: 033ddf12bcf5 ("tee: add register user memory")

-Sumit

