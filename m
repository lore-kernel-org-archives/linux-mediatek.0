Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776F6C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 19:35:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 218C422B4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 19:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 218C422B4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kKE0XWWYmbxufQ4OrIQ2TEzhJZMaA2LpKxFxwn9GUrg=; b=YWRlOahY2akeTDCgowWuQg7AF
	tBzaPcR5N3AD2lOQFvs+TUjN2ycDvWmLtJH2r3IZ1MkGDh3btHgOPTKaeDuidzKTOwvmuXUZcu4+L
	6xZiOQoQV37EdpOmDkr/3I9QaiISYEF6qf0JxbSj75IxUhiy1wEnQv971i8SS/pevIBRAsje8tUpf
	WMqwPTcng8fjJ5zLrXqi7tvreBmsr41AQn482E6Xzy5TIR3PeC0QNPrsHy9Vzu73A4/ike5+ZUhY6
	/+yV4Q48A6KiVdgr3jYWrnRM+KuiaOVU85T9Oc0uYi7Lnl9KMKh56lgvAUoALgkTupOnWHnOoZco+
	+wPqPWcjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krQy5-0003XL-1O; Mon, 21 Dec 2020 19:35:41 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krQy1-0003Wa-DK; Mon, 21 Dec 2020 19:35:38 +0000
Received: by mail-ot1-f48.google.com with SMTP id a109so9859024otc.1;
 Mon, 21 Dec 2020 11:35:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rq1jfsES1jNvFyfIPsyO2OkYhszsP8atYxGhkgzfZmI=;
 b=DQXTKOsn6HgcptsIfnWu7yiV8xi+d+L2x+mJL6eTbmehHpj9sybOGTamfUqk5CLWMo
 P02ZaR/8L5gbhvZHftte6z+aCOnLNPbDCizAdD3/QEWERrQ9u9BdglvGOPunEJTPoCkm
 co6TQH5zU7uKtfvv0qm9kfaNeP7Ek/ThG5VwrDZG39AsUr28IS3lomgliipj/qsLVYVv
 e2e/ET/p4n78P4rT7ZPQnzUtuUCe4hI7GjStJi2vpBqCkriRIHe/uphz4C7kKJnaQuXE
 uMvXxi2O8NKy5SGXUeLjGu7Ny6KdGj4nQApL1WZhVu2z5zu2/JsPzVH0GqkUAC5SQ97c
 yndQ==
X-Gm-Message-State: AOAM531DeV5nHTh4Az0mHeCeQj4jEXhqqrMSFdNtn1H0n3u4/beFHBlp
 l/G3JNdzGXq5Mat733dROw==
X-Google-Smtp-Source: ABdhPJznFP9S536Tgj5gc+682RmlMb2tcCWmJvcDp6wrsmOD79KMuGP4y72iX2hNShHSW23ImuxHxA==
X-Received: by 2002:a9d:3d06:: with SMTP id a6mr12825266otc.368.1608579336621; 
 Mon, 21 Dec 2020 11:35:36 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id v23sm3976416otj.68.2020.12.21.11.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 11:35:35 -0800 (PST)
Received: (nullmailer pid 419649 invoked by uid 1000);
 Mon, 21 Dec 2020 19:35:33 -0000
Date: Mon, 21 Dec 2020 12:35:33 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 2/3] usb: xhci-mtk: fix UAS issue by XHCI_BROKEN_STREAMS
 quirk
Message-ID: <20201221193533.GB407645@robh.at.kernel.org>
References: <20201216115125.5886-1-chunfeng.yun@mediatek.com>
 <20201216115125.5886-2-chunfeng.yun@mediatek.com>
 <CANMq1KDBmuoBNeizm9+f1yJgqF9oMqU5k26KfZrSdjrPQm_LwA@mail.gmail.com>
 <1608171557.23328.53.camel@mhfsdcap03>
 <CANMq1KA4L4PPRgHTmeisfSWu4qgjgNVFZRvxeuAOyq2_TimELA@mail.gmail.com>
 <1608186230.23328.78.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1608186230.23328.78.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_143537_949783_5597A97B 
X-CRM114-Status: GOOD (  33.23  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 17, 2020 at 02:23:50PM +0800, Chunfeng Yun wrote:
> On Thu, 2020-12-17 at 11:32 +0800, Nicolas Boichat wrote:
> > On Thu, Dec 17, 2020 at 10:19 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > >
> > > On Wed, 2020-12-16 at 20:28 +0800, Nicolas Boichat wrote:
> > > > On Wed, Dec 16, 2020 at 7:53 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > > >
> > > > > The 0.96 xHCI controller on some platforms does not support
> > > > > bulk stream even HCCPARAMS says supporting, due to MaxPSASize
> > > > > is set a non-zero default value by mistake, here use
> > > > > XHCI_BROKEN_STREAMS quirk to fix it.
> > > > >
> > > > > Fixes: 94a631d91ad3 ("usb: xhci-mtk: check hcc_params after adding primary hcd")
> > > > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > > > ---
> > > > >  drivers/usb/host/xhci-mtk.c | 7 ++++++-
> > > > >  drivers/usb/host/xhci-mtk.h | 1 +
> > > > >  2 files changed, 7 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> > > > > index 8f321f39ab96..08dab974d847 100644
> > > > > --- a/drivers/usb/host/xhci-mtk.c
> > > > > +++ b/drivers/usb/host/xhci-mtk.c
> > > > > @@ -395,6 +395,9 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
> > > > >         xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
> > > > >         if (mtk->lpm_support)
> > > > >                 xhci->quirks |= XHCI_LPM_SUPPORT;
> > > > > +
> > > > > +       if (mtk->broken_streams)
> > > > > +               xhci->quirks |= XHCI_BROKEN_STREAMS;
> > > > >  }
> > > > >
> > > > >  /* called during probe() after chip reset completes */
> > > > > @@ -460,6 +463,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
> > > > >                 return ret;
> > > > >
> > > > >         mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
> > > > > +       mtk->broken_streams =
> > > > > +               of_property_read_bool(node, "mediatek,broken_streams_quirk");
> > > >
> > > > Would it be better to add a data field to struct of_device_id
> > > > mtk_xhci_of_match, and enable this quirk on mediatek,mt8173-xhci only?
> > > This is the common issue for all SoCs (before 2016.06) with 0.96 xHCI
> > > when the controller don't support bulk stream. If enable this quirk only
> > > for mt8173, then for other SoCs, the compatible need include
> > > "mediatek,mt8173-xhci" in dts, this may be not flexible for some cases,
> > > e.g. a new SoC has the broken stream as mt8173, but also has another
> > > different quirk, the way you suggested will not handle it.
> > 
> > It can, we do this regularly for many other components. One example:
> > https://elixir.bootlin.com/linux/latest/source/drivers/i2c/busses/i2c-mt65xx.c#L402
> > 
> Got it. Indeed works when add compatible private data.
> 
> Due to many SoCs supports USB and not upstream, I'd prefer to avoid
> adding new compatible in driver when support new SoCs, and leave the
> code as simple as possible.

No. The problem is adding new fixes requires updating the DT. That would 
be fine if you knew all possible issues and quirks up front. You may for 
some, but you won't catch them all.

Save DT properties for per board quirks/features, not per SoC ones.

> 
> > > And I plan to remove "mediatek,mt8173-xhci" in mtk_xhci_of_match after
> > > converting the binding to YMAL.
> > >
> > > >
> > > > (IMHO usb3-lpm-capable detection should also be done in the same way)

I tend to agree, but am more tolerable of standard USB features than 
specific IP block quirks.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
