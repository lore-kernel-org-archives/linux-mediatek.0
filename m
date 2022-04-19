Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EFDC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 13:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPu4YReSK4rdQFZzbZYDy+ybenV0z1ET7gJ7/c7tf3I=; b=UKzQpxARFAG1Sp
	8iBMBrSmOncfHueDyJ9W3iIMfISz3DKrCvEmv6CdL1Zhi8YJfru1ZrjU1/ZBzQgpgcMwHlLua9O56
	3teLyWddSuw1AiumPV1P/cpkG1wE+nxbTAey68HCe7yMTJp8FT412qJpVFK9H/m0vzukgNQiSeNyr
	tokxKe4UrYpWOHrproURuaGgdDSfcWdalw2dAr12Ejw/h4LbYs8NsXsNvuIdpNCzeu31h3cPppYwT
	9SUbCMhidnzIi8DJSLcsAANj2RVLT/cdBP8ZVHSFYb8d9WTDnmbMsp8UIgRIkx7m6jM/xxJrX95Gw
	mur9WOcVaJf+JflZXSAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnuW-003qVd-GC; Tue, 19 Apr 2022 13:28:52 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmni-003Plo-Qf; Tue, 19 Apr 2022 12:17:49 +0000
Received: from pendragon.ideasonboard.com (85-76-11-253-nat.elisa-mobile.fi
 [85.76.11.253])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA2F025B;
 Tue, 19 Apr 2022 14:17:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650370662;
 bh=P4gIXFtrwQDyN+C6uar+ovwXk6cY3/kQnY32ADsmRFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nblueKlxS7o0DUw7O83Z6nlkNHVGWJx3nEW/tkbsh8zQS7Optx6iFbxnCGdlW17/s
 FaISR5gqVn8baPQaPnAoBPQ3WcRoMx6u2U6QKG1VqtJSi97c+TGFqnBBlR1+3b7Sey
 Ym2OK+uF5V3EpFy5szf/7evp7dUwZLrCVOh8zYB4=
Date: Tue, 19 Apr 2022 15:17:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: James_Lin <Ping-lei.Lin@mediatek.com>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Arnd Bergmann <arnd@arndb.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, sherlock.chang@mediatek.com,
 lecopzer.chen@mediatek.com, max.yan@mediatek.com, tm.wu@mediatek.com
Subject: Re: [PATCH v3] media: usb: uvc: Add UVC_GUID_FORMAT_H265
Message-ID: <Yl6oYlv+t63+5dVP@pendragon.ideasonboard.com>
References: <20220418090652.3156-1-Ping-lei.Lin@mediatek.com>
 <CANiDSCvLb785H7qyAzSfTSBRpO2eM-oJFF5SgVHXdL1O-GusLA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiDSCvLb785H7qyAzSfTSBRpO2eM-oJFF5SgVHXdL1O-GusLA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_051747_061794_47BD5ECB 
X-CRM114-Status: GOOD (  25.20  )
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

Hello,

On Tue, Apr 19, 2022 at 01:46:15PM +0200, Ricardo Ribalda wrote:
> On Mon, 18 Apr 2022 at 11:07, James_Lin <Ping-lei.Lin@mediatek.com> wrote:
> >
> > This patch aims to add UVC_GUID_FORMAT_H265
> > High Efficiency Video Coding (HEVC), also known as H.265 and MPEG-H Part 2.
> > They describe the same video encoding method.
> > So for handling their behavior is the same.
> > However, when external camera device describes this encoding method,
> > some use hevc, some use h265.
> > There is no uniform specification to describe this encoding method.
> > So if an external camera device use h265 to describe this encoding method,
> > driver will not recognize it.
> > Therefore, this patch is to enable driver to read HEVC/H265
> > and convert it to V4L2_PIX_FMT_HEVC.
> >
> > Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>
> 
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/usb/uvc/uvc_driver.c | 5 +++++
> >  drivers/media/usb/uvc/uvcvideo.h   | 3 +++
> >  2 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> > index dda0f0aa78b8..e437e9f95890 100644
> > --- a/drivers/media/usb/uvc/uvc_driver.c
> > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > @@ -154,6 +154,11 @@ static struct uvc_format_desc uvc_fmts[] = {
> >                 .guid           = UVC_GUID_FORMAT_H264,
> >                 .fcc            = V4L2_PIX_FMT_H264,
> >         },
> 
> Maybe I would add a comment here saying that some cameras represent
> hevc as h265.

I wish there would be a 4CC and GUID standard with a centralized
registry...

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > +       {
> > +               .name           = "H.265",
> > +               .guid           = UVC_GUID_FORMAT_H265,
> > +               .fcc            = V4L2_PIX_FMT_HEVC,
> > +       },
> >         {
> >                 .name           = "Greyscale 8 L/R (Y8I)",
> >                 .guid           = UVC_GUID_FORMAT_Y8I,
> > diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> > index 143230b3275b..41f4d8c33f2a 100644
> > --- a/drivers/media/usb/uvc/uvcvideo.h
> > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > @@ -139,6 +139,9 @@
> >  #define UVC_GUID_FORMAT_H264 \
> >         { 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
> >          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > +#define UVC_GUID_FORMAT_H265 \
> > +       { 'H',  '2',  '6',  '5', 0x00, 0x00, 0x10, 0x00, \
> > +        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> >  #define UVC_GUID_FORMAT_Y8I \
> >         { 'Y',  '8',  'I',  ' ', 0x00, 0x00, 0x10, 0x00, \
> >          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}

-- 
Regards,

Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
