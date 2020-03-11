Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B25C10F27
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 11:03:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF8842146E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 11:03:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NCZSo1OL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OzXiZdZx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF8842146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xkek0Pp3Jt+NVb66vtXD40MWc87NPclZrasyRcmd6ug=; b=NCZSo1OLY5ofLz
	CDOR9XiUOym58GeC/hT27wyelSqzPoEyiwLwjnFGuGEze/McG21AvNkHlT7q900MwjaYwrAuvwtbe
	N4Cfmv4j/7xVb6F34YsQsG/ErRHYwawhjCmaQl1+fYEhSkiEzOe3k7UUFRsYaQO0XrS5gPljXS1Y9
	zbf1lqgKmZOk9BCV6VeCRPUu0oFWTqEGRlYO/ozDZCbyYmEXhvUFKzb6C+2Heh983GswKX+/uOm7I
	2MN6esrXicYYkblewU+BzO2J8d8hVHEDP0tv+AWSnWXW2GFyvGDfukHhlCFZSOHUF1AXDacauF/rI
	2Sz56rng051JxJr8FD4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBz8l-0005oE-Ep; Wed, 11 Mar 2020 11:03:07 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBz8i-0005nU-89
 for linux-mediatek@lists.infradead.org; Wed, 11 Mar 2020 11:03:05 +0000
Received: by mail-ed1-x544.google.com with SMTP id h5so2338991edn.5
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2020 04:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jb6YNfpy0i4p0prPq7fXurxyCpu3UioYP/wK0SXZz40=;
 b=OzXiZdZxcla8lff01e5y1xu8R1or7O5akJh7vkF0kGDv+FIl4k+KI5dt7+u7bNa22f
 pEgi1+VeIA0u2roWjwGSIIVN7DccoliwZNCmhlmVo4+QDcI5e0XEPbQld3FfpR1P8z8I
 MP4yhJz3sMk7jvtXq8o0TB7XLMZod2m/M8uIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jb6YNfpy0i4p0prPq7fXurxyCpu3UioYP/wK0SXZz40=;
 b=BAcLKpeIl8Jtqg2dpGfCGblVj6WgPoMu0qCuIa9YBCPLrHiM54IfW6cn8S7ySy64Dj
 taoqxouB0eUYUHgNBkJDV+Kk4yzTknskmSURPDgUh7GUaOQ8jVk0cSsl7GldtDTQ1UOq
 7R3JmzFTENxocDf7Vyh2eus0nmyrvhwCpi1moK16679foWyIbfzgeGgk0PN4BlGpGcJh
 GLW6sTqD7clkMlGcp4nHYdECDrDSXRn4O1FKHUNjQtnQBPpEL86jbi31vjwTj85Y1bEX
 NLm/ruM9hE8yyBjI4aZwLLjaSSiddnAa8uXEizCLp9oOTFkVsx5dyxoI1kq3TLGKnucd
 kkcA==
X-Gm-Message-State: ANhLgQ0I54X6hxlgMJc5nxrpuKeEsjaj1lXSkA6G1lV4uAi1ON6vfZeq
 b6iIUFmOmUU19VkEjvRGb8KzBkOkPzoCUA==
X-Google-Smtp-Source: ADFU+vsWHeVsMB0mEWn7vNhNrFGe5tJgvQF2NH/9w5mGmSXbct0lM+8ztCDs7llQzAzfuVwv2r5GeQ==
X-Received: by 2002:a05:6402:1503:: with SMTP id
 f3mr2329506edw.112.1583924581911; 
 Wed, 11 Mar 2020 04:03:01 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id m1sm1361940ejr.68.2020.03.11.04.03.00
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2020 04:03:01 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id 6so2022338wre.4
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2020 04:03:00 -0700 (PDT)
X-Received: by 2002:adf:f545:: with SMTP id j5mr3918965wrp.295.1583924580138; 
 Wed, 11 Mar 2020 04:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200303123446.20095-1-xia.jiang@mediatek.com>
 <20200303123446.20095-4-xia.jiang@mediatek.com>
In-Reply-To: <20200303123446.20095-4-xia.jiang@mediatek.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 11 Mar 2020 20:02:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AA6NtLDsqL3Ph8cwv5=ZYoPOiu4Wa85ky037qOyMH1QQ@mail.gmail.com>
Message-ID: <CAAFQd5AA6NtLDsqL3Ph8cwv5=ZYoPOiu4Wa85ky037qOyMH1QQ@mail.gmail.com>
Subject: Re: [PATCH v7 03/11] media: platform: Improve s_selection flow for
 bug fixing
To: Xia Jiang <xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_040304_315479_B7E22A4D 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: linux-devicetree <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Rick Chang <rick.chang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Xia,

On Tue, Mar 3, 2020 at 9:35 PM Xia Jiang <xia.jiang@mediatek.com> wrote:
>
> Get correct compose value in mtk_jpeg_s_selection function.

It's a good practice to describe why the current code is wrong and new is good.

>
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Thanks for the patch. Please see my comment inline.

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index da0dae4b0fc9..fb2c8d026580 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -492,8 +492,8 @@ static int mtk_jpeg_s_selection(struct file *file, void *priv,
>         case V4L2_SEL_TGT_COMPOSE:
>                 s->r.left = 0;
>                 s->r.top = 0;
> -               s->r.width = ctx->out_q.w;
> -               s->r.height = ctx->out_q.h;
> +               ctx->out_q.w = s->r.width;
> +               ctx->out_q.h = s->r.height;
>                 break;
>         default:
>                 return -EINVAL;

The decoder compose target means the visible rectangle of the decoded
image, which comes from the stream metadata. It's not something that
can be set by the userspace.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
