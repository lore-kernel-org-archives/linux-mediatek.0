Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C734C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 13:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uvj0MzXl23YPBo5wScD2L7+7u8LXYp8B+bdhNwmyfEk=; b=W/ssaPx3Ja1w0I
	YMcE4WpLC/O+rzVGmWDOFWjtPgOM3D/8Q8Q5LMvCqrR9q/5U5jKfE+/nmWcyPiFYAYvbxGdBHDBas
	ItII6cMQa9iUtOG3ZOkKOnrpxyDWGUb+MZ0tJe71qGdfCINjlhx40uAVzpmQG3OWKI/JsySTbxhpj
	AxuQCge/xLpw+ocwbdCyvsKrZ67Ms8m7pM8Xhw9oR6p9dx8Ar9FapjtaYavVSJQTz0dlk46yxAIp9
	IDu/rrhf/SDyz5qCX/aAYJlghVeujdoVGCV7KBA8hhD35gWlKZ2C1P4Rggw6gO7+xfJkI+g1ETSU+
	VPQCR3gvV/rtv9QrEbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnuc-003qYM-GK; Tue, 19 Apr 2022 13:28:58 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmol-003QD8-98
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 12:18:53 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 i11-20020a9d4a8b000000b005cda3b9754aso11817418otf.12
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 05:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XrmfRSGXipf3L8+lkjXlVpaFbU4A+o7VmUyP1jAwbak=;
 b=Q3tIOnUaas1Yp+PFbgUzB4IUsepB+uNY6tIWTwONet91Fa90m0aTqeiZOJg6BZjotn
 pMorWvoxSPvGKLaMXPIURGwW6qrk90tqc/OOC7xjLhgvh+cv5oJjtTNBdNmN61puW3aa
 7hzrMKzGeaMt+0h7jg3y/9hQ9kRkxKM3pA0L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XrmfRSGXipf3L8+lkjXlVpaFbU4A+o7VmUyP1jAwbak=;
 b=fhXfrjvzOxjt3gUM4cFkFvDpC7Y2wCsMSYNmUNYO7xvC/Rnlq6Z3PI3f8EVm/BAFqK
 m0fcz5OsfUj2YR9aPgrM0eabKasvAensugLJDhQoySUkWQAbLc2dD1KoqYhn4SAFQDKi
 KrRJcxPGOmCaPNxP87HuUdggZAzzynD/WRRmPcz96iYiQ5/SF0GQVJ7osTCkYz0qY4Xu
 o+Q6iyc9J5jYrSd0zsT3vgw7EJuYZwdarprVxC1QFJuCFa2K1KfJxSrgQtqZFJqIL118
 zQzvAnYyaxX2QqbxGPQ9GEl4nikToIZbuHHCkZAvWIkxXy3+gxZlFFX9uDqm/iCkY64K
 S7AA==
X-Gm-Message-State: AOAM533cEu4a+gVcIda+/eEiZsuv5RuxWQ+e5f7boB4M5JAiR1r4rATf
 9V/wIUHfumFuX+QpxoytjBYawcYwqFGubg==
X-Google-Smtp-Source: ABdhPJzcH5Gfe8MeLrQtw3S337sLk5AAtj6SL+NoEqMhevCwUTRdYVSe5twcD1zGNsA+6369LfECjw==
X-Received: by 2002:a9d:57c9:0:b0:605:4ba7:d01f with SMTP id
 q9-20020a9d57c9000000b006054ba7d01fmr3624352oti.106.1650370729918; 
 Tue, 19 Apr 2022 05:18:49 -0700 (PDT)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com.
 [209.85.160.54]) by smtp.gmail.com with ESMTPSA id
 q203-20020acad9d4000000b002f8ee3f69e2sm5060093oig.52.2022.04.19.05.18.49
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 05:18:49 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-e5e433d66dso5897436fac.5
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 05:18:49 -0700 (PDT)
X-Received: by 2002:a05:6871:5cb:b0:e5:db16:5297 with SMTP id
 v11-20020a05687105cb00b000e5db165297mr4428783oan.66.1650370728811; Tue, 19
 Apr 2022 05:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220418090652.3156-1-Ping-lei.Lin@mediatek.com>
 <CANiDSCvLb785H7qyAzSfTSBRpO2eM-oJFF5SgVHXdL1O-GusLA@mail.gmail.com>
 <Yl6oYlv+t63+5dVP@pendragon.ideasonboard.com>
