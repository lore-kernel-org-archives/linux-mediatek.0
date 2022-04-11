Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92303C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 08:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nR7v7rkolfHES7nW4yR5joGd4vXIkTOSDiJXeQABntk=; b=n2VuLwU3KJjNM/
	FRJGYzmqUyTYkmIEJKjVnm8yM4hKxFocJJIChGSmqMhLxNy8xvfr0B7s29SEWVDL+qkaKvqY01vtk
	aYOT+u6ANJNrXqDSK9ltdDQzlQVduK6h6UgYI/xVtEvPcy8Jv1ULpXKDpuYuG7qGM1d276XM2yAJv
	oJT8aDVl6MWbGp7wj/y3mWNksSuegJuWGddhzGun/6b3ZaqvmGy5usvYo6NQNrH6pWMUcZCnBYRnK
	fd81XQLA7Y6mu7V7lFzkm2uY8LiJBdEprqc7tAuH++fNtvUJcpZssTRj2H2LKe7jc9tx0DPfqJ9HZ
	RaiEyUybmyEF06MBoXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndp9G-007SiO-L6; Mon, 11 Apr 2022 08:11:46 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndp94-007ScD-8Z; Mon, 11 Apr 2022 08:11:35 +0000
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F06F596;
 Mon, 11 Apr 2022 10:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1649664688;
 bh=MLYkgbpD54iW6+0JAiuvwZl8Q20HOOXZR9m9Prv7njw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ce7Bg1cdNzrLNOY6mAtdqI87+BAgT7n8mBUFY0XyebE2eW45SUhW8XDpVvj4tN3a4
 3ef+02Z4PslMY6wGlvA2hVC7ePDBbiC7o1d2cw2EGLIwSuowcvwKxFd7AomrjMMdU3
 9yK4dmUoLp+IQ9WJUdmdLA2kUQFb4GTuYAEyqgc0=
MIME-Version: 1.0
In-Reply-To: <20220411080120.26008-2-Ping-lei.Lin@mediatek.com>
References: <20220411080120.26008-1-Ping-lei.Lin@mediatek.com>
 <20220411080120.26008-2-Ping-lei.Lin@mediatek.com>
Subject: Re: [PATCH v2 1/2] media: usb: uvc: Add H265 pixel format
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Arnd Bergmann <arnd@arndb.de>,
 Ricardo Ribalda <ribalda@chromium.org>, Ming Qian <ming.qian@nxp.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 ping-lei.lin@mediatek.com, lecopzer.chen@mediatek.com, max.yan@mediatek.com,
 sherlock.chang@mediatek.com, tm.wu@mediatek.com,
 James_Lin <Ping-lei.Lin@mediatek.com>
To: James_Lin <Ping-lei.Lin@mediatek.com>, linux-kernel@vger.kernel.org
Date: Mon, 11 Apr 2022 09:11:25 +0100
Message-ID: <164966468564.22830.10326597921182135832@Monstersaurus>
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_011134_489146_BE65EE51 
X-CRM114-Status: GOOD (  11.81  )
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

Quoting James_Lin (2022-04-11 09:01:19)
> Add H265 pixel format.
> So driver can recognize external camera devices 
> whom use h265 to describe High Efficiency Video Coding method.
> 
> Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>
> ---
>  drivers/media/usb/uvc/uvc_driver.c | 5 +++++
>  drivers/media/usb/uvc/uvcvideo.h   | 3 +++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index dda0f0aa78b8..ebb807c33e57 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -154,6 +154,11 @@ static struct uvc_format_desc uvc_fmts[] = {
>                 .guid           = UVC_GUID_FORMAT_H264,
>                 .fcc            = V4L2_PIX_FMT_H264,
>         },
> +       {
> +               .name           = "H.265",
> +               .guid           = UVC_GUID_FORMAT_H265,
> +               .fcc            = V4L2_PIX_FMT_H265,

This is not yet defined I believe, so this patch needs to be 2/2 in this
series - with your following patch first so that they can both compile
independently.

> +       },
>         {
>                 .name           = "Greyscale 8 L/R (Y8I)",
>                 .guid           = UVC_GUID_FORMAT_Y8I,
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 143230b3275b..41f4d8c33f2a 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -139,6 +139,9 @@
>  #define UVC_GUID_FORMAT_H264 \
>         { 'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00, \
>          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> +#define UVC_GUID_FORMAT_H265 \
> +       { 'H',  '2',  '6',  '5', 0x00, 0x00, 0x10, 0x00, \
> +        0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
>  #define UVC_GUID_FORMAT_Y8I \
>         { 'Y',  '8',  'I',  ' ', 0x00, 0x00, 0x10, 0x00, \
>          0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71}
> -- 
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
