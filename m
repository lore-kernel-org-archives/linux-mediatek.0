Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4572AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 09:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPcTslv+oi61wdfd9FfOQTroE8grnCK6PmPoy02wck0=; b=pKA68OFk5jgcwp0KJKBYsdQE4S
	04Ggp/Q4DFn8jAwK0Ezm+eqq1jVROnRvsZWv+yu8ECRP/aY3rmjmeRDeWVn96CmaT8ekFR1CFldh0
	bDwOIxiyDOJwmOucXu6DZ9YTiQUmI7fesXwVj4YyzM9ugIXbTRAk19ISCo8FjtImMC9cI1Nd8Q+zv
	IYY23J8DSjA14mlQFIiuaSyaC4Udg78e6GNM8LKe8CNHHWn8oIF+BTv4f94XD4QJ/nEvr1gGRCKKt
	5ZVpssrxqzADfBXQXTcCbUsTIFnm9QD1U02ydWqu5YhzG2WBsvKpt815uP8naY/pW+vjgxidcziYv
	4x9oMOiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhT2v-00Ciri-IP; Thu, 21 Apr 2022 09:24:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhT2s-00Cion-A6; Thu, 21 Apr 2022 09:24:15 +0000
X-UUID: 9bf6fc9d380d4f5aa1801d277cfa2434-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:c3dbf6a3-31e4-4b81-b1ce-d219dcaf1b92, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:7364a3ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 9bf6fc9d380d4f5aa1801d277cfa2434-20220421
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ping-lei.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 378231009; Thu, 21 Apr 2022 02:24:08 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 02:24:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 17:24:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Apr 2022 17:24:05 +0800
From: James_Lin <Ping-lei.Lin@mediatek.com>
To: <nicolas@ndufresne.ca>
CC: <Ping-lei.Lin@mediatek.com>, <acourbot@chromium.org>, <arnd@arndb.de>,
 <ezequiel@vanguardiasur.com.ar>, <hverkuil-cisco@xs4all.nl>,
 <laurent.pinchart@ideasonboard.com>, <lecopzer.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <max.yan@mediatek.com>, <mchehab@kernel.org>,
 <ribalda@chromium.org>, <sakari.ailus@linux.intel.com>,
 <senozhatsky@chromium.org>, <sherlock.chang@mediatek.com>,
 <tm.wu@mediatek.com>
Subject: Re: [PATCH v3] media: usb: uvc: Add UVC_GUID_FORMAT_H265
Date: Thu, 21 Apr 2022 17:23:54 +0800
Message-ID: <20220421092354.16774-1-Ping-lei.Lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <4b6b65e72b3f3cd74af5a3f0069838c86a6725e9.camel@ndufresne.ca>
References: <4b6b65e72b3f3cd74af5a3f0069838c86a6725e9.camel@ndufresne.ca>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_022414_418509_FF77A6AA 
X-CRM114-Status: GOOD (  32.81  )
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
Content-Type: multipart/mixed; boundary="===============8814035496311337942=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============8814035496311337942==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

Hi All,

Do I need to add the comment 
"some cameras represent hevc as h265"
at /drivers/media/usb/uvc/uvc_driver.c ?
Also, is there anything else that needs to be modified?

Or can it move to queue on next merged window?
thanks for your reply

Best regards,
James_Lin

On WED, 20 Apr 2022 at 01:37, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
> Le mardi 19 avril 2022 à 14:18 +0200, Ricardo Ribalda a écrit :
> > On Tue, 19 Apr 2022 at 14:17, Laurent Pinchart 
> > <laurent.pinchart@ideasonboard.com> wrote:
> > > 
> > > Hello,
> > > 
> > > On Tue, Apr 19, 2022 at 01:46:15PM +0200, Ricardo Ribalda wrote:
> > > > On Mon, 18 Apr 2022 at 11:07, James_Lin <Ping-lei.Lin@mediatek.com> wrote:
> > > > > 
> > > > > This patch aims to add UVC_GUID_FORMAT_H265 High Efficiency 
> > > > > Video Coding (HEVC), also known as H.265 and MPEG-H Part 2.
> > > > > They describe the same video encoding method.
> > > > > So for handling their behavior is the same.
> > > > > However, when external camera device describes this encoding 
> > > > > method, some use hevc, some use h265.
> > > > > There is no uniform specification to describe this encoding method.
> > > > > So if an external camera device use h265 to describe this 
> > > > > encoding method, driver will not recognize it.
> > > > > Therefore, this patch is to enable driver to read HEVC/H265 and 
> > > > > convert it to V4L2_PIX_FMT_HEVC.
> > > > > 
> > > > > Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>
> > > > 
> > > > Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > > ---
> > > > >  drivers/media/usb/uvc/uvc_driver.c | 5 +++++
> > > > >  drivers/media/usb/uvc/uvcvideo.h   | 3 +++
> > > > >  2 files changed, 8 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/media/usb/uvc/uvc_driver.c 
> > > > > b/drivers/media/usb/uvc/uvc_driver.c
> > > > > index dda0f0aa78b8..e437e9f95890 100644
> > > > > --- a/drivers/media/usb/uvc/uvc_driver.c
> > > > > +++ b/drivers/media/usb/uvc/uvc_driver.c
> > > > > @@ -154,6 +154,11 @@ static struct uvc_format_desc uvc_fmts[] = {
> > > > >                 .guid           = UVC_GUID_FORMAT_H264,
> > > > >                 .fcc            = V4L2_PIX_FMT_H264,
> > > > >         },
> > > > 
> > > > Maybe I would add a comment here saying that some cameras 
> > > > represent hevc as h265.
> > > 
> > > I wish there would be a 4CC and GUID standard with a centralized 
> > > registry...
> > 
> > Thought that was the kernel codebase :)
> 
> You'll find multiple fourcc for the same thing in the linux kernel ;-P
> 
> > 
> > > 
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > 
> > > > > +       {
> > > > > +               .name           = "H.265",
> > > > > +               .guid           = UVC_GUID_FORMAT_H265,
> > > > > +               .fcc            = V4L2_PIX_FMT_HEVC,
> > > > > +       },
> > > > >         {
> > > > >                 .name           = "Greyscale 8 L/R (Y8I)",
> > > > >                 .guid           = UVC_GUID_FORMAT_Y8I,
> > > > > diff --git a/drivers/media/usb/uvc/uvcvideo.h 
> > > > > b/drivers/media/usb/uvc/uvcvideo.h
> > > > > index 143230b3275b..41f4d8c33f2a 100644
> > > > > --- a/drivers/media/usb/uvc/uvcvideo.h
> > > > > +++ b/drivers/media/usb/uvc/uvcvideo.h
> > > > > @@ -139,6 +139,9 @@
> > > > >  #define UVC_GUID_FORMAT_H264 \
> > > > >         { 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
> > > > >          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > > > > +#define UVC_GUID_FORMAT_H265 \
> > > > > +       { 'H',  '2',  '6',  '5', 0x00, 0x00, 0x10, 0x00, \
> > > > > +        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > > > >  #define UVC_GUID_FORMAT_Y8I \
> > > > >         { 'Y',  '8',  'I',  ' ', 0x00, 0x00, 0x10, 0x00, \
> > > > >          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> > > 
> > > --
> > > Regards,
> > > 
> > > Laurent Pinchart
> > 
> > 
> > 


--===============8814035496311337942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8814035496311337942==--
