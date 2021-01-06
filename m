Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4010C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 06:39:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 837E6207B2
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 06:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 837E6207B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GKbzNr61W4pQxa1NHTNK57n3IW7bgx8DRcc03LMy4kU=; b=AQVhZJ+OmVGd1fC87ai1fVRrl
	eQaTqEMadPuPBdekYJKP1KxKp7BfhjxaNubhFURNtSpjE1wFboLZoQtACaK46ZYcFqu3tKAkkTS9F
	Wi+zZXrpq1DExkZEBdPz8TUNjh9+oOq14ebfguTZY8POLUVohUOlI0gwgD/d1tvKLXCuXF7EhQA78
	JsMm0SR9N7ePLhoNU88ZpJU8BjzjRzGBXt4gOMDKfFmzCW4B4daLH7lmU/3oEUbAMochQzsBQ13P8
	T6uz6D+k/jHjdx2sDTs6nxs/YFu6m1pBx2Ep5aH5VC6CLLsgQ2FL44jCYCv3hmkgcdxPdnfEu/btH
	4He/Ycoyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx2Tj-0000pt-66; Wed, 06 Jan 2021 06:39:31 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx2Tf-0000or-AU
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 06:39:28 +0000
Received: by mail-ej1-x632.google.com with SMTP id b9so3781552ejy.0
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Jan 2021 22:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mptNvhPterwZlvJV3HW2du5Mit0CvbqweKKKV8wxyoE=;
 b=LqGHKEL5dxWpfoeoiDz7CLCNL6rSPL7GdW7c/o8VbDMH0KLXJ4e8ppsFdMO28aQ95U
 A9KLWNhhz4ODK2egCn2AQL6bdmOR9PrjUxjMl/sGbd5h7lpB2WvvRl+kxCtsMpkWwXIH
 XfW5BZvM6soQ4QcEJ2Aqk7Ddu5J19hq79izgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mptNvhPterwZlvJV3HW2du5Mit0CvbqweKKKV8wxyoE=;
 b=iGBSVgCBm6D7458nJhwkVdJSpZaQ9fZF6U2WSthOYP83gGdASrRDVyqR2d6ew1lRpq
 d5gccBWS190UI3nyliZFm59uPQKH3nPSwC5qwqNAKpYBI7as2BjjTFT4iCoj7WU7pSQN
 r7m8Ha/YdiImK5UNVz4UQx6WWZ1QWgDhsyVPsuRctEkyJTItK1A+K6gY3fdAzb6mFReB
 1wJiJJzMG+zk1MKfR4b11JCeXK3YPsJ5NxF0ZL9v3GM45xkLE/hWZsbp2abwIzrxKHzN
 MjpA9M1G9X/x9CmkX3Cy0YZnLTEZ5RzBA2f6Df9mKO84uM8GWsHjdTmqVauanMpDg3Be
 8juw==
X-Gm-Message-State: AOAM530xDUBBCsG0l+nG0yR2yQYZ0MEhtGPRMdDtIsEkPr9o582S3FIH
 ee3bwNxr6UjWntY+KQUWC6ubR4HT8HQtXQ==
X-Google-Smtp-Source: ABdhPJxRnEPSxD55zr4Ok5xSTQbFy9ADtR9nOzy+t49d2HNnK5aZqpfs3cLtHVgyAx4TOP3k0dD5mA==
X-Received: by 2002:a17:906:9605:: with SMTP id
 s5mr1939388ejx.179.1609915165638; 
 Tue, 05 Jan 2021 22:39:25 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com.
 [209.85.218.53])
 by smtp.gmail.com with ESMTPSA id qp16sm753573ejb.74.2021.01.05.22.39.25
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 22:39:25 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id d17so3639312ejy.9
 for <linux-mediatek@lists.infradead.org>; Tue, 05 Jan 2021 22:39:25 -0800 (PST)
X-Received: by 2002:a5d:6209:: with SMTP id y9mr2713348wru.197.1609914670850; 
 Tue, 05 Jan 2021 22:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <1588903371.16825.14.camel@mtksdccf07>
 <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
 <20200521183825.GB249683@chromium.org> <1593526253.29676.28.camel@mtksdccf07>
 <20200630171912.GE1212092@chromium.org> <1605095509.28992.7.camel@mtksdccf07>
 <CAAFQd5CeZYOAxwHjsVOV9eJRt15-npTsH15Y5idwr3-ux+85qQ@mail.gmail.com>
 <1605182733.28992.12.camel@mtksdccf07> <1609174942.3068.9.camel@mtksdccf07>
In-Reply-To: <1609174942.3068.9.camel@mtksdccf07>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 6 Jan 2021 15:30:58 +0900
X-Gmail-Original-Message-ID: <CAAFQd5ApnMhMNLOzwi-EUTm=Kfswfhy6vyQ17rLui1RhFR1vSA@mail.gmail.com>
Message-ID: <CAAFQd5ApnMhMNLOzwi-EUTm=Kfswfhy6vyQ17rLui1RhFR1vSA@mail.gmail.com>
Subject: Re: [RFC PATCH V4 0/4] media: platform: Add support for Face
 Detection (FD) on mt8183 SoC
