Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77EE6C4345E
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 09:07:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 411EF20714
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 09:07:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uJin/oV/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mjEnxSSW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 411EF20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ha+trrNevo1iIuTYWyamOqC2mP9HxdRTkbJzX910iM=; b=uJin/oV/TbS3x8yfzY3E4yxuN
	we0PIDENgddHseQWS0rs6ga2hfnWs5MDK6q85vhny81R5u7YK6/GUSdo7K4AAnBbgb9cI4FWw9KwT
	nRKU/xL3ZvJCfCFBCylZL7NonK1ECQEY2IsZHRjqDGbg/SCTp9o6CUsoAsD/G2oPd7JskJj3tEkbk
	EtEBPSqn4qwOJssu06xYsA7VDtxHZjZ/pO+TOxypoEoOaHjaRmtkMuHWi2h8nR9/0hdfU7EelgXDR
	w7ZSyCrenKFay/axAb1TDbdFWJjqHqo5jf6R1KRZLz3lzpH3DMhsbk0tU+rSw9jbGEZCWBtLjl/HF
	e7VrwMReA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzz5z-0005lZ-LJ; Mon, 27 Jul 2020 09:06:56 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzz5u-0005iD-7Q
 for linux-mediatek@lists.infradead.org; Mon, 27 Jul 2020 09:06:52 +0000
Received: by mail-oi1-x242.google.com with SMTP id 12so13750438oir.4
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9DYPZ/cg5bWE+8mLgqqq5d9bdeBFDbTl2cHuY4OPgV8=;
 b=mjEnxSSWFDn78QhEXgzlYfh83jJuISJo2pdRp1br6PNji3pirhIc1VAtH1Z/j4oyhV
 NFTROO0H/SWb6rGbVv/F4z46CtgbeyWbJ5aDTP/EKWrSYArqEHOJpi8ctMUkST74mOwx
 SKd2hFHI0GgPrHFFYZm/RBbnj7FnmTCCNNz9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9DYPZ/cg5bWE+8mLgqqq5d9bdeBFDbTl2cHuY4OPgV8=;
 b=jJDoRI40LKHrD6SUbZ0+y0Ba2/aZST9wmBRqdCKjSy642k816prCJr1D4BZmihReEO
 i7l4FQrA9qJjtknNgNjQDSTM3BEgcJArtOInhDX5VgCoBGQm7shOPPLyV//UYLcWNKqU
 kmFspkU4fu4UF7JXbhVHHxXN9Lk1QIOpCBh1V14EJXh2G3aGBCT4OiOEiacEWBCW3uzz
 f/L5DxqXqs2R6jvZWAnl/Rxd4lgNaa3u3LH8FXOJK6wvlEr7WNeRZfc/4xWuLEFPDkD1
 h7XS7L699h2EpmqjyrNP3XZP0tO9ftxA5tHqnvket6N/soYM3jDUfWsAXugtN8EVFEFn
 btKQ==
X-Gm-Message-State: AOAM532V2dzVXo7/tONAaOCuS3EeVlePm//Ot3K9pW5FKdA4dYkzBc8/
 nihH6DACHlzkr+614ywpOjtKrOhu4L4=
X-Google-Smtp-Source: ABdhPJxXzy/anwFwsGJmkJ5F8tqQKC7iXArIVpORTpExpi3U9Zuh4/vcskxa0A/rGkixbQ3rqAl0ww==
X-Received: by 2002:aca:b689:: with SMTP id g131mr17467731oif.62.1595840807370; 
 Mon, 27 Jul 2020 02:06:47 -0700 (PDT)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com.
 [209.85.161.52])
 by smtp.gmail.com with ESMTPSA id 100sm3216718otu.52.2020.07.27.02.06.45
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2020 02:06:46 -0700 (PDT)
Received: by mail-oo1-f52.google.com with SMTP id z10so138002ooi.10
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 02:06:45 -0700 (PDT)
X-Received: by 2002:a05:6820:1015:: with SMTP id
 v21mr19420231oor.50.1595840804794; 
 Mon, 27 Jul 2020 02:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-3-acourbot@chromium.org>
 <CAAEAJfD8yfdTptkmXoPzrw6S=6eKr=K4yL9-5aq2JtWF7M3=7w@mail.gmail.com>
In-Reply-To: <CAAEAJfD8yfdTptkmXoPzrw6S=6eKr=K4yL9-5aq2JtWF7M3=7w@mail.gmail.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 27 Jul 2020 18:06:31 +0900
X-Gmail-Original-Message-ID: <CAPBb6MW3AC2savGCHk8w98u1oRuZAs9m6sqz++ksJ58DGvJ5nQ@mail.gmail.com>
Message-ID: <CAPBb6MW3AC2savGCHk8w98u1oRuZAs9m6sqz++ksJ58DGvJ5nQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_050650_713385_77E8DD63 
X-CRM114-Status: GOOD (  22.87  )
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
 devicetree <devicetree@vger.kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2020 at 6:37 AM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
>
> On Mon, 13 Jul 2020 at 03:09, Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > The mediatek codecs can use either the VPU or the SCP as their interface
> > to firmware. Reflect this in the DT bindings.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > index b6b5dde6abd8..7aef0a4fe207 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > @@ -19,7 +19,9 @@ Required properties:
> >  - iommus : should point to the respective IOMMU block with master port as
> >    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> >    for details.
> > -- mediatek,vpu : the node of video processor unit
> > +One of the two following nodes:
> > +- mediatek,vpu : the node of the video processor unit, if using VPU.
> > +- mediatek,scp : the noode of the SCP unit, if using SCP.
> >
>
> This interface doesn't enforce the fact only one of the two
> should be present, but not both (which is the case, right?).

That's correct.

>
> I hope I'm not bikeshedding here, but from an interface POV,
> would it be cleaner to just have a single mediatek,coprocessor
> property, and then use of_device_is_compatible
> to distinguish VPU from SCP type?

From an interface point of view maybe, however doing so would
introduce a backward-incompatible change with the existing MT8173
bindings. I also feel like it is less error-prone to have the property
explicitly state what it is expecting at the other end of the phandle
(vpu or scp) instead of the more generic "coprocessor".

>
> Moreover, I'd argue you don't need a dt-binding change
> and should just keep the current mediatek-vpu property,
> and then rely on of_device_is_compatible.

VPU and SCP are different kinds of processors, so I'm not sure whether
it is desirable to use VPU interchangeably like this. Note that I'm
not strongly against it either, but for things like bindings I tend to
prefer precise language to avoid confusions.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
