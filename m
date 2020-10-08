Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92E4C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 14:02:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57FCB217BA
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 14:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wOdzYGCo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T/F+9ugs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57FCB217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0NNc3b8o6r62M6sMOWvj1ZJdLmnNo8f/Jim65l3kzcU=; b=wOdzYGCo4Mn77zqtEakfrF0nu
	KsFTfWJMm7JXTjocx8TDUQp1VtZ6xvukYYnkIQtmPbp4kIR5lngiR/zlXro4xcFmMhWQnmqoxQdVV
	d/CiWSQ2g37KrfZUYtlNVt1CgfTqpqyC5tcdSFKoU5XMhGmnk1J9HtQyWQlMRgtqgxG5nLMdICNkv
	JwDEXD7kTNC93ID1GfXYyoQ0DZkdAW1LJ5E8b9I8i8QhzHYpS3146pJBi0pXZKGx5WRo5cjAKZX+r
	YSPVTluQPNZ2TUR1g1khc6EG5GQ3QGom9nvYKzwRcoTCUVcfZA7x4OYvRnBem+zgru+9JcEQaI7c1
	9oGBDjazA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQWV4-0005BX-5q; Thu, 08 Oct 2020 14:02:30 +0000
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQWV2-0005Al-HV
 for linux-mediatek@lists.infradead.org; Thu, 08 Oct 2020 14:02:29 +0000
Received: by mail-oo1-xc44.google.com with SMTP id l18so1479819ooa.9
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2020 07:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yenzkprhIaKxWbr2VJ0f4x7nZ8oedYumsvtw0Q63bhc=;
 b=T/F+9ugs9rwmmfHmsaWXgPVU+ZLZGE7aRbGo6abeIkJ2KlStetQV5E3qMEneK1KC5g
 aa/PUFFCgJ+HfO2PctHrEeUPIE9FkviDtYwHjalO75CiSYhhkqK2cHBK0PNraeB2KTT1
 XUwmePtJrsHx9PaegeUiHttSPqq/IlFZBVR1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yenzkprhIaKxWbr2VJ0f4x7nZ8oedYumsvtw0Q63bhc=;
 b=KHAWGRXWPp8OU5m88Fe8kVEyLyxk4tMuM5Ry9xxwo5WUl7GyQE8FaNUoso4z/pewU4
 p2nz/oBaHKYCxvcO0dbL/3ReD3nAEY7zDo/KqXkAjLnMep6zQ2ZVBBgru/MFFcV4sc64
 h6nwW2I3OLjNiPB3cG6l0D+A2n/7eiRTcHaQOryDSLrkaLnjORBId+beQGJ5gkNVeryX
 Id/5snx8/XpQMF1nZpoL6WK2UB48J6rqrMoebs8WSLloRG25Cqpt1FgHuyoDKeR8PDIv
 fasTSYsZYjgJMduO/lDkVuatn6QVaOpOnbI0HDFTm7CFpZm7a2XSNUl2vEzgLdnpN99U
 0g8Q==
X-Gm-Message-State: AOAM531aD2E8+JS7aMY2Q3ey5e54vZaBNrvyzX3+GQmng9fzFwLXlzWn
 5punDUr9V4NvBs5cGS8I1O0t42/bsF6u0w==
X-Google-Smtp-Source: ABdhPJwU6IpcvOGh8DbriEcTQYjGR7FPvnVSNe1YcWwoeRvmh+h03XHOt2YnQvchgYhcGt92F4W8lQ==
X-Received: by 2002:a4a:d1ae:: with SMTP id z14mr5682136oor.52.1602165743173; 
 Thu, 08 Oct 2020 07:02:23 -0700 (PDT)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com.
 [209.85.161.44])
 by smtp.gmail.com with ESMTPSA id k2sm4668810oiw.20.2020.10.08.07.02.21
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 07:02:22 -0700 (PDT)
Received: by mail-oo1-f44.google.com with SMTP id z1so1493878ooj.3
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2020 07:02:21 -0700 (PDT)
X-Received: by 2002:a4a:da53:: with SMTP id f19mr5590822oou.38.1602165741077; 
 Thu, 08 Oct 2020 07:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20201004122234.802044-1-acourbot@chromium.org>
 <c3e1c20a-7729-9f48-ce66-41e67f195fc7@xs4all.nl>
 <cda40a8e-4dd2-5fd7-c5ff-8b048475164b@xs4all.nl>
In-Reply-To: <cda40a8e-4dd2-5fd7-c5ff-8b048475164b@xs4all.nl>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Thu, 8 Oct 2020 23:02:08 +0900
X-Gmail-Original-Message-ID: <CAPBb6MX8rFZU=9Pd5o0mqQ6pf+1oQYzk=D0WiR93_S3FUG7jJw@mail.gmail.com>
Message-ID: <CAPBb6MX8rFZU=9Pd5o0mqQ6pf+1oQYzk=D0WiR93_S3FUG7jJw@mail.gmail.com>
Subject: Re: [PATCH v2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_100228_612671_280038CD 
X-CRM114-Status: GOOD (  26.26  )
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

Hi Hans, thanks for taking the time to look at this!

On Thu, Oct 8, 2020 at 10:12 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 08/10/2020 15:07, Hans Verkuil wrote:
> > Hi Alexandre,
> >
> > On 04/10/2020 14:22, Alexandre Courbot wrote:
> >> The addition of MT8183 support added a dependency on the SCP remoteproc
> >> module. However the initial patch used the "select" Kconfig directive,
> >> which may result in the SCP module to not be compiled if remoteproc was
> >> disabled. In such a case, mtk-vcodec would try to link against
> >> non-existent SCP symbols. "select" was clearly misused here as explained
> >> in kconfig-language.txt.
> >>
> >> Replace this by a "depends" directive on at least one of the VPU and
> >> SCP modules, to allow the driver to be compiled as long as one of these
> >> is enabled, and adapt the code to support this new scenario.
> >>
> >> Also adapt the Kconfig text to explain the extra requirements for MT8173
> >> and MT8183.
> >>
> >> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> >> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> >> ---
> >>  drivers/media/platform/Kconfig                | 10 +--
> >>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
> >>  2 files changed, 54 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> >> index a3cb104956d5..98eb62e49ec2 100644
> >> --- a/drivers/media/platform/Kconfig
> >> +++ b/drivers/media/platform/Kconfig
> >> @@ -253,14 +253,16 @@ config VIDEO_MEDIATEK_VCODEC
> >>      depends on MTK_IOMMU || COMPILE_TEST
> >>      depends on VIDEO_DEV && VIDEO_V4L2
> >>      depends on ARCH_MEDIATEK || COMPILE_TEST
> >> +    depends on VIDEO_MEDIATEK_VPU || MTK_SCP
> >
> > Close, but no cigar.
> >
> > If VIDEO_MEDIATEK_VPU=y and MTK_SCP=m, then VIDEO_MEDIATEK_VCODEC can be configured
> > to y, and then it won't be able to find the scp_ functions.
> >
> > To be honest, I'm not sure how to solve this.
>
> Found it. Add this:
>
>         depends on MTK_SCP || !MTK_SCP
>         depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
>
> Ugly as hell, but it appears to be the correct incantation for this.

But doesn't it mean that the driver can be compiled if !MTK_SCP and
!VIDEO_MEDIATEK_VPU? That's the one case we want to avoid.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
