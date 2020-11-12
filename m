Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111A2C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 04:27:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38626207BB
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 04:27:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WcBqdDv/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HWhp+x5n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38626207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uJmqreuNKPJxvo4IsVVbMEHMc4aoEDbZ6wHUwWX+b1c=; b=WcBqdDv/Y4f8UcMKTqrCIIEnV
	7uelukMXuy3F/34PgBvoOqdF6ASzgiYXgN7FzFkbDGJYzh8JvIHr8/ltxO+QgbdZqkL7yGSB81Hum
	ZDXc87K66bG02ik3CMOhb+FN+WHvZZvgtOVpNoNpwUBjb6Dnc2YJTqA8S3qVIDfIJ9TD4ckycEiFj
	ezZcWEaQKLoFW5XjSJyFH+J5XrZmdzs3BnBnWXW+CsoqX+NHmi9J+l5EqyQMyXZhVbMzR39xfTy3M
	AprjiQljuJ+OdfYGqLzM03SJwmh5QvCrcC9cV2Kx3rX9fLMz5DpnysnsZq6gOqYKp2RHX9KxjA5XY
	D6wCPqtEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd4CQ-0001gg-29; Thu, 12 Nov 2020 04:27:06 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd4CF-0001fH-Tu
 for linux-mediatek@lists.infradead.org; Thu, 12 Nov 2020 04:26:56 +0000
Received: by mail-ed1-x544.google.com with SMTP id t11so4628170edj.13
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2020 20:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PrJGFWR5LfPadBQJXtxR3X13DiYJSukzmCqstyB653Y=;
 b=HWhp+x5nR3T+EuumQWwhx5XTPD7QV5SlMbprd7oGYb7NT1tsUS8M5b4CCExQirLXf1
 n6xB1vMrsTHoCd3FbJvdOGzMuDQtsl1hs78cs62DjPqqlEQe7GQ0p/ZW5fyjKOmsxAtD
 iRHM55F9z6oGEmav+yyjAu5YCy5KSCZCidFCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PrJGFWR5LfPadBQJXtxR3X13DiYJSukzmCqstyB653Y=;
 b=pm384N+23RnL87aipk/VzgYKd1VzP3RoYhC0FFWKQPHQ1Jz/OHEwTm2V6/oDa17Z8v
 /k8xTPSMDIqxDUCgAoSSctkwT9Ukp8gm/7Zwd/P/NYUp/8IRWM3iY5LGegd01ZTqBOTm
 FrDIRqun2qh5/x2JYjb5R0waqtFZEJ2NHgY+Fm9p7rGdQzgnEnsltbySNfp2RwoSsG7O
 yAkQYP7GaivSNJW27QPNbQ89XNBksJ+RTpnPrsT6XgvPjSxuDdqqhlHmQTCxujE8lKFc
 9ovIVRDtLro4fZRRxexgI+mpPnajrNxeeeF13JGkNFCQuZimHN1V95y4DBOzVFgRikgs
 MfRQ==
X-Gm-Message-State: AOAM531uNBM68LeyAj1suX5+UXq58p4HT2MTsC0JbnRYe/CUZO8R1jBZ
 xn8Pn1ZCTqiCB7YETKobH6s2znmywV5OOA==
X-Google-Smtp-Source: ABdhPJwZfY73BpZpX2YoPGhrZ+BEj/LTseVc2XIxjv14yYCXC0CR/Fv1/28zCIPSot5+lSbWDhBQvg==
X-Received: by 2002:aa7:c597:: with SMTP id g23mr3140519edq.184.1605155212889; 
 Wed, 11 Nov 2020 20:26:52 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45])
 by smtp.gmail.com with ESMTPSA id y12sm1592218ejc.8.2020.11.11.20.26.50
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 20:26:51 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id p8so4581923wrx.5
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2020 20:26:50 -0800 (PST)
X-Received: by 2002:adf:e54f:: with SMTP id z15mr32685970wrm.159.1605155209811; 
 Wed, 11 Nov 2020 20:26:49 -0800 (PST)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <1588903371.16825.14.camel@mtksdccf07>
 <CAAFQd5CP+gH3zG9fejBv_hTzeAExMoY+L38W8e4e3OSc-gVRHg@mail.gmail.com>
 <20200521183825.GB249683@chromium.org> <1593526253.29676.28.camel@mtksdccf07>
 <20200630171912.GE1212092@chromium.org> <1605095509.28992.7.camel@mtksdccf07>
