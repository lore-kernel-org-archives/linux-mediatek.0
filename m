Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C406C433E7
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 04:30:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC3EE2223C
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 04:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rtOrNwqz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hOWJ7xYf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC3EE2223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E8ThwpWWR8jEO5w6Gk31FnQOsz/LF4e5Q1tc/yUMh6E=; b=rtOrNwqzL4VXwruP4nueaDwFS
	d8worS0k2VsewAiWnRD/Ifjq3LFM8oB7luAdLSyfpPnSWbEVde1CcYa5LDbjjWrAlfuRXWAdbkKXR
	XDTlqBD6ZvH7th1/B6I5zJJqbelTWKXROGWTd/ueS8XQFjfUCkjn94Xorko198Z3g27LuLCqZmeOn
	WbsJzBTof83DtbDMjOPKhKFcoFDb1OwQsQmcwAA7qomJKgzBLWnPQaCG3QYvEnyGLynqT6LoMvwaJ
	5KQxkDUyvvreYLjEISpRInwScLUJYsdrYMT7arkr0MEAE3N+Vq4dogH60e09aB3QXbjAfxTR0OuEi
	fLJqn+FDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQk2y-0007Bl-Dp; Fri, 09 Oct 2020 04:30:24 +0000
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQk2v-0007A8-Ki
 for linux-mediatek@lists.infradead.org; Fri, 09 Oct 2020 04:30:22 +0000
Received: by mail-oo1-xc41.google.com with SMTP id c4so2070742oou.6
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2020 21:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bQCRsRi8kNOo2aPGfc7lMNsOSErczm6II0z2jnbK/64=;
 b=hOWJ7xYfYM+6d5Y3UGE81JEW30JgDfoQMe1Tn0bTzgehmm0gWfnBdkgQ7HuIXYBQB2
 /tjbwY4uuJr6AXHAvxJsDIe/hODY461gREIMT00jtu90X+3zfGwdybMA4O/Q4aJNV1ay
 z+8z3GXqz2BvyOqTty4J6/NVLV5vh7K0jy1gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQCRsRi8kNOo2aPGfc7lMNsOSErczm6II0z2jnbK/64=;
 b=Dy8i+uRj7SYe+RB0ncbrGAnbhgAmEFQsBOQxY6a2lm2vPvtHDIicH7YRIDoT02MoJM
 UDhLjc7gZg2baS0cNc3zxcPZUJwb2QY98PdK6w5/zgT2aavdqqCLjr+uZV/cLnHtjpMN
 1xpdwpgVUvxmjUT/sPimNlc+4EEID8J3PDP0wrXM+ruucKMixrBMiko/9wGRafpWt6vn
 Z1YrO/PRqyLM9grqGW43Y7qPHIyhOkY+gSvDAidnDwgYzOv4UIij5AsuzI/hozcU7Las
 LZ363XM6uGsSBxeVmTt0Z2cgcInUBHXY2eY6qqc2HmKLP0vT13+ZWb715fYAavHF/u2j
 4ToA==
X-Gm-Message-State: AOAM531+cc3Ps3bZ7FvKfI2k0eo+wXuOBo2K9/J9nuxKJhsoXL8Y/ekj
 /u5qiqaLSflZyfrG4BT24Voy+WdQiyX6/63L
X-Google-Smtp-Source: ABdhPJzADm1qFI3MkOzJDK9k3CWkfMUDTtNw5Qbi0eglgEL7J7QN46izYIhwSKd87bOcJ/ksEG67yQ==
X-Received: by 2002:a4a:5d84:: with SMTP id w126mr7764556ooa.1.1602217819229; 
 Thu, 08 Oct 2020 21:30:19 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com.
 [209.85.210.44])
 by smtp.gmail.com with ESMTPSA id w3sm5373425otl.13.2020.10.08.21.30.18
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 21:30:18 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id o8so7877160otl.4
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2020 21:30:18 -0700 (PDT)
X-Received: by 2002:a9d:7a2:: with SMTP id 31mr7000765oto.141.1602217817599;
 Thu, 08 Oct 2020 21:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201004122234.802044-1-acourbot@chromium.org>
 <c3e1c20a-7729-9f48-ce66-41e67f195fc7@xs4all.nl>
 <cda40a8e-4dd2-5fd7-c5ff-8b048475164b@xs4all.nl>
 <CAPBb6MX8rFZU=9Pd5o0mqQ6pf+1oQYzk=D0WiR93_S3FUG7jJw@mail.gmail.com>
 <1bb71c21-0f03-5d8f-be2c-fdcb13dadcd6@xs4all.nl>