In-Reply-To: <Yl6oYlv+t63+5dVP@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 19 Apr 2022 14:18:37 +0200
X-Gmail-Original-Message-ID: <CANiDSCv0BA5C8ijO-T_3c2rxGD_yC0LGuG77THkC7_52GZ-dtA@mail.gmail.com>
Message-ID: <CANiDSCv0BA5C8ijO-T_3c2rxGD_yC0LGuG77THkC7_52GZ-dtA@mail.gmail.com>
Subject: Re: [PATCH v3] media: usb: uvc: Add UVC_GUID_FORMAT_H265
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: James_Lin <Ping-lei.Lin@mediatek.com>, linux-kernel@vger.kernel.org, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Arnd Bergmann <arnd@arndb.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Alexandre Courbot <acourbot@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, sherlock.chang@mediatek.com, 
 lecopzer.chen@mediatek.com, max.yan@mediatek.com, tm.wu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_051851_415615_7DE65DD5 
X-CRM114-Status: GOOD (  31.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 19 Apr 2022 at 14:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Tue, Apr 19, 2022 at 01:46:15PM +0200, Ricardo Ribalda wrote:
> > On Mon, 18 Apr 2022 at 11:07, James_Lin <Ping-lei.Lin@mediatek.com> wrote:
> > >
> > > This patch aims to add UVC_GUID_FORMAT_H265
> > > High Efficiency Video Coding (HEVC), also known as H.265 and MPEG-H Part 2.
> > > They describe the same video encoding method.
> > > So for handling their behavior is the same.
> > > However, when external camera device describes this encoding method,
> > > some use hevc, some use h265.
> > > There is no uniform specification to describe this encoding method.
> > > So if an external camera device use h265 to describe this encoding method,
> > > driver will not recognize it.
> > > Therefore, this patch is to enable driver to read HEVC/H265
> > > and convert it to V4L2_PIX_FMT_HEVC.
> > >
> > > Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>
> >
> > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/usb/uvc/uvc_driver.c | 5 +++++
> > >  drivers/media/usb/uvc/uvcvideo.h   | 3 +++
> > >  2 files changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > > index dda0f0aa78b8..e437e9f95890 100644
> > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > @@ -154,6 +154,11 @@ static struct uvc_format_desc uvc_fmts[] = {
> > >                 .guid           = UVC_GUID_FORMAT_H264,
> > >                 .fcc            = V4L2_PIX_FMT_H264,
> > >         },
> >
> > Maybe I would add a comment here saying that some cameras represent
> > hevc as h265.
>
> I wish there would be a 4CC and GUID standard with a centralized
> registry...

Thought that was the kernel codebase :)

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > > +       {
> > > +               .name           = "H.265",
> > > +               .guid           = UVC_GUID_FORMAT_H265,
> > > +               .fcc            = V4L2_PIX_FMT_HEVC,
> > > +       },
> > >         {
> > >                 .name           = "Greyscale 8 L/R (Y8I)",
> > >                 .guid           = UVC_GUID_FORMAT_Y8I,
> > > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > > index 143230b3275b..41f4d8c33f2a 100644
> > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > @@ -139,6 +139,9 @@
> > >  #define UVC_GUID_FORMAT_H264 \
> > >         { 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
> > >          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > > +#define UVC_GUID_FORMAT_H265 \
> > > +       { 'H',  '2',  '6',  '5', 0x00, 0x00, 0x10, 0x00, \
> > > +        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > >  #define UVC_GUID_FORMAT_Y8I \
> > >         { 'Y',  '8',  'I',  ' ', 0x00, 0x00, 0x10, 0x00, \
> > >          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
