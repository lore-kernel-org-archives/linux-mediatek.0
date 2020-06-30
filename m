Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44FCC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 17:19:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 723632077D
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 17:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gIQvztxh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bJkUoNua"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 723632077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=62vRzgaQPjPwGjcWpc9Nn8WWNsaAVB18ANHXP6qucqU=; b=gIQvztxh+hmM3bt8hcK6x31Bs
	ilkQ9oRn4GbiktpR7CRnVos6k78D8C3xsd5IEQgm2gGK829hmN+AoWlo07iUzdyZU9Fx6KSKaAl6i
	Gs6A+cFZ58buMKE55Sj4590sBQ0MTcG5LyryQ3P55fEZ3/iQ2DQQX5gxjrNhjzRxz3XuqJdjbMPr9
	hZnfmgsRQswhO5QxybEEVcFizXQtP4/UWdbjEToJTBbx60ZAMCOiTK1EP6TxZkYVtEUOTzUHT0iO7
	LQBM4g8mFhPVGmXTeNA3cbmZ8maTKQGoFOmPdqWYLSeWHSiG3PyqxcowdkyP8Te4JrrZ/Oq82+n+C
	N94O34gvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqJuq-00085I-8u; Tue, 30 Jun 2020 17:19:28 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqJud-00081W-J5
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 17:19:22 +0000
Received: by mail-wr1-x442.google.com with SMTP id q5so20967191wru.6
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2020 10:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J/fm1XsvHQHkOySPHkGUug98e3SYGWgCY9AAaLKVZAQ=;
 b=bJkUoNua09zlOC1u0e1zfwrzzR3BlFgsZzvLyrPx7iKB9UMjYxOAgi5D+PgXGbaoSV
 PPVkdjX69MpUQkdVBG2LrLCCGbzhbUOGtAQelEgmqgui7MXJijIFXrTsMvj0MsuJxaW4
 oDoLCqNj+tDh5hG6KksbS8zBU6u56iyfdC3jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J/fm1XsvHQHkOySPHkGUug98e3SYGWgCY9AAaLKVZAQ=;
 b=USm+ZZDOi8+gQbXSewSZYdS4pNNRjNYPT+JEvrwmNeplIyHbv9eK5tPjFGaaKNMrCt
 QSkM4HjdhRMJeljaG5LrFToGEGAAtXzV9owv+XNPl2o+IZCn6sSG3a/i3iwnfpOTyuG8
 I4tU0xjODD4mmnjDF00NPC2KjLEIIA+o4h3vqa+HPgkCgNcFeqjGr84nzBo6Vbo+OQM1
 jYZi3Q2ETbaNyCpyHe6p7Xsl59dCg9ofGBPTZuxi+Eg6HTSzem5PJrZ7lPLSmst8xGBc
 WBqTghd/qyHKFzi2mRftWyt5iBut6Kc2mnlQJYy1+mzk/zGIf+PMPA1UYmj2W+8z7GlD
 XEvg==
X-Gm-Message-State: AOAM533lKZRdNyn4h5B9Q8GCmZ2+B3mFgj0VvEl1FutNWeaUDayO8P7R
 8FjMnif98l3qpm2DsdWY52Bnzg==
X-Google-Smtp-Source: ABdhPJxZGumxEKs37+tBL3WHbXUBqjCD//HM9vnehmqQikLZO8H3zt5/qVFES+cnZvDCkAwI7sObXA==
X-Received: by 2002:a5d:51ce:: with SMTP id n14mr22826755wrv.155.1593537554628; 
 Tue, 30 Jun 2020 10:19:14 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id g14sm4158291wrm.93.2020.06.30.10.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 10:19:13 -0700 (PDT)
Date: Tue, 30 Jun 2020 17:19:12 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
Subject: Re: [RFC PATCH V4 0/4] media: platform: Add support for Face
 Detection (FD) on mt8183 SoC
Message-ID: <20200630171912.GE1212092@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <1588903371.16825.14.camel@mtksdccf07>
 <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
 <20200521183825.GB249683@chromium.org>
 <1593526253.29676.28.camel@mtksdccf07>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593526253.29676.28.camel@mtksdccf07>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_131916_030850_11D2D460 