In-Reply-To: <1bb71c21-0f03-5d8f-be2c-fdcb13dadcd6@xs4all.nl>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Fri, 9 Oct 2020 13:30:06 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWf7bWkigMPUwx7g6dXjwMkttGhHwC9X_=e6=cz1K5J0w@mail.gmail.com>
Message-ID: <CAPBb6MWf7bWkigMPUwx7g6dXjwMkttGhHwC9X_=e6=cz1K5J0w@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_003021_713384_0F25BD52 
X-CRM114-Status: GOOD (  28.46  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 9, 2020 at 1:13 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 08/10/2020 16:02, Alexandre Courbot wrote:
> > Hi Hans, thanks for taking the time to look at this!
> >
> > On Thu, Oct 8, 2020 at 10:12 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> >>
> >> On 08/10/2020 15:07, Hans Verkuil wrote:
> >>> Hi Alexandre,
> >>>
> >>> On 04/10/2020 14:22, Alexandre Courbot wrote:
> >>>> The addition of MT8183 support added a dependency on the SCP remoteproc
> >>>> module. However the initial patch used the "select" Kconfig directive,
> >>>> which may result in the SCP module to not be compiled if remoteproc was
> >>>> disabled. In such a case, mtk-vcodec would try to link against
> >>>> non-existent SCP symbols. "select" was clearly misused here as explained
> >>>> in kconfig-language.txt.
> >>>>
> >>>> Replace this by a "depends" directive on at least one of the VPU and
> >>>> SCP modules, to allow the driver to be compiled as long as one of these
> >>>> is enabled, and adapt the code to support this new scenario.
> >>>>
> >>>> Also adapt the Kconfig text to explain the extra requirements for MT8173
> >>>> and MT8183.
> >>>>
> >>>> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >>>> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> >>>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> >>>> ---
> >>>>  drivers/media/platform/Kconfig                | 10 +--
> >>>>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
> >>>>  2 files changed, 54 insertions(+), 28 deletions(-)
> >>>>
> >>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> >>>> index a3cb104956d5..98eb62e49ec2 100644
> >>>> --- a/drivers/media/platform/Kconfig
> >>>> +++ b/drivers/media/platform/Kconfig
> >>>> @@ -253,14 +253,16 @@ config VIDEO_MEDIATEK_VCODEC
> >>>>      depends on MTK_IOMMU || COMPILE_TEST
> >>>>      depends on VIDEO_DEV && VIDEO_V4L2
> >>>>      depends on ARCH_MEDIATEK || COMPILE_TEST
> >>>> +    depends on VIDEO_MEDIATEK_VPU || MTK_SCP
> >>>
> >>> Close, but no cigar.
> >>>
> >>> If VIDEO_MEDIATEK_VPU=y and MTK_SCP=m, then VIDEO_MEDIATEK_VCODEC can be configured
> >>> to y, and then it won't be able to find the scp_ functions.
> >>>
> >>> To be honest, I'm not sure how to solve this.
> >>
> >> Found it. Add this:
> >>
> >>         depends on MTK_SCP || !MTK_SCP
> >>         depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
> >>
> >> Ugly as hell, but it appears to be the correct incantation for this.
> >
> > But doesn't it mean that the driver can be compiled if !MTK_SCP and
> > !VIDEO_MEDIATEK_VPU? That's the one case we want to avoid.
>
> No, because you still have:
>
>         depends on VIDEO_MEDIATEK_VPU || MTK_SCP
>
> So at least one of these must be set.
>
> Just try it :-)

Aha, I misread your message and thought you suggested replacing the
dependencies with these two lines. In this case it would certainly
work! Thanks for the suggestion, I'll send a v3 soon.

>
> Regards,
>
>         Hans

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
