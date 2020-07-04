Return-Path: <SRS0=EBBG=AP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4E4C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 12:36:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D413E20870
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 12:36:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NUzO2tRp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YhkyxlMI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D413E20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uWHRE3k86zOTWXBBliiiWGzMzq/G8JMj4VYmWVOiJWc=; b=NUzO2tRpMKf/ZmhoLl27x/nEr
	U4yot1wDYL2JCmVUGsscqoDPqalOMr3Gtc4zierhwS0pxo4x/15l8/lefIMrfYoQ7/HFSOt90TAfQ
	hCwRPPrJFsEY0lL11EZCN1XxzS3r04kb9iPkvHDd5EHcmxfQOg+Yg9MwOOXjDskm/tgDAY3SC9dvE
	7KPFVLm8/c+FBJU4HAbVN7CgZCpxgwsBBkVrperMStgG+n+GrBLdafiF34RYC+FANoHBJyow5D+eT
	uEtiyBU4JG4qhKlYMl9oYbOQ8a6ASRxmPXOZIsaq2nuhBeJCZwfIj7Vhi8NPhBHPcTvbRhKSJwZp+
	G3XNx62iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrhPQ-0003lc-6m; Sat, 04 Jul 2020 12:36:44 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrhPO-0003ky-P0
 for linux-mediatek@lists.infradead.org; Sat, 04 Jul 2020 12:36:43 +0000
Received: by mail-ot1-x341.google.com with SMTP id 72so28454866otc.3
 for <linux-mediatek@lists.infradead.org>; Sat, 04 Jul 2020 05:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z6mV9hDq5aLUv1ieVsH3l3iusJ1iXEPBM/Wq8VobGV4=;
 b=YhkyxlMIzlrMbZCMkgw8ZZ4xFQQWRbvOrg/cac0SP6UAL+dKYfgTmikrEVyuEu+Fa0
 0hea00p6nJ0gX1I4pX7X6WL7xukKfMQvdRH90jKY660TTeTESN8r3Cm8Dcg0VaHrnbBP
 oYyZedahnsh5lSgyTssOpM4B7MeOYQN9Zd7mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6mV9hDq5aLUv1ieVsH3l3iusJ1iXEPBM/Wq8VobGV4=;
 b=XQCSmKZZ1Ph4SAe/SeUrw2GswZdzCpNnWwocQR2WaEQuFgfCMaE5roc5fqFHw9tlrb
 3v7zdIfkwsrZB5HqG8QKZoevtCEQ1gFy1JsGkK4ojRL45UhGN/MauSsA4tTWfmS/iTwR
 JxWx7hfo9rcQ2BBY3bKglsGAygNUfFHV6jxQRGLTcXMzxl1WjnsgYqxnT8OhIerF5Hoh
 /fVTi60Ik7i2Lqc8bU09cH4oc2+mUZFiJFu033Ghf/3VcE2hzEViN/FQyDSRMi+XE5oF
 eUDXuBekZq/3m/q2dVyrIU8gkYYeCfhM82+qaLn0Uk0+eFqdr01GBkKx7fbCm6pLRUKo
 +5zA==
X-Gm-Message-State: AOAM530r0jp3C+vnHQwMakfNX0n1dywyx3yb9NUDKw7nuq0Y8nuhFHSr
 CdLr+LGsfM66YS9xkWLBOIp2YwaH4Mc=
X-Google-Smtp-Source: ABdhPJzpH+tNGAOWlaAi+FlCPr49ztTsk+p4WIVf725mf7UQrAKL6Uqy3ab80aOjj455uPnIOlolLw==
X-Received: by 2002:a05:6830:1313:: with SMTP id
 p19mr31204535otq.132.1593866200300; 
 Sat, 04 Jul 2020 05:36:40 -0700 (PDT)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com.
 [209.85.161.49])
 by smtp.gmail.com with ESMTPSA id g25sm2343994otq.61.2020.07.04.05.36.38
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jul 2020 05:36:38 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id s190so3129689ooa.13
 for <linux-mediatek@lists.infradead.org>; Sat, 04 Jul 2020 05:36:38 -0700 (PDT)
X-Received: by 2002:a4a:1d83:: with SMTP id 125mr35500480oog.18.1593866197876; 
 Sat, 04 Jul 2020 05:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200630062711.4169601-1-acourbot@chromium.org>
 <20200630062711.4169601-5-acourbot@chromium.org>
 <d2c15fbf-0076-37b7-7b87-9ef51e0357d9@xs4all.nl>
In-Reply-To: <d2c15fbf-0076-37b7-7b87-9ef51e0357d9@xs4all.nl>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Sat, 4 Jul 2020 21:36:25 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWZC8j45r5yhGFJJe+gF_aHdwLWb5pUNR7jVoOBeihntA@mail.gmail.com>
Message-ID: <CAPBb6MWZC8j45r5yhGFJJe+gF_aHdwLWb5pUNR7jVoOBeihntA@mail.gmail.com>
Subject: Re: [PATCH 4/9] media: add Mediatek's MM21 format
To: Hans Verkuil <hverkuil@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_083642_845840_539C942B 
X-CRM114-Status: GOOD (  14.65  )
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
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 3, 2020 at 5:39 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 30/06/2020 08:27, Alexandre Courbot wrote:
> > Add Mediatek's non-compressed 8 bit block video mode. This format is
> > produced by the MT8183 codec and can be converted to a non-proprietary
> > format by the MDP3 component.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
> >  include/uapi/linux/videodev2.h       | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index 02bfef0da76d..612be602bf76 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1398,6 +1398,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >       case V4L2_META_FMT_UVC:         descr = "UVC Payload Header Metadata"; break;
> >       case V4L2_META_FMT_D4XX:        descr = "Intel D4xx UVC Metadata"; break;
> >       case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
> > +     case V4L2_PIX_FMT_MM21:         descr = "Mediatek 8-bit block format"; break;
>
> Can you move this up so it comes after V4L2_PIX_FMT_KONICA420?

Sure.

>
> This format should also be added to Documentation/userspace-api/media/v4l/pixfmt-reserved.rst.

Added a description right next to the related MT21C format.

Thanks for the review!
Alex.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
