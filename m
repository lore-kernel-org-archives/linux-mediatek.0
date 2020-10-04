Return-Path: <SRS0=GDFl=DL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C86AC4363C
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2020 12:19:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81734206A1
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2020 12:19:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wPSBUBOE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i/qkeKCD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81734206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V4OTOKW6Jbl8HEWKYZEcbEDU+EjPjjX4N8pFFhrt8QY=; b=wPSBUBOEa4Szlmy2HvYQ4wwW7
	QP9EbjEzPP9CXyGgtKfM0ubgnx3jLR/ThnaKsDWSrNN6DSoQRWL0z/+PlLSWfcTIWOLX6MI+5tCMB
	Wx03K3ofnNtsKwDJpdx5eJ62M1enzEFJAgRt5sG1K7CuPQBwOq0niO+EZ3sz2c36R7wbqcxhNdijH
	5I1v/xhsgSIAQdm8ZyitRXwxHlkUr7583dXBJk8SbsIg0QThUYNCXmzPjHEn1W/fdPQqwXhYaRxzo
	26NWdvvlQiMd8/Xpfvbz3G1FDR0P1aVHYlgnO5sivYrC64ZXnNnl1hvbcBwMDxF7Qv+CYDCdNkeYG
	hlbSauNYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kP2yq-0006Ma-83; Sun, 04 Oct 2020 12:19:08 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kP2yl-0006LT-S3
 for linux-mediatek@lists.infradead.org; Sun, 04 Oct 2020 12:19:05 +0000
Received: by mail-ot1-x343.google.com with SMTP id 60so5952824otw.3
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Oct 2020 05:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uXNdWYMromVSx/RjkxXpJxcfqReLqFvZyFU3dhbaUTA=;
 b=i/qkeKCDlG6ZxOEGMPbFh2xphG0sL7pHvduuvjQwfE8ZVBLygJQZk8PTYjU1im4Alf
 gEfrjhTU3FUci3cyYGdlylDMJzTfnFAF89Np2n5TmPDqshBTw9RKzUWktl3d3NersM+6
 rbutunneNKu/OOrI3wrleyZ30aaLAuBI+Oc50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uXNdWYMromVSx/RjkxXpJxcfqReLqFvZyFU3dhbaUTA=;
 b=DUZl/7Tc/MUMe7yqRY/YiSrdLzQeCS+J1ePc21AfWALSRjRzHNzS7ZTWK0bFZBcr97
 3pfiWvuNRa7rxaIUnj7yng094uGD9yQQ35guj16jgkZeTXHmxLJ1Wj9aGUWcI5Y28RLC
 5tP5f1JzYfy6Oq+zSFGHjtrej+/mB32ZXxTBDDl0aaJZLjmW9YCuk+w9V5ekD6gsX2cU
 Ii8Ev4xRJ83S9Ip5M0jvfRQFY3AT8InUY0x46S2/9GbZ/0G9JKGZ+GiOW7dyJ19lyVtk
 9Xt6K9bnPaEYofb6fZTVuxSVyDjrrxwdJsrEgrDSyABfMgs1foIGugf7CB9frtTuJPY2
 JwTA==
X-Gm-Message-State: AOAM533HJyGSDb7J5rvKp84KHE0I2PeyT3XeUaS4SeSquOtad9kiX1cX
 KooYBEZ+MuGocFm1GO5ufSd2AXMlXdcd8A==
X-Google-Smtp-Source: ABdhPJwxAXKcTzEBQuFed0Mo9AfYzaCzDuSejl07isLAVdj8XdPZ/2H7r+EZrAP9jwwQ+p+n97iYwA==
X-Received: by 2002:a05:6830:1e8c:: with SMTP id
 n12mr8362546otr.17.1601813941286; 
 Sun, 04 Oct 2020 05:19:01 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com.
 [209.85.167.178])
 by smtp.gmail.com with ESMTPSA id i6sm1702257oig.54.2020.10.04.05.19.00
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Oct 2020 05:19:00 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id n2so6024628oij.1
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Oct 2020 05:19:00 -0700 (PDT)
X-Received: by 2002:aca:cd42:: with SMTP id d63mr5722000oig.94.1601813939470; 
 Sun, 04 Oct 2020 05:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201003130947.555637-1-acourbot@chromium.org>
 <43e118c9-0bc6-d85d-2f86-e74f833e1e8a@infradead.org>
In-Reply-To: <43e118c9-0bc6-d85d-2f86-e74f833e1e8a@infradead.org>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Sun, 4 Oct 2020 21:18:46 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXjeRMV_q3E8M7wdA9C9tVfY0X36c1ye=VrJGwmWBpEKg@mail.gmail.com>
Message-ID: <CAPBb6MXjeRMV_q3E8M7wdA9C9tVfY0X36c1ye=VrJGwmWBpEKg@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vcodec: fix builds when remoteproc is disabled
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_081903_957515_69AC09D8 
X-CRM114-Status: GOOD (  28.28  )
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
 LKML <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 4, 2020 at 1:50 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 10/3/20 6:09 AM, Alexandre Courbot wrote:
> > The addition of MT8183 support added a dependency on the SCP remoteproc
> > module. However the initial patch used the "select" Kconfig directive,
> > which may result in the SCP module to not be compiled if remoteproc was
> > disabled. In such a case, mtk-vcodec would try to link against
> > non-existent SCP symbols. "select" was clearly misused here as explained
> > in kconfig-language.txt.
> >
> > Replace this by a "depends" directive on at least one of the VPU and
> > SCP modules, to allow the driver to be compiled as long as one of these
> > is enabled, and adapt the code to support this new scenario.
> >
> > Also adapt the Kconfig text to explain the extra requirements for MT8173
> > and MT8183.
> >
> > Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
>
> I was seeing this also, so I checked this patch. WFM.
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks for checking! I will send a v2 with your Acked-by and fix.

>
> See below.
>
> > ---
> >  drivers/media/platform/Kconfig                | 11 +--
> >  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
> >  2 files changed, 55 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> > index a3cb104956d5..e559d9c529b6 100644
> > --- a/drivers/media/platform/Kconfig
> > +++ b/drivers/media/platform/Kconfig
> > @@ -253,14 +253,17 @@ config VIDEO_MEDIATEK_VCODEC
> >       depends on MTK_IOMMU || COMPILE_TEST
> >       depends on VIDEO_DEV && VIDEO_V4L2
> >       depends on ARCH_MEDIATEK || COMPILE_TEST
> > +     depends on VIDEO_MEDIATEK_VPU || MTK_SCP
> >       select VIDEOBUF2_DMA_CONTIG
> >       select V4L2_MEM2MEM_DEV
> > -     select VIDEO_MEDIATEK_VPU
> > -     select MTK_SCP
> >       help
> >           Mediatek video codec driver provides HW capability to
> > -         encode and decode in a range of video formats
> > -         This driver rely on VPU driver to communicate with VPU.
> > +         encode and decode in a range of video formats on MT8173
> > +         and MT8183.
> > +
> > +         Note that support for support for MT8173 requires
>
> Drop one of "support for" above. (or "for support" ;)
>
> > +         VIDEO_MEDIATEK_VPU to also be selected. Support for
> > +         MT8183 depends on MTK_SCP.
> >
> >           To compile this driver as modules, choose M here: the
> >           modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
>
>
> thanks.
> --
> ~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