To: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_013927_410448_3D171B0C 
X-CRM114-Status: GOOD (  41.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "zwisler@chromium.org" <zwisler@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>,
 HansVerkuil <hverkuil@xs4all.nl>,
 =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 "yuzhao@chromium.org" <yuzhao@chromium.org>,
 "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
 "pihsun@chromium.org" <pihsun@chromium.org>,
 =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <Frederic.Chen@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 29, 2020 at 2:02 AM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Thu, 2020-11-12 at 20:05 +0800, Jerry-ch Chen wrote:
> > Hi Tomasz,
> >
> > On Thu, 2020-11-12 at 13:26 +0900, Tomasz Figa wrote:
> > > On Wed, Nov 11, 2020 at 8:51 PM Jerry-ch Chen
> > > <Jerry-ch.Chen@mediatek.com> wrote:
> > > >
> > > > Hi Tomasz,
> > > >
> > > > On Wed, 2020-07-01 at 01:19 +0800, Tomasz Figa wrote:
> > > > > Hi Jerry,
> > > > >
> > > > > On Tue, Jun 30, 2020 at 10:10:53PM +0800, Jerry-ch Chen wrote:
> > > > > > Hi Tomasz,
> > > > > >
> > > > > > On Thu, 2020-05-21 at 18:38 +0000, Tomasz Figa wrote:
> > > > > > > Hi Jerry,
> > > > > > >
> > > > > > > On Wed, May 13, 2020 at 11:45:37PM +0200, Tomasz Figa wrote:
> > > > > > > > Hi Jerry,
> > > > > > > >
> > > > > > > > On Fri, May 8, 2020 at 4:03 AM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi Laurent, Tomasz, Matthias,
> > > > > > > > >
> > > > > > > > > gentle ping for this patch set,
> > > > > > > > > If no new comments, I would like to send a newer version.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Sorry, I still haven't had a chance to look at the series, so feel
> > > > > > > > free to send a new version and I will take a look at the new one.
> > > > > > > >
> > > > > > >
> > > > > > > Finally found some time to review the series. Again sorry for the delay
> > > > > > > and thanks for your patience.
> > > > > > >
> > > > > > > Some general comments:
> > > > > > > 1) The metadata format FourCC should be added in a separate patch,
> > > > > > > together with documentation for it.
> > > > > > > 2) Control IDs, structs used by the userspace, etc. should be defined in
> > > > > > > a header under include/uapi/linux.
> > > > > > >
> > > > > > > Please also check my replies to particular patches for further comments.
> > > > > > >
> > > > > > > Best regards,
> > > > > > > Tomasz
> > > > > >
> > > > > > Appreciate for your reply,
> > > > > >
> > > > > > So far, I've locally created an uapi header:
> > > > > > include/uapi/linux/mtk_fd_40.h
> > > > > > which provides some values, control ids, and the definitions of
> > > > > > structures that would be needed by user of mtk_fd_40 driver.
> > > > > > In addition, I also provide a MACRO as example in comments that can
> > > > > > extract the struct member with bit length and offset
> > > > > > definitions(eliminate the bit-fields).
> > > > > >
> > > > > > Also, I would like to rename struct fd_user_output with struct
> > > > > > mtk_fd_hw_result. I worry fd_user_output would be a confusing name.
> > > > >
> > > > > The change sounds good to me.
> > > > >
> > > > > > I will add them in a separate patch in next version.
> > > > > >
> > > > >
> > > > > Okay.
> > > > >
> > > > > > I am still working on the documentation, which might be
> > > > > > Documentation/media/uapi/v4l/pixfmt-meta-mtk-fd-40.rst.
> > > > > > Refering the other pixfmt-*.rst files, I will try to provide the
> > > > > > flat-table of the metadata with the structure of the mtk_fd_hw_result.
> > > > > >
> > > > >
> > > > > Sounds good to me.
> > > > >
> > > > > > I am confusing that should I remain the name with -40 in the tail of rst
> > > > > > file?
> > > > >
> > > > > The header and documentation file names should match the driver name.  I
> > > > > just noticed there is some inconsistency in the naming, though. The
> > > > > driver seems to be located under drivers/media/platform/mtk-isp/fd, but
> > > > > the driver name in the platform driver struct and as reported by
> > > > > VIDIOC_QUERYCAP seems to be "mtk-fd-4.0".
> > > >
> > > > > Since we have many mtk-* drivers in the tree currently, I think it might
> > > > > make sense to consolidate them under drivers/media/platform/mediatek,
> > > > > similarly to drivers/media/platform/qcom or /rockchip. But it could be
> > > > > done later, as a follow-up.
> > > > >
> > > > > My suggestion would be to place the driver under
> > > > > drivers/media/platform/mtk-fd-40 and also rename the related Kconfig
> > > > > symbol to include the _40 suffix.
> > > > >
> > > > > What do you think?
> > > > >
> > > >
> > > > I Appreciate your comments,
> > > > Sorry for the late reply.
> > > >
> > > > Would it be possible for me to replace the driver as drivers/media/platform/mtk_fd/mtk-fd-40?(Just like mtk-isp/isp_50)
> > > >
> > >
> > > I'm not a big fan of duplicating "mtk fd" in the path. How about just
> > > making it drivers/media/platform/mtk-fd-40?
> > >
> >
> > Ok, I will make it drivers/media/platform/mtk-fd-40,
> > and also rename the related Kconfig symbol to include the _40 suffix.
> >
> > Thanks and Best Regards,
> > Jerry.
> >
> > > Best regards,
> > > Tomasz
> >
>
>
> I've finish the document of FD driver, describing the structure of the
> mtk_fd_hw_result. Could I send the new version of the driver? would the
> folder path replacement must be included in the new version?

Thanks Jerry and Happy New Year.

Since the driver should be in a good shape after addressing the last
comments, perhaps it would make sense to update the path as well, so
that it can be merged if no other issues are found?

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
