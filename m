Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0911EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3i7cSS5OqE2RayrygpF6NAfn2I+DEjyhJoSs3l4CIV4=; b=Z6cxrnCWbMAoAB
	zeCOTbWLfXs2AsIWbTI6gBdhKJI0bafVElDZnEIT/87CQuit3vm4aWBlCYg+gE5jCoxthU5MfUqMH
	dCKMKCPGA+JBtVTzTMpe2r+/hpCUKwQEipMlxOxTydo5Li6g++IM8nDi4r+Oxas2ZTwvhtrkIOQNq
	LMSDnzeyhPNNx5iW3VtAX9hA/9IjRhJArBgv/mxeAioUE8ThDfGcNf9YJpewQsr1t0OoJMg7GgFQP
	78aNWmN5LUhT0jxsxZZQsWcdjMeBJynhxJINCfcgWZ5N/a9IawRYSDJxJWk+I79VucEJk8ge3Wv6k
	QEdCymOFBcmQ1r2vJhvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngncJ-003jDw-W3; Tue, 19 Apr 2022 13:10:04 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmR0-003HB1-1I
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 11:54:20 +0000
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-e5e8523fcbso5623804fac.10
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 04:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zr+VGX0mhBp9NZinaclK39Iaheyjh+GcxufQM98q2T4=;
 b=TaPVENVs6UeX/0wd28BijzB9+2vH3hkykLfAx6Z+TianLJL/RErxbAX9zvCD+siM/Z
 uLqmKaIs6I21/BZuoX5aH54xHpMduMGKHjQmyllRJaUuuBA2culEnlxqKuir7uxiFapV
 3KrFAo/2ggciJwo9Etg/qeEu5hsSc4fTqlm8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zr+VGX0mhBp9NZinaclK39Iaheyjh+GcxufQM98q2T4=;
 b=mqqLfdJXBx2SaUmsjn8LqC6RJ7FCe6w1/5x4UsaBbsgd2juCDPTHjHChQuyAvtp9GA
 9qHmzPa+4KzsvmchdGt/tSR96/hDpMGsYizPZgBo/hcjsL5WBzK4jfX6mqaUC89eEZZj
 WgKPh9MshCNWxh9VtUlxg4iRabDoQtaHUqFTn/E/UC8kjzyeBIlv02zI6tvtAmO35kU2
 n1CPiyCkjSmZJXiatZXFOElV9r2w4rnjmideDVHPWgoWLwP2thlnfcTvSPLM0yOda0ZU
 pjFsbJhSj3zNR0PQIuJT9YeJnHdteluDD/QqObmc1SpQByROPS98FJlRUiml3/bdla6U
 N/Gw==
X-Gm-Message-State: AOAM5310Cn8Kr3vtGCkKrG6Q1TPO8Xf5EKeWc0pUNvomV1lec+BDLiRc
 QVLja/3Y13GlAUdCdxvEWmS9kdYY3xB26A==
X-Google-Smtp-Source: ABdhPJwR36N39A3FS7xYdfd2lNdkSlMfrvZQto2NgYWev6XDi9dliqpFywz+lH2hZhiH2FbNgFPkNw==
X-Received: by 2002:a05:6870:1710:b0:e5:bd83:fa8 with SMTP id
 h16-20020a056870171000b000e5bd830fa8mr5818865oae.124.1650369254502; 
 Tue, 19 Apr 2022 04:54:14 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com.
 [209.85.210.44]) by smtp.gmail.com with ESMTPSA id
 17-20020a056870121100b000e296227c9bsm4990440oan.9.2022.04.19.04.54.14
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 04:54:14 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so5582821otu.4
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 04:54:14 -0700 (PDT)
X-Received: by 2002:a4a:8081:0:b0:33a:52ed:3b3b with SMTP id
 z1-20020a4a8081000000b0033a52ed3b3bmr1777631oof.26.1650368786395; Tue, 19 Apr
 2022 04:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220418090652.3156-1-Ping-lei.Lin@mediatek.com>
In-Reply-To: <20220418090652.3156-1-Ping-lei.Lin@mediatek.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 19 Apr 2022 13:46:15 +0200
X-Gmail-Original-Message-ID: <CANiDSCvLb785H7qyAzSfTSBRpO2eM-oJFF5SgVHXdL1O-GusLA@mail.gmail.com>
Message-ID: <CANiDSCvLb785H7qyAzSfTSBRpO2eM-oJFF5SgVHXdL1O-GusLA@mail.gmail.com>
Subject: Re: [PATCH v3] media: usb: uvc: Add UVC_GUID_FORMAT_H265
To: James_Lin <Ping-lei.Lin@mediatek.com>
Cc: linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
X-CRM114-CacheID: sfid-20220419_045418_178192_8DEDE9D9 
X-CRM114-Status: GOOD (  23.98  )
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

Thanks for your patch

On Mon, 18 Apr 2022 at 11:07, James_Lin <Ping-lei.Lin@mediatek.com> wrote:
>
> This patch aims to add UVC_GUID_FORMAT_H265
> High Efficiency Video Coding (HEVC), also known as H.265 and MPEG-H Part 2.
> They describe the same video encoding method.
> So for handling their behavior is the same.
> However, when external camera device describes this encoding method,
> some use hevc, some use h265.
> There is no uniform specification to describe this encoding method.
> So if an external camera device use h265 to describe this encoding method,
> driver will not recognize it.
> Therefore, this patch is to enable driver to read HEVC/H265
> and convert it to V4L2_PIX_FMT_HEVC.
>
> Signed-off-by: James_Lin <Ping-lei.Lin@mediatek.com>

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> ---
>  drivers/media/usb/uvc/uvc_driver.c | 5 +++++
>  drivers/media/usb/uvc/uvcvideo.h   | 3 +++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
> index dda0f0aa78b8..e437e9f95890 100644
> --- a/drivers/media/usb/uvc/uvc_driver.c
> +++ b/drivers/media/usb/uvc/uvc_driver.c
> @@ -154,6 +154,11 @@ static struct uvc_format_desc uvc_fmts[] = {
>                 .guid           = UVC_GUID_FORMAT_H264,
>                 .fcc            = V4L2_PIX_FMT_H264,
>         },

Maybe I would add a comment here saying that some cameras represent
hevc as h265.

> +       {
> +               .name           = "H.265",
> +               .guid           = UVC_GUID_FORMAT_H265,
> +               .fcc            = V4L2_PIX_FMT_HEVC,
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


-- 
Ricardo Ribalda

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
