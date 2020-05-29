Return-Path: <SRS0=oumW=7L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45852C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 13:00:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1774B2065C
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 May 2020 13:00:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="krkTmJy4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H3WKE33Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1774B2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upuYppvjp5KCbt+uT4hwk9RRw7esjzxqAHQuEmjebY8=; b=krkTmJy4o52fAu
	PLhb9CXIhjO06Xlo2L2y8M5pAIPb+QXlAK7JR1U2vJc3c5ZiM55Re3P+Xp/8y2C2KWgTYOVFjClgL
	mXJ2jVMg+ft5SdCKysusM8lj+2wOMQqkFsYRfCrnGw49/L77uBhRAEiP8t8FsQUn5/efkLF7ms4yA
	IxXCGKwkJfON0NWnK3D01NEI7RiO/2fJDYI1jssO7As3+5eHmGM8RFoI92bzyRofoHls6vZadTQ0h
	h0DbaozhnFy5zSiHGh+ul190afb2Wz4ymMMR0l+LqJzeqHu991VkPpFGwCKODKoRozo0Rhym911uc
	QmBbRoAXTKZ1xPLAlUzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeecO-0007QI-Su; Fri, 29 May 2020 13:00:12 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeecL-0006bQ-Tp
 for linux-mediatek@lists.infradead.org; Fri, 29 May 2020 13:00:11 +0000
Received: by mail-ed1-x541.google.com with SMTP id g1so786993edv.6
 for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2020 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EhFSDXU1We6MxQ3A30hDWSzixs2ZuY4gm72YbRtPSf0=;
 b=H3WKE33Yfrk2ofx0uBESQHJLLUkIeecskcmrdXLXas9E8mbcYywjhIDw9bv8Yuc3g9
 lCsuTTsdvojnpa1X6GemeCELH+tvho4BL2/5kO7mNp/o0hJOpNYSn1hJxcorocJO65wm
 +rH9AApLN161WUw5okckWwfAIhbAsIN1U8Cqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EhFSDXU1We6MxQ3A30hDWSzixs2ZuY4gm72YbRtPSf0=;
 b=uRzpG7tVLFpIwHtjbM6l/H2lPylvhfhaQZPuAO98QEVYcdZPUCXReBDVyPf+p7L7nf
 Jjf3Qj3EXETWOZcVzN2NNAubbo/qnwx/W1TpiypJufZEaEaVKwQqCPssM85KD78YzMY2
 R1KAzz0E6xWU7oqO1KxOXLwN+mOlfsZNvgt98sC/TuUzBwrhXNkRCJy6gbCBCXscCMG9
 Rwn7uTyEbkT7OuSP80/95eXuT/rt/JKV6T80CK4k54TZtQDoOT3rrf4I3TYk+J1QxpEy
 iEUvBnGljDihxUDmEn9hp2YatS+GrzUcLP76B22L+lixMzcAqRh8Ait9IzaiAu6oOh8X
 nazw==
X-Gm-Message-State: AOAM532bCeg6XJCkXSIkDSJ1gArZdpINu21nsyTXtBCJ/i7V+34r+agI
 i/5BzDQPpgxnzwwUj3KHnsWzMAJsW8+Otw==
X-Google-Smtp-Source: ABdhPJzel82ZRW2NHX2rR1gGHC6VlZz38h0nHVTsp8mS8Ijqi9obm7qrL730NEVnC4AxWq4U8sEbSg==
X-Received: by 2002:aa7:d787:: with SMTP id s7mr8218112edq.104.1590757207948; 
 Fri, 29 May 2020 06:00:07 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id dn15sm7747597ejc.26.2020.05.29.06.00.06
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 06:00:06 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id x6so3390729wrm.13
 for <linux-mediatek@lists.infradead.org>; Fri, 29 May 2020 06:00:06 -0700 (PDT)
X-Received: by 2002:a5d:6750:: with SMTP id l16mr8589349wrw.295.1590757206037; 
 Fri, 29 May 2020 06:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-5-Jerry-Ch.chen@mediatek.com>
 <20200521182825.GA249683@chromium.org>
 <1590156658.27807.84.camel@mtksdccf07>
 <CAAFQd5DodDfWsHkhQZP-M70k9_2sUwwb4zHtWfTx5EDyEKkwow@mail.gmail.com>
 <1590755163.23156.24.camel@mtksdccf07>
In-Reply-To: <1590755163.23156.24.camel@mtksdccf07>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 29 May 2020 14:59:55 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BBfapVv_3cwGte=p=6G8QXZQP=-ciZ8NBZZeSBGrHmCA@mail.gmail.com>
Message-ID: <CAAFQd5BBfapVv_3cwGte=p=6G8QXZQP=-ciZ8NBZZeSBGrHmCA@mail.gmail.com>
Subject: Re: [RFC PATCH V4 4/4] platform: mtk-isp: Add Mediatek FD driver
To: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_060009_983037_3125A3D2 
X-CRM114-Status: GOOD (  11.43  )
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
 =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 zwisler@chromium.org, srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
 Sj Huang <sj.huang@mediatek.com>, yuzhao@chromium.org,
 Hans Verkuil <hans.verkuil@cisco.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <frederic.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 29, 2020 at 2:26 PM Jerry-ch Chen
<Jerry-ch.Chen@mediatek.com> wrote:
>
> Hi Tomasz,
>
> I Appreciate your review comments, here's the reply.
>
> On Mon, 2020-05-25 at 14:24 +0200, Tomasz Figa wrote:
> > r
> >
> > On Fri, May 22, 2020 at 4:11 PM Jerry-ch Chen
> > <Jerry-ch.Chen@mediatek.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Thu, 2020-05-21 at 18:28 +0000, Tomasz Figa wrote:
> > > > Hi Jerry,
> > > >
> > > > On Wed, Dec 04, 2019 at 08:47:32PM +0800, Jerry-ch Chen wrote:
[snip]
> > Isn't still a need to clamp() width and height to min/max, though?
> Yes, I'll add them back.
>
> This function will be refined as :
>
> static void mtk_fd_fill_pixfmt_mp(struct v4l2_pix_format_mplane *dfmt,
>                                   u32 pixfmt)
> {
>         v4l2_fill_pixfmt_mp(dfmt, pixfmt, dfmt->width, dfmt->height);
>
>         dfmt->field = V4L2_FIELD_NONE;
>         dfmt->colorspace = V4L2_COLORSPACE_BT2020;
>         dfmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
>         dfmt->quantization = V4L2_QUANTIZATION_DEFAULT;
>         dfmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(dfmt->colorspace);
>
>         /* Keep user setting as possible */
>         dfmt->width = clamp(dfmt->width,
>                             MTK_FD_OUTPUT_MIN_WIDTH,
>                             MTK_FD_OUTPUT_MAX_WIDTH);
>         dfmt->height = clamp(dfmt->height,
>                              MTK_FD_OUTPUT_MIN_HEIGHT,
>                              MTK_FD_OUTPUT_MAX_HEIGHT);

Note that this would cause the other fields of dfmt to be inconsistent
with width and height. The correct way to do this would be to first
clamp and then call v4l2_fill_pixfmt_mp().

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
