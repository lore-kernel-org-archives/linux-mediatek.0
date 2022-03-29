Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B922C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 07:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxV2qu3BIrcLShow7yeft4+TYtt4W6S6Gl95kobPHN0=; b=UywsoaQS/qCovf
	wnNQUtvqDQf5mJF2yjh15/IEEMZHiASayPnufxzLN7u7B9eMWkUhimNsWfN2q7WwVJkHEWYFCoyha
	wUYTSGV7giAo3XQORJMmHaImXMoCqQGDGA78jHVwGWYhBNiGad4l0QlWu+zMiWtgq+KrOF7zczhyE
	gP5SCYrhVt+kuh0hB/2fUBSnHSUOGIQSh2VK8jxI7a9uaQiNA4RS+GtHupQFHvBhFOMiydtXVXqZy
	mVsoJ09+yVkgXE4mjOmFQvtAxDBYA9cO0CzWFuQqVzx82Ay2IAgLwb2xfEPPvv+TQ/YWMVbw87+yN
	mcJivz9sc9MpV7jhSwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ6IG-00BK4D-ML; Tue, 29 Mar 2022 07:29:32 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ6I2-00BJzt-Pt
 for linux-mediatek@lists.infradead.org; Tue, 29 Mar 2022 07:29:20 +0000
Received: by mail-ej1-x62a.google.com with SMTP id pv16so33280203ejb.0
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Mar 2022 00:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dqmzVf4HuRmhAchjZgNSPhE8AVhbwZNDHMgFePcWJ64=;
 b=TH05u5GwaYPY4m0KWMEQoIynpfP3ShGtuFaZpPdZWKQpXidPEvntczSz3nnlT7itzJ
 3+4uHXo3zZ2GjGdK6lAhUStazFF8Q6pcpUU//mxVra0oEQWjI1SOlaulqDahxTsclkdq
 XfDPEH37XA/cb03caykepwacucw786o4Bkgi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dqmzVf4HuRmhAchjZgNSPhE8AVhbwZNDHMgFePcWJ64=;
 b=Hq85GUHpWvFS8l7Um8t1WmnZ1ONNJfYK1lw7vetXXC7AtYV9rKxnNVb6U9vAoYqrza
 gUKgPZEJsT0fR4Abpezkrr+3wauZ3JEPW4khCr+jV72H7/xagDkurSJ8EAggvPwEDNbM
 OLGDTaIGaIJES3hfkhmVWziH+k5pFZprwLah0X6MfB4Ic8q2RfWhiOXFINiYTwUxk+2A
 8CnP+P6cs7XpRIqml7r9Z2Cn1GuWtYh4bs22tnfSurxbRc3lsBlBvba/Tqbv1CMBbqD5
 JcM/cmsSgnJdcdmnB9OgRP6UC5rS2qkHKQm22LfcEKKojT/ePI6kQMIoAHkECaTk0Jje
 DFGQ==
X-Gm-Message-State: AOAM531fzLNpTCHufy04HRBdG72ow5pyfIAPwy+KAEtFFGJqBMvCPK8Q
 bTJGwrNJ8bmLoukltnL1w4wqQpNL3+kyDZTa
X-Google-Smtp-Source: ABdhPJxkxiji3m2FXFN+k6aAyKy3jFJJhCowe+5svF3hDVzi1G0/5tE/gbHehmcGXJrUB/O1lZvrEg==
X-Received: by 2002:a17:906:3a15:b0:6cf:ea4e:a1cc with SMTP id
 z21-20020a1709063a1500b006cfea4ea1ccmr33674651eje.753.1648538957340; 
 Tue, 29 Mar 2022 00:29:17 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 bm5-20020a170906c04500b006ce6f8892a5sm6721997ejb.7.2022.03.29.00.29.15
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 00:29:15 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id w25so19612727edi.11
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Mar 2022 00:29:15 -0700 (PDT)
X-Received: by 2002:a05:6402:5106:b0:419:45cd:7ab0 with SMTP id
 m6-20020a056402510600b0041945cd7ab0mr2822380edd.116.1648538954636; Tue, 29
 Mar 2022 00:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220329071407.17703-1-Ping-lei.Lin@mediatek.com>
In-Reply-To: <20220329071407.17703-1-Ping-lei.Lin@mediatek.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 29 Mar 2022 09:29:03 +0200
X-Gmail-Original-Message-ID: <CANiDSCu+YBTp098kTYFrFmFNGQ_s8thHR8NgAuwPFXPboXwNmQ@mail.gmail.com>
Message-ID: <CANiDSCu+YBTp098kTYFrFmFNGQ_s8thHR8NgAuwPFXPboXwNmQ@mail.gmail.com>
Subject: Re: [PATCH] Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>
To: James_Lin <ping-lei.lin@mediatek.com>
Cc: linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Arnd Bergmann <arnd@arndb.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Ming Qian <ming.qian@nxp.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sherlock.Chang@mediatek.com, TM.Wu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_002918_852374_49674537 
X-CRM114-Status: GOOD (  17.54  )
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

Hi James

Thanks for your patch, you should:

- Provide a more descriptive commit message
- Add the new format to the documentation
- Split the uvc changes with the videodev changes
- Keep some kind of alphabetic order in the formats

You could take a look to 0376a51fbe5e11a59d6a5c55e57cc201da06dbe0
media: v4l: Add packed YUV444 24bpp pixel format  for inspiration

Regards

On Tue, 29 Mar 2022 at 09:14, James_Lin <Ping-lei.Lin@mediatek.com> wrote:
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
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 96e307fe3aab..aeaeb29307a4 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1402,6 +1402,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>                 case V4L2_PIX_FMT_JPEG:         descr = "JFIF JPEG"; break;
>                 case V4L2_PIX_FMT_DV:           descr = "1394"; break;
>                 case V4L2_PIX_FMT_MPEG:         descr = "MPEG-1/2/4"; break;
> +               case V4L2_PIX_FMT_H265:         descr = "H.265"; break;
>                 case V4L2_PIX_FMT_H264:         descr = "H.264"; break;
>                 case V4L2_PIX_FMT_H264_NO_SC:   descr = "H.264 (No Start Codes)"; break;
>                 case V4L2_PIX_FMT_H264_MVC:     descr = "H.264 MVC"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 3768a0a80830..636e4236bfb8 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -691,6 +691,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_JPEG     v4l2_fourcc('J', 'P', 'E', 'G') /* JFIF JPEG     */
>  #define V4L2_PIX_FMT_DV       v4l2_fourcc('d', 'v', 's', 'd') /* 1394          */
>  #define V4L2_PIX_FMT_MPEG     v4l2_fourcc('M', 'P', 'E', 'G') /* MPEG-1/2/4 Multiplexed */
> +#define V4L2_PIX_FMT_H265     v4l2_fourcc('H', '2', '6', '5') /* H265 with start codes */
>  #define V4L2_PIX_FMT_H264     v4l2_fourcc('H', '2', '6', '4') /* H264 with start codes */
>  #define V4L2_PIX_FMT_H264_NO_SC v4l2_fourcc('A', 'V', 'C', '1') /* H264 without start codes */
>  #define V4L2_PIX_FMT_H264_MVC v4l2_fourcc('M', '2', '6', '4') /* H264 MVC */
> --
> 2.18.0
>


-- 
Ricardo Ribalda

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