In-Reply-To: <1605095509.28992.7.camel@mtksdccf07>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 12 Nov 2020 13:26:39 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CeZYOAxwHjsVOV9eJRt15-npTsH15Y5idwr3-ux+85qQ@mail.gmail.com>
Message-ID: <CAAFQd5CeZYOAxwHjsVOV9eJRt15-npTsH15Y5idwr3-ux+85qQ@mail.gmail.com>
Subject: Re: [RFC PATCH V4 0/4] media: platform: Add support for Face
 Detection (FD) on mt8183 SoC
To: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_232656_017180_69851789 
X-CRM114-Status: GOOD (  37.55  )
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

On Wed, Nov 11, 2020 at 8:51 PM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> On Wed, 2020-07-01 at 01:19 +0800, Tomasz Figa wrote:
> > Hi Jerry,
> >
> > On Tue, Jun 30, 2020 at 10:10:53PM +0800, Jerry-ch Chen wrote:
> > > Hi Tomasz,
> > >
> > > On Thu, 2020-05-21 at 18:38 +0000, Tomasz Figa wrote:
> > > > Hi Jerry,
> > > >
> > > > On Wed, May 13, 2020 at 11:45:37PM +0200, Tomasz Figa wrote:
> > > > > Hi Jerry,
> > > > >
> > > > > On Fri, May 8, 2020 at 4:03 AM Jerry-ch Chen <Jerry-ch.Chen@mediatek.com> wrote:
> > > > > >
> > > > > > Hi Laurent, Tomasz, Matthias,
> > > > > >
> > > > > > gentle ping for this patch set,
> > > > > > If no new comments, I would like to send a newer version.
> > > > > >
> > > > >
> > > > > Sorry, I still haven't had a chance to look at the series, so feel
> > > > > free to send a new version and I will take a look at the new one.
> > > > >
> > > >
> > > > Finally found some time to review the series. Again sorry for the delay
> > > > and thanks for your patience.
> > > >
> > > > Some general comments:
> > > > 1) The metadata format FourCC should be added in a separate patch,
> > > > together with documentation for it.
> > > > 2) Control IDs, structs used by the userspace, etc. should be defined in
> > > > a header under include/uapi/linux.
> > > >
> > > > Please also check my replies to particular patches for further comments.
> > > >
> > > > Best regards,
> > > > Tomasz
> > >
> > > Appreciate for your reply,
> > >
> > > So far, I've locally created an uapi header:
> > > include/uapi/linux/mtk_fd_40.h
> > > which provides some values, control ids, and the definitions of
> > > structures that would be needed by user of mtk_fd_40 driver.
> > > In addition, I also provide a MACRO as example in comments that can
> > > extract the struct member with bit length and offset
> > > definitions(eliminate the bit-fields).
> > >
> > > Also, I would like to rename struct fd_user_output with struct
> > > mtk_fd_hw_result. I worry fd_user_output would be a confusing name.
> >
> > The change sounds good to me.
> >
> > > I will add them in a separate patch in next version.
> > >
> >
> > Okay.
> >
> > > I am still working on the documentation, which might be
> > > Documentation/media/uapi/v4l/pixfmt-meta-mtk-fd-40.rst.
> > > Refering the other pixfmt-*.rst files, I will try to provide the
> > > flat-table of the metadata with the structure of the mtk_fd_hw_result.
> > >
> >
> > Sounds good to me.
> >
> > > I am confusing that should I remain the name with -40 in the tail of rst
> > > file?
> >
> > The header and documentation file names should match the driver name.  I
> > just noticed there is some inconsistency in the naming, though. The
> > driver seems to be located under drivers/media/platform/mtk-isp/fd, but
> > the driver name in the platform driver struct and as reported by
> > VIDIOC_QUERYCAP seems to be "mtk-fd-4.0".
>
> > Since we have many mtk-* drivers in the tree currently, I think it might
> > make sense to consolidate them under drivers/media/platform/mediatek,
> > similarly to drivers/media/platform/qcom or /rockchip. But it could be
> > done later, as a follow-up.
> >
> > My suggestion would be to place the driver under
> > drivers/media/platform/mtk-fd-40 and also rename the related Kconfig
> > symbol to include the _40 suffix.
> >
> > What do you think?
> >
>
> I Appreciate your comments,
> Sorry for the late reply.
>
> Would it be possible for me to replace the driver as drivers/media/platform/mtk_fd/mtk-fd-40?(Just like mtk-isp/isp_50)
>

I'm not a big fan of duplicating "mtk fd" in the path. How about just
making it drivers/media/platform/mtk-fd-40?

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