X-CRM114-Status: GOOD (  31.19  )
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
 Sean Cheng =?utf-8?B?KOmEreaYh+W8mCk=?= <Sean.Cheng@mediatek.com>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 "zwisler@chromium.org" <zwisler@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Christie Yu =?utf-8?B?KOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>,
 HansVerkuil <hverkuil@xs4all.nl>,
 Jungo Lin =?utf-8?B?KOael+aYjuS/iik=?= <jungo.lin@mediatek.com>,
 Sj Huang =?utf-8?B?KOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 "yuzhao@chromium.org" <yuzhao@chromium.org>,
 "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
 "pihsun@chromium.org" <pihsun@chromium.org>,
 Frederic Chen =?utf-8?B?KOmZs+S/iuWFgyk=?= <Frederic.Chen@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jerry,

On Tue, Jun 30, 2020 at 10:10:53PM +0800, Jerry-ch Chen wrote:
> Hi Tomasz,
> 
> On Thu, 2020-05-21 at 18:38 +0000, Tomasz Figa wrote:
> > Hi Jerry,
> > 
> > On Wed, May 13, 2020 at 11:45:37PM +0200, Tomasz Figa wrote:
> > > Hi Jerry,
> > > 
> > > On Fri, May 8, 2020 at 4:03 AM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > >
> > > > Hi Laurent, Tomasz, Matthias,
> > > >
> > > > gentle ping for this patch set,
> > > > If no new comments, I would like to send a newer version.
> > > >
> > > 
> > > Sorry, I still haven't had a chance to look at the series, so feel
> > > free to send a new version and I will take a look at the new one.
> > > 
> > 
> > Finally found some time to review the series. Again sorry for the delay
> > and thanks for your patience.
> > 
> > Some general comments:
> > 1) The metadata format FourCC should be added in a separate patch,
> > together with documentation for it.
> > 2) Control IDs, structs used by the userspace, etc. should be defined in
> > a header under include/uapi/linux.
> > 
> > Please also check my replies to particular patches for further comments.
> > 
> > Best regards,
> > Tomasz
> 
> Appreciate for your reply,
> 
> So far, I've locally created an uapi header:
> include/uapi/linux/mtk_fd_40.h
> which provides some values, control ids, and the definitions of
> structures that would be needed by user of mtk_fd_40 driver.
> In addition, I also provide a MACRO as example in comments that can
> extract the struct member with bit length and offset
> definitions(eliminate the bit-fields).
> 
> Also, I would like to rename struct fd_user_output with struct
> mtk_fd_hw_result. I worry fd_user_output would be a confusing name.

The change sounds good to me.

> I will add them in a separate patch in next version.
> 

Okay.

> I am still working on the documentation, which might be
> Documentation/media/uapi/v4l/pixfmt-meta-mtk-fd-40.rst.
> Refering the other pixfmt-*.rst files, I will try to provide the
> flat-table of the metadata with the structure of the mtk_fd_hw_result.
> 

Sounds good to me.

> I am confusing that should I remain the name with -40 in the tail of rst
> file?

The header and documentation file names should match the driver name.  I
just noticed there is some inconsistency in the naming, though. The
driver seems to be located under drivers/media/platform/mtk-isp/fd, but
the driver name in the platform driver struct and as reported by
VIDIOC_QUERYCAP seems to be "mtk-fd-4.0". 

Since we have many mtk-* drivers in the tree currently, I think it might
make sense to consolidate them under drivers/media/platform/mediatek,
similarly to drivers/media/platform/qcom or /rockchip. But it could be
done later, as a follow-up.

My suggestion would be to place the driver under
drivers/media/platform/mtk-fd-40 and also rename the related Kconfig
symbol to include the _40 suffix.

What do you think?

> Since I think the layout of metadata might be different in the future
> mtk fd drivers. Maybe they create a new one or should they update the
> rst file when they are upstreaming?
> 

I think we'll decide what to do when that happens. Depending on whether
there is more face detection hardware available, we might be able to
migrate to standard controls and metadata buffer formats at that time.

> Other comments are almost fixed, I will inform you by this mail thread
> as soon as I finish the documentation of fd metadata format.

Okay, thanks.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
